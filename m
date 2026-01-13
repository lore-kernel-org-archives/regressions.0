Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3751F3FED
	for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266101; cv=none; b=svAqDwl9jf+qdecbhOsVBvA2e5m8+DskYQ4DuPIcI3HKOtJ9Af8A5eshwUeIKUAYWr0wNaDFxhRT8b4agqnnMID1CrFFoj1Lk6H78B1RQ4mpf66JOBPy0tWpS6p5lP7kI0sgNSS5h4Wo446A4RX3VNs8iAnXulKh7tm4MU+UWEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266101; c=relaxed/simple;
	bh=b0cZSkFgM+kbtMpPO+4ieRbWSEEDV9sdash+pkPaWlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VbT1aqOqKzuzKNXlErBTiE1WzDfZbWZMfkX/DaCt7AEp6lPkcTz0bjOQQNi9FpD/pcYDVhkWN+Vxn019m6IV7q4hWjA9NnGKZAVDBfHq6Yn0BH/qFftK+FcA/GnZ8IHUFbnH5YV5xd62EbxxDGJquDG4OD6Yy26panpHrURYyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=ODznnjlX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mKgU0hAZ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="ODznnjlX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mKgU0hAZ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A7AC814000B5;
	Mon, 12 Jan 2026 20:01:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 12 Jan 2026 20:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1768266098; x=1768352498; bh=sz
	KtJMqY9YTQ4XQVuvsDxj2sPRdqHsZaUcxrPGgEA7w=; b=ODznnjlXhWKN2CYCSi
	3SCAsZTfwLIu4ChoMWAvfotQ9AvAlne2Jhxo88k3Xnu0lPP8j+4FmqxeS/qoNmVT
	u0+N3cpDu3ceyzLYZ+dfEcex6CdS8+PtV61PstySRQ/KOMrYg/biw9H0mIJSEAVS
	a0DCJ9yZtrg8FJ5U1SllEEMxeyvoWUSInLpaDkzhHWbmUv5uIsxlSXoU//4R4bTx
	WqwleEbwmARJrhLFx9efHcvExV1GQBWLiDCV7kHeDILHGu8rmiOtQ0qo+v3vVZc8
	QErbgoXSbUnlU6620dabiiEcXmJ6yz7VXAMUYemTGE+MRhxJdP3t5LcgWbOtBXxu
	UMBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768266098; x=
	1768352498; bh=szKtJMqY9YTQ4XQVuvsDxj2sPRdqHsZaUcxrPGgEA7w=; b=m
	KgU0hAZ1IU1dRb/9uojrgRIxjqj8sWvBTKHq2+ih/SmxNqk5s0qGTvtQH4BWws6/
	U5At3PKK1YC3dznaE+D+rw7cZ+e/US34vkB24E23uJrNSq/NzJzbV0SdIbFPamPT
	vi+EjmnaLUYoR1z9BXGznr36ktN13nBucF6DqJQ5j4d1q6PKovrWiK3kdhU5YUSj
	2ysQaPBJTgQ5bpjfJs44NzXj39RGSwRwEt6qZQLvKmLdGbzijEG3otXl5RKxta7A
	crIyuRzKzRm612pS0yAPtYUdhFDCRZmxH07GShtc1dolgXbtPqeMly/s7N/j1l0/
	Lg6wW63tFh/g1RZb25h/A==
X-ME-Sender: <xms:cpllaa_RTIwBvWk6VJfHqLfJTXrmU9Ld84IlzKJ2v4QQ9OExVWtN7g>
    <xme:cpllacOrDVZN5dMeweeTmTo25FLLKh8vAuKZix9aunASsUm4n-zDI5tXENg3hCEFH
    ZIiW285H3IP_X03RbWRfI--YLIc0oTBQ8vN9DGU9iUpR-JX>
X-ME-Received: <xmr:cpllaQER_ZLRqwpkVL7dngK27gyRR597b7Hw7O0dGXxxbve1XdWudz0LrNXeZF7ey-kp60xf5QPMh0ZqNZ24pdVTm9iAUlYO-0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudekleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdtgfdvteet
    ffeluefgudfggeejkefgfeffvdehfffhtdefgefgueehtdffueelnecuffhomhgrihhnpe
    hquhgsvghsqdhoshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmrghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoh
    ephigriigvnhdrghhhrghnnhgrmhesrghmugdrtghomhdprhgtphhtthhopeigkeeisehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhs
    rdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:cpllaSR974HpUhFQEA-Lpigtw64sAd1OD3bO23rJlVAtOd2Ms-F6fw>
    <xmx:cpllaVvoz2j9QLRvWbFQKUzHnV2IM0UUOup54S1gnXxS5nHX-UPNKg>
    <xmx:cpllaSLynIAF9nN_rwVwYTgiqpHY0p5IjC_o1yBOEz9IdMjcSTezPA>
    <xmx:cpllaSn_eMBKJ49b2DRj1iYyhz7JF8wB1B2tpZfIRcHjhdhA09MaUg>
    <xmx:cpllaXJBWFr74Fr8rlEdez7M8iMWW__O8nh7iFBBMMSJhfsTC3h3kfGA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jan 2026 20:01:37 -0500 (EST)
Date: Tue, 13 Jan 2026 02:01:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Message-ID: <aWWZb3eRfQdB4OsI@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sl5OSYrixbUzp8sg"
Content-Disposition: inline


--sl5OSYrixbUzp8sg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jan 2026 02:01:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read

Hi,

I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
with AMD Raphael/Granite Ridge USB controller passed through.
It worked correctly in 6.12.59. Between those versions, I don't see any
relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
but the AMD node driver did got some changes, so my guess is one of them
is to blame. I know the good-bad range is huge, but there aren't that
many changes to the AMD node driver in this range.

It's running on Qubes OS 4.3, which uses Xen 4.19, and does PCI
passthrough of USB controllers to a dedicated VM (HVM).

The full crash message is:

    [    0.302571] pci 0000:00:08.0: quirk_usb_early_handoff+0x0/0x180 took=
 16590 usecs
    [    0.303172] BUG: kernel NULL pointer dereference, address: 000000000=
0000000
    [    0.303189] #PF: supervisor read access in kernel mode
    [    0.303202] #PF: error_code(0x0000) - not-present page
    [    0.303216] PGD 0 P4D 0=20
    [    0.303225] Oops: Oops: 0000 [#1] SMP NOPTI
    [    0.303236] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.9-=
1.qubes.fc41.x86_64 #1 PREEMPT(full)=20
    [    0.303258] Hardware name: Xen HVM domU, BIOS 4.19.3 08/26/2025
    [    0.303273] RIP: 0010:__amd_smn_rw+0x30/0x100
    [    0.303288] Code: 05 bd 44 b8 01 66 0f af 05 2d 44 b8 01 41 57 41 56=
 41 55 41 54 55 53 66 39 c2 0f 83 c0 00 00 00 48 8b 05 c3 61 d7 02 0f b7 d2=
 <4c> 8b 34 d0 4d 85 f6 0f 84 a9 00 00 00 80 3d a4 61 d7 02 00 0f 84
    [    0.303327] RSP: 0018:ffffcdd30001fd68 EFLAGS: 00010297
    [    0.303341] RAX: 0000000000000000 RBX: ffffcdd30001fdb4 RCX: 0000000=
010136008
    [    0.303359] RDX: 0000000000000000 RSI: 0000000000000064 RDI: 0000000=
000000060
    [    0.303377] RBP: ffffffffa684bb80 R08: ffffcdd30001fdb4 R09: 0000000=
000000000
    [    0.303395] R10: ffffffffa7567420 R11: 0000000000000020 R12: ffff8dd=
081dff000
    [    0.303413] R13: ffffffffa736ab60 R14: 00000000055ee14a R15: ffff8dd=
081dff000
    [    0.303434] FS:  0000000000000000(0000) GS:ffff8dd0e87c1000(0000) kn=
lGS:0000000000000000
    [    0.303452] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    0.303468] CR2: 0000000000000000 CR3: 000000000c62c000 CR4: 0000000=
000750ef0
    [    0.303487] PKRU: 55555554
    [    0.303495] Call Trace:
    [    0.303504]  <TASK>
    [    0.303513]  ? __pfx_quirk_clear_strap_no_soft_reset_dev2_f0+0x10/0x=
10
    [    0.304112]  amd_smn_read+0x27/0x50
    [    0.304112]  quirk_clear_strap_no_soft_reset_dev2_f0+0x37/0x80
    [    0.304112]  pci_fixup_device+0xf6/0x1b0
    [    0.304112]  pci_apply_final_quirks+0xe9/0x280
    [    0.304112]  ? __pfx_pci_apply_final_quirks+0x10/0x10
    [    0.304112]  do_one_initcall+0x57/0x310
    [    0.304112]  do_initcalls+0x1ef/0x240
    [    0.304112]  kernel_init_freeable+0x187/0x210
    [    0.304112]  ? __pfx_kernel_init+0x10/0x10
    [    0.304112]  kernel_init+0x1a/0x140
    [    0.304112]  ret_from_fork+0xf2/0x110
    [    0.304112]  ? __pfx_kernel_init+0x10/0x10
    [    0.304112]  ret_from_fork_asm+0x1a/0x30
    [    0.304112]  </TASK>
    [    0.304112] Modules linked in:
    [    0.304112] CR2: 0000000000000000
    [    0.304112] ---[ end trace 0000000000000000 ]---
    [    0.304112] RIP: 0010:__amd_smn_rw+0x30/0x100
    [    0.304112] Code: 05 bd 44 b8 01 66 0f af 05 2d 44 b8 01 41 57 41 56=
 41 55 41 54 55 53 66 39 c2 0f 83 c0 00 00 00 48 8b 05 c3 61 d7 02 0f b7 d2=
 <4c> 8b 34 d0 4d 85 f6 0f 84 a9 00 00 00 80 3d a4 61 d7 02 00 0f 84
    [    0.304112] RSP: 0018:ffffcdd30001fd68 EFLAGS: 00010297
    [    0.304112] RAX: 0000000000000000 RBX: ffffcdd30001fdb4 RCX: 0000000=
010136008
    [    0.304112] RDX: 0000000000000000 RSI: 0000000000000064 RDI: 0000000=
000000060
    [    0.304112] RBP: ffffffffa684bb80 R08: ffffcdd30001fdb4 R09: 0000000=
000000000
    [    0.304112] R10: ffffffffa7567420 R11: 0000000000000020 R12: ffff8dd=
081dff000
    [    0.304112] R13: ffffffffa736ab60 R14: 00000000055ee14a R15: ffff8dd=
081dff000
    [    0.304112] FS:  0000000000000000(0000) GS:ffff8dd0e87c1000(0000) kn=
lGS:0000000000000000
    [    0.304112] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    0.304112] CR2: 0000000000000000 CR3: 000000000c62c000 CR4: 0000000=
000750ef0
    [    0.304112] PKRU: 55555554
    [    0.304112] Kernel panic - not syncing: Fatal exception

The device, as seen from within the VM:

    00:09.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Rapha=
el/Granite Ridge USB 2.0 xHCI [1022:15b8] (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device [1043:8877]
        Physical Slot: 9
        Flags: bus master, fast devsel, latency 0, IRQ 21
        Memory at f2200000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/1 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci
    00: 22 10 b8 15 07 04 10 00 00 30 03 0c 10 00 00 00
    10: 04 00 20 f2 00 00 00 00 00 00 00 00 00 00 00 00
    20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 77 88
    30: 00 00 00 00 48 00 00 00 00 00 00 00 2e 01 00 00
    40: 00 00 00 00 00 00 00 00 09 50 08 00 43 10 77 88
    50: 01 64 03 00 08 00 00 00 00 00 00 00 00 00 00 00
    60: 31 60 00 00 10 a0 02 00 a1 8f 00 00 30 29 00 00
    70: 04 0d 40 00 00 00 04 11 00 00 00 00 00 00 00 00
    80: 00 00 00 00 00 00 00 00 1f 00 01 00 00 00 00 00
    90: 1e 00 80 01 04 00 1f 00 00 00 00 00 00 00 00 00
    a0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
    b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    c0: 11 00 07 80 00 e0 0f 00 00 f0 0f 00 00 00 00 00
    d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Any ideas?

Original report at (with full kernel log etc): https://forum.qubes-os.org/t=
/yet-another-usb-keyboard-thread/38355/8

#regzbot introduced: v6.12.59..v6.17.9

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--sl5OSYrixbUzp8sg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmllmW8ACgkQ24/THMrX
1yziDgf/fJ5qjD90KK4InDAUTfGAjE5FeT5x+q36PKp8+7qLQ9EkAFbaQd/03NhN
ryP3stXx5Zk1PvrRf/SkcCinvCCoimpIv3BasWiSZC3TW9mHgcY7qS8ED/zVAIw1
FCj32L00y0MUaF7nGCYlrYYXG/kIa1/LtcpdpApljAsldNQdALbVRqJTPBPQS6Ne
dGlK5F1n5vSpEWf6bkYpE6vY/lIiuO8rfc9G3CL7ZbZz187smvCCQTJvkWxNWDFo
8ZI0AQJT3tkKaZ/8WHTko0XpocQlB9H3XBSBG5eKTXuTGEY7wAdCiD2Ry35jxs0T
uTmkNr/XvMdDZ2pidL9OMTc/Vwa3Xw==
=ENKG
-----END PGP SIGNATURE-----

--sl5OSYrixbUzp8sg--
