Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5471A5A8
	for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 23:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsHy4lpR"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c2066accc5so1197159a12.3
        for <regressions@lists.linux.dev>; Sun, 19 Nov 2023 15:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700435709; x=1701040509; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6/k5GA4Zu2CBZHKMjmxzODMRb4rQCOlqXBDpojsfK4=;
        b=IsHy4lpRl6ObayFO976OZdcZoE4JiqIdxefUMnQwYZmt0G6Webk9BhcGIj5meYj39j
         PRC9orby4Z2VH10VpFDNo6pRvbQ7NoSE38Hqy3rqaoFm0zsuJ35NsWblZqvKOJVs38aZ
         mPUva3fo5HVAXgi9qSDnAHqejOcmi09HtTx4J9W8Tn+oFho8fhwb9XY9YmCHqWpSzOLf
         AWwRZNong5VhXj4Mdq13ipa1aehxfpRyud6hyIzpVmi64FViHtj8+Hf07OToui3t1PIb
         caiuFBazLJ5IVuUxkRqHHoT1kGV2k2wIndU1DxOYd3WnOsuvCWpKT6AdIetBt0Fcb7mi
         IPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700435709; x=1701040509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6/k5GA4Zu2CBZHKMjmxzODMRb4rQCOlqXBDpojsfK4=;
        b=jXjGpZB/ggbSSXym32BFcD+FCJCYWjTdIo57bTjX2u9qTYA/ywqJxcUWSsDeF4ky96
         dlQfxDNtkOKfSF0P8Q+ZHZiKhAglmGlyvxytguKZweJA2QksQufLJUOeTOQXujun/o6X
         kVomxjChVqtHBz2eocxsTpxVPMVydmGJmkhood6SEe3mAIPiOCVAbGcZw2hNnWzApDHh
         DHTkN+wcTsXD+0OIALzQpFIkL+Y0ApyUxCCVgilI8BEF37SuYZxqctOJhNY6D9it+ooe
         1QjVN663lsNxrEJocPCSbLoSeZQZ0R3IPEup6/RvhFejSfHAJJ+/zH92DeA/hTa6/S8M
         qN9w==
X-Gm-Message-State: AOJu0YwjlEO5UsulPxbzzU7T6Z3vm2b+d9mRJctpFQjw5nQfL4lJwZXP
	6SP/jHOWkt2UzrpHR4kAFbA052Pywfo1pw==
X-Google-Smtp-Source: AGHT+IGZD+EOLCB2oniF4xIOMnu0nOKZnxU9Sb/a4aFuMwwTyHgjsXLjF0jrEAksNzjiyG0JL5bEQg==
X-Received: by 2002:a05:6a21:9812:b0:187:72e7:6d8c with SMTP id ue18-20020a056a21981200b0018772e76d8cmr3714726pzb.31.1700435709219;
        Sun, 19 Nov 2023 15:15:09 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a1fca00b0028010142010sm7148064pjz.21.2023.11.19.15.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 15:15:08 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AD6CE101D818B; Mon, 20 Nov 2023 06:15:05 +0700 (WIB)
Date: Mon, 20 Nov 2023 06:15:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Kunz <donatusmusic@gmx.de>,
	Linux Stable <stable@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: Found a bug with my gaming gear
Message-ID: <ZVqW-Ux7NM2958MR@archie.me>
References: <bd1a6eb1-a8af-4181-b9e4-c7b8d3af1eea@gmx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4to0E1nKF26Mn34"
Content-Disposition: inline
In-Reply-To: <bd1a6eb1-a8af-4181-b9e4-c7b8d3af1eea@gmx.de>


--t4to0E1nKF26Mn34
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 11:41:34PM +0100, Andr=C3=A9 Kunz wrote:
> Hey there guys,
>=20
> This is my first kernel "bug" report ever, so please bear with me if I
> didn't catch the precise right way to report this.
>=20
> The bug I've found:
>=20
> I'm running stable kernel 6.6.1-1 and as soon as I install it, many of
> my mouse's hardware buttons stop working. I have a Logitech G502 X Plus
> (it's a wireless mouse). As soon as I install 6.6.1 the mouse's hardware
> buttons won't work, i.e. only the two side-buttons would work, not the
> buttons (and/or my created profiles/macros) would. I have a few macros
> assigned to some buttons, which work perfectly fine under 6.5.11 (and
> earlier), but as soon as I'm on 6.6 they'd stop working.
>=20
> Just wanted to report this and I hope there can be a fix.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: v6.5..v6.6
#regzbot title: only two side buttons of Logitech G502 X Plus works on kern=
el 6.6.1

--=20
An old man doll... just what I always wanted! - Clara

--t4to0E1nKF26Mn34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVqW9QAKCRD2uYlJVVFO
o8PPAQCq0F+cAeJ176ztPmrCMvN0ZhNToRKuvLv1ZWZyFDA1+AD+PRj9t7cEmyF5
dFgpz6+r6olAybxIkgk5DXSb/31v9Aw=
=Yfpq
-----END PGP SIGNATURE-----

--t4to0E1nKF26Mn34--
