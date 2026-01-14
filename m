Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A061BC08F
	for <regressions@lists.linux.dev>; Wed, 14 Jan 2026 03:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359807; cv=none; b=aJq20ng8mXKpW/xmdemPRRtuB1XiglY0/l89ditBzU7fs4/sAR320kRz5xGj6xETjnMC2TjxkzKehDPtWtUtxLRu4Mb/3aKZpOtcgG3MgWcJAJUuSFppcQuie5XeM+z+OB0QIwpyT2nyeLIwnOVVMQXC5AwnbSp/BC8x2c0zWJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359807; c=relaxed/simple;
	bh=/86G10alNluaILsBZIVi2R5tCLcoFOd0FRhcRELVDLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYB3g9XjALj44GlK8PYMEcg0mTkVMw09xSYSt2Nu4VSIAH+trV3i5T6HbuCMibrV/GG9xx3uefEldQ4BNZRiC4Ly8WBpnGhZWFom6yylqFNtx5KzFtwVgsyg8J/OGJ/Z0yWITxe2LoBqYYOlh+RJ41r70UUV2hdHZnlss4+peEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itRto4SR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itRto4SR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0c20ee83dso73052855ad.2
        for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 19:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768359805; x=1768964605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/86G10alNluaILsBZIVi2R5tCLcoFOd0FRhcRELVDLM=;
        b=itRto4SRPBMtIzaWE+D8DN0NUHPaspBE3E9xfyN60iP2r/373PEg6uC8l39td1mIuc
         E0kSlThIC/uxADWNfFycBOUsejc4kIJjcFzuHe2l+895TZUjBeYEW/G3CHSqpZodB2vD
         MvO74vdtnPJr+GQv8lXIffoBM6YusglsSAE10eGbs26JIgYjgHh92ku2uhy268fQhI2/
         w+6DF12mmjBauAhgEEGdlk+TaQyWY3lOw83kfZ2ZNBnB/D5nnakKxNFuCOwNvhFKLP8w
         xWz7ZKWlxCsYSKUZfifIZyu7uwIGlX3ysDHHRH+41qyEls81BCLkbauDoEWhnsoraRvx
         wrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768359805; x=1768964605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/86G10alNluaILsBZIVi2R5tCLcoFOd0FRhcRELVDLM=;
        b=Cu7tyDZ7oPgD7lC0CIw2TZsogulFG0bvnDoXKVahXzaE0qFbUP3/p0KdtyE5LAtfl+
         TMF8csH52OSjteC5zIrUAphMA9xOtGH9aOYeUzRvwYXsPi9nLcdMMRjJ1Bt4kXAzd4IG
         XxjBdkRAoLLlabyv59WFU90a+dE+/fv5qncYFYmHqF+wP0CoDur2/x0gD6mh6bmIeu3H
         MszHZwkQLtNFAd8iiM5GzASVRbyTiR8CbrmKm+LXX6GCfaNOIMZjjKhYHpD0XHKqiGPC
         kWZWZ7OWeTdqTaV5BW4x4fgn6zjvU3ddUgcLzZ462bvtgH75o5gKULHOIqM7RYLcPujk
         YN8A==
X-Forwarded-Encrypted: i=1; AJvYcCUIJFojkbpI4uM+xv1StwKcaLhYIBY31Y/Ov3g+En0qYY+7sc/DgUiFZVNmGK12GMO//XQjMeE8kHIgOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVZ31JZRILzQSdzu53cPyw9UE3SYl+fHfRtpnZGUw+fBVK4lsm
	GlFztNCYFfUQaqx0ew3ZDbUo4d2hpomaCXzk1bzSdPEir9Eg1trRPooA
X-Gm-Gg: AY/fxX6XgE8IWc99RJuDNCTHSq+EOtZGReFxIiekT7aU4bg12sBsw4rWpTU/2oDysgU
	KEGGBeyNaoVSKBLIz0uJqTdZlAXlVIqxkHEKZFkolcundiVEV6Y00/Ew6AfkTbhRU9QWjeduF4N
	8005IdT8bUsK4rphhTM3SU8UC3rznAmvH/i4fNGR0Nacai4Q0/6H2nXtmFCdI8o+F10+TR5jNoJ
	tWfEKTtH5N97wW8WsU1XctvN9fHBVAArPtPmjtaUScVDoL9nlq+xyTJZRYlNJG5MNACGtWJa7zv
	HX2qvQkmjDIncD7MUExSSQ/JcfiIZ+7jTWuHElW5bwBgm2DjV6oLpWoulRc7PyfxvMHsw4X3Ytj
	L7iPcP2cU5LW5HY54hB0lKnYx9p6k02MO7Tizm/lm2XHGEMGMCC8FHRwONo18gXyRKhoUbxQsB4
	0RI6X33gg=
X-Received: by 2002:a17:903:11c4:b0:2a0:9835:c162 with SMTP id d9443c01a7336-2a59bb75480mr5784705ad.22.1768359805240;
        Tue, 13 Jan 2026 19:03:25 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2f8asm215237495ad.57.2026.01.13.19.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 19:03:23 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4B6D242BEE9B; Wed, 14 Jan 2026 10:03:21 +0700 (WIB)
Date: Wed, 14 Jan 2026 10:03:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aWcHeGPUfS6nE2sC@archie.me>
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
	protocol="application/pgp-signature"; boundary="2vKEEDcQdj8x5oXs"
Content-Disposition: inline
In-Reply-To: <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>


--2vKEEDcQdj8x5oXs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2026 at 04:21:40PM -0800, Randy Dunlap wrote:
> I'm using docutils-3.13 (Docutils 0.22.3, Python 3.13.11, on linux)
> and I don't see these warnings.

What Sphinx version? Mine is 9.1.0.

--=20
An old man doll... just what I always wanted! - Clara

--2vKEEDcQdj8x5oXs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWcHdAAKCRD2uYlJVVFO
oyhDAQDcGjOTWaDOU8Vur6ZivEcg/g6GixiW14r6sgwKCmBrAgD8Dinx9IblwjYP
PvVnp9Rn+sIEUl/Rae7KeIA5jA48CgM=
=h6Tb
-----END PGP SIGNATURE-----

--2vKEEDcQdj8x5oXs--
