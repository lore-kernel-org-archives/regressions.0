Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E65522B
	for <regressions@lists.linux.dev>; Sun, 10 Dec 2023 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKEG8gGi"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7b373d61694so151147039f.2
        for <regressions@lists.linux.dev>; Sat, 09 Dec 2023 22:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702190441; x=1702795241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwGRPrCoVtYtP/8YMKF8dl0aRzTIJ031wO80hG9EGz4=;
        b=YKEG8gGiDWz2II6eeV0gD+puqJbhcE+uHCUyz+VHl3FiAsnqbECoGski7jhHoBTec3
         5unUv2LzQWq92iNTeC7sXmz6OYcLPvRidY68CqHhEgT3wn1Pj+6bIAjhBRVJTdVLk4nR
         eYFATJ3g7RmNtUpJ8ecPqnKWbTAg/k/xd59KGENZmK0FR/7gdFqw1D6ro+nfIRfdfR7G
         0R1DsQcPa518RHRXw4fnasNWzk2vdK3xBEp6u10YnWNIZ7U7xh9O2eELkWLb9RQvxeYv
         xBKhD7NBGDiFfFCR9XM4l/Uay2WJDKh6S4yilMF+SSNPsN7jD3ODPP92ZbcUXMu1AI1x
         1utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702190441; x=1702795241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwGRPrCoVtYtP/8YMKF8dl0aRzTIJ031wO80hG9EGz4=;
        b=ihrtdJczQ8awezLtpNLwXG7O2n6jWZKNr42rkS0JPfHHe/AA+4V/2t6Hu5zlzOfzXG
         EgIF04xMnroNrh3JXxD5QZNPqk084w8JNY8S3zq5pJ/Yf4B+Tu3DYHVeUONjM1I83wK6
         q4I+8uAAvDvi2GTcHXQpOoRtfjkoF4hAA5XiSx8m/JOJOxfpHX2kAQogCBlYfpXMdSih
         Pz4wyrhvL5jvAsdhEF5DssHj69mYfhkuQL7vG+xrrQcWqmWLZ8fBaABwOQTd1FyPJYWL
         VPHPDunfRZKJbP9MBdk0kibZxOP4WDzcbdwsfa9l0LezVigegBLYuPN1Ey+4JJ7114zj
         PLUQ==
X-Gm-Message-State: AOJu0YwZeRnEFguDeZV92soyI+0IJzpyEw2DJqS833YYfmx4rkglENqc
	SrI+aqQxH1mYoZoXGibGGZI=
X-Google-Smtp-Source: AGHT+IEifI7MN9YJEI6ra1cirsdo98LCVrV8vcB+XW9ZnTq3rQ1rfTw/up67VZJZuVnTYrJKhUmycg==
X-Received: by 2002:a05:6e02:1809:b0:35d:59a2:68f8 with SMTP id a9-20020a056e02180900b0035d59a268f8mr4041390ilv.37.1702190440961;
        Sat, 09 Dec 2023 22:40:40 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id r12-20020a6560cc000000b005bdd8dcfe19sm3522368pgv.10.2023.12.09.22.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 22:40:39 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6581B1021255E; Sun, 10 Dec 2023 13:40:36 +0700 (WIB)
Date: Sun, 10 Dec 2023 13:40:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	River <shibedrill1@gmail.com>, bwg <whirl@mniotilta.ca>
Subject: Re: Fwd: Kernel 6.6.1 hangs on "loading initial ramdisk"
Message-ID: <ZXVdZE3D-KFBqPnj@archie.me>
References: <9057d7de-f2e0-44ba-bec7-8b0861b2a850@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gXx8QI5a8w8OQ7EJ"
Content-Disposition: inline
In-Reply-To: <9057d7de-f2e0-44ba-bec7-8b0861b2a850@gmail.com>


--gXx8QI5a8w8OQ7EJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 07:06:50AM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > After upgrading from 6.5.9 to 6.6.1 on my Dell Latitude E6420 (Intel i5=
-2520M) with EndeavourOS, the boot process would hang at "loading initial r=
amdisk". The issue is present on the 6.6.1 release of both Linux and Linux-=
zen, but not the 6.5.9 release, which makes me think this is somehow upstre=
am in the kernel, rather than to do with packaging. My current workaround i=
s using the Linux LTS kernel.
> >=20
> > I have been unable to consistently reproduce this bug. Between 50 and 3=
0 percent of the time, the "loading initial ramdisk" will display, the disk=
 activity indicator will turn off briefly and then resume blinking, and the=
n the kernel boots as expected. The other 50 to 70 percent of the time, the=
 boot stops at "loading initial ramdisk" and the disk activity indicator tu=
rns off, and does not resume blinking. The disk activity light is constantl=
y flashing during normal system operation, so I know it's not secretly boot=
ing but not updating the display. I haven't been able to replicate this iss=
ue in QEMU. I have seen similar bugs that have been solved by disabling IOM=
MU, but this has not had any effect. Neither has disabling graphics drivers=
 and modesetting. I have been able to reproduce it while using Nouveau, so =
I don't believe it has to do with Nvidia's proprietary drivers.
> >=20
> > Examining dmesg and journalctl, there doesn't appear to be ANY logs fro=
m the failed boots. I don't believe the kernel even is started on these fai=
led boots. Enabling GRUB debug messages (linux,loader,init,fs,device,disk,p=
artition) shows that the hang occurs after GRUB attempts to start the loade=
d image- it's able to load the image into memory, but the boot stalls after=
 "Starting image" with a hex address (presumably the start addr of the kern=
el). =20
> >=20
> > I've been trying to compile the kernel myself to see if I can solve the=
 issue, or at least aid in reproduceability, but this is not easy or fast t=
o do on a 2012 i5 processor. I'll update if I can successfully recompile th=
e kernel and if it yields any information. =20
> >=20
> > Please let me know if I should provide any additional information. This=
 is my first time filing a bug here.
>=20
> See Bugzilla for the full thread and attached grub output.
>=20
> Anyway, I'm adding this regression to regzbot:
>=20
> #regzbot introduced: v6.5..v6.6 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D218173
> #regzbot title: initramfs loading hang on nouveau system (Dell Latitude E=
6420)
>=20

Another reporter on Bugzilla had bisected the regression, so:

#regzbot introduced: a1b87d54f4e45f

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--gXx8QI5a8w8OQ7EJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZXVdYAAKCRD2uYlJVVFO
o7pFAP9pEeG9YYfrU018mAj4G3ZZwP4KRlBl3jIY8I/6/oQCSgEAoSNNgg6UoN4V
UwYNKa6CBSB8/Ylo9b3GxsN9zH+kjQ0=
=g92L
-----END PGP SIGNATURE-----

--gXx8QI5a8w8OQ7EJ--
