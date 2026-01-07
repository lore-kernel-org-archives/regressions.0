Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65522097
	for <regressions@lists.linux.dev>; Wed,  7 Jan 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767829586; cv=none; b=hUQLSfqSelecoe69Hfz6iDR1LfySufonTtv3+cp3R/zCaI/BpIpoN1+Ss/wMmisVYVJvG8MyeaoaHokXo0ben5MfSwJdaU58b6xQs92Utj+qM0/Gs1/tpyd7gQxnCnh9+8XCPvkO/NZrpWsIkcpiEuiKy3tR01asoxFx+ugGAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767829586; c=relaxed/simple;
	bh=5lkCo2Bcdh2eobJrag13J+RX/0T+fcr6NPLzhfLUZeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQMgSvCZ8NGNy4b1z9spBNC4PVKISH2XKyT2AQ1QsnNJjYDeB46MMCWXwscC65yLLsAzO//BEKQkh2Z7DjXQw3U+MszUd3i3nY3ZP24ByVfOgsX9WgV6qWZq3iQY2OHgcFPxVNZAmyLANjTq6jSpgRrqDBe/FIBEVUtg4Yl/VMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k33+DbIR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k33+DbIR"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2964960b3a.3
        for <regressions@lists.linux.dev>; Wed, 07 Jan 2026 15:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767829584; x=1768434384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lkCo2Bcdh2eobJrag13J+RX/0T+fcr6NPLzhfLUZeI=;
        b=k33+DbIRch5gMeINYiy0NTXfwsiIonQXshmPpl4Bic2Q564zAU1V8rUZw7CITjgbF6
         PRPqQkH71OyGx3i18N54+iOg07i6r2yNBBn+BMCIpbhjCCdQ1wCvcucB7xZlg4FlutTT
         pTy0m8t3mgIfIleC4hwu8fAbwQVkc/obsiOlHaPD71Rwp5kaJ231V2MXlrCoVBxmx2lb
         Q7OwA70mJJn2TjUJHOFEXejRxrIJ1FNh/+Qj31L3hxbPSjKpX3FVQBB4DinO2cHJjfec
         B2ka8qHIsvfWkhgbigVUrDw0J8A7zs9wj4TqPSAO4QASgiLHaHFUrb0LxW0EN3zz9nyg
         1q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767829584; x=1768434384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lkCo2Bcdh2eobJrag13J+RX/0T+fcr6NPLzhfLUZeI=;
        b=S9zhMhe2zkW+Pnj25Q/WRZeF6TeNPE4PhvP99Y9o2LrOhyApKaNf1GfEgg8p3jZgWH
         mm2DgivIv9QDJjWv2FIbh2Rtf+VZi9nBmdY81vp1Xt8ImQHK/YAcv8AEhl5J3gXGD3NV
         GHe7GtVfKiidhFhJkXWf3BZ8yPjUR/y7mYT/yriWbcfzoX7g+IGDhPRvtBXU2mPmloc3
         6m7ihaPZL2t2q73zO612v3EaIQWDjrsPAtZEOc1APvh1KNmKJkATj++oTV4s0jBdMkn5
         o/QRRRjc6st3oxR02aUOkedxBOX4uVqg8zQcRF2BklMZI2DeqsyQCEj0FnScFiayfbAC
         WHug==
X-Forwarded-Encrypted: i=1; AJvYcCWr/vOw1hsurJB4v1hy7oVTwVf1NIzN1witZJcybEvmcgVTgLwMWl97Jog5cdYAEM9EISBrjrbiz//nig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM1P1rp4qEw+Nz03eq1FgK5JUVswpNvsML/9piQiVcCJYy5Rrl
	CBXnorsRwrIcXfRG5kfKmozzjaGG0y0HgX0SxajGSve7vHtRmjEspOG6
X-Gm-Gg: AY/fxX70+yKaERgWAJq5oPk+raZntRh1/LH8mGdZO9J1gED3jX7Xx56KdSPTJr8T/J1
	eITIqs8yaCOQaqp2MRpgq4cKXYMtZM62RUDuHp07Ev4E4AeFTW8aqV7X1dsFAhQL12m3Xu/v7aa
	7NlDVjr1abT2fmGVjNsDP0EaTy/Rcs9sk2zJ4YWGSSGifVBvY8NNLP/dCjxCDQvtsIxVreywT88
	ylvHdPvJxGFtEfguOFHzBTwZ3eCd3yKHE3tJeg3m7FfhBPSy+Ulrd9CtbcLzCxp4woZ1/5fneiR
	GoDNoPUzPY2g0cEXHNQTSpsFRk46HJuQm8HOnP4WT5y8pQt0rlX02OiZbJX/PuYlxnLysAu2+23
	u+EXw5G9aVZMeF9X1EpiX8CHSqJuvaqHlpPT49vGbRkcVG0n2/e5ZqL+9y1qzy+EMEK+EYeGgN0
	e8B27msktK3e8=
X-Google-Smtp-Source: AGHT+IEuDYmNMp5sGDX6zmUVtDt4gxTdUsbu3GSb//0p0hx6zc8cYvZZp5jNv1GBUYp1AmXY6DK5Bw==
X-Received: by 2002:a05:6a00:12cd:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-81b7f6ec17emr4090626b3a.42.1767829584411;
        Wed, 07 Jan 2026 15:46:24 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bab0da0bsm5782245b3a.13.2026.01.07.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:46:23 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2948C42805C9; Thu, 08 Jan 2026 06:46:21 +0700 (WIB)
Date: Thu, 8 Jan 2026 06:46:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aV7wTFqQQkGf4efF@archie.me>
References: <aUuLHzk5jdyBAxD7@archie.me>
 <87ikdecsj0.fsf@trenco.lwn.net>
 <aV5a6PCVrkRHwqt3@archie.me>
 <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hv2YtufuJ29ReXgO"
Content-Disposition: inline
In-Reply-To: <966fffa3-a91b-425e-b915-891299832e36@infradead.org>


--Hv2YtufuJ29ReXgO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2026 at 10:19:32AM -0800, Randy Dunlap wrote:
>=20
>=20
> On 1/7/26 5:08 AM, Bagas Sanjaya wrote:
> > On Tue, Jan 06, 2026 at 02:58:43PM -0700, Jonathan Corbet wrote:
> >> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >>
> >>> Hi,
> >>>
> >>> Building htmldocs on docs-next currenly produces about 50 new warning=
s; which
> >>> all of them are unexpected section title on DOC: kernel-doc directive=
, like:
> >>>
> >>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./d=
rivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
> >>>
> >>> Userspace I/O
> >>> ------------- [docutils]
> >>> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -funct=
ion 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed =
with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api=
/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected s=
ection title.\n\nUserspace I/O\n-------------')
> >>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./i=
nclude/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.
> >>
> >> So I did not, and do not, see any of these errors; are you doing
> >> something special to get them?
> >=20
> > Nope.
> >=20
> > I'm running my htmldocs builds on my Arch Linux system (with Sphinx 9.0=
=2E4 and
> > Python 3.13.11).
> >=20
> > Full log (tarred up) attached.
> >=20
> > Thanks.
>=20
> Hi,
> What docutils version, please?

Mine have:

docutils (Docutils 0.21.2, Python 3.13.11, on linux)

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Hv2YtufuJ29ReXgO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaV7wSAAKCRD2uYlJVVFO
o9t8AQDhw/m4nIujYigOdA2aNi2jne6Vev8KUsOHYlY7yCWDJAEAviAWbCThgrYO
VA0SnKeeFVAPM8V/w7O6kLO2o9OwygU=
=rb4s
-----END PGP SIGNATURE-----

--Hv2YtufuJ29ReXgO--
