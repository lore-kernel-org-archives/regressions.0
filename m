Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B807A39E9C8
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877108; cv=pass; b=nKSTm3nJTPk80l49MgEEXa22/w+8xpTV2jxCMKAv/KgD0am6fbowuJ3UHSZuQOl+fE717b6L8YrujyHfKTWcXfF7ws0Vn0XsY7sG55nMxfiVdF7zvEzDGfLShK+LXmaV5Fvvk8TSu6noGNb/VMZ6ZLwr2iFLyA7rd7o1tgWktno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877108; c=relaxed/simple;
	bh=V1k4nSFZr1xJt1H3lra+Bd000BYLXmmIfiz8lIC2mAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLynWsHNG89Yl4hYis1yF4jqXOOPujH22+ZcP7wiVpy1rRYvZ+q1Ee5kjfWLUB5YarLNK5Sx6wcFkzkyCdYSpabO+mcsL+601BdHGp6PJ0ShmEyoNnfNQaFpzyS4KeaCdPMMTL/rThsZpQlL1NnS1KSNEl8XTB7Z6+DSbwDDldY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=Eazt1Ba6; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="Eazt1Ba6"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1965208e87.2
        for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 00:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791877105; cv=none;
        d=google.com; s=arc-20260327;
        b=idYNilBNXDeFI8R9OUvgChVsfLLR4jIUhL1UUO1IvDwNMxwDUc8504LGY+gl0AuAWs
         xbpaK2AUOL+VZlLmLHf3y37ui575CxXIsSk0Xl28xpKyz5vcmwOimg2x3mkocaYfLDh+
         SQS2hgv4jf6Sasbr46lk5KDtRT7+NrveyruDrJ1jQK9JKaLw53jy4RhH5oLJJMGwwkmC
         j2dVM8qsNoBOav6Rj4HQ9Yb+p67jDQOsx05sHe+w5owu/EOmQNOwzJmMeENFnV0Y9l2o
         SBPu0wHP7OiCtyXZJ8ruwI4zGDWFuPHSPSWHSxfxY26ZzvCk4MfjQAmPuguCH1JvMA13
         eV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RH7XohG3plPCEisncn3kNOyfQk5zAj4jOpXVESRoZmU=;
        fh=au+Romj7Nv6/5owvbqU8MQbLh0RkVdb7o9e5zbzp9FU=;
        b=QG+iy3sVWIz9PghrHCwCcjj0Y0hWcaedRmDshWVWE7GlTtqzmeHaAolRpfec28a6a6
         bcazjYM6iAJn7flgZF8VydmT2OGFOFGVRnn5D6lxzx0olJ/lsOm7aVa9ub75wrgKS7QL
         pS4rRDfkI2mmz9KVDyLD1VacIs+CDnEaNlIoiIhXYWgAxvIWXmkKfSB3tD58TPtbaaj1
         w6HMjJwf3lTkCM14146Ijinn8ml9+IHkL9c6CusOCd6ixmZuccqUGLqE9ToNZ37lf0EU
         9zOxkGbnZIKLa7SN+74/eKTMRlA4aMoYSnA4V9pgQIz+tQxwX8tIRRpazmN9/7+EhKaO
         JziA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1791877105; x=1792481905; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RH7XohG3plPCEisncn3kNOyfQk5zAj4jOpXVESRoZmU=;
        b=Eazt1Ba6ZcpZJNhEsKWfZlOdMGYKga3M6Pg1XGyqtg9QeqRpI1/z6BoCRVVQXnM468
         CL8eKtG2OAUGYuAN64Ro5UWJxiYy3dR07WCVWkTyTdxK3fsOb/tnPtjLmlzqRT3FoteP
         v1MQMznwfWXS90Kr+6rJJNcOihdRsovmH6A3/TwAzlS1NqaCaHcwoygFseqS+gTIJ7JS
         RKOr2cyeI35LUKfeD6mOLy7MnJWFbhupUM+1YzDoUxu4s0vhiozdnLerKgYZpH3F+yn/
         ZSqDOy4U6J6N/HftyAYWckC58AchSjshL/8YJTJTE/Y+3C9ZOaDAEwQWqDPuRWWg/fl1
         O8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877105; x=1792481905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RH7XohG3plPCEisncn3kNOyfQk5zAj4jOpXVESRoZmU=;
        b=xbhsZ+SYj8E5QrsgAmgauTFt8WeGS/EFotv0b/VDkN126UO+OkX7c0i1o9SXEr6FD/
         Eyf1OD8u6w5yLuD7GyDGfnjYVgte1i5IEu69oHlUJl2yhJepf3Fbyx0jwJV/0zUgtaRX
         1Y06IvY1Slv2IslAbg9yqxEsTMx8YJfSChiOI7MRD1gBytYq1TqsKbXFigP0vbREI0Ky
         qRwDuNt4Zd1ol761FCKwyKDf258TmwIdxwFmJdKymMbSlyov27ua9uQjnRX7OSgY19bl
         kvprLGbl1DgaUn+ImsNHW/64N8uR+H7c1jOYfSHIvvWTqAH5quke+4pPMPvz7BcGgmiD
         DkIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpDVvPlW2n6hsvOJpnxEz1aKWM1tGej0UAjrmsNIA4WQQ5XtPUsffLavjFBz1SvSpgGu9hyxSA0TCBJg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKiA5IbfhQJ0LM/KElnM0/JU6hkMh9CzPgA8EMhNVTDgp5Mlqvk
	5a7hopacDqQDxOLy4KoqVv6g2LV+yAvKSybHOHLptmf8u3hsguu6qOZK0bYbvqXcck34Ctq2Opd
	+UvEZt5sKMPFWc0B6e+QFXgwlel31czpwu82RrfOXVsO9fCBchB4rjLXMlQ==
X-Gm-Gg: AYBFou2coMn/VBMFl2r8xbf7v337QQB0EVsPLWiwr5arG9PzA7wlEDCpCwKyBKel2Fi
	AP67iqfwwRD5vk5PrK66pEbanLdn1t7HNKcBkub+s2Tnuoh/grZYiFIv5PS/iNdZ4C7vdsPGUaa
	wvxN/h1kX7mZW0m6oF8YlftEiiGTKdBCZXq5a2raae1NLBUSiVB9AvOH18RzQ67oQ4ke//rPMR6
	2xCQkMTi94VAVNiIshLk8BdJE5XiZlr+r7TAagbMEzcCN/4fQm4LD2nuuESd7eK3wU7eR7afI2E
	pz7uWpie313n/N2u2N2aleVzi4VHGaBwUP+CKk0tXLyy5LTUxCEhThDp2onfxllhbkFPbTrHxPi
	zNqzhvFJASZ4=
X-Received: by 2002:a05:6512:2352:b0:5ba:429b:c5bf with SMTP id
 2adb3069b0e04-5bcde8c83f1mr3998408e87.51.1791877104819; Tue, 13 Oct 2026
 00:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <a6b71984-cd0b-4e81-a240-ec05abc6327a@leemhuis.info> <179186742507.11414.3709235533520575164@freya>
 <CAFERDQ1ygWAUbGCpzC6wFzfgAjMFmB-LpYmQp380N6D=2GLfFA@mail.gmail.com>
In-Reply-To: <CAFERDQ1ygWAUbGCpzC6wFzfgAjMFmB-LpYmQp380N6D=2GLfFA@mail.gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 13 Oct 2026 09:38:13 +0200
X-Gm-Features: AclHuK_pFLQgFcLikEPMCqMuaHVirlYeSTDqIJTGGA38_SlV0soLaYiyZtfgzdk
Message-ID: <CAFERDQ0PkaVP+jNWityZMUKNpQOKbU+W+f7u9ZSONhBdkwGB=g@mail.gmail.com>
Subject: Re: [REGRESSION] bcm2835-audio fails to register on vchiq-bus in
 monolithic kernels since 6.19 (VCHIQ destaging?)
To: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: florian.fainelli@broadcom.com, gregkh@linuxfoundation.org, 
	uajain@igalia.com, Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I also tested current mainline (7.3-rc7), and I confirm the issue is
still there.
Martin

On Tue, Oct 13, 2026 at 9:28=E2=80=AFAM Martin Wetterwald <martin@wetterwal=
d.eu> wrote:
>
> Hi Jai, Thorsten,
>
> > Hmm, no answer, so it seems nobody really cares. A bisection might help=
.
> > Or at least validating your suspicion, hence: why can't you check the
> > parent of aa125180c6738 and aa125180c6738 itself? Or at least the range
> > with that commit in it? And is latest 7.3-rc still broken?
> >
> > Ciao, Thorsten
>
> Thanks Thorsten for the follow up!
> I didn't bisect because my image builder tool was not meant for kernel
> development: it could only download stable release tarballs signed by Gre=
g.
>
> But now I've found a way around it and I've just bisected the issue! I've
> bisected through the 6523 revisions between 6.18 and 6.19-rc1.
>
> (The bisection was made on a Raspberry Pi 1B rev2 this time.)
>
> > aa125180c673881f88b528600b57865dc158b3a7 is the first 'bad' commit
> I confirm the issue was introduced by following commit:
>
> > commit aa125180c673881f88b528600b57865dc158b3a7
> > Author: Jai Luthra <jai.luthra@ideasonboard.com>
> > Date:   Wed Oct 29 16:00:10 2025 +0530
> >
> >     platform/raspberrypi: Destage VCHIQ interface
> >
> >     Destage the VCHIQ interface driver to drivers/platform/raspberrypi.
> >
> >     There is still the remaining TODO item of improving the documentati=
on,
> >     which can be handled post destaging.
> >
> >     Secondly, multimedia drivers like codec and ISP that rely on this
> >     interface need to be upstreamed. And lastly, the drivers that facil=
itate
> >     the shared memory between VideoCore and Linux, like the vc-sm-cma d=
river
> >     and vc_mem char driver also need to be upstreamed.
> >
> >     Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >     Link: https://patch.msgid.link/20251029-vchiq-destage-v3-6-da8d6c83=
c2c5@ideasonboard.com
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> #regzbot introduced: aa125180c673881f88b528600b57865dc158b3a7
>
> > Sorry, this got lost in my inbox last month. It's likely my series that
> > destaged VCHIQ broke the ordering as Martin suspects. I always tested w=
ith
> > modules enabled so didn't encounter this issue.
> >
> > I'll look into how we can ensure the VCHIQ bus gets registered before
> > peripheral drivers (like audio here) when CONFIG_MODULES=3Dn. If someon=
e
> > already knows what to do, pointers are appreciated :-)
>
> Thanks Jai!
> I'm willing to make the patch, but I'm not familiar with initialization o=
rder
> in the kernel boot sequence.
> Would also love if someone has pointers on good ways to influence order o=
f boot
> sequence.
>
> Martin
