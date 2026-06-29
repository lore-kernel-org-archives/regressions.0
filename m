Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978963E4C94
	for <regressions@lists.linux.dev>; Mon, 29 Jun 2026 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743693; cv=none; b=P71Kp7ozcrqt0bPRrIDU/qhNb/XbDNL95zdylOYqevYir4hFYuN7VmJ1/DhiU0YnyPQcYAR/q7ZUBZf4Tc8LxEUoFaeYdTE302SgMDb4qR23PuAH5K/fcpjSxs5GeKm+qCGJwyQydzFqQm5QXiy6+pgVsTN6YfGfaeYhjbdhdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743693; c=relaxed/simple;
	bh=nQgj+GFBH/eooOxlxhaBazNeK+nly5tw28MqdrnZ7fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5IANaAa6tB1lw/9XMq/pvx1p5SbTBDANt3t0It2RmJPreQ8zhJ4/A7WrgIRLWlBF6CzGmysTAA9yKdpxFYRNg830H9oJ4aYT/TtTjDjdP8r6kyJJDDAumdNWcwTjlkiVWhBBsC2/Kpzg9hLT/MUzbxJuVQx+gUOMNofd6203YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dizCSomj; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dizCSomj"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b9e755555so5763068eec.1
        for <regressions@lists.linux.dev>; Mon, 29 Jun 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743691; x=1783348491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UisZIj9SAq+/iU2iNCfWWIml1oT3ijfALHSO5VDxq/M=;
        b=dizCSomjfuoLKA46Q9yj+pzPfsEWpBPzkI2jqhc91L2gH99z3fCaOPNrdi/ei+b15s
         9lwywIDv8fKKYdrBW/wmim4cAGtcYCv3Q0dYC2sQ8N1TmfejZ+5A0wWE8RRBR0yeJaE5
         tQwpeOA8+0vO91oRCNwcjvwrsoaOPPi7QSsrEmKX4wO20fttwvJGhQr4ymuJvgvm7dcp
         TmogUM0bxEJMa1FOg0V6WHTeYeeY0kD7zZhNjropg7a1qzbcceQOqUhcTcC49yPYH1fj
         08MuULAtCR9YLcggMTsg6c7fdnMq9TG3h59EpUMNGlTURJGpoiu9iKYVjRgiV7lQOf2e
         Zj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743691; x=1783348491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UisZIj9SAq+/iU2iNCfWWIml1oT3ijfALHSO5VDxq/M=;
        b=f8duV54HbeinXw1HYUHhdTdRJiUOzq0F1jYlNR4e4CvcR95FC9Ck2V83Ligkc2A65d
         A7XawZFrQp07LuMLjlMMa1oyxA5KYezBoGzfZ0W7HGL+s4j/xdlx7X+T+aHhe8pxntwn
         yu3aIuF/wfpP5FDWzvFTv0FIoQCDKCKRCEpDG9MaIR7SNatuPGm/O6F+EyXpvjFNev2Q
         bbmB9SKHU6L0PjEFvSVG2LISn6NaKbHYos/CIvZJ3C82q+AhMu5hsafYKcaE9ujeFAJf
         IU7IFDE6OOpfVCWBghA/Sc7xEeKEgx/1ASvBcrjBzZpEedG79Uz5xkaoZJ69A1GqWtD6
         ks7A==
X-Forwarded-Encrypted: i=1; AHgh+RpppEKU6cnfcx+KBG+kVkPQZ5CMAfLXN2CQg00oPN9PpAkOkQd6q48aNlloS4cZpAruwBN6hi+3aLEO2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9ekv1mM2itO5ODASESygyfnkdcKiR5r4/Zxw2g983iyX2a6AA
	VhFvIo5uVhj8eOdgDQqYE+jihbqgdUZtmteTIKb+WGAAQMxECtbkbR4z
X-Gm-Gg: AfdE7cmcv85jv7r0a0/6hLkx0pzve7QuBCVq2SKHYH3Qf53VNdpVeYAg7blG5zFCCOz
	1HO8UwAgyU5W6BQ1GU071bu0puE4wL7CtyKwepsaLDCgnN4utPmF1GOee1gfSFx2yjd+BLPzeKG
	GOHnsJT4VmB8CTeHw43WB0b6/heSRsvjrnkFI2atxDiWdOeYhsVjbatDvhjRqWJVKi+KaIAHArK
	9oAbiryYDZ6L6Q0+hTNSEchVrunBKOlfCKB8Ke+ocHPUh1ku3vdl9uIAnJbzvQQ8W0+JR3goZHx
	m2G9/AKRLulOoux4wynKfjGDDald0xffgtrfjE6+edpcNFEw2E3fihhcw2PgnTMU2ujGAw0rM7z
	3cC7CF/PBbkaKRpGVVodp3oNTpWScie+pV7knel0axlWCURCy1lk54NxSEjvjtnwEr5DSI2oZKu
	K0GwtAoaNqKnkXBtT0pdOQAbLvzUDbjf4L7kEa5Ts+ouc1QSQg3JL80s8GPj5B6BHrkeILttR6F
	V5unm8Y
X-Received: by 2002:a05:693c:62d0:b0:30c:536e:3a95 with SMTP id 5a478bee46e88-30c84b94ff5mr10920163eec.2.1782743690538;
        Mon, 29 Jun 2026 07:34:50 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30edffa26afsm176604eec.4.2026.06.29.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:34:50 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: leonardo.costa@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Date: Mon, 29 Jun 2026 11:34:32 -0300
Message-ID: <20260629143439.361560-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

We are seeing a regression on Apalis iMX6 where the kernel doesn't boot in the
newest v7.2-rc1 (it was working before, in v7.1). The device tree being used is the imx6q-apalis-eval.dtb. The kernel
configuration used is the one shown below:

    https://gist.github.com/lcosta37/53efdb2fb6e6e0fc05437c7e53b47737

The kernel logs stop almost immediately as the board starts to boot, and I 
don't notice any difference in the logs that points to the cause.

Is this known? We are seeing this behavior on all Apalis iMX6 modules, though
we don't see it on Colibri iMX6, so it is not SoC-specific.

Logs from v7.2-rc1 (not working, printing stops after the last line pasted
here):

    [    0.000000] Booting Linux on physical CPU 0x0
    [    0.000000] Linux version 7.2.0-rc1-0.0.0-devel (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP PREEMPT Sun Jun 28 19:01:31 UTC 2026
    [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
    [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
    [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board
    [    0.000000] Memory policy: Data cache writealloc
    [    0.000000] cma: Reserved 256 MiB at 0x40000000
    [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
    [    0.000000] Zone ranges:
    [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
    [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
    [    0.000000] Movable zone start for each node
    [    0.000000] Early memory node ranges
    [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564 u61440
    [    0.000000] Kernel command line: root=PARTUUID=adb2cea1-02 ro rootwait console=tty1 console=ttymxc0,115200
    [    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
    [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
    [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
    [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
    [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
    [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
    [    0.000000] rcu: Preemptible hierarchical RCU implementation.
    [    0.000000] rcu:     RCU event tracing is enabled.
    [    0.000000]  Trampoline variant of Tasks RCU enabled.
    [    0.000000]  Tracing variant of Tasks RCU enabled.
    [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
    [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
    [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
    [    0.000000] L2C-310 errata 752271 769419 enabled
    [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
    [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
    [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines


Logs from v7.1 (working) (full logs here: https://paste.debian.net/hidden/0f65ae5f)

    [    0.000000] Booting Linux on physical CPU 0x0
    [    0.000000] Linux version 7.1.0-0.0.0-devel (oe-user@oe-host) (arm-tdx-linux-gnueabi-gcc (GCC) 16.1.0, GNU ld (GNU Binutils) 2.46.1) #1 SMP PREEMPT Wed Jun 24 01:36:41 UTC 2026
    [    0.000000] CPU: ARMv7 Processor [412fc09a] revision 10 (ARMv7), cr=10c5387d
    [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
    [    0.000000] OF: fdt: Machine model: Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board
    [    0.000000] Memory policy: Data cache writealloc
    [    0.000000] cma: Reserved 256 MiB at 0x40000000
    [    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
    [    0.000000] Zone ranges:
    [    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
    [    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]
    [    0.000000] Movable zone start for each node
    [    0.000000] Early memory node ranges
    [    0.000000]   node   0: [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000004fffffff]
    [    0.000000] percpu: Embedded 15 pages/cpu s28684 r8192 d24564 u61440
    [    0.000000] pcpu-alloc: s28684 r8192 d24564 u61440 alloc=15*4096
    [    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
    [    0.000000] Kernel command line: root=PARTUUID=4ce4ba92-02 ro rootwait console=tty1 console=ttymxc0,115200
    [    0.000000] printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
    [    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes, linear)
    [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
    [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
    [    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
    [    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
    [    0.000000] rcu: Preemptible hierarchical RCU implementation.
    [    0.000000] rcu:     RCU event tracing is enabled.
    [    0.000000]  Trampoline variant of Tasks RCU enabled.
    [    0.000000]  Tracing variant of Tasks RCU enabled.
    [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
    [    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
    [    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
    [    0.000000] L2C-310 errata 752271 769419 enabled
    [    0.000000] L2C-310 enabling early BRESP for Cortex-A9
    [    0.000000] L2C-310 full line of zeros enabled for Cortex-A9
    [    0.000000] L2C-310 ID prefetch enabled, offset 16 lines
    [    0.000000] L2C-310 dynamic clock gating enabled, standby mode enabled
    [    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB
    [    0.000000] L2C-310: CACHE_ID 0x410000c7, AUX_CTRL 0x76470001
    [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
    [    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
    [    0.000000] Switching to timer-based delay loop, resolution 333ns
    [    0.000001] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps every 715827882841ns
    [    0.000018] clocksource: mxc_timer1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 637086815595 ns
    [    0.001910] Console: colour dummy device 80x30
    [    0.001926] printk: legacy console [tty1] enabled
    [    0.002519] Calibrating delay loop (skipped), value calculated using timer frequency.. 6.00 BogoMIPS (lpj=30000)
    [    0.002561] CPU: Testing write buffer coherency: ok
    [    0.002627] CPU0: Spectre v2: using BPIALL workaround
    [    0.002650] pid_max: default: 32768 minimum: 301
    [    0.002989] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
    [    0.003038] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
    [    0.003430] VFS: Finished mounting rootfs on nullfs
    [    0.004538] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
    [    0.006552] Setting up static identity map for 0x10100000 - 0x10100060
    [    0.006835] rcu: Hierarchical SRCU implementation.
    [    0.006864] rcu:     Max phase no-delay instances is 1000.
    [    0.007320] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
    [    0.008854] smp: Bringing up secondary CPUs ...
    [    0.010035] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
    [    0.010218] CPU1: Spectre v2: using BPIALL workaround
    [    0.011412] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
    [    0.011581] CPU2: Spectre v2: using BPIALL workaround
    [    0.012747] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
    [    0.012917] CPU3: Spectre v2: using BPIALL workaround
    [    0.013109] smp: Brought up 1 node, 4 CPUs
    ...

