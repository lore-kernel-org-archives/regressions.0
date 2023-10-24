Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C916749D
	for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3YKKlJB"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cace3e142eso32438695ad.3
        for <regressions@lists.linux.dev>; Tue, 24 Oct 2023 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698191714; x=1698796514; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thdgCTpvbZS3oq9cGIap/3y/n4WGpMq6KyvnJanB62U=;
        b=M3YKKlJB0pdGsqKDiwkX2A3fAOq7tH1okVgKCvE54NISqr5obp+fvoJBbyOeKPF2cm
         X//b8iPg7S6GVw0dAgw9NDrl6S5bMw4g5fW9UwE1Bq78Xe7iJyqCG8rrTQUnkK6EwoFR
         vSE5iBkL2iQ8kj1e7Ldktz4ax4Xu6/U0pM70NizQudZCR05hNvc+75T6y1UYEV5bO/1R
         yJqxNcS0DTN89lQila5931Scq3GcUkQGI7+PIuQmcy9UgPR7SL1qNInqUECyTdRo746M
         nLP42hfP/bzPldx5Zm+9RKjkYchL30xe/suWRuddipY3X8tfUyS3uhpyg7a7ksgaw1sc
         K33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698191714; x=1698796514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thdgCTpvbZS3oq9cGIap/3y/n4WGpMq6KyvnJanB62U=;
        b=chrZlQwYhJ+aiSF+I1WHHNZYcCrJC3Kml2VoB1YbFHjfgwqXpLA1g8pkVlaNX9nhU9
         GVATGH/MNQv3Clo4VsK0n3UiHQy+PiQWjIo030xMMK3lDR3UmXlg8gEEjvb+eUlyKX/g
         2+xfjRYuKZKyS9A4XuLDP05cvaUXRG3ue9Q6l0Q/vhfAv4KHH7cmHcQC4U2717TU9YdS
         N97YGDnsIYANHRT9eZfQLyDAhu5I1DGxrlfaiNUCWoTP/25WeF0HlvvV9lXO9D4vBztd
         KxEfzGCDQz5OmBvl98Pdcjo064TtZ6TL/hHk/OaZ2m69XBueYF6g7jWiYW3UkZXp3IWJ
         0w7g==
X-Gm-Message-State: AOJu0YztbKXlwuX19xsmGaMD7/xurTdKtfaUW+LgKUmfN3z2t88P2AUS
	PCtTlQNEcQrwJUDTjJ4xof0=
X-Google-Smtp-Source: AGHT+IE1UpnPoOj21xfHgy3JM9Ey6R1MSStCWRv0b3Pf5VBsYVhfu/LRmr4dprYuQ7vy0QCQQQpYJw==
X-Received: by 2002:a17:90b:4a0a:b0:27d:3c11:3610 with SMTP id kk10-20020a17090b4a0a00b0027d3c113610mr9984852pjb.33.1698191714201;
        Tue, 24 Oct 2023 16:55:14 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id gp3-20020a17090adf0300b00263154aab24sm7481159pjb.57.2023.10.24.16.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 16:55:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 86EF7819CFF3; Wed, 25 Oct 2023 06:55:09 +0700 (WIB)
Date: Wed, 25 Oct 2023 06:55:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Salvatore Bonaccorso <carnil@debian.org>,
	Timo Lindfors <timo.lindfors@iki.fi>, 1054514@bugs.debian.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	SPICE Mailing List <spice-devel@lists.freedesktop.org>,
	Dave Airlie <airlied@redhat.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
Message-ID: <ZThZXbOKM5cKcYEU@debian.me>
References: <alpine.DEB.2.20.2310242308150.28457@mail.home>
 <ZTgydqRlK6WX_b29@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LAf/OgrYnq7/dPdn"
Content-Disposition: inline
In-Reply-To: <ZTgydqRlK6WX_b29@eldamar.lan>


--LAf/OgrYnq7/dPdn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 11:09:10PM +0200, Salvatore Bonaccorso wrote:
> Hi Timo,
>=20
> On Tue, Oct 24, 2023 at 11:14:32PM +0300, Timo Lindfors wrote:
> > Package: src:linux
> > Version: 6.1.55-1
> > Severity: normal
> >=20
> > Steps to reproduce:
> > 1) Install Debian 12 as a virtual machine using virt-manager, choose qxl
> >    graphics card. You only need basic installation without wayland or X.
> > 2) Login from the console and save th=C3=AB following to reproduce.bash:
> >=20
> > #!/bin/bash
> >=20
> > chvt 3
> > for j in $(seq 80); do
> >     echo "$(date) starting round $j"
> >     if [ "$(journalctl --boot | grep "failed to allocate VRAM BO")" !=
=3D "" ];
> > then
> >         echo "bug was reproduced after $j tries"
> >         exit 1
> >     fi
> >     for i in $(seq 100); do
> >         dmesg > /dev/tty3
> >     done
> > done
> >=20
> > echo "bug could not be reproduced"
> > exit 0
> >=20
> >=20
> > 3) Run chmod a+x reproduce.bash
> > 4) Run ./reproduce.bash and wait for up to 20 minutes.
> >=20
> > Expected results:
> > 4) The system prints a steady flow of text without kernel error messages
> >=20
> > Actual messages:
> > 4) At some point the text stops flowing and the script prints "bug was
> >    reproduced". If you run "journalctl --boot" you see
> >=20
> > kernel: [TTM] Buffer eviction failed
> > kernel: qxl 0000:00:02.0: object_init failed for (3149824, 0x00000001)
> > kernel: [drm:qxl_alloc_bo_reserved [qxl]] *ERROR* failed to allocate VR=
AM BO
> >=20
> >=20
> >=20
> > More info:
> > 1) The bug does not occur if I downgrade the kernel to
> >    linux-image-5.10.0-26-amd64_5.10.197-1_amd64.deb from Debian 11.
> > 2) I used the following test_linux.bash to bisect this issue against
> >    upstream source:
> >=20
> > #!/bin/bash
> > set -x
> >=20
> > gitversion=3D"$(git describe HEAD|sed 's@^v@@')"
> >=20
> > git checkout drivers/gpu/drm/ttm/ttm_bo.c include/drm/ttm/ttm_bo_api.h
> > git show bec771b5e0901f4b0bc861bcb58056de5151ae3a | patch -p1
> > # Build
> > cp ~/kernel.config .config
> > # cp /boot/config-$(uname -r) .config
> > # scripts/config --enable LOCALVERSION_AUTO
> > # scripts/config --disable DEBUG_INFO
> > # scripts/config --disable SYSTEM_TRUSTED_KEYRING
> > # scripts/config --set-str SYSTEM_TRUSTED_KEYS ''
> > # scripts/config --disable STACKPROTECTOR_STRONG
> > make olddefconfig
> > # make localmodconfig
> > make -j$(nproc --all) bindeb-pkg
> > rc=3D"$?"
> > if [ "$rc" !=3D "0" ]; then
> >     exit 125
> > fi
> > git checkout drivers/gpu/drm/ttm/ttm_bo.c include/drm/ttm/ttm_bo_api.h
> >=20
> > package=3D"$(ls --sort=3Dtime ../linux-image-*_amd64.deb|head -n1)"
> > version=3D$(echo $package | cut -d_ -f1|cut -d- -f3-)
> >=20
> > if [ "$gitversion" !=3D "$version" ]; then
> >     echo "Build produced version $gitversion but got $version, ignoring"
> >     #exit 255
> > fi
> >=20
> > # Deploy
> > scp $package target:a.deb
> > ssh target sudo apt install ./a.deb
> > ssh target rm -f a.deb
> > ssh target ./grub_set_default_version.bash $version
> > ssh target sudo shutdown -r now
> > sleep 40
> >=20
> > detected_version=3D$(ssh target uname -r)
> > if [ "$detected_version" !=3D "$version" ]; then
> >     echo "Booted to $detected_version but expected $version"
> >     exit 255
> > fi
> >=20
> > # Test
> > exec ssh target sudo ./reproduce.bash
> >=20
> >=20
> > Bisect printed the following log:
> >=20
> > git bisect start
> > # bad: [ed29c2691188cf7ea2a46d40b891836c2bd1a4f5] drm/i915: Fix userptr=
 so we do not have to worry about obj->mm.lock, v7.
> > git bisect bad ed29c2691188cf7ea2a46d40b891836c2bd1a4f5
> > # bad: [762949bb1da78941b25e63f7e952af037eee15a9] drm: fix drm_mode_cre=
ate_blob comment
> > git bisect bad 762949bb1da78941b25e63f7e952af037eee15a9
> > # bad: [e40f97ef12772f8eb04b6a155baa1e0e2e8f3ecc] drm/gma500: Drop DRM_=
GMA600 config option
> > git bisect bad e40f97ef12772f8eb04b6a155baa1e0e2e8f3ecc
> > # bad: [5a838e5d5825c85556011478abde708251cc0776] drm/qxl: simplify qxl=
_fence_wait
> > git bisect bad 5a838e5d5825c85556011478abde708251cc0776
> > # bad: [d2b6f8a179194de0ffc4886ffc2c4358d86047b8] Merge tag 'xfs-5.13-m=
erge-3' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
> > git bisect bad d2b6f8a179194de0ffc4886ffc2c4358d86047b8
> > # bad: [68a32ba14177d4a21c4a9a941cf1d7aea86d436f] Merge tag 'drm-next-2=
021-04-28' of git://anongit.freedesktop.org/drm/drm
> > git bisect bad 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
> > # bad: [0698b13403788a646073fcd9b2294f2dce0ce429] drm/amdgpu: skip PP_M=
P1_STATE_UNLOAD on aldebaran
> > git bisect bad 0698b13403788a646073fcd9b2294f2dce0ce429
> > # bad: [e1a5e6a8c48bf99ea374fb3e535661cfe226bca4] drm/doc: Add RFC sect=
ion
> > git bisect bad e1a5e6a8c48bf99ea374fb3e535661cfe226bca4
> > # bad: [ed29c2691188cf7ea2a46d40b891836c2bd1a4f5] drm/i915: Fix userptr=
 so we do not have to worry about obj->mm.lock, v7.
> > git bisect bad ed29c2691188cf7ea2a46d40b891836c2bd1a4f5
> > # bad: [2c8ab3339e398bbbcb0980933e266b93bedaae52] drm/i915: Pin timelin=
e map after first timeline pin, v4.
> > git bisect bad 2c8ab3339e398bbbcb0980933e266b93bedaae52
> > # bad: [2eb8e1a69d9f8cc9c0a75e327f854957224ba421] drm/i915/gem: Drop re=
location support on all new hardware (v6)
> > git bisect bad 2eb8e1a69d9f8cc9c0a75e327f854957224ba421
> > # bad: [b5b6f6a610127b17f20c0ca03dd27beee4ddc2b2] drm/i915/gem: Drop le=
gacy execbuffer support (v2)
> > git bisect bad b5b6f6a610127b17f20c0ca03dd27beee4ddc2b2
> > # bad: [06debd6e1b28029e6e77c41e59a162868f377897] Merge tag 'drm-intel-=
next-2021-03-16' of git://anongit.freedesktop.org/drm/drm-intel into drm-ne=
xt
> > git bisect bad 06debd6e1b28029e6e77c41e59a162868f377897
> > # good: [e19eede54240d64b4baf9b0df4dfb8191f7ae48b] Merge branch 'dmi-fo=
r-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging
> > git bisect good e19eede54240d64b4baf9b0df4dfb8191f7ae48b
> > # good: [1e28eed17697bcf343c6743f0028cc3b5dd88bf0] Linux 5.12-rc3
> > git bisect good 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
> > # bad: [6af70eb3b40edfc8bdf2373cdc2bcf9d5a20c8c7] drm/atmel-hlcdc: Rena=
me custom plane state variable
> > git bisect bad 6af70eb3b40edfc8bdf2373cdc2bcf9d5a20c8c7
> > # good: [4ca77c513537700d3fae69030879f781dde1904c] drm/qxl: release sha=
dow on shutdown
> > git bisect good 4ca77c513537700d3fae69030879f781dde1904c
> > # bad: [4a11bd1e88af130f50a72e0f54391c1c7d268e03] drm/ast: Add constant=
s for VGACRCB register bits
> > git bisect bad 4a11bd1e88af130f50a72e0f54391c1c7d268e03
> > # bad: [5c209d8056b9763ce544ecd7dadb3782cdaf96ed] drm/gma500: psb_spank=
() doesn't need it's own file
> > git bisect bad 5c209d8056b9763ce544ecd7dadb3782cdaf96ed
> > # bad: [db0c6bd2c0c0dada8927cd46a7c34c316a3a6c04] drm/gem: Export drm_g=
em_vmap() and drm_gem_vunmap()
> > git bisect bad db0c6bd2c0c0dada8927cd46a7c34c316a3a6c04
> > # bad: [f4a84e165e6d58606097dd07b5b78767a94b870c] drm/qxl: allocate dum=
b buffers in ram
> > git bisect bad f4a84e165e6d58606097dd07b5b78767a94b870c
> > # good: [a7709b9b89a67f3ead2d188b1d0c261059b1f291] drm/qxl: handle shad=
ow in primary destroy
> > git bisect good a7709b9b89a67f3ead2d188b1d0c261059b1f291
> > # bad: [5a838e5d5825c85556011478abde708251cc0776] drm/qxl: simplify qxl=
_fence_wait
> > git bisect bad 5a838e5d5825c85556011478abde708251cc0776
> > # good: [5f6c871fe919999774e8535ea611a6f84ee43ee4] drm/qxl: properly fr=
ee qxl releases
> > git bisect good 5f6c871fe919999774e8535ea611a6f84ee43ee4
> > # first bad commit: [5a838e5d5825c85556011478abde708251cc0776] drm/qxl:=
 simplify qxl_fence_wait
> >=20
> > I took a look at
> >=20
> > commit 5a838e5d5825c85556011478abde708251cc0776 (refs/bisect/bad)
> > Author: Gerd Hoffmann <kraxel@redhat.com>
> > Date:   Thu Feb 4 15:57:10 2021 +0100
> >=20
> >     drm/qxl: simplify qxl_fence_wait
> >=20
> >     Now that we have the new release_event wait queue we can just
> >     use that in qxl_fence_wait() and simplify the code a lot.
> >=20
> >     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >     Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >     Link: http://patchwork.freedesktop.org/patch/msgid/20210204145712.1=
531203-10-kraxel@redhat.com
> >=20
> >=20
> > and noticed that the bug does not occur if I boot 6.1 kernel with this =
patch
> > reverted (see attached file).
>=20
> Thanks for the excelent constructed report! I think it's best to
> forward this directly to upstream including the people for the
> bisected commit to get some idea.
>=20
> Can you reproduce the issue with 6.5.8-1 in unstable as well?
>=20
> If not, are you able to isolate an upstream fix which should be
> backported to the 6.1.y series as well?
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 5a838e5d5825c8
#regzbot title: simplifying qxl_fence_wait() makes VRAM BO allocation fail
#regzbot from: Timo Lindfors <timo.lindfors@iki.fi>

--=20
An old man doll... just what I always wanted! - Clara

--LAf/OgrYnq7/dPdn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZThZVgAKCRD2uYlJVVFO
o5HjAP98nbWC4dZbwIlA9kDU3CG6oq63fhGY6yFcz2ZTRHsrnwD/TTbcAlBed8WT
bhW01ImofkiTNcl7fOn267GgraSUWww=
=FIHw
-----END PGP SIGNATURE-----

--LAf/OgrYnq7/dPdn--
