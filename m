Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A91221F1E
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679992; cv=none; b=FvO8ajzt1RePdCZC6HPYIjA62cJ0YOe/Omw+j7orzVAKBZ6iK2+8XcwDEF7GT5AciK7HQx+YbQh1I5vs+zfSyxN0NIijNCCpVi3kuW2+GRQF4GTw/BuqHojyWoSiKlSzANUGK41o75Q7vuKUDKHgeRd6Pv9P8s5Szb2afDd4718=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679992; c=relaxed/simple;
	bh=sUkXXqaPcEc+7VppZMJIlI+UWrPSwDWJ1n4g43Pjq2U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eAwmvzcFMJ2W2MBHXmg2WkewtdrQjiVPCZ8yYgL7KAud7MmoFOkTKm6lYs4Gi91TvgpkWUAE1pxp0uUUN+E1QBOh2Sq3CVP4U6IgF/EP5jrpmWUxNnybL5gtVWvjUADfXOnnszUbu0eaBzd61g/NkZ5sp+YYXFWQlyFvQl2Oxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4SaGRfq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4SaGRfq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so3144901a91.3
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679989; x=1751284789; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AXNiPa/vEGx138D93gyNZSNaepDJkn5LZASDwOnaP3Q=;
        b=K4SaGRfqc/ggy1wca/zrf/pNrVWG16fy38T5OGJkph3PvhZfqQLKHOp9EKi3f1czWA
         3m0htfph9vQNfxi+LDwP0J1NKqfROVGAYrf8e0FiE2Zhkd+s+Y9ILWF+hoD200xR0H4C
         dJgBk9y0qqL/4U3Pufbxg8JqWHO4i6ZjLdady7hi+3hczQfh3TvLtLPpi3zkq3CS8CaJ
         Jwq6gKAJIqb+nzT4IVYi7huMvQ/LIWfGgMDFuci+oMSgCEQYDIji63P4K3k0wlSZre0x
         F8kMtBg5s8Nnin2193CrC37v+IFNgkbKL3HpDv+Nsz/xPkKEOCBgyAJtG25nw0LPuaRr
         +j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679990; x=1751284790;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXNiPa/vEGx138D93gyNZSNaepDJkn5LZASDwOnaP3Q=;
        b=JeOKyPtzM3PmJp4XbW4Z6rDjK+esQkNavcXPW4/w6LpE0a5+VXPKxE+pFvuRMRdAaf
         ZGwHzglz7OO7RdBNk8iuH+OoKu7BCCT0cX6WOVusH2OQ306VqIUZHwr3iUnbSjwSRHap
         vNQ7SQ6Ghh8NcpqKJ34tzrncmfpa3cqSosxaP6+kF69AhmYs6RuWqe5m1IP8LuMFDpNK
         EiEgVZHAmQ2XMbiaaO2B63lRZ/uTdCUWoEw7kze8EOGbBTVVBMmK6xy+re7n7W0w1umi
         Ao2VMqSj1HzJj48Y2bN7I/cD8C5NsOKpmBebeyuhBuNNQZ2Vybd5Fy5tTESRH4iwUIbY
         6Qkg==
X-Forwarded-Encrypted: i=1; AJvYcCXKQ3WZxSsKuoqpIM/N1laDJiNKK+7ID/DoegRwYQj1rh+a085s4JJnPXH2mxQUMyF64XOQT1EUmvj8Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRynvj5FVvX5M0IJc/YTmwZAgnFF7v85fOSQw3LE3WFnKldkjO
	1b5IkoAQIaWFPntowuDGlzLGNkIfxZBggmkeZokekG0aElbk+OPPoMvSgfpeqmfdwC05qHJe6N5
	VMngiKc0QSU6y3uRE8B30872cfisQ5rvpT+NZycYhuQ==
X-Gm-Gg: ASbGncsl+TZvCRPmkJotUUzfc9Qrt9dzl9Bq39WBNaKSNQiDRySJaKd+nRD/gD8yK2P
	2ROooJsOZWWVKlwHYIlI5s3pgdWlLWkpChVCYPKoAASYDeockgeh9avucB3a4pkGVA0pGOUF0wj
	a618lLau4Z1swiNTFqk3nR01bjYW3OMntdpxInMkvGwjm7kN4KlwmO+vAs+xbZbng84Y4yjgb/w
	U9TOQqQ+WYXg8g=
X-Google-Smtp-Source: AGHT+IGiBd4kCVa0ywnRkcqWhGcCEeGyvisvkfyFlm7078947nB9TYKkqnxCIHumnODAWFdThN/AY578nByJKVZ7yKI=
X-Received: by 2002:a17:90b:2252:b0:313:14b5:2538 with SMTP id
 98e67ed59e1d1-3159d8ff782mr18970645a91.35.1750679989565; Mon, 23 Jun 2025
 04:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 23 Jun 2025 17:29:38 +0530
X-Gm-Features: Ac12FXxA4fdzSIPFEQ5fKIVplDtkIGiICrKuBKW8khXp_ABe7FgMqBB3FaOP2YI
Message-ID: <CA+G9fYt0MfXMEKqHKHrdfqg3Q5NgQsuG1f+cXRt83d7AscX5Fw@mail.gmail.com>
Subject: next-20250623: arm64 devices kernel panic Internal error Oops at
 pidfs_free_pid (fs/pidfs.c:162)
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	Jeff Layton <jlayton@kernel.org>, Daan De Meyer <daan.j.demeyer@gmail.com>, 
	Lennart Poettering <lennart@poettering.net>, Mike Yuan <me@yhndnzj.com>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 devices and qemu-arm64 while running LTP controllers
and selftests cgroup test cases the following kernel Panic Internal error oops
found on the Linux next-20250623 tag.

Regressions found on arm64 device
  - Kernel Panic Internal oops @ LTP controllers
  - Kernel Panic Internal oops @ selftest cgroups

Test environments:
 - Dragonboard-410c
 - e850-96
 - FVP
 - Juno-r2
 - rk3399-rock-pi-4b
 - qemu-arm64

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: arm64 devices kernel panic Internal error Oops at
pidfs_free_pid (fs/pidfs.c:162)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
[   67.087303] Internal error: Oops: 0000000096000004 [#1]  SMP
[   67.094021] Modules linked in: snd_soc_hdmi_codec venus_enc
venus_dec videobuf2_dma_contig pm8916_wdt qcom_wcnss_pil
coresight_cpu_debug coresight_tmc coresight_replicator qcom_camss
coresight_stm snd_soc_lpass_apq8016 msm qrtr coresight_funnel
snd_soc_msm8916_digital snd_soc_lpass_cpu coresight_tpiu
snd_soc_msm8916_analog videobuf2_dma_sg stm_core coresight_cti
snd_soc_lpass_platform snd_soc_apq8016_sbc venus_core
snd_soc_qcom_common qcom_q6v5_mss v4l2_fwnode coresight snd_soc_core
qcom_pil_info v4l2_async snd_compress llcc_qcom snd_pcm_dmaengine
ocmem qcom_q6v5 v4l2_mem2mem videobuf2_memops snd_pcm qcom_sysmon
drm_exec adv7511 snd_timer videobuf2_v4l2 gpu_sched qcom_common snd
videodev drm_dp_aux_bus qcom_glink_smem soundcore qcom_spmi_vadc
mdt_loader drm_display_helper qnoc_msm8916 qmi_helpers
videobuf2_common qcom_vadc_common qcom_spmi_temp_alarm rtc_pm8xxx
qcom_pon qcom_stats mc cec drm_client_lib qcom_rng rpmsg_ctrl
display_connector rpmsg_char phy_qcom_usb_hs socinfo drm_kms_helper
rmtfs_mem ramoops
[   67.094437]  reed_solomon fuse drm backlight ip_tables x_tables
[   67.189084] CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted
6.16.0-rc3-next-20250623 #1 PREEMPT
[   67.194810] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   67.234078] pc : pidfs_free_pid (fs/pidfs.c:162)
[   67.236989] lr : put_pid.part.0 (kernel/pid.c:104)
[   67.239958] sp : ffff80008001be50
[   67.243892] x29: ffff80008001be50 x28: ffff800082288180 x27: ffff8000801c7654
[   67.247206] x26: ffff8000822882c0 x25: 000000000000000a x24: ffff00003fc96940
[   67.254295] x23: 0000000000000000 x22: 000000000000003f x21: ffff00003fc968c0
[   67.261410] x20: ffff800082212740 x19: 0000000000000000 x18: ffff8000875abc00
[   67.268490] x17: ffff7fffbdb7b000 x16: ffff800080018000 x15: 010c194d58e3a052
[   67.275644] x14: 0000000000000000 x13: 0000000000000000 x12: 00000000000003d4
[   67.282785] x11: 0000000000000000 x10: 000000000000003f x9 : ffff00000295a500
[   67.289863] x8 : ffff80008001be30 x7 : 0000000000000000 x6 : ffff00003fc99be0
[   67.296923] x5 : ffff8000811fafe8 x4 : 0000000000100004 x3 : 0000000000000000
[   67.304036] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff00000487a9c0
[   67.311148] Call trace:
[   67.318222] pidfs_free_pid (fs/pidfs.c:162) (P)
[   67.320916] put_pid.part.0 (kernel/pid.c:104)
[   67.324597] delayed_put_pid (kernel/pid.c:114)
[   67.328231] rcu_core (arch/arm64/include/asm/preempt.h:13
(discriminator 1) kernel/rcu/tree.c:2589 (discriminator 1)
kernel/rcu/tree.c:2838 (discriminator 1))
[   67.331859] rcu_core_si (kernel/rcu/tree.c:2856)
[   67.335210] handle_softirqs (arch/arm64/include/asm/preempt.h:13
(discriminator 1) kernel/softirq.c:581 (discriminator 1))
[   67.338511] __do_softirq (kernel/softirq.c:614)
[   67.342526] ____do_softirq (arch/arm64/kernel/irq.c:82)
[   67.345735] call_on_irq_stack (arch/arm64/kernel/entry.S:897)
[   67.349550] do_softirq_own_stack (arch/arm64/kernel/irq.c:87)
[   67.353544] __irq_exit_rcu (kernel/softirq.c:460 kernel/softirq.c:680)
[   67.357431] irq_exit_rcu (kernel/softirq.c:699)
[   67.361234] el1_interrupt (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/entry-common.c:280
arch/arm64/kernel/entry-common.c:586
arch/arm64/kernel/entry-common.c:598)
[   67.364591] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:604)
[   67.368381] el1h_64_irq (arch/arm64/kernel/entry.S:596)
[   67.372250] cpuidle_enter_state (drivers/cpuidle/cpuidle.c:292) (P)
[   67.375640] cpuidle_enter (drivers/cpuidle/cpuidle.c:391 (discriminator 2))
[   67.380025] do_idle (kernel/sched/idle.c:160
kernel/sched/idle.c:235 kernel/sched/idle.c:330)
[   67.383811] cpu_startup_entry (kernel/sched/idle.c:428 (discriminator 1))
[   67.387062] secondary_start_kernel
(arch/arm64/include/asm/atomic_ll_sc.h:95 (discriminator 2)
arch/arm64/include/asm/atomic.h:28 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:546 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:994 (discriminator 2)
include/linux/atomic/atomic-instrumented.h:436 (discriminator 2)
include/linux/sched/mm.h:37 (discriminator 2)
arch/arm64/kernel/smp.c:214 (discriminator 2))
[   67.390956] __secondary_switched (arch/arm64/kernel/head.S:405)
[ 67.395181] Code: f9401c13 f9001c1f b140067f 540001a8 (f9400274)
All code
========
   0: f9401c13 ldr x19, [x0, #56]
   4: f9001c1f str xzr, [x0, #56]
   8: b140067f cmn x19, #0x1, lsl #12
   c: 540001a8 b.hi 0x40  // b.pmore
  10:* f9400274 ldr x20, [x19] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9400274 ldr x20, [x19]
[   67.399334] ---[ end trace 0000000000000000 ]---


## Source
* Kernel version: 6.16.0-rc3-next-20250623
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
* Git describe: next-20250623
* Project details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: defconfig+selftest/configs

## Build arm64
* Test log: https://qa-reports.linaro.org/api/testruns/28834568/log_file/
* Test Lava log: https://lkft.validation.linaro.org/scheduler/job/8326000#L2426
* Test Lava log 2:
https://lkft.validation.linaro.org/scheduler/job/8326094#L5378
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/log-parser-test/internal-error-oops-oops-smp/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmpuyjaGkw1YlPt0MbPk2y7vM/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmpuyjaGkw1YlPt0MbPk2y7vM/config

--
Linaro LKFT
https://lkft.linaro.org
