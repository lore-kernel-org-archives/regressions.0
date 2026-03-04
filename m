Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2502125A0
	for <regressions@lists.linux.dev>; Wed,  4 Mar 2026 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772666478; cv=none; b=dCRvXPNtHz1XRcGxPEqGJI5sGUW8v2isVgDsNIJb+Q7E1MOIiknqo20di1C9JKNtYJ/84LcqEml1YHUjwjPmi+SxdW49oEuoAf2nJ8ts2Oqa6AAjqB2GIZdevnygfrEarHLCN5X1QucnBvh49WngrWgYXs2ioQoD5cE4LVQ+eLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772666478; c=relaxed/simple;
	bh=g+h7yoTYJAJLd1YpGS7KB0fkDtfQ21kQJZKi2fGASKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf7bVbav2pHbLnj0bBRPvfu88n+CT4skUQrPF4h85pUVXNWEIFySp/UdEhGC444h1zC1vP5kms/ISdcoGdwJ4rrH0yhvwAlJr6FKJGGi+Cm8pdt4K8MvJgG01eZsScG+qKew9XyHLG/PHnamUPBlF9voci6oT9bqey4Ofcp7wyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sk6jhx/q; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sk6jhx/q"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829759ca646so606897b3a.2
        for <regressions@lists.linux.dev>; Wed, 04 Mar 2026 15:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666477; x=1773271277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+h7yoTYJAJLd1YpGS7KB0fkDtfQ21kQJZKi2fGASKg=;
        b=Sk6jhx/qgNG4yM/nCILgBziZZDV9kTD1qfyFcHk5Bj30LgHswkJdcMNrfJsWHfhdC6
         oKSIl63FyQ04KJ17AlBUJ1SQPzKZcHaIa2yjBXmhy8woQDUm/olqNlY154coo1P3vm/J
         jNtLWWtM4lPdyXXCL8BQdknYngj3scmtNpaKmfE6iTRV3W5fTnq7l3yrZaanZAbmMo3F
         lrUNOIQibdQ23JX35c5bBwuYfc+aMOtVez3/9cy5rxvhqqAhvyJ0u5Wa+6zUk6N9KAI3
         3tg/96z3lK/4vAPfwFzI/x/6xzS1fh1PbEVOFzmMgLROs/4AdFp6HUH3Fvfoc6hVprlc
         niaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666477; x=1773271277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+h7yoTYJAJLd1YpGS7KB0fkDtfQ21kQJZKi2fGASKg=;
        b=MKS6RZIAtS5NNJLYc7C+gRGvN1UOccBZ7qKFZe/byA1nZS3Ara/XFZ5uLtvQPHAJy6
         nG4g7Wvza6jF8ulMhWhh7amAmxeaqIFBp71kzWOdy4rxPND94rtCgQiY86gmypGrWtfN
         GmmypopPKzWkwghZklYb0J80DlMfsrrR9MFuWrw5shrxmnNvaF8+3xx8IN3BYiJ0NKvN
         kru73J6KSjjCu2MfQP1EtIIksm4y0XVtn+8exhFsi9cyZjjrTBD72wiFK4M/5gn7j0lI
         59MRVyuIenkiKIPZXi4Rby/kEsG4hsEYUYmIHdckKwLq9MAsO7OAwcUPbsDNVW3cf1ZP
         8puQ==
X-Forwarded-Encrypted: i=1; AJvYcCU012Sg3vMW7Ce5Rrikl7emqSmlR4vG3+WGNCsP95mi+QLEymdPGSzwimWge9ANMw0W77cS2rxn1sSnMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6QP2j6U244woaRNP9fIBd0ltqwqGKdy8mCKodQj28RhTV9l3F
	qriO2p5UFDEP2mg07Qz6jLG0YLKdGpoqWb7AR3jEkjICDsV/NzCFF3Of
X-Gm-Gg: ATEYQzwZ9+xCqHv7jZYp7AQ2V2nfItxBhZbpPLibqpJ1C55wJWeNK3dr9VYpWd2TroS
	EemVF8SlBGhKkf0YW/TSCAfwvKAI/xjZuCTFk3nfDZe0BXwoPH976Ye2YkFVSSFz1z76M73slSF
	0JDF5RAfHUIxWjiWaezKapzDKyw0n/ov25JBF56/vF6hrtj4gCO00ZG22wSwEwMMzHUSk9N/6HX
	u9NaMIeyUFijJ9wSyWTvxxDjR6IuOzwYZBO2IqcesZwFngtHRwLNZCe0OhzWb9yfm7nXBJC2RmB
	apqMEMtPa96tGInqzBp7ify0K8CkxFjJYH0pio79uKAFT45r3ONu2lv0IkP8WWU0cFu3l4fVxI5
	x0OQNxGXTOZGKb8KJg0nWV15s9l1G+4sXMz3++w62jItezGDDaxu83pFWArMAoOcactlCPFobUp
	snpkY98aPTglMq1egEbHo=
X-Received: by 2002:a05:6a00:950a:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82972bcf9f9mr3169987b3a.24.1772666476941;
        Wed, 04 Mar 2026 15:21:16 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297faf677bsm776704b3a.60.2026.03.04.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:21:14 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EE69541E88FA; Thu, 05 Mar 2026 06:21:10 +0700 (WIB)
Date: Thu, 5 Mar 2026 06:21:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [REGRESSION BISECTED] Unexpected section title false positive
 warnings on DOC: directive
Message-ID: <aai-Zingex2zOvQZ@archie.me>
References: <aZu9muHK02vPPl8E@archie.me>
 <3e1d90fc-b35f-4785-8263-fd7427c4455a@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7YVX34Y0PT+R42a"
Content-Disposition: inline
In-Reply-To: <3e1d90fc-b35f-4785-8263-fd7427c4455a@leemhuis.info>


--f7YVX34Y0PT+R42a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2026 at 04:31:33PM +0100, Thorsten Leemhuis wrote:
> On 2/23/26 03:38, Bagas Sanjaya wrote:
> > [this is actually a repost of [1] since that thread didn't get any atte=
ntion
> > from the regressor.]
>=20
> "Regressor" feels like a odd word choice here (one that according to
> lore nobody has used before). Makes way more sense (and at least to me
> feels more polite) to say something like "the culprit's author (Mauro)"
> =E2=80=93 especially as the person might have forgotten already that they
> authored the change in questions.

I was using bugzilla lingo, though.

>=20
> > Building htmldocs on docs-next currenly produces about 80 new warnings;=
 which
> > all of them are unexpected section title on DOC: kernel-doc directive, =
like:
>=20
> For now it looks like your the only one to see that problem, so maybe
> it's something that is odd on your systems; and given that these are
> warnings I'm included to stop tracking this as a regression.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--f7YVX34Y0PT+R42a
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaai+XwAKCRD2uYlJVVFO
o2QTAP9jsBY9TAAxQIiBYay4I4iVNg2nRHdKhXsKUqH1GPyycgD/QEjvKI8HT3TR
0JXvx7gDuFyh2MKWqJ/9rPOwV2uWZgY=
=Tawq
-----END PGP SIGNATURE-----

--f7YVX34Y0PT+R42a--
