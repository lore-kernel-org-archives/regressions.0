Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B26C132
	for <regressions@lists.linux.dev>; Fri,  1 Dec 2023 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTpE1FIO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cde104293fso1730765b3a.0
        for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 22:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701412063; x=1702016863; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ESF0WGIvBwlg+QIjn5rf5uGixR8rngjLyzks6l1dy0=;
        b=iTpE1FIOOXziT+5pFU+njqN83XI2qLVGxQP/92byLmAtlppJr0IcEO4WeCB+vaOdB9
         MQLSDHKwRZB35zXO/5JGiGLy6100dUSIR9dadW41JoJ4dVcH7e0JqHS1Pveh9CaI/4dJ
         s2PFw+NOuKcmLs7IfypIJ4IDHt+a1A6NH00zRaPegaPtpZSP7K7QYcRvV3zL2P8OKSN3
         H77zKTVlR0iALVmH2KuEnyL+cjGa/0v+plaidD73CKNRePqh9prOD0Z/m9B1e6F6rcc6
         qcQfLvBzbQsQOTOzQG4Ec/AZQpfcy9GW+PVqkWH5juICsDRFdfCCns3Nz6eda6jt9B2N
         5DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701412063; x=1702016863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ESF0WGIvBwlg+QIjn5rf5uGixR8rngjLyzks6l1dy0=;
        b=cehPipC5aXvzNltJRC/6/YvHgz9AF7U8jF9nDkyGyetWGYMp1p0zzxLCgW2sfwE3hF
         4QRIC4NQxy0AUWT/EOJmie0aa4sAkHV8lEfBL7u4gdZyzupDqmZuUnb8dG7YVDYuH9cl
         ijjvjuB7ryubMvfC7Cb6vqubELhgXTmlStvBYYiX5rZXomQDXfq6yl1DcJKlMEodqN+g
         BZcxV51SGa4Kr+NXIlzx5WwY04GtJywm2vIBNGEB8GigBMjSv1bA2a7LV1lPCjVHITdQ
         b2/lFUm1Gyks4sxwls5M1cpAGAtzSvfDHNDaG4tX2RKhjmvaqtKFZlh7jy05FbN3wwL9
         AvuQ==
X-Gm-Message-State: AOJu0YxiLMfkFZuW2C9LpYT6Ag/l2DOasSHs2E5nKPpgqfDqufJ9mlxf
	1dWCU6GQlQjo13don7cpkNY=
X-Google-Smtp-Source: AGHT+IH1t/sI5mhFPWgD7BUVhhtOgDTivetXMTKcDV6qoGS7+icHd6hR+uzTWE2vZ0rrttlwwl9n7Q==
X-Received: by 2002:a05:6a21:184:b0:18b:b04e:6c30 with SMTP id le4-20020a056a21018400b0018bb04e6c30mr27871289pzb.20.1701412062773;
        Thu, 30 Nov 2023 22:27:42 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001cfb971edf2sm2489807plx.13.2023.11.30.22.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 22:27:41 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id BA3101020714A; Fri,  1 Dec 2023 13:27:38 +0700 (WIB)
Date: Fri, 1 Dec 2023 13:27:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Kris Karas (Bug Reporting)" <bugs-a21@moonlit-rail.com>,
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Zach <zacheryvig@outlook.com>
Subject: Re: Regression: Inoperative bluetooth, Intel chipset, mainline
 kernel 6.6.2+
Message-ID: <ZWl82n695TIC7nUO@archie.me>
References: <ee109942-ef8e-45b9-8cb9-a98a787fe094@moonlit-rail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIaTc4XC+xM4WNYd"
Content-Disposition: inline
In-Reply-To: <ee109942-ef8e-45b9-8cb9-a98a787fe094@moonlit-rail.com>


--XIaTc4XC+xM4WNYd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: original Bugzilla reporter]

On Thu, Nov 30, 2023 at 08:54:09PM -0500, Kris Karas (Bug Reporting) wrote:
> Greetings -
>=20
> With mainline kernel 6.6.2+ (and 6.1.63, etc), bluetooth is inoperative
> (reports "opcode 0x0c03 failed") on my motherboard's bluetooth adapter
> (Intel chipset).  Details below.
>=20
> I reported this in a comment tacked onto bugzilla #218142, but got no
> response, so posting here as a possibly new issue.
>=20
> Details, original email:
> ----------------------------------------------------------------------
> I have a regression going from mainline kernel 6.1.62 to 6.1.63, and also
> from kernel 6.6.1 to 6.6.2; I can bisect if patch authors can't locate the
> relevant commit.  In the most recent kernels mentioned, bluetooth won't
> function.

Then please do bisection; without it, nobody will look into this properly.

>=20
> Hardware: ASRock "X470 Taichi" motherboard - on board chipset.
> lsusb: ID 8087:0aa7 Intel Corp. Wireless-AC 3168 Bluetooth.
> dmesg: Bluetooth: hci0: Legacy ROM 2.x revision 5.0 build 25 week 20 2015
>        Bluetooth: hci0: Intel Bluetooth firmware file:
>          intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
>        Bluetooth: hci0: Intel BT fw patch 0x43 completed & activated
> bluez: Version 5.70, bluez firmware version 1.2
> Linux kernel firmware: 20231117_7124ce3
>=20
> On a working kernel (such as 6.6.1), in addition to the dmesg output abov=
e,
> we have this:
> dmesg: Bluetooth: MGMT ver 1.22
>        Bluetooth: hci0: Bad flag given (0x1) vs supported (0x0)
>=20
> On a failed kernel (such as 6.6.2), instead of the good output above, we
> have:
> dmesg: Bluetooth: hci0: Opcode 0x0c03 failed: -110
>        Bluetooth: hci0: Opcode 0x0c03 failed: -110
>        ...
> repeats several times as bluez attempts to communicate with hci0.
> ----------------------------------------------------------------------
>=20
> Since that email was sent, kernel firmware has been updated to
> 20231128_aae6052, and kernels 6.1.64 and 6.6.3 have been tried with no
> change observed.
>=20

You may also want to check current mainline (v6.7-rc3) to see if this
regression have already been fixed.

Anyway, thanks for the regression report. I'm adding it to regzbot
for tracking (as stable-specific regression for now):

#regzbot ^introduced: v6.6.1..v6.6.2
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218142

--=20
An old man doll... just what I always wanted! - Clara

--XIaTc4XC+xM4WNYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZWl81gAKCRD2uYlJVVFO
o454AP9MIcXq6/Q/cKXeCDwHBfao9jagKweZrpopNuQY+UfePAEA0sf9qtm8qbGy
RWIZlhLIdsRwjsQSnLbWDpdspnusXAw=
=/aU9
-----END PGP SIGNATURE-----

--XIaTc4XC+xM4WNYd--
