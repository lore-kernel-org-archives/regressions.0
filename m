Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4A208CA
	for <regressions@lists.linux.dev>; Mon,  6 Nov 2023 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7Me6Bnt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso4583167b3a.3
        for <regressions@lists.linux.dev>; Mon, 06 Nov 2023 05:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699276754; x=1699881554; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=chBp0c2H1AOjgpm073E/0LSCNHycI9DtFBsa1gzati8=;
        b=C7Me6BntKvxOFNrBqeu9huS9QRxjo1b37m6UfGhIhazmoGQos+LSsmisW4zNZ8oJ44
         tZ7hbzVAej8Xelu3k3NyST4MU9WSWtwHghpn99JP9C+yC7Ytc2/nyVWAc0wN6EURgeYu
         5cP7rLF6mdShJv4+Bpinawj9/M3y6M7ptqrogq60ZCC6fIM1hf0HJILaS/ih6JZSyVnO
         kJpKuWjrp5zlI+VlOyqF2xrZMeg8Toz9EUOySv908BfZVXciLf8wnxczh0/zkgV2s5r0
         GqUceKub008xc57ePsKtCMAfERykX1PFh4z+kTiTSYVp2lN+lTeCzJxV05DWHblQ3UEB
         UDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276754; x=1699881554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chBp0c2H1AOjgpm073E/0LSCNHycI9DtFBsa1gzati8=;
        b=CajTXjMhkE9dL8m6h+24kUCJEkW/vPlXAFw0EdDsbkSYxvNIClJzF5MMBQkBerBv+i
         JNhAFB7JO0kyttCgJxvvobyKkiwXzkFmshpTiUpL+gO9BtbPa3JWglsB3bF44GPYRkVl
         pi54Vuou9xy67Mp99D1p47ipL6axs66VnpfRrx5HjQDBApZWNGt12XKNY9S5T4cP72+5
         qyTyILzzd1Q+XBmg5gca2IoHBQrfhl8Qnpu8HD+irer023CgeYCdMqUgLPRkV8lXgUaT
         4GBvoHifexoDppuX+VDvom79Fd/CfVSsV0tWQAGAE3gRnWyHknbiLtYNgjCtLLqglA0w
         koyA==
X-Gm-Message-State: AOJu0Yx/cJheKsIGI3MrofnD3xrg7wd4X6MiZw8hsyWiln0nIjKuIuJP
	vldRdD38aVGYl06FTGycp1M=
X-Google-Smtp-Source: AGHT+IHUQ6Z7qSYKU+hBoeLA+kbz9hl5AQRtQpiHAX90PUW/NvlibvuwgpYKImASI5xzCqd+qJkj/w==
X-Received: by 2002:a05:6a21:6da2:b0:17e:2afd:407b with SMTP id wl34-20020a056a216da200b0017e2afd407bmr38264150pzb.9.1699276753788;
        Mon, 06 Nov 2023 05:19:13 -0800 (PST)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 13-20020a17090a004d00b0027782f611d1sm6096806pjb.36.2023.11.06.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:19:13 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id EB878815BAB0; Mon,  6 Nov 2023 20:19:08 +0700 (WIB)
Date: Mon, 6 Nov 2023 20:19:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux LEDs <linux-leds@vger.kernel.org>
Cc: Tim Crawford <tcrawford@system76.com>,
	Jeremy Soller <jeremy@system76.com>,
	System76 Product Development <productdev@system76.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Johannes =?utf-8?Q?Pen=C3=9Fel?= <johannes.penssel@gmail.com>
Subject: Re: Fwd: sysfs: cannot create duplicate filename
 .../system76_acpi::kbd_backlight/color
Message-ID: <ZUjnzB2RL2iLzIQG@debian.me>
References: <b5646db3-acff-45aa-baef-df3f660486fb@gmail.com>
 <ZT25-gUmLl8MPk93@debian.me>
 <dc6264c4-d551-4913-a51b-72c22217f15a@traphandler.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mLSYxFe79vSgKXQn"
Content-Disposition: inline
In-Reply-To: <dc6264c4-d551-4913-a51b-72c22217f15a@traphandler.com>


--mLSYxFe79vSgKXQn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 04, 2023 at 01:01:56PM +0100, Jean-Jacques Hiblot wrote:
>=20
>=20
> On 29/10/2023 02:48, Bagas Sanjaya wrote:
> > On Thu, Oct 26, 2023 at 02:55:06PM +0700, Bagas Sanjaya wrote:
> > > The culprit seems to be commit c7d80059b086c4986cd994a1973ec7a5d75f8e=
ea, which introduces a new 'color' attribute for led sysfs class devices. T=
he problem is that the system76-acpi platform driver tries to create the ex=
act same sysfs attribute itself for the system76_acpi::kbd_backlight device=
, leading to the conflict. For testing purposes, I've just rebuilt the kern=
el with the system76-apci color attribute renamed to kb_color, and that fix=
es the issue.
> >=20
> > Jean-Jacques Hiblot, would you like to take a look on this regression,
> > since you authored the culprit?
> Hi,
>=20
> The offending commit stores the color in struct led_classdev and exposes =
it
> via sysfs. It was part of a series that create a RGB leds from multiple
> single-color LEDs. for this series, we need the color information but we
> don't really need to expose it it via sysfs. In order to fix the issue, we
> can remove the 'color' attribute from the sysfs.
>=20

OK, see you in the patch!

--=20
An old man doll... just what I always wanted! - Clara

--mLSYxFe79vSgKXQn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUjnyAAKCRD2uYlJVVFO
o00MAP46Ar3NgVvRankXk1V4h3zoLCr89KoQ1Lfibtd5doJaUQD/cn2uxDs4aSlz
/9jB4eJEcHBWxonDhaWcpvJGoxYoRgw=
=lEvF
-----END PGP SIGNATURE-----

--mLSYxFe79vSgKXQn--
