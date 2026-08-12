Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221ED46D2CF
	for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786546206; cv=pass; b=HpTrA0NnY/pjpZcn2VgmmIcyOl4Ng808pd5yMYwJcYK+KMJEtebjq/+j2X4VwHfnNSt10Ydx7PuQMTVWvWOsmhiVR/zQVd29c2MOvGWIFKA34j4cnp1Z9qyOpEpRaGn8i8Ha+RnH3xveCKyzeoZGev5lNC2lgklFjkyp5aNPxY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786546206; c=relaxed/simple;
	bh=9++DEyhWIDbR7vGF1FPZPJTciFPAbeer9QqFVsQum9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ons+f4ssx1QcS/uDzWZsLuk/tb0rdFQA4dsnBuFwdRUZ35icr5zm4ESp2roidI88qh1XUAuC+mMAVZz4wq5qWWZGvGD0uJ1cYfmS4ZyyemtSnhlvbswpzuVA5m8ZZjddxUmAUk3DHz5b6F+8TtZxe/CBinCF0s5xIddb4moMb44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXrWmYJI; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXrWmYJI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso168817a91.1
        for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 07:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786546196; cv=none;
        d=google.com; s=arc-20260327;
        b=VZgLD818b7S4SE6Q4J1y4OsFhBD7JL7Plrj3fAN5+hkte4xmUYncDOylsXKWIR4DiG
         p9j3bUWXIyH6kosHP1wu7o+1yPeg9zeOB04RR/3oZ4NN4zPcy9DX7PAqYehh3QHZcbON
         OSByUNt5qBZs9QBSJW+kVJdOvtd7RzecyPN7WvsakixN3HNgoIPIj9+4vh6Bnx5kfT4I
         OwS+4RRjXB3S9vg0iJfwJ3x48MMeq8XHMw8WYGvIgKri5qz9YbxOZyv+CFK7UW8dGviJ
         kjTkcW9x6A7MWedshkFI2sKBNspAJzSZhwD8433Ovw7p52eOXeNkfMTOPAuVSTT4/Rb7
         TNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ot/f134CaNd2ZZh1uYzIr3IyXzUgXu59DTxBXmvb+90=;
        fh=sfMCJZhuEwyeKmjqw5CPur9TP9Tj4brK4rYi5mWTCzw=;
        b=mp2UjGPUKh8cPAV5Onkqn6x7/hCHhz6HbOidYwSUVFFPm7v50u0IjHUU7qLa/UnrPA
         FBpg8Hnyzi3NL6kmsyngOVi6LRw0tmi6yjsxZAnpYW+N+muvhMPzpYQKWVygXHXLk1ZD
         kpzUH1GhQXP+KF8ND/JvVncB+sC7+OxoTLAT8qiAXhQugBbr7ZhKxUxNVbRj2SUdmvSk
         i4EcyQFbCSstPvUXgdvtQcEglF5gwiZjLUrgjZ42oFLUg0XL5lEH3vdFcWMjoqb27e3w
         7/SF/tu37WRuWixvGB+A30vzFaaoMFs4boKsQsOnQJKVscv6BfyU068qnXx7ckO5V6/t
         JnvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546196; x=1787150996; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ot/f134CaNd2ZZh1uYzIr3IyXzUgXu59DTxBXmvb+90=;
        b=jXrWmYJIHFewCTMJJGkJs4EuJFTjiJET+F/Xlm5NDrVSDVYb3ZawHOM0CVAeVlToMP
         8M4g6PLdGws/67bCsg+nnO6czn4EIozkBms/ncOZFueJTygAMr/GIXkBHE0kSAR8o2Cm
         rBIvD7huW4/16zdjwkHzjvVaHKbGlSE9M+yQnATHN/bSCj113FyxGcWtQr8Ts5viSs78
         Ol8NJk3F20VW0VCgUD7jLntBJn/iYyhL/eQnnV7Dnkobf1bJ0H8vpJWKC3CUUZgRoiHq
         Xlp9xD8E9dA6O8VCZYnQfB8WhwawL28+yqnHVeakyWOpt1HGYIdmiOuMjhUuG6jJS13y
         bzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546196; x=1787150996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ot/f134CaNd2ZZh1uYzIr3IyXzUgXu59DTxBXmvb+90=;
        b=BaE+hgbmAnz6EovB6DgOFZ6kELxQZMb+NGNVys8cW773h0MNi8BDAt0hOCd+Hhz3fM
         QSHvz+qJDjjDuS9a+mZGGZeJv/ZRqLsH7dCXhow1dUnB9vIt5bMpw2EXJzjJZqCp2CEv
         rGw9Kcg48Xr3XmUgwA7SAbQ9z4jsWT+x0hvid+YmFIr8a6ut7bHj0rFLCr5VPwa37zX7
         dDEX+HBNNh6izUHv4JsZHCC+F0Aqc3BArL3QVnhvgPlCPlGUkkW4IVs2VWRbhjIb1QEi
         xcxGmjbC790PzNkXOTHgaqgmcrTH96vTJMEigT+hwsSirgJgNrkYtrKhVA4vkQWOInkt
         gmrg==
X-Forwarded-Encrypted: i=1; AHgh+RoRGGmgtsyljHtZGde038zjpOmSTSvAXEDgzWs1AiZRs9wmrGBt/Oe04vhFAasmo9qXQRiQsOx9zeXxHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJD/2ccIVQ0pisjUknnIqhPADkwa3X8pJJRa8hEDiDmxJVw9cC
	rpoi7OHO+OK6bPdo1Zoi+IKGqorurOL1niuncIvVh9/0Bg+1MnM5fbVwv7ksDYTHo4IMCukWasV
	RwOlKiF/mokZE9SVLShr4unZarkJD1XQ=
X-Gm-Gg: AR+sD10Uidx4xjTcj5OyyInzzQWsqIDs6ddTvYts3+WxRN3etmCy/6mNWCvMBNRE5wo
	5KmbtKpXlobQnEJb0kGvWqmXOV6oNIGKefQ+vmWt74SWUe9EK8GsbILeNJ6mSBBepA+aph/Wkh3
	jLzPiZhfLLws6frs95qvP791s2tcTWGmEGLhgQXYFP5HooRxLzOVn1mQvusmfdSZg9cOVJIpNnI
	vMMZa/MB/ULtU4SfzRM+KdBeot163ObOgqXjG2GirCSrfZClzPanAlwt3Ek0/fC9UXLwh1PgaFe
	VVbAdhE5tjRBpD9humtufvsJ/0PNLAIGhW06ycCHg5dcIjsGrkIbpSUB6jdhXFpKGap9Rd2kpw3
	sfnpaK8uWUA1xb1el5lfKqChHJpUvGQ0=
X-Received: by 2002:a17:90b:1c87:b0:38e:76f8:fcbb with SMTP id
 98e67ed59e1d1-3930165d7ebmr4278871a91.4.1786546196340; Wed, 12 Aug 2026
 07:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9c6acb62-4080-48e6-9ba2-d1c457c4ec88@gmail.com>
 <2026081106-pebbly-cahoots-37a7@gregkh> <23db5f95-c2d6-4712-856e-28f647e184f7@leemhuis.info>
 <1caea72e-b9c8-452b-a3ff-5690d948b4fc@gmail.com> <2026081151-reabsorb-calamari-7442@gregkh>
 <8a0fad2d-788a-403f-a880-2f97c6708275@gmail.com> <CADnq5_Pb=ox3nWfdpb3Qeo_eSQayuc7UqUOnm0x+WS+EQTVWjA@mail.gmail.com>
 <2026081216-goon-nicotine-6d62@gregkh>
In-Reply-To: <2026081216-goon-nicotine-6d62@gregkh>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 12 Aug 2026 10:49:44 -0400
X-Gm-Features: AUfX_mzj2HCarj37nq6qUUz4-f_2TcoeI2QeBqGSJvYG-vDLTLtMkqvEmu0fq64
Message-ID: <CADnq5_OySMeizELEwN7Okjc-SKRJMvO6dN7X-zwPp_eQuz67hA@mail.gmail.com>
Subject: Re: [REGRESSION] Please revert 1191285ecb42 from 7.1.y
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sergio Callegari <sergio.callegari@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	George Zhang <george.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:13=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Aug 11, 2026 at 01:25:14PM -0400, Alex Deucher wrote:
> > On Tue, Aug 11, 2026 at 11:25=E2=80=AFAM Sergio Callegari
> > <sergio.callegari@gmail.com> wrote:
> > >
> > > On 11/08/2026 10:08, Greg KH wrote:
> > > > We aim to be "bug compatible" with Linus's branch, otherwise the
> > > > "pressure" to fix those bugs goes down.  But I defer to the maintai=
ners
> > > > of the code involved if it is being worked on, and they want it
> > > > reverted, great, we can do that.  Otherwise we prefer to leave it a=
s-is.
> > >
> > > I understand. Sorry for asking about things that might be obvious to
> > > most people here. My expectation was that only a selected subset of t=
he
> > > patches on the Linus' tree were to enter in stable, so do we really n=
eed
> > > to have stable "bug compatible" wrt this bug? The original behavior w=
as
> > > not free of issues, but they were rather minor (a reporting issue). N=
ow
> > > we have this very bad behavior where the display remains dark.
> > >
> > > To make the matter worse, on systems that have encrypted root the scr=
een
> > > remains dark also on that password prompt (observed with plymouth).
> > >
> > > In any case, I managed testing 7.2.0RC7 and it is fine again.
> > >
> > > Looks like the Linus' tree has more changes wrt backlight, and the
> > > interesting ones are probably those in the cumulative fix
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D973fd9493ec21f12e760fbbedeb7b0b2317c02f4.
> > >
> >
> > Thanks for testing.  It sounds like we should revert the change from
> > stable.  There must be some dependency we are missing in stable.
>
> Great, can someone send a revert?
>

Just sent.  Thanks.

Alex

> thanks,
>
> greg k-h
