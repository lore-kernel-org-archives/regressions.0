Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB52DCF77
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755725534; cv=none; b=jO1XGxCBOrYr7frdAmanxKSEsP92XYRfxRR3f4AMtnsOTUDWuLDyqHavwfZkDRXmO2yPcHKaRwuzQ4/RvbHdv6Vc9c2ycVoexFg85GnuCfqJmcBqzvZNLUlIjfov7Gpo7SR6ZCrbK4cNDIhNOKIFwitU2WFRkadL2KmW+1tzgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755725534; c=relaxed/simple;
	bh=3xpW3vbTXuAa4h70YLTRF4ZpMZcLo2DxjvNjcdzDjPo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=lDB2kvo3Um1EeF5kQ0O5fJsdI0MApr/JkRm1YX2TuLcYZ9ZylzPm/iRAA9QaCfEfpsMJULqpzy7hn0WrBlMFLn0TDS3/jI98uOxKxX+wEOB4pfrGqmOm0XMuNi7/C4BwCsti2nXan6tA8tpdnca+OmDCH8y8pNrz9MAEmwGpcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=lER7st8D; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="lER7st8D"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-245f2a8fa81so9005745ad.0
        for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755725532; x=1756330332; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InuGVvwTKh+B2hT/7asI2kNXOmTYdYr5ePDpN0Ushgs=;
        b=lER7st8DnL0Chav2a88veUpdJtaFDTH9f9BnnbxV4C4xRXDx2hdRxsCseuAVwboSZ+
         KmfqzetlBhFvFOvrPv9xmQpCovH9N4YQkTSRDDzF5+Z3S18DdWZ5pH72uHUXBNNMEXxL
         Fpn1ZNks18Ynnhl9ytl1MtGZz1oMyh4YWBakQXVY2By9bV3ZD5no8vC8HkRqIYly8/tT
         QbLAQqwhVUV1XhRC5Opjq9VK1QNOLFQVh//s9zj/YrRP6jzs/QjnfwfPNiYj1D+jhQw0
         c1SmkzE2rymaz52BFh5AxP5u50IDPgToOO/InGUID6Lw8xgWPX+0rV7eMVVQ4mo005BA
         RGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755725532; x=1756330332;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=InuGVvwTKh+B2hT/7asI2kNXOmTYdYr5ePDpN0Ushgs=;
        b=MKGqmYY8XCHM6581PTI8dujgf0tg7wBuzxtsSRiT+OKpPv7RdL6BDrqsxHraiu5tUH
         r5Ovl2sbSDW5vIxSQoACSkGKWu/azjEJbN3BNp8PWy2rRwHMYIyMtR/1weT/WpC939XV
         ZxWSTU0assP3SyVqJ2yUwo3ogn+eic9cNlCCvtJW9OHSm7VMwSE406mOvLeC5FnC3KMb
         dEAtcQeinUm3qISRW4vGCozNDGGokTLEJURh+fjhpdsDKEHCJanHDogl1+ObiK22QjsN
         TwEDrNDfSZ6GZp1MnoqDCA2yaBGkNYe6MYYKrh/enCZXYsUy0qCMrg3AcMkOMgj/OqkW
         5Z3A==
X-Gm-Message-State: AOJu0YxJEKLkDWD38DqkiEmxsZwquQj+ElE6jMl149crvpN7Fr7VMqO7
	GT+H0ySxriIyXJZoSI0zlntFlS1kf/+FBSnhGXNXD6pofcM7JLWqKtApzHvo75h1nDg=
X-Gm-Gg: ASbGncvIJ9SHCu3/pj1SPXGoO6PlQ7gan6IN+HlnuO+107A1FSa0aF93hRua/qHRSv2
	SqkoDuVKT+pKeWaZm3aJ5aoKX14vnmNtOEBRIemw0RDLEYZ2mGEH9Kmf/avUgtP0/1Y4zDDOvyZ
	w52DK/EK2KoeuL7aveJC0rkkpcUqv3LrLM5sN+kSEmBZWLd7xBU+fjeHeekkea3Czwqntc51v5o
	0oW7U0hTdlv0lb9AzOG92iu+7GWf2qJLUFAWlrSvTAON4byFLFHOyOMt1KuS/K906qib9KWWvrw
	PfU3R9qGBwmXxougNR1ztp0Hp3KRewzRhlLzpaY3s9F+gVTjbalLaq4NDj/ucDGXCSc0W0T6J3s
	xrWvG52IrlBjSqA==
X-Google-Smtp-Source: AGHT+IGHrnK9yr9BayI7JczkiTs7D79VmmcsxOmdpCvqDTiMCnbNAzM8z3QBRa/SiLP49Mnj2HfpUQ==
X-Received: by 2002:a17:903:3d0c:b0:23e:3911:433e with SMTP id d9443c01a7336-246028e3f7emr238035ad.5.1755725531947;
        Wed, 20 Aug 2025 14:32:11 -0700 (PDT)
Received: from poutine ([2804:1b3:a702:7d26:1577:2536:a82d:763b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245fb80cc20sm8412335ad.81.2025.08.20.14.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:32:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (boot) NULL pointer dereference at virtual
 address
 0000000000000000 [logs...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, kernel@pengutronix.de,
 linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 Aug 2025 21:32:09 -0000
Message-ID: <175572552798.3846090.14922877369801775537@poutine>






Hello,

New boot regression found on next/master:

---
 NULL pointer dereference at virtual address 0000000000000000 [logspec:generic_linux_boot,linux.kernel.null_pointer_dereference]
---

- dashboard: https://d.kernelci.org/i/maestro:1c62b4814576fd3f202d7069afdd657b704f7534
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  5303936d609e09665deda94eaedf26a0e5c3a087
- tags: next-20250820


Log excerpt:
=====================================================
[    0.627596] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    0.635868] Mem abort info:
[    0.638638]   ESR = 0x0000000096000004
[    0.642411]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.647746]   SET = 0, FnV = 0
[    0.650800]   EA = 0, S1PTW = 0
[    0.653958]   FSC = 0x04: level 0 translation fault
[    0.658863] Data abort info:
[    0.661737]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.667258]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.672333]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.677671] [0000000000000000] user address but active_mm is swapper
[    0.684059] Internal error: Oops: 0000000096000004 [#1]  SMP
[    0.689741] Modules linked in:
[    0.692805] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc2-next-20250820 #1 PREEMPT
[    0.701727] Hardware name: NXP i.MX8MPlus EVK board (DT)
[    0.707065] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.714064] pc : __pi_strcmp+0x20/0x140
[    0.717912] lr : pinmux_func_name_to_selector+0x68/0xa4
[    0.723165] sp : ffff80008304b590
[    0.726487] x29: ffff80008304b590 x28: ffff0000c0ad02c0 x27: ffff800081ee00b0
[    0.733662] x26: ffff800081c8e260 x25: ffff800081c8e000 x24: ffff00017f3cc0a8
[    0.740837] x23: ffff800082af68b0 x22: ffff00017f3cc0a0 x21: 0000000000000001
[    0.748012] x20: ffff0000c0ad00c0 x19: 0000000000000000 x18: 0000000000000010
[    0.755187] x17: 20297328656c6379 x16: 632079636e65646e x15: 0000000000000001
[    0.762362] x14: 0000000000000000 x13: 0000000000000002 x12: 00000000000b7b02
[    0.769537] x11: 0000000000000040 x10: 0000fffe80c33f60 x9 : ffff0000c0ad0100
[    0.776712] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000000
[    0.783887] x5 : 0000000000000000 x4 : ffff0000c0ad0108 x3 : 0000000000000000
[    0.791062] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00017f3cc0a0
[    0.798240] Call trace:
[    0.800690]  __pi_strcmp+0x20/0x140 (P)
[    0.804540]  pinmux_generic_add_pinfunction+0x28/0xe0
[    0.809612]  imx_pinctrl_parse_functions.constprop.0.isra.0+0x140/0x488
[    0.816262]  imx_pinctrl_probe+0x440/0x508
[    0.820374]  imx8mp_pinctrl_probe+0x18/0x24
[    0.824574]  platform_probe+0x5c/0x98
[    0.828250]  really_probe+0xbc/0x298
[    0.831837]  __driver_probe_device+0x78/0x12c
[    0.836212]  driver_probe_device+0xd8/0x15c
[    0.840412]  __device_attach_driver+0xb8/0x134
[    0.844877]  bus_for_each_drv+0x84/0xe0
[    0.848727]  __device_attach+0x9c/0x188
[    0.852577]  device_initial_probe+0x14/0x20
[    0.856775]  bus_probe_device+0xac/0xb0
[    0.860625]  device_add+0x5cc/0x79c
[    0.864127]  of_device_add+0x44/0x60
[    0.867714]  of_platform_device_create_pdata+0x90/0x124
[    0.872962]  of_platform_bus_create+0x158/0x39c
[    0.877512]  of_platform_bus_create+0x1a0/0x39c
[    0.882064]  of_platform_bus_create+0x1a0/0x39c
[    0.886614]  of_platform_populate+0x74/0x108
[    0.890899]  of_platform_default_populate_init+0xf0/0x108
[    0.896327]  do_one_initcall+0x80/0x1c4
[    0.900177]  kernel_init_freeable+0x208/0x2e4
[    0.904552]  kernel_init+0x20/0x1d8
[    0.908052]  ret_from_fork+0x10/0x20
[    0.911644] Code: f240095f 54000401 b50002c6 d503201f (f86a6803)

=====================================================


# Hardware platforms affected:

## imx8mp-evk
- dashboard: https://d.kernelci.org/test/maestro:68a55d5d233e484a3fa29ea6
- compatibles: fsl,imx8mp-evk | fsl,imx8mp
- 1 fails since 2025-08-20 20:03 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a4264f233e484a3fa08a8c
    - on 2025-08-19 07:22 UTC
    - commit hash:  886e5e7b0432360842303d587bb4a65d10741ae8
    - test id:  maestro:68a4264f233e484a3fa08a8c


#kernelci issue maestro:1c62b4814576fd3f202d7069afdd657b704f7534

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
