Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260517741
	for <regressions@lists.linux.dev>; Thu,  9 Nov 2023 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sL7HTIEx"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-45db31f9156so383801137.1
        for <regressions@lists.linux.dev>; Thu, 09 Nov 2023 05:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699536440; x=1700141240; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cbopAyKk2nUSkgWtHiP/bLtiSi3hylXJFxrxhIdXSa4=;
        b=sL7HTIExF9eshWqkOkzFY6Oj4jdaqXr6gHLl6auv36AZIMZO29lrBxF+VuARDPVGwt
         2LqEpjCxANz3sJfajmtawUbe0u+BCTuKgMDIFOBE1ZY99i6xMkVDStWRdl+IRkjRoYXN
         hCNF76YnwYmi9mfHggd6ISMMRf2YcHWXxPv6w3V3ytwCNuR1flK6lX499ccXGzyweEBB
         NCkXJeq+RV7GWUGsg6lRw1f6FYx3VCi0n7c1qr09Bp3REkb8QS5nsMvEtgU/1oR4avHo
         Q4W/Xmo/vcrGdkdWIm0g6KamjQrJLwwe+66Rn98sNuoQi7q/tU6Ay5+a80ppLfmdA4hA
         Vw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536440; x=1700141240;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbopAyKk2nUSkgWtHiP/bLtiSi3hylXJFxrxhIdXSa4=;
        b=T5V4kYMg9zFJYCC3B2TNc8mFItrLR/y5DEf+YFP0y3HEZeffbC6lZcYqeUv+i5dOUs
         Y8T2/FaitRoGYOxGgoHdEGpQ9e48HwcpldhJNqC9IWVCAmuL6C8vuMT97ae8ttzIbyDV
         senPzI6QMIRSAji5XRsLHIQ/LEeiBVvG0iXJqV0x7dxPTfZBvIg1FObI4FfXu6WSJhS1
         yV/28WaWMQI0T5Hma0z8VuEncw+0j4WHzE8vwzOH+KPNNkR8o9CFXcUlB386PSmtJtq5
         kiCzxC2GbTpj2OfoUY6jjfwaZVzVvK+uq2M3RvBnxJ0ucuh3di0d2B7wNT7bPIn/sPg5
         KLRg==
X-Gm-Message-State: AOJu0Yyp/m2vF0EA9idpuCRcwqjD+N9ezG1S6Kmk0K0Ns2pr6lyOudC0
	x7wRmK/PWbdHqkQuyLQJOa7lwE0NbapQVljaMxNRZA==
X-Google-Smtp-Source: AGHT+IHZv6/tHioQIWcjB+aBmS/UdtoC1McUwT/k73qnfV49+CgnR/jgai3mHG1zVSK7o4helKC44xQ1U97V1/xXSTQ=
X-Received: by 2002:a67:cc16:0:b0:45d:962e:f17b with SMTP id
 q22-20020a67cc16000000b0045d962ef17bmr4553293vsl.30.1699536439712; Thu, 09
 Nov 2023 05:27:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 9 Nov 2023 18:57:08 +0530
Message-ID: <CA+G9fYs-j2FYZSFSVZj48mgoM9gQd4-7M2mu2Ez3D1DqDdW2bQ@mail.gmail.com>
Subject: WARNING: CPU: 6 PID: 474 at include/linux/maple_tree.h:712
 mmap_region (include/linux/maple_tree.h:556 include/linux/maple_tree.h:731
To: linux-mm <linux-mm@kvack.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following kernel panic noticed while running  selftests: exec: load_address
on Fastmodels (FVP) running Linux next-20231109.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

log:
---

# timeout set to 45
# selftests: exec: load_address_16777216
[  238.405168] ------------[ cut here ]------------
[  238.405244] WARNING: CPU: 6 PID: 474 at
include/linux/maple_tree.h:712 mmap_region
(include/linux/maple_tree.h:556 include/linux/maple_tree.h:731
include/linux/maple_tree.h:747 include/linux/mm.h:1033 mm/mmap.c:2828)
[  238.405432] Modules linked in: arm_spe_pmu crct10dif_ce
panel_simple pl111_drm drm_dma_helper drm_kms_helper fuse drm
backlight dm_mod ip_tables x_tables
[  238.405932] CPU: 6 PID: 474 Comm: load_address_16 Not tainted
6.6.0-next-20231109 #1
[  238.406070] Hardware name: FVP Base RevC (DT)
[  238.406151] pstate: 123402009 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[  238.406294] pc : mmap_region (include/linux/maple_tree.h:556
include/linux/maple_tree.h:731 include/linux/maple_tree.h:747
include/linux/mm.h:1033 mm/mmap.c:2828)
[  238.406424] lr : mmap_region (mm/mmap.c:2836)
[  238.406554] sp : ffff8000819639b0
[  238.406629] x29: ffff8000819639c0 x28: ffff000806f79000 x27: 0000000002002000
[  238.406829] x26: ffff000806f798f0 x25: ffff000806f790b0 x24: 0000000000000006
[  238.407029] x23: 0000000000000ffc x22: ffff000805d6e100 x21: ffff0008016adf00
[  238.407229] x20: 0000000000100073 x19: 0000000001ffc000 x18: ffffffffffffffff
[  238.407425] x17: 0000000000000000 x16: ffffd7c64ceb7c10 x15: ffffffffffffffff
[  238.407627] x14: 0000000000000000 x13: 1fffe001002bc9a1 x12: ffff0008015e4d0c
[  238.407825] x11: ffff800081963a48 x10: ffff0008015e4d00 x9 : ffffd7c64b49c9f0
[  238.408028] x8 : ffff800081963778 x7 : 0000000000000000 x6 : 0000000000000000
[  238.408223] x5 : ffffd7c64e35f000 x4 : ffffd7c64e35f278 x3 : 0000000000000000
[  238.408420] x2 : ffffd7c64e92fd78 x1 : 0000000002001fff x0 : 0000000000479fff
[  238.408618] Call trace:
[  238.408681] mmap_region (include/linux/maple_tree.h:556
include/linux/maple_tree.h:731 include/linux/maple_tree.h:747
include/linux/mm.h:1033 mm/mmap.c:2828)
[  238.408812] do_mmap (arch/arm64/include/asm/mman.h:18
include/linux/mman.h:147 mm/mmap.c:1274)
[  238.408940] vm_mmap_pgoff (mm/util.c:546)
[  238.409088] vm_mmap (mm/util.c:559)
[  238.409229] elf_load (fs/binfmt_elf.c:385 fs/binfmt_elf.c:408)
[  238.409337] load_elf_binary (fs/binfmt_elf.c:1134 (discriminator 1))
[  238.409454] bprm_execve (fs/exec.c:1940)
[  238.409598] do_execveat_common.isra.0 (fs/exec.c:1938)
[  238.409757] __arm64_sys_execve (fs/exec.c:2106)
[  238.409910] invoke_syscall (arch/arm64/kernel/syscall.c:46
(discriminator 19))
[  238.410058] el0_svc_common.constprop.0 (arch/arm64/kernel/syscall.c:136)
[  238.410218] do_el0_svc (arch/arm64/kernel/syscall.c:155)
[  238.410363] el0_svc (arch/arm64/include/asm/daifflags.h:75
arch/arm64/kernel/entry-common.c:677)
[  238.410508] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:697)
[  238.410623] el0t_64_sync (arch/arm64/kernel/entry.S:595)
[  238.410735] ---[ end trace 0000000000000000 ]---


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231109/testrun/21009598/suite/log-parser-test/test/check-kernel-exception/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231109/testrun/21009598/suite/log-parser-test/tests/
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2Xv9wca3SPRN4lh73fIuUxVRNHI
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Xv9vEpjybxlDA4IvgDBm4bjzVT/

--
Linaro LKFT
https://lkft.linaro.org
