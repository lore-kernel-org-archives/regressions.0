Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7745E320A04
	for <regressions@lists.linux.dev>; Wed, 24 Dec 2025 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558501; cv=none; b=GKk7T0kHLY1BT0SWTm58gfWnIrgVVNOypj5PD7noos5PoLfbK1mXeY1CLBjy6kADb0cToBfNBsPgD190Y/PY3UbHto9ats/82U/Ket6GaDBypRX60LUZ9FWTnWX/jJGWuzIuqZ8gERW26kP1Rg7Xn+dyH+W6COFHDRI5bvicb78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558501; c=relaxed/simple;
	bh=bq+vufCo8wRGet2ZSxB+C5P+sd2ZOC5WrglH1AMUSBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMubc6q6a63g+Uc097bbkiQUVAZMCbu+NPR6HGrN1QIZtexPK474pMGD67xfshKiwhPR96w+8eGVwoI+4awisN3sdn694mPo1AOjzTF9jdHNN7jac6VYvCN2iVQVovUOpRiL5oAkA4jt9bqQzuXhFQshHYLCgRpj0MAmXxAFMA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt91CWRQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt91CWRQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c21417781so5628192a91.3
        for <regressions@lists.linux.dev>; Tue, 23 Dec 2025 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766558500; x=1767163300; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bq+vufCo8wRGet2ZSxB+C5P+sd2ZOC5WrglH1AMUSBc=;
        b=Tt91CWRQgkxiEafDlNeO9uVhfrt5SVC3SnYKsk1Kmib4it2fz4aFqoKPwXvo+1xwrr
         KkZ7zac4B/atFcFhiUQCETL3MFXVPsaGZqhvBaWx82ca/ynpMq5Kh5FBtWQ4xkV/MC4x
         RMpXm4nKbdTe9kVlzm3XUTutfNWMBM0oUNvfPZtqsb5fdJqpFn3Wd0TtXbVJzuhYxuVq
         g27NU/1PuSUa9yMNK7cT4ogFcQOoH+mkhW9UCrFOzmCjbf1nqDHj+EY33McZJ+m7OhHe
         QcaDjc8RYG9XmsUKQ5MitAvseM9muLMwn8bPGmc5PZjSalGer7RMISbqANSSmfhgVUn4
         ZQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558500; x=1767163300;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq+vufCo8wRGet2ZSxB+C5P+sd2ZOC5WrglH1AMUSBc=;
        b=CPQKOnCFjWpo553fWO08xQk8hSxd+/9+a/bRdd8sodpRTB4GGfnwuPGJzyCrDm/f8u
         laW0PQtSkjwxPDHOJmXwCeo2GIsDO4BBYO9KUw7kxaIxQa3bWHJE3v05nF813nT2OI1V
         AbVJavLGRhjd/og+6Cb4cT1xriShLkV2rM7TLGFjSi8dlACr2fdq8J22V0xPEUZsEcSJ
         siSteRY4EA8JVZVbpB6Zb0H2+MIZsPwdGOS3LEZFANsCf1g7egKmg+LOa/iW9ka9aRTQ
         F3qNzGvey+cG5Roe4hbooynwOdHH4VSQICeS/ypD0KjmIS3mGkWySIOz5r6XZyCnz6/2
         BJQw==
X-Forwarded-Encrypted: i=1; AJvYcCVqc11HqtJRDJLIa4K/B82+cgzQutOcBhfIvL8NMu9BeCl9AhJ70MLZzztenrEGErGOxs1G66aYHz8EKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOOBFgIS4NZ7Rm8/lE5yZPJmTx4s87tMdzPp09fKiKSIOGfP77
	t5z1Okny2FPsAw5SUjN8bbGZ9aZKQ7snD/hBPnxCy2g9eadh895VA74q
X-Gm-Gg: AY/fxX4AzjxuMVjX5CvYYsMqjxtzOmFwKXZCL15dfkDkeeZ+CwM/Z6jglYI5h4QJp2l
	OXJFvBQWadqIHBIawdPaa/wL+Pa5N4WCbeDNWh3ObHRGFTApJq5Aa/V+49Ejzyiyf89GtkXJENi
	b4nTnltjooJZuXyABbykiEqhWahwETl46c9L5cz6WWwxQI7WK1BDhdc/utXx9m/jMTXDBRUyiye
	LzB2UENAxqGuwdLvyiR081oUeMxhAI59XVGwSlzqQt74tmAd/GWej+Aa5yX3mP0ZoJgyU+uOMS0
	ns3rK9wDpjhyPzs+TNa0Q9W1iYswc56BKwlC8c6NExAoLnOwIqDSwMoN4uPBJFJsBpzDoHfRKg2
	7NXr/p4vCMFerDzqtvyvq3wdvzEBZbNYYpEDuQ/oTMVe2OTpH67C+V1JaDm9n5FPGaC3qhirwbk
	MHKkkBYQa+928=
X-Google-Smtp-Source: AGHT+IEgCZoyx2O75kxoEMfoJk/QK1exkq2h58uTDwsgQiSgm5wW6qFv0Xa6ZtRpSo46krMU5VkaMg==
X-Received: by 2002:a17:90b:6c7:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-34e921d6cbamr13205903a91.34.1766558499526;
        Tue, 23 Dec 2025 22:41:39 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223adf5sm14661068a91.14.2025.12.23.22.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:41:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id ECD6A420A81F; Wed, 24 Dec 2025 13:41:35 +0700 (WIB)
Date: Wed, 24 Dec 2025 13:41:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aUuLHzk5jdyBAxD7@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ZYU0AtWDRBkFeIb"
Content-Disposition: inline


--8ZYU0AtWDRBkFeIb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Building htmldocs on docs-next currenly produces about 50 new warnings; whi=
ch
all of them are unexpected section title on DOC: kernel-doc directive, like:

/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers=
/target/target_core_user.c:35: CRITICAL: Unexpected section title.

Userspace I/O
------------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'U=
serspace I/O' ./drivers/target/target_core_user.c' processing failed with: =
SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/targe=
t:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section=
 title.\n\nUserspace I/O\n-------------')
/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include=
/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.

Ring Design
----------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'R=
ing Design' ./include/uapi/linux/target_core_user.h' processing failed with=
: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/tar=
get:28: ./include/uapi/linux/target_core_user.h:14: (SEVERE/4) Unexpected s=
ection title.\n\nRing Design\n-----------')

These turns out to be false-positive as touching the source file in question
(e.g. drivers/target/target_core_user.c) and making htmldocs again makes the
regression go away for the corresponding docs.

Bisection (with git-bisect(1)) points to bea467aa5da1f5 ("docs: media:
v4l2-ioctl.h: document two global variables") as the first bad commit, even
though that I suspect that bdd1cf87847ff6 ("kernel-doc: add support to hand=
le
DEFINE_ variables") may be the actual culprit (regressor).

The full bisection log:

git bisect start
# status: waiting for both good and bad commits
# bad: [7f3c3a0a9103dc92c823f27db3284ac2914e7558] MAINTAINERS: Add doc file=
s on real-time support to Real-time Linux
git bisect bad 7f3c3a0a9103dc92c823f27db3284ac2914e7558
# status: waiting for good commit(s), bad commit known
# good: [9448598b22c50c8a5bb77a9103e2d49f134c9578] Linux 6.19-rc2
git bisect good 9448598b22c50c8a5bb77a9103e2d49f134c9578
# bad: [5188f6bd408f937d81c0c37eb59ddc1035cd912c] docs: admin: devices: /de=
v/sr<N> for SCSI CD-ROM
git bisect bad 5188f6bd408f937d81c0c37eb59ddc1035cd912c
# bad: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h=
: document two global variables
git bisect bad bea467aa5da1f51834501da3ac3c40204027a221
# good: [82e87387f6e2af9f69a7528733e953fd22e815aa] Documentation: kernel-ha=
cking: Remove comma
git bisect good 82e87387f6e2af9f69a7528733e953fd22e815aa
# good: [bdd1cf87847ff6aaadd53a185209d2bb2db72165] kernel-doc: add support =
to handle DEFINE_ variables
git bisect good bdd1cf87847ff6aaadd53a185209d2bb2db72165
# first bad commit: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media:=
 v4l2-ioctl.h: document two global variables

Mauro: Since you're the author of regressor, can you please take a look on =
it?

Thanks.

#regzbot introduced: bea467aa5da1f5

--=20
An old man doll... just what I always wanted! - Clara

--8ZYU0AtWDRBkFeIb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUuLFgAKCRD2uYlJVVFO
o83XAQCJcTXukZzv0/X0PWBYI57OBqNpUtvshGIWlzzmT8UfxQD+Ip7xjplmoYLi
6BbKfNq/aBq8OqXAEbKfzatPtLOg+gU=
=AUip
-----END PGP SIGNATURE-----

--8ZYU0AtWDRBkFeIb--
