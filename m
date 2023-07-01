Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB445CA1
	for <regressions@lists.linux.dev>; Sat,  1 Jul 2023 12:27:18 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b8303cd32aso21978515ad.2
        for <regressions@lists.linux.dev>; Sat, 01 Jul 2023 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688214438; x=1690806438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfT+iCg7he7G1O8FrhG+GwexlTOWppSr6nVkF4iOKro=;
        b=G+8kn0ys6ceNbz9BEowkPZHBHhy3YQYW9UgJEBQgXJC6OnYyVTAft19tO2uiwqBLNb
         igEXQtaQo9igvggoezxqDdlCbfN3xCiJH9nJKCH6HXb4cJZG35wkADWnvMmtijFsh5Mh
         7PIX4d87ZaiotIXY34HKEcka5H3sAIXbPLi0L6QXS1CIY0CoIAnKCMCmXTIdcEpSIdRq
         xeQ/3hyQ4kKL6b2ZZIB0mgwzXBpFg4jpt+tndNR1V3Pf0W0MKQ/XAEw3mDBTsUnDlEKb
         u8aKQjsRCTm+KCDZbEMAmlIGM2hS1mEsDUg0BOwzR1M3goETCdyvuREwC3OttU7qSt/p
         UNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688214438; x=1690806438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfT+iCg7he7G1O8FrhG+GwexlTOWppSr6nVkF4iOKro=;
        b=aQi2NeV2Bdc9U3q7LsV04OonYCrdnovoH95HrzCR9shhqMegSbLAIfMAM2hjm1+f+M
         AW4J7ZJzU5i9n0tpq6yjuIOkHsu6N/BPqafg8WpjYAT0oDbmqDuTp7HnlLWadvJV5yzS
         y5Zc366ffqAOQ5ATAuoFJwZyQqXvQ9YipZE3yk95xpqCa4r+DaGU7apW+F8ofRbb9p1x
         wBVOLGNG1bgZ215+6d6nLmc+BBfxdL+EkP9yBAyaZp9UUGh36POaugz+2RhFtEeUxHp4
         JYwYnID6kPLoaaIPBsX8cg3rkYaS8l7Y5tS1tQXNBXuIzp90SVkMYH5F1iYrOwahfmwz
         r8RQ==
X-Gm-Message-State: ABy/qLZ+3JLJTaOu6B3uiavYZ/F+rNrUiaBZOlJT552nKvhuZGxO7pSl
	RW+5Kj0oCK/JrUOHYXtq4js=
X-Google-Smtp-Source: APBJJlFl919QV7xve/1RnA+jhn7mf3eSZpbJiJOsrPA8uCkDVgz9/lm87vXf7Gm8cS+z538CbRXVYA==
X-Received: by 2002:a17:903:1c5:b0:1b8:6a09:9cf9 with SMTP id e5-20020a17090301c500b001b86a099cf9mr6402798plh.26.1688214438297;
        Sat, 01 Jul 2023 05:27:18 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902e5cc00b001aae625e422sm10669704plf.37.2023.07.01.05.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 05:27:17 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 4CF3083BEC72; Sat,  1 Jul 2023 19:27:13 +0700 (WIB)
Date: Sat, 1 Jul 2023 19:27:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: Fwd: commit 9df9d2f0471b causes boot failure in pre-rc1 6.5
 kernel
Message-ID: <ZKAboYIj6pAd9CMO@debian.me>
References: <4d9fb4a9-6c48-600c-f625-8ef66208090a@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Y2CUzrFU0UJ5NVe"
Content-Disposition: inline
In-Reply-To: <4d9fb4a9-6c48-600c-f625-8ef66208090a@gmail.com>


--1Y2CUzrFU0UJ5NVe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 09:06:22PM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > Since yesterday my builds of the https://git.kernel.org/pub/scm/linux/k=
ernel/git/torvalds/linux.git no longer boot with a black screen immediately=
 upon booting. Today I finished git bisecting the issue and arrived at the =
following:
> >=20
> > 9df9d2f0471b4c4702670380b8d8a45b40b23a7d is the first bad commit
> > commit 9df9d2f0471b4c4702670380b8d8a45b40b23a7d
> > Author: Thomas Gleixner <tglx@linutronix.de>
> > Date:   Wed Jun 14 01:39:39 2023 +0200
> >=20
> >     init: Invoke arch_cpu_finalize_init() earlier
> >    =20
> >     X86 is reworking the boot process so that initializations which are=
 not
> >     required during early boot can be moved into the late boot process =
and out
> >     of the fragile and restricted initial boot phase.
> >    =20
> >     arch_cpu_finalize_init() is the obvious place to do such initializa=
tions,
> >     but arch_cpu_finalize_init() is invoked too late in start_kernel() =
e.g. for
> >     initializing the FPU completely. fork_init() requires that the FPU =
is
> >     initialized as the size of task_struct on X86 depends on the size o=
f the
> >     required FPU register buffer.
> >    =20
> >     Fortunately none of the init calls between calibrate_delay() and
> >     arch_cpu_finalize_init() is relevant for the functionality of
> >     arch_cpu_finalize_init().
> >    =20
> >     Invoke it right after calibrate_delay() where everything which is r=
elevant
> >     for arch_cpu_finalize_init() has been set up already.
> >    =20
> >     No functional change intended.
> >    =20
> >     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> >     Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> >     Link: https://lore.kernel.org/r/20230613224545.612182854@linutronix=
=2Ede
> >=20
> >  init/main.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > Since it might be relevant, my CPU is Intel Core i5-12400 with UEFI fro=
m december 2022 and the compiler is gcc (Gentoo Hardened 13.1.1_p20230527 p=
3) 13.1.1 20230527. If additional information such as the kernel configurat=
ion is required, let me know.
>=20
> See Bugzilla for the full thread.
>=20
> The reporter can't provide requested dmesg due to this is early
> boot failure, unfortunately.
>=20
> Nevertheless, this regression has already been taken care of on
> Bugzilla, but to ensure it is tracked and doesn't get fallen through
> cracks unnoticed, I'm adding it to regzbot:
>=20
> #regzbot introduced: 9df9d2f0471b https://bugzilla.kernel.org/show_bug.cg=
i?id=3D217602
> #regzbot title: early arch_cpu_finalize_init() cause immediate boot failu=
re
>=20

#regzbot fix: 0303c9729afc40

--=20
An old man doll... just what I always wanted! - Clara

--1Y2CUzrFU0UJ5NVe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZKAbmQAKCRD2uYlJVVFO
o+rcAQDuovUL5Ax0sXesVsBWrU8ClRKMg+GF/SJpC0s0l5BY+AEA55qrJEQbGNL9
az1c2oJS1pTEX/fmd9n0wtLXRFR40AU=
=u45Q
-----END PGP SIGNATURE-----

--1Y2CUzrFU0UJ5NVe--
