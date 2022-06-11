Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312867C
	for <regressions@lists.linux.dev>; Sat, 11 Jun 2022 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F21C34116;
	Sat, 11 Jun 2022 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654965891;
	bh=ghuGRd/Z1xd0bQJRFUBDaFRmlY9Al7Fa1PVRTFvEztg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ah79EYQQ1Lbel4/ydfUhCZ/zH3iHLyB0lO3GeVQrrnCIpp9P3C2QYzPFcsm1ln4jE
	 NEePSWFqfrEOcShIgX7UDuXNZRVDGC1ZqxwVj9/WgdGDAjJNLErFT+TSv773A+rxwT
	 I79HiiyXW734tJKW6sNCJOwVXVlNX0gVtndY8EXNWoumak3oJBoYbwwgOuauWklXi+
	 kaCiwJGTmS9Q+kaDwp6RT1nlbgztPuWVewUTJjlEsky3lKt9ivHcwK/yY4nR6UbbLN
	 EgC2oSflm8T1enM8WPtQXqBsK7QlEsmbIB0hzoaBkcoQoFljx3cSLJUJf28GYOlZOt
	 vTAyJBg9dykBw==
Message-ID: <6410890e-333d-5f0e-52f2-1041667c80f8@kernel.org>
Date: Sat, 11 Jun 2022 10:44:50 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [REGRESSION] connection timeout with routes to VRF
Content-Language: en-US
To: Jan Luebbe <jluebbe@lasnet.de>, Robert Shearman
 <robertshearman@gmail.com>, Andy Roulin <aroulin@nvidia.com>
Cc: Mike Manning <mvrmanning@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, netdev@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <a54c149aed38fded2d3b5fdb1a6c89e36a083b74.camel@lasnet.de>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <a54c149aed38fded2d3b5fdb1a6c89e36a083b74.camel@lasnet.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/11/22 5:14 AM, Jan Luebbe wrote:
> Hi,
> 
> TL;DR: We think we have found a regression in the handling of VRF route leaking
> caused by "net: allow binding socket in a VRF when there's an unbound socket"
> (3c82a21f4320).

This is the 3rd report in the past few months about this commit.

...

> 
> Our minimized test case looks like this:
>  ip rule add pref 32765 from all lookup local
>  ip rule del pref 0 from all lookup local
>  ip link add red type vrf table 1000
>  ip link set red up
>  ip route add vrf red unreachable default metric 8192
>  ip addr add dev red 172.16.0.1/24
>  ip route add 172.16.0.0/24 dev red
>  ip vrf exec red socat -dd TCP-LISTEN:1234,reuseaddr,fork SYSTEM:"echo connected" &
>  sleep 1
>  nc 172.16.0.1 1234 < /dev/null
> 

...
Thanks for the detailed analysis and reproducer.

> 
> The partial revert
> diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
> index 98e1ec1a14f0..41e7f20d7e51 100644
> --- a/include/net/inet_hashtables.h
> +++ b/include/net/inet_hashtables.h
> @@ -310,8 +310,9 @@ static inline struct sock *inet_lookup_listener(struct net *net,
>  #define INET_MATCH(__sk, __net, __cookie, __saddr, __daddr, __ports, __dif, __sdif) \
>         (((__sk)->sk_portpair == (__ports))                     &&      \
>          ((__sk)->sk_addrpair == (__cookie))                    &&      \
> -        (((__sk)->sk_bound_dev_if == (__dif))                  ||      \
> -         ((__sk)->sk_bound_dev_if == (__sdif)))                &&      \
> +        (!(__sk)->sk_bound_dev_if      ||                              \
> +          ((__sk)->sk_bound_dev_if == (__dif))                 ||      \
> +          ((__sk)->sk_bound_dev_if == (__sdif)))               &&      \
>          net_eq(sock_net(__sk), (__net)))
>  #else /* 32-bit arch */
>  #define INET_ADDR_COOKIE(__name, __saddr, __daddr) \
> @@ -321,8 +322,9 @@ static inline struct sock *inet_lookup_listener(struct net *net,
>         (((__sk)->sk_portpair == (__ports))             &&              \
>          ((__sk)->sk_daddr      == (__saddr))           &&              \
>          ((__sk)->sk_rcv_saddr  == (__daddr))           &&              \
> -        (((__sk)->sk_bound_dev_if == (__dif))          ||              \
> -         ((__sk)->sk_bound_dev_if == (__sdif)))        &&              \
> +        (!(__sk)->sk_bound_dev_if      ||                              \
> +          ((__sk)->sk_bound_dev_if == (__dif))         ||              \
> +          ((__sk)->sk_bound_dev_if == (__sdif)))       &&              \
>          net_eq(sock_net(__sk), (__net)))
>  #endif /* 64-bit arch */
> 
> restores the original behavior when applied on v5.18. This doesn't apply
> directly on master, as the macro was replaced by an inline function in "inet:
> add READ_ONCE(sk->sk_bound_dev_if) in INET_MATCH()" (4915d50e300e).
> 
> I have to admit I don't quite understand 3c82a21f4320, so I'm not sure how to
> proceed. What would be broken by the partial revert above? Are there better ways
> to configure routing into the VRF than simply "ip route add 172.16.0.0/24 dev
> red" that still work?
> 
> Thanks,
> Jan
> 
> #regzbot introduced: 3c82a21f4320
> 
> 
> 

Andy Roulin suggested the same fix to the same problem a few weeks back.
Let's do it along with a test case in fcnl-test.sh which covers all of
these vrf permutations.
