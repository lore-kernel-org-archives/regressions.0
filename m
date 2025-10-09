Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6DB24501C
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992638; cv=none; b=FwL+WwxWf7D4w2qkblKqFbI87+iKR/NSc7+rPxnSLlVrip0UAuPmlp8fHesQJT3RmW+MRscbFm/A+w6G2rXYlVEOQyiiJrBrz6mqW5rKne89ozZhRNfT9/O5tG0ky4iziTO6+zIkGy6Cu6nxG3q8e4FBjLJSVArsfJOic4yqlKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992638; c=relaxed/simple;
	bh=EjW0hP5FbYNYPJ9yWAHL7ZiHj76ewphEw9EXSJMEoCM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhjK0Pn6FZmo6teYft+qfs8z59PMRwsHQWtcYpa+ggjzj3jUNYcBVduMmvqr8jSVE6FzaWul0Qxn7214O6KGCNtZZR+DtvL4oFmZJPZGUXAyXsDXBkS7E+BQAGN9ESrxNKyiiBCv6GhxY66HuBx0f0iS7Sa+Dh9IKiQvrW2iW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBtwaCmH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBtwaCmH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6394b4ff908so1075036a12.3
        for <regressions@lists.linux.dev>; Wed, 08 Oct 2025 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759992635; x=1760597435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9K3jcLU+F0b0kSwu1qTzDutZ00flbA5j0Seew04z2kw=;
        b=dBtwaCmHfJG4H+DoUDFvKVBbDD09KgEKdsuK9/T+4HEK+clTYxKiBX6MLnpzZW0GEN
         YLwkwp2Uc6nkmtb2y2OLPey3jTSvudayRi7bo+zgvYrYGevgszvmfwDqaE0e3v9exoPL
         KnKtMp5dufhcrn+wMd6AsdmU/NJXndGvlqfK6v+Q3r6LpNiN2KDLezZ2c+pRPLHI5bKK
         erfXBC1OT19jRkEZiWpxxCkaaKqbXrVSDss7qXDW8BCDtANRC10dpy6V1cwY02QMOcm0
         M5afjt8FxFilrVbMPBVQZp6MzlFiMJdzXkKIrDVuoXhknWgrT8UqAh5lcXrBwXzR/3af
         DmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759992635; x=1760597435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K3jcLU+F0b0kSwu1qTzDutZ00flbA5j0Seew04z2kw=;
        b=er5XIqKVD6PaIJGGyX86/DPqKUdxJsKIt7/BB+lnATlJWqCRP3aM5vfiVZodwG7tcJ
         C2VwMfysewLJmVUBSuGMhhA8wWy0mImjScNqecE7CCTyndhrGW5ipvvm949yj5Ik47en
         PudhvzDnbAa+53loaC4UFAASmr3nwb4D6qg8wV0yGbX7Cc8oVZ3uoPB3mNfK++OMFg7l
         MDSh9sb2QApqDx8arAkd0mMjvBd92BLsLDWExWSy/5c9xN8Qi3VxvgURq8gDnC4i8POM
         3t8hZP6JpK7TxyFScKkcIf0t8jEmvQ5TlCfrUUW+e/lbDPhp5uN4Ek3kxDSh5Ezdx1Uj
         GWyA==
X-Forwarded-Encrypted: i=1; AJvYcCV0yanhEVXo+3G/NKp//BmSw8VopyxUoiNkFZu0cPoH2tgLLvMmPaOB2JHlac4asMCMi4BykA7LmPq+Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxij5D0XqjfuBlEmbZx5Ya3Wm/uez4PRVzNtsiGvxjnNmgNC+aS
	14de+iToAwrHPNclEc31FShLCSXwo4FFYNv8zc3HyinJ6dq13f26ytGn
X-Gm-Gg: ASbGncvNnT1QwxgJqCmBKIpX6hPSy0QeTbUvP2jvtZHOUx/M3Gyu17vlL7/JKTPaN+Q
	gZOjyHU2kfFmJU8Qjrz7yOcG0rOJPTFYWWbcqAC32D//WBa4vIf3VGrE5+c28Qbhuumcw1yV5TQ
	+EB4LmLpLGyRkD1XLe+qqGI1A9sEJz9dSt+f2B6PaGaISEFYQ8wPQdIwRtZqZEycDN7CbmyxVDL
	rLZzGZiy8JJo//JEc8v7vLSN1D4RiupLaoei6g0PXAU1FuT/CLOQFrxzWlkrYMzhpYKjI8zdu4O
	sVw5wmLmFcxu6irVWF7/7fwr7rtJVEjIAR8vlGg6Kq1sdz+d55dc1oXpmOm1Qd+024Ust+t1Sk4
	S90DRuB5Vk3E0wUFlob5Vl4VCOeb71LAjkwBWJygFCG2M09fA+PxUkhAqzTU=
X-Google-Smtp-Source: AGHT+IG8Ud5fo/RqGDQh+pFaXna1RgG6zPI71+duC2ptc9c7lcQdelbdLg9f2SiIK3mM5gHnQpaK4Q==
X-Received: by 2002:a05:6402:510e:b0:633:d65a:af0e with SMTP id 4fb4d7f45d1cf-639d5c59a53mr6110460a12.28.1759992635029;
        Wed, 08 Oct 2025 23:50:35 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3cdbec1sm1715007a12.20.2025.10.08.23.50.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Oct 2025 23:50:34 -0700 (PDT)
Date: Thu, 9 Oct 2025 08:50:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Angel4005 <ooara1337@gmail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-media@vger.kernel.org,
 linux-uvc-devel@lists.sourceforge.net, Linux Regressions
 <regressions@lists.linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [REGRESSION] uvcvideo: Grandstream GUV3100 (2bab:0011) broken
 on recent kernels (including LTS)
Message-ID: <20251009085030.2d360284.michal.pecio@gmail.com>
In-Reply-To: <aObw4BRRheGO3_cg@archie.me>
References: <CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com>
	<aObw4BRRheGO3_cg@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Oct 2025 06:16:48 +0700, Bagas Sanjaya wrote:
> On Wed, Oct 08, 2025 at 03:56:20PM +0300, Angel4005 wrote:
> > Hello,
> >=20
> > I encountered regression (breakage) for the Grandstream GUV3100
> > webcam (ID 2bab:0011) in the uvcvideo driver.
> >=20
> > Testing showed that the camera WORKS on kernel 6.16.8.arch3-1.
> >=20
> > However, it does NOT WORK on newer kernel versions, including the
> > latest stable version (6.17.1.arch1-1) and the latest LTS kernel
> > version (6.12.51-1).
> >=20
> > Problem: The driver finds the device but cannot start the video
> > stream, resulting in an error in dmesg: =E2=80=9CNo streaming interface
> > found for terminal 65535.=E2=80=9D

Hi Angel4005,

As you are on Arch, can you try v6.12.48 LTS from the package archive?
It was released on the same day as v6.16.8 so it's hopefully good too.

If you can find the exact v6.12 series release which introduced the
breakage things may get easier, because there are much fewer commits
to worry about between releases in those LTS series.

These are the only drivers/media changes between v6.12.48 and v6.12.51:

000b2a6bed7f media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENT=
ITY_ID
fd5d3e6b149e media: rc: fix races with imon_disconnect()
effb1c19583b media: tuner: xc5000: Fix use-after-free in xc5000_release
514a519baa9e media: b2c2: Fix use-after-free causing by irq_check_work in f=
lexcop_pci_remove

Perhaps the first one? Consider this dmesg line:

[  363.700829] usb 1-1.3: No streaming interface found for terminal 65535.

There is also a few drivers/usb changes, but I doubt they are relevant.

Regards,
Michal
