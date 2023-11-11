Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0486FB6
	for <regressions@lists.linux.dev>; Sat, 11 Nov 2023 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1D2qPDQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc68c1fac2so24451695ad.0
        for <regressions@lists.linux.dev>; Fri, 10 Nov 2023 22:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699683951; x=1700288751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JvortSlF8Zkk0exah0umkgUGAWp9AYwxr7KNnwY8mtw=;
        b=m1D2qPDQeD2m3nktCZn1SKbagSOejYE4nrbW/sRQEGjVFVvRUyizASj+gFQSqWJwVi
         n9iPPlGq2EboF7NhWGXa8FtDmUHiQO020zlUz6pi247SVobaIWfSOkq6oShYVRs8dDJD
         IuwKSkMbnjm4XiBfPE7b7VPYaYxlYvhheDtuJje7y0ZtgnKYU85N9k0PajSEupUrvcHm
         cBxP5otcMGuPCaKpHi4zCGYOdoY18Z0Np+tds9TWNTF31ScFWecaxWmedbQi0wfYsodJ
         p7b48A3rON6c3d+xdKNf8uV95pCXsseGXJ9ZSNWg5aQuKSTZizSCd+k6ulpS79JXkHr4
         I3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699683951; x=1700288751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvortSlF8Zkk0exah0umkgUGAWp9AYwxr7KNnwY8mtw=;
        b=ll7eZuUeZrJ0dXa28xBKGUcF7Xyq39fu/8kyifjftSXwEHUkv1DrpSmrwCYtKjWYMr
         DuKHyRHC/Rw24yGVMqTj9FA/ubRjhxXcKLzfq7SmhJIHR/XV1KlWsNQ3+ekPG2v4Sh5T
         cB/VD9iFqIc0lzqvENEXeV8dReEMz31YY0CMtNfT5pIPIF+mN5EcwlsME/jL83XQ/+KG
         aWhjPQSF71tmtQkd+csuhUn/pcqciOO0btJjzcHC2i23SDBKje+cRqw9D1o+DgFzTtJk
         2FtOd35NUhpSh95ksWNWSk+Pc0EVs4VpkrC0qBnqWrb2AjRB7Er6oUVhFE+4nG3migJy
         133Q==
X-Gm-Message-State: AOJu0Yx4nsO0Oh7l3JNsFJjFBfsmh6iMxg9HKjju+P3NNFsviyhr2I6J
	WsAY1RMnqGDoHlXewSePtXc=
X-Google-Smtp-Source: AGHT+IETlWxLvbCfSeLxBzphiN3a6/HuVyQ9vymJD5TmFDHd72vUYJnb06TlLdKHP+3iwatqbbKiMw==
X-Received: by 2002:a17:902:a402:b0:1c2:1068:1f4f with SMTP id p2-20020a170902a40200b001c210681f4fmr1301441plq.17.1699683951241;
        Fri, 10 Nov 2023 22:25:51 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm652898plz.79.2023.11.10.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 22:25:50 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 0731B10205C0D; Sat, 11 Nov 2023 13:25:48 +0700 (WIB)
Date: Sat, 11 Nov 2023 13:25:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bhanu Victor DiCara <00bvd0+linux@gmail.com>,
	linux-raid@vger.kernel.org
Cc: regressions@lists.linux.dev, song@kernel.org, jiangguoqing@kylinos.cn,
	jgq516@gmail.com
Subject: Re: [REGRESSION] Data read from a degraded RAID 4/5/6 array could be
 silently corrupted.
Message-ID: <ZU8ebDX5Tl1L4vMF@archie.me>
References: <5727380.DvuYhMxLoT@bvd0>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3Tlr2Wgc3+Qko2f"
Content-Disposition: inline
In-Reply-To: <5727380.DvuYhMxLoT@bvd0>


--c3Tlr2Wgc3+Qko2f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 09:00:00AM +0900, Bhanu Victor DiCara wrote:
> A degraded RAID 4/5/6 array can sometimes read 0s instead of the actual d=
ata.
>=20
>=20
> #regzbot introduced: 10764815ff4728d2c57da677cd5d3dd6f446cf5f
> (The problem does not occur in the previous commit.)
>=20

regzbot dashboard shows that commit cc22b5407e9ca7 ("md: raid0: account
for split bio in iostat accounting") should have fixed your regression.
Can you try that commit?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--c3Tlr2Wgc3+Qko2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZU8eYQAKCRD2uYlJVVFO
owiqAP9N9NEPFeiDaW+Tgz5S1BbV+6e1NN9DIBr0+HWugS54PwEAjJ76zqzv2XDq
aNKfgPhe4JnGj7ynuektF645/0saOAs=
=tSVZ
-----END PGP SIGNATURE-----

--c3Tlr2Wgc3+Qko2f--
