Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290E3EBF07
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796889; cv=pass; b=bP7DgSWiYKc5W26D9iv8CDmOgk7jyEHn65NW0Qjvz0un7R6kfCBwRSHSFw92sn4JJRokAZH94bH9pd96vhLVEOGK/nIeXQtr0cjogiZM4iqZnrFbGTvYwMfqhRYWOGcE17lP6aqi48vYXkCuHASaCVVKIiiSQRo2mqxapo7ejeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796889; c=relaxed/simple;
	bh=N5c7ArmXYDKWgyVh4b5GR2THkmWh7+mGuMGrh/XYuyk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bmN//BL3NXklJZjA1fRJOW9+xwL1ZLbkPvevsxLdLzmUnqWTwmSMmP1PUHsrjr6GzfO108oAiuBBsW++R9HL8SvEyTbpIYACHV1Gh5IXCnyKpU4Nvz6Ln+qoRC7A4QnsiEhtRLK1P+RHGZYBM/5G8d9rCC8uajXaRHCsRrMoHAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPOwFXHY; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPOwFXHY"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65c396d3b36so10173903d50.0
        for <regressions@lists.linux.dev>; Tue, 26 May 2026 05:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779796883; cv=none;
        d=google.com; s=arc-20240605;
        b=CMcoDRDZVGnQqqae0FiOAn5Y6pjd8YuGcSVJIFxazKlaaM/3G3gYwfVua/TTigomGB
         7SiW9vf+j5c8XXiT2CryTgKJ0Jcm6jNAik6VfzVU4c0YwxHt59/cb7bZAJNYixe3qRdb
         FGW+QOPxz0HGfqy31q+dFaGE//DAaaMoGocB6sXEhGc70xUGzR4aMoJMb4Sp5DRTZKfr
         GRrum7CA1xE20ChIbiI48TIXN87fisebSsf9oPh5F3qkfmIzZNLiKSP22vimMepcxCDR
         ZNlKm7sRV3VjyIEs5AZzrW/fyhq7rCzv7obh4zbnqwG4+X4Brc/kFO9ytMfruRMOjfjq
         5Jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=w/qF9Y2yN8vAfbh3RrIPFK5LawrzDHFyp5ALmuYhln4=;
        fh=FjOGgolOLHaGC/y0VZO1T63Qo0b7XvyokUZxtzn82Lg=;
        b=ehxPGJbLR1Xhhq7z6wC+vKh3xqqhxzncVqO8Ek5ZSFMCJ9iZxUw8x3O++hOXx+aeAx
         IJ9cS4jMxwJyk7kqfLBcqCQm2tI747VUKrIIcaRTpP1QmtsFF0feGaPwZAKYMm2gjpGe
         EWEyC1vhRiZxLPXr7nbso4kuePZZu9teHOmOTLH3DVMfgflv7BdOO4wmy1GiTxmCXDQA
         tI0tfavAULIuVKlFck23dAZYidW6aShVypUrZLu+bZZAKvXrvzFYHmRLpDb/IGRkmI3J
         I18ZaEg4TphpPfE9TlQ2uFcbRK6iQeIgGnfVDxH8Gofrd2NByit6TislsCreN/OKH6bn
         b3Og==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796883; x=1780401683; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w/qF9Y2yN8vAfbh3RrIPFK5LawrzDHFyp5ALmuYhln4=;
        b=RPOwFXHYoIkLps0I1vf83Nrc4fT+bnd329U5apedKtMkSc36kDVOjhd5S6RpXOhYIi
         zIgyPFAf9pezCnnTgtNZcR5ZasoW24oXmXDzeicdYaUagdsUXDk8yk/hATBCjpJadziy
         NY/BuOJn6AFopbTCXcZysNibMq10Yr/ER3BuEC07sjutZx+2SyCU+WeIWe0ww4QyOcJG
         cnpH2mcKraW8WRq6MUQeWY1rum55GY/PlSkQy/gcsLIYE2Wby16aOgJHqpzzvGqwxr0W
         fGKgk9oQqfuA7D7TVOaHayd6cq/eJtm8EkKy2mXchdd0FlIHscXdwGF6hoIx0D0C5QF2
         zQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796883; x=1780401683;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/qF9Y2yN8vAfbh3RrIPFK5LawrzDHFyp5ALmuYhln4=;
        b=ZGn0p4BTgJoPJjIYjcW0ryJNQEZCAAKwFSOEqGB8YkcFmf2lfHuIZARdETh6dsna6P
         OWTlIg5eXN8cbqSmJQ3VCTJb2toY6/TV3YivC8JCU6xKxwsyL1pHLTex8WCPGecw8fQz
         pxN1ekpe7QGPKPe63db0lCdlg9AyEtBWGJyQkCjQqlzQMs1Qp036Ga/e/M1nIzH4SOBi
         DwiKXiXfuS99Uw3zj9JykcC1Utmf3Vrc9D5tEKYxq7kJNsHoxmRcm1ZSnomD9EYOEG4E
         tb8HmgvVIjreWEgaWQkFGFebHBjIkneiXh4w2IvHHNuopgJdlmaT1llFw8+nLG2NPS3E
         QjjA==
X-Forwarded-Encrypted: i=1; AFNElJ+2pEyF0hriBwHx26ow45APc0I61uP9rRMxifX0WIT104/lCBNJYE1mJFPHHzhTMvFLdogTQuaGWUJLLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE0bI36dnSntfLBscLHCwkSrI5tVzOppGSbrPvGczSyYatnHnL
	ilm7Y1QKCXOq4nAhVYSXtoKYX5Wq5eYtFs1/UlMv6XHvC3F+zy6Q+uUGZo6tpozNh7W/mgMPMDs
	H3HZidXJkSUjBeC8yL9z4EauRiDWKKGY=
X-Gm-Gg: Acq92OHVcE/lvv4bzHqMTNNr/kY6B76kNPsU3kzRhOUTOalKDt+qSUmUK8vVnmsSjC9
	vUUDuwF1ccoIAG9g/LkWCq28d+8QPD4P0zzuEWHH5aXF5j4AmGW7abKBx2KJZ9BNMyQQ51FpyOL
	Qvv6ypn2xTbN95XBokaM+9HADrVuke82YH+YFyB0Xz2fFExXzWIxpVI3mRScnN1MgutS7iEX5S/
	ot/IGza3r0Bv7mUwA2p4VTpZektfmRbgnP8Q2loYRGktPh6obj+ARd2+1HVVUl2+x5p3UJByZiw
	20gyYdrL0uBNwfMK5sH9eXrzXHZsPzLqeMMpl4c6gib2AyFIBzVC
X-Received: by 2002:a05:690e:440b:b0:654:a000:94c0 with SMTP id
 956f58d0204a3-65ec9639cc6mr13512457d50.5.1779796882512; Tue, 26 May 2026
 05:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Tue, 26 May 2026 13:01:11 +0100
X-Gm-Features: AVHnY4IecFYuqDLGqiirwU4wwgprvlSe6_3qGLkAaXavpqxYHrR0vACTJJsPcAQ
Message-ID: <CAMw=ZnSaVSzn1RGtiNRG+iNj8M1e12rZtA98i4jL8jYP5UyzWg@mail.gmail.com>
Subject: Occasional 'WARNING: mm/backing-dev.c:636 at cgwb_release_workfn'
 when running mdadm
To: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Cc: Mike Rapoport <rppt@kernel.org>, Christian Brauner <christian@brauner.io>, regressions@lists.linux.dev, 
	Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"

Hi, I've been told to report this here.

In our CI test that runs some mdadm commands we occasionally (maybe 1
in 100 runs, not reproducible manually) see the following kernel warn:

[ 15.769393] TEST-64-UDEV-STORAGE.sh[245]: + mdadm -v --stop /dev/md/mdparity
[ 15.786033] ------------[ cut here ]------------
[ 15.788632] !list_empty(&wb->b_attached)
[ 15.788634] WARNING: mm/backing-dev.c:636 at
cgwb_release_workfn+0x142/0x1f0, CPU#0: kworker/0:1/11
[ 15.789235] Modules linked in: raid456 async_raid6_recov async_memcpy
async_pq async_xor async_tx raid1 intel_rapl_msr intel_rapl_common
kvm_amd ccp kvm joydev iTCO_wdt irqbypass mousedev intel_pmc_bxt
ghash_clmulni_intel vfat i2c_i801 fat aesni_intel psmouse i2c_smbus
intel_agp lpc_ich pcspkr i2c_mux virtio_balloon intel_gtt serio_raw
mac_hid tun md_mod dm_mod qemu_fw_cfg vsock_loopback
vmw_vsock_virtio_transport vmw_vsock_virtio_transport_common vsock
virtio_rng
[ 15.790846] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted
7.0.10-arch1-1 #1 PREEMPT(full)
b38726df0ec1c5aec6f05d4eab858505a5944d02
[ 15.791457] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
Arch Linux 1.17.0-2-2 04/01/2014
[ 15.791842] Workqueue: cgwb_release cgwb_release_workfn
[ 15.792166] RIP: 0010:cgwb_release_workfn+0x142/0x1f0
[ 15.792411] Code: f6 43 d8 01 75 2c 48 83 c4 08 48 89 df 48 c7 c6 00
b2 a8 ba 5b 5d e9 0d 5d dc ff e8 f8 fd ff ff 48 8d 43 b8 48 39 43 b8
74 d6 <0f> 0b f6 43 d8 01 74 d4 0f 0b eb d0 48 89 04 24 e8 69 e6 db ff
48
[ 15.793129] RSP: 0018:ffffccd280063e50 EFLAGS: 00010293
[ 15.793401] RAX: ffff89eecbae4eb8 RBX: ffff89eecbae4f00 RCX: 0000000000000008
[ 15.795755] RDX: ffff89eecbae4d80 RSI: 0000000000000202 RDI: ffff89eecae8a040
[ 15.796172] RBP: ffff89eecae8a000 R08: 0000000000000001 R09: ffffccd28018e010
[ 15.796560] R10: 0000000000000001 R11: fefefefefefefeff R12: ffff89ef3bc322c0
[ 15.796889] R13: ffff89eec083c405 R14: 0000000000000000 R15: ffff89eecbae4f00
[ 15.797298] FS: 0000000000000000(0000) GS:ffff89ef7e367000(0000)
knlGS:0000000000000000
[ 15.797637] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 15.797961] CR2: 000055cd8ab1d960 CR3: 0000000109878004 CR4: 0000000000370ef0
[ 15.798319] Call Trace:
[ 15.798454] <TASK>
[ 15.798572] process_one_work+0x19c/0x3a0
[ 15.798732] worker_thread+0x1b1/0x310
[ 15.798896] ? __pfx_worker_thread+0x10/0x10
[ 15.799164] kthread+0xe1/0x120
[ 15.799330] ? __pfx_kthread+0x10/0x10
[ 15.799536] ret_from_fork+0x2bc/0x350
[ 15.799713] ? __pfx_kthread+0x10/0x10
[ 15.800486] ret_from_fork_asm+0x1a/0x30
[ 15.800666] </TASK>
[ 15.800795] Kernel panic - not syncing: kernel: panic_on_warn set ...
[ 15.801089] CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted
7.0.10-arch1-1 #1 PREEMPT(full)
b38726df0ec1c5aec6f05d4eab858505a5944d02
[ 15.801553] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
Arch Linux 1.17.0-2-2 04/01/2014
[ 15.801863] Workqueue: cgwb_release cgwb_release_workfn
[ 15.802060] Call Trace:
[ 15.802161] <TASK>
[ 15.802264] dump_stack_lvl+0x5d/0x80
[ 15.802440] vpanic+0x20a/0x410
[ 15.802568] ? cgwb_release_workfn+0x142/0x1f0
[ 15.802761] panic+0x6b/0x70
[ 15.802905] check_panic_on_warn.cold+0xf/0x1e
[ 15.803082] __warn.cold+0xa7/0x10c
[ 15.803204] ? cgwb_release_workfn+0x142/0x1f0
[ 15.803361] __report_bug+0x93/0x110
[ 15.803492] ? cgwb_release_workfn+0x142/0x1f0
[ 15.803681] ? cgwb_release_workfn+0x142/0x1f0
[ 15.804541] report_bug+0x29/0x70
[ 15.804701] handle_bug+0x167/0x360
[ 15.804862] ? cgwb_release_workfn+0x142/0x1f0
[ 15.805096] exc_invalid_op+0x1d/0x90
[ 15.805255] asm_exc_invalid_op+0x1a/0x20
[ 15.805449] RIP: 0010:cgwb_release_workfn+0x142/0x1f0
[ 15.806398] Code: f6 43 d8 01 75 2c 48 83 c4 08 48 89 df 48 c7 c6 00
b2 a8 ba 5b 5d e9 0d 5d dc ff e8 f8 fd ff ff 48 8d 43 b8 48 39 43 b8
74 d6 <0f> 0b f6 43 d8 01 74 d4 0f 0b eb d0 48 89 04 24 e8 69 e6 db ff
48
[ 15.807217] RSP: 0018:ffffccd280063e50 EFLAGS: 00010293
[ 15.808511] RAX: ffff89eecbae4eb8 RBX: ffff89eecbae4f00 RCX: 0000000000000008
[ 15.808785] RDX: ffff89eecbae4d80 RSI: 0000000000000202 RDI: ffff89eecae8a040
[ 15.809056] RBP: ffff89eecae8a000 R08: 0000000000000001 R09: ffffccd28018e010
[ 15.809397] R10: 0000000000000001 R11: fefefefefefefeff R12: ffff89ef3bc322c0
[ 15.809687] R13: ffff89eec083c405 R14: 0000000000000000 R15: ffff89eecbae4f00
[ 15.809978] process_one_work+0x19c/0x3a0
[ 15.810154] worker_thread+0x1b1/0x310
[ 15.810325] ? __pfx_worker_thread+0x10/0x10
[ 15.812450] kthread+0xe1/0x120
[ 15.812594] ? __pfx_kthread+0x10/0x10
[ 15.812738] ret_from_fork+0x2bc/0x350
[ 15.812878] ? __pfx_kthread+0x10/0x10
[ 15.813026] ret_from_fork_asm+0x1a/0x30
[ 15.813179] </TASK>
[ 15.813607] Kernel Offset: 0x39400000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)

I don't have hard data for when it started, but I don't think I've
seen it for more than a couple of months tops. This one was on 7.0.10
on Arch, but I think I've seen it on Rawhide too.

The test script that triggers it:
https://github.com/systemd/systemd/blob/d096763827718083918244eb3b7796bf27876d56/test/units/TEST-64-UDEV-STORAGE.sh#L1191

Is this a known issue? Thanks

-- 
Kind regards,
Luca Boccassi
