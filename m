Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91FE15B986
	for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056936; cv=none; b=CkM66z8KTyHaqu1dEE+CotpOq2G4X/74IrlA6uJ2uAnZ9eES35nYwD1xLOEPRqZNx/um6UdPVshybVBPJZRI8+w+YfG+T1iuOphOyzA/MPy6U0fWTcXeW8glxHbHTqBlM7omC2kT6c4R93P6KPCQoEfQGWR3nKb+wQ2xS2EGi3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056936; c=relaxed/simple;
	bh=PGZHOvJ3I/sGSsvElOZ3BaRzkT4FOqGOtisCrn6fvqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvCYLahSwC7i148/SG2tZJySBHdNyekAGuI2Aa5M+7eLkDiGtwDPk+fAGN3XgBObeneIhqmYPgjtLuM6Z0/XJBUuJcGEyoysvUWrJjRZFWkhfCbLaevu6BBBsQzorvaLWceiTPGGnylhLdfgvgOhnqjmULaYy35tKrHYHKaEOuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6kB6Xyd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6kB6Xyd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-202376301e6so4769665ad.0
        for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 01:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724056934; x=1724661734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGZHOvJ3I/sGSsvElOZ3BaRzkT4FOqGOtisCrn6fvqo=;
        b=H6kB6XydaxDw/pCEGq/rdeM++PcIV6QUx1OUm49u09psF1Qf3K/Cx66d4SjeQqxkVH
         EiGdk7xTHqHNbaZv0bAMR+kD/PF/Y2VUqu2hitMUqkeTcmkUhy5Ua5fdKdZ9/hd++VZZ
         bWCEFr3Q73nOhE/hxhnu472Xlku+KoUDhm5vsLfZSRSfP20ekRnCmnEfXZxMlmcab4xM
         AddrcXAZgnC0J/trpawZuEG8E+Yf5tV6zujR6egi/ajaE1ueIsGJ/NK1u630aU5/eh99
         Zy7L6kvePEeSTj9A/iS4A6FBFGXUoOvpeE20xo0cFS16iuKc1slwTEciVTFmLBVq2O1p
         skVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056934; x=1724661734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGZHOvJ3I/sGSsvElOZ3BaRzkT4FOqGOtisCrn6fvqo=;
        b=ivLLWgjnzMwiC5skJmXkxwDacoNDyicWNg8FK+durbzCeauya2Co3Q80duSJij1NRN
         sQCbGRuTdULvzuM2yrUNeBqYkD+Fy8r5dkMydWmN8UCfK8JSl7C81YSbYGnLY5RnYNLL
         tPSWWFfBIhch1cVoUhbefI7et9IjQc/P+1Tz0emgijaHiD/V306lUURxVno9h7IWU9qZ
         NjLdrKVQcGGVT5Y/ouq8c4hp80GWJWUZnUQK6KbABOCrkH0CQ8wgwYRF6K+3O4VVUpUq
         Q9L+7u7aoMyl5Q8vWDIK29Q7EQrsg2dbQ06FLs1LA1SbS9+m4A8xJnbbA0b+CEnGk6eK
         RHew==
X-Gm-Message-State: AOJu0Yymzenxd2MmoDzpTY2IzEJs8RQR23WDFCbMlRcIU9tu6xKrTeAK
	2n8itRd9/HObMHNaYE5mN2t5EOhyWz64ccVjd04MQIITHe2eE+kxS+v2TA==
X-Google-Smtp-Source: AGHT+IH8SJoDTYfYGz7l1cO0TAPnu6MgibpGDFz1bUdQ2iWqX54EE35IqxQA8L2v7vNWAVB3QWu/QQ==
X-Received: by 2002:a17:902:ea0e:b0:202:3e32:5d3a with SMTP id d9443c01a7336-2023e326545mr24339245ad.26.1724056933917;
        Mon, 19 Aug 2024 01:42:13 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f037895dsm58858255ad.155.2024.08.19.01.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:42:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 923474935788; Mon, 19 Aug 2024 15:42:09 +0700 (WIB)
Date: Mon, 19 Aug 2024 15:42:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: regressions@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v2] docs: bug-bisect: rewrite to better match the other
 bisecting text
Message-ID: <ZsMFYRzba6cf5v_E@archie.me>
References: <fbeae4056ae8174f454c3865bc45633281bb1b31.1723997526.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pS632mJ10TyJMNVd"
Content-Disposition: inline
In-Reply-To: <fbeae4056ae8174f454c3865bc45633281bb1b31.1723997526.git.linux@leemhuis.info>


--pS632mJ10TyJMNVd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 06:12:13PM +0200, Thorsten Leemhuis wrote:
> Rewrite the short document on bisecting kernel bugs. The new text
> improves .config handling, brings a mention of 'git skip', and explains
> what to do after the bisection finished -- including trying a revert to
> verify the result. The rewrite at the same time removes the unrelated
> and outdated section on 'Devices not appearing' and replaces some
> sentences about bug reporting with a pointer to the document covering
> that topic in detail.

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--pS632mJ10TyJMNVd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZsMFWgAKCRD2uYlJVVFO
oxYKAP9O/K/Lvo59SJjRHKJ2qQp3tKXCIPyg2s7DnlLhwr2GqQEAh2Vl4S5BD3ez
BDuXXN1nrniU70JJvlrxiZVKQmS8NQ0=
=O1gW
-----END PGP SIGNATURE-----

--pS632mJ10TyJMNVd--
