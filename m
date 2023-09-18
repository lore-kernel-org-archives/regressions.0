Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6333EA
	for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 07:56:20 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68fbd31d9ddso3162319b3a.0
        for <regressions@lists.linux.dev>; Mon, 18 Sep 2023 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695023780; x=1695628580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqxu9XqJgrwv9dQeN2TLGjQoXj5OVfZLMHNwc4EUVI4=;
        b=M1F8TSTrU0nldNCFCcvbBiLleALJCERXCcvevHYAriCFUKlOPXTdBmhkZDvhCSEksr
         yvXdNW/P1MMzqDriuUVOQGgNWo4hLG3GpZGe24j5voekp7YPCM1He0P9KM6Mc9PJMSHn
         zBlbf7xCHiXvEo+enXU4A+glK3h3v9EqChXaYOvLER+ISR3ouP+2P2gxXifw5Q+2eNjU
         NWWiqzu4vZG39DRzdAM3LCE5xA0+4HISGa+bKT4mHVpMeFF538voYYKPTq/KSNfMm7vV
         O7KqqUwLcZHh3x9n3bj3AUZzmqCH9IKgHR/EuoZwDRSAAth1caTLqJKQ1l4kat7ahXlL
         Cu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695023780; x=1695628580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xqxu9XqJgrwv9dQeN2TLGjQoXj5OVfZLMHNwc4EUVI4=;
        b=F5eYpEzCRyymPOlJhW7g8YKEfg0loir0L3+JCE7O6zHyoDyd3SJT/UQrQcuMK4ySIZ
         p4MCw4B/TzyhgCcxKjuM+OMdqO9WlV6c3VDcdoLy4nBtxkJTSTXWWv74cNbDJHqfKTl+
         xYb9sqRqXgU3sCO0Adb3OCdJKuEKLH7bWDwXD2itvAId0biNP6N0IMuX4wgMxRmLR4S8
         2z32W8F5/TI7y6YYtUQvIEuMjm6+EBOsG1W9MGJMMjGJ190QoCdMd2IagDwM/nTfGCfa
         DYQSe+STr9U9zEZ0HLL29rqampPkmgmJ9r/xfZ1ZFhtzC7l8Hdgc+7c5wgX/QD3Xu2Xl
         Uetg==
X-Gm-Message-State: AOJu0Ywvz5MeDlEkDVJKlgE88zbaqHyptClJCIpBzhJwAgSTuaozq8Vg
	n3YOTmKQEzG21iFlyzWqrmg=
X-Google-Smtp-Source: AGHT+IH/qxcDfX7UFoxk/ogaqzsqV1A4Qsvo/qqLJzoiAwIwKRGOhAmWzzeFeLJSkwIVnH5SmhaxVA==
X-Received: by 2002:a05:6a00:181c:b0:68e:351b:15b8 with SMTP id y28-20020a056a00181c00b0068e351b15b8mr8287951pfa.12.1695023779938;
        Mon, 18 Sep 2023 00:56:19 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id k10-20020a637b4a000000b00573f958f6a3sm6503830pgn.5.2023.09.18.00.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 00:56:19 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 361B2978D56F; Mon, 18 Sep 2023 14:56:17 +0700 (WIB)
Date: Mon, 18 Sep 2023 14:56:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>, Song Liu <song@kernel.org>,
	Timo Gurr <timo.gurr@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux SCSI <linux-scsi@vger.kernel.org>,
	Linux IDE and libata <linux-ide@vger.kernel.org>,
	Linux RAID <linux-raid@vger.kernel.org>
Subject: Re: Fwd: Marvell RAID Controller issues since 6.5.x
Message-ID: <ZQgCoJ17UioOtdOJ@debian.me>
References: <224f10a4-7a6a-48bb-88be-491faf8ecff7@gmail.com>
 <ZQf9mh3v5qfN5Tm0@x1-carbon>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kc+WLW1HFUSqWTkE"
Content-Disposition: inline
In-Reply-To: <ZQf9mh3v5qfN5Tm0@x1-carbon>


--kc+WLW1HFUSqWTkE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 07:34:50AM +0000, Niklas Cassel wrote:
> On Mon, Sep 18, 2023 at 07:18:28AM +0700, Bagas Sanjaya wrote:
> > Hi,
> >=20
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> >=20
> > Anyway, I'm adding this regression to be tracked by regzbot:
> >=20
> > #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cg=
i?id=3D217920
> > #regzbot title: UDMA configured spam on Marvell RAID controller
> >=20
> > Thanks.
> >=20
> > [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217920
>=20
> Hello Bagas,
>=20
> This is a duplicate of:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217902
>=20
> Problem is solved by:
> https://lore.kernel.org/linux-scsi/20230915022034.678121-1-dlemoal@kernel=
=2Eorg/
>=20
>=20

I have asked the reporter on Bugzilla to check the fix above. When he
reports back successfully, I'll mark this report as fixed.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--kc+WLW1HFUSqWTkE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQgCoAAKCRD2uYlJVVFO
o55MAP9OtvCLRaHNTrxGJhOPpui1xIREaJ0wkOwmLE+BjudivQD9ETPSmeIq6maO
Zk4SipJureLWv7qF9uJiIx2qzKDqbQg=
=w8vJ
-----END PGP SIGNATURE-----

--kc+WLW1HFUSqWTkE--
