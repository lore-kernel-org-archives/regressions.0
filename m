Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11162B
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 01:01:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a56401c12so2150651b3a.2
        for <regressions@lists.linux.dev>; Tue, 05 Sep 2023 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693962116; x=1694566916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fwjOextC4o2E3xgdiq4cQxhzdLA0veFCKTQAeNbsF4Q=;
        b=REFOCYQaY8P/iz6zOI8roS7kDoPS6uTLtq/5GlzdEiSuw6KYvzlLmNi4eZAVgB7Jvj
         bHXin2u6ejzzwtI/SyaNusC6APbjuFNwN76S20j3t5aiKqxVJB46R8nRcfbwjRi+msbA
         NJA/z3uIWhx2A/O+bIAFK69jakicSPBoKyZS91qH4KUI4mXfFinqRpkcVVfKFffvLUa/
         ypZmg1fK2kZyipkK6aiCQpTjfP50LKPuLpWmJblwZBn+t/eObp1vRBGVe86iefN962BE
         WklYJM2uYXhnP9rFRtCXgItP9c9IOBGp2Xk3S0nNnNaNWEL1fxJJa/qab/rvgETWt59b
         cntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693962116; x=1694566916;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwjOextC4o2E3xgdiq4cQxhzdLA0veFCKTQAeNbsF4Q=;
        b=jo7Yjmahc5Qt+eTKGC/ex+aK2TI1UIzOVsTAUl46YTdihIsWY4p2pILs4h9NTcYBN7
         9bAy27ntp7/P5tRKeAkk7Qpd6J2ZVhv1vVwVqtxhZMK9ImvWB+Inrl0MhUDkQzgZ7x/v
         DUsGuTZtAF8lnU4xLnZRiQ47DkC93cqdIW3OogsCyvSrXEuCa64X9wyY0XJP/BBlZbKy
         rzPxqp/f997h+/IeP+YGGE6nW0C5PFy1qv8gAiCgn2CdzJzmf0QTRt2pM/uipReUs8zB
         s/s061l+ZqLHVRf4xzqLoU0IfBh5knp+OATL+NCLhNME68zTvbGseoiKVumEw0pcx2Dj
         BE0A==
X-Gm-Message-State: AOJu0YzvAlOOmRoHHh7zArMGXMptamyCDGzJriMb9uOYEy36iuE3AghR
	7UyFM8Zq1XM5EEwU9EIx/QE=
X-Google-Smtp-Source: AGHT+IGRnRlHz9ycOwplwkvnFbkqexspTRxCaYtSS6ST+LLd9YaU8M7qGFIoU8ZkEvIigFIKIA6K1w==
X-Received: by 2002:a05:6a20:1448:b0:132:cd2d:16fd with SMTP id a8-20020a056a20144800b00132cd2d16fdmr15406140pzi.38.1693962115871;
        Tue, 05 Sep 2023 18:01:55 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78816000000b006883561b421sm9628358pfo.162.2023.09.05.18.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 18:01:55 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3B2ED81A82C1; Wed,  6 Sep 2023 08:01:52 +0700 (WIB)
Date: Wed, 6 Sep 2023 08:01:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Brian Pardy <brian.pardy@gmail.com>,
	Linux CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Steve French <sfrench@samba.org>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS
 share is mounted (cifsd-cfid-laundromat in"D" state)
Message-ID: <ZPfPfyIoVxw5L6El@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4rKL3SGhEKB4JeVE"
Content-Disposition: inline
In-Reply-To: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>


--4rKL3SGhEKB4JeVE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 01:09:05PM -0400, Brian Pardy wrote:
> My apologies if I do not have the bug report protocol correct in posting =
here.
>=20
> I've noticed an issue with the CIFS client in kernel 6.5.0/6.5.1 that
> does not exist in 6.4.12 or other previous kernels (I have not tested
> 6.4.13). Almost immediately after mounting a CIFS share, the reported
> load average on my system goes up by 2. At the time this occurs I see
> two [cifsd-cfid-laundromat] kernel threads running the "D" state,
> where they remain for the entire time the CIFS share is mounted. The
> load will remain stable at 2 (otherwise idle) until the share is
> unmounted, at which point the [cifsd-cfid-laundromat] threads
> disappear and load drops back down to 0. This is easily reproducible
> on my system, but I am not sure what to do to retrieve more useful
> debugging information. If I mount two shares from this server, I get
> four laundromat threads in "D" state and a sustained load average of
> 4.
>=20
> The client is running Gentoo Linux, the server is a Seagate Personal
> Cloud NAS running Samba 4.6.5. Mount options used are
> "noperm,guest,vers=3D3.02". The CPUs do not actually appear to be
> spinning, the reported load average appears incorrect as far as actual
> CPU use is concerned.
>=20
> I am happy to follow any instructions provided to gather more details
> if I can help to track this down. Nothing that appears relevant
> appears in syslog or dmesg output.

Thanks for the regression report. But if you want to get it fixed,
you have to do your part: perform bisection. See Documentation/admin-guide/=
bug-bisect.rst in the kernel sources for how to do that.

Anyway, I'm adding it to regzbot:

#regzbot ^introduced: v6.4..v6.5
#regzbot title: incorrect CPU utilization report (multiplied) when mounting=
 CIFS

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--4rKL3SGhEKB4JeVE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPfPegAKCRD2uYlJVVFO
o4xSAP9MTEw9rpwNO2GX2ldlyf6tZs7LUFf/8V5oQauTdsPQoQEA7E5sLnGg02jT
O2+azRU4Z7PkAoBG++gly3dnBnx2ggo=
=cr2w
-----END PGP SIGNATURE-----

--4rKL3SGhEKB4JeVE--
