Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F672EF652
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054873; cv=none; b=dMiSyDqBbkenYKp6w64487oUMq7hfGxr+/mRq/Oxu9L2mWZc4gMwY3SvmwxYNYIhxUK09sps7oSXU63YvBKVUuvchhp9cD8nl2AP6AFHWVbj2/9epxyWzs0dyq1L2BM5z4D2D3npU3zj5Kswghroj0Osqgc9YTCaDdLaeVh04VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054873; c=relaxed/simple;
	bh=0S/byLTk02zpKF3rh6kvrbDDiJhPNnCcxX8SoapbmBg=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=JXwKpHXqzYCHJTz+C+ZudzmmwhiO9pVz7G/UAu61rwtoNj0AEJ4N/pmYeFqRNvpBLxYi1m1s7PligasNOU1nA5g0SsUUO2dTjjpplxh7+nP547Rms012r5UGncpQFAlo5KMqY+CUgaFqFNG8CBNgOje38KEZGeTco1Mf7iQrS2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLc2HvWG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLc2HvWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780054869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ur887I+sgsq981FXLj8FJ8qQbEDUWR4G4r5NLvUeADU=;
	b=XLc2HvWGdU58jwPv14nVzfB6jN14skj9qT1xRy+KdQ2QZL1G4Bs+7OzWfVRHrgchfVhoAx
	DkH21xPMFcuRV++LKkzYQ1lBaZRJcuyBoXWVdxuygCKHl0bd7rWxRiB7AbZMtgK69DIGk4
	uwPaDh6vyIacZaxkpC/8JEK1/r4GTrA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-8cAWDv1dPJO7MTYp8MV-dw-1; Fri, 29 May 2026 07:41:06 -0400
X-MC-Unique: 8cAWDv1dPJO7MTYp8MV-dw-1
X-Mimecast-MFC-AGG-ID: 8cAWDv1dPJO7MTYp8MV-dw_1780054865
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-44a3aee3813so6193990f8f.3
        for <regressions@lists.linux.dev>; Fri, 29 May 2026 04:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054865; x=1780659665;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ur887I+sgsq981FXLj8FJ8qQbEDUWR4G4r5NLvUeADU=;
        b=IkfPyvCSpoZOOh50aKP0HB+o+jMI2oQDEAyEOxsH3p+Fst7a1m+DkEweehmZ0YU3eZ
         xnY85Dmsx58u8v1Vx13RrEUnQD0aMJMkr6KHTLNyr9ZGSHxPqQeInAaQqE1Yslsm/AoS
         SOxGEYhk+dCaZzDJtn9ey+rXzmZMJYuRDjWGMvB8HMP6R+ac9/lIfmdcqRiMue2d1KzR
         r/aX4AQqtIyOIR4a1fLwoqcViyHDrQRQ96qVdEobftCgr2c+55dPyMu4KCjtIP7osszo
         MLjuAsQwwWCAqayzFvjL2ZmmX79vHKAXQNe79ifJc8V7TZYBmBQJur6BadVhtbeLIoKM
         rSPg==
X-Forwarded-Encrypted: i=1; AFNElJ/JhvWOSdnqfkGjdklkWGP1vGkJffc0lKaO7ZXcOs/Wr2FQHfxDqX5f5OEsQQ/cPS1NO81dO2GZHnR+jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW1BckYSstL/QzuCKDOd4L69l0h9ZhIhTYS5QKOh5BotTvRF1w
	ATxqmKVLHtUW4ObMT+J9RsoTVZqlqG5lC/UlkMvP75jLFYMhKO9MLKRsnyiu9p3oYJE9/EsVUiJ
	GuX67soVnbL41dv5Fy0VblnY+nFbmqwwUE8MYTizPyQevItisq38RTszfyBymxR0e
X-Gm-Gg: Acq92OGgCgEBTYrevOjE6/U70o3PYjSao3BHNf8KO+/yzq5NvVtGWlOYlsPf1WCq5KJ
	C9tBS2KOLn4ZWs56ulz32Xr+A2VGBNLM0itEOLgPISPo0hbtpzlhBwkvMX4lj6lvhHgrqwzUmkW
	7plBXiNI6MwjtqatJOiOtSXH41Jgj5+qacDFzPRFg+iKxe4v9W8VOaEVCnnnLIdKhR0F8p6q9pI
	Gwb+x5vl6u4iLLTF4OMBgm5nTfKvXzVeM26hc8r9tlKsjMTeZjn05a6DFqQOpNUvmrwAQMrKbkB
	TMOVM+KCGlL4s6gww68rY8PP1nn5mFPTCZUkfSgHSemxjTxIsB0DxaX51Hq2q2WIrF+lDf5olmA
	NsYCdAhI6CVJUFiMI8ucAJ6q8VaKsFSUSMLjxP65Eb6w=
X-Received: by 2002:a05:600c:468a:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-4909c8558c2mr43912065e9.2.1780054864976;
        Fri, 29 May 2026 04:41:04 -0700 (PDT)
X-Received: by 2002:a05:600c:468a:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-4909c8558c2mr43911385e9.2.1780054864473;
        Fri, 29 May 2026 04:41:04 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c12f4d0sm13336155e9.34.2026.05.29.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:41:03 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, yuhuang@redhat.com, justin.iurman@gmail.com,
 horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, idosch@nvidia.com, dsahern@kernel.org, Chris Adams
 <linux@cmadams.net>, David Gibson <david@gibson.dropbear.id.au>, Beniamino
 Galvani <bgalvani@redhat.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Andrew Lunn <andrew@lunn.ch>,
 ihuguet@redhat.com, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] Revert "ipv6: preserve insertion order for
 same-scope addresses"
Message-ID: <20260529134045.56330243@elisabeth>
In-Reply-To: <20260529112357.5079-1-fmancera@suse.de>
References: <20260529112357.5079-1-fmancera@suse.de>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 29 May 2026 13:41:02 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UmA9sQciVbX334d2HBFldlOMWqBeWHhMqlcpZkaWjEQ_1780054865
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 13:23:57 +0200
Fernando Fernandez Mancera <fmancera@suse.de> wrote:

> Chris Adams reported that preserving insertion order for same-scope
> addresses is causing SSH connections to be dropped after stopping a VM
> while running NetworkManager.
> 
> NetworkManager caches the IPv6 address configuration, when a RA arrives,
> it determines the list of addresses to configure and checks if the
> addresses are already in the right order in the kernel. If they aren't,
> NetworkManager removes and re-adds them to achieve the desired order.
> 
> As the order changes, NetworkManager is confused and reconfigures the
> addresses on every update. In addition, this would also affect to cloud
> tooling that relies on IPv6 addresses order to identify primary and
> secondaries addresses.

By the way, I'm still looking into this part, trying to find
"problematic" examples.

And I couldn't find any, yet, because it looks like there's always a
_single_ IPv6 address being used as a secondary for a primary IPv4
address.

> 
> This reverts commit cb3de96eea66f5e4a580086c6a1be46e765f97f4.
> 
> Fixes: cb3de96eea66 ("ipv6: preserve insertion order for same-scope addresses")
> Reported-by: Chris Adams <linux@cmadams.net>
> Closes: https://lore.kernel.org/netdev/20260521135310.GC977@cmadams.net/
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
> ---
> v2: updated commit description to make it more accurate
> ---
>  net/ipv6/addrconf.c                  | 2 +-
>  tools/testing/selftests/net/ioam6.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 5476b6536eb7..bb84a78b80f6 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -1013,7 +1013,7 @@ ipv6_link_dev_addr(struct inet6_dev *idev, struct inet6_ifaddr *ifp)
>  	list_for_each(p, &idev->addr_list) {
>  		struct inet6_ifaddr *ifa
>  			= list_entry(p, struct inet6_ifaddr, if_list);
> -		if (ifp_scope > ipv6_addr_src_scope(&ifa->addr))
> +		if (ifp_scope >= ipv6_addr_src_scope(&ifa->addr))
>  			break;
>  	}
>  
> diff --git a/tools/testing/selftests/net/ioam6.sh b/tools/testing/selftests/net/ioam6.sh
> index b2b99889942f..845c26dd01a9 100755
> --- a/tools/testing/selftests/net/ioam6.sh
> +++ b/tools/testing/selftests/net/ioam6.sh
> @@ -273,8 +273,8 @@ setup()
>    ip -netns $ioam_node_beta link set ioam-veth-betaR name veth1 &>/dev/null
>    ip -netns $ioam_node_gamma link set ioam-veth-gamma name veth0 &>/dev/null
>  
> -  ip -netns $ioam_node_alpha addr add 2001:db8:1::2/64 dev veth0 &>/dev/null
>    ip -netns $ioam_node_alpha addr add 2001:db8:1::50/64 dev veth0 &>/dev/null
> +  ip -netns $ioam_node_alpha addr add 2001:db8:1::2/64 dev veth0 &>/dev/null
>    ip -netns $ioam_node_alpha link set veth0 up &>/dev/null
>    ip -netns $ioam_node_alpha link set lo up &>/dev/null
>    ip -netns $ioam_node_alpha route add 2001:db8:2::/64 \

-- 
Stefano

