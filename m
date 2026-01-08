Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6617C218E91
	for <regressions@lists.linux.dev>; Thu,  8 Jan 2026 02:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767837992; cv=none; b=b1JOaeWkduNyPMJKNXDxFjJYGznGpGEZ4ZIkCRxHkllxQEoyXtuuWkEkUL5ITNi1jTnWMFninhFJQ1s/+pTUWtNrvBscXSHtzXyyRR/7zvXvugoCwpnEpBUh3SPhVTdqEpuIDayDTHwnJgtqVxiFdwoH2CJHbowUYdu5IfgzoZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767837992; c=relaxed/simple;
	bh=2v2lCPOw1jH2L401Xb6vFxPuNeZejz5XYCd6FEDhu0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nu0Zj1Iis6Qwyw/DIxzundLZfH3Z1gTnCPZpc+9zppEAMSA7MHg5A2DrL3EICO0vXXbOQdxoqQRWE3HIMWAHiK5EGyj3HbgMQBRz41zqec9BgFjBd/eI2YuFxkgNFFIu722jfwMqiwTf1DQFDeR96lNWRgXEyAsMmR5SttXi8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a42Mp2CW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a42Mp2CW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so1609215a91.0
        for <regressions@lists.linux.dev>; Wed, 07 Jan 2026 18:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767837988; x=1768442788; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2v2lCPOw1jH2L401Xb6vFxPuNeZejz5XYCd6FEDhu0M=;
        b=a42Mp2CWEPqhgMEHo43FppcqvUVm9wybWELWDbMkcWkkG33RLKNYQbYIYoH/6d3bmI
         cNbLE1JOrMy3FZ6Xh8SNK7w5iwTtE05VbvRDhjwnyqQFt3Ni8gwZhhxzmntz5T2N2w4M
         RdvVACV1ftJlSDXvFiZyKOiAz7m3439yLJSNRUBRqLr5jobQI3mjq00hJedkQ+juJvwu
         e16KD2FF5VxRF7DAMhKZh6BQkcKwkCeUfKMfJFFiOf8BhPUi2/HzVReTft0qGZvVbaqC
         C/GWJ1yP+TwTIIIBSeeD0jA3oJO+J/mmgK34NSX2sp22a+ukfjbi20asDmOwERb4ELW8
         ADig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767837988; x=1768442788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v2lCPOw1jH2L401Xb6vFxPuNeZejz5XYCd6FEDhu0M=;
        b=JzxPQITQRMcDTqSzkD8eCgZuurdrsRXgCZBmslVdjwyLVlbFZ3vx/NCB0eTAibVt8N
         hBg+Z3fzh9MxfUDI3wocqfLXqg/dRf8lxqrzFLi9WS5cDbZU4PdXr6HV9PiMQ8zyyh4p
         71Oy+t66OGO7MTRaO2UfEZ9ESxVFqG/N8Gy9F0Wi21D3A9WjIwjTNSh3XfUb2mDO5Lfz
         AhuusVZCXqIqQ1cr84ZAgJfMznqXuzy/5dhTofE7n37XC7YOq2EpzEHJmlOYdp8da7Fg
         39n06QtnSZK9C2BkTAqjz3yuvZkSeZeCnIUhr+gMh5wjn4l0LuWMn4rV5cu6atwmoGVk
         ErYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXjP8IOHFUU3nmB4h2Ju5rev8lGIVQCiDaCE7A+lXaxDXitfHcpvg84poOyrpg5e8cPjrm5fvObn8kvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjI/uqPpg7C556CuQzlpg59Vu4uhihsY4XNGsUHyD4q5B/omnI
	xsa65WBjdRI7gkqeMPBHoORE8ziQ44zEoG+weP1jeXEVbyCnPWTBj9gW
X-Gm-Gg: AY/fxX4ERdJrCp9AgK+XXIMztAIyUqX/ZXmKAJbzFgZgpYlDOQ1jIWTVYi942pFSHW8
	Ls99ikHU47KwputKOnQyqQZLNT+zNQxp2uMX98eau2ZM++8nZPUr8erp6YIYdVwyEq3V0cAG0Pg
	aiGtG0bdRN3hXdG+hBUQgOZg6XEawPZRC5orq5iorJLAT3FRBZIxeELoZLt+ZLogh9GOniVOAcU
	kZSGkiS6/HlKgyCLJ8IKZtMcYyCL1CWOCGYCBeN7nUdnbVl/UHEPS2qNdDTwYqpAvFDO4LC2ii1
	30brScOI4Wpx0G1fwwRvWvz5SnjEkR6mZmEPUllGwBFfEIux1XTS9hELtsi7hYUfCYhTGwe8DeU
	VJTk6ZrOfGXEMBs6+B2ZhbupcNGh0kJg4BnUz46fShwQlfhqH8IY1q/MUCjhW8eO1cblzmbCT5x
	Xt3EpYurpLyF0=
X-Google-Smtp-Source: AGHT+IEcWA2UfWktZbcCpiIFschO/aHiJi5x2j4q7rHzeCoKFUazByzZ83AOZ3qwppbEh6jaOwNRaw==
X-Received: by 2002:a17:90a:ec8b:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34f68c912a3mr4452690a91.17.1767837988343;
        Wed, 07 Jan 2026 18:06:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78ebdsm6053921a91.4.2026.01.07.18.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 18:06:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3A85B42805C9; Thu, 08 Jan 2026 09:06:24 +0700 (WIB)
Date: Thu, 8 Jan 2026 09:06:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aV8RH7dW3Vlgne3R@archie.me>
References: <aUuLHzk5jdyBAxD7@archie.me>
 <87ikdecsj0.fsf@trenco.lwn.net>
 <aV5a6PCVrkRHwqt3@archie.me>
 <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
 <aV7wTFqQQkGf4efF@archie.me>
 <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qEYf5flkWFVx9elk"
Content-Disposition: inline
In-Reply-To: <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>


--qEYf5flkWFVx9elk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2026 at 04:21:40PM -0800, Randy Dunlap wrote:
>=20
>=20
> On 1/7/26 3:46 PM, Bagas Sanjaya wrote:
> > On Wed, Jan 07, 2026 at 10:19:32AM -0800, Randy Dunlap wrote:
> >>
> >>
> >> On 1/7/26 5:08 AM, Bagas Sanjaya wrote:
> >>> On Tue, Jan 06, 2026 at 02:58:43PM -0700, Jonathan Corbet wrote:
> >>>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >>>>
> >>>>> Hi,
> >>>>>
> >>>>> Building htmldocs on docs-next currenly produces about 50 new warni=
ngs; which
> >>>>> all of them are unexpected section title on DOC: kernel-doc directi=
ve, like:
> >>>>>
> >>>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: .=
/drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
> >>>>>
> >>>>> Userspace I/O
> >>>>> ------------- [docutils]
> >>>>> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -fun=
ction 'Userspace I/O' ./drivers/target/target_core_user.c' processing faile=
d with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-a=
pi/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected=
 section title.\n\nUserspace I/O\n-------------')
> >>>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: .=
/include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section tit=
le.
> >>>>
> >>>> So I did not, and do not, see any of these errors; are you doing
> >>>> something special to get them?
> >>>
> >>> Nope.
> >>>
> >>> I'm running my htmldocs builds on my Arch Linux system (with Sphinx 9=
=2E0.4 and
> >>> Python 3.13.11).
> >>>
> >>> Full log (tarred up) attached.
> >>>
> >>> Thanks.
> >>
> >> Hi,
> >> What docutils version, please?
> >=20
> > Mine have:
> >=20
> > docutils (Docutils 0.21.2, Python 3.13.11, on linux)
>=20
> I'm using docutils-3.13 (Docutils 0.22.3, Python 3.13.11, on linux)
> and I don't see these warnings.
> Maybe it's something that has been fixed between 0.21.2 and 0.22.3... ?

I get 100 warnings instead on docutils 0.22.4, unfortunately.

--=20
An old man doll... just what I always wanted! - Clara

--qEYf5flkWFVx9elk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaV8RGwAKCRD2uYlJVVFO
o7y3AP9vdBXVQUhfBnkUwS2EJyKH40eByIN9TeEHkhxDpAjk6QD/Rcg0HryCxxCi
Pi0yAwe3msr+eCaoGiQ/7pkXxMw0hAo=
=uGxC
-----END PGP SIGNATURE-----

--qEYf5flkWFVx9elk--
