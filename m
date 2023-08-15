Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39215A5
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 00:16:26 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bdf4752c3cso4768855ad.2
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 17:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692058586; x=1692663386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=weB9MtIJFBDelUwYLkDTbi/52FIM6MLhscWSCwc5acY=;
        b=FWpSGHZJ4CdZ12v0OGENLtiQt1uOLNFyMNnseZF25em+3ZLWH01DTz5JSVA8qI2O0G
         dELHOBFz2lbQexpXMcn2rMjJ7mx7fjXibSc2c/HFDloy+ESY9oECuDx1MUqT8riYWgBy
         eOiidbErXBg7TZhLbKY6dOquV1SFjhcN6Rj8tIWJI7fvTuKo7ydOoW19PDBAmNbvkdD+
         SRxNboAL8P0jH6aAT9r8imATRL31saGZ3Y9iTQmo+FbyXsYLi4tlCULOQidR8Ryw5ydJ
         Vr6jNWbEtEgOzEyObCm3+RabL5nQ9rn/JkMDVJk2nrissQDFdTyaU++WwZ1O5BUlb2tz
         /zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692058586; x=1692663386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weB9MtIJFBDelUwYLkDTbi/52FIM6MLhscWSCwc5acY=;
        b=VjEKEBmpPwpnTaDB3+HYzhcxjv852bFmKjNR+oJRKRlXJv8xvw/hdvH/6NuefUpUcA
         cLngixNqqd7I2HzmcF04/+cbkcisKu+b/nBATWcm+pgzag6T62KRkt39v0oHnGNZzFM1
         fl1WhKUVbPkJCdpEdtrJXPlEXgF/PPmjb/klHlM9XCzVAO5ElZr6b+vAnZsV2LCiWP48
         EUjIcu/9FTYU0L7HyYA0dX4ap2yASXLFmrDALBtzV6oL3bVdGR9+eQka9/L+A9BBT4xQ
         Iy3RR7kFcBKjZurs540KtFp1qi7satMO+1XGSCQS85FZJntdJ5dnCUN52vkOVrfi6Y3H
         RB/Q==
X-Gm-Message-State: AOJu0YxLqzQzDWJ5TjVUWwqsxGcQz9UCfgjRZQ73ldvjNK/d//n/sZT3
	T5FHUeJKYwq3v4FeJlo8FvE=
X-Google-Smtp-Source: AGHT+IE4YWmOgaBYgfy3YZ1zDOqbgFEcdff5iiTj+lIjmxaDggUgNgT4Dag7PaXNNgOpekYuWvUZqw==
X-Received: by 2002:a17:902:e546:b0:1b8:2537:542c with SMTP id n6-20020a170902e54600b001b82537542cmr11481460plf.43.1692058586135;
        Mon, 14 Aug 2023 17:16:26 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709028c8c00b001b9d88a4d1asm9999485plo.289.2023.08.14.17.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 17:16:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3215681A2F01; Tue, 15 Aug 2023 07:16:20 +0700 (WIB)
Date: Tue, 15 Aug 2023 07:16:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Dr. David Alan Gilbert" <dave@treblig.org>, tytso@mit.edu,
	adilger.kernel@dilger.ca, song@kernel.org
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: 6.5.0rc5 fs hang - ext4? raid?
Message-ID: <ZNrD1BBvDVh-npz4@debian.me>
References: <ZNqWfQPTScJDkmpX@gallifrey>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pd4/NvBj/UOcpGoK"
Content-Disposition: inline
In-Reply-To: <ZNqWfQPTScJDkmpX@gallifrey>


--pd4/NvBj/UOcpGoK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 09:02:53PM +0000, Dr. David Alan Gilbert wrote:
> Hi,
>   I'm seeing a few hangs on a fs after upgrading to fedora 39's bleeding
> edge; which is running kernel 6.5.0-0.rc5.20230808git14f9643dc90a.37.fc39=
=2Ex86_64
> It was always solid prior to that.  It seems to trigger on heavy IO
> on this fs.

What kernel version prior to this upgrade?

Also, it'd been great if you can also bisect this regression using kernel
tree obtained with git. See Documentation/admin-guide/bug-bisect.rst in
the kernel tree for how to perform bisection.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--pd4/NvBj/UOcpGoK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZNrDzwAKCRD2uYlJVVFO
o2A/AP0dbAmiqwyQXR2Sig5gkTpPzts7Xdtdfnh7sACSTfpTqQD/Rd4KpsiGkh/6
TbWXJdSgmaEes7R5LKdgliR0Rw109gk=
=S/Tg
-----END PGP SIGNATURE-----

--pd4/NvBj/UOcpGoK--
