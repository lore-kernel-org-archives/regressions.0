Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8849718B0C
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 13:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwDfUwm9"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35ab17957c3so15695635ab.3
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 05:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700053733; x=1700658533; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2G7KKhFVeQmxaFRbIzLkNzcWPuqBCIhAsSh4RiIuT1I=;
        b=WwDfUwm9GZrbKPw8CDG/4vyIiebp70cvKcln6/Hul6KMPGBnwsNXptZyjmh8R+kJLt
         FpmKaid3xsuLb2Ue1IAkS1JIu/dkr6rChxJkBL4iii3MF9Q4lvRQnuaC0XgeoLRwXGeF
         +a8w/wPBqtmG0oq5bqndkrtKGkA4BmRgKj074DDDo5XFY11eFWSt/WN5G2G3Y4nddzLx
         t1MtGhIQXnnvO7qKxd7d5mpi2ixGc17jQdRITT6kGlk5tMXFKEEJXjAcTPM3I5dNmMqU
         LYOhnK10MzghZrApHxuiCBXhSe7iQOrRbjJkR91s29g+Cu+nz/NQlNE8bR5XPWWxRy9G
         AxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053733; x=1700658533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G7KKhFVeQmxaFRbIzLkNzcWPuqBCIhAsSh4RiIuT1I=;
        b=Zk39qKuWZKZ/bYQxZabZF8bpSaKyIt5qpIh9d4gCB/90exPMjAwx5b7b2uqMUqOQQg
         rAfPdPplREwJlNTUxUZbTtmlng1yql28J1dETuUNFqImb/jpbGENN5ys7pVRk2T2GNji
         1n7ROmEGZxNsyFyVaZOjT63e7uKfy8+RcU0rBQ6/AkILsi5Z8PgxQOWzgh9z4uhu5Tlc
         r11kelW9MQ3j2YOmWdYdxu9ERxTiXY3PP7iGZ9NLgMzuLuPiLfMAYdr473O06DaNxOIg
         0WBYqStHG+b0GZrNia024fBo8PXoX/R0YledGKuwq3vF4fVFpyIOQ//KtZn12AsYS0JP
         40yw==
X-Gm-Message-State: AOJu0YwUX4N8Xr6bD9XmOAmJkmWHdjT9FHPSBLdCWwFDoJwpkG40Un9p
	Hd4UtBWAlnDJTm4qyith8/8=
X-Google-Smtp-Source: AGHT+IGncX9Sp484saKBYPhrt6VsYQAv9Vd4w8EynNKUe9Jg4dSABTLWDpVC1bdKnnXmLG7qErBq7w==
X-Received: by 2002:a05:6e02:1d1e:b0:351:5acb:281 with SMTP id i30-20020a056e021d1e00b003515acb0281mr16123680ila.31.1700053733533;
        Wed, 15 Nov 2023 05:08:53 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g2-20020a63fa42000000b005af08f65227sm1161196pgk.80.2023.11.15.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:08:53 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8D3D210D2CF4C; Wed, 15 Nov 2023 20:08:49 +0700 (WIB)
Date: Wed, 15 Nov 2023 20:08:49 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Anil Choudhary <anilchabba@gmail.com>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Jay Vosburgh <jay.vosburgh@canonical.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Andy Gospodarek <andy@greyhouse.net>,
	Ivan Vecera <ivecera@redhat.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: sr-iov related bonding regression (two regressions in one report)
Message-ID: <ZVTC4WYHVdXpMlGj@archie.me>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
 <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
 <EFC5ADF4-1EE4-4900-B250-AC35656DC68B@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gSEusbUJJj55spLS"
Content-Disposition: inline
In-Reply-To: <EFC5ADF4-1EE4-4900-B250-AC35656DC68B@gmail.com>


--gSEusbUJJj55spLS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 10:13:20PM -0800, Anil Choudhary wrote:
> Its not hardware issue when I do rmmod iavf ping started working .
> So issue is certainly in this kernel and with sriov only
> Iavf id Nic driver for VF(sriovnic)
>=20
>=20

Please don't top-post; reply inline with appropriate context instead.

So you have this regression on vanilla kernel, right? If so, please
bisect (see Documentation/admin-guide/bug-bisect.rst in the kernel
sources for reference).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--gSEusbUJJj55spLS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVTC4QAKCRD2uYlJVVFO
ozl7AQCiSqoKyASKox740kkcu7j+siyKKyJXruoehKgsCPd1LAEA26VtD2CPSqwh
y4FW2w4+L9KPEdjbyzmPH47DduTREgc=
=YJK6
-----END PGP SIGNATURE-----

--gSEusbUJJj55spLS--
