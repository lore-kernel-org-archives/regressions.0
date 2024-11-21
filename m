Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A11DC734
	for <regressions@lists.linux.dev>; Thu, 21 Nov 2024 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732200713; cv=none; b=uh8zOBoj2E//Zrx4G7rkkAHNmucM3nyappYfNwRrmMIZtFO1mu2MjuGCEM0krfuUpXfH+U2jpT/rq4Z/pzHw0gl5ylifQRCx0W17LiaML3bJrzIq6Y7KTyFhZKyvrBDhUZ93etM78CDQmfetwEpMbhVoe9AtteKLDOPPipCF0OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732200713; c=relaxed/simple;
	bh=jqedViYwvun5MakxDt5nbSkxg7ZjzRibKwjbt7Cm3+Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i6d+KsgHALvlqflUkeoE2x7LE0uNMzOHSQQkDZcqOFOZ3eqm0+klc0LTbj9wLC03M+znzLkYzOEVlXhtkmdDdBsMehTsGtMtjOFvNu6S5m4U8VfH4UYZKmeE7NoYazYlamgrK+Fx0uWGh/Bx1wlfeSQTpBAy4EThtdmTf/Fzs6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t3VZWRUX; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3VZWRUX"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e387fdd1ec4so766994276.0
        for <regressions@lists.linux.dev>; Thu, 21 Nov 2024 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732200710; x=1732805510; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IW9hLRAylg+ln+0KOywBCYwaZACv/9u6gJMVewYJ5y8=;
        b=t3VZWRUXi2gFGj1DHSowtSRVK4mqanLeGGHmtKy0yIAsyNOAGRJJKMeHQkImDE7XD8
         8nxYdkC0vvc9D9ViriTI6oXzDY0lJLM0C0LrU2k/tWG89pQe60VrStd2DuVJzeaGFgCW
         l8us9RU68Sa1tTfdWWd1kkscsXo7ilvKFMg8bBQ8RCkmgKfp/hMPNz+iHPf8xy4adQj7
         ovgc5/izkp4tkR70S+svbspDiU3LHVLVoCwcwy8TVWncon4zOciiqyKoTtu1k076t00x
         LRU2Sw2bgwsCMu5tZFOF2yCNa1Ro08DJVCbp3SjsWuzuaM/09UinBdOrW/nX7tH9byL1
         LLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732200710; x=1732805510;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW9hLRAylg+ln+0KOywBCYwaZACv/9u6gJMVewYJ5y8=;
        b=PRhbwRzs0FXRGOdWNsHseau5ML82+m8ubBe099HYPhK4vHxtWb5h3lYAjTgSX7o8hg
         IYX1+Y1uxt3JEO1mMBuIAoR0ZExpCOABAKZmJ7sT92jqjRbKstJT1mxKAolpvR9gXGSB
         38933daRv2VjQ41rP3pnYS46y+FQIQsxYBatpVhA5KqJBINkSRq6HGhQC0DdDMPooGzh
         wDTS1af85qCBR0WyD/5zM4SMsYWpY6FkTkQYc16e3ctIf8Gf0Dlz8gYf7ZF33Yygh1Ht
         +WKehVYIQSTcGjCrVD4jXTu5PXixad3fYIAq1pwLalRH5TKvNIGfECgduna7qaTFTG81
         fi0A==
X-Forwarded-Encrypted: i=1; AJvYcCV92WSfnGRx/5i9y3WYVNDGVBcfajTLwEgWaic4k8jO4auTShVY7NEDzCZhblC5s907sWvMgKBS53oZsA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw3XpVva4WbfQaX01w/W5n7sDNHwOimUccrJX1X+tGxFozJU8Y
	RsTQ5a6DN0qL0cev/MCp7kvQPp2JKiXM+0mK+Up8ZpOpZd0WpJboGutcSu1lv+EqZeAeGauQbNj
	o5rkmHylEgMkCm/GxqyaBEIsQh8Fvh1gJcYHjxw==
X-Gm-Gg: ASbGncuTEPQuDhfzdFZOimjyRsap5ERw+1zIVFPAjh/U84YVEv6EE1cTocP6ReZEeuk
	XKVdAFUvUAI/Bjs2COYFA87A9ERsGmVrJLijC+azj1eKmmKm1q7ZzCWHxV6sYD52N
X-Google-Smtp-Source: AGHT+IH/zeBRHfSwhp5oRXvCEbbAPacPm8jOYa4uMae3tXMP2WsluSNrPTDCyNM9hJkYNCNSFOV2bTGYXYi1Tw0myk4=
X-Received: by 2002:a05:6902:2b86:b0:e38:4d62:5a92 with SMTP id
 3f1490d57ef6-e38cb7170d9mr5809581276.42.1732200710049; Thu, 21 Nov 2024
 06:51:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Nov 2024 20:21:38 +0530
Message-ID: <CA+G9fYurbY3B6ahZ+k+Syp5bZ3a+YQdeX8DRb6Twi4BDEFbUsw@mail.gmail.com>
Subject: next-20241121: arm64: of_pci_supply_present (drivers/pci/of.c:746) -
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
To: PCI <linux-pci@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The juno-r2, qemu-arm64 and qemu-armv7 boot failed on the Linux-next tree.
Please find the crash log below.

First seen on the next-20241121 tag.
Good: next-20241120
Bad:  next-20241121

Juno-r2, qemu-arm64:
* boot/gcc-13-lkftconfig
* boot/clang-nightly-lkftconfig
* boot/gcc-13-lkftconfig-perf

qemu-armv7:
* boot/gcc-13-lkftconfig
* boot/clang-19-lkftconfig


Boot crash log on arm64:
-----------
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
[    0.000000] Linux version 6.12.0-next-20241121 (tuxmake@tuxmake)
(aarch64-linux-gnu-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils
for Debian) 2.43.1) #1 SMP PREEMPT @1732169734
...
[    2.118104] pci_bus 0000:08: resource 0 [io  0x2000-0x2fff]
[    2.123710] pci_bus 0000:08: resource 1 [mem 0x50100000-0x501fffff]
[    2.130054] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000058
[    2.138868] Mem abort info:
[    2.141672]   ESR = 0x0000000096000004
[    2.145435]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.150765]   SET = 0, FnV = 0
[    2.153832]   EA = 0, S1PTW = 0
[    2.156994]   FSC = 0x04: level 0 translation fault
[    2.161888] Data abort info:
[    2.164781]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.170283]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.175351]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.180680] [0000000000000058] user address but active_mm is swapper
[    2.187055] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.193333] Modules linked in:
[    2.196393] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.12.0-next-20241121 #1
[    2.204151] Hardware name: ARM Juno development board (r2) (DT)
[    2.210078] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.217053] pc : of_pci_supply_present (drivers/pci/of.c:746)
[    2.221685] lr : pci_bus_add_device (drivers/pci/bus.c:408 (discriminator 1))
[    2.226135] sp : ffff800082f5ba70
[    2.229450] x29: ffff800082f5ba70 x28: ffff8000827ce000 x27: ffff8000823e0118
[    2.236607] x26: ffff8000822f65c8 x25: ffff8000823be4f0 x24: ffff00082111a428
[    2.243762] x23: ffff0008218a8800 x22: 0000000000000000 x21: ffff000800a230c8
[    2.250916] x20: ffff000800a8a400 x19: ffff000800a23000 x18: ffffffffffffffff
[    2.258069] x17: 00000000f3b41269 x16: 000000006984274c x15: ffff800082f5b8c0
[    2.265224] x14: ffff800102f5ba47 x13: ffff800082f5ba4b x12: ffff800080b5dee0
[    2.272378] x11: ffff8000800171b0 x10: 000000000000002e x9 : ffff80008084b910
[    2.279532] x8 : ffff800082f5b8e8 x7 : 0000000000000000 x6 : 0000000000000001
[    2.286685] x5 : ffff000800a3a850 x4 : 0000000000000000 x3 : 0000000000000198
[    2.293839] x2 : 0000000000000000 x1 : ffff000800a8a400 x0 : 0000000000000000
[    2.300992] Call trace:
[    2.303438] of_pci_supply_present+0x18/0x78 P
[    2.308065] pci_bus_add_device+0x90/0x208 L
[    2.312515] pci_bus_add_device (drivers/pci/bus.c:408 (discriminator 1))
[    2.316616] pci_bus_add_devices (drivers/pci/bus.c:435 (discriminator 2))
[    2.320718] pci_host_probe (drivers/pci/probe.c:3362
drivers/pci/probe.c:3132)
[    2.324472] pci_host_common_probe
(drivers/pci/controller/pci-host-common.c:80)
[    2.328924] platform_probe (drivers/base/platform.c:1404)
[    2.332595] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658)
[    2.336176] __driver_probe_device (drivers/base/dd.c:800)
[    2.340540] driver_probe_device (drivers/base/dd.c:830)
[    2.344730] __driver_attach (drivers/base/dd.c:1217)
[    2.348572] bus_for_each_dev (drivers/base/bus.c:370)
[    2.352413] driver_attach (drivers/base/dd.c:1235)
[    2.355994] bus_add_driver (drivers/base/bus.c:675)
[    2.359835] driver_register (drivers/base/driver.c:246)
[    2.363677] __platform_driver_register (drivers/base/platform.c:868)
[    2.368391] gen_pci_driver_init
(drivers/pci/controller/pci-host-generic.c:87)
[    2.372495] do_one_initcall (init/main.c:1266)
[    2.376338] kernel_init_freeable (init/main.c:1327 (discriminator
1) init/main.c:1344 (discriminator 1) init/main.c:1363 (discriminator
1) init/main.c:1577 (discriminator 1))
[    2.380705] kernel_init (init/main.c:1470)
[    2.384200] ret_from_fork (arch/arm64/kernel/entry.S:863)
[ 2.387784] Code: d503233f a9be7bfd 910003fd a90153f3 (f9402c13)
All code
========
   0: d503233f paciasp
   4: a9be7bfd stp x29, x30, [sp, #-32]!
   8: 910003fd mov x29, sp
   c: a90153f3 stp x19, x20, [sp, #16]
  10:* f9402c13 ldr x19, [x0, #88] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9402c13 ldr x19, [x0, #88]
[    2.393886] ---[ end trace 0000000000000000 ]---
[    2.398565] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    2.406234] SMP: stopping secondary CPUs
[    2.410169] Kernel Offset: disabled
[    2.413658] CPU features: 0x080,00020c3c,00800000,0200421b
[    2.419150] Memory Limit: none
[    2.422207] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---


Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25983314/suite/boot/test/gcc-13-lkftconfig-rcutorture/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25978784/suite/boot/test/gcc-13-lkftconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25978784/suite/boot/test/gcc-13-lkftconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25978784/suite/boot/test/gcc-13-lkftconfig/history/


Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p9DUGD8S9fakSvceaAXMeGBRs7/

Steps to reproduce:
------------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2p9DVXtRiqTj7VZO9wnFlkwmU8g/reproducer
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2p9DVXtRiqTj7VZO9wnFlkwmU8g/tux_plan

metadata:
----
Linux version: 6.12.0-next-20241121
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
git sha: decc701f41d07481893fdea942c0ac6b226e84cd
kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p9DUGD8S9fakSvceaAXMeGBRs7/config
build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p9DUGD8S9fakSvceaAXMeGBRs7/
toolchain: gcc-13 and clang-19
config: gcc-13-lkftconfig
arch: arm64 and armv7

--
Linaro LKFT
https://lkft.linaro.org
