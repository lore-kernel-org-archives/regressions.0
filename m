Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106200;
	b=GdM1KvVDlATzCdj+PDX2ojABX7wARef3uzu/v1jiMf6/DFtKQfXIvxZjZ3IfCC3RVKgz
	 yKbNG9uhVuky3uZlp59ZPgiGQeOTqAi7b9Al/IvYuIvIHw2mzi6u0+IJu0NOD3MSXJLUf
	 ZiSEp/ymGEFB3/3YI56YjTwcRrV1+Guzi4XFQND9r3sN38RMtaY8BZytxznB4Fv8Z5jDV
	 6JNZOibxlqHUA/WxT6boiGTIXFr1kvR56MoBiA3KztdHspLO39vUSwzVogi2G5oXK5ufD
	 adXWlfh3XfGHZ9lL4ZSTOsfHdhY5Gu8CuoA8POlmxe8e69v3na2fWbQoo+rZkPXZShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106200;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmp1+598YRgh8xV6vRtgePkT+IRpuCg0m/DIj26GqFI=;
	b=5gV5hDyKZ90uWghxul+7pz3hpkDhjeGIJod5g1cniC7OR9ECqOh95IDOXw4faFSW4ttG
	 pXwLQNS2GoEh8h/3GpgQpb/zNInQGczUoAAlDcNnAfazFKVM84PaaHSg4fBvCG8h8n6yC
	 /0Wok2eGAuEIE7Nju7dZqR6cqyLwrar42nUGXX7TfhMM6i4YU5NmqR8b5TYm/hKoIC50S
	 AFhAAo3Sy53COJ6Jxg+Y6RETs5M+03o/hbStn4MFOg0Wea63ML0+89f+RJuNSb6ygSfA7
	 YMgDpX2Y1uMlBrP/fLZX/Xm5p7xBY4Evi4iQGHSOgNm+8Mf+UbjyYDDEqTHFW1y6Ceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zb0+D6Hm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1804606A31B
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zb0+D6Hm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7EC1F031E0
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106194;
	bh=gmp1+598YRgh8xV6vRtgePkT+IRpuCg0m/DIj26GqFI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zb0+D6HmPiKSpTqonVpxXsiXeOTH+oqCk7Iio8ruOww1rFr+CxM/ODGBvWpPShKKD
	 pwjhdNOVMw2TkdrfC52ZMGS4M5aUkXRAn6pqS0bUi8kZi1KBBQRHI9SpBahgNb4vVb
	 BVaoij/PjwaH265ov6Fg9UIteyUiAhqj3Wl5HieRgALSFvnInFjy2iXjg74p76ioCq
	 mcVn/yDAQ5hGXbmWasSqWpRo8SGZKkF4cj7oGNovdscP5UFxl/I5iYUIKZQrG0l/Pi
	 +qcccqgFa/b1Fj9IdD1r1HD+Rp0ViROdkJqHhWSFd/Wsu4MRdcNphCVJ4aGhO1Kf+h
	 cbcIJISxCLX3A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so9781031fa.0
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 06:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwlA4pgBmTjHPZbaCA7g6dPmaA99ZblAz2vBGIaYJb5j3vWbpqn/qEDOi6J6u6xK9miQ58oTnUggOF6/A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJNYdJ9+fgU6nmPSf4uvg+qW/s7DsIqKneN+ju7KFuqxStK4YLD
	EyIP55fYAJa5ldtDPC9z+N5WJLyUTBRdXyN/lf+5GVXSf0ps6x/dtpb1XSucHjnY3zCebCuXNtl
	pcqElRnB1r8rv6RA0DL5nEymcTPCr82I=
X-Received: by 2002:a2e:be90:0:b0:3ab:1dcd:934c with SMTP id
 38308e7fff4ca-3ac9085cd16mr5034811fa.1.1793106193067; Tue, 27 Oct 2026
 06:03:13 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-advmss-revert-v1-0-272fa4b7ecb6@gmail.com>
 <20261026-advmss-revert-v1-2-272fa4b7ecb6@gmail.com> <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
In-Reply-To: <e25fd292-5391-41fc-a324-0ec260828415@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 27 Oct 2026 14:02:58 +0100
X-Gmail-Original-Message-ID: <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
X-Gm-Features: AclHuK9rU7oOToqigMxIaaqt9b1_ic_1sOzFF6P0HJqOg7YsuT6ZI5h9HNYfk2s
Message-ID: <CAL4Wiip=TkP2hmOFR-1Y-CU4rYHY_q=TBDhK6RmTj9UEMQ95Gw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] Revert "net: advertise TCP MSS from the
 configured MTU, not the learned PMTU"
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: echoowall@gmail.com, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 oct. 2026 =C3=A0 13:45, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
>
> On 10/26/26 3:23 PM, Esko Mobius via B4 Relay wrote:
> > From: Esko Mobius <echoowall@gmail.com>
> >
> > This reverts commit 2640e6419594 ("net: advertise TCP MSS from the
> > configured MTU, not the learned PMTU").
> >
> > That commit stopped the learned PMTU from lowering the MSS we advertise
> > in SYN and SYN-ACK. For symmetric paths it argued that "the peer runs
> > its own PMTU discovery and usually already knows the real path MTU".
> > That only holds if ICMP "fragmentation needed" can reach the peer. When
> > the peer sits behind a firewall that drops inbound ICMP, its PMTU
> > discovery is a black hole (RFC 2923, section 2.1), and the smaller MSS
> > we advertised was the only thing keeping its full-size segments off the
> > narrow hop.
>
>
> A client that cannot receive ICMP is broken beyond this: QUIC's DPLPMTUD
> hits the same black hole, and nothing the server advertises can help it.
>
>
> >
> > Inbound ICMP filtering is very common in enterprise and carrier
> > networks, and it is pervasive in mainland China. We hit this in
> > production after the commit was backported to 6.12.111: TCP connections
> > that reach a server through a relay with a smaller-MTU hop complete the
> > handshake, then stall as soon as the client sends full-size segments.
>
>
>
> The learned PMTU is keyed per destination address. If your relay
> masquerades the clients, the server sees a single address, and one
> client's download seeds the entry for everyone behind it. That is why
> this looked reliable. Once the clients are spread over their own
> addresses, each one needs its own fresh entry and it falls apart. The
> old behaviour was never a mechanism for this.

Hi Jiayuan

You are right on the technical side, and your patch was correct
from an RFC point of view. The old behavior was a side effect,
not a designed mechanism, and the reporter setup only works
because the masquerading relay keeps the exception fresh.

But it did work for them, for years, and it stopped working after
a stable update. That is the part we have to fix first, even if the
setup relies on an accident. MSS clamping on the relay is the proper
long term answer for them.

This is partly my fault: I reviewed the patch and did not object to
the Fixes: 1da177e4c3f4 + Cc: stable tags. A behavior change like this
one should have stayed in net-next.

> Maybe a better way out than a plain revert:
>
> Revert in stable, and in net-next add a sysctl, something like
> net.ipv4.tcp_advmss_use_pmtu,
> that decides whether an endpoint uses the PMTU it learned on its send
> side for the MSS it advertises (even though these are two opposite
> directions). Default on keeps your setup working, DSR-style setups turn
> it off

I think we mus take the revert in net as well, so that
mainline and stable trees behave the same, and the stable
backports do not diverge.

Then a net-next patch is welcome, keeping the historical behavior
as the default. Before adding a new sysctl, please check if the
existing per-route advmss metric is enough for the DSR case,
as Esko showed in the changelog. If it is not (for instance because
it is too hard to deploy on many routes), a sysctl sounds fine to me.

Thanks!
