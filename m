Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441DD262804
	for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477313; cv=none; b=PtPAmI0z32bHKNEefW1zYyuvfCK4+aYsvL0Ss0uv9W9KflT6SMwGJd/8QPO3kX+F/mwPtDOdq8cJ+/757R4mmvjoZK4uUQZRdU7NyTm4C9Fw+AQ3rDK41NRq40rV28aQ3feUVCt7tOlo7MEfyWF9B3G4H85GoDyer+ynyvKCFVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477313; c=relaxed/simple;
	bh=3AgR614nhhbeoKc+aTXPEJ4oWbnI6q4D3bhtFYO2aFI=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZmD4Q8xIbEcokzukdee8aASNwfLQ1elyfR+0F37SazBNo7vDCy/aKIpWcJZVmQdg1CFnNgfwA6IwTxJnrirNsZeUdIgiiy1HoWBDlJTD7cHwfkxolGlruuen3IUhb82Vm7KTPZjT2DuhNWl1S8yHqK2WwJ4FuAKCKH7FMjTomWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZKDTwI+P; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZKDTwI+P"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5ddd781316so4350035276.2
        for <regressions@lists.linux.dev>; Tue, 25 Feb 2025 01:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1740477310; x=1741082110; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDNFj+Ucq6ibdY0KNbxgLe238KQewWlgCEmZ8Kr2iDU=;
        b=ZKDTwI+PTb/NdakQOzVu7CHqPtgJTD+c8qkl/7bOnSFthxyoxI5IKCT7dTWiyAVBfg
         uW+30p4msy6O8UcuiEJib2Sh9YrUVR9fPc1PX7C7SCC2jixDzfjn5csF7XtHm46OjhrU
         Nei0C2l2xwuk7m9Z2j6wy+BVeSly6ErIfJqeI9RzbxU9OPr52Xt1e0r1loyHqxldl4Ub
         odXBS8dFijgNG/eOGdIrjRD0v1SRwrLSPHV5TdM71ZUJdgIgr8Nzj90yS48L5OQFhEri
         GHXHlgyfKWIATIMwjTdCLQ2Rbs19eIiuD/bTwEaoHGB8ld5FMaVxht0hDoLZhHvohCQI
         Nobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477310; x=1741082110;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TDNFj+Ucq6ibdY0KNbxgLe238KQewWlgCEmZ8Kr2iDU=;
        b=IflBHFs7ZFaAxbgWlB6cUAQiDNs9SCahO0p619ZuZHYmxbbJjrAoHNFA4oomyM/TEs
         sl7ma2gI4uRDunt2Ena9IUHEaB7oQ55WJmtHHXU3LlmecWSnCXmpTiyTgVbRU+1HxH72
         ZrvH8Fmf9ZNpPTFoKhHkWhuBvqD0QuJz8fnSRAasGNRv9/RcX8T5MnPeB82o2pe44QNx
         K/B2narUtCvz81y0agkCIOrrJd5OYk2fLCjVB5/VeQcI8cJQr52/x6GCewjAbKr9f631
         nuXUHLVBJP5f3A8ZWOBjfBaYkjm7Wbwkewax/MCGYusb/JR/c04W3bhPXgoqJfgPnXik
         qr8A==
X-Gm-Message-State: AOJu0Yyjn6uz4LqewvRsLQu8PuvBxwTDe4MuSNCUB/ems/WtpS0ROA/v
	Qota+iX+EDUnVIdbIGJLaMqg5uqv4PAQ8YcHSK17kJkYYnJJ0guDBsH/3wbtt/AP6XNzRGgwjGU
	VfRb2Ilo5s2LbnoGxT/OXoXGs9rgiSfslcvnUqg==
X-Gm-Gg: ASbGnctlaEF+FGuKsIp+m+BET4SrwbZotZBFnYavmFs5zqsWq9rwDjDGNJ/iM20Asor
	lMmZlBLZfz/DTrKXAEiBEQztPERx4hToHLGbwQ13qZuRM+n2SckB5qkC4yeTQ7vZ5GJ4ptoZoAS
	YGIN29WGgjbsX+w8yGGkxW69cuq1gyKTaxCvuFef4K
X-Google-Smtp-Source: AGHT+IGKWbrxg+DSvZhn4bKihkOUoBeyntqjwBiZUjcbHz0dpDcw3zbuHGCLpu4kuDaNw90T1tpjrWqsXix4/UOxBJY=
X-Received: by 2002:a05:6902:200d:b0:e5b:45ec:b841 with SMTP id
 3f1490d57ef6-e5e8afc44f1mr11583782276.12.1740477310102; Tue, 25 Feb 2025
 01:55:10 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Feb 2025 01:55:08 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Feb 2025 01:55:08 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 25 Feb 2025 01:55:08 -0800
X-Gm-Features: AWEUYZmEkfOGC0Z2EXuI_ywizjBfrCco3heA9qMIUppLpNr18EokkDEDD_xSGFY
Message-ID: <CACo-S-3CDuZpEeJBbP9_f21aRb4B8Vdj784f3J0NPPs+hu0mfA@mail.gmail.com>
Subject: [REGRESSION] next/master: (boot) WARNING at drivers/gpio/gpiolib.c:349
 gpiochip_get_direction+0xc8/...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New boot regression found on next/master:

---
 WARNING at drivers/gpio/gpiolib.c:349
gpiochip_get_direction+0xc8/0x108
[logspec:generic_linux_boot,linux.kernel.warning]
---

- dashboard: https://d.kernelci.org/issue/maestro:f3a22e054a59c4f786527f8c71545728bee8714a
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  0226d0ce98a477937ed295fb7df4cc30b46fc304


Log excerpt:
=====================================================
[    1.920880] WARNING: CPU: 7 PID: 1 at drivers/gpio/gpiolib.c:349
gpiochip_get_direction+0xc8/0x108
[    1.921033] Modules linked in:
[    1.921105] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Tainted: G
W          6.14.0-rc4-next-20250225 #1
[    1.921260] Tainted: [W]=WARN
[    1.921320] Hardware name: Google juniper sku16 board (DT)
[    1.921411] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.921526] pc : gpiochip_get_direction+0xc8/0x108
[    1.921617] lr : gpiochip_get_direction+0xc4/0x108
[    1.921707] sp : ffff8000800d7340
[    1.921771] x29: ffff8000800d7340 x28: 1fffe7c2e0394929 x27: ffff3e170230e3d0
[    1.921912] x26: dfff800000000000 x25: ffff3e1702053000 x24: ffff3e170230e3d8
[    1.922053] x23: ffff3e1701ca48a0 x22: ffffb19df70f4b40 x21: ffffb19df6408000
[    1.922193] x20: 00000000000000bf x19: ffff3e1701ca48a0 x18: 0000000000000004
[    1.922334] x17: ffffb19def596200 x16: 0000000000000000 x15: ffff3e1700950954
[    1.922474] x14: 1fffe7c2e012a137 x13: 1ffff633bf0fb814 x12: ffff67c2e0461c76
[    1.922614] x11: 1fffe7c2e0461c75 x10: ffff67c2e0461c75 x9 : dfff800000000000
[    1.922753] x8 : ffff3e170230e3af x7 : 0000000000000001 x6 : ffff67c2e0461c75
[    1.922894] x5 : 1ffff633bec811bb x4 : dfff800000000000 x3 : 1fffe7c2e343b086
[    1.923035] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    1.923174] Call trace:
[    1.923227]  gpiochip_get_direction+0xc8/0x108 (P)
[    1.923320]  gpiochip_add_data_with_key+0xfdc/0x19a4
[    1.923416]  mtk_paris_pinctrl_probe+0x9b8/0xf78
[    1.923505]  platform_probe+0xc4/0x214
[    1.923584]  really_probe+0x188/0x5d0
[    1.923661]  __driver_probe_device+0x160/0x2e8
[    1.923747]  driver_probe_device+0xe8/0x298
[    1.923831]  __device_attach_driver+0x184/0x328
[    1.923918]  bus_for_each_drv+0x104/0x18c
[    1.923999]  __device_attach+0x168/0x358
[    1.924079]  device_initial_probe+0x14/0x20
[    1.924163]  bus_probe_device+0x128/0x160
[    1.924244]  device_add+0x8bc/0xdcc
[    1.924317]  of_device_add+0xdc/0x150
[    1.924392]  of_platform_device_create_pdata+0x11c/0x1f4
[    1.924490]  of_platform_bus_create+0x290/0x610
[    1.924576]  of_platform_bus_create+0x2d8/0x610
[    1.924663]  of_platform_populate+0x74/0x118
[    1.924747]  of_platform_default_populate_init+0x100/0x120
[    1.924850]  do_one_initcall+0x128/0x760
[    1.924931]  do_initcalls+0x158/0x288
[    1.925008]  kernel_init_freeable+0x330/0x474
[    1.925095]  kernel_init+0x30/0x204
[    1.925171]  ret_from_fork+0x10/0x20
[    1.925247] irq event stamp: 129328
[    1.925314] hardirqs last  enabled at (129327):
[<ffffb19df0ea52b4>] exit_to_kernel_mode+0x38/0x118
[    1.925462] hardirqs last disabled at (129328):
[<ffffb19df0ea5488>] el1_dbg+0x24/0x8c
[    1.925596] softirqs last  enabled at (129298):
[<ffffb19ded7a6e34>] handle_softirqs+0x8ec/0xd90
[    1.925742] softirqs last disabled at (129293):
[<ffffb19ded610970>] __do_softirq+0x14/0x20

=====================================================


# Hardware platforms affected:

## mt8183-kukui-jacuzzi-juniper-sku16
- dashboard: https://d.kernelci.org/test/maestro:67bd70e1323b35c54a882491
- compatibles: google,juniper-sku16 | google,juniper | mediatek,mt8183
- 1 fails since 2025-02-25 08:37 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67bc6ce1323b35c54a85d5e9
    - on 2025-02-24 12:58 UTC
    - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
    - test id:  maestro:67bc6ce1323b35c54a85d5e9

## mt8186-corsola-steelix-sku131072
- dashboard: https://d.kernelci.org/test/maestro:67bd70e2323b35c54a882494
- compatibles: google,steelix-sku131072 | google,steelix
- 1 fails since 2025-02-25 08:27 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67bc6ce2323b35c54a85d5ec
    - on 2025-02-24 12:58 UTC
    - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
    - test id:  maestro:67bc6ce2323b35c54a85d5ec

## mt8192-asurada-spherion-r0
- dashboard: https://d.kernelci.org/test/maestro:67bd70e3323b35c54a882497
- compatibles: google,spherion-rev3 | google,spherion-rev2
- 1 fails since 2025-02-25 08:35 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67bc6ce3323b35c54a85d5ef
    - on 2025-02-24 12:58 UTC
    - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
    - test id:  maestro:67bc6ce3323b35c54a85d5ef

## mt8195-cherry-tomato-r2
- dashboard: https://d.kernelci.org/test/maestro:67bd70e4323b35c54a88249a
- compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
- 1 fails since 2025-02-25 08:27 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67bc6ce4323b35c54a85d5f2
    - on 2025-02-24 12:58 UTC
    - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
    - test id:  maestro:67bc6ce4323b35c54a85d5f2

## sc7180-trogdor-kingoftown
- dashboard: https://d.kernelci.org/test/maestro:67bd70e5323b35c54a88249d
- compatibles: google,kingoftown | qcom,sc7180
- 1 fails since 2025-02-25 08:27 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67bc6ce5323b35c54a85d613
    - on 2025-02-24 12:58 UTC
    - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
    - test id:  maestro:67bc6ce5323b35c54a85d613

## sc7180-trogdor-lazor-limozeen
- dashboard: https://d.kernelci.org/test/maestro:67bd70e6323b35c54a8824a0
- compatibles: google,lazor-rev5-sku5 | google,lazor-rev5-sku6
- 1 fails since 2025-02-25 08:27 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67bc6ce5323b35c54a85d616
    - on 2025-02-24 12:58 UTC
    - commit hash:  4ef7aa6a88280d015c6533a210e46efd55bdb57f
    - test id:  maestro:67bc6ce5323b35c54a85d616


#kernelci issue maestro:f3a22e054a59c4f786527f8c71545728bee8714a

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
