Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1751EA920
	for <regressions@lists.linux.dev>; Sat,  2 Aug 2025 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754129766; cv=none; b=JZdXCAgG7g5XbjNHxC8LpjOfXWD4ZcSLoIghYXA3YBtXVM+ajgBuEKAo5pxaHaOyfC004MIy4m+rBAph/T+LzyEj3mz2D1sZf7G7vY+wgGs3LQSDEuNlxIhX5pwALKxZJ/O4e1Mk4sC/XFne67HUivByDxxs7I7a+ybF93n9AYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754129766; c=relaxed/simple;
	bh=VLBu6DyTzVXilmskkx0JVk5OK/zXd+ADFGIetjIht+s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TgO5SNO2RUhq0PWUeHayv+si9P7vC7wJkSVT5wfeAn1oEf/gFoxmXr8xz+kM9GXh9XAioz709vVyPQ8c/pBvrhX/3AjoXeKH2CDPeWhH/FashYc4489GAswwVSoGRr9wqDDxeuOTt8FcP+xnZps2IWuR9RitVDgkXhwJ2d3X/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g40FbOGL; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g40FbOGL"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b42254ea4d5so1097666a12.1
        for <regressions@lists.linux.dev>; Sat, 02 Aug 2025 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754129763; x=1754734563; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1S8mfF4yYCy8B4bXgYdauCpYCVAjJ9auaBJ+UVNv+0=;
        b=g40FbOGLcWnyAoBmWzf2g9I6x8R2qPZtD5cQPv1HkcbiLkyh5lf19EkzBUmW/Bn5Dj
         CFs5vfTVYNQ2lKSCX2r0nLOB51d5uFbvbAy0iTQ0g7NNRBHAz3JysgObPP7AVlswtpyp
         +Dcs/GHDrBlEhhs4B2WPEPbLqdAUFUiBd5bL5Uj36nYDOQ9vnTJbIgTx+buuSzdhKVbj
         Lv+D+0KvTdI8BYhX6MZErmjdlgm5Knemp4xJKm9QrS1ZBtf5robwZNzjQ1mJIzFtRJPY
         eQ5Hlu1edVP2W5gzV7Tkheo6JyG3+GjROTKcSEycn4e+lXStjDFf5/3xLODL+wiRtqKQ
         Smbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754129763; x=1754734563;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1S8mfF4yYCy8B4bXgYdauCpYCVAjJ9auaBJ+UVNv+0=;
        b=nMrEkN6pdOYx7B9LppbuqB2RNexDhiWZRVUmn/z0Ga1qe9YJYfyrfg53SbrswCPUEE
         oHGd58ZKhfsv3vHmzZNTvmWQ5bRKdIBRiHd/i4v0WXiEZhuENRvn7Eh+XJaJQKeyGUiN
         Mm08dx0d2iLzPkAd2vChBkWKItS/pKzYKu0jFFXOvBrkKGw5I8iptWju35CQvA0xpsRM
         lCm0SYAJhF4M7aluXMtEgrGLrdkpk2MtGFYzzfI/yC4IeuD8tekMWWiga43jvvlJR4RV
         jyjcuAsTT1STjtXnxHcDsJKuceVdDQ0U87XL62nFY0GaQIcD5ZZUtAeG0qr/hOgpC79F
         c7ig==
X-Forwarded-Encrypted: i=1; AJvYcCUhq3f12Gcy+olyZWTEvmpfihT36WWFPA1gllyjU6rXee4UNHNh9p5ocmk7TiiGarGP6T+Iamepkx7nwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbsLGJpqRBnXsoQGzt4f/Ev96ED1EVFPM5vTOhNUd38cP8SrRi
	tbVfnIv35+ma/y1q692pOO3mD4r2fzLFBsbYUgvJdS68Vbq9ywMpQyFI4m2WrvJnz4J0cNG16Xo
	ad6JENQcLzQMidhFAOvt8JnpJqYhnRczQvdfupEJlle7DBeHr3HnkMnE=
X-Gm-Gg: ASbGncsUUjObrmfs9ojcg2c8JXC+fVHuCAbTQexeOYp6uW4Hl/rArF3nnuH+fnZYB+R
	v/d9/5upxuxX+sMEtj36u6W4pzo3/bcro5yglMoz/89BWanmzPtSqm/uR747c1YDwv9l8JCrTlk
	xWXjD3QK4oTQGEus1w3q2tXTLOgzRxE3Trv1b2bo6RwVdOVT4vafE9rATH17sMbF+kNtUBPCTDX
	g+6Xz9W
X-Google-Smtp-Source: AGHT+IF5DdVFCKng2f5KqZFnrae99+X5k+Qmt2j+m7XSzt/2UvT45SCww97ZXS2/SMN5PQsRNiQICu4c2ULMe/0+YEk=
X-Received: by 2002:a17:902:c40b:b0:240:49e8:1d38 with SMTP id
 d9443c01a7336-2424703f6b1mr38407935ad.35.1754129763175; Sat, 02 Aug 2025
 03:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 2 Aug 2025 15:45:51 +0530
X-Gm-Features: Ac12FXw5_ZolpvO5uI042bQDw80SWA9aZEkdOVC4W_T6xjrKpa2_HnxdtLqpkgM
Message-ID: <CA+G9fYumD2MGjECCv0wx2V_96_FKNtFQpT63qVNrrCmomoPYVQ@mail.gmail.com>
Subject: next-20250729: PREEMPT_RT: rock Pi 4b Internal error Oops
 kmem_cache_alloc_bulk_noprof - kernel locking rtmutex.c at __rt_mutex_slowlock_locked
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions found while validating Linux next on the Radxa Rock Pi 4B
platform, we observed kernel crashes and deadlock warnings when running LTP
syscall and controller tests under specific PREEMPT_RT configurations.
These issues appear to be regressions introduced in next-20250729.

* CONFIG_EXPERT=y
* CONFIG_PREEMPT_RT=y
* CONFIG_LAZY_PREEMPT=y

Regression Analysis:
- New regression? Yes
- Reproducibility? Intermittent

First seen on the next-20250729
Good: next-20250728
Bad: next-20250729 and next-20250801

Test regression: next-20250729 rock Pi 4b Internal error Oops
kmem_cache_alloc_bulk_noprof
Test regression: next-20250729 rock Pi 4b WARNING kernel locking
rtmutex.c at __rt_mutex_slowlock_locked
Test regression: next-20250729 rock Pi 4b WARNING kernel rcu
tree_plugin.h at rcu_note_context_switch

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
[  527.570253] Unable to handle kernel paging request at virtual
address 003f0020f94020a1
[  527.570274] Mem abort info:
[  527.570277]   ESR = 0x0000000096000004
[  527.570282]   EC = 0x25: DABT (current EL), IL = 32 bits
[  527.570288]   SET = 0, FnV = 0
[  527.570292]   EA = 0, S1PTW = 0
[  527.570297]   FSC = 0x04: level 0 translation fault
[  527.570302] Data abort info:
[  527.570305]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  527.570310]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  527.570316]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  527.570322] [003f0020f94020a1] address between user and kernel address ranges
[  527.570330] Internal error: Oops: 0000000096000004 [#1]  SMP
[  527.570336] Modules linked in: brcmfmac rockchip_dfi brcmutil
cfg80211 snd_soc_hdmi_codec dw_hdmi_i2s_audio dw_hdmi_cec
snd_soc_simple_card snd_soc_audio_graph_card hci_uart
snd_soc_rockchip_i2s snd_soc_es8316 snd_soc_spdif_tx
snd_soc_simple_card_utils btqca rtc_rk808 rockchipdrm btbcm
snd_soc_core dw_hdmi_qp bluetooth snd_compress reset_gpio analogix_dp
snd_pcm_dmaengine panfrost hantro_vpu dw_mipi_dsi rfkill rockchip_rga
drm_shmem_helper drm_dp_aux_bus snd_pcm gpu_sched dw_hdmi pwrseq_core
videobuf2_dma_sg v4l2_vp9 snd_timer drm_display_helper v4l2_h264
v4l2_jpeg phy_rockchip_pcie snd v4l2_mem2mem cec videobuf2_dma_contig
soundcore videobuf2_memops drm_client_lib videobuf2_v4l2
drm_dma_helper videobuf2_common rockchip_saradc drm_kms_helper
industrialio_triggered_buffer kfifo_buf rockchip_thermal
pcie_rockchip_host coresight_cpu_debug fuse drm backlight
[  527.570493] CPU: 3 UID: 0 PID: 34254 Comm: mkdir Not tainted
6.16.0-next-20250801 #1 PREEMPT_RT
[  527.570502] Hardware name: Radxa ROCK Pi 4B (DT)
[  527.570506] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  527.570512] pc : kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
(discriminator 1) mm/slub.c:5403 (discriminator 1))
[  527.570527] lr : kmem_cache_alloc_bulk_noprof
(include/linux/atomic/atomic-arch-fallback.h:457
include/linux/atomic/atomic-instrumented.h:33
include/linux/kfence.h:127 mm/slub.c:5307 mm/slub.c:5403)
[  527.570533] sp : ffff80008e24b8f0
[  527.570536] x29: ffff80008e24b930 x28: 00ff000000584610 x27: ffff800082b30538
[  527.570545] x26: ffff8000816b64dc x25: 0000000000000cc0 x24: 0000000000000000
[  527.570554] x23: 0000000000000004 x22: ffff0000f7579d20 x21: 0000000000000001
[  527.570563] x20: 0000000000000001 x19: ffff000000405b00 x18: ffff80008e24bcd0
[  527.570572] x17: 0000000000000000 x16: ffff800081e18420 x15: 0000ffffa2670fff
[  527.570582] x14: 0000000000000000 x13: 1fffe000017942e1 x12: 0000ffffa2470fff
[  527.570591] x11: ffff00000bca1708 x10: 0000000000000001 x9 : ffff8000816e41a4
[  527.570600] x8 : ffff80008e24b850 x7 : fefefefefefefefe x6 : ffff800082b30000
[  527.570608] x5 : d63f0020f9402021 x4 : ffff0000f7579d58 x3 : 0000000000000000
[  527.570617] x2 : 0000000000000000 x1 : 0000000000000100 x0 : 0000000000000080
[  527.570627] Call trace:
[  527.570631] kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
(discriminator 1) mm/slub.c:5403 (discriminator 1)) (P)
[  527.570639] mas_alloc_nodes (lib/maple_tree.c:1278)
[  527.570651] mas_node_count_gfp (lib/maple_tree.c:1339)
[  527.570661] mas_preallocate (lib/maple_tree.c:5538 (discriminator 1))
[  527.570667] __split_vma (mm/vma.c:528 (discriminator 1))
[  527.570677] vma_modify (mm/vma.c:1633)
[  527.570685] vma_modify_flags (mm/vma.c:1650)
[  527.570694] mprotect_fixup (mm/mprotect.c:819)
[  527.570704] do_mprotect_pkey (mm/mprotect.c:993)
[  527.570713] __arm64_sys_mprotect (mm/mprotect.c:1011)
[  527.570722] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[  527.570731] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[  527.570737] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[  527.570744] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:169 (discriminator 1)
arch/arm64/kernel/entry-common.c:182 (discriminator 1)
arch/arm64/kernel/entry-common.c:880 (discriminator 1))
[  527.570752] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:899)
[  527.570760] el0t_64_sync (arch/arm64/kernel/entry.S:596)
[ 527.570772] Code: 1400000c f94002c5 b4000aa5 b9402a60 (f86068a0)
All code
========
   0: 1400000c b 0x30
   4: f94002c5 ldr x5, [x22]
   8: b4000aa5 cbz x5, 0x15c
   c: b9402a60 ldr w0, [x19, #40]
  10:* f86068a0 ldr x0, [x5, x0] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f86068a0 ldr x0, [x5, x0]
[  527.570778] ---[ end trace 0000000000000000 ]---
[  527.570800] ------------[ cut here ]------------
[  527.570803] rtmutex deadlock detected
[  527.570827] WARNING: kernel/locking/rtmutex.c:1674 at
__rt_mutex_slowlock_locked.constprop.0+0x800/0x8e0, CPU#3: mkdir/34254
[  527.570841] Modules linked in: brcmfmac rockchip_dfi brcmutil
cfg80211 snd_soc_hdmi_codec dw_hdmi_i2s_audio dw_hdmi_cec
snd_soc_simple_card snd_soc_audio_graph_card hci_uart
snd_soc_rockchip_i2s snd_soc_es8316 snd_soc_spdif_tx
snd_soc_simple_card_utils btqca rtc_rk808 rockchipdrm btbcm
snd_soc_core dw_hdmi_qp bluetooth snd_compress reset_gpio analogix_dp
snd_pcm_dmaengine panfrost hantro_vpu dw_mipi_dsi rfkill rockchip_rga
drm_shmem_helper drm_dp_aux_bus snd_pcm gpu_sched dw_hdmi pwrseq_core
videobuf2_dma_sg v4l2_vp9 snd_timer drm_display_helper v4l2_h264
v4l2_jpeg phy_rockchip_pcie snd v4l2_mem2mem cec videobuf2_dma_contig
soundcore videobuf2_memops drm_client_lib videobuf2_v4l2
drm_dma_helper videobuf2_common rockchip_saradc drm_kms_helper
industrialio_triggered_buffer kfifo_buf rockchip_thermal
pcie_rockchip_host coresight_cpu_debug fuse drm backlight
[  527.570965] CPU: 3 UID: 0 PID: 34254 Comm: mkdir Tainted: G      D
           6.16.0-next-20250801 #1 PREEMPT_RT
[  527.570973] Tainted: [D]=DIE
[  527.570976] Hardware name: Radxa ROCK Pi 4B (DT)
[  527.570979] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  527.570985] pc : __rt_mutex_slowlock_locked.constprop.0
(kernel/locking/rtmutex.c:1674 (discriminator 1)
kernel/locking/rtmutex.c:1734 (discriminator 1)
kernel/locking/rtmutex.c:1760 (discriminator 1))
[  527.570993] lr : __rt_mutex_slowlock_locked.constprop.0
(kernel/locking/rtmutex.c:1674 (discriminator 1)
kernel/locking/rtmutex.c:1734 (discriminator 1)
kernel/locking/rtmutex.c:1760 (discriminator 1))
[  527.571001] sp : ffff80008e24b2e0
[  527.571004] x29: ffff80008e24b370 x28: ffff000007c1a600 x27: ffff000007c1a601
[  527.571013] x26: ffff80008e24b318 x25: ffff000007c1a600 x24: 00000000ffffffdd
[  527.571023] x23: 00000000ffffffdd x22: 0000000000000001 x21: ffff000007c1a601
[  527.571032] x20: ffff80008e24b2f0 x19: ffff00001d756e30 x18: 0000000000000000
[  527.571041] x17: 65676e6172207373 x16: 6572646461206c65 x15: 0000000000000000
[  527.571050] x14: 0000000000000020 x13: 0a64657463657465 x12: 64206b636f6c6461
[  527.571059] x11: 656820747563205b x10: ffff800082adac08 x9 : ffff80008015020c
[  527.571068] x8 : ffff80008e24af08 x7 : 0000000000000001 x6 : ffff800082a5e000
[  527.571077] x5 : ffff000007c1a600 x4 : 0000000000000000 x3 : 0000000000000027
[  527.571086] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000007c1a600
[  527.571094] Call trace:
[  527.571097] __rt_mutex_slowlock_locked.constprop.0
(kernel/locking/rtmutex.c:1674 (discriminator 1)
kernel/locking/rtmutex.c:1734 (discriminator 1)
kernel/locking/rtmutex.c:1760 (discriminator 1)) (P)
[  527.571107] __rwbase_read_lock (kernel/locking/rwbase_rt.c:114)
[  527.571117] down_read (kernel/locking/rwsem.c:1540)
[  527.571126] acct_collect (arch/arm64/include/asm/jump_label.h:36
include/linux/mmap_lock.h:41 include/linux/mmap_lock.h:454
kernel/acct.c:597)
[  527.571135] do_exit (kernel/exit.c:932)
[  527.571143] make_task_dead
(arch/arm64/include/asm/atomic_ll_sc.h:95 (discriminator 2)
arch/arm64/include/asm/atomic.h:52 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:564 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:1020 (discriminator 2)
include/linux/atomic/atomic-instrumented.h:454 (discriminator 2)
kernel/exit.c:1049 (discriminator 2))
[  527.571150] die (arch/arm64/kernel/traps.c:231)
[  527.571157] die_kernel_fault (arch/arm64/mm/fault.c:313)
[  527.571167] __do_kernel_fault (arch/arm64/mm/fault.c:375 (discriminator 5))
[  527.571177] do_bad_area (arch/arm64/mm/fault.c:482)
[  527.571186] do_translation_fault (arch/arm64/mm/fault.c:792)
[  527.571195] do_mem_abort (arch/arm64/mm/fault.c:929 (discriminator 1))
[  527.571204] el1_abort (arch/arm64/include/asm/daifflags.h:28
arch/arm64/kernel/entry-common.c:482)
[  527.571210] el1h_64_sync_handler (arch/arm64/kernel/entry-common.c:637)
[  527.571218] el1h_64_sync (arch/arm64/kernel/entry.S:591)
[  527.571225] kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
(discriminator 1) mm/slub.c:5403 (discriminator 1)) (P)
[  527.571232] mas_alloc_nodes (lib/maple_tree.c:1278)
[  527.571241] mas_node_count_gfp (lib/maple_tree.c:1339)
[  527.571251] mas_preallocate (lib/maple_tree.c:5538 (discriminator 1))
[  527.571257] __split_vma (mm/vma.c:528 (discriminator 1))
[  527.571265] vma_modify (mm/vma.c:1633)
[  527.571273] vma_modify_flags (mm/vma.c:1650)
[  527.571282] mprotect_fixup (mm/mprotect.c:819)
[  527.571290] do_mprotect_pkey (mm/mprotect.c:993)
[  527.571299] __arm64_sys_mprotect (mm/mprotect.c:1011)
[  527.571308] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[  527.571314] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[  527.571321] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[  527.571327] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:169 (discriminator 1)
arch/arm64/kernel/entry-common.c:182 (discriminator 1)
arch/arm64/kernel/entry-common.c:880 (discriminator 1))
[  527.571334] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:899)
[  527.571341] el0t_64_sync (arch/arm64/kernel/entry.S:596)
[  527.571349] ---[ end trace 0000000000000000 ]---
[  527.571354] ------------[ cut here ]------------
[  527.571356] Voluntary context switch within RCU read-side critical section!
[  527.571372] WARNING: kernel/rcu/tree_plugin.h:332 at
rcu_note_context_switch+0x4ec/0x538, CPU#3: mkdir/34254
[  527.571383] Modules linked in: brcmfmac rockchip_dfi brcmutil
cfg80211 snd_soc_hdmi_codec dw_hdmi_i2s_audio dw_hdmi_cec
snd_soc_simple_card snd_soc_audio_graph_card hci_uart
snd_soc_rockchip_i2s snd_soc_es8316 snd_soc_spdif_tx
snd_soc_simple_card_utils btqca rtc_rk808 rockchipdrm btbcm
snd_soc_core dw_hdmi_qp bluetooth snd_compress reset_gpio analogix_dp
snd_pcm_dmaengine panfrost hantro_vpu dw_mipi_dsi rfkill rockchip_rga
drm_shmem_helper drm_dp_aux_bus snd_pcm gpu_sched dw_hdmi pwrseq_core
videobuf2_dma_sg v4l2_vp9 snd_timer drm_display_helper v4l2_h264
v4l2_jpeg phy_rockchip_pcie snd v4l2_mem2mem cec videobuf2_dma_contig
soundcore videobuf2_memops drm_client_lib videobuf2_v4l2
drm_dma_helper videobuf2_common rockchip_saradc drm_kms_helper
industrialio_triggered_buffer kfifo_buf rockchip_thermal
pcie_rockchip_host coresight_cpu_debug fuse drm backlight
[  527.571503] CPU: 3 UID: 0 PID: 34254 Comm: mkdir Tainted: G      D
W           6.16.0-next-20250801 #1 PREEMPT_RT
[  527.571512] Tainted: [D]=DIE, [W]=WARN
[  527.571514] Hardware name: Radxa ROCK Pi 4B (DT)
[  527.571517] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  527.571523] pc : rcu_note_context_switch
(kernel/rcu/tree_plugin.h:332 (discriminator 1))
[  527.571529] lr : rcu_note_context_switch
(kernel/rcu/tree_plugin.h:332 (discriminator 1))
[  527.571535] sp : ffff80008e24b1e0
[  527.571538] x29: ffff80008e24b1e0 x28: ffff000007c1a600 x27: ffff000007c1a601
[  527.571548] x26: 0000000000000000 x25: ffff000007c1a600 x24: ffff800082a60368
[  527.571557] x23: 0000000000000000 x22: ffff000007c1a600 x21: ffff800083125260
[  527.571566] x20: 0000000000000000 x19: ffff0000f7576080 x18: 0000000000000000
[  527.571575] x17: 65676e6172207373 x16: 6572646461206c65 x15: 0000000000000000
[  527.571583] x14: 0000000000000020 x13: 216e6f6974636573 x12: 206c616369746972
[  527.571593] x11: 6320656469732d64 x10: 6165722055435220 x9 : ffff80008015020c
[  527.571602] x8 : 6863746977732074 x7 : 7865746e6f632079 x6 : 7261746e756c6f56
[  527.571611] x5 : ffff80008317146f x4 : 0000000000000000 x3 : 0000000000000027
[  527.571619] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000007c1a600
[  527.571628] Call trace:
[  527.571630] rcu_note_context_switch (kernel/rcu/tree_plugin.h:332
(discriminator 1)) (P)
[  527.571638] __schedule (kernel/sched/core.c:634
kernel/sched/sched.h:1519 kernel/sched/sched.h:1841
kernel/sched/core.c:6865)
[  527.571647] rt_mutex_schedule (kernel/sched/core.c:7044
kernel/sched/core.c:7339)
[  527.571655] __rt_mutex_slowlock_locked.constprop.0
(kernel/locking/rtmutex.c:1676 kernel/locking/rtmutex.c:1734
kernel/locking/rtmutex.c:1760)
[  527.571665] __rwbase_read_lock (kernel/locking/rwbase_rt.c:114)
[  527.571674] down_read (kernel/locking/rwsem.c:1540)
[  527.571683] acct_collect (arch/arm64/include/asm/jump_label.h:36
include/linux/mmap_lock.h:41 include/linux/mmap_lock.h:454
kernel/acct.c:597)
[  527.571690] do_exit (kernel/exit.c:932)
[  527.571696] make_task_dead
(arch/arm64/include/asm/atomic_ll_sc.h:95 (discriminator 2)
arch/arm64/include/asm/atomic.h:52 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:564 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:1020 (discriminator 2)
include/linux/atomic/atomic-instrumented.h:454 (discriminator 2)
kernel/exit.c:1049 (discriminator 2))
[  527.571703] die (arch/arm64/kernel/traps.c:231)
[  527.571710] die_kernel_fault (arch/arm64/mm/fault.c:313)
[  527.571719] __do_kernel_fault (arch/arm64/mm/fault.c:375 (discriminator 5))
[  527.571729] do_bad_area (arch/arm64/mm/fault.c:482)
[  527.571738] do_translation_fault (arch/arm64/mm/fault.c:792)
[  527.571746] do_mem_abort (arch/arm64/mm/fault.c:929 (discriminator 1))
[  527.571755] el1_abort (arch/arm64/include/asm/daifflags.h:28
arch/arm64/kernel/entry-common.c:482)
[  527.571761] el1h_64_sync_handler (arch/arm64/kernel/entry-common.c:637)
[  527.571769] el1h_64_sync (arch/arm64/kernel/entry.S:591)
[  527.571775] kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
(discriminator 1) mm/slub.c:5403 (discriminator 1)) (P)
[  527.571782] mas_alloc_nodes (lib/maple_tree.c:1278)
[  527.571792] mas_node_count_gfp (lib/maple_tree.c:1339)
[  527.571802] mas_preallocate (lib/maple_tree.c:5538 (discriminator 1))
[  527.571808] __split_vma (mm/vma.c:528 (discriminator 1))
[  527.571816] vma_modify (mm/vma.c:1633)
[  527.571824] vma_modify_flags (mm/vma.c:1650)
[  527.571833] mprotect_fixup (mm/mprotect.c:819)
[  527.571842] do_mprotect_pkey (mm/mprotect.c:993)
[  527.571850] __arm64_sys_mprotect (mm/mprotect.c:1011)
[  527.571859] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[  527.571866] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[  527.571872] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[  527.571878] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:169 (discriminator 1)
arch/arm64/kernel/entry-common.c:182 (discriminator 1)
arch/arm64/kernel/entry-common.c:880 (discriminator 1))
[  527.571885] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:899)
[  527.571893] el0t_64_sync (arch/arm64/kernel/entry.S:596)
[  527.571900] ---[ end trace 0000000000000000 ]---
[  540.645451] sched: DL replenish lagged too much

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 54efec8782214652b331c50646013f8526570e8d
* Git describe: next-20250729
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250729
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: Preempt_rt

## Test
* Test log 1: https://qa-reports.linaro.org/api/testruns/29282584/log_file/
* Test log 2:https://qa-reports.linaro.org/api/testruns/29337984/log_file/
* Test lava log: https://lkft.validation.linaro.org/scheduler/job/8373114#L19186
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250729/log-parser-test/exception-rtmutex-deadlock-detected/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/30XMjtCEi0VzsU1gYZ0a7kcTkLJ
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30fq2ElntxgscJ13dnaD7iL5Z1G/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30fq2ElntxgscJ13dnaD7iL5Z1G/config

--
Linaro LKFT
https://lkft.linaro.org
