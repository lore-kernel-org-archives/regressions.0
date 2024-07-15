Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002B1850B4
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.187.255.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721050002; cv=none; b=bH18YkRcihbMa2bJuOxuHMrfQk5OVoLH7KujkaL9YvuJBNU8eFnUSAbu5mmctN/FrIIQDvEyz/mPiMB0YYH3ELSK4LafAr+N83TDOGGg+Xt3MtbffDKbTn1Td68GHVOq3o6eHlzp1vW/BsyrsKI5HsfxyGKvkK6Xl1NFm4k/6vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721050002; c=relaxed/simple;
	bh=TMsX1YOZhVW7n7MnwE6C7Mh5kxQyNQyjOukalADP4JQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=elRzgE1MBS++dphls6sZQTOxHQNQm1RzZctyO4gRB3M1AGVyWZweIzXG5wlmN2vmBIe/P3JBdGJSn+e1ZW34pn55yoH6KrBnBnFBMsZnpTxZTmYhcIdupJSeAzNtkrzO6nPrI+Mz5pbZzXbzJUsveJ334iCWO/wCGS/kmkY0XSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de; spf=pass smtp.mailfrom=lrz.de; dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b=uVWCKPxn; arc=none smtp.client-ip=129.187.255.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lrz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lrz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lrz.de header.i=@lrz.de header.b="uVWCKPxn"
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4WN2zG54N5zyVf;
	Mon, 15 Jul 2024 15:26:34 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
	reason="pass (just generated, assumed good)" header.d=lrz.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lrz.de; h=
	mime-version:content-type:content-type:content-language
	:accept-language:in-reply-to:references:message-id:date:date
	:subject:subject:from:from:received:received:received:received;
	 s=postout; t=1721049993; bh=TMsX1YOZhVW7n7MnwE6C7Mh5kxQyNQyjOuk
	alADP4JQ=; b=uVWCKPxnFKpW4mtcAJ6Py/ZIXBJ9kzuY0+m9xSIp8hBOGCtWE4E
	QOsq4yB9IP3rCf5elJPD0XnzRUFVvPED2BTSbkp0rRyGgQGBoBiGpInCjI7WzyW6
	vLvdaRXYiyHuwT2iLxI0s5RuwhALazWM4G0iEutX+97OfBiEGYvPctkjQNe8OEh/
	PpSqPT8ObB1Uqa54XZosirDBp7oBTfFfA2Le+tX+Ru58K8lKJsp+rsKRLTJF26gb
	NYNZdlLoMuEAXRNPwEW9gkMoM7V1WBujb/S39UiwIUMRXEQZPQAojnnCMJJt/rlZ
	jkuWVzgAmCCW3/I0StwC4h9tYY0aKXrSc8g==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.862
X-Spam-Level:
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id dHD00TNDdmQb; Mon, 15 Jul 2024 15:26:33 +0200 (CEST)
Received: from BADWLRZ-SWEX03B.ads.mwn.de (BADWLRZ-SWEX03B.ads.mwn.de [IPv6:2001:4ca0:0:108::196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWEX03B", Issuer "BADWLRZ-SWEX03B" (not verified))
	by postout2.mail.lrz.de (Postfix) with ESMTPS id 4WN2zF3zS1zyTt;
	Mon, 15 Jul 2024 15:26:33 +0200 (CEST)
Received: from BADWLRZ-SWEX03A.ads.mwn.de (2001:4ca0:0:108::195) by
 BADWLRZ-SWEX03B.ads.mwn.de (2001:4ca0:0:108::196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 15 Jul 2024 15:26:33 +0200
Received: from BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168]) by
 BADWLRZ-SWEX03A.ads.mwn.de ([fe80::135:d2e8:a257:4168%15]) with mapi id
 15.02.1544.011; Mon, 15 Jul 2024 15:26:33 +0200
From: =?utf-8?B?U3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4=?=
	<Sebastian.Steinbeisser@lrz.de>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"pc@manguebit.com" <pc@manguebit.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Thread-Topic: Potential smb/dfs regression introduced in kernel 6.6
Thread-Index: AQHayJXmtmc2qLL700qAmNg0Q6RQvrHbwjy5gADy1QCAFEz7gIAFjrOAgACvtoCAAG/QAIAAEj4A
Date: Mon, 15 Jul 2024 13:26:33 +0000
Message-ID: <bacefa19d08f36755a74a85e9c1d8600223c1944.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
	 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
	 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
	 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
	 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
	 <00654293b73f861514a9fb61723a8a424be92bc2.camel@lrz.de>
	 <505eef55e45f00146321b7de6549ca46@manguebit.com>
In-Reply-To: <505eef55e45f00146321b7de6549ca46@manguebit.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Content-Type: multipart/signed; micalg=sha-384;
	protocol="application/pkcs7-signature"; boundary="=-1PpKPyMoGb8nW6nOZDIv"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

--=-1PpKPyMoGb8nW6nOZDIv
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AFR6CDyZL+fI1Cio2AVU"


--=-AFR6CDyZL+fI1Cio2AVU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Paulo,

this is my first rodeo with bisect and the first with the kernel in >10
years - but by no means my first with git - here's what I found:

I've been using a freshly installed Debian 12 virtual box vm and I've
been following [1].

As a "test" I used the following script to see if the initial error
could be reproduced:
```test.sh
#!/bin/bash

mkdir -vp /tmp/test
sudo mount -t cifs //IP_ADDR/volume01 /tmp/test -o
username=3D$USER,domain=3DADS
read -rs
ls /tmp/test
read -rs
ls /tmp/test/*
read -rs
sudo umount /tmp/test
```

A "good" output would be
```

volume02  volume03
/tmp/test/volume02:

/tmp/test/volume03:
```

The individual steps are as follows:
```notes.txt
git bisect start
git bisect good 9a49e221a64111535f65e9c8804db24d11eaff8b
git bisect bad 539aad7f14

# yields dedd6c894110 - script crashes with
volume02  volume03
./test.sh: line 8:  1867 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields 0e72db77672ff4758a31fb5259c754a7bb229751

git bisect good
# yields 29057cc5bddc785ea0a11534d7ad2546fa0872d3 - script crashes with
volume02  volume03
./test.sh: line 8:  1881 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields 1c9f8dff62d85ce00b0e99f774a84bd783af7cac - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields 8ae5d298ef2005da5454fc1680f983e85d3e1622 - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields cd99b9eb4b702563c5ac7d26b632a628f5a832a5

git bisect good
# yields df57721f9a63e8a1fb9b9b2e70de4aa4c7e0cd2e - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields b6f6167ea8a424d14b41c172fe7a5f49e164f221

git bisect good
# yields eb501c2d96cfce6b42528e8321ea085ec605e790

git bisect good
# yields c6b53dcec07c842af75123d9b29684bdbd36a407

git bisect good
# yields 4debf77169ee459c46ec70e13dc503bc25efd7d2

git bisect good
# yields 089f7f591348ca3325639f541fa4f78d9540dab5 - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields f4e5ceb6c1a64f9f8c666877164d95d5eb46da5b - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields 69a4e06c0e7bceeba95104180110841d232e94e4 - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields a18280e7fdea1f2f0736c45f9fee27eccd3998ae - script crashes with
volume02  volume03
./test.sh: line 8:  1865 Killed                  ls /tmp/test/*
umount: /tmp/test: target is busy.

# mark it as bad
git bisect bad
# yields f2762ae4d3e0bceeabfac4bc3c53700d80a602c9

git bisect good
a18280e7fdea1f2f0736c45f9fee27eccd3998ae is the first bad commit
commit a18280e7fdea1f2f0736c45f9fee27eccd3998ae
Author: Paulo Alcantara <pc@manguebit.com>
Date:   Thu Aug 17 12:34:09 2023 -0300

    smb: cilent: set reparse mount points as automounts
   =20
    By doing so we can selectively mark those submounts as
'noserverino'
    rather than whole mount and thus avoiding inode collisions in them.
   =20
    Consider a "test" SMB share that has two mounted NTFS volumes
    (vol0 & vol1) inside it.
   =20
    * Before patch
   =20
    $ mount.cifs //srv/test /mnt/1 -o ...,serverino
    $ ls -li /mnt/1/vol0
    total 1
    281474976710693 drwxr-xr-x 2 root root 0 Jul 15 00:23 $RECYCLE.BIN
    281474976710696 drwxr-xr-x 2 root root 0 Jul 18 18:23 System
Volume...
    281474976710699 -rwxr-xr-x 1 root root 0 Aug 14 21:53 f0
    281474976710700 -rwxr-xr-x 1 root root 0 Aug 15 18:52 f2
    281474976710698 drwxr-xr-x 2 root root 0 Aug 12 19:39 foo
    281474976710692 -rwxr-xr-x 1 root root 5 Aug  4 21:18 vol0_f0.txt
    $ ls -li /mnt/1/vol1
    total 0
    281474976710693 drwxr-xr-x 2 root root 0 Jul 15 00:23 $RECYCLE.BIN
    281474976710696 drwxr-xr-x 2 root root 0 Jul 18 18:23 System
Volume...
    281474976710698 drwxr-xr-x 2 root root 0 Aug 12 19:39 bar
    281474976710699 -rwxr-xr-x 1 root root 0 Aug 14 22:03 f0
    281474976710700 -rwxr-xr-x 1 root root 0 Aug 14 22:52 f1
    281474976710692 -rwxr-xr-x 1 root root 0 Jul 15 00:23 vol1_f0.txt
   =20
    * After patch
   =20
    $ mount.cifs //srv/test /mnt/1 -o ...,serverino
    $ ls -li /mnt/1/vol0
    total 1
    590 drwxr-xr-x 2 root root 0 Jul 15 00:23 $RECYCLE.BIN
    594 drwxr-xr-x 2 root root 0 Jul 18 18:23 System Volume Information
    591 -rwxr-xr-x 1 root root 0 Aug 14 21:53 f0
    592 -rwxr-xr-x 1 root root 0 Aug 15 18:52 f2
    593 drwxr-xr-x 2 root root 0 Aug 12 19:39 foo
    595 -rwxr-xr-x 1 root root 5 Aug  4 21:18 vol0_f0.txt
    $ ls -li /mnt/1/vol1
    total 0
    596 drwxr-xr-x 2 root root 0 Jul 15 00:23 $RECYCLE.BIN
    600 drwxr-xr-x 2 root root 0 Jul 18 18:23 System Volume Information
    597 drwxr-xr-x 2 root root 0 Aug 12 19:39 bar
    598 -rwxr-xr-x 1 root root 0 Aug 14 22:03 f0
    599 -rwxr-xr-x 1 root root 0 Aug 14 22:52 f1
    601 -rwxr-xr-x 1 root root 0 Jul 15 00:23 vol1_f0.txt
   =20
    Signed-off-by: Paulo Alcantara (SUSE) <pc@manguebit.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

 fs/smb/client/cifsglob.h  |   2 +-
 fs/smb/client/inode.c     | 344 +++++++++++++++++++++++++-------------
--------
 fs/smb/client/namespace.c |  19 +--
 fs/smb/client/readdir.c   |   1 +
 4 files changed, 194 insertions(+), 172 deletions(-)
```

Note, that this did not behave as initially seen with the two Lubuntu
installations, but non the less an error occurred.
Checking dmesg right after the error showed:
```error.log
[   28.924415] CIFS: Attempting to mount //IP_ADDR/volume01
[   31.507014] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[   31.507022] #PF: supervisor read access in kernel mode
[   31.507024] #PF: error_code(0x0000) - not-present page
[   31.507025] PGD 0 P4D 0=20
[   31.507028] Oops: 0000 [#1] PREEMPT SMP PTI
[   31.507031] CPU: 0 PID: 1834 Comm: ls Not tainted 6.5.0-rc7+ #26
[   31.507033] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS Virt=
ualBox 12/01/2006
[   31.507034] RIP: 0010:smb2_query_symlink+0xf/0x310
[   31.507045] Code: 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 56 41 55 41 54 49 89 d4 55 <49=
> 8b 29 53 4c 89 c3 44 8b 6d 64 f6 05 4f 2f 0c 02 01 74 05 0f 1f
[   31.507047] RSP: 0018:ffffa15ac2e038e0 EFLAGS: 00010282
[   31.507048] RAX: ffffffff974d4240 RBX: ffffa15ac2e03a20 RCX: ffff8b1f40b=
d4ff6
[   31.507049] RDX: ffff8b1f77eb1cc0 RSI: ffff8b1f5aa60800 RDI: 00000000000=
0000f
[   31.507050] RBP: ffffa15ac2e03958 R08: ffffa15ac2e03960 R09: 00000000000=
00000
[   31.507051] R10: ffffa15ac2e03900 R11: 0000000000000000 R12: ffff8b1f77e=
b1cc0
[   31.507052] R13: ffff8b1f77eb1cc0 R14: ffff8b1f5aa60800 R15: ffff8b1f5aa=
67800
[   31.507053] FS:  00007f18b0ad5800(0000) GS:ffff8b2057c00000(0000) knlGS:=
0000000000000000
[   31.507054] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   31.507055] CR2: 0000000000000000 CR3: 00000001392b4004 CR4: 00000000000=
706f0
[   31.507058] Call Trace:
[   31.507063]  <TASK>
[   31.507065]  ? __die+0x1f/0x70
[   31.507070]  ? page_fault_oops+0x17d/0x4b0
[   31.507073]  ? exc_page_fault+0x73/0x170
[   31.507077]  ? asm_exc_page_fault+0x22/0x30
[   31.507080]  ? __pfx_smb2_query_symlink+0x10/0x10
[   31.507083]  ? smb2_query_symlink+0xf/0x310
[   31.507085]  cifs_get_fattr+0x5ce/0x9d0
[   31.507087]  ? __d_alloc+0x2b/0x230
[   31.507090]  cifs_get_inode_info+0x92/0x120
[   31.507092]  cifs_lookup+0x14e/0x7f0
[   31.507094]  ? generic_permission+0x35/0x230
[   31.507097]  __lookup_slow+0x86/0x130
[   31.507100]  walk_component+0xdb/0x150
[   31.507101]  path_lookupat+0x67/0x190
[   31.507102]  filename_lookup+0xe4/0x1f0
[   31.507104]  vfs_statx+0x9e/0x180
[   31.507108]  do_statx+0x67/0xb0
[   31.507110]  __x64_sys_statx+0x62/0x80
[   31.507112]  do_syscall_64+0x5b/0xc0
[   31.507116]  ? __count_memcg_events+0x49/0x90
[   31.507119]  ? count_memcg_events.constprop.0+0x1a/0x30
[   31.507121]  ? handle_mm_fault+0x9a/0x340
[   31.507123]  ? do_user_addr_fault+0x175/0x640
[   31.507125]  ? exit_to_user_mode_prepare+0x37/0x1b0
[   31.507128]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[   31.507130] RIP: 0033:0x7f18b0c69a2a
[   31.507133] Code: 48 8b 05 d9 a3 0d 00 ba ff ff ff ff 64 c7 00 16 00 00 =
00 e9 a5 fd ff ff e8 a3 06 02 00 0f 1f 00 41 89 ca b8 4c 01 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 2e 89 c1 85 c0 74 0f 48 8b 05 a1 a3 0d 00 64
[   31.507134] RSP: 002b:00007ffc3c831988 EFLAGS: 00000206 ORIG_RAX: 000000=
000000014c
[   31.507135] RAX: ffffffffffffffda RBX: 000056116610db28 RCX: 00007f18b0c=
69a2a
[   31.507136] RDX: 0000000000000800 RSI: 00007ffc3c832367 RDI: 00000000fff=
fff9c
[   31.507137] RBP: 0000000000000002 R08: 00007ffc3c831990 R09: 00000000000=
00002
[   31.507138] R10: 0000000000000002 R11: 0000000000000206 R12: 00007ffc3c8=
32367
[   31.507139] R13: 0000000000000000 R14: 000056116610db10 R15: 00000000000=
00003
[   31.507140]  </TASK>
[   31.507141] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq=
_device rfkill qrtr binfmt_misc intel_rapl_msr intel_rapl_common intel_pmc_=
core crc32_pclmul ghash_clmulni_intel sha512_ssse3 aesni_intel snd_intel8x0=
 crypto_simd snd_ac97_codec cryptd video ac97_bus rapl snd_pcm wmi snd_time=
r evdev joydev battery snd pcspkr soundcore vboxguest button ac serio_raw s=
g msr parport_pc ppdev lp parport fuse loop dm_mod efi_pstore configfs ip_t=
ables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 hid_generic u=
sbhid hid sd_mod t10_pi crc64_rocksoft crc64 crc_t10dif crct10dif_generic s=
r_mod vmwgfx cdrom drm_ttm_helper ahci ttm ohci_pci ata_generic drm_kms_hel=
per ohci_hcd ata_piix libahci ehci_pci ehci_hcd libata drm psmouse crct10di=
f_pclmul usbcore crct10dif_common scsi_mod crc32c_intel e1000 i2c_piix4 usb=
_common scsi_common
[   31.507192] CR2: 0000000000000000
[   31.507194] ---[ end trace 0000000000000000 ]---
[   31.507195] RIP: 0010:smb2_query_symlink+0xf/0x310
[   31.507197] Code: 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 56 41 55 41 54 49 89 d4 55 <49=
> 8b 29 53 4c 89 c3 44 8b 6d 64 f6 05 4f 2f 0c 02 01 74 05 0f 1f
[   31.507198] RSP: 0018:ffffa15ac2e038e0 EFLAGS: 00010282
[   31.507199] RAX: ffffffff974d4240 RBX: ffffa15ac2e03a20 RCX: ffff8b1f40b=
d4ff6
[   31.507200] RDX: ffff8b1f77eb1cc0 RSI: ffff8b1f5aa60800 RDI: 00000000000=
0000f
[   31.507200] RBP: ffffa15ac2e03958 R08: ffffa15ac2e03960 R09: 00000000000=
00000
[   31.507201] R10: ffffa15ac2e03900 R11: 0000000000000000 R12: ffff8b1f77e=
b1cc0
[   31.507202] R13: ffff8b1f77eb1cc0 R14: ffff8b1f5aa60800 R15: ffff8b1f5aa=
67800
[   31.507203] FS:  00007f18b0ad5800(0000) GS:ffff8b2057c00000(0000) knlGS:=
0000000000000000
[   31.507204] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   31.507205] CR2: 0000000000000000 CR3: 00000001392b4004 CR4: 00000000000=
706f0
```

If you assume that I did something wrong or should check something
additionally, please let me know.

I'll try and get a setup where we can capture non-encrypted traffic.
This might take a bit next to my regular work but I'll do my best.

Thanks!

Best
Sebastian

[1]
https://kernel-team.pages.debian.net/kernel-handbook/ch-bugs.html#s9.2.1
+-------------------------------------------------------------+
 Sebastian Steinbei=C3=9Fer
 Leibniz-Rechenzentrum   Tel.:+49-89-35831-8779
 Boltzmannstra=C3=9Fe 1       E-Mail: Sebastian.Steinbeisser@lrz.de
 D-85748 Garching
+-------------------------------------------------------------+


-----Original Message-----
From: Paulo Alcantara <pc@manguebit.com>
To: "Steinbei=C3=9Fer, Sebastian" <Sebastian.Steinbeisser@lrz.de>,
gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Date: 15.07.2024 14:21:14

Steinbei=C3=9Fer, Sebastian=C2=A0=C2=A0<Sebastian.Steinbeisser@lrz.de> writ=
es:

> I'll try and get that done. I'm currently in the process of bisecting
> the issue on the side.

Awesome.=C2=A0 Thanks!

--=-AFR6CDyZL+fI1Cio2AVU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEyYbfXNcMyuhbpCh3C0OiiRZtSGkFAmaVI4gACgkQC0OiiRZt
SGm+fQf/bCYHr4OxCWof/0tA4yzqciIC13FMNwVwAeepbyJ/ZoYwHjwpFFKEE/js
COuSAl9jSh1FCiWn7Y3B1w3TS7e4iswnJfQfcGfCCjq+kGIDGrWsuRvVOtLlmwVX
Ac4Ha6eEXdUQj7lP1u/ulQK9fAD2iY8nu0v3jRQ+7QYhuTy8lQxzA868ltdef0Cb
pF1CSEo9MwHh0VfKHDpBPounRDYc3yX3MZTmaEuNus+WJ2dz7ZSWbK8igjTe0pHJ
ETQLiQ/Ru7SYtVujV2PD9pZPy2Eschf5HmNSPRCDtSQzfPfqJeSGiTSPYtdqreve
ZAEv4KcOXEnBXmQa74RgCuC5EUD4OA==
=Mkdx
-----END PGP SIGNATURE-----

--=-AFR6CDyZL+fI1Cio2AVU--

--=-1PpKPyMoGb8nW6nOZDIv
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgIFADCABgkqhkiG9w0BBwEAAKCCE9Yw
ggZyMIIEWqADAgECAhB4WSw8yggu2tjprafqDVB3MA0GCSqGSIb3DQEBDAUAMEYxCzAJBgNVBAYT
Ak5MMRkwFwYDVQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBD
QSA0MB4XDTIzMDQwNTAwMDAwMFoXDTI2MDQwNDIzNTk1OVowgdYxSTBHBgNVBAoTQExlaWJuaXot
UmVjaGVuemVudHJ1bSBkZXIgQmF5ZXJpc2NoZW4gQWthZGVtaWUgZC4gV2lzc2Vuc2NoYWZ0ZW4x
GzAZBgNVBAkMEkJvbHR6bWFubnN0cmHDn2UgMTEPMA0GA1UECBMGQmF5ZXJuMQswCQYDVQQGEwJE
RTEgMB4GA1UEAwwXU3RlaW5iZWnDn2VyLCBTZWJhc3RpYW4xLDAqBgkqhkiG9w0BCQEWHXNlYmFz
dGlhbi5zdGVpbmJlaXNzZXJAbHJ6LmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
1tOueshjEujWZwBYyHyoO+kmDqVsdk7ahy3ey10S/PULIgHs2LcorCvy06ayLeMMkQVJqCJ7l/XW
dSgKdjvkklBYay6U6bB3sSDkHUSMNDscJYctXgxQd9/6o7WCdxXhTekd/L+YDueL/sG6ozfynduZ
j4ivj64T38neSm0hOKhd1+vK3yNbQLebuQ6CZRpb7ZjGcmIh+ro252MAedmhyyrCljtOsr2LdWMX
GvXhwcEvf2XqRj2HXOdEpbKoKooENN8ah5WQTUtB94BtBCQMbGzg8nmcwR3B38Ice97Wjv1+Kf4t
ueH+TlVWOiLpY5JqwOl/GFpIAU6lp0HgSO83IQIDAQABo4IByTCCAcUwHwYDVR0jBBgwFoAUaQCh
xyFY+ODFGyCwCt2nUb8T2eQwHQYDVR0OBBYEFH+HEyIOkKU+emsScF+IW9dWTcMHMA4GA1UdDwEB
/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjA/BgNV
HSAEODA2MDQGCysGAQQBsjEBAgJPMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20v
Q1BTMEIGA1UdHwQ7MDkwN6A1oDOGMWh0dHA6Ly9HRUFOVC5jcmwuc2VjdGlnby5jb20vR0VBTlRQ
ZXJzb25hbENBNC5jcmwweAYIKwYBBQUHAQEEbDBqMD0GCCsGAQUFBzAChjFodHRwOi8vR0VBTlQu
Y3J0LnNlY3RpZ28uY29tL0dFQU5UUGVyc29uYWxDQTQuY3J0MCkGCCsGAQUFBzABhh1odHRwOi8v
R0VBTlQub2NzcC5zZWN0aWdvLmNvbTBHBgNVHREEQDA+gR1TZWJhc3RpYW4uU3RlaW5iZWlzc2Vy
QGxyei5kZYEdc2ViYXN0aWFuLnN0ZWluYmVpc3NlckBscnouZGUwDQYJKoZIhvcNAQEMBQADggIB
ABGFqf3GfUcKjIValp5G72ihJu6fz9GT/2WTgs6MUyDjHZdm425XgXd0xTqqBCnQKma8GPJd61AY
3a6fUGlsrW96ZwlUWNJ1q/6qy0JC6c/Z+K7QP/2sBc07rea59p0RI500ADdWJjLv2aL71d0nammo
eiRPe5Ax5ho6lufR+wFiIABZri87n6e1N2ukQt9Hyk/TdsdyU6WYBD/0fP/p/73lr5Pc6npXxOfm
lryNcW3fBt+rGksfyH3qnCbISbUFUvqlglJ1viOEmACP7x1550Txcf96MPD2SNxT9rVUXhAYODHw
KA2H+Hx5s9ILt/7oTf6HqM959zQIdu9ATU7RMlUFpxN0chYYTgp4HBU5Gtm4hvLshS/WA1YVLNHa
Z/nTCyoFwYRw1IDwvHmbj9kOyhkvDkTpUQHgw38HU2qFiIzXnUEgQfOZkjYjgiRMIDL2tOaPrvgj
FaFqc4hWQ0/E1GYSsDDQrXmmz790lA7HAulMNOCiWN38eMSHH0rSUIogHudq0kswlX9mFDYfsWSi
/QR6ZuNMxo32asPGk7twzRcRAeSYk5GrGl5sqt4LD8GsWXz8rmvwYjZN/l5Jd/Dt8OvqyDC/Chwy
SfPsY027BfZyvDAjHD2luySuUB2dLHP90w8vRsNvKbhIF5Dh4t73nUGB79kaGi2BrQVXdCxzhp/z
MIIGcjCCBFqgAwIBAgIQeFksPMoILtrY6a2n6g1QdzANBgkqhkiG9w0BAQwFADBGMQswCQYDVQQG
EwJOTDEZMBcGA1UEChMQR0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwg
Q0EgNDAeFw0yMzA0MDUwMDAwMDBaFw0yNjA0MDQyMzU5NTlaMIHWMUkwRwYDVQQKE0BMZWlibml6
LVJlY2hlbnplbnRydW0gZGVyIEJheWVyaXNjaGVuIEFrYWRlbWllIGQuIFdpc3NlbnNjaGFmdGVu
MRswGQYDVQQJDBJCb2x0em1hbm5zdHJhw59lIDExDzANBgNVBAgTBkJheWVybjELMAkGA1UEBhMC
REUxIDAeBgNVBAMMF1N0ZWluYmVpw59lciwgU2ViYXN0aWFuMSwwKgYJKoZIhvcNAQkBFh1zZWJh
c3RpYW4uc3RlaW5iZWlzc2VyQGxyei5kZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANbTrnrIYxLo1mcAWMh8qDvpJg6lbHZO2oct3stdEvz1CyIB7Ni3KKwr8tOmsi3jDJEFSagie5f1
1nUoCnY75JJQWGsulOmwd7Eg5B1EjDQ7HCWHLV4MUHff+qO1gncV4U3pHfy/mA7ni/7BuqM38p3b
mY+Ir4+uE9/J3kptITioXdfryt8jW0C3m7kOgmUaW+2YxnJiIfq6NudjAHnZocsqwpY7TrK9i3Vj
Fxr14cHBL39l6kY9h1znRKWyqCqKBDTfGoeVkE1LQfeAbQQkDGxs4PJ5nMEdwd/CHHve1o79fin+
Lbnh/k5VVjoi6WOSasDpfxhaSAFOpadB4EjvNyECAwEAAaOCAckwggHFMB8GA1UdIwQYMBaAFGkA
occhWPjgxRsgsArdp1G/E9nkMB0GA1UdDgQWBBR/hxMiDpClPnprEnBfiFvXVk3DBzAOBgNVHQ8B
Af8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwPwYD
VR0gBDgwNjA0BgsrBgEEAbIxAQICTzAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29t
L0NQUzBCBgNVHR8EOzA5MDegNaAzhjFodHRwOi8vR0VBTlQuY3JsLnNlY3RpZ28uY29tL0dFQU5U
UGVyc29uYWxDQTQuY3JsMHgGCCsGAQUFBwEBBGwwajA9BggrBgEFBQcwAoYxaHR0cDovL0dFQU5U
LmNydC5zZWN0aWdvLmNvbS9HRUFOVFBlcnNvbmFsQ0E0LmNydDApBggrBgEFBQcwAYYdaHR0cDov
L0dFQU5ULm9jc3Auc2VjdGlnby5jb20wRwYDVR0RBEAwPoEdU2ViYXN0aWFuLlN0ZWluYmVpc3Nl
ckBscnouZGWBHXNlYmFzdGlhbi5zdGVpbmJlaXNzZXJAbHJ6LmRlMA0GCSqGSIb3DQEBDAUAA4IC
AQARhan9xn1HCoyFWpaeRu9ooSbun8/Rk/9lk4LOjFMg4x2XZuNuV4F3dMU6qgQp0CpmvBjyXetQ
GN2un1BpbK1vemcJVFjSdav+qstCQunP2fiu0D/9rAXNO63mufadESOdNAA3ViYy79mi+9XdJ2pp
qHokT3uQMeYaOpbn0fsBYiAAWa4vO5+ntTdrpELfR8pP03bHclOlmAQ/9Hz/6f+95a+T3Op6V8Tn
5pa8jXFt3wbfqxpLH8h96pwmyEm1BVL6pYJSdb4jhJgAj+8deedE8XH/ejDw9kjcU/a1VF4QGDgx
8CgNh/h8ebPSC7f+6E3+h6jPefc0CHbvQE1O0TJVBacTdHIWGE4KeBwVORrZuIby7IUv1gNWFSzR
2mf50wsqBcGEcNSA8Lx5m4/ZDsoZLw5E6VEB4MN/B1NqhYiM151BIEHzmZI2I4IkTCAy9rTmj674
IxWhanOIVkNPxNRmErAw0K15ps+/dJQOxwLpTDTgoljd/HjEhx9K0lCKIB7natJLMJV/ZhQ2H7Fk
ov0EembjTMaN9mrDxpO7cM0XEQHkmJORqxpebKreCw/BrFl8/K5r8GI2Tf5eSXfw7fDr6sgwvwoc
Mknz7GNNuwX2crwwIxw9pbskrlAdnSxz/dMPL0bDbym4SBeQ4eLe951Bge/ZGhotga0FV3Qsc4af
8zCCBuYwggTOoAMCAQICEDECcNQ1vpskmvhW0OHihUkwDQYJKoZIhvcNAQEMBQAwgYgxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEeMBwGA1UE
ChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNBIENlcnRpZmlj
YXRpb24gQXV0aG9yaXR5MB4XDTIwMDIxODAwMDAwMFoXDTMzMDUwMTIzNTk1OVowRjELMAkGA1UE
BhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdpbmcxHDAaBgNVBAMTE0dFQU5UIFBlcnNvbmFs
IENBIDQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCzSuIiXidb6QRbFAQ1MiAUrrTS
MUDGzVDAHqFEyq+eSmF/LZDeYpszai2kQsqWATz/cBA9gGjunvJ45G48ycC4D6gwZFvbBt5Jotxl
unBeB8K+crGar3v+RCQ4VfvToX07v+HTJ6EeEONR3IzJPTMyzgAwENGsAWf9va9HePQFJiChCzXq
hKpp0zen53S+8f9itEy06GS8aku7Mvyb4tMBBa9An3Y3ALIqIeymg/iYs8m9WkSkMyekNtFRB1+1
KlnNUpM05G8+sY9EucnQQRUIdHzYsvqjP3XlaSuB4Jj0ia66UGfi5Wx31mm5sKAz8Re9UGVWIqq6
wKFKxkSfuO4iwYiIPJoiGEux3dqabwFLduAroDF1IxE40PqGIdPXzYuZ/wL6BEfFAb0xy8bfm5S9
G7y/ts9mIlFpPtkLZ/nQ/iVOWdsu9ale/nK/uGF47xsxeW2LIvB4sH5U2+D4ad8vpNbcCrXIXXKt
kBnNHgxumNNZ0R1Isq/Pz7TALCxxDzWdsM7AO32/Jn7R4ldtGRZmKpJyfACDn8HU1QPhOtiWsjif
rMWnanJhQ6K7M/5qz8BmfPrca+MUrr1Y4NHZb9MrgPtWKQQyGDXy+G5F/iHGdZk7LS+F8NH+Ddol
t2wZpz52JqGMTDPIH5Qok4LLO95wbxtn+79Tw+wQxmDTuIg+LwIDAQABo4IBizCCAYcwHwYDVR0j
BBgwFoAUU3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFGkAocchWPjgxRsgsArdp1G/E9nk
MA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDA4BgNVHSAEMTAvMC0GBFUdIAAwJTAjBggrBgEFBQcCARYXaHR0cHM6Ly9zZWN0
aWdvLmNvbS9DUFMwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2VydHJ1c3QuY29tL1VT
RVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUFBwEBBGowaDA/Bggr
BgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUFkZFRydXN0Q0Eu
Y3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUA
A4ICAQAKBU57DY8fEzkA/W/sYsbD7e0XquMBzHjcP0eXXXRD4EAEAGCWSs+QRL9XIxmx+52zx9wM
a8YTejlR+NKejiyKPTF0q63zMxrO/z/hUwo8IDcRRLS0NSgvTW6AN2rCXJe5iLN5fIfYgIBB9cy1
L6trPuZ/vjUJm87nQ7ExQzGqWN5F9U8MlAk0c5iLanG7GCMoNjHiF1n0baj6guUeG7n5qcwOQTyD
S19+NEqfwjUPUGasN1ZH8h1sE6PrzvRpti+rKzWpiU+i2/k3l2b5fFDy+Wu9jv6R9BoBh47es/UM
zwEZ2kSrIVVr4jSukk+FpmR5ZbtwiYNAV6sdb1srMGsILzXlrdasSE2nGHvZklk2zUdgn7b01MHq
67g0mNozGmT6Dam41Kbhv25WMFs871XqwVIb4gGoT1yRf/VePMm1jwauqijhKJFvrNweGnebGPei
paLxIo2iEA4qdRztEg/qyzWGogXK/TFdmivg322fMPQWjQkMhRGMM8SCjlZN22L8x0ZOYoVA2rHJ
m5P25IjZe+HPyn7ikJiSJmqlqFmUeowXF3D1dFlCCs/5yC06RYRqI2REFu+28t2nswIvY6xCFAR0
RtS8Mz2yXNld0js2MmiRUGrc7imWzdUPbPcv9sdUF7SsERGPIzYL8dIiHzit+YCoGCSXMg6peF37
hHNp1TGCAtowggLWAgEBMFowRjELMAkGA1UEBhMCTkwxGTAXBgNVBAoTEEdFQU5UIFZlcmVuaWdp
bmcxHDAaBgNVBAMTE0dFQU5UIFBlcnNvbmFsIENBIDQCEHhZLDzKCC7a2Omtp+oNUHcwDQYJYIZI
AWUDBAICBQCgggFRMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0
MDcxNTEzMjYzMlowPwYJKoZIhvcNAQkEMTIEMIDSu31xRv58nmV1btya+NgrFwb6ipR1dSU+xY8/
56iSbNR/X3xMz7Y5B01xSGBMvzBpBgkrBgEEAYI3EAQxXDBaMEYxCzAJBgNVBAYTAk5MMRkwFwYD
VQQKExBHRUFOVCBWZXJlbmlnaW5nMRwwGgYDVQQDExNHRUFOVCBQZXJzb25hbCBDQSA0AhB4WSw8
yggu2tjprafqDVB3MGsGCyqGSIb3DQEJEAILMVygWjBGMQswCQYDVQQGEwJOTDEZMBcGA1UEChMQ
R0VBTlQgVmVyZW5pZ2luZzEcMBoGA1UEAxMTR0VBTlQgUGVyc29uYWwgQ0EgNAIQeFksPMoILtrY
6a2n6g1QdzANBgkqhkiG9w0BAQEFAASCAQAMTHcjXPTIe47Zx1OQaRrjnvRdwYp226DtUKRZwyn8
/wg9WuZHpnI7XB2e+H3fQwvN+mC19CR5iqhQdB4SctIcbSFOuLC/0dm+t+Q0kF3jG1hlxNHWHcxo
NWUI+cDbhqS6/MPX9a5Iify1SmPbT3wkObouUy6+agO8TIV36Q1PX3Yb0xREWWSEnisQb8cNDX6x
pTtWnKhtFms5oeGjbWIHuJ2Tik4xv7GNG8kTCDYhTaRTnf7Eqp+xZrBWVHKYb7esowbPjhVZIQ3B
RFieT91z43OrtvCJFvHV0CJ0isgI6lDy7lxQ5+KF0nOTnyZd5f9tbqfOhLK/lkd92PcNFTMyAAAA
AAAA


--=-1PpKPyMoGb8nW6nOZDIv--
