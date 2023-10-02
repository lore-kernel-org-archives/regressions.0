Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471ACC2DF
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 10:42:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68bed2c786eso12987951b3a.0
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696243371; x=1696848171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GMI92IRtHLN/QzcAW884cPXY3nDWtnrgER4ifF4JNpE=;
        b=KCflT9/e/PcBrJYFHxyyMCroBqfXQsS+uVAs42NQR6oCRx23W15wwQfN2Afb8hxjWQ
         LI9RoNKpcyvNrPcwurI84RKIz9oaS2NJkuMBjkSr3PyC9ot2J1QQJx0w34j4GPq9C+Qz
         5bZ9HtGHBGEFyiAMIQNGIRzK92VM8BDqGmJPCeNPoyusfR3vDUkryAL9qaCR6Zm4R5ND
         /TXNCwX4tO2c8l0IozQEg+dP/RZgHGbAbWaL2a66MJ+pQUlvSi5+dufAVcqf4KHvXYlV
         Jg0eNmSEYpuVhmY829aE6N5oa3gSSh1YF6xhS1RaZEBVpt4ASCY5Zb3gF8ZFG/2oC/i7
         cXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696243371; x=1696848171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMI92IRtHLN/QzcAW884cPXY3nDWtnrgER4ifF4JNpE=;
        b=K0vny1deRK4GGa/+BLd1gSGPxelf07Be0muaupGThfBxTLrQO3qkJsj6bcnGAtFbrD
         pSPcP9bzWzToOZp+g58VK+5uEwDkmCvW2enRJQP2TBR6RJFfh+U3d74pxYcewJi1ye6P
         F+Q36Q+MW4kLUzSEYk8Wg9IgQhla2QRVnau9JUFvSAhlRAedEdp/MeajjGTFzhh6S5Zu
         SvhUWT2EqGE24TLnlIt1dxLABbzCakBvoitAICgI5PG1V57NEozXs9ueZdCNBz1E7gIq
         7W2/J61f93GKnXF43Ka8hrgwfDkKvJhr9YD+pMwILLj6X1Iidw5mMbxGgSYdB2YjYNvi
         KZoA==
X-Gm-Message-State: AOJu0Yzaxp9nrkWXi7FTKXCD9dqWrb/tk9Az/QWaIbysYRRtIEBjDYtU
	JHengC0cX19Z60PuxeepUIg=
X-Google-Smtp-Source: AGHT+IHXsR9Zxf1BwuGtn07GUyXdN18yKvsJMjQoR62WPOWwKUWuJGmIRqi8gHrrWJWmurokOLeQnA==
X-Received: by 2002:a05:6a00:178f:b0:68e:2eed:5ab0 with SMTP id s15-20020a056a00178f00b0068e2eed5ab0mr12390704pfg.7.1696243371433;
        Mon, 02 Oct 2023 03:42:51 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78e51000000b0064d74808738sm19140874pfr.214.2023.10.02.03.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 03:42:49 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id CC01688F0C53; Mon,  2 Oct 2023 17:42:42 +0700 (WIB)
Date: Mon, 2 Oct 2023 17:42:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
	linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZRqeoiZ2ayrAR6AV@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name>
 <ZRoEqEPxPAz3QlEz@debian.me>
 <2701570.mvXUDI8C0e@natalenko.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+4x4782bxzLSt9mO"
Content-Disposition: inline
In-Reply-To: <2701570.mvXUDI8C0e@natalenko.name>


--+4x4782bxzLSt9mO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2023 at 08:20:15AM +0200, Oleksandr Natalenko wrote:
> Hello.
>=20
> On pond=C4=9Bl=C3=AD 2. =C5=99=C3=ADjna 2023 1:45:44 CEST Bagas Sanjaya w=
rote:
> > On Sun, Oct 01, 2023 at 06:32:34PM +0200, Oleksandr Natalenko wrote:
> > > Hello.
> > >=20
> > > I've got a VM from a cloud provider, and since v6.5 I observe the fol=
lowing kfence splat in dmesg during boot:
> > >=20
> > > ```
> > > BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
> > >=20
> > > Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! =
! ! ] (in kfence-#108):
> > >  drm_gem_put_pages+0x186/0x250
> > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > >  drm_fb_helper_damage_work+0x96/0x170
> > >  process_one_work+0x254/0x470
> > >  worker_thread+0x55/0x4f0
> > >  kthread+0xe8/0x120
> > >  ret_from_fork+0x34/0x50
> > >  ret_from_fork_asm+0x1b/0x30
> > >=20
> > > kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3D3072, cach=
e=3Dkmalloc-4k
> > >=20
> > > allocated by task 51 on cpu 0 at 14.668667s:
> > >  drm_gem_get_pages+0x94/0x2b0
> > >  drm_gem_shmem_get_pages+0x5d/0x110
> > >  drm_gem_shmem_object_vmap+0xc4/0x1e0
> > >  drm_gem_vmap_unlocked+0x3c/0x70
> > >  drm_client_buffer_vmap+0x23/0x50
> > >  drm_fbdev_generic_helper_fb_dirty+0xae/0x310
> > >  drm_fb_helper_damage_work+0x96/0x170
> > >  process_one_work+0x254/0x470
> > >  worker_thread+0x55/0x4f0
> > >  kthread+0xe8/0x120
> > >  ret_from_fork+0x34/0x50
> > >  ret_from_fork_asm+0x1b/0x30
> > >=20
> > > freed by task 51 on cpu 0 at 14.668697s:
> > >  drm_gem_put_pages+0x186/0x250
> > >  drm_gem_shmem_put_pages_locked+0x43/0xc0
> > >  drm_gem_shmem_object_vunmap+0x83/0xe0
> > >  drm_gem_vunmap_unlocked+0x46/0xb0
> > >  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
> > >  drm_fb_helper_damage_work+0x96/0x170
> > >  process_one_work+0x254/0x470
> > >  worker_thread+0x55/0x4f0
> > >  kthread+0xe8/0x120
> > >  ret_from_fork+0x34/0x50
> > >  ret_from_fork_asm+0x1b/0x30
> > >=20
> > > CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a41731=
14d86eef7240f7a080080cfc4617e
> > > Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
> > > Workqueue: events drm_fb_helper_damage_work
> > > ```
> > >=20
> > > This repeats a couple of times and then stops.
> > >=20
> > > Currently, I'm running v6.5.5. So far, there's no impact on how VM fu=
nctions for me.
> > >=20
> > > The VGA adapter is as follows: 00:02.0 VGA compatible controller: Cir=
rus Logic GD 5446
> > >=20
> >=20
> > Do you have this issue on v6.4?
>=20
> No, I did not have this issue with v6.4.
>=20

Then proceed with kernel bisection. You can refer to
Documentation/admin-guide/bug-bisect.rst in the kernel sources for the
process.

--=20
An old man doll... just what I always wanted! - Clara

--+4x4782bxzLSt9mO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRqeogAKCRD2uYlJVVFO
o2E/AP4mkPIRMN1pxgfPOxihOOpbAOD45QVbnFzi6dWZJJX9QwD/RduMVyDlPWBa
eprgw5T0M5sCo+65kgP0ZWUTWNGBvQM=
=k2Qb
-----END PGP SIGNATURE-----

--+4x4782bxzLSt9mO--
