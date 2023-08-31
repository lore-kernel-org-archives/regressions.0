Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEC079F8
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 09:53:34 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a88c422e23so316346b6e.0
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693475613; x=1694080413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GDJQNvk1I3RU9eHa9L6NV+dyMRSPGsdEAWk45bEPSw=;
        b=lrc1AKItI+3wzItcmDo2v7/crbO13UyQYPPVr44Ac1HLm2P2R1GwjRQD7XP+OGVY4S
         6mu6ih3nK5CexksgwqCIt2yNJbPVipKbCVgi/VusejH6b96y+vN19tbopVWTNCIiSKYW
         zNRLFzl/0Ev1Zxk0iFTN6fahGuMjena9JZQAu9fcl+VwYuYnIZKMR278Onoy11gI14Q/
         2ljBhCeGEl36H3mXypkhoRf2CN1a/eRp+R6JAb2Zx3Vy4Jd3EtfDpA+5jsaRdw6xPmkj
         eacCck3Fuajdw6kIQkol3RCXORKLY59AV8RVa8hKcDGxpsMGfyc83uQsucg5KyR9FN5y
         LwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693475613; x=1694080413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GDJQNvk1I3RU9eHa9L6NV+dyMRSPGsdEAWk45bEPSw=;
        b=ZsdaleOIa/0WvlGQRc/Cu5llfJ5vUrKJgqB7trgICpbat25i1AQZhE/j+fdzqIqJaG
         +21QzcDX+2g4lYA387JWC3DWWUuTvrbdYOwM5B+Cqu7dGqNZza9l5TLVi03IwdTkVWNx
         gnRktvXYr0pQv3bthhMNjTaWLvJiS/vRl+SONZ+ffXp9ZKsljD79jHRBAkf4OCs7+Y9i
         9KUQhzz3WEvscy9dh1FdGWilKAVrJ4Frb2kqDG6hhSAsQDz0m9wFoT4Dleo1+iRXBNbe
         ycnDSLUQytsWUdWOYDS+NySbCfUtM1lnahVKiHlo1837z8Vf6vIi+n994xfiTanSK4kN
         hBEg==
X-Gm-Message-State: AOJu0Yzae3mHWml1w8qpUCHnMrqA0qBAoGwTgIui9Qa6E4shCeKQ6jwO
	ur1/cWGb1iXc4jO5bzgx4MI=
X-Google-Smtp-Source: AGHT+IFuTxBBnsClMiDGJuvLuCYgceaKjoXiFCmcN4xiYtVXao8M2f7wxtZGIsYY6C6Re0yFiTRAlw==
X-Received: by 2002:a05:6808:210a:b0:3a7:72e2:f6be with SMTP id r10-20020a056808210a00b003a772e2f6bemr5295000oiw.2.1693475613564;
        Thu, 31 Aug 2023 02:53:33 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id v3-20020a655c43000000b00565e2ad12e5sm924535pgr.91.2023.08.31.02.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 02:53:33 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DB0A18BF2F99; Thu, 31 Aug 2023 16:53:29 +0700 (WIB)
Date: Thu, 31 Aug 2023 16:53:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Frank Wunderlich <frank-w@public-files.de>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alex Riabchenko <d3adme4t@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: regression with 33140e668b10 thermal/drivers/mediatek: Control
 buffer enablement tweaks
Message-ID: <ZPBjGWPjSfl-HmDJ@debian.me>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RJwfJEiQhwB0+FtO"
Content-Disposition: inline
In-Reply-To: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>


--RJwfJEiQhwB0+FtO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 11:25:11AM +0200, Frank Wunderlich wrote:
> Hi,
>=20
> The commit 33140e668b10 "thermal/drivers/mediatek: Control buffer enablem=
ent tweaks" is merged between 6.3 and 6.4 and causes a regression where tem=
perature cannot be read correctly at least for mt7986/Bpi-R3.
>=20
> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
> -274000
>=20
> after reverting the commit and fixing some build-errors in 6.5-rc7 becaus=
e new members used in mt8365_thermal_data too, we can read temperature on m=
t7986 again.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 33140e668b1020
#regzbot title: incorrect temperature on MT7986 due to tweaking buffer

--=20
An old man doll... just what I always wanted! - Clara

--RJwfJEiQhwB0+FtO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPBjFAAKCRD2uYlJVVFO
o0mFAP91QuKCfgQVlixmP/Pv1pO2ZddoCUNEegbRBqxDSCFtvAEA+K4HSholbqcJ
NGGQtAZxl6iJbR5W9KtqFAjrr34MLgo=
=1gyx
-----END PGP SIGNATURE-----

--RJwfJEiQhwB0+FtO--
