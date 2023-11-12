Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0479EE
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNwZcZbB"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b2f28caab9so2179884b6e.1
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 03:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699787920; x=1700392720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv8ACPVZgV0Pxa5en7zdw7RbJitiG8y+EBffkQkWb7Y=;
        b=gNwZcZbBKS4kojRGQ3ntoVc3q6khsqFv+lGHER6dXzqiH9+XMLDNwcwKNGEURcEywN
         dGYb8/oovz8B099ieNJyGFf5iTXC3bceH3ggv8f87nYEGmx2KaVPsQ07787nOgGgmC5Q
         H0br8cZUGNqfmIxENfENg7SAfRP/s4D9wePAH9e9zajjEvm8LqeQ5xESqmjiRjv5mUts
         OEnwNfskR2gmAh8KAruMJbulJrjs1SG+45Jgn8JVMFuRGtrcNFgDRFLH5aCX+B8ZWE00
         lS73VUI7Mw7YCkmhMDInP0nceFt+5iMjPbFrgDy0iSg4HEo9rTAd1wKYoCEzoVQAO4QA
         bljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699787920; x=1700392720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tv8ACPVZgV0Pxa5en7zdw7RbJitiG8y+EBffkQkWb7Y=;
        b=VJKNJic+B46eL/+RKOqQEzGPtwdGSVuEqGikJjbRV3AX2Pgl+S2MKKqS98ux/SnZ63
         SMk7SFIsI1vLxfGcDyPVNiTJyiqjV+EOpWp3zdlHY6XCKS9IubODe4d8Jaj5nR5h8aMD
         rG+Me5eYBbI2ioLYCRp62snw5tzoZneyCLMfBp36t6UgUlPQ5PWo7/1xtvCZrgD4Ogno
         uo2k8/8FdVbUUW7tVmRTWHQIQEoM2NhGW52fzVwmnW3cdFgh4QYEpl+SlXJMJRmcA7ac
         1zS4LMSVRm1GPhhyuLMJZJdRJ+IQ+PQA50jANvBfGHanDamRsXKfdYdABU2BjuGslhqt
         NRSQ==
X-Gm-Message-State: AOJu0YyYLRZSp8nzHaI3G36G8RmJgQQhQy1hVZCtdaWwMZwLbwlvWwuD
	FHr8dgLOXfJmkMhir6dIwOc=
X-Google-Smtp-Source: AGHT+IEPRPJW1QI/XCdMbL9xm1cmv0fOQqW/MYQ3+/W+n5yRUspIQECqB+RdWxnOXUpmRx22hLWDXg==
X-Received: by 2002:a05:6808:164e:b0:3ab:5592:4704 with SMTP id az14-20020a056808164e00b003ab55924704mr5213025oib.2.1699787919776;
        Sun, 12 Nov 2023 03:18:39 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q23-20020a62e117000000b006c0328b2440sm2390072pfh.150.2023.11.12.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 03:18:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id B81D310299770; Sun, 12 Nov 2023 18:18:34 +0700 (WIB)
Date: Sun, 12 Nov 2023 18:18:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	=?utf-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
	Fabio Comolli <fabio.comolli@gmail.com>
Cc: Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: Fwd: iwlmvm: Linux 6.7 pre-rc1 prints stack trace of
 iwl_op_mode_mvm_start; caused by commit b6e3d1ba4fcf
Message-ID: <ZVC0iq1FS02FjeTX@archie.me>
References: <2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2PfOC9ZO3kyEIA4"
Content-Disposition: inline
In-Reply-To: <2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com>


--w2PfOC9ZO3kyEIA4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nikl=C4=81vs and Fabio,

On Fri, Nov 03, 2023 at 08:13:39PM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > When testing the branch that will become Linux 6.7-rc1, ever since comm=
it b6e3d1ba4fcf02176846d03a930203d8133c0aaf I have observed the following a=
bbreviated kernel stack trace (please see attachments for the full trace):
> >=20
> > ```
> > [    6.733281]  ? __warn+0xc3/0x1d0
> > [    6.733284]  ? iwl_op_mode_mvm_start+0x9c4/0x9d0 [iwlmvm]
> > [    6.733299]  ? report_bug+0x167/0x220
> > [    6.733301]  ? handle_bug+0x3d/0x90
> > [    6.733304]  ? exc_invalid_op+0x1a/0x60
> > [    6.733306]  ? asm_exc_invalid_op+0x1a/0x20
> > [    6.733309]  ? iwl_op_mode_mvm_start+0x9c4/0x9d0 [iwlmvm]
> > [    6.733325]  _iwl_op_mode_start+0x66/0xe0 [iwlwifi]
> > [    6.733338]  iwl_opmode_register+0x87/0xd0 [iwlwifi]
> > [    6.733350]  ? __cfi_init_module+0x10/0x10 [iwlmvm]
> > [    6.733364]  init_module+0x22/0xff0 [iwlmvm]
> > [    6.733378]  ? __cfi_init_module+0x10/0x10 [iwlmvm]
> > [    6.733392]  do_one_initcall+0x129/0x380
> > [    6.733395]  ? idr_alloc_cyclic+0x148/0x1e0
> > [    6.733397]  ? security_kernfs_init_security+0x41/0x80
> > [    6.733399]  ? __kernfs_new_node+0x1be/0x250
> > [    6.733401]  ? preempt_count_add+0x55/0xb0
> > [    6.733404]  ? up_write+0x4a/0xe0
> > [    6.733406]  ? preempt_count_add+0x55/0xb0
> > [    6.733408]  ? sysvec_call_function+0xa4/0xb0
> > [    6.733410]  ? asm_sysvec_call_function+0x1a/0x20
> > [    6.733411]  ? free_unref_page_prepare+0xf3/0x410
> > [    6.733413]  ? preempt_count_add+0x62/0xb0
> > [    6.733415]  ? _raw_spin_trylock+0x19/0x60
> > [    6.733417]  ? _raw_spin_unlock+0x11/0x30
> > [    6.733419]  ? __kmem_cache_free+0x29a/0x3c0
> > [    6.733421]  ? vfree+0xd2/0x150
> > [    6.733422]  ? slab_post_alloc_hook+0x76/0x3d0
> > [    6.733425]  ? do_init_module+0x3f/0x230
> > [    6.733427]  ? __kmem_cache_alloc_node+0x1fe/0x2f0
> > [    6.733430]  do_init_module+0x7a/0x230
> > [    6.733432]  __se_sys_init_module+0x1a0/0x220
> > [    6.733435]  do_syscall_64+0x7a/0x100
> > [    6.733438]  ? syscall_exit_to_user_mode+0x2d/0x1d0
> > [    6.733440]  ? do_syscall_64+0x89/0x100
> > [    6.733442]  ? do_user_addr_fault+0x4e7/0x680
> > [    6.733444]  ? exc_page_fault+0x61/0x150
> > [    6.733446]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> > ```
> >=20
> > I did try reverting the offending commit but the result did not compile=
 and I did not want to dig deeper to identify any subsequent commits what w=
ould need reverting to fix compilation.
> >=20
> > If it's relevant, I'm building the kernel with Clang 17.0.4 toolchain b=
y setting the LLVM=3D1 variable. CFI is enabled but I'm not sure if it's ac=
tually functional.
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding this regression to regzbot:
>=20
> #regzbot introduced: b6e3d1ba4fcf02 https://bugzilla.kernel.org/show_bug.=
cgi?id=3D218095
> #regzbot title: new iwlwifi firmware statistics API triggers stack trace
>=20

Emmanuel had sent a proposed fix at [1]. Please test.

Thanks.

[1]: https://lore.kernel.org/regressions/20231112100944.21177-1-emmanuel.gr=
umbach@intel.com/

--=20
An old man doll... just what I always wanted! - Clara

--w2PfOC9ZO3kyEIA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVC0igAKCRD2uYlJVVFO
o8GvAQCgaaMgHyMNOGRExrMf9mhXIKx0v160v/eAArXomvKctgD+PlXLMd1ClK5P
yWIoOBL7x8/x0kWSMUWrhMPTm8UU4wg=
=9xij
-----END PGP SIGNATURE-----

--w2PfOC9ZO3kyEIA4--
