Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1209A288A7
	for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708335779; cv=none; b=IYWyfyq4ilJI5vQB/gjZWA6TJxUfezvX4jQOEpTk59qDkqNEVbXfR2c2enofA7zjmk/AV/zS0cEaNOEx4hk3rZvdtaMAoMgTaUC7DvOv4Sz0bxlDyRDqfl176+aKWnMCBp7lWP29oQbmUqR1ESk7m66kNOp3QYGEVQ/ACuhhvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708335779; c=relaxed/simple;
	bh=GslTOtA5roMk3ttBbdEIL3hQsmMPYBh8/SEYK4yqAeo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BCZKepr3bvOP8OgaPqiDTHPidXPpUxlxMcXGk/7EOvxmCzUVCOmQ7HKq3VIPKteSnvGmEGNBHFFGelOocrJyWJjHsiYjorpmGVhiOCTSeEW2848+G/BWMm0pFM83vsHnKzsiVaMhPWC5LXydT+0bLwd6Ug5CIylPuKcVsIRGZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+c1Ol6Z; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+c1Ol6Z"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4cb26623d0aso131539e0c.1
        for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708335777; x=1708940577; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HhJNzLN6fXYVLA2iLFB/FZAXUja7DMTX8Jx1BhdjDUc=;
        b=p+c1Ol6ZvSmNMZSVt+2B+9kClN7W+mfoyu2LDvtmQYNAxcOQhcjVn2Jfy6Qkw7T/nY
         le5p955jDiy6t+8zAOFpzU1IXFsfDE80jp+2y23NaByD7r7Wx1SgJBEC9yhJ870tphlG
         FOY3y8mty5y+G/IXsQGV/1otjsCRYU59hJmGQUcvDC3a0aqdT1hGdhMFq5AVwMH1qcax
         WeQYSPtWrfq/+rNpY0C4RFYPQNC3X36Sm40sFS5Y9v1Oci5FIsevM2ge2xMDJ9NQbbfw
         IM/VW7e3dUtjM2xl6/YMcNWiVDYZkI19F8uHusdlXAGWIbpcpZcQbFrkFdCwOYABgLUL
         AEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708335777; x=1708940577;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhJNzLN6fXYVLA2iLFB/FZAXUja7DMTX8Jx1BhdjDUc=;
        b=Lgw8xITESEc6ySQA3hHBDzo5b9FAFZ/tvjk8E1sfz7EN9NqnVV7tMxYnJL6SqcNa9H
         dk6Siiyq+P1qLu72zLWdW7Ocd0slIAd6442PyKmfpyRWN+1DE6k+DZOlfhTZg5N8gwoA
         SlEk+VeB2kzt2XnFYIpYI6orsTnUjcWDrc+GeJPvGKQTjeQ9N75Ti3GEVZvbSFrUEoul
         hFnMJ7fXMzS7/WqWOSG99Lb3cPfWyknWY+XAeTFjVJgp6GGPBAvSHv/kc9qQcbzRHT7/
         +QwLz4CK7d5Irj8VZ/3j3C1vZ0RNoPNRl6f4fcwGXG3fyNf2pCJshAKnKC/i2Z40QImb
         6dTg==
X-Forwarded-Encrypted: i=1; AJvYcCXiToaU0vk3bV9DkqkzcKwyNfUff8MPrRP+Yy/KY+yzz/aj5SrJJV8dB75PJgTp2Mw//xw/2P4iaI7tZoobu6HgUeXkqc+S//IAMUI=
X-Gm-Message-State: AOJu0YxY/0k18UyiW1EkIaxGLky5TsccHlvK8++MMq33/3OiAM3+CySl
	0zt2szhDrXHe64oTG51nQGb1WTkDUnjQNjKZh+s4z1/EeaB161LLBiLETZtsDgEkaTgiQYkNWso
	ugptune0cOLetfLlLAchbIG3r7hfE5Dpk+XD+MQ==
X-Google-Smtp-Source: AGHT+IGWjBozLtCufhEPX2o1mkEOi3JHUxj+S8hpsBLDpuaqRR0hPDEjPlbwIyMmjBof2P9vQDoMgaxnXvwrUjWN0yo=
X-Received: by 2002:a1f:4ac2:0:b0:4c0:2ada:2f19 with SMTP id
 x185-20020a1f4ac2000000b004c02ada2f19mr7163642vka.15.1708335776824; Mon, 19
 Feb 2024 01:42:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 19 Feb 2024 15:12:45 +0530
Message-ID: <CA+G9fYugYiLd7MDn3wCxK+x5Td9WO-VUX2OvOtTN7D1d4GHCfg@mail.gmail.com>
Subject: next-20240219: arm64: boot failed - gic_of_init
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The qemu-arm64 boot failed with linux next-20240219 tag kernel.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
---------
<6>[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
<1>[    0.000000] Unable to handle kernel paging request at virtual
address ffff80008001ffe8
<1>[    0.000000] Mem abort info:
<1>[    0.000000]   ESR = 0x0000000096000004
<1>[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
<1>[    0.000000]   SET = 0, FnV = 0
<1>[    0.000000]   EA = 0, S1PTW = 0
<1>[    0.000000]   FSC = 0x04: level 0 translation fault
<1>[    0.000000] Data abort info:
<1>[    0.000000]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
<1>[    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
<1>[    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
<1>[    0.000000] swapper pgtable: 4k pages, 52-bit VAs, pgdp=0000000042497000
<1>[    0.000000] [ffff80008001ffe8] pgd=10000000439a5003,
p4d=10000001000e3003, pud=10000001000e4003, pmd=10000001000e5003,
pte=006800000800f413
<0>[    0.000000] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
<4>[    0.000000] Modules linked in:
<4>[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
6.8.0-rc5-next-20240219 #1
<4>[    0.000000] Hardware name: linux,dummy-virt (DT)
<4>[    0.000000] pstate: 804000c9 (Nzcv daIF +PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
<4>[    0.000000] pc : gic_of_init+0x84/0x3a8
<4>[    0.000000] lr : gic_of_init+0x290/0x3a8
...
<4>[    0.000000] Call trace:
<4>[    0.000000]  gic_of_init+0x84/0x3a8
<4>[    0.000000]  of_irq_init+0x1d4/0x3d0
<4>[    0.000000]  irqchip_init+0x20/0x50
<4>[    0.000000]  init_IRQ+0xa8/0xc8
<4>[    0.000000]  start_kernel+0x270/0x690
<4>[    0.000000]  __primary_switched+0x80/0x90
<0>[    0.000000] Code: f94017e0 f90007e0 d29ffd00 8b0002c0 (b9400000)
<4>[    0.000000] ---[ end trace 0000000000000000 ]---
<0>[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
<0>[    0.000000] ---[ end Kernel panic - not syncing: Attempted to
kill the idle task! ]---

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240219/testrun/22730192/suite/boot/test/gcc-13-lkftconfig-armv8_features/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240219/testrun/22730192/suite/boot/tests/

--
Linaro LKFT
https://lkft.linaro.org
