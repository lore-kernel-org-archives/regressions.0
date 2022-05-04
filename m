Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067DC17C9
	for <regressions@lists.linux.dev>; Wed,  4 May 2022 00:37:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 1A3183200583
	for <regressions@lists.linux.dev>; Tue,  3 May 2022 20:37:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 03 May 2022 20:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1651624664; x=1651711064; bh=H7jefep+WHuQq
	pAs9N8uOUmMabV5BmBB2MaIVZFlDbk=; b=UtzKWpmz13LDSCSvMYLPoNheXj4CI
	ayBKzp+CD4/ASbpp871M8J37fand1aTIflGvN0HTa+AsiAu1AGjvAIq1U9RYqAWd
	FYhu48SjKyKTxZOT24MZm7+1gIDrzFfh3WBisbSUA0fwN1jpe/N6U6DQCWpFVJwC
	BK0a/QHlAYNpIGBtRDImrH87mLIc0n9uVSu8U/HLDDbrhQrTwChIljtHx38YarV+
	y0b4Qmr7gLBIo0faFhJ3gOd63/AKMN8ujUXnbWgsZfCZmVVfqut28rVh3rjOcotL
	jH4HIvTPxt6+4X+uVqIMVWgPeq23lGvAAAvmge83dgVNtIJ2lY26kPkBw==
X-ME-Sender: <xms:2MpxYhY34ZUVYUo8zKwUTEeQRVnT5CGBK34RLo07KBagO7NWRHUkaA>
    <xme:2MpxYoZUoEyyqCx-9d3jz-L4-VCV6igMFpIXoeggXmfFIl_YS7kr_sBNhCO79qGfD
    q2gDJQ7PFMFhg>
X-ME-Received: <xmr:2MpxYj-5HMN7QkEBv032LbQPhLUUZM0uI8ARy8cc8LMe27TfJd1_4U02nOl2ygCe7siUmlFkL_RSaMoF4Lyy4fwJ6zhfQ7gUlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeetudetieduveekgeevhfdtkefhlefghfehudekvddvueduvdej
    hedvtdeihedugfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:2MpxYvrloI7Sg7fFTWRwN_zZfCuUiwvzKPxDBEs0HRT3PzdFuupNmQ>
    <xmx:2MpxYspL3FNoBLEx2JPLFr9YqVXk84e-6iTw4naetomWv-LeRJUY_A>
    <xmx:2MpxYlRdAiyr3z0JaSmU79WkFirHCG9fWtA3pwO_-5-EI0TsxTvSIg>
    <xmx:2MpxYp0uvV-ecFuu0FnXDyzdamiuSV1FX2AM7kNoDj_lwaxnvmmhqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <regressions@lists.linux.dev>; Tue, 3 May 2022 20:37:43 -0400 (EDT)
Date: Wed, 4 May 2022 02:37:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: regressions@lists.linux.dev
Subject: Xorg SEGV in Xen PV dom0 after updating from 5.16.18 to 5.17.5
Message-ID: <YnHK1Z3o99eMXsVK@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U7uR8lOXS4Lh3wYp"
Content-Disposition: inline


--U7uR8lOXS4Lh3wYp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 May 2022 02:37:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: regressions@lists.linux.dev
Subject: Xorg SEGV in Xen PV dom0 after updating from 5.16.18 to 5.17.5

Hi,

After updating from 5.16.18 to 5.17.5 in Xen PV dom0, my Xorg started
crashing when displaying any window mapped from a guest (domU) system.
This is 100% reproducible.
The system is Qubes OS, and it uses a trick that maps windows content
=66rom other guests using Xen grant tables, wrapped as "shared memory"
=66rom Xorg point of view (so, the memory that Xorg mmaps is not just from
another process, but from another VM). That's the ShmPutImage you can
see on the stack trace below.

Stack trace of thread 12858:
#0  0x00007f80029e17d5 raise (libc.so.6 + 0x3c7d5)
#1  0x00007f80029ca895 abort (libc.so.6 + 0x25895)
#2  0x00005b3469ace0e0 OsAbort (Xorg + 0x1c60e0)
#3  0x00005b3469ad3959 AbortServer (Xorg + 0x1cb959)
#4  0x00005b3469ad46aa FatalError (Xorg + 0x1cc6aa)
#5  0x00005b3469acb450 OsSigHandler (Xorg + 0x1c3450)
#6  0x00007f8002b85a90 __restore_rt (libpthread.so.0 + 0x14a90)
#7  0x00007f8002b0a2a1 __memmove_avx_unaligned_erms (libc.so.6 + 0x1652a1)
#8  0x00007f80015dfcc9 linear_to_xtiled_faster (iris_dri.so + 0xc91cc9)
#9  0x00007f80015e3477 _isl_memcpy_linear_to_tiled (iris_dri.so + 0xc95477)
#10 0x00007f8001468440 iris_texture_subdata (iris_dri.so + 0xb1a440)
#11 0x00007f8000a76107 st_TexSubImage (iris_dri.so + 0x128107)
#12 0x00007f8000be9a47 texture_sub_image (iris_dri.so + 0x29ba47)
#13 0x00007f8000becd0c texsubimage_err (iris_dri.so + 0x29ed0c)
#14 0x00007f8000bf2939 _mesa_TexSubImage2D (iris_dri.so + 0x2a4939)
#15 0x00007f800213831f glamor_upload_boxes (libglamoregl.so + 0x1e31f)
#16 0x00007f800213856f glamor_upload_region (libglamoregl.so + 0x1e56f)
#17 0x00007f800212aea6 glamor_put_image (libglamoregl.so + 0x10ea6)
#18 0x00005b3469a4d79c damagePutImage (Xorg + 0x14579c)
#19 0x00005b3469a00a7e ProcShmPutImage (Xorg + 0xf8a7e)
#20 0x00005b3469965a2b Dispatch (Xorg + 0x5da2b)
#21 0x00005b3469969b04 dix_main (Xorg + 0x61b04)
#22 0x00007f80029cc082 __libc_start_main (libc.so.6 + 0x27082)
#23 0x00005b3469952e6e _start (Xorg + 0x4ae6e)

Disassembly of the surrounding code:

   0x00007596ae8c82fb <+123>:	ja     0x7596ae8c8338 <__memmove_avx_unaligne=
d_erms+184>
   0x00007596ae8c82fd <+125>:	jb     0x7596ae8c8304 <__memmove_avx_unaligne=
d_erms+132>
   0x00007596ae8c82ff <+127>:	movzbl (%rsi),%ecx
   0x00007596ae8c8302 <+130>:	mov    %cl,(%rdi)
   0x00007596ae8c8304 <+132>:	retq  =20
   0x00007596ae8c8305 <+133>:	vmovdqu (%rsi),%xmm0
   0x00007596ae8c8309 <+137>:	vmovdqu -0x10(%rsi,%rdx,1),%xmm1
=3D> 0x00007596ae8c830f <+143>:	vmovdqu %xmm0,(%rdi)
   0x00007596ae8c8313 <+147>:	vmovdqu %xmm1,-0x10(%rdi,%rdx,1)
   0x00007596ae8c8319 <+153>:	retq


I don't see any related kernel or Xen messages at this time. Xorg's SEGV
handler prints also:

    (EE) Segmentation fault at address 0x3c010

Git bisect says it's bdd8b6c98239cad ("drm/i915: replace X86_FEATURE_PAT
with pat_enabled()"), and indeed with this commit reverted on top of
5.17.5 everything works fine.

I guess this part of dom0's boot dmesg may be relevant:

[    0.000949] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.000953] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC=
 =20

Originally reported at
https://github.com/QubesOS/qubes-issues/issues/7479

=20
#regzbot introduced bdd8b6c98239cad
#regzbot monitor: https://github.com/QubesOS/qubes-issues/issues/7479

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--U7uR8lOXS4Lh3wYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJxytUACgkQ24/THMrX
1yyWswgAi+D8O03V/4/OkcI9e+J+rR4SQfP8CmOGUYKZ/YP0tJcheHesFp+M1ljE
7JiL3KnoJ/vTL2KbMzTXsLU9RAcC5WXFLq7wwcC+S3gs7g0xYOZBQ5mhTLI0cNd7
0g92yKHd9APmuVYAk1JONzB7Lnc8AjOXzi+mHQbqzvLYuxt7wEYgmMPckE5axGXe
JLXfkAypxYZJ1/YlpX6lWB2xXCWGW2XIK4uA+RVfW4dpeqWhHmA0tyoGHY1YzWNi
K39UzeoJhoJAWxwAnI7xz9vKR09Ba+zo/JsmPqcfWeJ7aG/pd2k2wLVbk0AKGaw0
gccHkKjCLmJvM3IdE6+tSywGX1vnGw==
=fQzN
-----END PGP SIGNATURE-----

--U7uR8lOXS4Lh3wYp--
