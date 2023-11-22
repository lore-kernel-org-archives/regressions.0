Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE9220B19
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hjtpmyrx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ce5e76912aso42087245ad.2
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 00:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700640380; x=1701245180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1dCVuj7iyX5Mc26hZdNFyVGTD/WJQ75bFBAJEJnDH4=;
        b=Hjtpmyrx5cf9P5zWtchLvxdloI+oq15inahDtHh6/nvA7GP5S8UCxncHQt5rGlYE6g
         hjILO6u1RRVOFWpF/h06VqnJgU2XQ4HHiTgf2NNJ8rhbumzwCcQaIOivHDmBou1xmzPj
         3Qdo3xMJ6MB0XB93UHU8UMRX4Uy9y6Wj4h7J7f/EYLulF2HJBM/ymf/Sky7mxY8REvzg
         ajn4zKbP9pEdDBzYhhNyoZweYSr42120w7MI1em5sWelPv/Vsfclx1rT3FRTxQq8srxO
         dKLTJ+Gf2J52WwRLdnl3gtwUILxWyfVicfsSgsypc6o/fDwK0IrsTRh5MUSv5PTAyJle
         qe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700640380; x=1701245180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1dCVuj7iyX5Mc26hZdNFyVGTD/WJQ75bFBAJEJnDH4=;
        b=TU9ht7/pY69DIDkwWfUYZ8roteod2pgdib83P8cvmtZ+br+W48K8+lGDkj7tvJxr0W
         CJ/HWiaa8B8bDcX33NE1AaH8hy1ktxyX2wcRQYd5vmOaNMB65Aia59UiibhAjs6blhsu
         EzCs0LBHVCJW+sL14fCMphjmWh32p/mCtQ/6arnUaAKleQ7Nzzq/rI/4llfLmbnnowuH
         DB8Vjk4Emnbdqqec8DNmZrtaeYB8DdXqG8LAXRlWzAmguHdaQxrqPk0mgeryYUiz+rai
         GUXkPASaCzla90hAsBJhUSmg7tvEXN9Bx+PN2MEiq9c6k5JkgM25s7p36KRiIRqoYexe
         O62g==
X-Gm-Message-State: AOJu0Yz06obUj9l/X29jC6/UYg8XrtEMig5ROKO7zgHCZnoVpDA7trTY
	FXWXA/ATxWfJKuN52qnAwLI=
X-Google-Smtp-Source: AGHT+IGPBJQ4RvyCYxi1USeud82qzZ5GGj2CLL3IrPUWuAHhAcz92HmdFcFeENVci0ZhFbv/lHJN0w==
X-Received: by 2002:a17:902:c408:b0:1cf:7911:4619 with SMTP id k8-20020a170902c40800b001cf79114619mr1625600plk.49.1700640380118;
        Wed, 22 Nov 2023 00:06:20 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902cec800b001bbd1562e75sm9200377plg.55.2023.11.22.00.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 00:06:19 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6B40F104A6A66; Wed, 22 Nov 2023 15:06:17 +0700 (WIB)
Date: Wed, 22 Nov 2023 15:06:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thomas Richter <tmricht@linux.ibm.com>,
	Linux perf Users <linux-perf-users@vger.kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Cc: Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: REGRESSION linux-next since Nov 16th, perf tool broken (at least
 on s390)
Message-ID: <ZV22eWivHWOkKxGB@archie.me>
References: <aca1eb79-5dee-4634-8727-eebb251c9e1e@linux.ibm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kD/iOrPCMbthXA+8"
Content-Disposition: inline
In-Reply-To: <aca1eb79-5dee-4634-8727-eebb251c9e1e@linux.ibm.com>


--kD/iOrPCMbthXA+8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 08:38:28AM +0100, Thomas Richter wrote:
> perf tool fails on linux-next since Nov 16th on s390 when invoking perf on
> any PMU event, as in
>=20
>   # perf stat -e cycles -- true
>=20
>    Performance counter stats for 'true':
>=20
>      <not supported>      cycles                                         =
                     =20
>=20
>        0.000598399 seconds time elapsed
>=20
>        0.000055000 seconds user
>        0.000567000 seconds sys
>=20
>   # perf stat -e pai_ext/NNPA_ALL/ -C0 -- true
>   event syntax error: 'pai_ext/NNPA_ALL/'
>                        \___ Bad event or PMU
>=20
>   Unable to find PMU or event on a PMU of 'pai_ext'
>=20
>   Initial error:
>   event syntax error: 'pai_ext/NNPA_ALL/'
>                        \___ Cannot find PMU `pai_ext'. Missing kernel sup=
port?
>   #
>=20
> This error is caused by following commit, which got into linux-next aroun=
d November 15th:
>=20
> commit 652ffc2104ec1f69dd4a46313888c33527145ccf
> Author: Greg KH <gregkh@linuxfoundation.org>
> Date:   Mon Jun 12 15:09:09 2023 +0200
>=20
>     perf/core: Fix narrow startup race when creating the perf nr_addr_fil=
ters sysfs file
>=20
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Link: https://lkml.kernel.org/r/2023061204-decal-flyable-6090@gregkh
>=20
> This commit adds function pmu_dev_is_visible() as the PMU bus function
> to make sysfs attribute files visible.
> On a failing system these sysfs attribute files are exported:
>=20
> #  ll /sys/devices/pai_ext/
> drwxr-xr-x. 2 root root    0 Nov 21 14:59 events
> drwxr-xr-x. 2 root root    0 Nov 21 14:59 format
> lrwxrwxrwx. 1 root root    0 Nov 21 14:43 subsystem -> ../../bus/event_so=
urce
> -rw-r--r--. 1 root root 4096 Nov 21 14:43 uevent
> #
>=20
> These is no file named 'type'. Other files are also missing.
> Therefore the perf tool can not access any PMU event defined by this PMU.
>=20
> On a system with proper export of all PMU sysfs attributes (same linux-ne=
xt kernel):
> #  ll /sys/devices/pai_crypto/
> total 0
> drwxr-xr-x. 2 root root    0 Nov 21 14:44 events
> drwxr-xr-x. 2 root root    0 Nov 21 14:44 format
> -r--r--r--. 1 root root 4096 Nov 21 14:44 nr_addr_filters
> -rw-r--r--. 1 root root 4096 Nov 21 14:44 perf_event_mux_interval_ms
> lrwxrwxrwx. 1 root root    0 Nov 21 14:43 subsystem -> ../../bus/event_so=
urce
> -r--r--r--. 1 root root 4096 Nov 21 14:44 type
> -rw-r--r--. 1 root root 4096 Nov 21 14:44 uevent
> # cat /sys/devices/pai_crypto/type
> 12
> #
>=20
> Also on such a system the perf stat works again:
> # perf stat -e pai_crypto/CRYPTO_ALL/ -C0 -- true
>=20
>  Performance counter stats for 'CPU(s) 0':
>=20
>                  0      pai_crypto/CRYPTO_ALL/
>=20
>        0.000741258 seconds time elapsed
>=20
> #
>=20
> On s390 there is no need to export sysfs file 'nr_addr_filters', but sett=
ing
> this member pmu::nr_addr_filters to a non-zero value before
> calling perf_pmu_register() exhibits the old behavior again.
>=20
> In my opinion this breaks previous behavior.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 652ffc2104ec1f
#regzbot title: event syntax error due to narrow startup race fix

--=20
An old man doll... just what I always wanted! - Clara

--kD/iOrPCMbthXA+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV22dQAKCRD2uYlJVVFO
o5jFAP0Wr5myCJsMi3WGhPOgpzrcrltN5fZQoazlmMqnPqb0dgEAt1O2F71h95k3
eUOOkchMZ09zYTnQyV+ZJTMvEEJu8gQ=
=jwSZ
-----END PGP SIGNATURE-----

--kD/iOrPCMbthXA+8--
