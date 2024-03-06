Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2806B130AFE
	for <regressions@lists.linux.dev>; Wed,  6 Mar 2024 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709731629; cv=none; b=qss8w5gw9juUo+9FPJNYLcBKBhPldHLwOqPKWXBEQ8W47YoQ3C1kqftj+gQkNfD4A0bL5oLkw+WZ6jYbkBiG9fFIFVkTu4K8FB/Rt1Tz1xFPlxzl0isYvAqOwfLSYMXnExuTgd95tmNTVTX1IH5l2wd5bUJiBuixAz6gUoMeezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709731629; c=relaxed/simple;
	bh=+sPm+oKCXQGcQ9Lw/Yo0t+Ryp5HfmG552sHNArAQGDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOxlD7Pm6dkk2zwVgnZqDwbJKkfkwh1X+DKJD+kTfP8aFk6aw+zmX/GFeV7NI1Vkyb/cr/VjUVWFyaeqL7UM50NTB6YnOiKsyHCr0zLgQPo4WAu/Nk/JIQQHzwfy6fEVDE+w8F1ycB1vRM23RACGCYagY5CYctBIqfOsYu/xkgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6q/Adf0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6q/Adf0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd3bdb6e9eso3892875ad.3
        for <regressions@lists.linux.dev>; Wed, 06 Mar 2024 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709731627; x=1710336427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RiLQ/Gwlknvzeh2DwRC01mhrnxKX+BxC7evLtK7aSHk=;
        b=g6q/Adf06ZbdSHU9v1klOgNK7AeqeFJbwUUqejrT7rhGcUbpe5YTOw/CjbEEaBtNzD
         kuMamaJ+YUmsMqseH0WtqfDVIg3ydQHrKVfb3+MBpTiCGca/nd701NY6P+BDt+hzQMXe
         ZNeVniMchGokkHZpp0CXKL5J4GccdoyWVjFrNqo0XS7KzzVyiBzrwHEciNbxOfYwuEj1
         Lybgbfg1fZiGxyHgwoNcu/bPDxEGUnIQyaA9Nn6ZvMewM07fkGbxkj0bbls/YcQ7/2M5
         xOg826HA8jEAFIJfirCdhZBaC0F4LkW9fh8C2JR273cdIzVJ+7mUf6FDyznNLIj1PuR7
         3pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731627; x=1710336427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiLQ/Gwlknvzeh2DwRC01mhrnxKX+BxC7evLtK7aSHk=;
        b=jdtOVtWtbD/9WB5gr4Y38Fwogoa/PQjuRq/jfZjh7XN5loojTXCf3jB4g/tzAUtw4H
         KbBrLzR8oS9PcSqlt02cpb0s4BTR1a6KwQYa/ZZaeXNegLLjwpanPqk4sbyJyBQcgmaN
         1b/+pXGZU0yYwWrOoEmj93Lsw6Zs47xj5R5LxKuQX+o+v9CsIWdWZwTEOtQqskDGrgkA
         4D3Zw1WaBzFBXl76Sonzt2tbv7iZN86aQosObxM6VqWA+0xceT5JTTgXLi6nkECh0TG1
         faAk3/T7fT0sjsutIfFliAXU0E+1t8HSOChQuINHxtBRym9s4H6dCm5eXeru7R1Mp7zl
         VXgA==
X-Gm-Message-State: AOJu0YwUz5oxh+XppRGZcgMZ1FTUD5PTtJ+Ef92X2+zZS3z2u4a5C6ni
	1fo62Rbu9u6wFe540PgiaEAiqyiby7nOkopsbKXM9d1DOnhwMNVl
X-Google-Smtp-Source: AGHT+IGbzpjggy4PP+k4v7TS6DtV6f8SDz9RQOR92oZBLAFBg7AXN3v+tlMA5JaLtbGxDD0Ip5wRKA==
X-Received: by 2002:a17:903:1cf:b0:1db:fd4e:329f with SMTP id e15-20020a17090301cf00b001dbfd4e329fmr5516641plh.15.1709731627409;
        Wed, 06 Mar 2024 05:27:07 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id k23-20020a170902ba9700b001da105d6a83sm12473865pls.224.2024.03.06.05.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:27:05 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E12A918163A92; Wed,  6 Mar 2024 20:27:02 +0700 (WIB)
Date: Wed, 6 Mar 2024 20:27:02 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: regressions@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v1] docs: verify/bisect: fixes, finetuning, and support
 for Arch
Message-ID: <ZehvJv3fDZIPs9Kc@archie.me>
References: <6592c9ef4244faa484b4113f088dbc1beca61015.1709716794.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lazs5xFE0/5FrnVE"
Content-Disposition: inline
In-Reply-To: <6592c9ef4244faa484b4113f088dbc1beca61015.1709716794.git.linux@leemhuis.info>


--lazs5xFE0/5FrnVE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 10:21:12AM +0100, Thorsten Leemhuis wrote:
> diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions=
=2Erst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> index 54bde8bac95c67..58211840ac6ffb 100644
> --- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> +++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> @@ -192,8 +192,8 @@ will be considered the 'good' release and used to pre=
pare the .config file.
> =20
>         sudo rm -rf /lib/modules/6.0-rc1-local-gcafec0cacaca0
>         sudo kernel-install -v remove 6.0-rc1-local-gcafec0cacaca0
> -       # * Note, if kernel-install is missing, you will have to
> -       #   manually remove the kernel image and related files.
> +       # * Note, on some distributions kernel-install is missing
> +       #   or does only part of the job.

Consult documentation of your distribution for how to manually install/remo=
ve
the kernel.

>  Install build requirements
>  --------------------------
> @@ -1076,72 +1078,103 @@ about to build.
>  Here are a few examples what you typically need on some mainstream
>  distributions:
> =20
> +* Arch Linux and derivatives::
> +
> +    sudo pacman --needed -S bc binutils bison flex gcc git kmod libelf o=
penssl \
> +      pahole perl zlib ncurses qt6-base
> +
>  * Debian, Ubuntu, and derivatives::
> =20
> -    sudo apt install bc binutils bison dwarves flex gcc git make openssl=
 \
> -      pahole perl-base libssl-dev libelf-dev
> +    sudo apt install bc binutils bison dwarves flex gcc git kmod libelf-=
dev \
> +      libssl-dev make openssl pahole perl-base pkg-config zlib1g-dev \
> +      libncurses-dev qt6-base-dev g++
> =20
>  * Fedora and derivatives::
> =20
> -    sudo dnf install binutils /usr/include/{libelf.h,openssl/pkcs7.h} \
> -      /usr/bin/{bc,bison,flex,gcc,git,openssl,make,perl,pahole}
> +    sudo dnf install binutils \
> +      /usr/bin/{bc,bison,flex,gcc,git,openssl,make,perl,pahole,rpmbuild}=
 \
> +      /usr/include/{libelf.h,openssl/pkcs7.h,zlib.h,ncurses.h,qt6/QtGui/=
QAction}

IMO qt packages are for people who wish to do xconfig instead of menuconfig
or nconfig.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--lazs5xFE0/5FrnVE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZehvHQAKCRD2uYlJVVFO
o8QAAQDL2QAo686CyoAn0M4a/QzWk42pLsA/+Yxo1q8pRmmQ8gEA9v12OA9wft3g
ear6xki6AjucstJTnmst30tNIF03OAo=
=mmbI
-----END PGP SIGNATURE-----

--lazs5xFE0/5FrnVE--
