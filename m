Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C110F9
	for <regressions@lists.linux.dev>; Wed,  2 Jul 2025 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436726; cv=none; b=grgqIM12y74jS3T9Snyf3g3Wf7f+b+wRWE1+SRrY8tEe/j+SOaBlbInRRmrstSh/eiowa1T4D5FdWtjWWv63uiqEbq23xdl/LbQCymzOsNw368PiGAAAv0BXe1zxUZD5LP+XGyjFm4obZ3DxeE3Yr1xOrNihlnjCUgIQQSOmdf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436726; c=relaxed/simple;
	bh=4B3Yiyza0MsCbwQ2vUpwucGanxMQaIKTunigBl5uv2o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q9jMfJnB9g55rkL0lyD3KSvNPSdFBLRZlG7fkP/RNmnqj77zc1sxGV//FVQTnAkryjOxVIRJDzD7+1gR2bkAVAXQn2h8bQoGYZlkr97+TDwIH6Fa/5AKlwO347uns0l2jmFmMl8j6c3ybechu8d/kRougW4K3reijZGbRpe+gjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H3SISqrg; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H3SISqrg"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso6654231a91.3
        for <regressions@lists.linux.dev>; Tue, 01 Jul 2025 23:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751436724; x=1752041524; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lb5YxQe46bQxphBc6MuoFDKPPJCKWFXEePrLvBMePn4=;
        b=H3SISqrg5mbp/CbcKbDTv56m4VxSi8fe3zsNKSq0aq0nmFZOCFgtxlvHgtStIvhE7j
         VJtrS/MRs0Zsy9PVkQwavvpqeWVOSP0NFi5BMpUPFEopRAT8UbyQKjC+SYOupazC1h2q
         iHAhROKR2PPmp7N+LttHBvoVw74JjLzxSclh33yWLEl48jRvTKr8wRoWzkaH6u3IFn1K
         zyO/DFC3th82NUsrx/Q2wTD3v7mjJPK4uBUZjg7nQR12zmkgZS1bOnx9FsAv1mac4iay
         fV/x02QZwR5jRqYrDqW7r3Z4rDEfEtG9V5e2Rond81wytm8o2siGPn/cSdD5GBxjFWRT
         ZScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751436724; x=1752041524;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lb5YxQe46bQxphBc6MuoFDKPPJCKWFXEePrLvBMePn4=;
        b=Bc3FP0jpGfQ8VCiLu5qoZz1Qo6wBH4qjdzWslGFYwYEV3mdaxPtA/zMQHxvcMna17r
         b9uUOINR2buKgr6IkBYHnrIBMQ0e8m3vbpNVpBHmW67EjMRx3Q3lQezNISLiyT2KagGN
         Y6HSWEro4Zcu/DUvIguaHCgTDeMAcOlfB3sLyLM4Ygb69LNK/XCds9xBS4mVuUh9MOsc
         peHHU9iiY9cYnDnNXpv1x88AKdxbkay7AcEINU8G0H1n8CLomJFCdigfYuw1tvA3qKyT
         P53DA42BVoQdYAPXJcj7W9aehN5HwwrDpvkh/ugSaQQi8zHSvPhsmn7HOkNXPd9mQ1rR
         5EYg==
X-Forwarded-Encrypted: i=1; AJvYcCWT5G0BFMpKR3KgTNFzQZMT38u7oJMJOPJSoKBB4bOYN06hFnw9X7qqNppQLAeZ/apPyFs2amXIXFOAZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxALzH5abTTNeA5lEgdMjYQATw6leVu3WIvtu9V7iwB+s1V58Qy
	cSb0xA8QFODkAl0k7vQvSImf1z44XWX8wnwH1RwxOcfeYgWuas7X50fyzNgbEgwP4zu0LyDLUE7
	Xnp/fPP3sGh6/mvqnHRI5HOhQnigeBna0weOgeo7bXQ==
X-Gm-Gg: ASbGncukXSOzlxxo0hsN8Csh4CUelBGr0HBQNcylauHZDZDJqLprvazclqHJskTQFYf
	GXU35wkL66ro06mCke5DrPF8mCExEdVk68vnuoZKoWXoJro8ZgKso1wSZfGOEmW/2bNHkgQwBkZ
	pa40kwTTVFbGhU7vj6jGF20fMKJsS/wKh5llXayTbFJGD3om9u9AmBG8RLrFG4AgJo76/aojtU2
	S3K
X-Google-Smtp-Source: AGHT+IHX3JUg7ee48oZ+6QdweZGTrlVWpDVWHxoTFgK/+7VIbxx0s7gMnPv3DlHc+HwcPCfsDEckdYYZvu2Eo5z8yWU=
X-Received: by 2002:a17:90b:3e8a:b0:308:7270:d6ea with SMTP id
 98e67ed59e1d1-31a90c08754mr2480761a91.30.1751436724062; Tue, 01 Jul 2025
 23:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Jul 2025 11:41:51 +0530
X-Gm-Features: Ac12FXzksO9JByY72D4vD4KCUhmxfXeKeKtQv722paIMPONKl9_Wie1LK0cAkzg
Message-ID: <CA+G9fYtK67MNaNin6nv_vLhp4xRnsnSPBEsnQTOJ+V5F4yz4RA@mail.gmail.com>
Subject: next-20250701: qemu-x86_64: BUG unable to handle page fault for
 address __cpa_flush_tlb
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	linux-mm <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions While booting the next-20250701 Linux kernel on a
qemu-x86_64 virtual machine, a kernel panic is observed due to
a page fault in the __cpa_flush_tlb function.

Test environments:
- qemu-x86_64

Regression Analysis:
- New regression? Yes
- Reproducibility? I need more data (Testing is in progress)

Boot regression: Linux next-20250701 qemu-x86_64 BUG unable to handle
page fault for address __cpa_flush_tlb

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
<6>[    0.000000] Linux version 6.16.0-rc4-next-20250701
(tuxmake@tuxmake) (x86_64-linux-gnu-gcc (Debian 13.3.0-16) 13.3.0, GNU
ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC @1751364982
<6>[    0.000000] Command line: console=ttyS0,115200 rootwait
root=/dev/sda debug verbose console_msg_format=syslog
systemd.log_level=warning rw earlycon
<6>[    0.000000] x86/CPU: Model not found in latest microcode list
<6>[    0.000000] BIOS-provided physical RAM map:

...

<6>[    2.292682] EXT4-fs (sda): mounted filesystem
9c9bd7ea-a7a4-4c7c-bc54-7007f029c954 r/w with ordered data mode. Quota
mode: none.
<6>[    2.294012] VFS: Mounted root (ext4 filesystem) on device 8:0.
<6>[    2.296792] devtmpfs: mounted
<6>[    2.387406] Freeing unused kernel image (initmem) memory: 4092K
<6>[    2.389312] Write protecting the kernel read-only data: 32768k
<6>[    2.391640] Freeing unused kernel image (text/rodata gap) memory: 28K
<1>[    2.393647] BUG: unable to handle page fault for address: 000000000002aa97
<1>[    2.394089] #PF: supervisor read access in kernel mode
<1>[    2.395026] #PF: error_code(0x0000) - not-present page
<6>[    2.395623] PGD 0 P4D 0
<4>[    2.396063] Oops: Oops: 0000 [#1] SMP PTI
<4>[    2.396998] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted
6.16.0-rc4-next-20250701 #1 PREEMPT(voluntary)
<4>[    2.397726] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
<4>[ 2.398454] RIP: 0010:__cpa_flush_tlb
(arch/x86/mm/pat/set_memory.c:320 arch/x86/mm/pat/set_memory.c:408)
<4>[ 2.399219] Code: 1e fa 0f 1f 44 00 00 55 48 89 e5 41 54 53 48 83
7f 20 00 48 89 fb 74 5b 45 31 e4 31 ff eb 27 48 8b 13 a8 02 75 47 48
c1 e7 0c <48> 03 3a 48 01 ff 48 d1 ff e8 26 f4 ff ff 41 8d 7c 24 01 49
89 fc
All code
========
   0: 1e                    (bad)
   1: fa                    cli
   2: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
   7: 55                    push   %rbp
   8: 48 89 e5              mov    %rsp,%rbp
   b: 41 54                push   %r12
   d: 53                    push   %rbx
   e: 48 83 7f 20 00        cmpq   $0x0,0x20(%rdi)
  13: 48 89 fb              mov    %rdi,%rbx
  16: 74 5b                je     0x73
  18: 45 31 e4              xor    %r12d,%r12d
  1b: 31 ff                xor    %edi,%edi
  1d: eb 27                jmp    0x46
  1f: 48 8b 13              mov    (%rbx),%rdx
  22: a8 02                test   $0x2,%al
  24: 75 47                jne    0x6d
  26: 48 c1 e7 0c          shl    $0xc,%rdi
  2a:* 48 03 3a              add    (%rdx),%rdi <-- trapping instruction
  2d: 48 01 ff              add    %rdi,%rdi
  30: 48 d1 ff              sar    $1,%rdi
  33: e8 26 f4 ff ff        call   0xfffffffffffff45e
  38: 41 8d 7c 24 01        lea    0x1(%r12),%edi
  3d: 49 89 fc              mov    %rdi,%r12

Code starting with the faulting instruction
===========================================
   0: 48 03 3a              add    (%rdx),%rdi
   3: 48 01 ff              add    %rdi,%rdi
   6: 48 d1 ff              sar    $1,%rdi
   9: e8 26 f4 ff ff        call   0xfffffffffffff434
   e: 41 8d 7c 24 01        lea    0x1(%r12),%edi
  13: 49 89 fc              mov    %rdi,%r12
<4>[    2.399698] RSP: 0000:ffffb316c00e0f78 EFLAGS: 00010046
<4>[    2.400494] RAX: 0000000000000169 RBX: ffffb316c0013e30 RCX:
ffffb316c0013e30
<4>[    2.401577] RDX: 000000000002aa97 RSI: 000000008b09dcbb RDI:
0000000000000000
<4>[    2.401910] RBP: ffffb316c00e0f88 R08: 000000000000546c R09:
0000000000000000
<4>[    2.402961] R10: 0000000000000000 R11: ffffb316c00e0ff8 R12:
0000000000000000
<4>[    2.403326] R13: ffff8e357bd2daa0 R14: ffff8e3500aaaeb8 R15:
ffffffff95148f50
<4>[    2.403927] FS:  0000000000000000(0000)
GS:ffff8e35e47bc000(0000) knlGS:0000000000000000
<4>[    2.404471] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    2.404795] CR2: 000000000002aa97 CR3: 000000002ac48000 CR4:
00000000000006f0
<4>[    2.405623] Call Trace:
<4>[    2.406562]  <IRQ>
<4>[ 2.407678] __flush_smp_call_function_queue
(arch/x86/include/asm/jump_label.h:36 include/trace/events/csd.h:64
kernel/smp.c:135 kernel/smp.c:540)
<4>[ 2.408101] generic_smp_call_function_single_interrupt (kernel/smp.c:458)
<4>[ 2.408234] __sysvec_call_function_single
(arch/x86/include/asm/jump_label.h:36
arch/x86/include/asm/trace/irq_vectors.h:98 arch/x86/kernel/smp.c:272)
<4>[ 2.409077] sysvec_call_function_single (arch/x86/kernel/smp.c:266
(discriminator 35) arch/x86/kernel/smp.c:266 (discriminator 35))
<4>[    2.409287]  </IRQ>
<4>[    2.409408]  <TASK>
<4>[ 2.409584] asm_sysvec_call_function_single
(arch/x86/include/asm/idtentry.h:709)
<4>[ 2.410108] RIP: 0010:pv_native_safe_halt (arch/x86/kernel/paravirt.c:82)
<4>[ 2.410323] Code: 1f 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90
90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 85 ef 03
00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90
90 90
All code
========
   0: 1f                    (bad)
   1: 84 00                test   %al,(%rax)
   3: 00 00                add    %al,(%rax)
   5: 00 00                add    %al,(%rax)
   7: 0f 1f 40 00          nopl   0x0(%rax)
   b: 90                    nop
   c: 90                    nop
   d: 90                    nop
   e: 90                    nop
   f: 90                    nop
  10: 90                    nop
  11: 90                    nop
  12: 90                    nop
  13: 90                    nop
  14: 90                    nop
  15: 90                    nop
  16: 90                    nop
  17: 90                    nop
  18: 90                    nop
  19: 90                    nop
  1a: 90                    nop
  1b: f3 0f 1e fa          endbr64
  1f: eb 07                jmp    0x28
  21: 0f 00 2d 85 ef 03 00 verw   0x3ef85(%rip)        # 0x3efad
  28: fb                    sti
  29: f4                    hlt
  2a:* c3                    ret <-- trapping instruction
  2b: cc                    int3
  2c: cc                    int3
  2d: cc                    int3
  2e: cc                    int3
  2f: 66 2e 0f 1f 84 00 00 cs nopw 0x0(%rax,%rax,1)
  36: 00 00 00
  39: 66 90                xchg   %ax,%ax
  3b: 90                    nop
  3c: 90                    nop
  3d: 90                    nop
  3e: 90                    nop
  3f: 90                    nop

Code starting with the faulting instruction
===========================================
   0: c3                    ret
   1: cc                    int3
   2: cc                    int3
   3: cc                    int3
   4: cc                    int3
   5: 66 2e 0f 1f 84 00 00 cs nopw 0x0(%rax,%rax,1)
   c: 00 00 00
   f: 66 90                xchg   %ax,%ax
  11: 90                    nop
  12: 90                    nop
  13: 90                    nop
  14: 90                    nop
  15: 90                    nop
<4>[    2.411151] RSP: 0000:ffffb316c00abea0 EFLAGS: 00010206
<4>[    2.411522] RAX: ffff8e35e47bc000 RBX: ffff8e3500372e80 RCX:
0000000000000001
<4>[    2.411691] RDX: ffffffff9523177d RSI: ffffffff96b9a3df RDI:
0000000000005464
<4>[    2.412619] RBP: ffffb316c00abea8 R08: 0000000000005464 R09:
0000000000000001
<4>[    2.412810] R10: 0000004d8989ef00 R11: 000000000548e0b3 R12:
0000000000000001
<4>[    2.413067] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
<4>[ 2.413403] ? do_idle (kernel/sched/idle.c:191 kernel/sched/idle.c:330)
<4>[ 2.413737] ? default_idle (arch/x86/include/asm/paravirt.h:107
arch/x86/kernel/process.c:757)
<4>[ 2.413926] arch_cpu_idle (arch/x86/kernel/process.c:795)
<4>[ 2.414072] default_idle_call (include/linux/cpuidle.h:144
kernel/sched/idle.c:123)
<4>[ 2.414608] do_idle (kernel/sched/idle.c:191 kernel/sched/idle.c:330)
<4>[ 2.414744] cpu_startup_entry (kernel/sched/idle.c:427)
<4>[ 2.414961] start_secondary (arch/x86/kernel/smpboot.c:203
(discriminator 10) arch/x86/kernel/smpboot.c:283 (discriminator 10))
<4>[ 2.415531] common_startup_64 (arch/x86/kernel/head_64.S:419)
<4>[    2.415720]  </TASK>
<4>[    2.415898] Modules linked in:
<4>[    2.416303] CR2: 000000000002aa97
<4>[    2.417490] ---[ end trace 0000000000000000 ]---
<4>[ 2.417940] RIP: 0010:__cpa_flush_tlb
(arch/x86/mm/pat/set_memory.c:320 arch/x86/mm/pat/set_memory.c:408)
<4>[ 2.418250] Code: 1e fa 0f 1f 44 00 00 55 48 89 e5 41 54 53 48 83
7f 20 00 48 89 fb 74 5b 45 31 e4 31 ff eb 27 48 8b 13 a8 02 75 47 48
c1 e7 0c <48> 03 3a 48 01 ff 48 d1 ff e8 26 f4 ff ff 41 8d 7c 24 01 49
89 fc
All code
========
   0: 1e                    (bad)
   1: fa                    cli
   2: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
   7: 55                    push   %rbp
   8: 48 89 e5              mov    %rsp,%rbp
   b: 41 54                push   %r12
   d: 53                    push   %rbx
   e: 48 83 7f 20 00        cmpq   $0x0,0x20(%rdi)
  13: 48 89 fb              mov    %rdi,%rbx
  16: 74 5b                je     0x73
  18: 45 31 e4              xor    %r12d,%r12d
  1b: 31 ff                xor    %edi,%edi
  1d: eb 27                jmp    0x46
  1f: 48 8b 13              mov    (%rbx),%rdx
  22: a8 02                test   $0x2,%al
  24: 75 47                jne    0x6d
  26: 48 c1 e7 0c          shl    $0xc,%rdi
  2a:* 48 03 3a              add    (%rdx),%rdi <-- trapping instruction
  2d: 48 01 ff              add    %rdi,%rdi
  30: 48 d1 ff              sar    $1,%rdi
  33: e8 26 f4 ff ff        call   0xfffffffffffff45e
  38: 41 8d 7c 24 01        lea    0x1(%r12),%edi
  3d: 49 89 fc              mov    %rdi,%r12

Code starting with the faulting instruction
===========================================
   0: 48 03 3a              add    (%rdx),%rdi
   3: 48 01 ff              add    %rdi,%rdi
   6: 48 d1 ff              sar    $1,%rdi
   9: e8 26 f4 ff ff        call   0xfffffffffffff434
   e: 41 8d 7c 24 01        lea    0x1(%r12),%edi
  13: 49 89 fc              mov    %rdi,%r12
<4>[    2.418856] RSP: 0000:ffffb316c00e0f78 EFLAGS: 00010046
<4>[    2.419172] RAX: 0000000000000169 RBX: ffffb316c0013e30 RCX:
ffffb316c0013e30
<4>[    2.419363] RDX: 000000000002aa97 RSI: 000000008b09dcbb RDI:
0000000000000000
<4>[    2.419552] RBP: ffffb316c00e0f88 R08: 000000000000546c R09:
0000000000000000
<4>[    2.419864] R10: 0000000000000000 R11: ffffb316c00e0ff8 R12:
0000000000000000
<4>[    2.420309] R13: ffff8e357bd2daa0 R14: ffff8e3500aaaeb8 R15:
ffffffff95148f50
<4>[    2.420816] FS:  0000000000000000(0000)
GS:ffff8e35e47bc000(0000) knlGS:0000000000000000
<4>[    2.421298] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    2.421675] CR2: 000000000002aa97 CR3: 000000002ac48000 CR4:
00000000000006f0
<0>[    2.422354] Kernel panic - not syncing: Fatal exception in interrupt
<0>[    2.425278] Kernel Offset: 0x13e00000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
<0>[    2.426205] ---[ end Kernel panic - not syncing: Fatal exception
in interrupt ]---

## Source
* Kernel version: 6.16.0-rc4-next-20250701
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
* Git describe: 6.16.0-rc4-next-20250701
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: gcc-13-lkftconfig-no-kselftest-frag

## Build arm64
* Test log: https://qa-reports.linaro.org/api/testruns/28972335/log_file/
* Test LAVA log 1:
https://lkft.validation.linaro.org/scheduler/job/8336872#L5891
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250701/log-parser-boot/panic-multiline-kernel-panic-not-syncing-fatal-exception-in-interrupt/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2zGk2ZJWqj1Ukob9bJAF1Jn6uK8/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2zGk2ZJWqj1Ukob9bJAF1Jn6uK8/config

--
Linaro LKFT
https://lkft.linaro.org
