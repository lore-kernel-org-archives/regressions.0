Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829947DF9B
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 12:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327126; cv=pass; b=dCpBmi7qvrpFPNfG/lIzk+IF5TLHqlkJZ/OHRgG/gwCydbxK2oHQ3b9rIRV9Wefies73m2A4b3LbuRr1NSwaBGUXPO+1v32Lf7Pb2batTpFLZeQUSk4xkLd1kSi2aI+A6tWLH+pQcvM//6FM50fJPR6GjZSG63cnV2Mbddiu5bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327126; c=relaxed/simple;
	bh=0n/blMOwWRFN9h6O0n5KPzpTuqQ+pZ/IA41DQfT0tbE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=u75GHrjYImdzR5+Rhcneik6kHh2/cEa0bAHjatCrC5CR+x1AKqhKepvqbMuiF9/kwtfIvgE6ZXUWyy/JvdmqcRsFogp8bGTnW3JUwmUYQbfOo5v6IYwj4dZWQyig5EUSGA90xewJ4R6prH2+XVmIhCyLJyRZSC/u8fPccSrWLlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avCO3NBn; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avCO3NBn"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a4cb36ae00so494748b6e.0
        for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 05:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785327120; cv=none;
        d=google.com; s=arc-20260327;
        b=NmtgmnsAbWFYMg4QZeTe2eGS31eX7M3wFbqDIE/EVUBgsF041MCQtl1IMC3OjMMlIq
         DsQDSE76Zwdns8WKThvH4n3qdJZKLuBX31tKTkjBGn/tn6q6KO8BeKsle36vbE1XAjRG
         bo9LOoaiCYaCP/DI+ooZ7IPKYZV8B97J9bJXWkmairRWKrHNpfex+VhdyN8WvpB2NM1u
         lN0+FBAOgPqu0FLwQDPFAKR+mdUCZP0sgndHu8jx+ozKWJtCoaKCHKFQd/PY0OL8GvQt
         5i0igMPxJbue3rx6Yy64lnKL8VaKYEuRfVD/2v106CPK6S3pDfxW/Tj6j5fc3eY6MlhR
         Jrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qaklyrUuDyugQr83OnTK+2WorDJTsMlIt9kYQCGcItg=;
        fh=Hi51YWuPkGPl+o+QQFCkEuCgNPef+ggQN7GkeY6Y8Uo=;
        b=WT6NoRF6YWFgs5qR4iZA+TiKE1krjQiZQA7oxD/M5F0+Ng3ScEPP+2HPeBxK4Zks/T
         0EHCyp39MqdJJWuou0lAlE4ErHbYy3X/Q0szpANzrhTBC+V/orF3au7YuCr3/wclyePo
         R+Hl8KEZ1N25MwXEyZEN79M8Uhg49MNJsdKIdjmBsrpYVY8PYEFALreaCy4vDsPrBc0j
         VjIkA9U6vgsy2X84TE7im2/oWOnw4Qd2j+P6++WTmnXJosQ6Z0yRYi5hlLwZIiZYNbb0
         rWLYHSRygI/Qp1KbQGMgQM4CfPWAN4OrogIJ7pzhvt4J/MFBpEIr6SYB9n7d78U3cd9D
         co7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785327120; x=1785931920; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qaklyrUuDyugQr83OnTK+2WorDJTsMlIt9kYQCGcItg=;
        b=avCO3NBnhkywJSQ4H3wRHds8+9f49/fHTGU+OMOBluHcGjgqrWRlNb3gq/YfvvXkBd
         GwDJbXFjItUJXh9XRl6pnaKZBL71oDvCXj723z2yTdHcu5zrjHSdQMCE9K5BJ1+H78x2
         Spq2Xz6n1qY3XPr6xYn2M1uZRcTg2gZrFVyXxwFnmofxPTSle44ntAcj6N4ouquoyNJh
         b+7qDoFquIy+PGeABnWYiXGh0TbKYuVcBO+WCfna0wI/zwLQmiTdNRqt/q5wT9tROyAA
         vOLEse1izirB7w5m0RzY7Z/csbWEXCyzNhr8d1tGF4eGIymoID9Nxsw3NQkyW/3l2Pq7
         AngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327120; x=1785931920;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qaklyrUuDyugQr83OnTK+2WorDJTsMlIt9kYQCGcItg=;
        b=UeNfj+qWHw7j75u4e/Lz13HvAPFv7T5MpFfdINJoPJG9gjy6ARjSmTtkFbsOTorjKg
         owgtXXq9qsyeho7J+xW2uyBTUu7PsEcYSvNY+tyLx998jC4E91KfcFVG5Uy/ub/e45dz
         cUtA05tij/7h8vELeCn34qlo49/b4ycpIglOu3HonJJQz5pUDH4WcgLAw7I7aSGMw98Z
         I5UP1qLn0rYA5BxAK2wmlMKdx2HBV/d96GyIEetW3FfuMDyuCzq5P4qIwKzKZxTEJzAY
         TT5cAKdee/+V/RpKQHe5HDlCAtFwjsMoS4t0JcNh0t4ZMxTW3wiea1k6YqL1c+DS8obV
         2jIw==
X-Gm-Message-State: AOJu0YwxQgh9QQspsasrY6E27HsP8bnRll6bG4FLTYa14wtMkPQjca8t
	jVXBSFKEZT3YMzseeYpBmBUHm9nhBp6MIUjffJ8crPOd99DZbvyHW6znNL4Q7AYZqnUkTxEWyJj
	EgKcgn87giMEh4VnWATVBd5InwY0eMCryWx4B/nSUqg==
X-Gm-Gg: AR+sD13V0tWZia3TYU0CWABXQ2dBDrupKSMmmk0qY7IC9h9DjtDQQRUylxXRQ9XR0u6
	bEyXikhBIM1G1wTrBjUBF7WQdpxBjGRrm1CdB2Cf5rLK0DPT0mR84RQlW/ieZIh9M8tR9llquzd
	qPFP3dC3RFeKX3uQ7MKQAG2JmQxtOP7II7KOrcL4MUZWrFB7U/TbWqAya4W2woQ2JyaRVZcKQ1c
	UwlnYgaMX8X2tZZkX8PCSIKejc9qESAVFPNgRq7bA8nzZGiWUWd8Pp1860Mc6axsxZXAN2R7Xa4
	N0AdnX8+7mPSCZJwZGn5IhSUhMdoK7gIu0SElXeUEiOdCJg=
X-Received: by 2002:a05:6808:6412:b0:496:233:3c3a with SMTP id
 5614622812f47-4ad5bb28d18mr3593013b6e.22.1785327119719; Wed, 29 Jul 2026
 05:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Pasha Boroffski <hex.dec.bin.oct@gmail.com>
Date: Wed, 29 Jul 2026 17:11:48 +0500
X-Gm-Features: AUfX_mxWBBAGVQ0pxTgfjqiWbRCzjOFWYAvTfkDlkiWuYQLzdOzacs6csKsN15Q
Message-ID: <CAHmU7GkfHNdA-sph9mBf-s+a=9m22KcGTq6r=78=qSf5BKBgag@mail.gmail.com>
Subject: Bug caused by upstream commit 6650527444dadc63d84aa939d14ecba4fadb2f69
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello.
I believe 6650527444dadc63d84aa939d14ecba4fadb2f69 (proc: protect
ptrace_may_access() with exec_update_lock (part 1)) causes a "kernel
bug".
My kernel is 6.12.98 #9 SMP PREEMPT_RT x86_64 merged with
6650527444dadc63d84aa939d14ecba4fadb2f69. PREEMPT_RT preemption does
not matter, PREEMPT/PREEMPT_DYNAMIC behaves the same.
To reproduce the bug I used 'find /proc/ | grep 123'. When scanning,
the kernel triggers an "Oops".

[  344.465851][ T3715] BUG: kernel NULL pointer dereference, address:
00000000000000f8
[  344.465862][ T3715] #PF: supervisor read access in kernel mode
[  344.465867][ T3715] #PF: error_code(0x0000) - not-present page
[  344.465871][ T3715] PGD 0 P4D 0
[  344.465879][ T3715] Oops: Oops: 0000 [#3] PREEMPT_RT SMP PTI
[  344.465888][ T3715] CPU: 0 UID: 0 PID: 3715 Comm: find Tainted: G
   D    O       6.12.98 #9
[  344.465899][ T3715] Tainted: [D]=DIE, [O]=OOT_MODULE
[  344.465901][ T3715] Hardware name: ADLINK Technology Inc.
nanoX-BT/To be filled by O.E.M., BIOS 17/04/2025
[  344.465905][ T3715] RIP: 0010:down_read_killable+0x9/0x40
[  344.465920][ T3715] Code: ff ff ff c3 cc cc cc cc 66 0f 1f 84 00 00
00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
0f 1f 44 00 00 <8b> 07 85 c0 79 10 8d 50 01 f0 0f b1 17 75 f3 31 c0 c3
cc cc cc cc
[  344.465926][ T3715] RSP: 0018:ffffb4f2c0937db0 EFLAGS: 00010202
[  344.465932][ T3715] RAX: 00000000000000f8 RBX: ffffb4f2c0937ee0
RCX: 0000561d401b989d
[  344.465937][ T3715] RDX: 0000000080000001 RSI: 0000000000000009
RDI: 00000000000000f8
[  344.465940][ T3715] RBP: ffffa242601b0dc0 R08: 00007ffffffff000
R09: 0000000000000004
[  344.465944][ T3715] R10: 0000000000000000 R11: 0000000000000001
R12: ffffffffa50c2df0
[  344.465948][ T3715] R13: ffffa2425c16a988 R14: ffffa2425b916400
R15: ffffb4f2c0937df0
[  344.465952][ T3715] FS:  00007fdb493a2780(0000)
GS:ffffa242b7400000(0000) knlGS:0000000000000000
[  344.465958][ T3715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  344.465962][ T3715] CR2: 00000000000000f8 CR3: 000000001bb06000
CR4: 00000000001006f0
[  344.465966][ T3715] Call Trace:
[  344.465971][ T3715]  <TASK>
[  344.465974][ T3715]  proc_map_files_readdir+0xc7/0x500
[  344.465986][ T3715]  ? _copy_to_user+0x36/0x50
[  344.465996][ T3715]  ? cp_new_stat+0x136/0x170
[  344.466008][ T3715]  ? __do_sys_newfstatat+0x50/0x80
[  344.466016][ T3715]  iterate_dir+0x99/0x160
[  344.466025][ T3715]  ? fdget_pos+0x9b/0x160
[  344.466034][ T3715]  __x64_sys_getdents64+0x8a/0x130
[  344.466042][ T3715]  ? __pfx_filldir64+0x10/0x10
[  344.466050][ T3715]  do_syscall_64+0x54/0x120
[  344.466058][ T3715]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  344.466066][ T3715] RIP: 0033:0x7fdb49555b4e
[  344.466073][ T3715] Code: 87 43 04 ff c8 7e 08 48 89 ef e8 48 59 fc
ff 5b 4c 89 e0 5d 41 5c c3 b8 ff ff ff 7f 48 39 c2 48 0f 47 d0 b8 d9
00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 10 48 8b 15 9b 92 0d 00 f7 d8 64
89 02 48 83
[  344.466077][ T3715] RSP: 002b:00007ffc5adeff48 EFLAGS: 00000293
ORIG_RAX: 00000000000000d9
[  344.466084][ T3715] RAX: ffffffffffffffda RBX: 0000561d401b9840
RCX: 00007fdb49555b4e
[  344.466088][ T3715] RDX: 0000000000008000 RSI: 0000561d401b9870
RDI: 0000000000000005
[  344.466091][ T3715] RBP: 0000000000000001 R08: 0000000000000001
R09: 0000000000000000
[  344.466095][ T3715] R10: 0000000001000000 R11: 0000000000000293
R12: 0000561d401b9844
[  344.466098][ T3715] R13: ffffffffffffff80 R14: 0000000000000000
R15: 0000561d401b9870
[  344.466104][ T3715]  </TASK>
[  344.466106][ T3715] Modules linked in: iptable_mangle iptable_nat
nf_nat nf_conntrack nf_defrag_ipv4 vfio_pci vfio_pci_core irqbypass
vfio igb i2c_algo_bit overlay btrfs libcrc32c xor lzo_compress
zlib_defla
te zstd_compress raid6_pq at24 regmap_i2c [last unloaded: axi_dev(O)]
[  344.466147][ T3715] CR2: 00000000000000f8
[  344.466176][ T3715] ---[ end trace 0000000000000000 ]---
[  344.512192][ T3715] RIP: 0010:down_read_killable+0x9/0x40
[  344.512211][ T3715] Code: ff ff ff c3 cc cc cc cc 66 0f 1f 84 00 00
00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa
0f 1f 44 00 00 <8b> 07 85 c0 79 10 8d 50 01 f0 0f b1 17 75 f3 31 c0 c3
cc cc cc cc
[  344.512217][ T3715] RSP: 0018:ffffb4f2c0c4fdb0 EFLAGS: 00010202
[  344.512224][ T3715] RAX: 00000000000000f8 RBX: ffffb4f2c0c4fee0
RCX: 00005602c548641d
[  344.512229][ T3715] RDX: 0000000080000001 RSI: 0000000000000009
RDI: 00000000000000f8
[  344.512232][ T3715] RBP: ffffa242601b0dc0 R08: 00007ffffffff000
R09: 0000000000000004
[  344.512236][ T3715] R10: 0000000000000000 R11: 0000000000000001
R12: ffffffffa50c2df0
[  344.512240][ T3715] R13: ffffa2425c16a988 R14: ffffa2425b8a1100
R15: ffffb4f2c0c4fdf0
[  344.512244][ T3715] FS:  00007fdb493a2780(0000)
GS:ffffa242b7400000(0000) knlGS:0000000000000000
[  344.512249][ T3715] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  344.512253][ T3715] CR2: 00000000000000f8 CR3: 000000001bb06000
CR4: 00000000001006f0


I think it is because
mm = mm_access(task, PTRACE_MODE_READ_FSCREDS);
is checked for IS_ERR(mm) only and not checked for NULL (IS_ERR_OR_NULL(mm))

Loaded drivers (lsmod | awk '{print $1}'):

iptable_mangle
iptable_nat
nf_nat
nf_conntrack
nf_defrag_ipv4
vfio_pci
vfio_pci_core
irqbypass
vfio
igb
i2c_algo_bit
overlay
btrfs
libcrc32c
xor
lzo_compress
zlib_deflate
zstd_compress
raid6_pq
at24
regmap_i2c

Best regards,
Pavel Borovskikh
