Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208F2222B1
	for <regressions@lists.linux.dev>; Mon, 17 Feb 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739804466; cv=none; b=XRCjvesKpOJ3IE7Ga+CeF27p4e6H+YtCAFLyZoV2MqdeD9NVbo7JWSrjVQIK9ixBzClryTyMvSJ0MzhcsnPXHJtTELgu/zJjE8vkLg3Wflm9+K+vaYg67E+/D98ZSYdYPRwsaOAbA0vXMUWEVjXJgPgRDC4Sn3e6ppmaxRPOmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739804466; c=relaxed/simple;
	bh=v0syhUisvAU7Oa8T+ISy9staxgnxkUb6TZxfeldXRs0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rkpkHf3SU1fvmTKzm0WN+F+0VouV1HZ8IITTo1FK/yDFoIHZCCUR9YZkjBqxOpdl9RfY1yrPT5yEcqunTBOK28VemwU/MuBriFV9IdnWt8xCCDqWirHZBhTS9xnUiz9EvIEcd+D9SjcOCH79VtyvXBwjCctJVmW3o/zBP4HRAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=monogon.tech; spf=pass smtp.mailfrom=monogon.tech; dkim=pass (2048-bit key) header.d=monogon-tech.20230601.gappssmtp.com header.i=@monogon-tech.20230601.gappssmtp.com header.b=zI4adkXe; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=monogon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monogon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monogon-tech.20230601.gappssmtp.com header.i=@monogon-tech.20230601.gappssmtp.com header.b="zI4adkXe"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52099627b5aso1753838e0c.1
        for <regressions@lists.linux.dev>; Mon, 17 Feb 2025 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monogon-tech.20230601.gappssmtp.com; s=20230601; t=1739804461; x=1740409261; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j3gU+D/qAy5HGSN9/l2oRiEXdyDDnoxzYPxHRlwqlpA=;
        b=zI4adkXeMACXerXs+VJRb3FJyT8H0pUgmXIezkBvkfSJbGkxpoXmoy7TSt8TQsXAsX
         w2Wd85uwf4a5tLu0YyMFGhIjD0TUCRgfJ0VD0UDJZR/RZjL9IBPmNAEVhTD0d6oxZQh8
         EcgaU+L800rkojB4pwkIqmgtRV85syCSDFU5Px6IYxVQ3rbMPUhNFARCbSiBCGch/cuw
         h8lrvPYRogXKdKBa22GoBlT8Ano+DnVFTsb9v75/MrByQ9jzd/9QZOfr9dUbQe64wJ1e
         DxwMRtrT6ZJC0C/WB9RctBe1tMfZ1/xgUcCVnmrJwWdA7RYyes8zIGHnYBqB8mhvR5aY
         JA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804461; x=1740409261;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3gU+D/qAy5HGSN9/l2oRiEXdyDDnoxzYPxHRlwqlpA=;
        b=XJUt89TCae5z+RtjL4igSK/sQJe6FS1yxAUj0ADMu96oNSYBRUbX6D6q4bcozwX/nL
         7JcF6IcsCjUzV0kxDSaaa81Ye2KCbliPzwn8FLil/TjU/O8UV7FvK2IoeJaP2mBKd/Tu
         vnDyf1keGruKlvu82sQ723+Fl3t176Pxigv3ggKZbybchVnVIw9DcC6WKooIrV0owhGH
         0NiSW0aP1Ww8Wxe9Df04G0Tfwt9H7ON527uX31f4YXRApoT+YdjYytS/7iFy2j0hQpKF
         8GAQce/jf/WfKEuoZGin7O9s35zYnkKGEmQN0cwFa/Icjiw6upzbAIIMLREXw1N6BO8m
         domQ==
X-Gm-Message-State: AOJu0Yy6AsHqa2DafRqXbakvdATrrW2d6OrIdmAh/RvGo2UJNkDoFiLA
	UuCtYeOw5sw/Hv2zjkb3DsHi06lbRg/G3dnMJBKIwaDhfMUv8kycIKCWLmOR9DAZZpfJVCjc+FR
	oLR32qwnII4EGaORLvyfyTK02fpTgOfosW/aazlkeEhjl6GWSjZY=
X-Gm-Gg: ASbGncu2cAr7wfp83UYVWSz5HPS6mfaoWkXdSFu7wgJYEzlDjRV+EsftW5ScnMVzDSr
	2EaopE20/dUW6uMvKYUZVp43vVezLh8nTOn+SmYmfUsTrGapjvH+41fdm5dH/KSn91TufnDryFA
	5yrXFgNqkN58AlQBxqjzA1H2Cp
X-Google-Smtp-Source: AGHT+IGcTVR5XTXIFAF5CCSUy0X9pqJMQjkg3fenHHQTGFlfsRmoicuoSjjghnYBwHL8hqrelrEsfZAnA3oML7RdbcA=
X-Received: by 2002:a05:6122:500f:b0:520:9883:29c2 with SMTP id
 71dfb90a1353d-52098832b01mr4863844e0c.6.1739804460757; Mon, 17 Feb 2025
 07:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lorenz Brun <lorenz@monogon.tech>
Date: Mon, 17 Feb 2025 16:00:50 +0100
X-Gm-Features: AWEUYZkNkHA_ofrymtYNmXUnXXejPvu0_AbYgiRmeM4K00KutCiKIxDyicxYiHQ
Message-ID: <CAJMi0nTHX0inFxme=xnJf23c8=w0bAf7LfiT=YNpmU-zVnUR+Q@mail.gmail.com>
Subject: [REGRESSION] xfs kernel panic
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Linux 6.12.14 (released today) contains a regression for XFS, causing
a kernel panic after just a few seconds of working with a
freshly-created (xfsprogs 6.9) XFS filesystem. I have not yet bisected
this because I wanted to get this report out ASAP but I'm going to do
that now. There are multiple associated stack traces, but all of them
have xfs_buf_offset as the faulting function.

Example backtrace:
[   31.745932] BUG: kernel NULL pointer dereference, address: 0000000000000098
[   31.746590] #PF: supervisor read access in kernel mode
[   31.747072] #PF: error_code(0x0000) - not-present page
[   31.747537] PGD 5bee067 P4D 5bee067 PUD 5bef067 PMD 0
[   31.748016] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[   31.748459] CPU: 0 UID: 0 PID: 116 Comm: xfsaild/vda4 Not tainted
6.12.14-metropolis #1 9b2470be3d7713b818a3236e4a2804dd9cbef735
[   31.749490] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 0.0.0 02/06/2015
[   31.750340] RIP: 0010:xfs_buf_offset+0x9/0x50
[   31.750823] Code: 08 5b e9 8a 2c c4 00 66 2e 0f 1f 84 00 00 00 00
00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f
44 00 00 <48> 8b 87 98 00 00 00 48 85 c0 75 2e 48 8b 87 00 01 00 00 48
89 f2
[   31.752775] RSP: 0018:ffffbf50c07abdb8 EFLAGS: 00010246
[   31.753343] RAX: 0000000000000002 RBX: ffff9c0985817d58 RCX: 0000000000000016
[   31.754103] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   31.754734] RBP: 0000000000000000 R08: ffff9c09fb704000 R09: 00000000e0be9fc4
[   31.755396] R10: 0000000000000000 R11: ffff9c0985827df8 R12: ffff9c09fb57ff58
[   31.756078] R13: ffff9c0985817eb0 R14: ffff9c09fb704000 R15: ffff9c0985817f00
[   31.756764] FS:  0000000000000000(0000) GS:ffff9c09fc000000(0000)
knlGS:0000000000000000
[   31.757529] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   31.758041] CR2: 0000000000000098 CR3: 0000000005b70000 CR4: 0000000000350ef0
[   31.758696] Call Trace:
[   31.758940]  <TASK>
[   31.759172]  ? __die+0x56/0x97
[   31.759473]  ? page_fault_oops+0x15c/0x2d0
[   31.759853]  ? exc_page_fault+0x4c5/0x790
[   31.760237]  ? asm_exc_page_fault+0x26/0x30
[   31.760637]  ? xfs_buf_offset+0x9/0x50
[   31.761002]  ? srso_return_thunk+0x5/0x5f
[   31.761409]  xfs_qm_dqflush+0xd0/0x350
[   31.761799]  xfs_qm_dquot_logitem_push+0xe9/0x140
[   31.762253]  xfsaild+0x347/0xa10
[   31.762567]  ? srso_return_thunk+0x5/0x5f
[   31.762952]  ? srso_return_thunk+0x5/0x5f
[   31.763325]  ? __pfx_xfsaild+0x10/0x10
[   31.763665]  kthread+0xd2/0x100
[   31.763985]  ? __pfx_kthread+0x10/0x10
[   31.764342]  ret_from_fork+0x34/0x50
[   31.764675]  ? __pfx_kthread+0x10/0x10
[   31.765029]  ret_from_fork_asm+0x1a/0x30
[   31.765408]  </TASK>
[   31.765618] Modules linked in: kvm_amd
[   31.765978] CR2: 0000000000000098
[   31.766297] ---[ end trace 0000000000000000 ]---
[   32.371004] RIP: 0010:xfs_buf_offset+0x9/0x50
[   32.371453] Code: 08 5b e9 8a 2c c4 00 66 2e 0f 1f 84 00 00 00 00
00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00 0f 1f
44 00 00 <48> 8b 87 98 00 00 00 48 85 c0 75 2e 48 8b 87 00 01 00 00 48
89 f2
[   32.373133] RSP: 0018:ffffbf50c07abdb8 EFLAGS: 00010246
[   32.373611] RAX: 0000000000000002 RBX: ffff9c0985817d58 RCX: 0000000000000016
[   32.374275] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[   32.374921] RBP: 0000000000000000 R08: ffff9c09fb704000 R09: 00000000e0be9fc4
[   32.375720] R10: 0000000000000000 R11: ffff9c0985827df8 R12: ffff9c09fb57ff58
[   32.376376] R13: ffff9c0985817eb0 R14: ffff9c09fb704000 R15: ffff9c0985817f00
[   32.377027] FS:  0000000000000000(0000) GS:ffff9c09fc000000(0000)
knlGS:0000000000000000
[   32.377761] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   32.378292] CR2: 0000000000000098 CR3: 0000000005b70000 CR4: 0000000000350ef0
[   32.378940] Kernel panic - not syncing: Fatal exception
[   32.379492] Kernel Offset: 0x2a600000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)

#regzbot introduced: v6.12.13..v6.12.14

Regards,
Lorenz
