Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD7313E3E
	for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758825022; cv=none; b=rOiJlRTrw+AU2bnyfMlXkRFlWeodOJf46oLgaNaeL/ioPFTe0IKq0yw0pl9zB8hgnMUXtkrj+mo1SZsQWjL3cBB1tp4gChYaN4Z2Btn21UDF9Cza5RKhQ+DHBbsEY62QmXorw8tHqXDqUGX6mSlidI0spRDzTWW8Qt2tyB+E/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758825022; c=relaxed/simple;
	bh=tCSiCHjiYLBxiKxlzQijJtKjNIcmFyJ2Vn54zVJDrFE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UAwoCpOlSNJs4HJsdcg30B7Y3QnNx8sRkEjDl184rp8Q4v5UcCWvoL4/uZlJDQjD8gxEDpK/NbGSqV0o2xx5+RuKL55jBc28gDm36yt6YT7GKzNMYyqtyMibwn1G9qcc9RCef0ILHNhd0PsVPxRJElA9bVJxqmBi/UhX1PgLGgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvWxZeZX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvWxZeZX"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f3405c38aso1382433b3a.0
        for <regressions@lists.linux.dev>; Thu, 25 Sep 2025 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758825019; x=1759429819; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AD3Aprn/2Yo5LyXOC6U3dPN+8zQtQVUv9tcaZi7+WVY=;
        b=TvWxZeZX/QJvIFvT1oIy7cGerkFiozCsaa2jE53LMZEGEql3M31UCbOdrWg7N33aBh
         jPvJc2WSYEJoDfaSpYE9AqImow0TgGEzUJ0lBs15dGESlyUOgJIUwloA41BH21Bxe9E1
         tMQY3mepKGAqEJwC27u3LUFCXfILkm5KwKCjebmmAvFrmUXko8naYJXRXe82rBYlffpO
         B40ld1tjCKDdo/WCDYJwL1EgxE5Hvzn5Ygmd4Y0Axj38/PWWJq95NYlVFtd96GRotCH6
         zveKTAb5Dh8ZZFlLPDxGKLcrEObPpI2latvH2PvPxQqsoyAk69JeFSEd86qmPNah6jpb
         /1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758825019; x=1759429819;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AD3Aprn/2Yo5LyXOC6U3dPN+8zQtQVUv9tcaZi7+WVY=;
        b=jJu4mnwTCVkDykarWW1n8lQMXogtwifhcOp36cw5QNcCv+rigcH/IstaNGw8EYSO6g
         dTSmzCsbHAqrsK9gJMa3gGwNyWy2NlImuAzbmct1cFkvW5QxL0PPmMTZ7wqgFBFGV7Sk
         OsdoTK9kx2B2fGJUVCwhtDlQ38H9ecIoxS+ffNilQxA2WWF9urKICV7bf0M0mUO6FvLK
         xEKiLBdcreZFiS5YRrsdj0NOD0B2vpig2vHbrso94G6yMbPJxYgGHsyFu4+vpBi9cxao
         V28O+jbm+RQ2/H7s3h192BEGfhh5yNpPW66oVeO/8c+J+BoveHQR/wnaYnaxB8HFgjQP
         W91g==
X-Forwarded-Encrypted: i=1; AJvYcCWxlDYeQazOgZvJ2gWi3fjqpYvfiPf4pAaMK3XscnkDPsG1HxUId/QB6cvXbRJiRJxww8oPBBTOGTOuuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyO2D3nCE3anyC5yf+oqI7Xjx4A7vohHg18aWIfNkvu3Tah9f1E
	eePYG02jvKx8IH8O4MZ8xqIGiHlpD/JX06gq5yLMK5AH5qf5xuTvCHQeCbOQ4OxS+MVMD+Mwwh7
	bk8VfryfGxGddLc5G+4Vcrfe4V8YsTAuEvUUZqEXuHw==
X-Gm-Gg: ASbGncsaQfjYgljO3jfPsPbWulxYZjW/33hiBjw40ylPEnKkydWhrAoQ0umfInLEnfB
	2BqCRzIzzPPswxZ9barxnhdqmxA6gDZDXxbnCS6WvN2pL8/bC4ZMqHZjEuDV2oca2AFq6JolYUR
	5UR5BMFdLOQbbyaLvVA83AXWeTem62PNsgzIJT0nXLyFNtmPm6qYh8x/vxqzkjCuZ/0A1/A4Ufv
	CO6DeOM6qZJZ2tgck7VV6fDAEvAa7pt9rTalKZ5
X-Google-Smtp-Source: AGHT+IG0aEHA+SJ8POTvI7rXmHNNRmnCFjhfAJmzMzYuwnnWzgcjC3HMZZQWT5S9lDAxvmI0iW8mMspWOZ82crH3Q5k=
X-Received: by 2002:a17:902:fccf:b0:273:31fb:a872 with SMTP id
 d9443c01a7336-27ed4a06cefmr33651145ad.6.1758825019214; Thu, 25 Sep 2025
 11:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 26 Sep 2025 00:00:08 +0530
X-Gm-Features: AS18NWDtBpm_KTK7hpnu3EgD5L63hZbjcu26dinYNzF8NjUERzFkzicBNK0EhOQ
Message-ID: <CA+G9fYueO8kP8mXVNmbHkyrFPKpt-onPfeyNXLuLGGjiO1WFfQ@mail.gmail.com>
Subject: next-20250924: Internal error: Oops: mnt_ns_release
 (fs/namespace.c:148) __arm64_sys_listmount (fs/namespace.c:5936)
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

While running LTP syscalls tests on Linux next-20250924 tag build
the following kernel oops noticed on arm64 and x86_64 devices.

First seen on next-20250924
Good: next-20250923
Bad: next-2025094

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250924: Internal error: Oops: mnt_ns_release
(fs/namespace.c:148) __arm64_sys_listmount (fs/namespace.c:5936)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
$  git log --oneline next-20250923..next-20250924  -- fs/namespace.c
c54644c3221b6 (next/fs-next) Merge branch 'for-next' of
https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
1f28cc19559a8 Merge branch 'namespace-6.18' into vfs.all
e2c277f720291 Merge branch 'kernel-6.18.clone3' into vfs.all
b2af83d5b8223 Merge branch 'vfs-6.18.mount' into vfs.all
29ecd1ca48ec2 Merge branch 'vfs-6.18.misc' into vfs.all
d7610cb7454bb ns: simplify ns_common_init() further
59bfb66816809 listmount: don't call path_put() under namespace semaphore
2bc5bfbfd3f27 statmount: don't call path_put() under namespace semaphore


## Test log
[   41.821877] Internal error: Oops: 0000000096000005 [#1]  SMP
[   41.919038] Modules linked in: cdc_ether usbnet sm3_ce sha3_ce nvme
xhci_pci_renesas nvme_core arm_cspmu_module arm_spe_pmu ipmi_devintf
ipmi_msghandler arm_cmn cppc_cpufreq drm fuse backlight
[   41.944048] CPU: 14 UID: 0 PID: 6416 Comm: listmount04 Not tainted
6.17.0-rc7-next-20250924 #1 PREEMPT
[   41.958197] Hardware name: Inspur NF5280R7/Mitchell MB, BIOS
04.04.00004001 2025-02-04 22:23:30 02/04/2025
[   41.967837] pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[   41.974958] pc : mnt_ns_release
(arch/arm64/include/asm/atomic_lse.h:62 (discriminator 1)
arch/arm64/include/asm/atomic_lse.h:76 (discriminator 1)
arch/arm64/include/asm/atomic.h:51 (discriminator 1)
include/linux/atomic/atomic-arch-fallback.h:944 (discriminator 1)
include/linux/atomic/atomic-instrumented.h:401 (discriminator 1)
include/linux/refcount.h:389 (discriminator 1)
include/linux/refcount.h:432 (discriminator 1)
include/linux/refcount.h:450 (discriminator 1) fs/namespace.c:148
(discriminator 1))
[   41.981910] lr : __arm64_sys_listmount (fs/namespace.c:5936)
[   41.993467] sp : ffff8000ff5afd50
[   42.000329] x29: ffff8000ff5afd50 x28: fff00001bd947380 x27: 0000000000000000
[   42.007454] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000100
[   42.030726] x23: 0000000000000000 x22: 0000000000000020 x21: ffff8000ff5afdc8
[   42.038281] x20: 0000aaaabd6a1110 x19: 0000000000000000 x18: 0000000000000000
[   42.045405] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   42.052528] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[   42.075541] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffda68dcdbbe30
[   42.082835] x8 : ffff8000ff5afda0 x7 : fefefefefefefefe x6 : ffffda68df5e9000
[   42.096212] x5 : fff00001bd947380
[   42.108978]  x4 : fff00001bd947380 x3 : 0000000000000000
[   42.114449] x2 : 0000000000000000 x1 : 00000000ffffffff x0 : 00000000000000b8
[   42.134515] Call trace:
[   42.139725]  mnt_ns_release (arch/arm64/include/asm/atomic_lse.h:62
(discriminator 1) arch/arm64/include/asm/atomic_lse.h:76
(discriminator 1) arch/arm64/include/asm/atomic.h:51 (discriminator 1)
include/linux/atomic/atomic-arch-fallback.h:944 (discriminator 1)
include/linux/atomic/atomic-instrumented.h:401 (discriminator 1)
include/linux/refcount.h:389 (discriminator 1)
include/linux/refcount.h:432 (discriminator 1)
include/linux/refcount.h:450 (discriminator 1) fs/namespace.c:148
(discriminator 1)) (P)
[   42.143811]  __arm64_sys_listmount (fs/namespace.c:5936)
[   42.148327]  invoke_syscall.constprop.0
(arch/arm64/include/asm/syscall.h:61 arch/arm64/kernel/syscall.c:54)
[   42.159193]  do_el0_svc (include/linux/thread_info.h:135
(discriminator 2) arch/arm64/kernel/syscall.c:140 (discriminator 2)
arch/arm64/kernel/syscall.c:151 (discriminator 2))
[   42.163970]  el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:102 (discriminator 1)
arch/arm64/kernel/entry-common.c:745 (discriminator 1))
[   42.173791]  el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:764)
[   42.185342]  el0t_64_sync (arch/arm64/kernel/entry.S:596)
[   42.189165] Code: aa0003f3 9102e000 d503201f 12800001 (b8610001)
All code
========
   0: aa0003f3 mov x19, x0
   4: 9102e000 add x0, x0, #0xb8
   8: d503201f nop
   c: 12800001 mov w1, #0xffffffff            // #-1
  10:* b8610001 ldaddl w1, w1, [x0] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: b8610001 ldaddl w1, w1, [x0]
[   42.211485] ---[ end trace 0000000000000000 ]---

## Source
* Kernel version: 6.17.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe:  6.17.0-rc7-next-20250924
* Git commit: b5a4da2c459f79a2c87c867398f1c0c315779781
* Architectures: arm64, x86_64
* Toolchains: gcc-13
* Kconfigs: defconfig+lkftconfig

## Build
* Test log arm64: https://qa-reports.linaro.org/api/testruns/30007634/log_file/
* Test log x86_64: https://qa-reports.linaro.org/api/testruns/30000230/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master-ampere/next-20250924/log-parser-test/internal-error-oops-oops-smp/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/ampere/projects/ci/tests/339teV8pAwrsgeSJq9beV5V11U8
* Build link: https://storage.tuxsuite.com/public/ampere/ci/builds/339teBhKZ4DENKbJJNnbWKh5ud1/
* Kernel config:
https://storage.tuxsuite.com/public/ampere/ci/builds/339teBhKZ4DENKbJJNnbWKh5ud1/config

--
Linaro LKFT
