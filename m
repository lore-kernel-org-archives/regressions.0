Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEF22629C
	for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741703765; cv=none; b=nm5zA37NdFLL9As0k9/nfKLxIU8x8YN+B8cTO59To48k4tEfLyLj3YTZE9fqy/lrVFkKRXn0b4jQJtoyOOhDGjrBfd58MLlkmdlmzwiOFXkj9WmJQatMAlAXOt75tMI0lHTRb9B1oHyTtu2VdLvyzgGngTWRjbqBxM247BkTZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741703765; c=relaxed/simple;
	bh=UdzInT3jXTSgmOIYU/cGlkC2vkNsUDAxmc0rJDK5/fs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VSkaQNpnA+dDZJsg0y7EbNz4wo00xodHj/z2H7lmk910ardH+r8R4uwf139oP/kwY0BMKonqvQf8LaMZ58YAmujRQGTyCdiW9BstAk53MY7mANsz2ma3reLRhXIFIYHb4ow2+ngzWJ9UB1vpWu2e5uEzsUXuCyAPYoKOth1kDuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUc7Rrr0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUc7Rrr0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso9333442a91.3
        for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741703763; x=1742308563; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EH38/2lqVG6h3gXCDptMWtX+nveNInevf0AzMCUIWFM=;
        b=YUc7Rrr0YQp3iMzEQ857BDBAxWbtVjhgma+uNbu5oh6HXRD9aJwCZrec4d8M2nn70i
         +v+bgDl/rsNpikhqt4L/NBgB43rkCHsKOGTFU8dKUkDfO/mK06DOIoiOfUFZd1MICGZQ
         qsslb9RMSDneHpZuurDS7GaXMJAdcthzvNS91Bq6y7YXmMRe49+yRD9pqY/2Z/6liwKz
         MlyndnKC/30Q0M97jHPUc0IiRivQJkrz6i9lvr4ZA1i6p33d3AwGKp2Qe2hyq5ca1BIS
         Sc9GV/t7b1am1RuEFw4fdI5lipWWYCD7FF+6Tx/gxbS5axXnwbGcuAlOcLMntBfOOIB2
         JpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741703763; x=1742308563;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH38/2lqVG6h3gXCDptMWtX+nveNInevf0AzMCUIWFM=;
        b=w4vRg9j3XCtEwA+3tI/qiiqYeJdiKxwRGzbVgOMRHMv0cMvgvgdthT6wFIm4BrFK7d
         YcRCs860VUQ8bFEQlFQ/lK8u0hrW3hRQk8uo8L8+uGJTdN0lPcwjJI9qEPAcbgK4Pp6d
         pzF5bkvTVcK2EmGcq5+Ui+DoOLe94b+7GwYJ6ZSjI6oLQmZMfiBvyDJk11HyNS3MSi6z
         hRl2HdtAwdseI+ecstXAumxJShBx8KW8lk4CwX1fmgLHW59h8le8Xa9xJ7uXyExZ540s
         MkRSMRf+FPs7dnhvMwrh/oe1bi2rGxtgjizQUiHJjhxh7ZEs1aij8YC9AK2PyysLVxY8
         S5kg==
X-Gm-Message-State: AOJu0YxTqavesi/cs4iKywyNAPkUektX0vznMPWTTaf5xgcjNDiq1kCg
	Puc4uec3L2JNVjk7vQ4bVk/tPFN/ddvU2NwWS7TVmn6EjDmX21JBaKnF+IXxbjX5my7uQ635Q4n
	84MaH+aKT44+Rm93PJQSZRi5T6KH59Ud9
X-Gm-Gg: ASbGnctpwsXcNpsdc0KfAuReInXNHZdD0jbeYb5DFbPwIQQNPpnBdUGhUc0LJBodJoO
	yjmRdrCXuBiZQswAZrrxKGTJx3S5qFmEoNcRcuBE5iA18RGX+TUDC/EWrR0CBAdF107vvsTT0VP
	Piy2O+GYaROxd3hroCiUv6ysjt
X-Google-Smtp-Source: AGHT+IET2Tu8ZG8isgKtFHGB9PHP9LfuUfAEEEPvc3txH1TPAWHFiZFN/lHU2Avh6EGiMkx5iWxskamJUEywxM/lF2w=
X-Received: by 2002:a17:90a:e7c2:b0:2ee:c91a:ad05 with SMTP id
 98e67ed59e1d1-2ff7ce52479mr24851838a91.3.1741703762809; Tue, 11 Mar 2025
 07:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Tue, 11 Mar 2025 23:35:51 +0900
X-Gm-Features: AQ5f1Jp6ZnQKYR4DUpZDzpqd74ENfnFD7XTv-5K-D8vuziDcuiIdH6LTR2EyCdc
Message-ID: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
Subject: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
To: Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>, 
	aruna.ramakrishna@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

When the kernel is compiled with CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS,
it no longer boots on Virtualization.framework [1] (Apple's equivalent of QEMU)
on Intel Macs, since the following commit:

    70044df250d0  x86/pkeys: Update PKRU to enable all pkeys before XSAVE

Tested with macOS 13.5.1, running on MacBook Pro 2020 with
Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz.

The issue doesn't seem to happen with QEMU + Hypervisor.framework (Apple's KVM).

This issue was originally reported by Blake Garner in Lima [2]'s Slack channel.

[1] https://developer.apple.com/documentation/virtualization/running-linux-in-a-virtual-machine
[2] https://lima-vm.io/

---
#regzbot link: https://github.com/lima-vm/lima/issues/3334
#regzbot introduced: 70044df250d022572e26cd301bddf75eac1fe50e
#regzbot title: x86/pkeys: Update PKRU to enable all pkeys before XSAVE
---

A boot log with the regression commit, with defconfig:

$ LinuxVirtualMachine bzImage-g70044df250d0 initrd
(...)
[    0.477064] Run /init as init process
[    0.478585] ------------[ cut here ]------------
[    0.478747] WARNING: CPU: 0 PID: 1 at
arch/x86/kernel/fpu/xstate.c:1003 get_xsave_addr_user+0x28/0x40
[    0.478893] Modules linked in:
[    0.478999] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted
6.11.0-rc1-00007-g70044df250d0 #15
[    0.479148] RIP: 0010:get_xsave_addr_user+0x28/0x40
[    0.479454] Code: 90 90 66 0f 1f 00 48 63 ce ba 01 00 00 00 48 d3
e2 48 23 15 12 36 7e 01 74 0f 8b 04 8d 00 55 22 a8 48 01 f8 c3 cc cc
cc cc 90 <0f> 0b 90 31 c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00
00 0f
[    0.479699] RSP: 0018:ffff95af4000fd80 EFLAGS: 00010246
[    0.479983] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000009
[    0.480137] RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffe7b10bf80
[    0.480301] RBP: 00007ffe7b10bf80 R08: ffff95af4000fe90 R09: 0000000000000000
[    0.480431] R10: 0000000000000001 R11: 0000000000000010 R12: ffff930081198c40
[    0.480820] R13: 00007ffe7b10bf80 R14: ffff930081198c00 R15: ffff930081198000
[    0.481112] FS:  00007ff310710740(0000) GS:ffff9300fdc00000(0000)
knlGS:0000000000000000
[    0.481261] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.481415] CR2: 00007ffe7b10bf80 CR3: 00000000011f0004 CR4: 0000000000770ef0
[    0.481552] PKRU: 55555554
[    0.481660] Call Trace:
[    0.481726]  <TASK>
[    0.481798]  ? get_xsave_addr_user+0x28/0x40
[    0.481923]  ? __warn.cold+0x8e/0xea
[    0.482122]  ? get_xsave_addr_user+0x28/0x40
[    0.482212]  ? report_bug+0xff/0x140
[    0.482316]  ? handle_bug+0x3b/0x70
[    0.482408]  ? exc_invalid_op+0x17/0x70
[    0.482540]  ? asm_exc_invalid_op+0x1a/0x20
[    0.482609]  ? get_xsave_addr_user+0x28/0x40
[    0.482732]  copy_fpstate_to_sigframe+0x1be/0x380
[    0.482801]  ? __put_user_8+0x11/0x20
[    0.482869]  get_sigframe+0xf1/0x280
[    0.482957]  x64_setup_rt_frame+0x67/0x2c0
[    0.483057]  arch_do_signal_or_restart+0x1b3/0x240
[    0.483140]  syscall_exit_to_user_mode+0xb0/0x130
[    0.483215]  do_syscall_64+0xab/0x1a0
[    0.483270]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[    0.483343] RIP: 0033:0x7ff3107b2046
[    0.483405] Code: 00 00 48 8b 15 b3 1d 17 00 64 89 02 48 c7 c2 ff
ff ff ff 48 8b 5d f8 c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48 8b 45
10 0f 05 <48> 63 d0 3d 00 f0 ff ff 77 10 48 8b 5d f8 48 89 d0 c9 c3 0f
1f 80
[    0.483666] RSP: 002b:00007ffe7b10cab0 EFLAGS: 00000202 ORIG_RAX:
000000000000003d
[    0.483774] RAX: 0000000000000035 RBX: 00007ff310710740 RCX: 00007ff3107b2046
[    0.483876] RDX: 0000000000000000 RSI: 00007ffe7b10cb0c RDI: ffffffffffffffff
[    0.483976] RBP: 00007ffe7b10cac0 R08: 0000000000000000 R09: 0000000000000000
[    0.484078] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe7b10cb10
[    0.484178] R13: 00005561f9af12a0 R14: 00005561f9af2600 R15: 0000000000000001
[    0.484280]  </TASK>
[    0.484318] ---[ end trace 0000000000000000 ]---

(kernel hangs here)
