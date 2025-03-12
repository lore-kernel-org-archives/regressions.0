Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71D1CEEBE
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 17:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741798879; cv=none; b=ZnALsz7TuwIQTwMu40mvT6+3HxeiM/PErAESFnRucRBTiIHqSUmHNsG1qyTAcTIHchtoFXybVMEuoB3holjAnHKHQ0vkku7PZ/uv29GG4FPM6E+oV92SvkQlHpaHNCO3XswLbYfR1/GgzHcvcaZtF8LsPv366j6yNjMG32qO+48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741798879; c=relaxed/simple;
	bh=oqcvXeUtAEyhCQDw2sCRkfv+KHtLl2tyjCiWGsE7MAU=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=NzHjXlVJbKp5/GGquSFwBblu2xNqMlrGgSEdu6vzqTGlN+YIjfRmaietWAK6sPyLlvPPCtDeKU60tPUsiI4XlyxK/zgs1OsFQEsGuPi6kU2M92Wspbd6sCzviNxm5J9emrEnLjUMAeseGYAnS7D42J0NUAJHLWv4QramsZIB6lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZXwYenFZ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZXwYenFZ"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f666c94285so42907b3.3
        for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741798877; x=1742403677; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gf9Ir8G5xNX14rdd/mXNOJ57RYfDgIBaE2BcBaHo+ww=;
        b=ZXwYenFZYS2jJpHcenLS2nzvSKGOFiPoEQueJHk4INT20bOjmGtevqUDLmjHJ2CvMs
         rOnBS1e5AOH4DTetQ4Rcf56kmeN57zXpkpuRf+l228yhd9q1ZA47aYfpA1xMRc0hUihF
         YmwpdIKo5xrpSP3aLSPWSoH6cVl7zk1GM/bqEWKTMFYrNlkhl8u2L/W7xXQqaaCMF6Mr
         Z3a8bC4zhBrSmnV4lvfksVa8XV7ANnPOpNoILYSgJhmiiygrxkVNaEM3YtuW1MKaDIrP
         8jf8ZilWoBYQWcn9mpJ5shBeyXHt8959jAK90c5bEu8n2zIlOo9D6XYD22tvJtS+UQp5
         okoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741798877; x=1742403677;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf9Ir8G5xNX14rdd/mXNOJ57RYfDgIBaE2BcBaHo+ww=;
        b=mbHwJKU1Ijm0TyenHvDdv8pXfMPSvPd6fsXYR+r527qUC6uGGdX/KZB3iBhUSlmyka
         qVWc7ECZAXJ3JOub68gpv92awVVnOipiXy84ZxPlX0vy3ka9ipamA2QMs4xnR+ZhnacL
         p/oekNCIrej2jU8Z8AK2anjz7H9frvzAqgqe75LER8coNNWa/vs6BG12RBNBbKEIIXDY
         DUzLl8G4oH9qeb40rNbpfnEI2neo9wgRb6S722rh7FoBkTg2QytPrOPJUQx2CBs420NE
         SerOdlUJ1fwMiuzFWjYi2xhmE7GW4nmgr8GGASP2evDQw1ouTHl4zrR+pNDB39akywWy
         D9bg==
X-Gm-Message-State: AOJu0YyA+i6TNe3oBA0ny+7f9vE+7dgPx6UYq6n06l65WpeyKOAeTKDH
	3Tofm50UmhGgf+U6m0d1fxHyru18gcpZwlXjxLKJd0bMtg42k7C1MpQAGGZaDHZ1SW8R4AdW8ph
	AYH8o6+qN5AXCt5S3aGbygoxP+vVDKx1SGQtXO/m8L6TZPZrHxHg=
X-Gm-Gg: ASbGncubFVIpfXl87oml4bd5gpnqkPfzsmqv19AE5UXXrz0k+mQtm6vWwuXUkrg8824
	ycBOYlUENFhvk5QVF0eycYXw3B2MO7SsVGY0I/t9FZR3MFvyyhWajIC5p78o2jJ3YlClcshA3bI
	jca3w+KFxkpxKHJEcBlRvknIAGkPzXcgnL9iyjOqoTxSBUprMIRXb80zjflsk=
X-Google-Smtp-Source: AGHT+IFzn+jUnPcTjfkFNEFw1qrUEKJvNi7ssIROLNO76X3ue/BuiXiqeRy7dRPGWt2QpNGeU95/KNG43Edpyudy+KA=
X-Received: by 2002:a05:690c:6e0a:b0:6fd:4473:5184 with SMTP id
 00721157ae682-6ff092b483emr120297647b3.35.1741798876599; Wed, 12 Mar 2025
 10:01:16 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Mar 2025 13:01:14 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Mar 2025 13:01:14 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 12 Mar 2025 13:01:14 -0400
X-Gm-Features: AQ5f1JoubM58eZMT5fasWB2-4pGe9XBnp_rB949CGDQeRlELyXbVO0aCHT4S1ns
Message-ID: <CACo-S-2W=N=dcstfejJjEZxPteCWnA1-AfbeBWi-RP81W_doCg@mail.gmail.com>
Subject: [REGRESSION] next/master: (boot) NULL pointer dereference at virtual
 address 00000000000002a0 [logs...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, 
	linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New boot regression found on next/master:

---
 NULL pointer dereference at virtual address 00000000000002a0
[logspec:generic_linux_boot,linux.kernel.null_pointer_dereference]
---

- dashboard: https://d.kernelci.org/i/maestro:7477e32bf511bbe26d161a8b7a28dd1209fae3e4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  9fbcd7b32bf7c0a5bda0f22c25df29d00a872017


Log excerpt:
=====================================================
[    1.556373] Unable to handle kernel NULL pointer dereference at
virtual address 00000000000002a0
[    1.557143] Mem abort info:
[    1.557390]   ESR = 0x0000000096000004
[    1.557719]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.558184]   SET = 0, FnV = 0
[    1.558453]   EA = 0, S1PTW = 0
[    1.558727]   FSC = 0x04: level 0 translation fault
[    1.559168] Data abort info:
[    1.559420]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    1.559898]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.560340]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.560804] [00000000000002a0] user address but active_mm is swapper
[    1.561359] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    1.561907] Modules linked in:
[    1.562180] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.14.0-rc6-next-20250312 #1
[    1.562888] Hardware name: Radxa ROCK 5B (DT)
[    1.563270] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.563879] pc : devm_kmalloc+0x28/0xf8
[    1.564223] lr : rk_iommu_of_xlate+0x30/0x90
[    1.564604] sp : ffff80008005b7d0
[    1.564894] x29: ffff80008005b7d0 x28: 0000000000000000 x27: ffffd437526d1528
[    1.565522] x26: 0000000000000001 x25: ffffd437526d2668 x24: ffff000848884300
[    1.566149] x23: 0000000000000000 x22: ffffd437520bfef8 x21: 0000000000000000
[    1.566775] x20: 0000000000000010 x19: 0000000000000000 x18: 00000000ffffffff
[    1.567402] x17: ffff80008005b258 x16: ffff80008005b27d x15: ffff80008005b890
[    1.568028] x14: ffff000840ca9a1c x13: ffff000840ca927c x12: 0101010101010101
[    1.568655] x11: 7f7f7f7f7f7f7f7f x10: 0000000000142278 x9 : 0000000000000003
[    1.569281] x8 : ffff000840f80300 x7 : 0000000000000000 x6 : 1d150c11f5f38080
[    1.569906] x5 : ffff000840648000 x4 : 0000000000000000 x3 : ffffd437536ec6b8
[    1.570532] x2 : 0000000000000dc0 x1 : 0000000000000010 x0 : 0000000000000090
[    1.571159] Call trace:
[    1.571376]  devm_kmalloc+0x28/0xf8 (P)
[    1.571717]  rk_iommu_of_xlate+0x30/0x90
[    1.572066]  of_iommu_xlate+0x9c/0xc8
[    1.572393]  of_iommu_configure+0x1c8/0x240
[    1.572764]  of_dma_configure_id+0x98/0x3cc
[    1.573139]  platform_dma_configure+0xf8/0x100
[    1.573534]  __iommu_probe_device+0x2d4/0x4c8
[    1.573919]  probe_iommu_group+0x3c/0x68
[    1.574265]  bus_for_each_dev+0x78/0xd4
[    1.574604]  iommu_device_register+0xd8/0x224
[    1.574989]  rk_iommu_probe+0x1f8/0x34c
[    1.575330]  platform_probe+0x68/0xc0
[    1.575656]  really_probe+0xbc/0x298
[    1.575973]  __driver_probe_device+0x78/0x12c
[    1.576358]  driver_probe_device+0x3c/0x15c
[    1.576727]  __driver_attach+0x94/0x19c
[    1.577067]  bus_for_each_dev+0x78/0xd4
[    1.577406]  driver_attach+0x24/0x30
[    1.577723]  bus_add_driver+0xe4/0x208
[    1.578054]  driver_register+0x60/0x128
[    1.578395]  __platform_driver_register+0x24/0x30
[    1.578812]  rk_iommu_driver_init+0x1c/0x28
[    1.579184]  do_one_initcall+0x80/0x1c4
[    1.579525]  kernel_init_freeable+0x1c4/0x28c
[    1.579913]  kernel_init+0x20/0x1d8
[    1.580224]  ret_from_fork+0x10/0x20
[    1.580543] Code: a90153f3 b1020020 f9001bf7 aa0103f4 (b942a2b7)

=====================================================


# Hardware platforms affected:

## rk3588-rock-5b
- dashboard: https://d.kernelci.org/test/maestro:67d1a73cf59fb9874e7cdcc2
- compatibles: radxa,rock-5b | rockchip,rk3588
- 1 fails since 2025-03-12 15:42 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:67c185863218f15c74bcb43b
    - on 2025-02-28 09:44 UTC
    - commit hash:  c0eb65494e59d9834af7cbad983629e9017b25a1
    - test id:  maestro:67c185863218f15c74bcb43b


#kernelci issue maestro:7477e32bf511bbe26d161a8b7a28dd1209fae3e4

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
