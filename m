Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC26C2FF
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 01:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778029479; cv=pass; b=DguojWPSnsFtJRFwL/Cb1AtGvCM1P5Ah0JWdfF/TPBHSjAnmN6+xv9RiAiofgAa2E5mp2HLPWGdL6FOoBNhd5bMNl/8q5UDKZXvACE4gp/PXkmSp/CvcSTaQEpHTnFqvvAn3Ul3OkvEzL+bqG2iWm51UQy4IrhWukktMNzdSU+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778029479; c=relaxed/simple;
	bh=WeSGqUsBPS7NdUbSMuKhfVFAr+0NNERLbgb+lqLr2OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GDA5eAKl0nplYHnjyWLkszcGkaSUCIB+aifVWbO++IM7dGFFaD6H1vPJt05WurCFXVVm/hm7tn25yaNZfHet9zv+w6ncLAlSpF3pb8Hn0iNqk+mRMrp7UmIcNcARYckCiycMOSOljAVAwWO6AZxnMo5UmU87eOPumMonb8CHh1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=RuM8LjYZ; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="RuM8LjYZ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c8c9c4cd8so284622c88.0
        for <regressions@lists.linux.dev>; Tue, 05 May 2026 18:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778029477; cv=none;
        d=google.com; s=arc-20240605;
        b=PAU6ZW0ASuIdkuwVZGhlFqFTOd8mzH08qAgvTVZSdr2QQt8coX0unMUo5CbgYzC4Nj
         GOT7jXv4fEgQzd4qQN5UE/13/VXmnN0zzPyiGrG22egsGEmv8eTW3qDTM2qyexaUYiPG
         Zaz6OMw8LWoUQC5zG4b2B7o3mNJGzDQkiNIffcvKbpeWSWMtXokN4pTMTqu0cQTGpvXF
         Opz5echPmKRUECuK+6njGiKqYFuPIbwlTfHokP10GI1uoDULF/42gH98QZQezH8CTaWR
         SmVYVElBBHL49XQOCYSOyZKwJD7Uq9ZV8fuh5HfpiqQJo+Vfj5DbNAJJrnKpGdiBzB95
         m8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DsE+PeSrf/NzrEl9og37JNUjubQniqz8TNKhe4A4HRE=;
        fh=bVzdqoCk60WaDsnw7jRgeN25S8c3TOO6p36Yl5v1SFE=;
        b=LHdUeStP/nhlqssJDpL0dKqWF2ZcfBhibBwYpGPGaE60j74oaHmoiV4rE2/7havy3e
         gFfmhNgzOgVdq3N/vIPHi5gkDYUHNV0qrDOP15O3i0VMr1MIf7CHUnYLDv/35BfV4IGp
         RX4JTLhDPqKV6RGEwl6l5FSm36AJSEHUUIyhLOMPbNvlm2Xc7ibrYLA4OXaEEbb86S+A
         jjFTXuSD4Oygiu/Y/KVv2qsHmejtNtxRss+UN2oGESZdIkD9BlGvmrfQ5fu7avGu+Ybz
         rhPHCFZywPVzYwiTMjS1XtOQaV1A3royGSJB5IurANaki4EWjW3mQo8Xrka6xo72mU+m
         fhsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1778029477; x=1778634277; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsE+PeSrf/NzrEl9og37JNUjubQniqz8TNKhe4A4HRE=;
        b=RuM8LjYZ+HCtQGrmhEB64h1QpEPkj2ysEtp4oQonTj75PxvcCDzbOK0KfGDqudZzVV
         D/ARrzwSqB33U3ni7g5go8M7/698cczWvgAILsWdKb9ETRqDTJRxI/2mxabRquXOhRMW
         h7oARW4QwMJdwedb93GnPO3082d4vcnQy+/n5+4Z7QETNelfPC77S1fiU9DXCgJgdtrn
         1U6Lm0DeDNeEu91ja5q40KW9FOtew+cvBqjOAZTaK0+TtKwqNFPhgnlfmZmrat6rNDiK
         0yw4/HGVYnD9X/bQghi6JmB56nv0GT1cFSWN3lltgpTOKNpAewtCVyx99OSZHc4rGHDS
         qpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778029477; x=1778634277;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DsE+PeSrf/NzrEl9og37JNUjubQniqz8TNKhe4A4HRE=;
        b=LxvueuMSBpFEBuC9hzrLrJQC8xF+UPGq8xYJY3h3Jre+fpF7d0Z4BLp38V7fGKFVM9
         sNREnupo8utZsxR2f+1FMB6JHQZMBhuL7pex5x8Wjep8/Mf85kYPN7zm0K45QUNAbEn9
         Fj4RmPR6qlGU2hQuARhCpWBEmXTscQbkEb1FJeRVFgEJ8Q1P7L89TYIUZeoLRJbzz/HN
         POZP3ucnGwLkf/GhP9TkkLJi0WLXOK1WGEEZoRCcK/QU/sQoowk4GmYp/rUuyfci0I08
         xoFL9mrKkFTVKOmIP/8lCTBew+e3bJ9Lryu0yTbMspFIE4km5CBHTOk8lJnhaZ6ZcBs0
         Q8rg==
X-Forwarded-Encrypted: i=1; AFNElJ9x9Q/wudnmzWKWx8m2mzsDI2QkV1TlqokXq/tVK7iEMgDp57NqFc5y9nUeufaUMudX5b6HkmnGrhxy+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YydPxne9lcb1zsMIH57kX7IO9odj9CWOrOImgevf573e6pVTbqC
	+EHJWLEJBkpBVZb52WSwqUEvWxjBMBcn9bM8WlBlTyyF6AwhJ2vqdB/WAl44Amk46XDqnyebEE9
	HJrEn+zAFa/ISdmkAk41DGS2HMTpjbMJpyqgo3N8Nqg==
X-Gm-Gg: AeBDiesn+jaMeeWpQpnU3PPeaggcZVAhV8MAkyshm42OhrsW6lkkDz+7OoOyI3Ig+zS
	hGx9Zn3SATeLdzEyM4xhQQ5ilESmbZ4gMKpmi8DqIxAfUOn/c8TjR986RwfLzhUVv14RyyPL3Fs
	V92pwU3OnEcDOXE/e56eLKKt8LPeJNjVI3lrOVKzIWIxIgnP6qhHgSyQy3AehR6x8ms0BF2dW95
	HrHHPCsuXYt8lWHMPjUfbXJsJ3yBag97TalssDXyeVnZX9Ck6SyjXyqCNkoakGaG71JIKQeBQxt
	vCVatiPakJ9Qk04CsHvLn3DVjHk=
X-Received: by 2002:a05:7300:fb8a:b0:2c1:82c2:bc31 with SMTP id
 5a478bee46e88-2f3d079d433mr2147391eec.10.1778029476904; Tue, 05 May 2026
 18:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177771348699.1898023.16904466444228860838@eldamar.lan>
In-Reply-To: <177771348699.1898023.16904466444228860838@eldamar.lan>
From: Jiayuan Chen <jiayuan.chen@shopee.com>
Date: Wed, 6 May 2026 09:04:24 +0800
X-Gm-Features: AVHnY4Ld4uQUyoOaqaQn_pJ5ltYCQOi65ut2p0eYluQk8TlWIlP0ecsVLB1r7No
Message-ID: <CAL3Ev5070_=K9F9+03GrE2+4tgr=j_CO19=m4ZPTd17YSwmokQ@mail.gmail.com>
Subject: Re: [6.1.y regresssion] 9a95ec9144ee ("xfrm: fix ip_rt_bug race in
 icmp_route_lookup reverse path") causes log spam on ping to unreachable host
To: Jiayuan Chen <jiayuan.chen@shopee.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev, stable@vger.kernel.org, 
	1135514@bugs.debian.org, podorski <podorski@gmail.com>, 
	Brad Barnett <debian-bugs5@l8r.net>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think it because we failed to backport  this patch before:
https://lore.kernel.org/stable/20250207161555-b1a8749027831a1a@stable.kerne=
l.org/T/#m0c880c1f04f7211aea9b7f6b4de0b64aa1726417

On Sat, May 2, 2026 at 5:22=E2=80=AFPM Salvatore Bonaccorso <carnil@debian.=
org> wrote:
>
> Control: forwarded -1 https://lore.kernel.org/regressions/177771348699.18=
98023.16904466444228860838@eldamar.lan
>
> Hi
>
> [sending correctly including the needed mailinglists]
>
> This is a 6.1.y specific regression, so I'm not CC'ing netdev, but
> maintainers, hope this is fine. After a backport of 81b84de32bb2
> ("xfrm: fix ip_rt_bug race in icmp_route_lookup reverse path") was
> applied in the 6.1.y stable series as
> 9a95ec9144eeff1fc6fbcc21b677e322c6f1430b, user are reporting that on
> pings to unreachable host the log is spammed with the "detected local
> route for %pI4 during ICMP sending, src %pI4\n" messages.
>
> One report is at: https://bugs.debian.org/1135514
>
> This does not happens with other stable series versions (6.12.y
> tested explicitly, 6.6.y I have not avaiable to test).
>
> Is there a missing requisite in 6.1.y?
>
> #regzbot introduced: 9a95ec9144eeff1fc6fbcc21b677e322c6f1430b
> #regzbot link: https://bugs.debian.org/1135514
>
> Regards,
> Salvatore
