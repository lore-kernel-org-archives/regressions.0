Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8E14F9F5
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724410638; cv=none; b=swzAifFgN1LAIva5Ur7HqejOuIQmz0IxUW2QBOD6E2wC78CeRqnprviWdRWcqN6P1j73qKFnvLhYd3cssqcvjVxD0V6eBOJQ21ksKFxIZ9TgCgxZJRuy5AP1Ky6rqCv2i6cRCXJbq/ZkiiJhg/Azk32MjpZftd0C73n4/M668Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724410638; c=relaxed/simple;
	bh=AFJ+PbAOlW5+cX2RPo8IOxs940SEAmEO+VHf0XucI94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5/REVDmLVlc1clf4t9bW33F2ZKggptam9ONClekN4s2HMVic5mzOg+AeAL1iYEJ79D9mA6Vsgxzoq+yeeF9XpnGQSQXZurJhbnFC5xqEZagDoESSKo9kMlRWTiHd2eOcOQsx1TNUN6SHP4DUemOc0BKPH+x791Mn7jD5ScBhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdpUsAqY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdpUsAqY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2020e83eca1so18035925ad.2
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 03:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724410637; x=1725015437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFJ+PbAOlW5+cX2RPo8IOxs940SEAmEO+VHf0XucI94=;
        b=bdpUsAqYh1EJv6fNSZsVGHqMofLxGKI2inKgXt75dH2T4SBidUwp8l6JcoR0s8LA/8
         mnLT3KZPi6t4/6Tk5RWCEHsxIWdr02O+UxVcLRtdhei+fn6BWSjqz/UjXE4u+ga9hV/x
         khfJ8L+K/fagX9F5RU0yj7QLvbVUrQdER/A6Y7Q9D2+AfOs+owTT0E7u4q8vfhhA376g
         Qia+kpMNQxe6Mne8iVuOtveTASFZiBUzUrY9wZph0MYfSNBxVwQMwecmEvafqe3S+Gn4
         BR0ZQwnCJ/pQ7T4fwGUZf2WarZOPj3w28oCuA8zgiawCzJKY7DiKH1T5KWr2hTNYXEuI
         kacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410637; x=1725015437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFJ+PbAOlW5+cX2RPo8IOxs940SEAmEO+VHf0XucI94=;
        b=dobyos9Y7vZGR1oi5C0VT17p0k2LEgydrMzNZTlXSKrlJwOFKRaN7uumoas4TEBqtU
         iPffoBlKerTS+fjEK8F0tZmSLJZ3G2F4X6bSkA8T0bI7P9822Z0L0Cxy9Dw3lLR2OwuV
         7JcFlcLTAYxaVM+PwxyP90iH9hbLUJ2qv/GToJayK6YONJZ7K1KJCEnvaTLqtlZfSLMl
         gir8gkC/MtVvzAWN+2NjlwkOp4XYsocsUP6s1bId/b2qKpY3aOl/Zlq+htFKuXXbA4yj
         oS4/ie2tZHHoi7IHtCbiGoQtihTLts10ti0q+tmNe5U/5QKkbO2fVyf1AdE+gWyrOput
         8cbg==
X-Gm-Message-State: AOJu0YyRHYKJXAEtAZ7r6MX/fIi8iM2/suczXt6TpaDIPVs0R/0vN/kt
	VHxinnA3Cmk2sRUVPRbJlMin8rupAC2ZzKacIFN9zvQA1Yh2+c/3
X-Google-Smtp-Source: AGHT+IGl3wePyS9+OGGikNHLu/p+1yRw5d9LmfWZ14mZ/z74l1e5tcdEPyQb61VsUV86TxopAd1iaA==
X-Received: by 2002:a17:90a:be09:b0:2c9:6514:39ff with SMTP id 98e67ed59e1d1-2d646ceaf36mr1690163a91.33.1724410636480;
        Fri, 23 Aug 2024 03:57:16 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb007csm6002277a91.44.2024.08.23.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:57:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2E3FC4A97F1B; Fri, 23 Aug 2024 17:57:13 +0700 (WIB)
Date: Fri, 23 Aug 2024 17:57:12 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: regressions@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v3] docs: bug-bisect: rewrite to better match the other
 bisecting text
Message-ID: <ZshrCGhRc_GNTGQv@archie.me>
References: <74dc0137dcc3e2c05648e885a7bc31ffd39a0890.1724312119.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SnGmfupdkIm6l7Y9"
Content-Disposition: inline
In-Reply-To: <74dc0137dcc3e2c05648e885a7bc31ffd39a0890.1724312119.git.linux@leemhuis.info>


--SnGmfupdkIm6l7Y9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 09:35:33AM +0200, Thorsten Leemhuis wrote:
> Rewrite the short document on bisecting kernel bugs. The new text
> improves .config handling, brings a mention of 'git bisect skip', and
> explains what to do after the bisection finished -- including trying a
> revert to verify the result. The rewrite at the same time removes the
> unrelated and outdated section on 'Devices not appearing' and replaces
> some sentences about bug reporting with a pointer to the document
> covering that topic in detail.
>=20
> This overall brings the approach close to the one in the recently added
> text Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst.
> As those two texts serve a similar purpose for different audiences,
> mention that document in the head of this one and outline when the
> other might be the better one to follow.

LGTM, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--SnGmfupdkIm6l7Y9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZshrAgAKCRD2uYlJVVFO
o3SVAQCI9VX9gg2/YKIYtO6+SQ9ElGYMdtUeUmulCdxAWqkHpAD+NWWRsV7ZAOks
7IsyHJEzDeLWOXacfkwDebAK1d8ypgU=
=CPYs
-----END PGP SIGNATURE-----

--SnGmfupdkIm6l7Y9--
