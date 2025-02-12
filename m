Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA10202F7E
	for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400186; cv=none; b=nBeTOvSSqOt5xb8OMdko+OWqRwieriHwjAoegQCqTqtCUiAGkHU/60e4p9s34JYbIu4X6cEqS0hbaAP7VGdvtbWNc4LfIl0g6O19F5ir2I5MpHicPAy3V9YVGt+HwSwW/zgmHZUzGV3gEuPhNfb+GCg2eKiZJDPLNnacFmtDOK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400186; c=relaxed/simple;
	bh=sVpfejHVAgrScsj2m/Clnt/hk7cG3yg5PRzNkuTsI54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpf/bPI8oInetDjwMhMrKSe2tmB0LY3G3dFBbSGUwAiJ8OQzAhse1peNyefXsql3vQY8UYY/5ALq3hXLvJQ+puYGone2MGBe7Hs1v1qfH6PL8XK76NYT/+ECfJQxPCeC2nSRvphvu+/kMbeIlEStjonuyLOLw/ZgrEAD6B6OIRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZDaL0pff; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZDaL0pff"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so377711a12.1
        for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 14:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739400181; x=1740004981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVpfejHVAgrScsj2m/Clnt/hk7cG3yg5PRzNkuTsI54=;
        b=ZDaL0pffC8czgtmcUjCdnha8oStQdBSXZZNA0ZNE+dzK11DeBJIpjuSllIguyhH749
         EJWWGA9NyrinDUDCMAWz/OvG8saPpiKQrCPCecvef1pXYGDBMSlCPJb9R/VKNJNgjSan
         unZD4Diy8V1SArf4Dk6s58E+h3sZwHwYGSCRIAA1DKDavMT7ZQwo6EmpiPOx8Qe2u6uB
         ukqLvgToipuXkBwndYadozflI0bM83/W+HnC9nIvUy7BmIVc1c5b4OeKu09ugw8usO9u
         rDd77lBvT8zYxE/MDy1RIL/4+UnWzCWUJNkUHe/vO/WPDYiqGZF3msBS4QJV2Zmn1xMI
         VLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400181; x=1740004981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVpfejHVAgrScsj2m/Clnt/hk7cG3yg5PRzNkuTsI54=;
        b=U/UgEu+HHr4zrT5qJxCFNMYkxOrRSJWUuSg5lK9bk/NODK6Vjuu3BHIapOS3k9ihPn
         8fZTDzemTSBC7EwSs7FXNVIhOVckpQ5LP1jb4f8E8hs+4F4XD/PkUH51Zepw5sAe5sBy
         mqBBdNMf5mSc90fVgzHhZYYW9ah78pRNzRXZp33S+uccZ1NVz4wIRqqj2+qCziU5+ezB
         Rg5h0++pvRY3IuTIbugWjmEP9bhhPP8NakQGVoH9KfUOk2MVd+nR/nHcYqchUYaAWYOQ
         SnqKTaLSqkVLbEOi1jRDxI3uchlzHokxXvjbsQidNUS9MpJXbSUmcXhFjMWbp5ObX5mh
         4P6g==
X-Forwarded-Encrypted: i=1; AJvYcCUoUghOXQ+GtWf3SfhelVb90Ge3GnPOQHqYFbwzS2EZWaHajdAYMjntq/pJuBDF0oMHfDsRO+Yui5Au5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVW65rx9Gx4MYa6fYPIcgujCZf9ZV8EURryrJ+kO/baya997/y
	Nl632pAcDREJpVUZxdqPa2Qdk7FNzhM2vxKRUN8fzW6wYi1/hJWlv2mraD0hFZM=
X-Gm-Gg: ASbGnctTk+jgD/JXsh/9zB9iYzvCWCeorU77A2e4g4NLZ4AeBSLkjm51G5mB6/ryp8R
	syLOEtCOem3T9HhfzyqcDeqVSkjn/1KIWIsghzUw6qRiqL0rrl6AUl9o4ahLyzzRe3VRYaQmfNt
	L7VbB7WXLkhtUdZL1/c1+MuVeyJcZO2NU69SYBLoN8YnvCrh1Lot15GoIGxmcdHkNdCtNQ5Im0s
	+f7/GKrrvi57gdeuI8HmAkP5Nr8f3c4RGGs7MYnkz9qITGa8ooXyKQL0dMuuVp+j+SF/9p0jZi4
	Gkb23Jow9HiJHvHTkCMa
X-Google-Smtp-Source: AGHT+IHEKbocUnqnlR+Rtf0hLyFJogHnkyCAOnjAMiGKbIRjZZT7rtNV2MioCmUXnZMPgwRVv//7qg==
X-Received: by 2002:a17:907:7b06:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-ab7f334aa67mr497408166b.2.1739400180892;
        Wed, 12 Feb 2025 14:43:00 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339dda8sm6417966b.154.2025.02.12.14.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:42:59 -0800 (PST)
Date: Wed, 12 Feb 2025 23:42:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Philip Yang <Philip.Yang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Felix.Kuehling@amd.com, 
	Alexander.Deucher@amd.com, christian.koenig@amd.com, regressions@lists.linux.dev, 
	Dieter Faulbaum <mail@faulbaum.in-berlin.de>
Subject: Re: [PATCH v2 4/9] drm/amdkfd: Validate user queue buffers
Message-ID: <zpzehsckjz2bee6w5bsnfpmkvtlxf6jywijz7iroausghoh43i@nxr644rwjsb3>
References: <20240718210558.26340-1-Philip.Yang@amd.com>
 <20240718210558.26340-5-Philip.Yang@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vogrexjxudlhcvkm"
Content-Disposition: inline
In-Reply-To: <20240718210558.26340-5-Philip.Yang@amd.com>


--vogrexjxudlhcvkm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/9] drm/amdkfd: Validate user queue buffers
MIME-Version: 1.0

#regzbot introduced: 68e599db7a549f010a329515f3508d8a8c3467a4
#regzbot monitor: https://bugs.debian.org/1093124

Hello,

On Thu, Jul 18, 2024 at 05:05:53PM -0400, Philip Yang wrote:
> Find user queue rptr, ring buf, eop buffer and cwsr area BOs, and
> check BOs are mapped on the GPU with correct size and take the BO
> reference.
>=20
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

This change made it into v6.12-rc1 as 68e599db7a54 ("drm/amdkfd:
Validate user queue buffers"). A Debian user (Dieter Faulbaum, on Cc)
reported that this change introduced a regression using a gfx803 device
resulting in a HSA exception when e.g. darktable is used. I didn't even
try to understand the problem, but maybe one of you have an idea about
the issue?!

See more details in the Debian bug at https://bugs.debian.org/1093124

Best regards
Uwe

--vogrexjxudlhcvkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmetI+0ACgkQj4D7WH0S
/k7M9gf/SEogOZOC8jKLeLY8lsbtucwWMIx5UgloDwPf1RnhR+eCh1xjqKNhwt7+
Waidj24QuKlzZovTx3oTmsAWeijaq9SHyOJX2o9hd1TdXuhcOHZvrarLFn1ZhYOs
yflyCYl5jgb7vuby9TDAvBB7tjRcLt6PLkKJew9rAp9aQvVq/L3DFNmdh1y8R9US
TCfJGIGwGNaBpeXUM4VjiwIXpLQ04Xg8mSTFmNN5Zn61Wiz6Vm/vKG4iosvep/ll
XIS9mkk/Jk7ilzAfEN70w3ALVRYpDYItXH2u9rB9mTa/zQJQupar1AulICSVoneJ
suBobOj6sV693GbY2/EBerRqU+JZ8g==
=May1
-----END PGP SIGNATURE-----

--vogrexjxudlhcvkm--
