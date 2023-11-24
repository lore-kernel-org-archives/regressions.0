Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E14181
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwVB/+r+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cf6af8588fso11447125ad.0
        for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 16:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784939; x=1701389739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOQxpoxQBCNJvC6K8xY7JNQFw7lekkoXyyaiOUVybHI=;
        b=lwVB/+r+JAZTk36TXD78BKiIlgKRoHLtLbNvMNR9OjrOjViVzDnsb+I2l7hVbcOQcs
         0W+7cByBMkUIX1TmZoeGdaahx0doWo/BnFkZakUAhMTSyZNQaJ251HuiYmoHw82f3Ups
         FZaOpdjAyaI/eIgVu+H12DrtSVcNwBcu/ML9owT2C6fzsw7ODFiO1652G1fUUGod7eXN
         DIDdIp8r+rrJP7W/Nf7vYnRVF0/SBQxoQsJ4P/pE2QoJ98/DFL5YH951Zq52lrxngXtz
         jV3Bypd4cQk6WUc7bsY8MqSfFw3OeOj2yZwJ8dnwJ3FgAvIxkGWYEMKzQ/lSm+IXvz4K
         zLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784939; x=1701389739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOQxpoxQBCNJvC6K8xY7JNQFw7lekkoXyyaiOUVybHI=;
        b=W4CXiO+fxDQtuxNAJwloI6q0fcPyI2wa9YEMEbhzWhUcShqsVTXX3ZY5iA2jR0fY45
         H1CLyHHbpr83nPmQ7y3OSNkrW+pjwVQifXHvUqc39gypYvUUI+hkgAkbD/a8VSF/rzXr
         PFIeLjH2uFBeSYawsFZi0P6t27O49raEVx/jePIHhkQ40ffCrgwmMPmFM2+3W/S274eR
         S4w/qi5qLIkowTZpK3/Nj4OsAUqPHGD/Ijgd+wqBXHKrk7ki7dYllYQuQbGnOOnB2n3V
         fd/Bomrl3KUsfrpv15cedgUcYz3SN3/eYoQw1uvx1n27r9eoo/vAUhA7pD98OiTyd9z2
         M+Mg==
X-Gm-Message-State: AOJu0Yw4hAkB8kmO2tNb/u2huWxTfW/JOOx3tqu31Mw35bN8GbPEEAuO
	xhYii6qSxs4YGeY24Enitcc=
X-Google-Smtp-Source: AGHT+IF2N+iIqdw7ZHI5UTpWEk8mydR61zWnnhEX3hodaYJl763l3Si0dDToYHt8dV9hcaqvgpGxXA==
X-Received: by 2002:a17:903:11c8:b0:1cc:511d:eb43 with SMTP id q8-20020a17090311c800b001cc511deb43mr1032137plh.61.1700784939083;
        Thu, 23 Nov 2023 16:15:39 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902b94700b001cc2ebd2c2csm1907659pls.256.2023.11.23.16.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:15:37 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AD2F310210547; Fri, 24 Nov 2023 07:15:34 +0700 (WIB)
Date: Fri, 24 Nov 2023 07:15:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Chun Ng <chunn@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ankita Garg <ankitag@nvidia.com>
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Message-ID: <ZV_rJtxdn1dU9ip0@archie.me>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me>
 <ZV9x6qZ5z8YTvTC4@casper.infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EoRIruQuJ6zaLywE"
Content-Disposition: inline
In-Reply-To: <ZV9x6qZ5z8YTvTC4@casper.infradead.org>


--EoRIruQuJ6zaLywE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 03:38:18PM +0000, Matthew Wilcox wrote:
> On Thu, Nov 23, 2023 at 12:07:40PM +0700, Bagas Sanjaya wrote:
> > Anyway, I'm adding this regression to regzbot:
> >=20
> > #regzbot ^introduced: v6.0..v6.1
>=20
> this is not a regression.  close it, you idiot.
>=20
>=20

why?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--EoRIruQuJ6zaLywE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV/rJgAKCRD2uYlJVVFO
o6hyAP9fiTuPiFsneZoBQnhzNsR1BsG/B71Gz5mNrcD7gDPc2gD/UyYGMzZWtopz
kk8xCnTgdiyHgKx8WzJEMF+Hmw+T1g0=
=i6TV
-----END PGP SIGNATURE-----

--EoRIruQuJ6zaLywE--
