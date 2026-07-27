Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C371D86FF
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785113029; cv=pass; b=cZUmKxbUvNVCv/Pxg2uFvEAfy7usYZu2Ndc1pi3ne7mXJeZKzBepsyRebWqo+durPhJZVICghG4oBQ1ET2sXhnSRwpSnfFDCOgYA9nKSurtix29y/3rVMNVSB0x9QeufNdvT3aVoHhNdKpcbhZPKUAS+nALgAFp6ppjh6uoneDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785113029; c=relaxed/simple;
	bh=fYeRbG+akEzJxsykcbejVjCZASuJBXfbkdfHbwbP4jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hfsEw861zn36icqfuyJqbXqcu/l2kVE6N7wEC4lQBP0BYHbaipHzkfKd4rzMc5OKQRalZJ3CZQK2UvBl9lOVeWELB8Kssna+6PLzjHk4oYeEQyAzsWchvY3utH4hjKlFL5fNeCzKcDDObPdVoU2o9tYVAu+sGuN8dvQ7xvlIwxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=obets.net; spf=none smtp.mailfrom=obets.net; dkim=pass (1024-bit key) header.d=obets.net header.i=@obets.net header.b=ivaa118N; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=obets.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=obets.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=obets.net header.i=@obets.net header.b="ivaa118N"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-448b69cfc6dso1877436fac.3
        for <regressions@lists.linux.dev>; Sun, 26 Jul 2026 17:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785113026; cv=none;
        d=google.com; s=arc-20260327;
        b=UYepkIqc2DrM42UbQH7yjhSoojMy8+cN+Ud73QvfIKXfZ+mclYXyCzttKxF58J3ohn
         CeHX2kYe6My3OhCTowFw8MYSYyIm/iTQc4RFWPFYnhFyLP5xtL6LCTDKg3ErjuhAEFSU
         g7CS7ph7yjGZgf095QFSE7VGYaSEbjMaDO9qd2ELMkNfDDNTsHhSepJJGcrRlWu2K2BL
         i4JlM6fPSItoAHmWyDJbAnS6HMruESkyBC4DUoAkcOW86tjBIssuEv91OvHQmg55eBzr
         uA3A6ZDswD35JbcIuHdFtuWF1FG3c2uDGHQZigCPMtsI2IPlN/WsDRoiPC2avkIQWbzL
         wwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYeRbG+akEzJxsykcbejVjCZASuJBXfbkdfHbwbP4jc=;
        fh=I8yd6dD2wpl7HJsx0VYXkVlHkdCFM4C5cn7AS2s82/Y=;
        b=aH6Qr9yhcxC8VlSC2cqfZt3t0PjEtrj2LeX92N54Hcv8+eLutQZIb71/ty4ETLDoBA
         gNgKweqBup7+Cw4kFewNg1+txf7nTVpKrbwFBNmPPgyQK8z0Yxyc/gPWQgiUeWZnoU6M
         ssAcUdEa9bUgZU9ZFGzd2krGr3O2hW/hVkKZs0SSupIsgK888B1MrKanjTicP87IRiuB
         zmhW9Me7v+h26MorX1Lb0IGWt8J+JWiQ28hEMq2skK+Pk67qP1ICnOvmjZclKEKZGMso
         rofSGrjsqCxDYX9pNKBDRDxaQfTwwIUQ0nd+3aKivbGSAaonfGWCaDdGNWFV21hqk4k+
         VhjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=obets.net; s=google; t=1785113026; x=1785717826; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fYeRbG+akEzJxsykcbejVjCZASuJBXfbkdfHbwbP4jc=;
        b=ivaa118NvBl3/zvKdQQUBlTlrzRisr467yJFMwjOyxNbESbeidSjncZTHWa5PVCKYD
         nVRk+7dcEME3jjDBY4pYv+FX4V0uAaRZZAiyXkujvsSpYMS2r7NLbxrIQAXgoM8Nrr68
         3rx2HjtsAnqY/XbJa6MMU3q7Q67AJalkdBikc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785113026; x=1785717826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYeRbG+akEzJxsykcbejVjCZASuJBXfbkdfHbwbP4jc=;
        b=ACoFjxOX+GnKRSQ/01g8NouV+7QKtvf+H/fU3MNY0KsXiZZQwx7B44TggTIfZt4DSI
         Ug9SGo4rUrwU1VvLZW/FoYWHi4leYC9iQ45q87zEfkdh9veeNgKtkBK8jH6i1iQ7jiuB
         l+C82jeZKSnC5y3ku1L1iWLcwF4jwQXyuX7OG+1tmzZFLAwgTedb8LHhd5gAdi89jsy5
         dkJoKm7Q7NY5POpmBFVyqX4plJp/Gl9RZIe0cRhKep5w5rcRwiQddWqZf5uCH/6kgfEN
         T8MRLYTag1lZefV732LYOgKkf6PLPwCF1j+KKzruhveZIdnBRhLbrpn1I1FCmRvGbQ9B
         HhCw==
X-Gm-Message-State: AOJu0YxRYgRMhquQ33Smnk0LVOTKAE1SIbkgXGmZOGI+XItA3GvGlKb9
	6U7jpnyZGfj8KJP7DhbHccY7QErprPUyGUH5Y7zUR074cWKi4fZMdPKwUaPiJuAX1J+I380D7Cr
	SjOIEpNmNEqzH5tomX3kJPK+VFrcUrAYXoZJmbdC0Y/8UfwfPiLKR7ZEXxQ==
X-Gm-Gg: AR+sD11EHstXU8XPzJ3XXE0+LXBEnR8Alssawn3YX0SBY2fs+JYGHHRz59PccMdzvtL
	co3FgJqSU3zNJQoHOm8Hv1D6WUkbYP/HIoPLgrauwbJ4iixrYfCD8r5Xw4q2cheUhlkm+hx/R9Y
	c1iqBSAWXU8sDTvHH4tooyAI0UhKWmXnL1bPcQw87cNtv4/bgJMeDok2dGOpsFZv6bK1fP0HjTG
	wDVZLXGEhj76ksz14WR/1uWyknQJU3Pn3IkwSvGzVxCQvwrZfnWC5YcrUd0ad28l/pP33BRHi7i
	EuLdVq3b0PMEhFlaoNGN
X-Received: by 2002:a05:6808:16a0:b0:487:6206:54f1 with SMTP id
 5614622812f47-4ab6a254da6mr5848848b6e.39.1785113026107; Sun, 26 Jul 2026
 17:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+UyQRutDUHbSSDv=MeNNXzSoKc_AWfhBzON0vjQ7Q9TP-Ujvg@mail.gmail.com>
 <b601a4cb-4e63-4b7a-9ab6-2ce3b9549d65@leemhuis.info>
In-Reply-To: <b601a4cb-4e63-4b7a-9ab6-2ce3b9549d65@leemhuis.info>
From: Matthew Obets <matthew@obets.net>
Date: Sun, 26 Jul 2026 19:43:35 -0500
X-Gm-Features: AUfX_myWapigKDLDd4qwebyBYupsub4SqC6H6kqHIahF6LtPJH6LpZD2roXQC4E
Message-ID: <CA+UyQRvsD=RxY+x88hzsASzLGoH7je6506MUbaDshspFi8UQTA@mail.gmail.com>
Subject: Re: Pixelbook 2017 display backlight with 7.1.x
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, this is the same hardware.
I checked out master and it looks like the a411ea4a8716 commit is
already included, so I built with commit 3dab139d4795.

The display brightness is adjusting as expected with this version.

Thanks for the help,
Matthew

On Thu, Jul 23, 2026 at 1:17=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 7/23/26 03:27, Matthew Obets wrote:
> > After upgrading to kernel 7.1 the display backlight brightness
> > adjustment stopped working in KDE on my Google PixelBook 2017.
> >
> > Neither the keyboard brightness keys nor the brightness slider change
> > the display's brightness.
> >
> > I'm currently running kernel version 7.1.4-202.fc44.x86_64
>
> Thx for the report. There was a earlier similar one about a device like
> yours:
> https://lore.kernel.org/all/CALcz8n5nB%3DH8CZza-Pw%3D%3DGfQWRViJwWK8N5Pga=
fE-4pdUJL-LA@mail.gmail.com/
> It didn't get anywhere as the git bisection didn't work out.
>
> And another one about a Pixelbook
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16507
>
> Is that a device like yours? Then this should help:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/a411ea4a87162898d=
2a0547fdfb721ddb7626be3
>
> It will hopefully land in mainline this week. Could you maybe try that?
>
> If that doesn't help: Could you try latest 7.2-rc, as there is another
> fix that always went into 7.2-rc1.
>
> Ciao, Thorsten
> > Please let me know if you need any additional information.
> >
> > Operating System: Ultramarine Linux 44
> > KDE Plasma Version: 6.7.3
> > KDE Frameworks Version: 6.28.0
> > Qt Version: 6.11.1
> > Kernel Version: 7.1.4-202.fc44.x86_64 (64-bit)
> > Graphics Platform: Wayland
> > Processors: 4 =C3=97 Intel=C2=AE Core=E2=84=A2 i5-7Y57 CPU @ 1.20GHz
> > Memory: 8 GiB of RAM (7.6 GiB usable)
> > Graphics Processor: Intel=C2=AE HD Graphics 615
> > Manufacturer: Google
> > Product Name: Eve
> > System Version: 1.0
