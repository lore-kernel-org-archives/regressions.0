Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700819443
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frtEId0X"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc58219376so60622805ad.1
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700053454; x=1700658254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkYOVnrNszXvWvkQGHx/ExOJXa42vN+162FNhiylr54=;
        b=frtEId0X+SAlGNj5gRjGdw1gQjEtU5zruxnSrV2wFj7kXJ4diwEjKLxiQmhxY0e9ri
         MZKgyFEcriUzre58CKfFTZKD85oETbomFvDzCKWs0TDFXFpUa2HWmyM1xvkc5OPeOJUa
         IeCytCE8NEF4i3wAIp7OvvWz8IF2uIvcCv9t+FFyVki6hlg7duNzzHZMiorpm0n+tU6P
         BZoiOmZiY/fkGJA9MbAKfUXcr4uVmGafmGeLui1jaSZnJGXEDE0GwRgUMEu7YILkZRyq
         JK7D9+ItgihpcjhRhzroRRBsxa9Lq8V38XgJFYPBe1Qufp+Qt1X+BvWM2q8Dy7anFg4e
         z5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053454; x=1700658254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkYOVnrNszXvWvkQGHx/ExOJXa42vN+162FNhiylr54=;
        b=pyoEKdOWMVzUZz+0DrOI3mXVbXtzEAghaDNv/MThK85fGUTHzrFSUrEoTNlJw6/V28
         3M/1/ZYtXChaVgq1qcwpUhv2/afBdMeuqJiiJX9Ti82WbOPL8ado4VWhW/Ox9i+0/x6k
         gGKnuAWvdtLuquFimwWzsA6/cqDFtxJMMloC5rFItGSmJ8ZMRr/OB+kXbhNqIUtZ0Ngy
         AtcEtEt0jv6MKr7OXcLX5U98fsDplZla7OmIGsJIyGzWr9c8ONOd2BvuIyzaNtw0P0UZ
         UXYaciycLtp0ipShGGWwNeb/x/4edgXCnlxBY+jx1Hm27sHesg5uiWKb8jCSqlRUnom2
         ON6w==
X-Gm-Message-State: AOJu0Yzi9Eq/sxh723bY7BJ+FZkAiHsqRk7SAT9UaXrEUXbfFUZnHjui
	ofasVl1urfT1pNNGMoxfjdY=
X-Google-Smtp-Source: AGHT+IFoJc5v2jLX5P6naZxuHnJGL8hluqhvmcPS71ADf+fwTIah/n7HHi6vjowFiwV9Es0U4e+6Hg==
X-Received: by 2002:a17:902:e88e:b0:1c5:6157:f073 with SMTP id w14-20020a170902e88e00b001c56157f073mr5749438plg.11.1700053454452;
        Wed, 15 Nov 2023 05:04:14 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001cc2c6cc39asm7327074plg.243.2023.11.15.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:04:13 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2CD7C10D2CF4C; Wed, 15 Nov 2023 20:04:08 +0700 (WIB)
Date: Wed, 15 Nov 2023 20:04:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Regressions <regressions@lists.linux.dev>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Andy Gospodarek <andy@greyhouse.net>,
	Ivan Vecera <ivecera@redhat.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Anil Choudhary <anilchabba@gmail.com>
Subject: Re: sr-iov related bonding regression (two regressions in one report)
Message-ID: <ZVTByHx1HfYds_v-@archie.me>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
 <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HhXcdjV1bC1Xdz0l"
Content-Disposition: inline
In-Reply-To: <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>


--HhXcdjV1bC1Xdz0l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 06:50:26AM +0100, Linux regression tracking (Thorst=
en Leemhuis) wrote:
> On 15.11.23 01:54, Jay Vosburgh wrote:
> > Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >=20
> >> I come across LACP bonding regression on Bugzilla [1].
>=20
> Side note: Stephen forwards some (all?) network regressions to the right
> people:
> https://lore.kernel.org/all/20231113083746.5e02f8b0@hermes.local/
>=20
> Would be best to check for that, no need to forward things twice, that
> just results in a mess.
>=20
> >> The reporter
> >> (Cc'ed) has two regressions. The first is actual LACP bonding
> >> regression (but terse):
> >>
> >>> Till linkx kernel 6.5.7 it is working fine, but after upgrading to 6.=
6.1 ping stop working with LACP bonding.
> >>> When we disable SR-IOV from bios , everything working fine
>=20
> Makes me wonder if things have been working with or without the OOT
> module on 6.5.7, as strictly speaking it's only considered a kernel
> regression if thing worked with a vanilla kernel (e.g. without OOT
> modules) beforehand and broke when switching to a newer vanilla kernel.
> If that's the case it would be okay to add to regzbot.
>=20
> >> And the second is out-of-tree module FTBFS:
> > [... skip OOT stuff ...]
> >=20
> >> Should I add the first regression to regzbot (since the second one
> >> is obviously out-of-tree problem), or should I asked detailed regressi=
on
> >> info to the reporter?
> >=20
> > 	My vote is to get additional information.  Given the nature of
> > the workaround ("When we disable SR-IOV from bios , everything working
> > fine"), it's plausible that the underlying cause is something
> > platform-specific.
>=20
> Maybe, but when it comes to the "no regressions" rule that likely makes
> no difference from Linus perspective.
>=20
> But I guess unless the intel folks or someone else has an idea what
> might be wrong here we likely need a bisection (with vanilla kernels of
> course) to get anywhere.
>=20

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--HhXcdjV1bC1Xdz0l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVTBxAAKCRD2uYlJVVFO
ox6sAP40u0SKVLzT4BNbDjtm94gpIOlXkZH3Ws+BPEiboL4k3gEApxdqq7NlgEAD
GyJzIx/ubZyOfPDwwwJIr67RSLUaZQg=
=OikB
-----END PGP SIGNATURE-----

--HhXcdjV1bC1Xdz0l--
