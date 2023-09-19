Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A44374ED
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 14:08:12 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5657add1073so3979508a12.0
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695132491; x=1695737291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQO/Pig1BMcd+vERj0f1AGV1ERLyyUdpnD52kVfXGaM=;
        b=WBHHiz/aEvXZVH2Y1rOVafieVQk9v9OxSk08+OowSWtbkLwlu8fOFC7KJbvrW/tO09
         kFZBxtCmMP6aSSo6ead6/sQ+EOoE+1ZXXGtv1ifEe+R1JthnBzVbEjGcdTF9jbKGdQST
         FLmcvaEWcyZGgSogsVD420mrTqz/4yZB+OAuuWMxdCtyHuS/I3utG59kkyYEWJ1QWTcV
         o7V2/V3mq1MQ22qgvCKr/tXCGOchDyMdYC+LAyucLDYwEVDxJp1CyzXVIhzXOba8TO3v
         LRYJfi4d8RGHSvfLLXr9uyqW2T2JjbjZxr0556EtQCXn4qSEbX/tfZRSfEY+3DgvihlM
         Srbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695132491; x=1695737291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQO/Pig1BMcd+vERj0f1AGV1ERLyyUdpnD52kVfXGaM=;
        b=Jv/D1ZT5tFfvx5BLoaZIKl2cpZxt1ByzGU/Znk3wDGY4wIYwd4/mbyxyCeV4l2MuUf
         dwJ+fJKPkR4nV4xIC1g5rsF56LPSc4a+tjfTFbUH/REoo2WtH8sNfTu8mahBQU5dR7Qk
         TFoxuCqUyD3z4kESwLbEWaD4zUS8PzKXPldYjPt4LATouDZfkyMurjcZifYk+wH2Q1k2
         Mo7fHgSMM3ZCC2kKsNg7CVPE5soCKBJwXAK3830oh+scOv9C7QIu+dP6aFFrCwBqbIGj
         WNWaMj7YEV2uOb7uYsq4hHfOtMEwOmrTnrG/wguJ8Jaq7mDv2UVXIhAHIYk8mDvdRkye
         jtig==
X-Gm-Message-State: AOJu0Yy3xQGoLRYXaeDucaqNU36KcSKnF/JzdlB/yPY1fkPXIycZsao9
	Mmf3JWUs+IKD0D9dFDzVJPs=
X-Google-Smtp-Source: AGHT+IFCoLpn+1QyuffMUKOzDmgy5WCHBQCRU5vrbPQhKWxSMFnpLWIeRBCHlzkXoMjZyapTyVq0OQ==
X-Received: by 2002:a17:90b:3688:b0:26f:6f2a:a11 with SMTP id mj8-20020a17090b368800b0026f6f2a0a11mr3453634pjb.12.1695132491442;
        Tue, 19 Sep 2023 07:08:11 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id cu2-20020a17090afa8200b0026b6d0a68c5sm8823388pjb.18.2023.09.19.07.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 07:08:11 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 11D1D81A82C8; Tue, 19 Sep 2023 21:08:08 +0700 (WIB)
Date: Tue, 19 Sep 2023 21:08:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Linux Intel Graphics <intel-gfx@lists.freedesktop.org>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Panic in gen8_ggtt_insert_entries() with v6.5
Message-ID: <ZQmrR7FVKRdVP53q@debian.me>
References: <4857570.31r3eYUQgx@natalenko.name>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrqBO/59iqOnkEZJ"
Content-Disposition: inline
In-Reply-To: <4857570.31r3eYUQgx@natalenko.name>


--lrqBO/59iqOnkEZJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 02, 2023 at 06:14:12PM +0200, Oleksandr Natalenko wrote:
> Hello.
>=20
> Since v6.5 kernel the following HW:
>=20
> * Lenovo T460s laptop with Skylake GT2 [HD Graphics 520] (rev 07)
> * Lenovo T490s laptop with WhiskeyLake-U GT2 [UHD Graphics 620] (rev 02)
>=20
> is affected by the following crash once KDE on either X11 or Wayland is s=
tarted:
>=20
> i915 0000:00:02.0: enabling device (0006 -> 0007)
> i915 0000:00:02.0: vgaarb: deactivate vga console
> i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=3Dio+mem,decod=
es=3Dio+mem:owns=3Dmem
> i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/skl_dmc_ver1_=
27.bin (v1.27)
> [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 1
> fbcon: i915drmfb (fb0) is primary device
> i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> =E2=80=A6
> memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D674 'kwin_wayl=
and'
> BUG: unable to handle page fault for address: ffffb422c2800000
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0002) - not-present page
> PGD 100000067 P4D 100000067 PUD 1001df067 PMD 10d1cf067 PTE 0
> Oops: 0002 [#1] PREEMPT SMP PTI
> CPU: 1 PID: 674 Comm: kwin_wayland Not tainted 6.5.0-pf1 #1 a6c58ff41a7b8=
bb16a19f5af9e0e9bce20f9f38d
> Hardware name: LENOVO 20FAS2BM0F/20FAS2BM0F, BIOS N1CET90W (1.58 ) 11/15/=
2022
> RIP: 0010:gen8_ggtt_insert_entries+0xc2/0x140 [i915]
> =E2=80=A6
> Call Trace:
>  <TASK>
>  intel_ggtt_bind_vma+0x3e/0x60 [i915 a83fdc6539431252dba13053979a8b680af8=
6836]
>  i915_vma_bind+0x216/0x4b0 [i915 a83fdc6539431252dba13053979a8b680af86836]
>  i915_vma_pin_ww+0x405/0xa80 [i915 a83fdc6539431252dba13053979a8b680af868=
36]
>  __i915_ggtt_pin+0x5a/0x130 [i915 a83fdc6539431252dba13053979a8b680af8683=
6]
>  i915_ggtt_pin+0x78/0x1f0 [i915 a83fdc6539431252dba13053979a8b680af86836]
>  __intel_context_do_pin_ww+0x312/0x700 [i915 a83fdc6539431252dba13053979a=
8b680af86836]
>  i915_gem_do_execbuffer+0xfc6/0x2720 [i915 a83fdc6539431252dba13053979a8b=
680af86836]
>  i915_gem_execbuffer2_ioctl+0x111/0x260 [i915 a83fdc6539431252dba13053979=
a8b680af86836]
>  drm_ioctl_kernel+0xca/0x170
>  drm_ioctl+0x30f/0x580
>  __x64_sys_ioctl+0x94/0xd0
>  do_syscall_64+0x5d/0x90
>  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> =E2=80=A6
> note: kwin_wayland[674] exited with irqs disabled
>=20
> RIP seems to translate into this:
>=20
> $ scripts/faddr2line drivers/gpu/drm/i915/gt/intel_ggtt.o gen8_ggtt_inser=
t_entries+0xc2
> gen8_ggtt_insert_entries+0xc2/0x150:
> writeq at /home/pf/work/devel/own/pf-kernel/linux/./arch/x86/include/asm/=
io.h:99
> (inlined by) gen8_set_pte at /home/pf/work/devel/own/pf-kernel/linux/driv=
ers/gpu/drm/i915/gt/intel_ggtt.c:257
> (inlined by) gen8_ggtt_insert_entries at /home/pf/work/devel/own/pf-kerne=
l/linux/drivers/gpu/drm/i915/gt/intel_ggtt.c:300
>=20
> Probably, recent PTE-related changes are relevant:
>=20
> $ git log --oneline --no-merges v6.4..v6.5 -- drivers/gpu/drm/i915/gt/int=
el_ggtt.c
> 3532e75dfadcf drm/i915/uc: perma-pin firmwares
> 4722e2ebe6f21 drm/i915/gt: Fix second parameter type of pre-gen8 pte_enco=
de callbacks
> 9275277d53248 drm/i915: use pat_index instead of cache_level
> 5e352e32aec23 drm/i915: preparation for using PAT index
> 341ad0e8e2542 drm/i915/mtl: Add PTE encode function
>=20
> Also note Lenovo T14s laptop with TigerLake-LP GT2 [Iris Xe Graphics] (re=
v 01) is not affected by this issue.
>=20
> Full dmesg with DRM debug enabled is available in the bugreport I've repo=
rted earlier [1]. I'm sending this email to make the issue more visible.
>=20
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/9256
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 0b62af28f249b9
#regzbot title: gen8_ggtt_insert_entries() panic on Lenovo T14s (Tiger Lake=
) due to folio_batch() on shmem_sg_free_table()
#regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/9256

--=20
An old man doll... just what I always wanted! - Clara

--lrqBO/59iqOnkEZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQmrRwAKCRD2uYlJVVFO
o+pJAPoDqOahm0Igxice7P7P3E3D8KDnlmg8XKH8VKJFwGs7eAD+LD4cMZ4N13it
Cd9UXPz+B9H8Z4IcR6WbhZcDp5PDBA0=
=Jc+B
-----END PGP SIGNATURE-----

--lrqBO/59iqOnkEZJ--
