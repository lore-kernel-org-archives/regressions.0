Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23382B67E
	for <regressions@lists.linux.dev>; Sun,  1 Oct 2023 23:45:48 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-692b2bdfce9so12820128b3a.3
        for <regressions@lists.linux.dev>; Sun, 01 Oct 2023 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696203948; x=1696808748; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8vvjOV/SJHwlBfuAQ9Hpu2fBDMywi9nmiPQcO1/0180=;
        b=WdovxW7/Vo186j3QdAVRbB7N3SIGtb4qXMdlyYO/BjVPx0hDyZ5mMXICkMkiUUiUbt
         6PPbymZ3R30CHl01mi1wX+hqv3DfKDst5/SLVHf4OAQgezD+ohCaHFmJox0LP8EsLQP9
         7sa8LNLGihfBkVupGbiFxnkqEsbr//bVLZUUhu7OLLybIyP4JI9P10bTHMZ0LJIzzwMp
         oZvZCeUzF8Kv5JdJ8tyAY8oQEAn8G1e3tZORXkBJCKU/9DltFx0GrhRbICbKEVyiaXfs
         AVBcQXP+uLs3DGQmZ8futTPnVHnD3N1CMxAp3i/UOYMxOOKrm/RjtrwUIIz7PqvkYDsl
         kvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696203948; x=1696808748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vvjOV/SJHwlBfuAQ9Hpu2fBDMywi9nmiPQcO1/0180=;
        b=bgGhfYdX70pXTwIU8nPbRmWNfjmNyg5LlzVUFee0sIBPrIhGrJzK43jxFKwOSZeEVF
         YUv1O9apmQ2zMXVTapkKHsKO2MjKlpXhPnNeFQOSPreHDgSvYVH5jLDIuOC8yfRhGGay
         8nL17elcL1geNlplXnORJIQZZQlZfcb0+riGfJ1OiqMkedP9BqDCafR8RLMhfwRoGnMj
         QrNBVq4KiFJODYlJpTfLDDNvw59MbEuvWg/Qk9UndHh34Dt5x0WXD/QD9j5uaREvC7ng
         Onlykh60yzF/4u0VhektAAyfpVpn1enNc5GnB+GV9YYG/zAKPSl86YXpnv20Z7BU3bhx
         76Qg==
X-Gm-Message-State: AOJu0YwiS01piVvLxAJSoEcmIpRdeM2T6g6QktwVcM+bL9Oh6OIekkO1
	JPkzSaK3Am16/xaJhzI2Xpc=
X-Google-Smtp-Source: AGHT+IHz8QtBxh5UpcXHxqq1V7wU5Le8vKu+zUqpAxF2dUNjqVwWaUCWgNdN7SxncLebsJNcFYx8tQ==
X-Received: by 2002:a05:6a00:982:b0:68e:36bc:194a with SMTP id u2-20020a056a00098200b0068e36bc194amr13053460pfg.15.1696203948274;
        Sun, 01 Oct 2023 16:45:48 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id f1-20020aa782c1000000b0069305627494sm10416369pfn.165.2023.10.01.16.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 16:45:47 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0070F8017C4F; Mon,  2 Oct 2023 06:45:44 +0700 (WIB)
Date: Mon, 2 Oct 2023 06:45:44 +0700
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
Message-ID: <ZRoEqEPxPAz3QlEz@debian.me>
References: <13360591.uLZWGnKmhe@natalenko.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yoF7gxy4SjBfUd1U"
Content-Disposition: inline
In-Reply-To: <13360591.uLZWGnKmhe@natalenko.name>


--yoF7gxy4SjBfUd1U
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

Do you have this issue on v6.4?

--=20
An old man doll... just what I always wanted! - Clara

--yoF7gxy4SjBfUd1U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRoEoAAKCRD2uYlJVVFO
o9s5AP9kGuHk47ES1xM3sSRWMksEAyOgSfb9PPRtW2GW6eLYrwEAncNNUUPjdgsp
of+ra71dF0EDOM0682RgxNmO1A/YTQw=
=/Uxd
-----END PGP SIGNATURE-----

--yoF7gxy4SjBfUd1U--
