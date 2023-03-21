Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D041FA0
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 05:36:07 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id g9so4974240uam.9
        for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 22:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20210112.gappssmtp.com; s=20210112; t=1679376966;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eJ4FVDAugoFLXqqiqqUa3dBxC97ktNUlAHC1Vr2StT4=;
        b=rtVAmQw8kqVjo3QLc6epJvXzICBOHZjZMPt7JeeQjReVdxg0DHi4RN2mAntpk3/dkl
         E1Uk2UhqsVOergq85ldnmaI9hOD2bzdMvbM2o6v7L//AMusUg7LTRzGRVgPLfoAEsGSG
         3VNxX2uiNwue9KtPhNO4vAalOWWyFva4gcrdJyo1L8wwvbikIUTS1DEI2E9pXpmlY77d
         thGFUen+5Qcz5qt7q0rdL1eqGQwbr9qgYbwrH+jYeuR6Boep/j2+rw5KMj4Zf+oarWZ/
         gulGbhHc6ePJxYjNlwitDc9n/1PYV2pRWGQ1Mn4sS5Mgm+gojEWSnmX/tDUhov0NMgDF
         TvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679376966;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJ4FVDAugoFLXqqiqqUa3dBxC97ktNUlAHC1Vr2StT4=;
        b=ocr7/PrJmry83iPbj8tMvXcg+T4wrsXyxb/M+8TZD6Oh/tv3YOKYZWG9et8DRnoXvf
         iOeqZVFktW9oPgSSv11K2dXbRTE7ilLFMO1LMP+yWTrd00BVISGDm3DrApQapasfDkuH
         tuIN+9X6f2oLvFl58ZAY/ZRUUhvNLof/WRiN5kEJc7wLVU1kR7X14EpESkJXglQonAXO
         zIotFdJYvqb84v61bVSecanVEXZ8TW29Cn2Nn6dQsAtSRDHaWhnCrcpcTaVpKzkF9UQa
         LiCUdg1nte0mKhDLhz6KpFEJ7UfhOLSC1b7flnJZxmZiDwaea+rJWQBvVxQyYjkkGNvH
         jwRw==
X-Gm-Message-State: AO0yUKXubml40YlOZ3TAU2quc0V9VyQzlkkFWz4AtpF/LOicJzD0IHIi
	vrrcsfL0FkIpPExe1VnTSFsvjagX8LBhZwkbVHRGkJSWzzitsYjqRo4=
X-Google-Smtp-Source: AK7set8GbxMjiRNh/VULbTTHF/1NeBSQdV/bLwFiA3m3XFhiQhssclZEi+GzBj0Cvg9KvHeqw65nQ2g/6baor3zLIno=
X-Received: by 2002:a1f:220b:0:b0:435:56e:154e with SMTP id
 i11-20020a1f220b000000b00435056e154emr430205vki.1.1679376966149; Mon, 20 Mar
 2023 22:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6054:0:b0:754:241:ee8d with HTTP; Mon, 20 Mar 2023
 22:36:05 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
From: Nick Bowler <nbowler@draconx.ca>
Date: Tue, 21 Mar 2023 01:36:05 -0400
Message-ID: <CADyTPEyZCY1cnPsqcbMrgOZejtyHHSdZ=EStouKKBc8YKFrnkg@mail.gmail.com>
Subject: PROBLEM: Linux 5.4.237 i915 driver crashes on boot (-longterm regression)
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: John.C.Harrison@intel.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Linux 5.4.237 crashes immediately on my machine every time when the i915
driver is loaded, with an error like the one below.  Previous versions are OK.

I bisected it to commit 1aed78cfda7f ("drm/i915: Don't use BAR mappings
for ring buffers with LLC").  I can revert this on top of 5.4.237 and
this seems sufficient to make the machine boot and work again.

Let me know if you need any more info.

Thanks,
  Nick

netconsole: network logging started
Linux agpgart interface v0.103
fb0: switching to inteldrmfb from simple
Console: switching to colour dummy device 80x25
i915 0000:00:02.0: vgaarb: deactivate vga console
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
i915 0000:00:02.0: vgaarb: changed VGA decodes:
olddecodes=io+mem,decodes=io+mem:owns=io+mem
BUG: kernel NULL pointer dereference, address: 000000000000007c
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 42ae34067 P4D 42ae34067 PUD 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 1 PID: 132 Comm: modprobe Not tainted 5.4.237 #41
Hardware name: System manufacturer System Product Name/P8H67-I DELUXE,
BIOS 0907 12/04/2012
RIP: 0010:atomic_add_unless+0x0/0x1d [i915]
Code: 13 06 d0 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 48 8b 3d
dd 0a 11 00 e9 b1 7f d1 cf 48 8b 3d d1 0a 11 00 e9 14 7a d1 cf <8b> 0f
39 ca 74 11 44 8d 04 0e 89 c8 f0 44 0f b1 07 74 04 89 c1 eb
RSP: 0018:ffffb0bd401dbb08 EFLAGS: 00010202
RAX: ffffa0f26d1da500 RBX: ffffa0f26a620000 RCX: ffffa0f26d1da540
RDX: 0000000000000001 RSI: 00000000ffffffff RDI: 000000000000007c
RBP: 0000000000000000 R08: ffffa0f26a700701 R09: ffffffffc03c0677
R10: ffffa0f26aceb480 R11: ffffa0f26aceb480 R12: 00000000fffffffa
R13: ffffa0f26ace8100 R14: ffffa0f26a700068 R15: ffffa0f26d870000
FS:  00000000f7ce2700(0000) GS:ffffa0f26fc80000(0000) knlGS:0000000000000000
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000000000000007c CR3: 000000042acff003 CR4: 00000000000606e0
Call Trace:
 intel_context_unpin+0x17/0x78 [i915]
 intel_engine_cleanup_common+0x97/0xc8 [i915]
 intel_ring_submission_init+0xbb/0xc5 [i915]
 ? intel_ring_submission_setup+0x2ed/0x2ed [i915]
 intel_engines_init+0x33/0x5b [i915]
 i915_gem_init+0x100/0x4c9 [i915]
 i915_driver_probe+0xe3b/0x1143 [i915]
 ? mutex_lock+0x1a/0x23
 ? kernfs_activate+0x1a/0x63
 pci_device_probe+0x8d/0xff
 really_probe+0x13b/0x2a1
 driver_probe_device+0x97/0xc7
 device_driver_attach+0x37/0x50
 __driver_attach+0x9a/0xa3
 ? device_driver_attach+0x50/0x50
 bus_for_each_dev+0x5d/0x7f
 ? do_raw_spin_lock+0x18/0x28
 bus_add_driver+0xce/0x1c6
 driver_register+0x99/0xd2
 ? 0xffffffffc04f6000
 do_one_initcall+0x5e/0x13c
 ? slab_pre_alloc_hook+0x10/0x21
 ? kmem_cache_alloc+0xad/0xca
 do_init_module+0x41/0x1c3
 __do_sys_finit_module+0x7e/0x8d
 do_syscall_64+0x6e/0x7b
 entry_SYSCALL_64_after_hwframe+0x5c/0xc1
Modules linked in: i915(+) video i2c_algo_bit iosf_mbi drm_kms_helper
syscopyarea sysfillrect sysimgblt fb_sys_fops drm i2c_core intel_gtt
agpgart netconsole ipv6 r8169 realtek libphy
CR2: 000000000000007c
---[ end trace dce3967fa91cd316 ]---
RIP: 0010:atomic_add_unless+0x0/0x1d [i915]
Code: 13 06 d0 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 48 8b 3d
dd 0a 11 00 e9 b1 7f d1 cf 48 8b 3d d1 0a 11 00 e9 14 7a d1 cf <8b> 0f
39 ca 74 11 44 8d 04 0e 89 c8 f0 44 0f b1 07 74 04 89 c1 eb
RSP: 0018:ffffb0bd401dbb08 EFLAGS: 00010202
RAX: ffffa0f26d1da500 RBX: ffffa0f26a620000 RCX: ffffa0f26d1da540
RDX: 0000000000000001 RSI: 00000000ffffffff RDI: 000000000000007c
RBP: 0000000000000000 R08: ffffa0f26a700701 R09: ffffffffc03c0677
R10: ffffa0f26aceb480 R11: ffffa0f26aceb480 R12: 00000000fffffffa
R13: ffffa0f26ace8100 R14: ffffa0f26a700068 R15: ffffa0f26d870000
FS:  00000000f7ce2700(0000) GS:ffffa0f26fc80000(0000) knlGS:0000000000000000
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 000000000000007c CR3: 000000042acff003 CR4: 00000000000606e0
sysrq: Resetting
ACPI MEMORY or I/O RESET_REG.
