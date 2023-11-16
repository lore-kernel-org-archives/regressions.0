Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C7F2CCBC
	for <regressions@lists.linux.dev>; Thu, 16 Nov 2023 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/On4PHz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2802d218242so521207a91.1
        for <regressions@lists.linux.dev>; Thu, 16 Nov 2023 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700131997; x=1700736797; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6wLYSXzg5tmYqidzmV/DNDn2+dFtQpnSIBReQdUv9g=;
        b=J/On4PHzc+KqDIygPKNfwVGrCuT4G6mys1rB5BXsltnu74kZRUUfAhvT+F5VEOhKyy
         AAT/o96zdXo01A8XeyFnvDn1dlbFJACLx1FabTPxeQZSzjtLM34FFimX9e+UywaIbEQz
         k+xyDBICfH8tJ3N+jsBUUv+4K7bCrj7Jy4hiU6t4vVDst9fu616nknKdvR3ZdX6zwLuU
         wdGgyMGp4ArAYbnUCKPLPkDxFhDlst8RhJkaVTZDRWbddkKwkumdNK/8M/4lB0wpWiat
         mb995VfmSzS2Xgj7F+5fwtgSOb1U+LyR7yfzb0pkAyD4j0JUdudtd42a8C/uOIUjelVh
         NUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700131997; x=1700736797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6wLYSXzg5tmYqidzmV/DNDn2+dFtQpnSIBReQdUv9g=;
        b=qD5zoIRqLxQRvt09ZGxJoAtW22zHet/c9PllPNwMsbQ5twiZxR4dQDmJWMuoGoFXKs
         vVNIhruLBMcjxd7mZp/C16IkSzW68jWZriaVk7HuAt3oy4J9QXsl/6Wz/SRNxBRjarjx
         s/uprNYrr8eFS1jxFP9NjZnSIDsGETx+ZKSCsjKpIj96VFnQd5ScxjvEUs+5RA4Thz8V
         tXlHVynECBIr6KzqQ7lDHBork+lPKQ6jfX+r78fSPASxPSR+yNr6ys/QMu4i3WjRxdSI
         sPkoa9yzxMeKRiztSQZcDMrwam9ZiYn4lAG+OaXfTsyDD3Kwhd4dMK30BjX7CFX4nCFK
         NN4A==
X-Gm-Message-State: AOJu0YxZJHP7GpRU3uKSkVZuyd8v9yhJGy+CjmtznmA7xonN+CPDn/A7
	gpw4WqF8SlWXj1OgHbeVc20=
X-Google-Smtp-Source: AGHT+IHviUA6wsN7WBJ0vdUlc5oRn54uPX/2SL1zM7nRFKveJPLaxBH16YaTE8jA32XcURweaSCFnA==
X-Received: by 2002:a17:90b:1810:b0:280:2652:d42 with SMTP id lw16-20020a17090b181000b0028026520d42mr17763037pjb.23.1700131997392;
        Thu, 16 Nov 2023 02:53:17 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id r6-20020a17090a560600b0026b3f76a063sm1300560pjf.44.2023.11.16.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 02:53:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9876410206E62; Thu, 16 Nov 2023 17:53:11 +0700 (WIB)
Date: Thu, 16 Nov 2023 17:53:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Anil Choudhary <anilchabba@gmail.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jay Vosburgh <jay.vosburgh@canonical.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Andy Gospodarek <andy@greyhouse.net>,
	Ivan Vecera <ivecera@redhat.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Dave Ertman <david.m.ertman@intel.com>,
	Sujai Buvaneswaran <sujai.buvaneswaran@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: sr-iov related bonding regression (two regressions in one report)
Message-ID: <ZVX0l0pTgbe0LKp7@archie.me>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
 <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
 <CC024511-980A-4508-8ABF-659A04367C2B@gmail.com>
 <7AC9E8F6-B229-47AA-84CE-1149F45D7E0F@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e1HJro3cB6s4ipwc"
Content-Disposition: inline
In-Reply-To: <7AC9E8F6-B229-47AA-84CE-1149F45D7E0F@gmail.com>


--e1HJro3cB6s4ipwc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 12:48:51PM -0800, Anil Choudhary wrote:
> We are getting errorError subscribing to SWID 0x0000.
>  from following code
> root@us-ash-r1-c2-m1:~/linux# grep -rn -e "subscribing to " .
> grep: ./debian/linux-image/lib/modules/6.6.1-vdx/kernel/drivers/net/ether=
net/intel/ice/ice.ko: binary file matches
> ./samples/connector/ucon.c:149: ulog("subscribing to %u.%u\n", CN_TEST_ID=
X, CN_TEST_VAL);
> ./Documentation/driver-api/media/v4l2-event.rst:117:add      called when =
a new listener gets added (subscribing to the same
> ./Documentation/driver-api/media/v4l2-event.rst:130:Unsubscribing to an e=
vent is via:
> ./Documentation/maintainer/feature-and-driver-maintainers.rst:44:mailing =
list. Either by subscribing to the whole list or using more
> grep: ./drivers/net/ethernet/intel/ice/ice_lag.o: binary file matches
> grep: ./drivers/net/ethernet/intel/ice/ice.o: binary file matches
> grep: ./drivers/net/ethernet/intel/ice/ice.ko: binary file matches
> ./drivers/net/ethernet/intel/ice/ice_lag.c:1007:                dev_err(i=
ce_pf_to_dev(local_lag->pf), "Error subscribing to SWID 0x%04X\n",
> root@us-ash-r1-c2-m1:~/linux#
>=20

Again, please don't top-post; reply inline with appropriate context instead.
You may need to configure your email client to start reply below the quoted
context.

OK, now on your Bugzilla ticket, please attach the full log (either from
dmesg or from journalctl). And don't forget to perform bisection if
you'd like to get this regression fixed.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--e1HJro3cB6s4ipwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVX0kwAKCRD2uYlJVVFO
o7fjAQC0MeTuZpur/LspKJ2Mx7S+c45gX313sk1uD4kt7ANNVwEA/ivKY/8tlYLK
LIZuHFWvA3qMyHT4vgtG8fcqbuN8igc=
=O+Fn
-----END PGP SIGNATURE-----

--e1HJro3cB6s4ipwc--
