Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A418F2DF
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 08:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942135; cv=none; b=ZxELCWabzJZ4RONdU9Hh3t6/b7fN+yZSiQFb+BjInlAo5YBJpRrGubyViPBMUnKtEycodAlyzGWiHvIOW9V2lf/69PN50k8OggFAW0GExxfbKxpSsZoJ40Ax7x73MoWOhRlV26WkqZy6jTZcoWU6PiIcSwgiT+ANXGtydc5MO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942135; c=relaxed/simple;
	bh=izFKGd6NIgePdak/hVqrXszrqeizjfGI2wWT42fp3+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mr8b44lvxrpydXrm5p6t0kofUwp//m+efKIe0oBgJE8Y1giJ+WDQhrFLMZaK4sqd7oavPFmeu+zZdBcINPVLDzSXnSvHI5WJq7/oGZTQ3ZP7A4A/UVBY7u4aYlOsSSYR2exM5aY0ZUKDpAsFfjSLQHzt4SDRkoLwyjDFItIR5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxBQ6nBU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxBQ6nBU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22548a28d0cso54257565ad.3
        for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741942132; x=1742546932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToBMldha4NXdM4Yn/DOmK+H4G7j9iFfVU8ytUf5bV8g=;
        b=kxBQ6nBUCLCYiUYiEzEjhBuK1BB2xbvnavBTT62XD/x6YthVv7jzGf/Ba04Z95FIsU
         cw8+3MyZkqCW049f8drGnCWCSKY6ElIIntpFovkwxPp9XbOX4GwyfArSDb6a9UN2yRS1
         PjN1Ga0w4cPLtggh/+VPoouDLsujzxWhik1QUCILaEXSJU7WmrLKzP6bgXlXHDR/Ql1m
         VLUW8J0eJZ99RA0TFQaYA4o2IY3N4/3j6TcebONgOr6fJJU1cvA9jdISYcpOmJRxUfte
         dSiNiJbZRBSD+YBp0E/0EUcdwNf/yiSs5At/4kX7CCl+5d/lZjk6Ywx2HYAai1QGEmnw
         LR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741942132; x=1742546932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToBMldha4NXdM4Yn/DOmK+H4G7j9iFfVU8ytUf5bV8g=;
        b=GOtVcDv2x/xEGlNbHARWOAD/Tla+ux2E4rzN0dolYvnsn72DmHQG17gL5dF5TjYoZ4
         NlN86zpxZ4L5pQ5ym67X2td8/K/CaIR63olv9qkScRZyjlY4rpjM/vWyBbBWS/eReKkA
         kx9Y1QuAB6ZP9n5stikHiwAk6aoUtkjlbkxzpqbsTiI4Wo5/t7hwAStTj2Lyfya/RCUQ
         3TFiMSsh6Vj2OZSF6WZzG0BXECbQoqgol9ntXqfHQ1BxT8emmG8Y2tc+8WpdstY74gqj
         kt7E4kmAjQ1hZ+qyGtjG0u6nwEoEUSatdhCZa7gBG4hWyZMPZeR6R8yYSA+MQVufyTLi
         yLkA==
X-Forwarded-Encrypted: i=1; AJvYcCUFOv+PB4ifmev3bnBvFWtboFLBq120byx1SUc58PlDeR5o+3J5eExO2zJJXiC345XQR6AQcXzINFQ2sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfah24QyWPXjlk5Kfk6wg3J9tFZSlCPpx1xHEKkA2kTGP/LhY2
	Lv41GoOQ7Kb2MQb7DLebZ2fui4po8V0v+SBLMBJ6VOgjeNDCxA1p
X-Gm-Gg: ASbGncvIQYTk4gPy7zKI1g8ii8txfmGMi5EKkftlRObhcEX1C1+ii3DAN4lttW4xLEx
	ixIectNEcU9kzoUz5VTRoojvtqp9KEPy8ssJmCObRml+2DctYKJfiW5ls4GHloMUkwwe+ORMvrE
	1uaNk56B5w/poAEgDsvPBYkoPEPt27mfuBTLf2/Ah4d3c0Lefy8zbh4PsoUhyPM5NJYlXO2ojxm
	BhXKMGx8FkxQ8w0e/7XRjV9NzIrtxSIb32GPcuEDrZzDAtV6wLBB/MNu8pCEzwhJgLL+soiMCin
	3/oevlAF7yprzBPdJP5DL4GWNjhKyiW3DMHu6617g+oxh7yP18vhMegaCRNtT5ooR2OjNsKTUD/
	EjihGuus+Iu6aDTwJL9jhQRd89NA9ZQ==
X-Google-Smtp-Source: AGHT+IHNO30cGGLGuV0WLrMnJ/Sw+C7qW79wTrVUmizif/e7ihpkQc6O9ilMkMKWsarELvo9s7M3+w==
X-Received: by 2002:a05:6a00:2389:b0:736:ab21:8a69 with SMTP id d2e1a72fcca58-7372225a7eamr2482874b3a.0.1741942132421;
        Fri, 14 Mar 2025 01:48:52 -0700 (PDT)
Received: from suda-ws01.. (p1201013-ipoe.ipoe.ocn.ne.jp. [122.26.46.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711551245sm2601955b3a.57.2025.03.14.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 01:48:52 -0700 (PDT)
From: Akihiro Suda <suda.gitsendemail@gmail.com>
X-Google-Original-From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	stable@vger.kernel.org,
	suda.kyoto@gmail.com,
	regressions@lists.linux.dev,
	aruna.ramakrishna@oracle.com,
	tglx@linutronix.de,
	Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Subject: [PATCH] x86/pkeys: Disable PKU when XFEATURE_PKRU is missing
Date: Fri, 14 Mar 2025 17:48:18 +0900
Message-ID: <20250314084818.2826-1-akihiro.suda.cz@hco.ntt.co.jp>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
References: <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even when X86_FEATURE_PKU and X86_FEATURE_OSPKE are available,
XFEATURE_PKRU can be missing.
In such a case, pkeys has to be disabled to avoid hanging up.

  WARNING: CPU: 0 PID: 1 at arch/x86/kernel/fpu/xstate.c:1003 get_xsave_addr_user+0x28/0x40
  (...)
  Call Trace:
   <TASK>
   ? get_xsave_addr_user+0x28/0x40
   ? __warn.cold+0x8e/0xea
   ? get_xsave_addr_user+0x28/0x40
   ? report_bug+0xff/0x140
   ? handle_bug+0x3b/0x70
   ? exc_invalid_op+0x17/0x70
   ? asm_exc_invalid_op+0x1a/0x20
   ? get_xsave_addr_user+0x28/0x40
   copy_fpstate_to_sigframe+0x1be/0x380
   ? __put_user_8+0x11/0x20
   get_sigframe+0xf1/0x280
   x64_setup_rt_frame+0x67/0x2c0
   arch_do_signal_or_restart+0x1b3/0x240
   syscall_exit_to_user_mode+0xb0/0x130
   do_syscall_64+0xab/0x1a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

This fix is known to be needed on Apple Virtualization.
Tested with macOS 13.5.2 running on MacBook Pro 2020 with
Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz.

Fixes: 70044df250d0 ("x86/pkeys: Update PKRU to enable all pkeys before XSAVE")
Link: https://lore.kernel.org/regressions/CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com/T/#u
Link: https://github.com/lima-vm/lima/issues/3334

Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
---
 arch/x86/kernel/cpu/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e9464fe411ac..4c2c268af214 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -517,7 +517,8 @@ static bool pku_disabled;
 static __always_inline void setup_pku(struct cpuinfo_x86 *c)
 {
 	if (c == &boot_cpu_data) {
-		if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU))
+		if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU) ||
+		    !cpu_has_xfeatures(XFEATURE_PKRU, NULL))
 			return;
 		/*
 		 * Setting CR4.PKE will cause the X86_FEATURE_OSPKE cpuid
-- 
2.45.2

