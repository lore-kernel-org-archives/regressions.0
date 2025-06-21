Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87FC1DDC11
	for <regressions@lists.linux.dev>; Sat, 21 Jun 2025 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750493451; cv=none; b=BYp7CcKzBfZCQSCTg11KBkqafarc2H3BKB4rRD2wFqDR/5n4o1lDY56smJxd0nG1rsFEcfl2cip4k8b+MilEIY6UG7RI83BW0ZDXO8kS5wmUCyOrxBca5M5LR/lpvN7ZDzVnMrbOrBkW8tsVeAMrtZqgfEARKDZUyLrDi94idH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750493451; c=relaxed/simple;
	bh=L0JtW1LUQ0heXb/YQ2Rc0kPoOeDLYXEjScCVpAnS19I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i+DBBpP+zILRbO99Er2QoyHwLceb0yJCa3DBeeqRxZOXl39jckPNSLWVNfnFRgWUHIqFkoVnFm2984pvKsbpeZOLPdPjaBibEtRZqB15pyYBBjLFZUBYJFDQEnBY4ZK1Y0noXFtp4CagnfueTZiIXG2MYm44nkOvRP/8O/hmXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oZ2odR3q; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZ2odR3q"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-531466622beso748367e0c.1
        for <regressions@lists.linux.dev>; Sat, 21 Jun 2025 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750493449; x=1751098249; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uv6wxfrJppsxhE62iBQhcbElKSZgzipS3KVYWsXdRos=;
        b=oZ2odR3qL4xHoTOgujK8gmiYLg4kTNfZH2d1wpv6KQf+us3aZq9oRDYFN7n8lPw+UA
         /0+xDUErpLTyXcjNH6onXq3NtdSkWkA/JinWTz5puclEgf6yqHCj9CbSrRqJ8IRmtaQb
         K+RUaRN+g3GfhAWfK7X3uB9fKIDH/5uVyHSx0PJ6VicaTWNZpN61jMN2KzBpGhehltR+
         lUd8lewJJkxxRV4AkLXN4TUz6t7ZPdbJHVnZJ4cwGhyZwVckwqZQxru9ne4B6VKsypjr
         G9DfPULs0DOh2n2mvDbJdWFgAgnq94AVHaRXlxXxDu8EmSeWKRpkCdriBmtt4GT1LBJy
         4LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750493449; x=1751098249;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uv6wxfrJppsxhE62iBQhcbElKSZgzipS3KVYWsXdRos=;
        b=XYa8BaJGdUlezPkjaxnkVgkf73fje9/yo1gRp341zq3hFt62odHByGS2vDm408+w49
         2aMckpbDjxW/vPi0cDx0N1VSbNgvFCquqRONDTV18WeyV7Xjw17d1n/FDcjKbtX0E5Jc
         Yy1u4Kim9ViucLY3xBsHdNbUGhia6bhZJPvNBIa5GBhN0LCIH/NyfG7gvEbvsTAT6MRE
         mVM+1cpBgQfBxfTVzGQEHFyyJcIFCP/1TO+CaEAdmdIqsrML361228tcVkLjRlOaGQN3
         ezXM52+/8N1yR10ttBYOMD7DxwXGuHQ6YdqcCemkDIoFyeOMvk9E4bBBUH2sIEDLZZNv
         F9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXIFcs7wpORjaN31WVMSar3D1SqOncrU/X4q6r9KBOKehlK/H1MDf14891cpJ0/pqL/kg59h0/2FhihlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxF9FygdqdDNpmHTgS0gROjljoX8AoT9DSioMygKSbkEvGZEpJ9
	gJlPiN1er590GhrSZSvFOV5VOAq5k5uZzflB5andJjkLs/OJeGo267Oc2R3WI23rSSgmMr9J5WF
	ST8Hw7f0xVZcB5v49J8DoTO8I3Invzp/dvDUcpjnk5g==
X-Gm-Gg: ASbGncslJzdxF96lNVEvU/C02tftoPVm88gY0Q44r/pDrzkdLP6/BvcpUtzZ3rEf68H
	H13FIJ/BXQ9uN1mA3Wdwo5DRA3rv3fKNBFW/JTxFZZxKuk0yP/pugqrkoFzM6zzeGmAACb1xARA
	ADrxhHOVaRUlyh8uTvRSPE5I0ghFWz3PctN9M0ciPzjMWzUEBghNbOQ+em/GoXcZa5yZP/rzbnl
	jwU
X-Google-Smtp-Source: AGHT+IHne2H/xECMfrQ5hD2vXtYM8uvntThObLzerHiwLYgtm+94fiQkXmkqgi1PpqPk2BT3LgZkb0zk4MJsYXLd4N0=
X-Received: by 2002:a05:6102:41a4:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4e9c284a5camr3747596137.9.1750493448628; Sat, 21 Jun 2025
 01:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sat, 21 Jun 2025 13:40:37 +0530
X-Gm-Features: Ac12FXzzjuLKwwB_cXCZktPbz85J27-ZMylRTlHgzb69EvDP-QZzdbjC_WTRMfQ
Message-ID: <CA+G9fYuOnfvm7N0pa=PNvq=tQsp6CVA34eDq5=rGthEBrdMJuQ@mail.gmail.com>
Subject: next-20250620: Qualcomm Dragonboard 845c Internal error Oops at ufs_qcom_setup_clocks
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-phy@lists.infradead.org, 
	linux-scsi@vger.kernel.org
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, konrad.dybcio@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions noticed on the Qualcomm Dragonboard 845c device while booting the
Linux next tags from next-20250616..next-20250620 the following kernel oops
noticed and boot failed.

Regressions found on Thundercomm Dragonboard 845c (DT)
- Boot

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250616
Good: next-20250613
Bad:  next-20250616

Boot regression: Qualcomm Dragonboard 845c Internal error Oops at
ufs_qcom_setup_clocks

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
[    6.446825] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable
to find vccq2-supply regulator, assuming enabled
[    6.448070] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    6.448080] Mem abort info:
[    6.448086]   ESR = 0x0000000096000006
[    6.448093]   EC = 0x25: DABT (current EL), IL = 32 bits
[    6.448101]   SET = 0, FnV = 0
[    6.448107]   EA = 0, S1PTW = 0
[    6.448113]   FSC = 0x06: level 2 translation fault
[    6.448120] Data abort info:
[    6.448125]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[    6.448132]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    6.448139]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    6.448146] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010447b000
[    6.448154] [0000000000000000] pgd=080000010447d403,
p4d=080000010447d403, pud=080000010447e403, pmd=0000000000000000
[    6.448186] Internal error: Oops: 0000000096000006 [#1]  SMP
[    6.448193] Modules linked in: qcom_q6v5_mss(+) ufs_qcom(+)
cfg80211(+) coresight_stm stm_core phy_qcom_qmp_pcie rfkill qcom_wdt
lmh(+) icc_osm_l3 qrtr slim_qcom_ngd_ctrl slimbus pdr_interface
qcom_pdr_msg icc_bwmon qcom_q6v5_pas(+) llcc_qcom qcom_pil_info
display_connector qcom_q6v5 qcom_sysmon drm_kms_helper qcom_common
qcom_glink_smem mdt_loader qmi_helpers drm backlight socinfo rmtfs_mem
[    6.448278] CPU: 6 UID: 0 PID: 385 Comm: (udev-worker) Not tainted
6.16.0-rc2-next-20250620 #1 PREEMPT
[    6.448288] Hardware name: Thundercomm Dragonboard 845c (DT)
[    6.448292] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.448299] pc : ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom
[    6.448317] lr : ufshcd_setup_clocks
(drivers/ufs/core/ufshcd-priv.h:142 drivers/ufs/core/ufshcd.c:9290)
[    6.448332] sp : ffff800081213640
[    6.448335] x29: ffff800081213640 x28: 0000000000000001 x27: ffff00008b633270
[    6.448347] x26: ffff00008b6332a0 x25: ffff00008b632870 x24: 0000000000000000
[    6.448359] x23: ffff00008b633280 x22: ffff00008b6332a0 x21: 0000000000000000
[    6.448369] x20: ffffd7eabf84d618 x19: ffff00008b632870 x18: 0000000000000000
[    6.448380] x17: 5453595342555300 x16: 305f666d745f6973 x15: 0000000000000100
[    6.448391] x14: ffffffffffffffff x13: 0000000000000030 x12: 0101010101010101
[    6.448402] x11: ffff00008188ea18 x10: 0000000000000000 x9 : ffffd7eabd9c3c28
[    6.448413] x8 : ffff8000812134b8 x7 : fefefefefefefefe x6 : 0000000000000001
[    6.448423] x5 : ffffffffffffffc8 x4 : 00000000c0000000 x3 : ffffd7eab32aa058
[    6.448433] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff00008b632870
[    6.448444] Call trace:
[    6.448449] ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
[    6.448466] ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142
drivers/ufs/core/ufshcd.c:9290)
[    6.448477] ufshcd_init (drivers/ufs/core/ufshcd.c:9468
drivers/ufs/core/ufshcd.c:10636)
[    6.448485] ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
[    6.448495] ufs_qcom_probe+0x28/0x68 ufs_qcom
[    6.448508] platform_probe (drivers/base/platform.c:1404)
[    6.448519] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
[    6.448526] __driver_probe_device (drivers/base/dd.c:799)
[    6.448532] driver_probe_device (drivers/base/dd.c:829)
[    6.448539] __driver_attach (drivers/base/dd.c:1216)
[    6.448545] bus_for_each_dev (drivers/base/bus.c:370)
[    6.448556] driver_attach (drivers/base/dd.c:1234)
[    6.448567] bus_add_driver (drivers/base/bus.c:678)
[    6.448577] driver_register (drivers/base/driver.c:249)
[    6.448584] __platform_driver_register (drivers/base/platform.c:868)
[    6.448592] ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
[    6.448605] do_one_initcall (init/main.c:1274)
[    6.448615] do_init_module (kernel/module/main.c:3041)
[    6.448626] load_module (kernel/module/main.c:3511)
[    6.448635] init_module_from_file (kernel/module/main.c:3704)
[    6.448644] __arm64_sys_finit_module (kernel/module/main.c:3715
kernel/module/main.c:3741 kernel/module/main.c:3725
kernel/module/main.c:3725)
[    6.448653] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[    6.448661] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[    6.448668] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[    6.448674] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:768 (discriminator 1))
[    6.448685] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:787)
[    6.448694] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[ 6.448705] Code: a90157f3 aa0003f3 f90013f6 f9405c15 (f94002b6)
All code
========
   0: a90157f3 stp x19, x21, [sp, #16]
   4: aa0003f3 mov x19, x0
   8: f90013f6 str x22, [sp, #32]
   c: f9405c15 ldr x21, [x0, #184]
  10:* f94002b6 ldr x22, [x21] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f94002b6 ldr x22, [x21]
[    6.448710] ---[ end trace 0000000000000000 ]---

## Source
* Kernel version: 6.16.0-rc2-next-20250620
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2c923c845768a0f0e34b8161d70bc96525385782
* Git describe: next-20250620
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250620/
* Architectures: arm64 Dragonboard 845c
* Toolchains: gcc-13
* Kconfigs: defconfig+lkfttestconfigs

## Build arm64
* Test log: https://qa-reports.linaro.org/api/testruns/28811906/log_file/
* Test Lava log: https://lkft.validation.linaro.org/scheduler/job/8323501#L5646
* Test Lava log 2:
https://lkft.validation.linaro.org/scheduler/job/8323351#L5682
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250620/boot/gcc-13-lkftconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yj4otvwBRT4UktLTyKEN8ZtUQm/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yj4otvwBRT4UktLTyKEN8ZtUQm/config

--
Linaro LKFT
https://lkft.linaro.org
