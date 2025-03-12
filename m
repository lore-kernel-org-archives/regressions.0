Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557A024BD14
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741798733; cv=none; b=Oggbv0q4wAai+05xDwZmFMHBD1pOoFQZhaOEKwLVuD7euyPzt/+Px6ojkN+ULYugg3et86xMbQsPgNDNS1qcF6MvBLO5wUhRl2wl9t8cL5BlMnPzOLchLx9l9sJctn/Zatw5AHL/rNTgRx41wrq1J2kWX53fn+Z0MGDMt9dfRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741798733; c=relaxed/simple;
	bh=rcEvdrTUis8+Q8sZk3wbgaztmlmf/42CCCyNDoHVkgg=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=Y3+no5ljElFXkS5yzdByomb6VUQOhu3wR8wj4UPnTTtkoD9SSgO5LODU8qPXkmjvD9S6XvADIqLS3iBNabrZm4KN8U3lCTLC3FmeSaL+sUQ93bhaPEmIsGwSSQS/1GdeipkPD8ANxmhW9bc0U6V5O3hdqEAB6PDE8WODahjSKxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dZArrBUN; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dZArrBUN"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f768e9be1aso11993107b3.0
        for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741798730; x=1742403530; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5fJTwX2SxXjE4qarbKB4NQDZo79ZBunrNl2zmSbIcY=;
        b=dZArrBUNjY7s3fJRBLEi+joFeIckIoJ7ExoSqZe9xBAEmNms0+CqHoz3vb56vMx9S9
         G7MzcFzdIMUq2/NIp5IcmoXgm0Rl9aGob+RmwfIi50X5jKjEADj5K3ma48qdvb7tp5jc
         oRbfExj+l+LA0UDy3RMo6Td7wBpht3AqisUmDxi0fj5f1GAgVyrCaG6xxx17JLoZPdpL
         owYihD9bQm8XY3kB2llIG8iSV4hA/d73lF5NCMlICluRZxhwD04h3ZGeP4XPmh9F4Agi
         cth1XcXV0fsHma19rysS8MErXWQM6g2M3305dK7l9iwxHdPt1JvxNQIqOg9ieuoMeR5e
         tbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798730; x=1742403530;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5fJTwX2SxXjE4qarbKB4NQDZo79ZBunrNl2zmSbIcY=;
        b=XMVhwvyGEV6EMc6jhz3Q9G9CAJglFgzX6p6QcRMUasBh7YcHtnC97Rb4RG4ZTClMX4
         nMZmkTKFzU/zP+eVzyvYyG4A5v1Rqrnqr8QsJnPWFOnwksKTj6EvNZEsIEAVfsCAjwNr
         YdKKQbXlTsp+Gnla2iEX0KV0ipzT03XVVgG0npZsknVLel01jtt2clFZDzyqEbcX1G4P
         NMf0+tZ/0leCTgmTdscfNsU6f99705udWok5WEQ4KWaRee/ukmfp267iokSbgyZ8uMLS
         qeMSJD1UPqkaRcq//ETJ8nnRPleg9SXWClIxjl5iEuwC4DZ/eNXJ7y5LVMJlBSjsuBQt
         v9+g==
X-Gm-Message-State: AOJu0Yw5+CVdi+g7w6Ds7TirHVPHTNbhLqXlYcLxp9bJpP3eacsnJU1n
	Y/mwK/3q2F3DuB6+NkjDz4UGu5GU9kS6NEv3g07Iw79ooYlCvL7Vh64vMr4UTSqx/Oki5XMOWc6
	PoVadMyDUsmsKCYLwv3Co1zAj6blpMYPf5dZXFQ==
X-Gm-Gg: ASbGncsoY7k/+1ZKN01Z4kPDY523oMA2peON90qX0X+qZ9Hl56/kd5o5e/SFPPP4Tt8
	/KdA758eyVH1QR2TLQgM+zMe6tL8imPE84BTo598BsBVltYjVSrW61VD+TEQvM4YM7sdvgROT62
	NYt9wzvQDarWeI7vHsYP41qon+5Nk+qBOGEJG+57scPw4iwkQ4P3SngM9DWPo=
X-Google-Smtp-Source: AGHT+IFWnyesURu6esuBRLn1aBOPla62msPKpa5wcqi6hhh+ucZiyhlsnYkTKs0MzyeHQnWmnp4zbhFPHymhWcLQ9Ng=
X-Received: by 2002:a05:690c:62c4:b0:6fe:c4bd:e2ca with SMTP id
 00721157ae682-6ff2bbf2d39mr4843547b3.14.1741798730188; Wed, 12 Mar 2025
 09:58:50 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Mar 2025 12:58:48 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Mar 2025 12:58:48 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 12 Mar 2025 12:58:48 -0400
X-Gm-Features: AQ5f1JrGwHN6QiCqkD3mTIkMNXJtTghHmWGfnmFzWq0Sea_CS7trLIUhlzF1PUo
Message-ID: <CACo-S-3LA=2Q503VGiwPm_g-ZP7XRYST-_+yh2xVNvxBDC=C-Q@mail.gmail.com>
Subject: [REGRESSION] next/master: (boot) NULL pointer dereference at virtual
 address 00000000000002a0 [logs...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New boot regression found on next/master:

---
 NULL pointer dereference at virtual address 00000000000002a0
[logspec:generic_linux_boot,linux.kernel.null_pointer_dereference]
---

- dashboard: https://d.kernelci.org/i/maestro:160e6c6fbe05a163b029f4e942a1d5b78d55fe65
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  9fbcd7b32bf7c0a5bda0f22c25df29d00a872017


Log excerpt:
=====================================================
[    1.993230] Unable to handle kernel NULL pointer dereference at
virtual address 00000000000002a0
[    2.003096] Mem abort info:
[    2.006226]   ESR = 0x0000000096000004
[    2.010421]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.016365]   SET = 0, FnV = 0
[    2.019781]   EA = 0, S1PTW = 0
[    2.023296]   FSC = 0x04: level 0 translation fault
[    2.028753] Data abort info:
[    2.031969]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.038107]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.043760]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.049704] [00000000000002a0] user address but active_mm is swapper
[    2.056816] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.063823] Modules linked in:
[    2.067241] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.14.0-rc6-next-20250312 #1
[    2.076291] Hardware name: Google Kevin (DT)
[    2.081063] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.088849] pc : devm_kmalloc+0x28/0xf8
[    2.093144] lr : rk_iommu_of_xlate+0x30/0x90
[    2.097923] sp : ffff800082f7b7d0
[    2.101625] x29: ffff800082f7b7d0 x28: 0000000000000000 x27: ffff800081cd1528
[    2.109611] x26: 0000000000000001 x25: ffff800081cd2668 x24: ffff000005875a20
[    2.117597] x23: 0000000000000000 x22: ffff8000816bfef8 x21: 0000000000000000
[    2.125582] x20: 0000000000000010 x19: 0000000000000000 x18: 00000000ffffffff
[    2.133567] x17: ffff000005345c00 x16: ffff0000046f6800 x15: ffff800082f7b890
[    2.141553] x14: ffff0000050eda1c x13: ffff0000050ed27c x12: 0101010101010101
[    2.149538] x11: 7f7f7f7f7f7f7f7f x10: 0000000000142278 x9 : 0000000000000003
[    2.157524] x8 : ffff0000058544c0 x7 : 0000000000000000 x6 : 1d150c11f5f38080
[    2.165509] x5 : ffff000003948000 x4 : 0000000000000000 x3 : ffff800082cec6b8
[    2.173495] x2 : 0000000000000dc0 x1 : 0000000000000010 x0 : 0000000000000090
[    2.181480] Call trace:
[    2.184211]  devm_kmalloc+0x28/0xf8 (P)
[    2.188501]  rk_iommu_of_xlate+0x30/0x90
[    2.192889]  of_iommu_xlate+0x9c/0xc8
[    2.196986]  of_iommu_configure+0x1c8/0x240
[    2.201666]  of_dma_configure_id+0x98/0x3cc
[    2.206348]  platform_dma_configure+0xf8/0x100
[    2.211320]  __iommu_probe_device+0x2d4/0x4c8
[    2.216193]  probe_iommu_group+0x3c/0x68
[    2.220579]  bus_for_each_dev+0x78/0xd4
[    2.224868]  iommu_device_register+0xd8/0x224
[    2.229740]  rk_iommu_probe+0x1f8/0x34c
[    2.234031]  platform_probe+0x68/0xc0
[    2.238127]  really_probe+0xbc/0x298
[    2.242127]  __driver_probe_device+0x78/0x12c
[    2.246999]  driver_probe_device+0xd8/0x15c
[    2.251678]  __driver_attach+0x94/0x19c
[    2.255967]  bus_for_each_dev+0x78/0xd4
[    2.260247]  driver_attach+0x24/0x30
[    2.264245]  bus_add_driver+0xe4/0x208
[    2.268437]  driver_register+0x60/0x128
[    2.272727]  __platform_driver_register+0x24/0x30
[    2.277989]  rk_iommu_driver_init+0x1c/0x28
[    2.282668]  do_one_initcall+0x80/0x1c4
[    2.286959]  kernel_init_freeable+0x1c4/0x28c
[    2.291834]  kernel_init+0x20/0x1d8
[    2.295736]  ret_from_fork+0x10/0x20
[    2.299728] Code: a90153f3 b1020020 f9001bf7 aa0103f4 (b942a2b7)

=====================================================


# Hardware platforms affected:

## rk3399-gru-kevin
- dashboard: https://d.kernelci.org/test/maestro:67d1a73af59fb9874e7cdcbb
- compatibles: google,kevin-rev15 | google,kevin-rev14
- 1 fails since 2025-03-12 15:50 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67c185843218f15c74bcb435
    - on 2025-02-28 09:44 UTC
    - commit hash:  c0eb65494e59d9834af7cbad983629e9017b25a1
    - test id:  maestro:67c185843218f15c74bcb435

## rk3399-rock-pi-4b
- dashboard: https://d.kernelci.org/test/maestro:67d1a73bf59fb9874e7cdcbe
- compatibles: radxa,rockpi4b | radxa,rockpi4 | rockchip,rk3399
- 1 fails since 2025-03-12 15:45 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67c185853218f15c74bcb438
    - on 2025-02-28 09:44 UTC
    - commit hash:  c0eb65494e59d9834af7cbad983629e9017b25a1
    - test id:  maestro:67c185853218f15c74bcb438


#kernelci issue maestro:160e6c6fbe05a163b029f4e942a1d5b78d55fe65

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
