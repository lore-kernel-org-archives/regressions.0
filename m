Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992F18AEF
	for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKKSW0jJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5b980391d7cso4272864a12.0
        for <regressions@lists.linux.dev>; Wed, 15 Nov 2023 05:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700053868; x=1700658668; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EhfVaGER9sTAd2B+qVaDfxqJSQ9hYyt4DuktjBuV3bs=;
        b=CKKSW0jJr20C8hANZtxNIV6jDsR4DRGf/lGsHjM658pHjSyhnPn8PVqRuUuhuFHXFz
         Dd04H4xOy0BlNFH718t7JhehMwowvK5uI13IG3PgQXr4p5uKjSz0BnLD6HBydhWzu8xK
         l15NWvE3j6e6iD14CSlTiSGOml7Mv1FubBwocNJiJY296RRVFmzKuvVMFCpJxS3jiJXW
         MLcStvMESIIT4JJfqRQ2Y01TJTBqzoI4jBucaYno2pP3P6iJPq98+hhAesZ4oUpuRm6G
         nHVOT6RRUTsPsjVwanBr+7cO6kpDegV022prdITTdbUFidwcxYXpPnb/DbskwcndGfvU
         wdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053868; x=1700658668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhfVaGER9sTAd2B+qVaDfxqJSQ9hYyt4DuktjBuV3bs=;
        b=ZfGietkfpOqGIBaWKe0x31Vo6sGy7yKbzvHpA/8obo0r1yKxSgeOh1j9P1OKwgNO0k
         idRDIfh4+BZRKHGFkVri+VKxyuP8oagPnIVbQRuQQ9StTBtd78KRn4Sr7rIeGVDR70GB
         eT9yUThvPbrlV8NMg/szlGMUIlcUEdLmly6xFrECh1Ht6UUiH/6dtRRY9JsFTabc/Rev
         fLz3IiaiuZtJt+/iWI0Nb9xSYvCe461g3IGXmwXQqgm84L7j7fcfZ8cxbt+tKxj53vPk
         8V5Zexz/rqAVsZIDI0cm7D/KGpqonqao0vmErNUc93xNg31+df3cwym00rrZgh4Uy45t
         F/7g==
X-Gm-Message-State: AOJu0Yz8uMZ8SUvYZvGPrLIq39zhki8Wt2Q9JBzu3fyHkpbhNl2+rqw3
	dqLivsyNgd4pWi0ZmpOaTazHCoRKOClm6A==
X-Google-Smtp-Source: AGHT+IF+Tp/0plK9/VgBp5NpeKL0shngz+o/5+5GbHwpQgFqtAF/n2vwDB9t8Qvx+i5meirX7aUHMw==
X-Received: by 2002:a17:90b:3149:b0:27d:4901:b0b7 with SMTP id ip9-20020a17090b314900b0027d4901b0b7mr11047462pjb.30.1700053867647;
        Wed, 15 Nov 2023 05:11:07 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090a8e8600b0027df6ff00eesm6757051pjo.19.2023.11.15.05.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:11:07 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CA40910D2CF4C; Wed, 15 Nov 2023 20:11:04 +0700 (WIB)
Date: Wed, 15 Nov 2023 20:11:04 +0700
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
Message-ID: <ZVTDaJOtjxEOPbNq@archie.me>
References: <986716ed-f898-4a02-a8f6-94f85b355a05@gmail.com>
 <32716.1700009673@famine>
 <0f97acf9-012d-4bb2-a766-0c2737e32b2c@leemhuis.info>
 <CC024511-980A-4508-8ABF-659A04367C2B@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5OAjmnZvSGI+Kva2"
Content-Disposition: inline
In-Reply-To: <CC024511-980A-4508-8ABF-659A04367C2B@gmail.com>


--5OAjmnZvSGI+Kva2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 10:19:25PM -0800, Anil Choudhary wrote:

>=20
>=20
>=20
> Following error error scribing to said is also new
>=20

Please don't top-post; reply inline with appropriate context instead.

What error? Can you reply with logs pasted (with error you mentioned)?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--5OAjmnZvSGI+Kva2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVTDaAAKCRD2uYlJVVFO
o+HWAQCGEf3FzxnS66Tm5OsffefCiiLmkMPkFzFUGydECWnqQgEAuTWunm1ReBNR
PWiCRjKLt7pQpv6KX8OQt1zipha9ngI=
=PeMO
-----END PGP SIGNATURE-----

--5OAjmnZvSGI+Kva2--
