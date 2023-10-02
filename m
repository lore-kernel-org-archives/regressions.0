Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11F1C02
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 10:40:50 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-578e33b6fb7so10991717a12.3
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696243250; x=1696848050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k9BO5D+Mkjuw7PSwT8qd3pRlmg1ZqF7ESwmXR7Zy97c=;
        b=eVVadLqZ9mUU92oMTVXEAirbrCyCKkZ389zazijCogj+iFe02iofq5RSjfysIwbJu6
         MDnFeHxW1mMEdvw9S5TV1dg25S3UARq55sW0c+AuHz842ekG2fO6PYh7w8tRTy/mpD16
         Dn2gkSwwCJH9ojxkpOV8qdOMhwnrjwZq2cTcwdA2NBvh9gdXjTsJNkoS7/t3PyIVD0n6
         cVuS8mQR+XFZ5YdyCBtkmtNWQAz95uIXyekSdDRVkW1E7ovdYowYrbGXiENBbGQG71SN
         76vEUD0bzdDnd+Yesd0p914hOO1BOB0t2Yv01tluhCHEPZmm9L+U+wkvmXMWnAD/KUqa
         4Qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696243250; x=1696848050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9BO5D+Mkjuw7PSwT8qd3pRlmg1ZqF7ESwmXR7Zy97c=;
        b=qaZ9v5wB/wRIfeKuRK6GvdwazSNMMkmtBDNvfPyajkifAw95PwQYmr/9lLMZlSaFfi
         rliM/DdNArk0fpB/Nhzm/f9HepreEYq6aFt/+5tRouSV7cXfBm+44nDDmkYQ5GMictAo
         A3BmqFq+8k9G/pf/PoDRAW0bq3//GJevB/LVRfl6APTU0u+h+1S//RyzkAxEat+kqoP7
         VuMnr0+gUmPpILgILD93NR/pHN3r10cdEj8DqZzqBvUbgjJKRLUMDAI4eYR5bXH6AGBu
         /QVp219Qb4QTD8sV+wfd+3kTbCDaZP2KQBhjQfb5hy7p8SVDnxyth3n2HGMe2nvqHqj+
         tcXg==
X-Gm-Message-State: AOJu0Ywmtkl4t6mvMKbATM3sN6YfCK//BFenYn9AV8cTW5giawZQAD0S
	jsvHT1OyKus/6JP0B2Zmjy0=
X-Google-Smtp-Source: AGHT+IFlnNgl9H4s1s1mbNRBP7UTYC/EN207XDgHcMg4TOAVrYrNv9S3E9tLPTTfOAc6vNuU6e6xLw==
X-Received: by 2002:a05:6a20:2447:b0:14c:5fa6:e308 with SMTP id t7-20020a056a20244700b0014c5fa6e308mr10801060pzc.43.1696243249963;
        Mon, 02 Oct 2023 03:40:49 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id h20-20020a170902f7d400b001c0c86a5415sm3085459plw.154.2023.10.02.03.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 03:40:49 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id E92F9813713B; Mon,  2 Oct 2023 17:40:43 +0700 (WIB)
Date: Mon, 2 Oct 2023 17:40:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Message-ID: <ZRqeK_OgfDS4liMt@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uM8moMeUE6uskfmd"
Content-Disposition: inline
In-Reply-To: <13360591.uLZWGnKmhe@natalenko.name>


--uM8moMeUE6uskfmd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 06:32:34PM +0200, Oleksandr Natalenko wrote:
> Hello.
>=20
> I've got a VM from a cloud provider, and since v6.5 I observe the followi=
ng kfence splat in dmesg during boot:
>=20
> ```
> BUG: KFENCE: memory corruption in drm_gem_put_pages+0x186/0x250
>=20
> Corrupted memory at 0x00000000e173a294 [ ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! =
] (in kfence-#108):
>  drm_gem_put_pages+0x186/0x250
>  drm_gem_shmem_put_pages_locked+0x43/0xc0
>  drm_gem_shmem_object_vunmap+0x83/0xe0
>  drm_gem_vunmap_unlocked+0x46/0xb0
>  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> kfence-#108: 0x00000000cda343af-0x00000000aec2c095, size=3D3072, cache=3D=
kmalloc-4k
>=20
> allocated by task 51 on cpu 0 at 14.668667s:
>  drm_gem_get_pages+0x94/0x2b0
>  drm_gem_shmem_get_pages+0x5d/0x110
>  drm_gem_shmem_object_vmap+0xc4/0x1e0
>  drm_gem_vmap_unlocked+0x3c/0x70
>  drm_client_buffer_vmap+0x23/0x50
>  drm_fbdev_generic_helper_fb_dirty+0xae/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> freed by task 51 on cpu 0 at 14.668697s:
>  drm_gem_put_pages+0x186/0x250
>  drm_gem_shmem_put_pages_locked+0x43/0xc0
>  drm_gem_shmem_object_vunmap+0x83/0xe0
>  drm_gem_vunmap_unlocked+0x46/0xb0
>  drm_fbdev_generic_helper_fb_dirty+0x1dc/0x310
>  drm_fb_helper_damage_work+0x96/0x170
>  process_one_work+0x254/0x470
>  worker_thread+0x55/0x4f0
>  kthread+0xe8/0x120
>  ret_from_fork+0x34/0x50
>  ret_from_fork_asm+0x1b/0x30
>=20
> CPU: 0 PID: 51 Comm: kworker/0:2 Not tainted 6.5.0-pf4 #1 8b557a4173114d8=
6eef7240f7a080080cfc4617e
> Hardware name: Red Hat KVM, BIOS 1.11.0-2.el7 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> ```
>=20
> This repeats a couple of times and then stops.
>=20
> Currently, I'm running v6.5.5. So far, there's no impact on how VM functi=
ons for me.
>=20
> The VGA adapter is as follows: 00:02.0 VGA compatible controller: Cirrus =
Logic GD 5446
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: v6.4..v6.5

--=20
An old man doll... just what I always wanted! - Clara

--uM8moMeUE6uskfmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRqeJgAKCRD2uYlJVVFO
o94vAQCdK24gbHlE/TSwSnvd8j9uYgtSWF/9JqsuTYcNEIa0QAEAqxCJP7ARfCvm
lDkVmrAMOBGxe7Qpk16rqel6QsVTZQQ=
=lq18
-----END PGP SIGNATURE-----

--uM8moMeUE6uskfmd--
