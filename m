Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBA12B7E
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 14:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEX0TKRP"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so3723801b3a.3
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 06:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699798368; x=1700403168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCvr0yTKicKszXc2n3f/nKPcI+6n8ysEnACBP1fLv1U=;
        b=GEX0TKRPL7qKdjqmsw3cAK/PCUPfexLDKqvvZYJbqU6jqyoOQ8rsaobFUXTcYGIV3C
         FduLLnal59EyDJcUTh6j0k9hcc/xFVJnuyTEbKAyOuTKr/AxxOdPo6PUTItwDJeHuU5v
         TnBX33elWrEZj0phNT4PbLRzsr9JTtKwpEyEEN446Atc2meVjqHM5Gjc52JPaEBbMPZ7
         /+sOHbL1siRCI/c35877WJrAlaPFFtI1Y8FW6mOIgrl7Ve+hVqjNSgOju88Pgu1igYb9
         Bs7WXhHx1joVkt6zIsYxkKVr2VnbafsD1pyfWjctZ2wTIj4qIePFy5dMZrbHTWAFYQih
         C75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699798368; x=1700403168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCvr0yTKicKszXc2n3f/nKPcI+6n8ysEnACBP1fLv1U=;
        b=ALrU2T2ONphper5sFuK12GpYOsuUt+Kzz3QMpQrPFzKWt7llC2PTj9Y2Z/SocSnP7O
         iDnlf30Ku6HgfiXMixrcoE3DOiILZnZNZ+JgIgxrkM3msWirj8asQRCGfk0DhM4zUJDD
         DD+j2eC3HYa120h49hriMdjL71KZJ3GpYouuMEOevnA8dJLxxVLv26jUCp5TrtztTllq
         8kXujCtwhZgtif7EXE3e893nHDLH+GYS1F8NN82laeHEPmh4sDBKXt7CxH46MW3yCmTf
         FIlsV0hMinxtAC3Ko1Zozsyc0Sq/5aMWWdFNnCdaeuXNyxgkWod+dlkjTemcTjIwNxA7
         2qlw==
X-Gm-Message-State: AOJu0YxY3wzICzn7OrbALqlCh0B+MlMd9/2WCwYogs1tqxGi26cxmsGt
	X428bQpcFskatGM7sdW0gWHE+z1SLJBtwg==
X-Google-Smtp-Source: AGHT+IEa52UGrTINC8r6UcUtaKBz+bSttXiaWAm3fVRDA/TY1Uke7Cq5Lz+3rtpTF4RUVIlONVaGVw==
X-Received: by 2002:a05:6a00:408f:b0:6c6:9c3b:f0c5 with SMTP id bw15-20020a056a00408f00b006c69c3bf0c5mr4231803pfb.24.1699798368340;
        Sun, 12 Nov 2023 06:12:48 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id e20-20020aa78c54000000b006870ed427b2sm2618022pfd.94.2023.11.12.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 06:12:47 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 0DE0D10475DAF; Sun, 12 Nov 2023 21:12:45 +0700 (WIB)
Date: Sun, 12 Nov 2023 21:12:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	=?utf-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
	Fabio Comolli <fabio.comolli@gmail.com>
Subject: Re: Fwd: iwlmvm: Linux 6.7 pre-rc1 prints stack trace of
 iwl_op_mode_mvm_start; caused by commit b6e3d1ba4fcf
Message-ID: <ZVDdXWNFSg48toP5@archie.me>
References: <2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LtCOL7Zv4yuWkm+i"
Content-Disposition: inline
In-Reply-To: <2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com>


--LtCOL7Zv4yuWkm+i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 08:13:39PM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: b6e3d1ba4fcf02 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D218095
> #regzbot title: new iwlwifi firmware statistics API triggers stack trace
>=20

#regzbot monitor: https://lore.kernel.org/linux-wireless/CAHk-=3Dwix6kqQ5vH=
ZXjOPpZBfM7mMm9bBZxi2Jh7XnaKCqVf94w@mail.gmail.com/
#regzbot fix: wifi: iwlwifi: fix system commands group ordering

--=20
An old man doll... just what I always wanted! - Clara

--LtCOL7Zv4yuWkm+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVDdXQAKCRD2uYlJVVFO
o8rvAPwJodW9tD6EUNvZDaoh3shGw2NQJrSPJOYTfTq6EqKdSgD/Xi0GqoReWa6B
Lj2q+AyyKAOS7/ovhlAW7/fFTNFx/Qw=
=vmFw
-----END PGP SIGNATURE-----

--LtCOL7Zv4yuWkm+i--
