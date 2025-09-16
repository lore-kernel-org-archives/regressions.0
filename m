Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE572F25FB
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040286; cv=none; b=BAu2r/nMHM++u2Hzwv0q+x4nTeJa7A/FqXFj28ZZfYBzjyIs9vzQ5xy40uOQoCD0Pal50VmrIDL2voqkHCNvjGqcEkJArlBGwnWfJtokNwfrf/KEoz9pnpfm6hqdLCanW70aKj0QCJWLS3rgSReTriJhOUmXqbozN6EmCco5wks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040286; c=relaxed/simple;
	bh=dAyZBLZ3deSFmd3TqM+cMI9+qPNkumh+pm2PAUP11RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQAmMEDy9xosow9AeAM+vs+CsCCsuxzGB7lHp24ZYH6IEC+ryQ/Xnur5mYZg7BaxVcx0oaGVzz/eMojq6kuz+gMUJ0fnBJ+emZPuaQI+/VcbPDvHOZCxQu4l4H/PdS/cSXrELKp77ILX2d5gAL2BYI1zEQBZxSB+4Nv2LwPxGAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RLR7Q9n9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RLR7Q9n9"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso3486186a12.2
        for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758040284; x=1758645084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh23vzAY4zhgyBViC+bSV8XfkSwZGUCWtaMJhyioQaQ=;
        b=RLR7Q9n9NuRdOUwahZK5DUoMgXpZdPcuC0+5O6zo0x2kBDWApR+jdPKW6ACGiF3uSr
         j//WlFKlu8OjUPIXSiRHY1636FiL/NaPByFvwGa7HVvtxUDlvrRXtJ5TQJyXHEtpXFco
         tAmGDw/nBh7Zurq8i7qG4KWWBzr3Ml+VjRpdVlsYYmvk9+9AcUnh0K4UzGcmVWKyj2LH
         fay0KbmSfsYe+jwjjrm6gt9bGB7wk7s4N+bIbJdM2im7vAXxXSiv7wJNQ4fXZ99q0TfD
         ziT4J6LPo7uXDPtVCLQa0TCe0DwLZVi+glvvvHny7Da54aFo+89048QcJwN/6hA86mw/
         X5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040284; x=1758645084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh23vzAY4zhgyBViC+bSV8XfkSwZGUCWtaMJhyioQaQ=;
        b=CmE4ruMKfQsbIlKYK2xbf+57JHIK8ibjkiDTMtpQyd2nqtG0oWAo68XBoBlTleWBIV
         D1rgucPkwAquWYWAxWI1MuUoFJPD1ZPmctWNNwlgTwNi5LGrBfNrI9YoGX2E1Mi3bFOw
         XC/mecGAGIoTbPI6FkpQR3Rauo+jud7qK5KKESSqnbURbLfxlpzFT354yXqxg7JJD65I
         4pJQ3TTPZO4Gz8jmHvafzb8X1KArkiiCRJl4VOGAkIQR3s6H5UnAnSNqT44GONCr/3ch
         F8f9qzLwHkh7NJgldMNAtPw7LPZnGgwGIZ2YrIaE+WyS/0wq+OFNaa2c9+30bfw2/Js7
         46oA==
X-Forwarded-Encrypted: i=1; AJvYcCVYFatgvXU8R5vXThWDggDE7E+P9IWUugFCl7L97jphN56oezOXo4qBJK/bV6AMUHQkDb1Ht8XE7JQfrw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7065vwE2KZGxmhPXnxcQG+Iik0EPNv+44sg3+Df8+dlzyfrk1
	9zlvu+HVSCuuwFuVa31qFHhPxPMbA2F1vYmn4HkUx3G1RzslkmxuCeekNAorR1UUIzDOg0z0r5K
	8uNzkl4mlnbf7421hdkntmMKNCo6ts+TrMtkDKB5bAA==
X-Gm-Gg: ASbGncspxAh6San50pUKJmsuX8EJNOgQfpP7Ergpwr2fcge3PciGbRiUPUdqp5xZc/B
	wZlnPaEwz+Zf6PBSrCua7wbP1v+sutTVaiZ8iSmFl5vHyqolDcndOlWq7z7bzGqqEXiMa7RA/N6
	OLKtyp63pHlr3dh376k3LMxrNunGjWXhZaCKqFwMg3PlL2BAiKuoj6/gGyqKt/qRMH8hjdq5eVF
	Qc/uunlHnBCEgWKqMF5K+oFhiq7BhT1YkpiXbR0sfMNm4gYJw5YYADdTUAuzcnbYChXOMA=
X-Google-Smtp-Source: AGHT+IECix1AVjlUybWwIVsJ9ka34tk4B2CLcGJk1N772RB5xGMQFqHG7lxLaX0geY/djsujO8rX54rNeXzB0pVIUu4=
X-Received: by 2002:a17:903:22c9:b0:246:4077:4563 with SMTP id
 d9443c01a7336-25d26077119mr182620025ad.34.1758040283778; Tue, 16 Sep 2025
 09:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFdesVkgGOow7+uQpw-QA6hdqBBUye8CKMxGAiwHagOA@mail.gmail.com>
 <arfepejkmgi63wepbkfhl2jjbhleh5degel7i3o7htgwjsayqg@z3pjoszloxni> <h3ov4pformuvguwsxtziqui2alarqno37kdru4bjsppeok4sth@yb4iposv7okd>
In-Reply-To: <h3ov4pformuvguwsxtziqui2alarqno37kdru4bjsppeok4sth@yb4iposv7okd>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 22:01:11 +0530
X-Gm-Features: AS18NWAmN3EQ1CXxJUBXHQK10t01W_4u2E9Mk2iKi6ZR0XCV66DIDrPHefQHuH8
Message-ID: <CA+G9fYu7RAGNnHEJjLdH=YhEyUJ8gvcR-+JV79Z4OxO3ODTu-g@mail.gmail.com>
Subject: Re: next-20250915: LTP chdir01 df01_sh stat04 tst_device.c:97: TBROK:
 Could not stat loop device 0
To: Jan Kara <jack@suse.cz>
Cc: linux-block <linux-block@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Christian Brauner <brauner@kernel.org>, chrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Amir Goldstein <amir73il@gmail.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Anuj Gupta <anuj20.g@samsung.com>, 
	Kanchan Joshi <joshi.k@samsung.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Sept 2025 at 17:04, Jan Kara <jack@suse.cz> wrote:
>
> On Tue 16-09-25 13:04:42, Jan Kara wrote:
> > On Tue 16-09-25 12:57:26, Naresh Kamboju wrote:
> > > The following LTP chdir01 df01_sh and stat04 tests failed on the rock=
-pi-4b
> > > qemu-arm64 on the Linux next-20250915 tag build.
> > >
> > > First seen on next-20250915
> > > Good: next-20250912
> > > Bad: next-20250915
> > >
> > > Regression Analysis:
> > > - New regression? yes
> > > - Reproducibility? yes
> > >
> > > * rk3399-rock-pi-4b, ltp-smoke
> > > * qemu-arm64, ltp-smoke
> > > * qemu-arm64-compat, ltp-smoke
> > >  - chdir01
> > >   - df01_sh
> > >   - stat04
> > >
> > > Test regression: next-20250915: LTP chdir01 df01_sh stat04
> > > tst_device.c:97: TBROK: Could not stat loop device 0
> >
> > This is really strange. Those failing tests all start to complain that
> > /dev/loop0 doesn't exist (open gets ENOENT)... The fact that this is
> > limited to only a few archs suggests it's some race somewhere but I don=
't
> > see any relevant changes in linux-block in last three days...
>
> Ha, Mark Brown tracked this [1] to changes in VFS tree in
> extensible_ioctl_valid(). More discussion there I guess.

That right,
Ander=E2=80=99s bisection confirmed the same commit that Mark Brown reporte=
d.

# first bad commit:
 [60949057a2e71c9244e82608adf269e62e6ac443]
block: use extensible_ioctl_valid()

>
> [1] https://lore.kernel.org/all/02da33e3-6583-4344-892f-a9784b9c5b1b@sire=
na.org.uk
>
>                                                                 Honza
>
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

- Naresh
