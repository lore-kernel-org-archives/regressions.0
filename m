Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA117EC
	for <regressions@lists.linux.dev>; Thu, 14 Jul 2022 07:47:49 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w12so1294679edd.13
        for <regressions@lists.linux.dev>; Thu, 14 Jul 2022 00:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=j4QfK2iQAnum2nLeQTWlegafxzZD5NZOg4pgJLg01dE=;
        b=Ob/iDl7slzxs6s1Nb24Ut1I908w4BBEZs3y45dQIbbgQRW2Bchged3fvN70UJ+fyWa
         VI7tpv0BXfNCh4vxB8vUl++0/hQclfaaGz6EZN71BRZam77903CT2hFzVAJ0yRN3mhJW
         O32U9HZ+kpLGobXtM3iBZgHBIAl0ME2xRb9uaNjN7UmxuBSbylu2heXjW2zF6ZUjw/b1
         wCfHNXH9+Fl2Ub65sYkqbFd32O8V2UX26XELw47ntiFYJN4/kV1FsaHBJoRLtwPbyH00
         CIG5gPaobIxJR9q7lzP+He4mAC2SQbJ/fmC/Guau+FgzWfunLqMXAZ/yw4X7H1sM97Tz
         QNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=j4QfK2iQAnum2nLeQTWlegafxzZD5NZOg4pgJLg01dE=;
        b=N2+VSZhZzA72clnui6hpDmehfBZd/1VE9ASCdkj9ElAFybK2UtL4aq4ZDw4I2FIt+y
         zFWdpgJKzMF2AxhlE0fTjQZVYvxLW0bnKmIbxoHf2l90M51nyqzYRrJS6R1kj7coqikW
         BqJAQt1PDzovmpzOWvi4lUSgRVaevfDqqNhIxl0U2voBVWb1zeawOXhK4CWG6dRrOgp5
         3rXrGK6vLbjt5ML9dZWvUEWz0u0jXHE8MclEOpg2i/k7mEFlw4gNkI5YR56pufzeNwdt
         zT+uDt948XVX7wUXXAS/R31989W6OBypbfmo7sXHTVbPR4lSHZRl2r40Rk03v1k+/mOD
         Zijg==
X-Gm-Message-State: AJIora8aj50gG0tEb96Y1Lb5wyhUnmyu/xBpI/fxpXJCxpooBwwTD8vu
	Y6JxTJZTSk795HpdkcodxiiegrM4FixtYh7WvHO86w==
X-Google-Smtp-Source: AGRyM1tMHx1easLYFa9xYvefclce1EiBewHWg20ENwcZg56sE6aT7znvw62lycVMsNnzxTeLelmexmFPGb0ofeGxrV8=
X-Received: by 2002:a05:6402:2812:b0:43a:9041:d5db with SMTP id
 h18-20020a056402281200b0043a9041d5dbmr10342886ede.208.1657784867856; Thu, 14
 Jul 2022 00:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Jul 2022 13:17:36 +0530
Message-ID: <CA+G9fYuxp2Ge1JGwuXase633r8_7zPZkxrD6doCKi6aYY3mfPw@mail.gmail.com>
Subject: [next] Kernel panic - not syncing: swiotlb_init_remap: nslabs = 0 too small
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	linux-mm <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Christoph Hellwig <hch@lst.de>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Tom Lendacky <thomas.lendacky@amd.com>, conor@kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"

[Please ignore this email if it is already reported]

Linux next-20220713 boot failed on arm, arm64, x86_64 and i386 [1].

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 4662b7adea50bb62e993a67f611f3be625d3df0d
  git_describe: next-20220713
  kernel_version: 5.19.0-rc6
  kernel-config: https://builds.tuxbuild.com/2BtFIR2DegCrbRCCTSZF93YVeiO/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/586982028
  artifact-location: https://builds.tuxbuild.com/2BtFIR2DegCrbRCCTSZF93YVeiO
  vmlinux.xz: https://builds.tuxbuild.com/2BtFIR2DegCrbRCCTSZF93YVeiO/vmlinux.xz
  System.map: https://builds.tuxbuild.com/2BtFIR2DegCrbRCCTSZF93YVeiO/System.map
  toolchain: gcc-11

Here is the boot log output from arm64 juno-r2 device.

[    0.000000] Booting Linux on physical CPU 0x0000000100 [0x410fd033]
[    0.000000] Linux version 5.19.0-rc6-next-20220713
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 11.3.0-3) 11.3.0, GNU
ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT @1657717522
[    0.000000] Machine model: ARM Juno development board (r2)
[    0.000000] earlycon: pl11 at MMIO 0x000000007ff80000 (options '')
[    0.000000] printk: bootconsole [pl11] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000080000000-0x00000009ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x9fefd1b40-0x9fefd3fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000009ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000feffffff]
[    0.000000]   node   0: [mem 0x0000000880000000-0x00000009ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000009ffffffff]
[    0.000000] On node 0, zone Normal: 4096 pages in unavailable ranges
[    0.000000] cma: Reserved 32 MiB at 0x00000000fd000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 30 pages/cpu s82856 r8192 d31832 u122880
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2060288
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: console=ttyAMA0,115200n8
root=/dev/nfs rw
nfsroot=10.66.16.120:/var/lib/lava/dispatcher/tmp/5283518/extract-nfsrootfs-ulkeoqdy,tcp,hard,vers=3,wsize=65536
earlycon=pl011,0x7ff80000 console_msg_format=syslog earlycon
default_hugepagesz=2M hugepages=256
sky2.mac_address=0x00,0x02,0xF7,0x00,0x68,0x51 ip=dhcp
<6>[    0.000000] Dentry cache hash table entries: 1048576 (order: 11,
8388608 bytes, linear)
<6>[    0.000000] Inode-cache hash table entries: 524288 (order: 10,
4194304 bytes, linear)
<6>[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
<0>[    0.000000] Kernel panic - not syncing: swiotlb_init_remap:
nslabs = 0 too small
<4>[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
5.19.0-rc6-next-20220713 #1
<4>[    0.000000] Hardware name: ARM Juno development board (r2) (DT)
<4>[    0.000000] Call trace:
<4>[    0.000000]  dump_backtrace+0xe8/0x130
<4>[    0.000000]  show_stack+0x24/0x60
<4>[    0.000000]  dump_stack_lvl+0x8c/0xb8
<4>[    0.000000]  dump_stack+0x18/0x34
<4>[    0.000000]  panic+0x188/0x38c
<4>[    0.000000]  swiotlb_init_remap+0x50/0x54
<4>[    0.000000]  swiotlb_init+0x20/0x2c
<4>[    0.000000]  mem_init+0x38/0x48
<4>[    0.000000]  start_kernel+0x448/0x738
<4>[    0.000000]  __primary_switched+0xb8/0xc0
<0>[    0.000000] ---[ end Kernel panic - not syncing:
swiotlb_init_remap: nslabs = 0 too small ]---

Full test log link,
[1] https://lkft.validation.linaro.org/scheduler/job/5283518#L582

Best regards
Naresh Kamboju


--
Linaro LKFT
https://lkft.linaro.org
