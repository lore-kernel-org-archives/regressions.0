Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808325BEE8
	for <regressions@lists.linux.dev>; Wed,  2 Jul 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453854; cv=none; b=bNU68Qvy/ZJbJz3INPzzzdmL31xbjGRDQIo/lJSZmB7e29XqRJ1PCTknIghqzB/uLfY10F+Zq5CFr48sfE7sIkCnkt2LNM0b14Xa14W5/25IlV0DIeZ6G9HmrRg95v6TQrAL5/unlI/mUCVNiycAiX+sUJC2FoVVrMXD9nsvkk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453854; c=relaxed/simple;
	bh=iLykSB8WhQVt1d5MM7TIuy3tvw4z5JB3sKShyS3DGrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKxwnBdpaYsqCvf5d3m6Tbv2GZLZbUmbHEZD/lMqzZGvgWP3JEMNbIAlVVua8TnA+bYXOrRv4YLWzgWVGu2qt7z/f/O9xqezOvdhtKptviKApAQy/gzE7J4WzCFc6jiP3wXYi1GI3ZHXoKKAGQw8b9fvaH/hCfLEel85b2eegUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTbm9xyN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTbm9xyN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313a001d781so3187309a91.3
        for <regressions@lists.linux.dev>; Wed, 02 Jul 2025 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751453851; x=1752058651; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b6PKBJHM32+U13kTLbm72/9WxBHU1Fr1z8urGBn93NA=;
        b=JTbm9xyN6msYVDtnxtvH0//RMEBgJyhoQkBVEPyciARjc8xYiLJ3EgxodCeZrWHL+U
         9Xzg2EKc/C3fj/pt3Aecj1Ids452P1JxFao2Kht/CC47QAKlrL+zq6Fhws5OLBcfb8uU
         ukSCF+4XA8o2zRGC6mvDLYL8fPrX6yKoRzIc20uW55dzpkGgj/ZLcQhL8fcd+sRwPD/r
         bIir5cHD0JO7mGkiJkzFGFbeKlVjYc8EoSJhiOSg3JSyAF6Rq1bU56yQ9JQOWtsrrRTQ
         t7hfnq7ypVnioAv4l/T8pMgrsHWxgS1o9dUCox8IVwbKV6OyW9U4R5DpIWhCGZHj/YF5
         Qb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453851; x=1752058651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6PKBJHM32+U13kTLbm72/9WxBHU1Fr1z8urGBn93NA=;
        b=JCq4T/C0EMV6tHH4UMTfprv03WErRekElThreDS9jzC/CFuJcTiLjqx1U6KUtYy8Pm
         AJb/ZwoyscWgy/n8/dkHjpUGkyjDBNU2hMqrYVfY7QFHeRAug8jP9qqWi8Pf3nAJh5Dv
         02BrXR0cpcx4RkjGVkKJGxBHjM+KrPwwC1EJfr8L11zXEiLH8lSRikR6YbzAQQTYLEMD
         U4slvEQ3Ork/sSxSU8Fz6AfNgL00t9OaI8t175a/G0PUDa2vMKukhksOw6n7KhRFlq+B
         tXWY+AznVDm7ILiUTFhppdiE/wQn+O8gU4qLK3WqKB3B+rgcsIT5VQra2NnVDLbIFeEM
         IvwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTvmAHEG6dQZv7p6cj5H+CMDddk8qT0/edpc8IS8qdON3KQA6MsDu/DoIFtWJXl0ucsUZKPwKx4fGazA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZuWVFnHZf7DfxDJlq95D5e46VC2zwf2fLNidb5e6ihgTO4YSr
	Lr3mYYq+rWssd/Sq7rRGnVotevkJJQwwKXZrCEHKdwMbfi1w3/rLDfC9H9NLBfQiVPlOW2YV0sZ
	gtyDzQZT7+jFNAE4aGLr8ap9RQyhB+wdK95IUYOM6Kw==
X-Gm-Gg: ASbGnctG3LczwnOFg9+c4iUdNxzOSkwFmQgEunPyYXxJpCvzgQUDUwsB50PKUYshAeH
	LvYKvHrdQ1LCfQP1nW0BgSEEHfh3lBfouuD8mRKEH1+EH1hbD9oja6gEpYirb04qtb9LkPPYEGz
	hbVW1SkwKYNn8hOZF/m0juyLGsKvn0QHF/UPcw2XiUi5MQWrZJVEGa9pekTg4C09l23as6YXWG7
	8LUWw==
X-Google-Smtp-Source: AGHT+IHyVR0Cut9V8mFqbXLE2gI0SW2klifSUW7QVtX8auO8xvXiA0Ua6n3KwVaWcVGV93VWVuS5GiOtiXlDQAR0jhE=
X-Received: by 2002:a17:90b:3911:b0:311:d05c:936 with SMTP id
 98e67ed59e1d1-31a90be7e20mr3974942a91.17.1751453851355; Wed, 02 Jul 2025
 03:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtK67MNaNin6nv_vLhp4xRnsnSPBEsnQTOJ+V5F4yz4RA@mail.gmail.com>
In-Reply-To: <CA+G9fYtK67MNaNin6nv_vLhp4xRnsnSPBEsnQTOJ+V5F4yz4RA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Jul 2025 16:27:16 +0530
X-Gm-Features: Ac12FXy9AD4tjHYjA6dhnGK0F8nyYYQxKfc-3Tlz_e47k_MXctC-n7dZz5AOL10
Message-ID: <CA+G9fYugjv=Q=VGSFA2bxRyrWCQ_J7c7o8z94f_ip9OoNSk=hA@mail.gmail.com>
Subject: Re: next-20250701: qemu-x86_64: BUG unable to handle page fault for
 address __cpa_flush_tlb
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	linux-mm <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jul 2025 at 11:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions While booting the next-20250701 Linux kernel on a
> qemu-x86_64 virtual machine, a kernel panic is observed due to
> a page fault in the __cpa_flush_tlb function.
>
> Test environments:
> - qemu-x86_64
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? I need more data (Testing is in progress)
>
> Boot regression: Linux next-20250701 qemu-x86_64 BUG unable to handle
> page fault for address __cpa_flush_tlb
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Boot log
> <6>[    0.000000] Linux version 6.16.0-rc4-next-20250701
> (tuxmake@tuxmake) (x86_64-linux-gnu-gcc (Debian 13.3.0-16) 13.3.0, GNU
> ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC @1751364982
> <6>[    0.000000] Command line: console=ttyS0,115200 rootwait
> root=/dev/sda debug verbose console_msg_format=syslog
> systemd.log_level=warning rw earlycon
> <6>[    0.000000] x86/CPU: Model not found in latest microcode list
> <6>[    0.000000] BIOS-provided physical RAM map:
>
> ...
>
> <6>[    2.292682] EXT4-fs (sda): mounted filesystem
> 9c9bd7ea-a7a4-4c7c-bc54-7007f029c954 r/w with ordered data mode. Quota
> mode: none.
> <6>[    2.294012] VFS: Mounted root (ext4 filesystem) on device 8:0.
> <6>[    2.296792] devtmpfs: mounted
> <6>[    2.387406] Freeing unused kernel image (initmem) memory: 4092K
> <6>[    2.389312] Write protecting the kernel read-only data: 32768k
> <6>[    2.391640] Freeing unused kernel image (text/rodata gap) memory: 28K
> <1>[    2.393647] BUG: unable to handle page fault for address: 000000000002aa97
> <1>[    2.394089] #PF: supervisor read access in kernel mode
> <1>[    2.395026] #PF: error_code(0x0000) - not-present page
> <6>[    2.395623] PGD 0 P4D 0
> <4>[    2.396063] Oops: Oops: 0000 [#1] SMP PTI
> <4>[    2.396998] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted
> 6.16.0-rc4-next-20250701 #1 PREEMPT(voluntary)
> <4>[    2.397726] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> <4>[ 2.398454] RIP: 0010:__cpa_flush_tlb
> (arch/x86/mm/pat/set_memory.c:320 arch/x86/mm/pat/set_memory.c:408)
> <4>[ 2.399219] Code: 1e fa 0f 1f 44 00 00 55 48 89 e5 41 54 53 48 83
> 7f 20 00 48 89 fb 74 5b 45 31 e4 31 ff eb 27 48 8b 13 a8 02 75 47 48
> c1 e7 0c <48> 03 3a 48 01 ff 48 d1 ff e8 26 f4 ff ff 41 8d 7c 24 01 49
> 89 fc
> All code
> ========
>    0: 1e                    (bad)
>    1: fa                    cli
>    2: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>    7: 55                    push   %rbp
>    8: 48 89 e5              mov    %rsp,%rbp
>    b: 41 54                push   %r12
>    d: 53                    push   %rbx
>    e: 48 83 7f 20 00        cmpq   $0x0,0x20(%rdi)
>   13: 48 89 fb              mov    %rdi,%rbx
>   16: 74 5b                je     0x73
>   18: 45 31 e4              xor    %r12d,%r12d
>   1b: 31 ff                xor    %edi,%edi
>   1d: eb 27                jmp    0x46
>   1f: 48 8b 13              mov    (%rbx),%rdx
>   22: a8 02                test   $0x2,%al
>   24: 75 47                jne    0x6d
>   26: 48 c1 e7 0c          shl    $0xc,%rdi
>   2a:* 48 03 3a              add    (%rdx),%rdi <-- trapping instruction
>   2d: 48 01 ff              add    %rdi,%rdi
>   30: 48 d1 ff              sar    $1,%rdi
>   33: e8 26 f4 ff ff        call   0xfffffffffffff45e
>   38: 41 8d 7c 24 01        lea    0x1(%r12),%edi
>   3d: 49 89 fc              mov    %rdi,%r12
>
> Code starting with the faulting instruction
> ===========================================
>    0: 48 03 3a              add    (%rdx),%rdi
>    3: 48 01 ff              add    %rdi,%rdi
>    6: 48 d1 ff              sar    $1,%rdi
>    9: e8 26 f4 ff ff        call   0xfffffffffffff434
>    e: 41 8d 7c 24 01        lea    0x1(%r12),%edi
>   13: 49 89 fc              mov    %rdi,%r12
> <4>[    2.399698] RSP: 0000:ffffb316c00e0f78 EFLAGS: 00010046
> <4>[    2.400494] RAX: 0000000000000169 RBX: ffffb316c0013e30 RCX:
> ffffb316c0013e30
> <4>[    2.401577] RDX: 000000000002aa97 RSI: 000000008b09dcbb RDI:
> 0000000000000000
> <4>[    2.401910] RBP: ffffb316c00e0f88 R08: 000000000000546c R09:
> 0000000000000000
> <4>[    2.402961] R10: 0000000000000000 R11: ffffb316c00e0ff8 R12:
> 0000000000000000
> <4>[    2.403326] R13: ffff8e357bd2daa0 R14: ffff8e3500aaaeb8 R15:
> ffffffff95148f50
> <4>[    2.403927] FS:  0000000000000000(0000)
> GS:ffff8e35e47bc000(0000) knlGS:0000000000000000
> <4>[    2.404471] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    2.404795] CR2: 000000000002aa97 CR3: 000000002ac48000 CR4:
> 00000000000006f0
> <4>[    2.405623] Call Trace:
> <4>[    2.406562]  <IRQ>
> <4>[ 2.407678] __flush_smp_call_function_queue
> (arch/x86/include/asm/jump_label.h:36 include/trace/events/csd.h:64
> kernel/smp.c:135 kernel/smp.c:540)
> <4>[ 2.408101] generic_smp_call_function_single_interrupt (kernel/smp.c:458)
> <4>[ 2.408234] __sysvec_call_function_single
> (arch/x86/include/asm/jump_label.h:36
> arch/x86/include/asm/trace/irq_vectors.h:98 arch/x86/kernel/smp.c:272)
> <4>[ 2.409077] sysvec_call_function_single (arch/x86/kernel/smp.c:266
> (discriminator 35) arch/x86/kernel/smp.c:266 (discriminator 35))
> <4>[    2.409287]  </IRQ>
> <4>[    2.409408]  <TASK>
> <4>[ 2.409584] asm_sysvec_call_function_single
> (arch/x86/include/asm/idtentry.h:709)
> <4>[ 2.410108] RIP: 0010:pv_native_safe_halt (arch/x86/kernel/paravirt.c:82)
> <4>[ 2.410323] Code: 1f 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90
> 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 85 ef 03
> 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90
> 90 90
> All code
> ========
>    0: 1f                    (bad)
>    1: 84 00                test   %al,(%rax)
>    3: 00 00                add    %al,(%rax)
>    5: 00 00                add    %al,(%rax)
>    7: 0f 1f 40 00          nopl   0x0(%rax)
>    b: 90                    nop
>    c: 90                    nop
>    d: 90                    nop
>    e: 90                    nop
>    f: 90                    nop
>   10: 90                    nop
>   11: 90                    nop
>   12: 90                    nop
>   13: 90                    nop
>   14: 90                    nop
>   15: 90                    nop
>   16: 90                    nop
>   17: 90                    nop
>   18: 90                    nop
>   19: 90                    nop
>   1a: 90                    nop
>   1b: f3 0f 1e fa          endbr64
>   1f: eb 07                jmp    0x28
>   21: 0f 00 2d 85 ef 03 00 verw   0x3ef85(%rip)        # 0x3efad
>   28: fb                    sti
>   29: f4                    hlt
>   2a:* c3                    ret <-- trapping instruction
>   2b: cc                    int3
>   2c: cc                    int3
>   2d: cc                    int3
>   2e: cc                    int3
>   2f: 66 2e 0f 1f 84 00 00 cs nopw 0x0(%rax,%rax,1)
>   36: 00 00 00
>   39: 66 90                xchg   %ax,%ax
>   3b: 90                    nop
>   3c: 90                    nop
>   3d: 90                    nop
>   3e: 90                    nop
>   3f: 90                    nop
>
> Code starting with the faulting instruction
> ===========================================
>    0: c3                    ret
>    1: cc                    int3
>    2: cc                    int3
>    3: cc                    int3
>    4: cc                    int3
>    5: 66 2e 0f 1f 84 00 00 cs nopw 0x0(%rax,%rax,1)
>    c: 00 00 00
>    f: 66 90                xchg   %ax,%ax
>   11: 90                    nop
>   12: 90                    nop
>   13: 90                    nop
>   14: 90                    nop
>   15: 90                    nop
> <4>[    2.411151] RSP: 0000:ffffb316c00abea0 EFLAGS: 00010206
> <4>[    2.411522] RAX: ffff8e35e47bc000 RBX: ffff8e3500372e80 RCX:
> 0000000000000001
> <4>[    2.411691] RDX: ffffffff9523177d RSI: ffffffff96b9a3df RDI:
> 0000000000005464
> <4>[    2.412619] RBP: ffffb316c00abea8 R08: 0000000000005464 R09:
> 0000000000000001
> <4>[    2.412810] R10: 0000004d8989ef00 R11: 000000000548e0b3 R12:
> 0000000000000001
> <4>[    2.413067] R13: 0000000000000000 R14: 0000000000000000 R15:
> 0000000000000000
> <4>[ 2.413403] ? do_idle (kernel/sched/idle.c:191 kernel/sched/idle.c:330)
> <4>[ 2.413737] ? default_idle (arch/x86/include/asm/paravirt.h:107
> arch/x86/kernel/process.c:757)
> <4>[ 2.413926] arch_cpu_idle (arch/x86/kernel/process.c:795)
> <4>[ 2.414072] default_idle_call (include/linux/cpuidle.h:144
> kernel/sched/idle.c:123)
> <4>[ 2.414608] do_idle (kernel/sched/idle.c:191 kernel/sched/idle.c:330)
> <4>[ 2.414744] cpu_startup_entry (kernel/sched/idle.c:427)
> <4>[ 2.414961] start_secondary (arch/x86/kernel/smpboot.c:203
> (discriminator 10) arch/x86/kernel/smpboot.c:283 (discriminator 10))
> <4>[ 2.415531] common_startup_64 (arch/x86/kernel/head_64.S:419)
> <4>[    2.415720]  </TASK>
> <4>[    2.415898] Modules linked in:
> <4>[    2.416303] CR2: 000000000002aa97
> <4>[    2.417490] ---[ end trace 0000000000000000 ]---
> <4>[ 2.417940] RIP: 0010:__cpa_flush_tlb
> (arch/x86/mm/pat/set_memory.c:320 arch/x86/mm/pat/set_memory.c:408)
> <4>[ 2.418250] Code: 1e fa 0f 1f 44 00 00 55 48 89 e5 41 54 53 48 83
> 7f 20 00 48 89 fb 74 5b 45 31 e4 31 ff eb 27 48 8b 13 a8 02 75 47 48
> c1 e7 0c <48> 03 3a 48 01 ff 48 d1 ff e8 26 f4 ff ff 41 8d 7c 24 01 49
> 89 fc
> All code
> ========
>    0: 1e                    (bad)
>    1: fa                    cli
>    2: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>    7: 55                    push   %rbp
>    8: 48 89 e5              mov    %rsp,%rbp
>    b: 41 54                push   %r12
>    d: 53                    push   %rbx
>    e: 48 83 7f 20 00        cmpq   $0x0,0x20(%rdi)
>   13: 48 89 fb              mov    %rdi,%rbx
>   16: 74 5b                je     0x73
>   18: 45 31 e4              xor    %r12d,%r12d
>   1b: 31 ff                xor    %edi,%edi
>   1d: eb 27                jmp    0x46
>   1f: 48 8b 13              mov    (%rbx),%rdx
>   22: a8 02                test   $0x2,%al
>   24: 75 47                jne    0x6d
>   26: 48 c1 e7 0c          shl    $0xc,%rdi
>   2a:* 48 03 3a              add    (%rdx),%rdi <-- trapping instruction
>   2d: 48 01 ff              add    %rdi,%rdi
>   30: 48 d1 ff              sar    $1,%rdi
>   33: e8 26 f4 ff ff        call   0xfffffffffffff45e
>   38: 41 8d 7c 24 01        lea    0x1(%r12),%edi
>   3d: 49 89 fc              mov    %rdi,%r12
>
> Code starting with the faulting instruction
> ===========================================
>    0: 48 03 3a              add    (%rdx),%rdi
>    3: 48 01 ff              add    %rdi,%rdi
>    6: 48 d1 ff              sar    $1,%rdi
>    9: e8 26 f4 ff ff        call   0xfffffffffffff434
>    e: 41 8d 7c 24 01        lea    0x1(%r12),%edi
>   13: 49 89 fc              mov    %rdi,%r12
> <4>[    2.418856] RSP: 0000:ffffb316c00e0f78 EFLAGS: 00010046
> <4>[    2.419172] RAX: 0000000000000169 RBX: ffffb316c0013e30 RCX:
> ffffb316c0013e30
> <4>[    2.419363] RDX: 000000000002aa97 RSI: 000000008b09dcbb RDI:
> 0000000000000000
> <4>[    2.419552] RBP: ffffb316c00e0f88 R08: 000000000000546c R09:
> 0000000000000000
> <4>[    2.419864] R10: 0000000000000000 R11: ffffb316c00e0ff8 R12:
> 0000000000000000
> <4>[    2.420309] R13: ffff8e357bd2daa0 R14: ffff8e3500aaaeb8 R15:
> ffffffff95148f50
> <4>[    2.420816] FS:  0000000000000000(0000)
> GS:ffff8e35e47bc000(0000) knlGS:0000000000000000
> <4>[    2.421298] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[    2.421675] CR2: 000000000002aa97 CR3: 000000002ac48000 CR4:
> 00000000000006f0
> <0>[    2.422354] Kernel panic - not syncing: Fatal exception in interrupt
> <0>[    2.425278] Kernel Offset: 0x13e00000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> <0>[    2.426205] ---[ end Kernel panic - not syncing: Fatal exception
> in interrupt ]---
>
> ## Source
> * Kernel version: 6.16.0-rc4-next-20250701
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
> * Git describe: 6.16.0-rc4-next-20250701
> * Architectures: arm64
> * Toolchains: gcc-13
> * Kconfigs: gcc-13-lkftconfig-no-kselftest-frag
>
> ## Build arm64
> * Test log: https://qa-reports.linaro.org/api/testruns/28972335/log_file/

My bad, Please ignore the below link (It is for a different regression)

> * Test LAVA log 1:
> https://lkft.validation.linaro.org/scheduler/job/8336872#L5891


> * Test details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250701/log-parser-boot/panic-multiline-kernel-panic-not-syncing-fatal-exception-in-interrupt/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2zGk2ZJWqj1Ukob9bJAF1Jn6uK8/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2zGk2ZJWqj1Ukob9bJAF1Jn6uK8/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org
