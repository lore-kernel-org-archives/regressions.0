Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5489C8EB
	for <regressions@lists.linux.dev>; Wed, 24 May 2023 10:10:49 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5307502146aso55824a12.1
        for <regressions@lists.linux.dev>; Wed, 24 May 2023 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684923049; x=1687515049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKshTk4F9QVPSAyh2wH6wvvsO6NUvLxghil8WKBqIOI=;
        b=Rpkx8+xqTcHNWjjZa3rXg2ufm0F++oGcrSMNSLhFmzjGokRwVEbWgoaks6ClhflSce
         MkFqRow2nTjtAc0BWgEchTba40SxJSkKh+qm1lQsHQbhBUxRQN+zHGmHhAZersMasod2
         L4CsXfvmdZvDntVI54ssFriYH3LKqFcHDOvK8mBz34Gh9QtwFfoAc+LNPdSnvrfcps9/
         gYU/Tu1DoWJQZmrB6DCky6k8nP2hokYA3+ONZRjK7JYKIgGBQY/mY1Hp48GgBePuvFGQ
         bT5lZgTbjGeuYrUUDZp+ZbV2XVG86+MWZEKp9TXqkwuUDvoDWaPlxceLXzJSCx2hhxRC
         qZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923049; x=1687515049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKshTk4F9QVPSAyh2wH6wvvsO6NUvLxghil8WKBqIOI=;
        b=GyRQg3VfQRKEKVwJKY4s38Ud1j4TuGdpWX+x8CP/dPPZ9Rdf0AeP0sC9WNXFGy8eSP
         BdVC5bYn5JVgqGUkJy+GVhqJ8QfpJmQoxBZPaZgqV6/JZQ2ID/vinQ6q4f7Q1zbGYJir
         kzpW2DtkchU4mKSE6/GwOtykdwbCmhYQWxTeskzxoOXZfUNQznt35mrw0tOYNAbYdql8
         ZkgGNlwMCNFHUHg1oAarFNHZRYLv8sNSxvVK0inJUjLhMMZvrKsQeJl+nAOrvh3e2Uhy
         OMtDJ3ZP/itIcGighTS+LUVOiJ4QV3SHRisIMMfcjr95CWQXi28oDqgEDyKlQxOO0Yfj
         LazA==
X-Gm-Message-State: AC+VfDzH8fcd7wzkSNWnBTT1mcHS4hIdqX9I2kYnFIx7kucUYyhOMKtS
	3BIjz3oVJgt2FQlj0qQZ3do=
X-Google-Smtp-Source: ACHHUZ7Oy0YRt80g9VhUqsfwOARVdtsRiwEJf6XRVg3GlJESp60Uq+R5SpX+v+rp3KLZx4wa/AAFAQ==
X-Received: by 2002:a17:902:d501:b0:1ae:2e0d:b38c with SMTP id b1-20020a170902d50100b001ae2e0db38cmr19322667plg.12.1684923049138;
        Wed, 24 May 2023 03:10:49 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id d12-20020a170903230c00b001ac7c6fd12asm8367442plh.104.2023.05.24.03.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 03:10:48 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 54270106A0A; Wed, 24 May 2023 17:10:45 +0700 (WIB)
Date: Wed, 24 May 2023 17:10:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-input@vger.kernel.org,
	Basavaraj Natikar <basavaraj.natikar@amd.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <ZG3ipauL9FTnQJiC@debian.me>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
 <ZG2LXN2+Sa2PWJqz@debian.me>
 <ee2c30a5-3927-d892-2a66-00cd513c3899@hexchain.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oqc3JrxTJwBoPC/u"
Content-Disposition: inline
In-Reply-To: <ee2c30a5-3927-d892-2a66-00cd513c3899@hexchain.org>


--Oqc3JrxTJwBoPC/u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 02:10:31PM +0800, Haochen Tong wrote:
> > What last kernel version before this regression occurs? Do you mean
> > v6.2?
> >=20
>=20
> I was using 6.2.12 (Arch Linux distro kernel) before seeing this regressi=
on.

Can you perform bisection to find the culprit that introduces the
regression? Since you're on Arch Linux, see its wiki article [1] for
instructions.

Thanks.

[1]: https://wiki.archlinux.org/title/Bisecting_bugs_with_Git

--=20
An old man doll... just what I always wanted! - Clara

--Oqc3JrxTJwBoPC/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG3ipQAKCRD2uYlJVVFO
oz+CAPwP430JY/PI70bKymcpuGulTPefXKmJNPRhxT8zC86X2QEApwQzWkHvgC2b
ze/+47FXy7VOT9KzVktrWCJ3QnfpOAA=
=ClE8
-----END PGP SIGNATURE-----

--Oqc3JrxTJwBoPC/u--
