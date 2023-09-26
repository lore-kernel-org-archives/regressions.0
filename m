Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F036B
	for <regressions@lists.linux.dev>; Tue, 26 Sep 2023 00:45:12 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3ab244e7113so4738322b6e.3
        for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 17:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695689112; x=1696293912; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZTYZb1O/8biIsQ+eMZWKznGrdbrF4IydOkWiCWQs/k=;
        b=ZDhafv92FrmYlUXp6j/6N+51CZ5RrfqKQ18PC2nSqgl1z7QvR0I3RJFsGo3ewi6HhE
         gD2V+58owEvXRAHSrtGtltuGmhfzF75ueviQxoFbxdaQOqtYN1jyAUFkj8iNErWvokQw
         dRyOGw8vOs1QfVBdnOgsRCYWStS6KXvBkjZ8bANo0sVkEHgpLSYSmlq2gti2phTypcXC
         7jBn6ZyNXyjy9SthYZ0Kt9OD/9myhQ/4iQxYEkRIbybUD63O1KXhzukA1l9SjNkT1vYB
         1zk/YbAiycVl+sbwJB5CU4DD0P8qvu5bz7Y6KkMgtECRZRunxR7l/IC7YuHYmpIrKSE8
         5pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695689112; x=1696293912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZTYZb1O/8biIsQ+eMZWKznGrdbrF4IydOkWiCWQs/k=;
        b=Hx7EnE36TC5CWSOU3Y18eUJIwZrxJYkLER57YnzBIVpiDFOmYwvd/MR6kYNwJw/ZEw
         GK6F+KynH4qgTU7DqpFVuzaivoihUW7eMR/eWkgWjvqDf21VPQSAgNCW4J1TP8ZD8tFG
         OV5Fb9a7JbQ1j2ZK1D7mPJQUwhiMz8eADC/c745FdVxRb+Uziv/b8EVvlX5bCv/gFNLh
         Wz8TrcdrBNlgLZYX+An3jpWD5QwypCjV605MUZnAGK/WUWkW8H77yBKHoBmzjglCjHO5
         QP1D0gAeD5N1TgzcB9/Kh562E5AZ7glfgqKlqdxgliYAkJJZ/K1dwrnLwr1aQFqGX0fy
         rbDw==
X-Gm-Message-State: AOJu0YxxAVNpqdnHREPg/OVd011PuwjiSjZUxBhU0Hde8zjMmSIQuq+x
	X8SJYT3/ofRUHj8ijrj9BLA=
X-Google-Smtp-Source: AGHT+IF8AN+UF9heZkKmaDjpUjAZWoVU+YSjuCe5tseNHNGpYZF4qRiB7SjjovLAdUiD9ZpsCrrWzw==
X-Received: by 2002:aca:1b1a:0:b0:3a7:2524:6d3b with SMTP id b26-20020aca1b1a000000b003a725246d3bmr9240534oib.12.1695689112150;
        Mon, 25 Sep 2023 17:45:12 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id b2-20020a63a102000000b00565eb4fa8d1sm8249080pgf.16.2023.09.25.17.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 17:45:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id D2B848DBA76C; Tue, 26 Sep 2023 07:45:08 +0700 (WIB)
Date: Tue, 26 Sep 2023 07:45:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andres Salomon <dilinger@queued.net>,
	"Timur I. Davletshin" <timur.davletshin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux AMD GEODE <linux-geode@lists.infradead.org>
Subject: Re: Fwd: AMD Geode LX hardware RNG driver produces regular patterns
 (geode-rng.c)
Message-ID: <ZRIplFgg0ZnzGzre@debian.me>
References: <9a28c2fc-d769-4802-a1f2-77ba2cb34d25@gmail.com>
 <ZP2ERFydER7pJprL@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oAxHbzBYWu0jpnr5"
Content-Disposition: inline
In-Reply-To: <ZP2ERFydER7pJprL@debian.me>


--oAxHbzBYWu0jpnr5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 03:54:28PM +0700, Bagas Sanjaya wrote:
> On Thu, Sep 07, 2023 at 06:37:00PM +0700, Bagas Sanjaya wrote:
> > #regzbot ^introduced: v4.14.267..v5.15.127
> > #regzbot title: predictable urandom output on Alix 2d13
> >=20
>=20
> #regzbot fix: https://lore.kernel.org/lkml/20230910083418.8990-1-jonas.go=
rski@gmail.com/
>=20

Fix up:

#regzbot fix: hwrng: geode: fix accessing registers

--=20
An old man doll... just what I always wanted! - Clara

--oAxHbzBYWu0jpnr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRIpkAAKCRD2uYlJVVFO
o9hIAPkBcPsGbXpzy8vEY+n8oazqVd8MEixSApC3y9+Ysyio3wEA9WY8fXAXeXa/
WDJ/grKG9ytZm+3Ucl8J8bIvE4pcUwU=
=rke0
-----END PGP SIGNATURE-----

--oAxHbzBYWu0jpnr5--
