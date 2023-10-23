Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5B23C2
	for <regressions@lists.linux.dev>; Mon, 23 Oct 2023 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ybq7EU9/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so2191130b3a.1
        for <regressions@lists.linux.dev>; Mon, 23 Oct 2023 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698046953; x=1698651753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pa8Ycg4ZbuyhxwxZIcfT7kG/2CbPeVVKLuGjTYraxqk=;
        b=Ybq7EU9/kuVvy3Jd3j6/jxsCM8tePOaEUFWnVT8IfS6GYFUg9/w9VPv+bPbVl410cy
         XDTxYEZHfE/XaAhL//0TPbtynnyrXlczYxr4FF9bheRpbJEO4saLs713uP+HA+V0NB+D
         nVVsSLuFZ5n4lIfWnbYlpnTqxot+pDbKVl9HcutIRVVKE+7hFsSchLE+1kNtcZljnPZ7
         GRfw2372zfSK0zhN4mo6sgIuvtap5A+4JhFNEQ0QtK5vlqGWiM6JiA0tiNEHyRjicexT
         e1u1tHiz+ypA3u1TnCifCZ70ycGghiRf0w1A3TyLcAEYQlcs1TgBCEnRLKpBev28whUJ
         6Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698046953; x=1698651753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa8Ycg4ZbuyhxwxZIcfT7kG/2CbPeVVKLuGjTYraxqk=;
        b=EtiVKvQh1yPklUgq2rHDvk+2wZno16TQSw3dXqmymyHj31HJ4tmqcGCtxO8dexpO3i
         /4szEPma5NDBL9EbrheBfNGi741e0Oqniz4RX536KxIqjf1p2q6P4y3//Rg7r7NXVsT5
         JKSiDNfrnjfouTixvogNdAl/v11zYRr5c2/i4g1vz9Jh7KZBitS5guJjUBHCnqDs7DAA
         fvZLlUhfjuNwXl8+4DH/hK0OLYgazblVWpnDsC71pzkqpGj1s4me2vbHs/cAgfhd51jh
         AnVkrBcRFuzx2AyCz/S6kw2mUQiuvVkAw1T1zroD/rftbim8tvhuEvNHP2NN0T82FyQ7
         3MeA==
X-Gm-Message-State: AOJu0YxCvdCAuBnQG6RZ6ZAJLLecC2Gr57qYKAbTwEAY4B4ZW+CF2B1e
	LJlp9/X67gL7uKu1q7ZClWo=
X-Google-Smtp-Source: AGHT+IEs7/8FcfO1BLY4N1AIr3dYPHCRPbKB0+2YYwmIFSVIC2Crej+Is3LJdco4cmwE80d3fxdVOA==
X-Received: by 2002:a05:6a20:1592:b0:12f:c0c1:d70 with SMTP id h18-20020a056a20159200b0012fc0c10d70mr7030892pzj.40.1698046953213;
        Mon, 23 Oct 2023 00:42:33 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b2-20020a17090a990200b0027758c7f585sm5021888pjp.52.2023.10.23.00.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 00:42:32 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DD669818DF16; Mon, 23 Oct 2023 14:42:29 +0700 (WIB)
Date: Mon, 23 Oct 2023 14:42:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Jia, Fang" <fang.jia@windriver.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Linux Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regression <regressions@lists.linux.dev>
Subject: Re: phy: fixed link 1000 or 100 set with autoneg off
Message-ID: <ZTYj5Wyg8qD7_Npd@debian.me>
References: <d7aa45f8-adf8-ff9a-b2c4-04b0f2cc3c06@windriver.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KNi0/Pi1fnSluti+"
Content-Disposition: inline
In-Reply-To: <d7aa45f8-adf8-ff9a-b2c4-04b0f2cc3c06@windriver.com>


--KNi0/Pi1fnSluti+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 03:01:10PM +0800, Jia, Fang wrote:
> Hi Experts,
>=20
> We use NXP LS1046 board and face an issue about the eth interface speed.
>=20
> 1) Scenario
>=20
> we set fixed link 1000Mb/s in device tree.
>=20
> However, after we set the auto-neg off, then the eth1's speed changed to =
10M
> and Duplex changed to Half.
> The value of /sys/class/net/eth1/speed is 10 and /sys/class/net/eth1/dupl=
ex
> is half
>=20
> 2) Log is as following.
>=20
> # ifconfig eth1 up
> # ethtool eth1
> Settings for eth1:
>         Supported ports: [ MII ]
>=20
>         Supported link modes:   1000baseT/Full
>         Supported pause frame use: Symmetric Receive-only
>         Supports auto-negotiation: Yes
>=20
>=20
>         Supported FEC modes: Not reported
>=20
>=20
>         Advertised link modes:  1000baseT/Full
>         Advertised pause frame use: Symmetric Receive-only
>=20
>=20
>         Advertised auto-negotiation: Yes
>         Advertised FEC modes: Not reported
>         Speed: 1000Mb/s
>         Duplex: Full
>         Port: MII
>         PHYAD: 1
>         Transceiver: internal
>         Auto-negotiation: on
>         Supports Wake-on: d
>         Wake-on: d
>         Current message level: 0xffffffff (-1)
>                                drv probe link timer ifdown ifup rx_err
> tx_err tx_queued intr tx_done rx_status pktdata hw wol 0xffff8000
>         Link detected: yes
>=20
> # ethtool -s eth1 autoneg off
> # ethtool eth1
> Settings for eth1:
>         Supported ports: [ MII ]
>         Supported link modes:   1000baseT/Full
>         Supported pause frame use: Symmetric Receive-only
>         Supports auto-negotiation: Yes
>         Supported FEC modes: Not reported
>         Advertised link modes:  1000baseT/Full
>         Advertised pause frame use: Symmetric Receive-only
>         Advertised auto-negotiation: No
>         Advertised FEC modes: Not reported
>         Speed: 10Mb/s
>         Duplex: Half
>         Port: MII
>         PHYAD: 1
>         Transceiver: internal
>         Auto-negotiation: off
>         Supports Wake-on: d
>         Wake-on: d
>         Current message level: 0xffffffff (-1)
>                                drv probe link timer ifdown ifup rx_err
> tx_err tx_queued intr tx_done rx_status pktdata hw wol 0xffff8000
>         Link detected: yes
>=20
> 3) After code tracing, we found that:
>=20
> phy_state_machine()
> 	state PHY_RUNNING: phy_check_link_status()
> 		phy_read_status()
> 			genphy_read_status()
> 				genphy_read_status_fixed()
>=20
> In genphy_read_status_fixed(), the speed and duplex changed.
> It seems like the bmcr value is always 0x1000 from swphy_read_reg().
>=20
> After revert the commit 726097d6d6d(net: phy: improve auto-neg emulation =
in
> swphy), then the Speed and Duplex shown comes back to 1000M and Full.
>=20

Thanks for the regression report. I'm adding it to regzbot

#regzbot ^introduced: 726097d6d6d8e9

--=20
An old man doll... just what I always wanted! - Clara

--KNi0/Pi1fnSluti+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZTYj3QAKCRD2uYlJVVFO
oxlGAP9AXy3/h8cT+yMgk2wxRTXoknz4RCWC3o5I9Rg6TOIXwAEA+nlhPhUX/wl4
6atnTHxo3agKlgNdUhi76kpTfg5qDAI=
=cCKp
-----END PGP SIGNATURE-----

--KNi0/Pi1fnSluti+--
