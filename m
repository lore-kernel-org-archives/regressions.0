Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589691DF969
	for <regressions@lists.linux.dev>; Mon,  6 Jan 2025 18:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736187347; cv=none; b=mkCIiJ12CpcBLwSUzngJ7lHPXTc53kY8eiyHZPGLyqDEZvFXM07lbSyciquUSL6rlJwFiDBSpKfh3yd0pKuHvX3ia3fpNAUwsbw99V4tbsuodLsVNNvkeoOWm+zSs+BaTAtJetQ5wBVWGPDQb8aRfTlD2vgm41H4R0TNKPmYmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736187347; c=relaxed/simple;
	bh=q2gtw6v1Skb5AaHhxknThx+JrnAtG50eqqWyZ62rMsU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UiXrMsBdJIDONtzJAMqxJIiyecPtDbzzbeWl0kQO9aEVRrvw/RruK99cjbJlvAddRlJSTsZoq64PEX/q486LkdyQZpzcjsWzhmt4gm7HsEMEc6p0eY8q4yJVHrbbXAJxK3yzUSHmgp650xB39CGChsaRZ35K/OtQEIJLzNMfLbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ERHXPY8h; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERHXPY8h"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so4201536137.3
        for <regressions@lists.linux.dev>; Mon, 06 Jan 2025 10:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736187343; x=1736792143; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VN5Cw3crbudGfcIcmXkS1ifmhVZGr8FenAcJZJ7hlcQ=;
        b=ERHXPY8hIAVOfbRpp6aX705A7rm91PgxgFGkVCAkftqSbX2AOlBHQdKqIo9onsJyn0
         6b6upLr6cVpoJ/gx9paPe1x4O/RZplr7EXES8bQO8ymFwkrg+Odph7uWfgis98xEjaPc
         Q9jGqQhFmMq+2HHN4ZlpuP3hkCgETVJuvXbtgFd63uAYCDaFvhQrVuvJ4oeLoY97P6B6
         D7F8cnOP1OyiGuvlV194ALDfQbUZFkccS9JZQrTeMELHtuiVKgI+c4K8fZv6lBIo/wxz
         swLUKktvb24kiXo1cXRshBDuI3HIjdhUPFAGFARVu+HyU1DkvlXVztDpW9eSy8lCCG75
         p0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736187343; x=1736792143;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VN5Cw3crbudGfcIcmXkS1ifmhVZGr8FenAcJZJ7hlcQ=;
        b=fMV7pH6zSdGM4k68aRhjag62q5SR3L8ngBOk8FILq/YomQW4b/t7Hck0xJzu3JdM87
         Pssg47yWNOB68gChVqPSRYEWtWoF/Lj8vWAzIYJUx/qGopCgWEXuLUD6Jl7csGcEp46w
         2h1hNG6F/UpdnoXB5QVfo60bqQIsz2w24FrHKCKa7OtgHSWQqjvpkZlare1LzUwA2iBf
         gvvz1/4z7vOZB+2snwtTo8Zm+nOVeDrRhIA86cOX25D43oAMvgbz/ZCgKFkre1PISkmi
         ibpnITjyNaRgl0X7geHFua+EcG88/KbaWq/9gzLJ/GxULndXrgeOrMXKSHUNAp5GmjEa
         qnYg==
X-Forwarded-Encrypted: i=1; AJvYcCVKdA6FjtAiC8xx85l2DXa34HJi+AcbbYTtKPFJVNjXpYeW92+Sfm4km/neZNg2d8tQTx8OBLvEy5B+lg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyofIyscr2eWOa6REl24ndLRQIPjJ0Rc4oitBVDmWmP0L79vqkp
	/baluXYqIlEM4H3FgKvUv6ofOkYD1l+zllc1+wOK2j7DY6hrKl/iZRLd3I+2/HEl2hqs/0V3O5d
	crroGcNCy+ULPscSJsS75wXcb1n0ynOuIMG1MXg==
X-Gm-Gg: ASbGncu85+dzsj7ljkjYALtEJhsEx/uOL8P1sUzcOTkn+0rscdDmcQqiML1HjOeko1p
	gKv2I3eADhDQBRGEYVEco6cHNP5uSwlz/ctSwlnvIMA33ZZtZatKFdoj1EaNRu0PfQ/Q=
X-Google-Smtp-Source: AGHT+IE8ekRGQeWjNhyVO6JkQ32QEYc+B4kaCdOoL9JJK49mJV2XoHzSAvGl5ySp33eRHOsYperFk7Agqv+8gy0lzow=
X-Received: by 2002:a05:6102:6cf:b0:4b1:16f8:efc4 with SMTP id
 ada2fe7eead31-4b2cc36a2f3mr51453673137.12.1736187342656; Mon, 06 Jan 2025
 10:15:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Jan 2025 23:45:30 +0530
Message-ID: <CA+G9fYsQmFT3m1J0uGfWGJjci8MQoB7BNcmhBR175PAbxx9fBg@mail.gmail.com>
Subject: WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317 enable_work
 (kernel/workqueue.c:4317 (discriminator 1) kernel/workqueue.c:4488
 (discriminator 1))
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-mm <linux-mm@kvack.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following warnings have been noticed on today's Linux next kernel
on the arm64, x86 and arm devices.

This is first seen on next-20250106.
GOOD: next-20241220
BAD: next-20250106

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot warnings logs:
===============
[    0.132875] workqueue: work disable count underflowed
[    0.137989] WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317
enable_work (kernel/workqueue.c:4317 (discriminator 1)
kernel/workqueue.c:4488 (discriminator 1))
[    0.146001] Modules linked in:
[    0.149098] CPU: 1 UID: 0 PID: 23 Comm: cpuhp/1 Not tainted
6.13.0-rc5-next-20250106 #1
[    0.157180] Hardware name: Thundercomm Dragonboard 845c (DT)
[    0.162892] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.169918] pc : enable_work (kernel/workqueue.c:4317
(discriminator 1) kernel/workqueue.c:4488 (discriminator 1))
[    0.173886] lr : enable_work (kernel/workqueue.c:4317
(discriminator 1) kernel/workqueue.c:4488 (discriminator 1))


Boot log:
==============
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x517f803c]
[    0.000000] Linux version 6.13.0-rc5-next-20250106
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 13.3.0-5) 13.3.0, GNU
ld (GNU Binutils for Debian) 2.43.50.20241215) #1 SMP PREEMPT
@1736149226
[    0.000000] KASLR enabled
[    0.000000] Machine model: Thundercomm Dragonboard 845c
[    0.000000] efi: UEFI not found.
[    0.000000] OF: reserved mem:
0x00000000bfffc000..0x00000000bfffffff (16 KiB) nomap non-reusable
mpss-metadata
[    0.000000] Reserved memory: created CMA memory pool at
0x00000000fec00000, size 16 MiB
[    0.000000] OF: reserved mem: initialized node fastrpc, compatible
id shared-dma-pool
[    0.000000] OF: reserved mem:
0x00000000fec00000..0x00000000ffbfffff (16384 KiB) map reusable
fastrpc
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000a84000
(options '115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] OF: reserved mem:
0x0000000085700000..0x0000000085cfffff (6144 KiB) nomap non-reusable
hyp-mem@85700000
[    0.000000] OF: reserved mem:
0x0000000085e00000..0x0000000085efffff (1024 KiB) nomap non-reusable
xbl-mem@85e00000
[    0.000000] OF: reserved mem:
0x0000000085fc0000..0x0000000085fdffff (128 KiB) nomap non-reusable
aop-mem@85fc0000
[    0.000000] OF: reserved mem:
0x0000000085fe0000..0x0000000085ffffff (128 KiB) nomap non-reusable
aop-cmd-db-mem@85fe0000
[    0.000000] OF: reserved mem:
0x0000000086000000..0x00000000861fffff (2048 KiB) nomap non-reusable
smem@86000000
[    0.000000] OF: reserved mem:
0x0000000086200000..0x0000000088efffff (46080 KiB) nomap non-reusable
tz@86200000
[    0.000000] OF: reserved mem:
0x0000000088f00000..0x00000000890fffff (2048 KiB) nomap non-reusable
rmtfs@88f00000
[    0.000000] OF: reserved mem:
0x000000008ab00000..0x000000008befffff (20480 KiB) nomap non-reusable
qseecom@8ab00000
[    0.000000] OF: reserved mem:
0x000000008bf00000..0x000000008c3fffff (5120 KiB) nomap non-reusable
camera-mem@8bf00000
[    0.000000] OF: reserved mem:
0x000000008c400000..0x000000008c40ffff (64 KiB) nomap non-reusable
ipa-fw@8c400000
[    0.000000] OF: reserved mem:
0x000000008c410000..0x000000008c414fff (20 KiB) nomap non-reusable
ipa-gsi@8c410000
[    0.000000] OF: reserved mem:
0x000000008c415000..0x000000008c416fff (8 KiB) nomap non-reusable
gpu@8c415000
[    0.000000] OF: reserved mem:
0x000000008c500000..0x000000008defffff (26624 KiB) nomap non-reusable
adsp@8c500000
[    0.000000] OF: reserved mem:
0x000000008df00000..0x000000008dffffff (1024 KiB) nomap non-reusable
wlan-msa@8df00000
[    0.000000] OF: reserved mem:
0x000000008e000000..0x00000000957fffff (122880 KiB) nomap non-reusable
mpss@8e000000
[    0.000000] OF: reserved mem:
0x0000000095800000..0x0000000095cfffff (5120 KiB) nomap non-reusable
venus@95800000
[    0.000000] OF: reserved mem:
0x0000000095d00000..0x00000000964fffff (8192 KiB) nomap non-reusable
cdsp@95d00000
[    0.000000] OF: reserved mem:
0x0000000096500000..0x00000000966fffff (2048 KiB) nomap non-reusable
mba@96500000
[    0.000000] OF: reserved mem:
0x0000000096700000..0x0000000097afffff (20480 KiB) nomap non-reusable
slpi@96700000
[    0.000000] OF: reserved mem:
0x0000000097b00000..0x0000000097bfffff (1024 KiB) nomap non-reusable
spss@97b00000
[    0.000000] OF: reserved mem:
0x000000009d400000..0x000000009f7fffff (36864 KiB) nomap non-reusable
framebuffer@9d400000
[    0.000000] NUMA: Faking a node at [mem
0x0000000080000000-0x000000017df9ffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x17d56dfc0-0x17d5705ff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000017df9ffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000856fffff]
[    0.000000]   node   0: [mem 0x0000000085700000-0x0000000085cfffff]
[    0.000000]   node   0: [mem 0x0000000085d00000-0x0000000085dfffff]
[    0.000000]   node   0: [mem 0x0000000085e00000-0x0000000085efffff]
[    0.000000]   node   0: [mem 0x0000000085f00000-0x0000000085fbffff]
[    0.000000]   node   0: [mem 0x0000000085fc0000-0x00000000890fffff]
[    0.000000]   node   0: [mem 0x0000000089100000-0x000000008aafffff]
[    0.000000]   node   0: [mem 0x000000008ab00000-0x000000008c416fff]
[    0.000000]   node   0: [mem 0x000000008c417000-0x000000008c4fffff]
[    0.000000]   node   0: [mem 0x000000008c500000-0x0000000097bfffff]
[    0.000000]   node   0: [mem 0x0000000097c00000-0x000000009d3fffff]
[    0.000000]   node   0: [mem 0x000000009d400000-0x000000009f7fffff]
[    0.000000]   node   0: [mem 0x000000009f800000-0x00000000bfffbfff]
[    0.000000]   node   0: [mem 0x00000000bfffc000-0x00000000bfffffff]
[    0.000000]   node   0: [mem 0x00000000c0000000-0x000000017df9ffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000017df9ffff]
[    0.000000] On node 0, zone Normal: 8288 pages in unavailable ranges
[    0.000000] cma: Reserved 32 MiB at 0x00000000fcc00000 on node -1
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] psci: OSI mode supported.
[    0.000000] psci: [Firmware Bug]: failed to set PC mode: -3
[    0.000000] percpu: Embedded 34 pages/cpu s100568 r8192 d30504 u139264
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: root=/dev/sda1 init=/sbin/init rw
console=tty0 console=ttyMSM0,115200n8 earlycon clk_ignore_unused
pd_ignore_unused --  androidboot.bootdevice=1d84000.ufshc
androidboot.serialno=25564f71 androidboot.baseband=msm
msm_drm.dsi_display0=dsi_lt9611_1080_video_display:
androidboot.dtb_idx=-1347440721
[    0.000000] printk: log buffer data + meta data: 131072 + 458752 =
589824 bytes
[    0.000000] Dentry cache hash table entries: 524288 (order: 10,
4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9,
2097152 bytes, linear)
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1040288
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem
0x00000000f8c00000-0x00000000fcc00000] (64MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] ftrace: allocating 73407 entries in 287 pages
[    0.000000] ftrace: allocated 287 pages with 6 groups
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: RCU event tracing is enabled.
[    0.000000] rcu: RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8.
[    0.000000] Trampoline variant of Tasks RCU enabled.
[    0.000000] Rude variant of Tasks RCU enabled.
[    0.000000] Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] RCU Tasks: Setting shift to 3 and lim to 1
rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] RCU Tasks Rude: Setting shift to 3 and lim to 1
rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1
rcu_task_cb_adjust=1 rcu_task_cpu_ids=8.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: 768 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: GICD_CTRL.DS=0, SCR_EL3.FIQ=1
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000017a60000
[    0.000000] ITS: No ITS available, not enabling LPIs
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 19.20MHz
(virt/virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000001] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps
every 4398046511078ns
[    0.008653] kfence: initialized - using 2097152 bytes for 255
objects at 0x(____ptrval____)-0x(____ptrval____)
[    0.019000] Console: colour dummy device 80x25
[    0.023514] printk: legacy console [tty0] enabled
[    0.029284] Calibrating delay loop (skipped), value calculated
using timer frequency.. 38.40 BogoMIPS (lpj=76800)
[    0.039664] pid_max: default: 32768 minimum: 301
[    0.044418] LSM: initializing lsm=capability
[    0.048953] Mount-cache hash table entries: 8192 (order: 4, 65536
bytes, linear)
[    0.056455] Mountpoint-cache hash table entries: 8192 (order: 4,
65536 bytes, linear)
[    0.069764] rcu: Hierarchical SRCU implementation.
[    0.074640] rcu: Max phase no-delay instances is 1000.
[    0.080301] Timer migration: 1 hierarchy levels; 8 children per
group; 1 crossnode level
[    0.094672] EFI services will not be available.
[    0.099849] smp: Bringing up secondary CPUs ...
[    0.110015] Detected VIPT I-cache on CPU1
[    0.110118] GICv3: CPU1: found redistributor 100 region 0:0x0000000017a80000
[    0.110192] CPU1: Booted secondary processor 0x0000000100 [0x517f803c]
[    0.110470] ------------[ cut here ]------------
[    0.132875] workqueue: work disable count underflowed
[    0.137989] WARNING: CPU: 1 PID: 23 at kernel/workqueue.c:4317
enable_work (kernel/workqueue.c:4317 (discriminator 1)
kernel/workqueue.c:4488 (discriminator 1))
[    0.146001] Modules linked in:
[    0.149098] CPU: 1 UID: 0 PID: 23 Comm: cpuhp/1 Not tainted
6.13.0-rc5-next-20250106 #1
[    0.157180] Hardware name: Thundercomm Dragonboard 845c (DT)
[    0.162892] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.169918] pc : enable_work (kernel/workqueue.c:4317
(discriminator 1) kernel/workqueue.c:4488 (discriminator 1))
[    0.173886] lr : enable_work (kernel/workqueue.c:4317
(discriminator 1) kernel/workqueue.c:4488 (discriminator 1))
[    0.177852] sp : ffff800080253d00
[    0.181202] x29: ffff800080253d20 x28: 0000000000000000 x27: ffff83a5bab7b000
[    0.188404] x26: 0000000000000000 x25: ffffb2a8c0541ab0 x24: ffff364e7d46d128
[    0.195605] x23: 00000000000000ef x22: ffff364e7d46d150 x21: ffffb2a8c28f2128
[    0.202808] x20: 00000000000000c4 x19: ffff364e7d47cd68 x18: 0000000000000006
[    0.210008] x17: 00000000f0000000 x16: 0000000000000000 x15: 076407650777076f
[    0.217209] x14: 076c076607720765 x13: 076407650777076f x12: 076c076607720765
[    0.224410] x11: 0720072007200720 x10: ffffb2a8c2a7ddd0 x9 : ffffb2a8c034ba98
[    0.231610] x8 : 00000000ffffefff x7 : ffffb2a8c2a7ddd0 x6 : 80000000fffff000
[    0.238811] x5 : 0000000000000080 x4 : 0000000000000000 x3 : 0000000000000000
[    0.246012] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff364e00376040
[    0.253213] Call trace:
[    0.255689] enable_work (kernel/workqueue.c:4317 (discriminator 1)
kernel/workqueue.c:4488 (discriminator 1)) (P)
[    0.259658] enable_delayed_work (kernel/workqueue.c:4532)
[    0.263807] vmstat_cpu_online (mm/vmstat.c:2154)
[    0.267778] cpuhp_invoke_callback (kernel/cpu.c:194)
[    0.272269] cpuhp_thread_fun (kernel/cpu.c:1103 (discriminator 1))
[    0.276235] smpboot_thread_fn (kernel/smpboot.c:164)
[    0.280386] kthread (kernel/kthread.c:464)
[    0.283652] ret_from_fork (arch/arm64/kernel/entry.S:863)
[    0.287274] ---[ end trace 0000000000000000 ]---
[    0.298401] Detected VIPT I-cache on CPU2
[    0.298485] GICv3: CPU2: found redistributor 200 region 0:0x0000000017aa0000
[    0.298550] CPU2: Booted secondary processor 0x0000000200 [0x517f803c]
[    0.306388] Detected VIPT I-cache on CPU3
[    0.306468] GICv3: CPU3: found redistributor 300 region 0:0x0000000017ac0000
[    0.306527] CPU3: Booted secondary processor 0x0000000300 [0x517f803c]
[    0.315084] CPU features: detected: Spectre-v2
[    0.315105] Detected VIPT I-cache on CPU4
[    0.315173] GICv3: CPU4: found redistributor 400 region 0:0x0000000017ae0000
[    0.315225] CPU4: Booted secondary processor 0x0000000400 [0x516f802d]
[    0.322740] Detected VIPT I-cache on CPU5
[    0.322817] GICv3: CPU5: found redistributor 500 region 0:0x0000000017b00000
[    0.322871] CPU5: Booted secondary processor 0x0000000500 [0x516f802d]
[    0.327072] Detected VIPT I-cache on CPU6
[    0.327147] GICv3: CPU6: found redistributor 600 region 0:0x0000000017b20000
[    0.327201] CPU6: Booted secondary processor 0x0000000600 [0x516f802d]
[    0.335229] Detected VIPT I-cache on CPU7
[    0.335308] GICv3: CPU7: found redistributor 700 region 0:0x0000000017b40000
[    0.335360] CPU7: Booted secondary processor 0x0000000700 [0x516f802d]
[    0.335569] smp: Brought up 1 node, 8 CPUs
[    0.450888] SMP: Total of 8 processors activated.
[    0.455668] CPU: All CPU(s) started at EL1

Links:
-------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250106/testrun/26594096/suite/boot/test/gcc-13-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250106/testrun/26592072/suite/log-parser-boot/test/exception-workqueue-work-disable-count-underflowed/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250106/testrun/26594096/suite/boot/test/gcc-13-lkftconfig/details/

metadata:
----
  git sha: 4e16367cfe0ce395f29d0482b78970cce8e1db73
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2rFJUe87FqRoHFiJmd3YnlXgUUD/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2rFJUe87FqRoHFiJmd3YnlXgUUD/
  toolchain: clang, gcc-13, gcc-8
  arch: arm64, arm, riscv64 and x86

--
Linaro LKFT
https://lkft.linaro.org
