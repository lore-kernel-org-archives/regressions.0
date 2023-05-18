Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C683E23C7E
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 13:36:39 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-25332422531so921365a91.0
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684416999; x=1687008999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDwcH7cU2Z4j4/nc6uJ/p7zWwFLs0nTsurbtyh0XnyM=;
        b=OzX4noVCWIAJmzM3uYbq7kRW2CzMb3ne+8p1UQ22BK2rhd/f0dIzjmxZPRnzeP/AvF
         FA6YRwALKKHDSOtt9pwF7kPKKtT6ZEAtv4k9EI719CCpt3WngXXLyobGjb4t0AVn/OTT
         zi84c1dOL/HZStK3zM3iABUinFXlNoOPjZVTS/WnwV5A5HTL90bwIIfVy6pmDFC6dsYb
         +VO3v/xlnYQw6VzMy/nhpqlw7MQqXXCmdCVpHTA7yneJsUbFmCmMjE4yb4gxrKiVvhEr
         EtOBICFhta/kfPL6Qzg6eCWctnCODztpz0Jcg82XJf6puw78nqX8xM9VX36oModumTVJ
         Do2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684416999; x=1687008999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDwcH7cU2Z4j4/nc6uJ/p7zWwFLs0nTsurbtyh0XnyM=;
        b=VMwICogEV9mW8aoC2+vKVNwpAczDjowYZVvEhLbE9g4BrHqyH+TUIZTaVVaFH4K9/0
         fzOIdEQZYftZ6Xk0UMNkC9RFzCtqrbVFqEmPLqNW9XUDq5ZsbO+sFEzmyXGYBA7RN/9z
         9JWjMWZ3A9nYxvL/Dh8VSRDwVuG80Ac2QCYnmfIYpMJq4phrehgSwnmlvEb3gibKbQBd
         A6q9yl2pQxG/XNmdw6123KnHkeEkwjrQok9uV+7wASETZqvj3G0Pczh3EF7Rea6G0347
         X5KGTOQv1jKdIoLDPXjiiTmnFA1YSTRYIghE2JfDIWWYuW+0GRzi/HOy1fn80Y38miGP
         HSFA==
X-Gm-Message-State: AC+VfDzQbGe2Wt6EZWP5TR1MiMuklAXDnnstlD0TjhHc2qh3fuvcTWK9
	FMv8aB37LUCvxOYPGPQQN/M=
X-Google-Smtp-Source: ACHHUZ4TYZewHWEX7Y0czl+9D0edvrcRViYE7+3bhPW4NoqK3p2sxbI4RNBbvWxOcLWI8z1A06zdgA==
X-Received: by 2002:a17:90a:dc12:b0:252:977e:c257 with SMTP id i18-20020a17090adc1200b00252977ec257mr2601286pjv.23.1684416998991;
        Thu, 18 May 2023 06:36:38 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-78.three.co.id. [180.214.233.78])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090aba0c00b0025289bc1ce4sm3437542pjr.17.2023.05.18.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 06:36:38 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id DAB0810558B; Thu, 18 May 2023 20:36:34 +0700 (WIB)
Date: Thu, 18 May 2023 20:36:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Todd Brandt <todd.e.brandt@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: Fwd: BUG: Patch to spi-nor hangs Lenovo ThinkPad X1 Titanium
 with divide by zero
Message-ID: <ZGYp4jnJxZJlfpeB@debian.me>
References: <b984f839-cf0a-fc25-41d5-656171774e4e@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FwK44x7py3NWqpFz"
Content-Disposition: inline
In-Reply-To: <b984f839-cf0a-fc25-41d5-656171774e4e@gmail.com>


--FwK44x7py3NWqpFz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 08:42:19AM +0700, Bagas Sanjaya wrote:
> Fortunately, the reporter also sent out potential fix for this regression;
> but to be sure it doesn't fall through cracks, I'm adding it to regzbot:
>=20
> #regzbot introduced: 9d6c5d64f0288a https://bugzilla.kernel.org/show_bug.=
cgi?id=3D217448
> #regzbot title: SPI NOR bank divide by zero on Lenovo ThinkPad X1 Titanium
> #regzbot fix: MTD SPI-NOR: BUG FIX of divide by zero in new n_banks value
>=20

Updating with formal fix:

#regzbot fix: mtd: spi-nor: Fix divide by zero for spi-nor-generic flashes

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--FwK44x7py3NWqpFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGYp4gAKCRD2uYlJVVFO
o6NyAP9crcMtHqVvZVuAmBpiDGpDb/Jn+oi1scf4bv6fl0HF0AEA1DGDq43VZFFh
jqQCoTtT4SqI67AgW4hDHcgkBWZlhgE=
=5ubZ
-----END PGP SIGNATURE-----

--FwK44x7py3NWqpFz--
