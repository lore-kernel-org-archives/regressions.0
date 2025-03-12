Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDBD1C32
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741759085; cv=none; b=I8LYTILEK3gBRj81RSY+FWkfULNRkvs3LUOcSlkHyiEwopAQk2wKAsPBKhdP84U86EnOEyWsLIDDW13YiUCWfHjIsk0TSc+wRMzBDeV1b39uO8R0cUSuakaVQQYzrInzqKt+VAZnenIZEs4b3KKJchG1rhV9pOZtPjLxGl+2aw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741759085; c=relaxed/simple;
	bh=30W2c60mUqsycqoeOBI4v6KiQvez/d2FOAtCzyxJJ7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP9rYpKWbuEtFafQaKfidDSqAuOgnvmNTGhIUh+ceJMf+ilCxrXutDVU431Udv58jCZ8PrYaueVLAFzEiIGhIaUgwxxfb2/i3iYC5TwiMPUHWLCpOa9WfdFuaXsNuQQ9Xzk81/oNyZIfOmIEjL7FC3dCh8jXGKtoXYfgMlXHDrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNXGysW9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNXGysW9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so12823745a91.3
        for <regressions@lists.linux.dev>; Tue, 11 Mar 2025 22:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741759082; x=1742363882; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLssoaWWkVPQexaafEFbPGP3QFHY0Ycy7JaqR0jf/2Q=;
        b=ZNXGysW9a3JERVMfh0xPYrNYc3v4KgjXQWklsSzOdW1NRcniB5iwsGJh39sqOTM1DA
         5EggbNM24u2vwqq0AEPL/0RXY6rCjAiuxSKv5TAEWbhrFuvgs5vu8Ru3QNDEzEsI0xex
         BeMOvyxgEMPFg8H5LVWC1u1E0+uSvYyP00S8VWxymbYFUAFdgO+flJzrvA+7p6HaglsU
         FhrIil9CbG9knPQKmszqFOlb3O85K6kvSL3FFJ9oVgNFtQDIWmXNwPYCQxCTQBvudA2N
         bEBJ6U3zvwaXI7H3t4YkbOYWwpmBGbyZVyMqmJn/GTCdNkavzVVJCtjxvXRWtvs/xSWH
         tp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741759082; x=1742363882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLssoaWWkVPQexaafEFbPGP3QFHY0Ycy7JaqR0jf/2Q=;
        b=q1abSy6iX3cnqrO59kwxhqaMltN5rciQKK9m4g2UGBuYreDiTH2ipJXEefF40GTMy4
         wKud5KoQEfHPDMLoG7ewKgufGSgnyi91kwzaPaRtEe0kgbI6lef+pI7mSXvNT7xlRVi0
         sd/NYIBj7pCcdVviiq9EhYf1Rh81eJJq9p6MQFXBYD5O8BaLDb1OEyIcEufHBG0RoS5C
         loc+Z4PIG+lT4KOPkEvES0sWOl1w1XFj0JTQsxln8WRFRYxl5LsTF6hFFbcYVz91SHyC
         NG0Ua7NxJfFO9HiHTz7QQWSPhA8O+t16af4VLzOtpLtIOkMEPIpsKOFc4uAkSnKoms13
         +8Cg==
X-Gm-Message-State: AOJu0Yxqh/oM7z7jiwtkBGr4ST8nvIKPZGHqQZdTZcwJPVxeVbyZ/rWn
	MkwY6MGYacjXMkGeTnzyMpPYyt6WZGfmkH48PdKZsnUXH5auRra83JOFYQuuDecTfGVBFxMwgPf
	Qn792ywtTQ+k/Xkf1VeP43NWs4lALRX3M
X-Gm-Gg: ASbGncv2163D1hA+yYcnRplElHOGljxILeKpePYSHmO7RiZSWcdZ9UH6RLbx2Py/UkS
	NEvQzYwVmPnIa0kmLwZAgNRtUOoOIww9pedtxXZfBvMx77EnLCP7+eymvIKCwJ5aP+W0dP1KBcR
	DscswgVmpiupZUiYlMlWRc9HRw
X-Google-Smtp-Source: AGHT+IFwwPlkb0HMeCa4KXqkhy/IX0p17x/a/t1gEINYVMLxTCFXYAjWYVYNWllj6KLOinc2dVPBbaxc1PEsSwvG4gU=
X-Received: by 2002:a17:90b:2883:b0:2ff:52e1:c4a1 with SMTP id
 98e67ed59e1d1-2ff7cf128acmr30956952a91.24.1741759082446; Tue, 11 Mar 2025
 22:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <CC16418A-C02F-4ED0-B3E7-9BA9A5157C02@oracle.com>
In-Reply-To: <CC16418A-C02F-4ED0-B3E7-9BA9A5157C02@oracle.com>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Wed, 12 Mar 2025 14:57:51 +0900
X-Gm-Features: AQ5f1Jrg6oMq5jkNg89bAszXMcBCCU2AyfzFtsJiNXLyaFyLrlM3SxEd1eAq6I0
Message-ID: <CAG8fp8T4ibM15=jTA4XvY0kJ9cDobzkur0yY7fZqXnyKurcUtw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
To: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Aruna, thanks for your reply

>> The issue doesn't seem to happen with QEMU + Hypervisor.framework (Apple=
's KVM).
>
> Do you have CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS enabled in this insta=
nce
too, where you don=E2=80=99t see the issue?

Yes. It's just the defconfig.

FYI the qemu command line is:
```
qemu-system-x86_64 \
  -cpu max -accel hvf -smp 2 \
  -m 2048 \
  -nographic \
  -kernel bzImage -initrd initrd  -append "console=3DttyS0"
```

> lscpu

`cat /proc/cpuinfo` may work here?

```
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx lm
constant_tsc rep_good nopl xtopology nonstop_tsc cpuid pni pclmulqdq
ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c
rdrand hypervisor lahf_lm abm 3dnowprefetch pti intel_ppin fsgsbase
bmi1 avx2 smep bmi2 erms avx512f avx512dq rdseed adx smap avx512ifma
clflushopt avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1
arat avx512vbmi umip pku ospke avx512_vbmi2 vpclmulqdq avx512_vnni
avx512_bitalg avx512_vpopcntdq

bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs itlb_multihit srbds mmio_stale_data retbleed gds bhi
```

This seems different from `qemu-system-x86_64 -cpu host -accel hvf`,
which works fine:

```
--- cpuinfo.qemu.cpu-host,accel-hvf     2025-03-12 14:50:29
+++ cpuinfo.apple-vz    2025-03-12 14:51:51
@@ -2,11 +2,10 @@
 vendor_id       : GenuineIntel
 cpu family      : 6
 model           : 126
-model name      : 06/7e
+model name      : Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz
 stepping        : 5
-microcode       : 0x1
-cpu MHz         : 2303.829
-cache size      : 16384 KB
+cpu MHz         : 2303.840
+cache size      : 8192 KB
 physical id     : 0
 siblings        : 2
 core id         : 0
@@ -15,25 +14,24 @@
 initial apicid  : 0
 fpu             : yes
 fpu_exception   : yes
-cpuid level     : 13
+cpuid level     : 22
 wp              : yes
-flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx
pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpud
+flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx lm
constant_tsc rep_good nopl xtopology nonstop_tsc cpuid pni pclmulqdq
ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c
rdrand hypervisor lahf_lm abm 3dnowprefetch pti fsgsbase bmi1 avx2
smep bmi2 erms avx512f avx512dq rdseed adx smap avx512ifma clflushopt
avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 arat
avx512vbmi umip pku ospke avx512_vbmi2 vpclmulqdq avx512_vnni
avx512_bitalg avx512_vpopcntdq
 bugs            : cpu_meltdown spectre_v1 spectre_v2
spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_stale_data
retbleed gds bhi
-bogomips        : 4607.65
+bogomips        : 4607.68
 clflush size    : 64
 cache_alignment : 64
-address sizes   : 36 bits physical, 48 bits virtual
+address sizes   : 39 bits physical, 48 bits virtual
 power management:

 processor       : 1
 vendor_id       : GenuineIntel
 cpu family      : 6
 model           : 126
-model name      : 06/7e
+model name      : Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz
 stepping        : 5
-microcode       : 0x1
-cpu MHz         : 2303.829
-cache size      : 16384 KB
+cpu MHz         : 2303.840
+cache size      : 8192 KB
 physical id     : 0
 siblings        : 2
 core id         : 1
@@ -42,13 +40,13 @@
 initial apicid  : 1
 fpu             : yes
 fpu_exception   : yes
-cpuid level     : 13
+cpuid level     : 22
 wp              : yes
-flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx
pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpud
+flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx lm
constant_tsc rep_good nopl xtopology nonstop_tsc cpuid pni pclmulqdq
ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c
rdrand hypervisor lahf_lm abm 3dnowprefetch pti intel_ppin fsgsbase
bmi1 avx2 smep bmi2 erms avx512f avx512dq rdseed adx smap avx512ifma
clflushopt avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1
arat avx512vbmi umip pku ospke avx512_vbmi2 vpclmulqdq avx512_vnni
avx512_bitalg avx512_vpopcntdq
 bugs            : cpu_meltdown spectre_v1 spectre_v2
spec_store_bypass l1tf mds swapgs itlb_multihit srbds mmio_stale_data
retbleed gds bhi
-bogomips        : 4607.65
+bogomips        : 4607.68
 clflush size    : 64
 cache_alignment : 64
-address sizes   : 36 bits physical, 48 bits virtual
+address sizes   : 39 bits physical, 48 bits virtual
 power management:


```

Regards,
Akihiro Suda

2025=E5=B9=B43=E6=9C=8812=E6=97=A5(=E6=B0=B4) 3:25 Aruna Ramakrishna <aruna=
.ramakrishna@oracle.com>:
>
> Hi Akihiro,
>
> > On Mar 11, 2025, at 7:35=E2=80=AFAM, Akihiro Suda <suda.kyoto@gmail.com=
> wrote:
> >
> > When the kernel is compiled with CONFIG_X86_INTEL_MEMORY_PROTECTION_KEY=
S,
> > it no longer boots on Virtualization.framework [1] (Apple's equivalent =
of QEMU)
> > on Intel Macs, since the following commit:
> >
> >    70044df250d0  x86/pkeys: Update PKRU to enable all pkeys before XSAV=
E
> >
> > Tested with macOS 13.5.1, running on MacBook Pro 2020 with
> > Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz.
> >
> > The issue doesn't seem to happen with QEMU + Hypervisor.framework (Appl=
e's KVM).
>
> Do you have CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS enabled in this insta=
nce
> too, where you don=E2=80=99t see the issue?
>
> Could I see lscpu output (just the Flags: section) on the machine with th=
e issue? (after disabling
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS of course.)
>
> Thanks,
> Aruna
>
> >
> > This issue was originally reported by Blake Garner in Lima [2]'s Slack =
channel.
> >
> > [1] https://developer.apple.com/documentation/virtualization/running-li=
nux-in-a-virtual-machine
> > [2] https://lima-vm.io/
> >
> > ---
> > #regzbot link: https://github.com/lima-vm/lima/issues/3334
> > #regzbot introduced: 70044df250d022572e26cd301bddf75eac1fe50e
> > #regzbot title: x86/pkeys: Update PKRU to enable all pkeys before XSAVE
> > ---
> >
> > A boot log with the regression commit, with defconfig:
> >
> > $ LinuxVirtualMachine bzImage-g70044df250d0 initrd
> > (...)
> > [    0.477064] Run /init as init process
> > [    0.478585] ------------[ cut here ]------------
> > [    0.478747] WARNING: CPU: 0 PID: 1 at
> > arch/x86/kernel/fpu/xstate.c:1003 get_xsave_addr_user+0x28/0x40
> > [    0.478893] Modules linked in:
> > [    0.478999] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted
> > 6.11.0-rc1-00007-g70044df250d0 #15
> > [    0.479148] RIP: 0010:get_xsave_addr_user+0x28/0x40
> > [    0.479454] Code: 90 90 66 0f 1f 00 48 63 ce ba 01 00 00 00 48 d3
> > e2 48 23 15 12 36 7e 01 74 0f 8b 04 8d 00 55 22 a8 48 01 f8 c3 cc cc
> > cc cc 90 <0f> 0b 90 31 c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00
> > 00 0f
> > [    0.479699] RSP: 0018:ffff95af4000fd80 EFLAGS: 00010246
> > [    0.479983] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
000000009
> > [    0.480137] RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ff=
e7b10bf80
> > [    0.480301] RBP: 00007ffe7b10bf80 R08: ffff95af4000fe90 R09: 0000000=
000000000
> > [    0.480431] R10: 0000000000000001 R11: 0000000000000010 R12: ffff930=
081198c40
> > [    0.480820] R13: 00007ffe7b10bf80 R14: ffff930081198c00 R15: ffff930=
081198000
> > [    0.481112] FS:  00007ff310710740(0000) GS:ffff9300fdc00000(0000)
> > knlGS:0000000000000000
> > [    0.481261] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.481415] CR2: 00007ffe7b10bf80 CR3: 00000000011f0004 CR4: 0000000=
000770ef0
> > [    0.481552] PKRU: 55555554
> > [    0.481660] Call Trace:
> > [    0.481726]  <TASK>
> > [    0.481798]  ? get_xsave_addr_user+0x28/0x40
> > [    0.481923]  ? __warn.cold+0x8e/0xea
> > [    0.482122]  ? get_xsave_addr_user+0x28/0x40
> > [    0.482212]  ? report_bug+0xff/0x140
> > [    0.482316]  ? handle_bug+0x3b/0x70
> > [    0.482408]  ? exc_invalid_op+0x17/0x70
> > [    0.482540]  ? asm_exc_invalid_op+0x1a/0x20
> > [    0.482609]  ? get_xsave_addr_user+0x28/0x40
> > [    0.482732]  copy_fpstate_to_sigframe+0x1be/0x380
> > [    0.482801]  ? __put_user_8+0x11/0x20
> > [    0.482869]  get_sigframe+0xf1/0x280
> > [    0.482957]  x64_setup_rt_frame+0x67/0x2c0
> > [    0.483057]  arch_do_signal_or_restart+0x1b3/0x240
> > [    0.483140]  syscall_exit_to_user_mode+0xb0/0x130
> > [    0.483215]  do_syscall_64+0xab/0x1a0
> > [    0.483270]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > [    0.483343] RIP: 0033:0x7ff3107b2046
> > [    0.483405] Code: 00 00 48 8b 15 b3 1d 17 00 64 89 02 48 c7 c2 ff
> > ff ff ff 48 8b 5d f8 c9 48 89 d0 c3 0f 1f 84 00 00 00 00 00 48 8b 45
> > 10 0f 05 <48> 63 d0 3d 00 f0 ff ff 77 10 48 8b 5d f8 48 89 d0 c9 c3 0f
> > 1f 80
> > [    0.483666] RSP: 002b:00007ffe7b10cab0 EFLAGS: 00000202 ORIG_RAX:
> > 000000000000003d
> > [    0.483774] RAX: 0000000000000035 RBX: 00007ff310710740 RCX: 00007ff=
3107b2046
> > [    0.483876] RDX: 0000000000000000 RSI: 00007ffe7b10cb0c RDI: fffffff=
fffffffff
> > [    0.483976] RBP: 00007ffe7b10cac0 R08: 0000000000000000 R09: 0000000=
000000000
> > [    0.484078] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ff=
e7b10cb10
> > [    0.484178] R13: 00005561f9af12a0 R14: 00005561f9af2600 R15: 0000000=
000000001
> > [    0.484280]  </TASK>
> > [    0.484318] ---[ end trace 0000000000000000 ]---
> >
> > (kernel hangs here)
>
