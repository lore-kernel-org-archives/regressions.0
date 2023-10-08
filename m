Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FA9C8EA
	for <regressions@lists.linux.dev>; Sun,  8 Oct 2023 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE99G1lT"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c5db4925f9so27481315ad.1
        for <regressions@lists.linux.dev>; Sun, 08 Oct 2023 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696774049; x=1697378849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCzYakcpTcETitAtIw4d5gEkmbg6TBgqI55HTypQAD4=;
        b=hE99G1lTdHnHYeI66k1wClAAfCBnHPMuqp4+i8vBlEPoqKF+efnuQA52iyjg236C7i
         T20ULZr72Ex+VnEiDFiZdVLUNY2/cW+whiB14+gZPT/WlZkXBv5MIAVFZk0eUXN33A/i
         NIqsx0bYXCpxVVZ1xA0qy58BOoDq+FaRddtKChsGeBB0daSsaYZcS0pycvvjOejcfeEE
         XehTjIPyUOqx/G724Xv+QiWSN/ZiqDBdWm+WssALIyVFux7YR006uQ1lAb5o4JApNMzy
         LKwk3GxdJ/Jq6ZG2AXZZKZEayHJwKaxTskCCQHw911qf4qjLABe2Uph9ZlzqK8XCob63
         kW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696774049; x=1697378849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCzYakcpTcETitAtIw4d5gEkmbg6TBgqI55HTypQAD4=;
        b=SR1QaG9l2p4vtCZGt28KoN6XEyIMMfrwNMbUuvzg/mHDBNR/mB4cMYyfIl0NjrYNVE
         rtmQ0QtpRU9lS+45OphySNGBuCpK5ZQxkj5Rvc+4D5ZFEQrn8Kldode26Q3zyKsrdnh5
         oDLc7oDuKJyTADv/WXf0nha7+1GZ4JDOqY+4R9/iTWVN8W9Mek/TrM+2MJ7/YyXS/AlR
         tE2zNsVZPWfLqhKGE6y943NQtE3icHHGZofwVAC477NFQ6euM5Y58QdbzSCVgFXOCx9M
         r2lRDTWK0TL2pPfQTDiCFGpECdu7oj2EQFYToKF0CaLXKtSjWMtaTMZjKtuSAyo/kUxn
         D+Nw==
X-Gm-Message-State: AOJu0YzGhd6QneJqDR2oczBpBtr93qiJuTRgkS80FQXEd2QiIiRJArqP
	5SE5UMJhJnCuehwsfgl3dfY=
X-Google-Smtp-Source: AGHT+IEuG5Dq8Oms/y2PngPTgvKQircr+FmzMSKiNRi0dDe4aZQk5y2v/Jz2z7VHMmWqJWr8HQT27A==
X-Received: by 2002:a17:902:d4c5:b0:1c5:6f4d:d6dd with SMTP id o5-20020a170902d4c500b001c56f4dd6ddmr15240247plg.24.1696774049170;
        Sun, 08 Oct 2023 07:07:29 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001bc18e579aesm7479450pll.101.2023.10.08.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:07:28 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6CCB981B12C1; Sun,  8 Oct 2023 21:07:05 +0700 (WIB)
Date: Sun, 8 Oct 2023 21:07:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: dianlujitao@gmail.com, Matthew Wilcox <willy@infradead.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Filesystem Development <linux-fsdevel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Fwd: kernel bug when performing heavy IO operations
Message-ID: <ZSK3iAX0LASTiczY@debian.me>
References: <f847bc14-8f53-0547-9082-bb3d1df9ae96@gmail.com>
 <ZOrG5698LPKTp5xM@casper.infradead.org>
 <7d8b4679-5cd5-4ba1-9996-1a239f7cb1c5@gmail.com>
 <ZOs5j93aAmZhrA/G@casper.infradead.org>
 <b290c417-de1b-4af8-9f5e-133abb79580d@gmail.com>
 <ZRPXlfGFWiCNZ6sh@casper.infradead.org>
 <162d90ab-e538-402e-90f1-304183bf6e76@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6UxYEauVSIXOnHn"
Content-Disposition: inline
In-Reply-To: <162d90ab-e538-402e-90f1-304183bf6e76@gmail.com>


--p6UxYEauVSIXOnHn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 08, 2023 at 09:35:58PM +0800, dianlujitao@gmail.com wrote:
> The problem does not occur with 6.1.56 lts kernel, not that old as you
> expected.
>=20

Please don't top-post; reply inline with appropriate context instead.

OK, now please find the culprit by bisection (see
Documentation/admin-guide/bug-bisect.rst in the kernel sources for how).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--p6UxYEauVSIXOnHn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSK3gwAKCRD2uYlJVVFO
o1UMAQCDIIiOIKgA0D91V27q0wwqHdlmfdne/CpU3JUhZIyFuwD/WwEttZpHXT8F
UWjLIkh7OrKNK4II7/zCyx61ii5llwk=
=Ru5o
-----END PGP SIGNATURE-----

--p6UxYEauVSIXOnHn--
