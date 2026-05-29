Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25B38F250
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076412; cv=none; b=P3BLTPXZ3xzSo0YMedam2Dz/OxgvWS2LCt+GsILLcYOBRsxNPNpyzpXAIeWtjWWfD1QRMVetkwle/9SEUJu05SsKXdy/Lrj+hgtjzxuf3bgnEc2ytBJsCdG/CTnX0fXLRvCifzU53jt7yvP7Y5MJxRTFoHh233q58/+apYgR3zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076412; c=relaxed/simple;
	bh=alAGwcJ93SnzJoX0kjp63rQqGpDJFeHiWW8c2wOmfbA=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=VTegs+q0GeqmfVF2VF3hrlEBvLO91LVvlAeyymJOFMeysrKZFgm/TE6JlCWZYureJqf77UO85etf0VZRvEyc1u10ZHwiflgFzCiH2SWLkHucFBHp8KIgXYoGF1uBGmrBZOkvS5g0BYVoPW353OcoRDBx9vLWmKExL1FVG3c3UNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XiNbwWbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XiNbwWbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780076410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Md1fiZJsQaCCXzqr9uMkYXu9HqcRzV5ZGwEq117oTpo=;
	b=XiNbwWbG2f3DMH/umqPagkLbGA6LmvvehIsecyOvuBZY7SLaXj/5UNQILe75JaDUgW4FrC
	oJfwOcTk4ZSbsXPHZC/WU6p59OaA3lUOdlhTva8XiNsj1++jDD2/sTXFtGIesocP1vVh2u
	D1i+7DRLhRMEGlV0YQRp/JVKWHwz0cM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-1lKBcfjfNp6myjd8jqNY0w-1; Fri, 29 May 2026 13:40:08 -0400
X-MC-Unique: 1lKBcfjfNp6myjd8jqNY0w-1
X-Mimecast-MFC-AGG-ID: 1lKBcfjfNp6myjd8jqNY0w_1780076407
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49041d39887so58391635e9.2
        for <regressions@lists.linux.dev>; Fri, 29 May 2026 10:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780076407; x=1780681207;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mROXqwjM1FYjjL5btqEYHboTKDCZibxVmrYJ4MK4Oso=;
        b=hw+ec6cMA3qfFQQ7PAhoNKQorgldCl2DTlraROSRFMsXwomKmauOthZItOdx1/Srmz
         r3lAPmetlcyPzpKl+ZxHK2IT5mAzSoFTwAkHNpmejf61HhbSVj8vUxThYtzwQzMckEMe
         MavviQxoclBeujADv+sj10t8glHpPHnp8FqpwjJAA267QWPfGQAK4ry6PnKZO8wrJqbw
         Hb8UQXPLnDAPlf/HfsIhHC1hwQWWJ8xaicjHBq7NJOTUeQyxrz8a/wIdf3uC8RCKSQ73
         FiA3dX0qMtg44YCM7uYUfB49OpEU7zLKTM0GMQSw+wlYc66jM6etUFqWPoC+jrSjo3Ps
         OnaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wUiGRWin60Kx+BrBP85OyRrgcaBKQb+25neiyq5QC1hIBbAvhi5ZLY18HURnWyA0Uakg7doHHrSvvOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx9rLGPjucFhs/p9qqlKkcXpLacey3/SuKwQh/euurZNuw4AeC
	X1/pWoqtrv9gNlPX9GOQvE+MH3wN2roF/RrXAXAiJm0smI/cVFJqT2GxEfpX4SkAqa8zTjXX1Ca
	+msCpLVhPKHRaEQP0GWHx/7wy9Q5LwmMzxM+m1WjNoDfuD3u13HzNN3lwwVYdEbJ2
X-Gm-Gg: Acq92OHI5vFb1CPKmgZK+LsfhTzxDzf0MFPi2I9v9Qf7ei8J6wUqPt8nBmQNsuH2bgJ
	QGeNv+eFQtclgsbNTPVpqBUiOHl5faU9qLdmX/yczJ8Qyt8VP7IqTRfCrFPALds4WBeUi1x4hEp
	bGaqrjJ3FYg7uL3xR8trUA9YGCGlE0gw9mlN+TG4kPSwO2Qhtmyjq4wcqOX5OpcAEBskXH6wSZF
	PV97iYILcOHw46woK3VAKhhvzhR4PIZCH3oOdcgI9rNvYOqyAd5cu8rynMRK+jESGkg/vZ88LI/
	U9nHaMDe+1RvLaQ0geKNACf7ct9uik5maqNgVF/4MnDSiCCqRfKoEQd5y7NJqcuMUDrdysnG4Vv
	1dJHMCG4x0GA9EyzWjhmA7VQiwNcQSqNQtEX507QW1qnT09qoCwSGU1g0QV/H
X-Received: by 2002:a05:600d:8654:10b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490a29121b8mr8995615e9.1.1780076407252;
        Fri, 29 May 2026 10:40:07 -0700 (PDT)
X-Received: by 2002:a05:600d:8654:10b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-490a29121b8mr8995135e9.1.1780076406689;
        Fri, 29 May 2026 10:40:06 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b896csm49925345e9.1.2026.05.29.10.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:40:06 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Beniamino Galvani <bgalvani@redhat.com>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, =?UTF-8?B?w43DsWlnbw==?=
 Huguet <ihuguet@redhat.com>, Thorsten Leemhuis <regressions@leemhuis.info>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Yumei Huang
 <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, Justin Iurman
 <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260529194003.776fd26d@elisabeth>
In-Reply-To: <ahlQ_YFS0s_8B03q@tp>
References: <bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info>
	<20260528153202.14900687@elisabeth>
	<CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com>
	<20260528165320.15b90ded@elisabeth>
	<CACT4oue2EMM9Kfsm9Jii2rG9ooi=D37PK=8886cpLuBkwhrOxw@mail.gmail.com>
	<ahhm1-XfnsWyIWDV@tp>
	<20260528192143.31c9e9ea@elisabeth>
	<ed954836-742a-44c3-8c2d-65dd06c3514e@suse.de>
	<e91507d6-cbfc-447c-8236-d9b3d91f18c5@suse.de>
	<20260528212213.4aa613f8@elisabeth>
	<ahlQ_YFS0s_8B03q@tp>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 29 May 2026 19:40:04 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LvQo288wFbT22y8d-I7HNNGwt2Cw3aEC8AdENW-TDX0_1780076407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 29 May 2026 10:40:29 +0200
Beniamino Galvani <bgalvani@redhat.com> wrote:

> On Thu, May 28, 2026 at 09:22:14PM +0200, Stefano Brivio wrote:
> > > >>> about the source address selection is impacted. Indeed, the commi=
t
> > > >>> had effects on one of the selftests, which had to be modified to
> > > >>> change the order of iproute2 invocations.
> > > >>>   =20
> > > >>>>>> If the fix must be in NetworkManager, we only need to parse
> > > >>>>>> them in non-reverse order like IPv4, I guess.   =20
> > > >>>>>
> > > >>>>> But that would then require some form of detection, and, at
> > > >>>>> least according to Fernando, isn't the most robust option
> > > >>>>> anyway, as ideally NetworkManager shouldn't rely on the order
> > > >>>>> at all.   =20
> > > >>>>
> > > >>>> True   =20
> > > >>>
> > > >>> Correct, if the new behavior is considered better, there should b=
e
> > > >>> a way to detect which order must be used. Otherwise userspace
> > > >>> tools won't be able to maintain the same behavior with different
> > > >>> kernels.   =20
> > > >>
> > > >> My remark here is about whether NetworkManager needs to detect thi=
s
> > > >> at all. If it used timestamps to detect recent / older addresses, =
as=20
> > > >> Fernando mentioned, then you wouldn't need any detection at all,
> > > >> right? Or is there something else we're missing? =20
>=20
> The problem arises from how NetworkManager handles updates (e.g. after
> receiving a Router Advertisement). At each update NM determines the
> list of addresses to configure and checks if the addresses are already
> in the right order in the kernel. If they aren't, NM removes and
> re-adds them in reverse to achieve the desired order. Since kernel
> 7.0+, the order changed and the addresses always appear in the reverse
> order.

Oh, I see now, thanks for explaining. That's a bit more than just
relying on a given order. On the other hand, it sounds like you have a
possible detection mechanism already implemented. :)

> This creates 2 negative effects. First, it breaks source preference:
> if users configured a profile with addr1=3DA, addr2=3DB because they
> wanted A to be preferred, now B is preferred. This is not
> NetworkManager-specific, it affects also simple scripts that add two
> addresses (like the selftest that had to be changed in the commit).

At the same time, it fixes the kernel behaviour for anything that might
expect the same outcome as IPv4, or relying on iproute2's save /
restore functionality, as I'm showing here:

  https://lore.kernel.org/all/20260529114216.2e42c4dd@elisabeth/

...one might argue that it's more likely to break things than fixing
them at this point. I'm not sure.

> But most importantly, at each commit NM detects that the order is
> wrong and constantly removes and re-adds the addresses. This
> continuous cycle is what causes the bug that Chris reported.
>=20
> BTW, NM doesn't touch the temporary addresses directly; they are
> automatically removed when the corresponding SLAAC address is
> removed. Since the problem is not only about temporary addresses we
> can't rely on timestamps.

So if the kernel change is not reverted you would need to have a
detection mechanism and change NetworkManager's behaviour according to
the detected kernel behaviour, correct? I guess it's nasty / ugly? But
doable?

> > > > Ohno. Now that Beniamino and I=C3=B1igo mentioned it, this will lik=
ely break
> > > > many other environments. In essence, many tools relies on the previ=
ous=20
> > > > ordering to identify which address is the primary one.
> > > >=20
> > > > E.g cloud tooling communicating with the metadata server via IMDS(v=
2) to=20
> > > > configure IPv6 primary and secondary addresses. They are likely rel=
ying=20
> > > > on the ordering for that. =20
> >=20
> > I haven't seen any tool specifically relying on insertion order for
> > this so far and I'm having a hard time believing this kind of tooling
> > wouldn't rely explicitly on home / care-of addresses or different
> > labels -- see RFC 5014 and RFC 6724 Section 5. (or, perhaps clearer,
> > the examples in section 10.1, in particular rule 4. and rule 6. =20
>=20
> I'm not familiar with home addresses, reading the RFC it seems that
> setting the flag might have effect not only on source address
> selection but also on other aspects?

In theory yes, that should affect the destination address as well in
the sense that getaddrinfo() should prefer the same type (home or
care-of) of address as the candidate source address, but I'm not aware
of any C library for Linux supporting ai_eflags / AI_EXTFLAGS that
would be needed for this (RFC 5014 section 11. discusses the
requirement).

As far as I know those flags are commonly used just to prefer a given
source address. I'm not sure if it's used by IMDSv2 tooling, I couldn't
find any evidence so far.

> > But I'll look for more convincing examples in a bit (maybe you have som=
e
> > at hand?) =20
>=20
> I remember we had users reporting issues about the ordering of IPv6
> addresses, I'll try to find links to them.

I'm currently asking around about IMDSv2 cases. I think it would be
really interesting to see what users might have reported around
NetworkManager over the years, in one sense or another.

As to an hypothetical NLM_F_INSERT_LAST flag, I think that would be
fine for pasta(1) and containers, because the same "buggy" behaviour
that one might have on a host / parent namespace would be replicated to
other namespaces, and we're mostly interested in consistency.

The effect of keeping the "wrong" behaviour as default looks rather
problematic to me (see the iproute2 example) but we could also "fix"
iproute2 by setting the flag and maybe propose that as default after a
number of years.

--=20
Stefano

