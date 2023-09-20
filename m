Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367E36B16
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 13:25:05 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c3d6d88231so54609125ad.0
        for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695216305; x=1695821105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFsngITIjI03ksoUl3I+rbp3apjfGwx+AaNpfxzZFvA=;
        b=cvE0NZkG3oyaBY2KtGEmEo2SDR2zAFqkIXMSz9KRySFEpS6f3dGJFI9eIwqJ9evNzk
         Vu/d5hWvkvGKXdC6AlKh3Qc4nhPu+PK7k80SkUWaOpQmsse5cAReeVFR4rkQqrgLpBKc
         h/aUlYABxQf8i2a9+YF87jE4kXlR2+M57q0wPp42TzM9OoeLwZUOaa0JBVjCQY6QYhUK
         l55tKMrukyybAKXv3CGXgDawNPYOwVhcoEcvhYcz0F6YFuuKSEGeXUN+VUYL5StgXBbF
         vT4j9zX4GN7EDTpPSghetRkEy9ZXRPIZyiCRvjy0QMCXCi2l/pNgOI1dwfkf08DvYIWH
         jUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695216305; x=1695821105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFsngITIjI03ksoUl3I+rbp3apjfGwx+AaNpfxzZFvA=;
        b=eqTb3MZ0n66kRbgkn+bndJaRzDvoGHYgsrDOBPxPSOogejZov8AUzp0WNhEdQn4zQ4
         LXTGC41OXCyQ95d3cKjoOGumXNUWWYgg7TItMBqHwul48cNwcltUSbxBy3Qdo03TO5dL
         96W6tGFsUM1VsrbbvaRAx0iFsx14O0ExVa7lkpgJlOZkKVr6Ptg3jAt4laD7EJfA2FS2
         S6MfB8uQPYseLBgC26jHt0mMjjSYHxowslNjw1A9P5v3xORKutstiRliQMEsnQy6nSYO
         lC8EDO7ZSGq4OGLA55l9yTaZ+f3FNArIG4lE8S8kbjkLA3feJiz7A4bNLZnsjx2QTKFu
         CtsA==
X-Gm-Message-State: AOJu0YzPv2JgYtW6+4Pcm7UTx6yQg9zX3HGeOiEAmE3Qnm8vbMvTVtto
	fopV6GEjtWjiqpOz5axO6D8=
X-Google-Smtp-Source: AGHT+IF78yHLXq0/tsXqhz9aHhHttLj+acrfqYJTFo7JzrOoJowfhiof7iZXhhMn5wSH3q2svb8Avg==
X-Received: by 2002:a17:902:ef82:b0:1c5:bc83:556b with SMTP id iz2-20020a170902ef8200b001c5bc83556bmr1427624plb.52.1695216305102;
        Wed, 20 Sep 2023 06:25:05 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902eaca00b001b89f6550d1sm9764574pld.16.2023.09.20.06.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 06:25:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id A697281A3119; Wed, 20 Sep 2023 20:25:01 +0700 (WIB)
Date: Wed, 20 Sep 2023 20:25:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	bhealey@live.co.uk
Subject: Re: [Regression] Bug 216360 - No power to DVD drive
Message-ID: <ZQryrfLC6GPhSCnu@debian.me>
References: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kQV8aQAtfnCna2uR"
Content-Disposition: inline
In-Reply-To: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>


--kQV8aQAtfnCna2uR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 12:13:13PM +0200, Thorsten Leemhuis wrote:
> #regzbot introduced: v5.15..v5.16
> https://bugzilla.kernel.org/show_bug.cgi?id=3D216360
> #regzbot ignore-activity
>=20

This regression looks stalled (no reply from Bruce or maintainers), so
to clean up:

#regzbot inconclusive: no one cares the regression

--=20
An old man doll... just what I always wanted! - Clara

--kQV8aQAtfnCna2uR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQryrQAKCRD2uYlJVVFO
oxi0AP9V1RoATkT1onzX8TGs388i+cvqlb8dv9y9h4AsUT7kaAD/c/ZTvgfvT85L
1nGTIRyiqEan0L4sRDByNdVYrB4dJwA=
=FCi5
-----END PGP SIGNATURE-----

--kQV8aQAtfnCna2uR--
