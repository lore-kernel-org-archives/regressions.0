Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B922652D
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 04:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947548; cv=none; b=XbCGYjZMb5UFiTJr6pwDuqTsNDGnKdxZVBmSMDrjrsHkfdTzvZ8RxaTIHn3jhy1Vf0udc0MpoDcxabJFejPpsPg2wZGjOiRed6CwSv+Cvv1HgD0l+GNpeQmRlQawikQfQ2qrjj5BX7vEsQqfpYSut1ORrbVdnf2uVw1AbakKlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947548; c=relaxed/simple;
	bh=2rjZ51Vjdxk+txEo87MW63UU7GVDR4jpXeIFmeA0kOc=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=no9zVbQpmLaQaDtHLbhTaTr+v+4nIwccum3H38GkP9+lV/l/BT0cdFqboZKLvX7mnhKNeuhQbg+rVm36Z+OV05f8JXQESDRYR/ApfkXD3x3TTTsQBlVEhJslZtOqSWRZtCHsJjoGCTI+RBVi6hzZHlYJTEkF4CxVX/x9bf84b/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NAw1R7Jj; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NAw1R7Jj"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so2811990a12.1
        for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 20:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1765947546; x=1766552346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBrg7Q8Znv4r+TiPh36klQqmUa7ldZYP8Xo+HQPHlb4=;
        b=NAw1R7JjxyA+3+NhdZ3cvFIE+rBzOUnppkM0lUN8npihRmbzMorm6sz3/WLnKh2EMN
         0iUHRleBHUds7+S0Uxba0jW4DcDbqFqxdCQcmw+4a84IS9fOzU3r2TIEN3nFN3BkaAtA
         Oe6BdyRAttaLrrb3YkycYEPerXtZdReWO7S1trJYr+0BRYBSTfdJPx4m5id6IjeGRHLW
         Sbxncmcl7Z3pW05UrTwXL2zxcWop1mQbmuEp6CjQ11YU9LP8DhDGc44qGoKxmh1oF/E5
         E3G8562aFuscDjpYTT8CmRDT9YkV5weE6AY3s1xdKL9+QV10+yGfEH+cp9MNK0gRtbQo
         OSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765947546; x=1766552346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBrg7Q8Znv4r+TiPh36klQqmUa7ldZYP8Xo+HQPHlb4=;
        b=oWcisN/Cr+ZGbz31gHxLaudMuBEN7JAojW2JySE7LG6AyYpkeMvo9NGdzzbBE2Dtja
         u8LFDrd1q8VP7LXID6HpU/gbXb5zKYKDufUUom0w8aA5nBojHXcoWFnhngHeIZC55gQd
         0Vji4a4pewckVOzVB2NNrpVe2j7dVTUn3gFFDFOFeLdHMahQHRAMXCc/b1l++4p0el4S
         QTZnwohU/uBd9JJ/x7pV1HSXGR/NtEO1KkdO2PcDPMaMJWl4KKf9XE1dKbu7IIoX98X+
         2NMut4NovlhX4xD9yoWNr1QkLPpH44Qar2RtpGbR2Rwmo7hA1yIlDPwYVAwivHdn6h/n
         KsWg==
X-Gm-Message-State: AOJu0YyfubZILOKXuk2Luz5pPDBib+7CnPdikMUmaUY316d/R1NBp5/L
	AZivVv8v9IhIHN5MJHYvTW8m3exsXXt0elPht/UHU+fKza4FHnD++nkCd69Hdtm2fJw=
X-Gm-Gg: AY/fxX420fmjDoPg+Bt3acU9FwTuErzeSV6zVgqPSsc/dhfhjj8jVw75lFwKZgutcCB
	VcNCSKpfD19J3R20Jm0frGnHfP94WYgVrtrWgRgMeNgaCxrVr4o8dvOLw8AjUSxT+ORZzFzF7mv
	WgaOOWo0rde7gHUytc8V9UETCvuUsmaS5ykDUPnzGZN+fmFtJQvYa9h6Fcg1AsN5+yuF0zSJvOd
	zC/xdgyGAAvVn/hFfeimBopQ4yY/fxAGzgoRe2Wkhz1C0PY/C+ZicKZXcSF6qwMFSd3cnyf38u5
	xW+5zxCSeIx7TZ/HxsePDac4vYMQ8JRO3t/QgG5CLmspZj149Q4ZSMUTCjqO4P9kVzh0LkOBD+7
	6vvGOEVrGBPZn4FYj7ONtY7BYrRb+rhrjdhmhbnMpsXYVwJ7fpO6RrmXcBmLvJ2DqP9msa9NWKj
	wNWvv/
X-Google-Smtp-Source: AGHT+IHYy6TyAlFopXPufQBE1gewJ7kye+X47uFRCWdMX+ULvifQW3rCWBn4TdxZ35bmuKJ2ysXLpA==
X-Received: by 2002:a05:7301:5407:b0:2ac:2d2f:8ea with SMTP id 5a478bee46e88-2ac2f399f88mr8191467eec.0.1765947545938;
        Tue, 16 Dec 2025 20:59:05 -0800 (PST)
Received: from 77bfb67944a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm22088844eec.0.2025.12.16.20.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 20:59:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_initialization_of_?=
 =?utf-8?q?=E2=80=98int_=28*=29=28void_*=29=E2=80=99_from_incompatible_point?=
 =?utf-8?q?er_type=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 17 Dec 2025 04:59:05 -0000
Message-ID: <176594754466.3108.13726691997450676710@77bfb67944a2>





Hello,

New build issue found on next/master:

---
 initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types] in drivers/irqchip/irq-riscv-aplic-main.o (drivers/irqchip/irq-riscv-aplic-main.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  12b95d29eb979e5c4f4f31bb05817bc935c52050
- tags: next-20251217

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/irqchip/irq-riscv-aplic-main.c:111:20: error: initialization of ‘int (*)(void *)’ from incompatible pointer type ‘int (*)(void)’ [-Wincompatible-pointer-types]
  111 |         .suspend = aplic_syscore_suspend,
      |                    ^~~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-riscv-aplic-main.c:111:20: note: (near initialization for ‘aplic_syscore_ops.suspend’)
drivers/irqchip/irq-riscv-aplic-main.c:112:19: error: initialization of ‘void (*)(void *)’ from incompatible pointer type ‘void (*)(void)’ [-Wincompatible-pointer-types]
  112 |         .resume = aplic_syscore_resume,
      |                   ^~~~~~~~~~~~~~~~~~~~
drivers/irqchip/irq-riscv-aplic-main.c:112:19: note: (near initialization for ‘aplic_syscore_ops.resume’)
drivers/irqchip/irq-riscv-aplic-main.c: In function ‘aplic_probe’:
drivers/irqchip/irq-riscv-aplic-main.c:375:17: error: implicit declaration of function ‘register_syscore_ops’; did you mean ‘register_syscore’? [-Wimplicit-function-declaration]
  375 |                 register_syscore_ops(&aplic_syscore_ops);
      |                 ^~~~~~~~~~~~~~~~~~~~
      |                 register_syscore

=====================================================


# Builds where the incident occurred:

## defconfig on (riscv):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-riscv-build-only-69422a0bcbfd84c3cdbdaaa0/.config
- dashboard: https://d.kernelci.org/build/maestro:69422a0bcbfd84c3cdbdaaa0

## defconfig+allnoconfig on (riscv):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-riscv-defconfig-694229a2cbfd84c3cdbdaa14/.config
- dashboard: https://d.kernelci.org/build/maestro:694229a2cbfd84c3cdbdaa14


#kernelci issue maestro:ed08c10e7ce8b2654d125d029bb2aac6dc72096d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
