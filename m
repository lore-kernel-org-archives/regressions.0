Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11B23497B
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771958; cv=none; b=uVQOumJdmyFoWMjbI34M5NYCPYssk0noOQ4/MU8A6TjCaeNhiiJfIXnojY5pVaKr641MGZBXL259/22l4MmyozmPxiX1IsCV+X8FrJBol0TsJFgxyhtGYuW88DkVk4Nf/55kC6aBsEhmTc50oxu/HRt1RGR8jONunUDWU3popt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771958; c=relaxed/simple;
	bh=AJFYsselPuXjJibCrn6MCM+n/v4qg9jDCsprzufOyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDFSZod7WPgDb0m1b6yNXlRb3hetd9dy270tJsPuqMNXi7ex45QEx1gZx126koJFkLfVqqxEijbdNNDKJ/l/cYnsk8dLTrPQ46i0djqK/UzqBpIm3em4lqOjc4QKGXNlje/6fLR7rnDS9aZ7fQaqOI3/30MFZXgf5oDbW977t0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DID4sjIz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DID4sjIz"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22409077c06so34266345ad.1
        for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741771957; x=1742376757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cfHPSAjnz563cQ/IjEM8qX7blxJggGwTnmch5E4glo=;
        b=DID4sjIzWNuyJgwqfJT48i65v1sh3jLTtTevcweQMRmclCLjCRgrM791stZLCFraMs
         Fo4gSrqaxShF+dQCS45TP7KSc1zRlOpszxZVFJMoeJZ1PwXYmlthE5c9A355+8NP+qob
         7TrJOkVyH0G+CQSxGnQjZ1XwYhe+AIhVd3Y7Zg2050MAlcMyo2VDJz1M2fxz/KtavA9b
         pcP/14R7+1rH8IahDDqRTEksPOoKwWwoGbr0d3VgeZjersvoE9yQp7m3T2EZNU7N4eFb
         Kt3X9NG1Tj7JP0Kcq8oYWl65uYNyqcbF4900Mg2vQAifFJ7pWA+ZZWmfdYfJovqETLJ1
         ihhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741771957; x=1742376757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cfHPSAjnz563cQ/IjEM8qX7blxJggGwTnmch5E4glo=;
        b=KsVTij+JlaPbRKPYXqXVLz6nSO8eoLMi88PFvvjchWqiWkANpQ5I7pz4msxcIfqhbT
         6FLqWZXSH64z3/G0a3gcwAIDHf4H2zvC/pf6/DESasmQ/+t7de/KFLS7X8nNiEyLpJnY
         Q5LVwceC621s7+FCs0B6JhuztcwxYvpzETqJSqaLtA6wTlFRXCil32dv1JOihb+zupA9
         QXOidqfuem0WiKqKZ4gBOOuWE+qnX803loZVP/w1gnhZgi+ozbId7eU8TIu+1wltR/bV
         Jslta97Dq24fLV+a8MyzzhnnOV5Xy6yd0VAM01cYtiOR6gux61+GE1L8WMFw/6EUC5pf
         JXHA==
X-Gm-Message-State: AOJu0YwyKa/kDm2VesIlrm7kmtlb1fhS0HihQYmEHdVsB+7bLt4BA9t4
	Tl1+9gPPBFUcAtOZWfcldWfR2LFHJBYZX1D+ttcO6Yg29nG624hV
X-Gm-Gg: ASbGncs0RrJmPmvB9Cb8TELsosiMwj3pOMJJPPplSWH3M/Pfy7fHjVJUX6/ftPYE68o
	XNlumT4x11klZrkKDWkxJmIw1EW6cEpNS7+DV95Fml5Jk6CF8oAx/RCPLwsYvFD7jmtf0Rt7Yk4
	xAhWrJi7q1wzIWgJRQ8+nJMnP2PTILXk1s1ZYTJuLrs980tayWpYNv6xCdQXNXfQQKHHd+BIPUt
	1PDU+jaQCAFt/rKD92s8GTcdccQF1SwYzB+pBaYCI9p6MeVhv7cy9/QaK8O9HRryar4Z96DyfnL
	qL6BN9uaomR9+ZoKenI1Zqtr+5pcPyB1jJG7mv+pgkoc64rxsh0PdFlVSWlpAJ/r4miIo/8aiZb
	S6E5UVbO1fgyEyXIfK4MY2eC4rAo9WQ==
X-Google-Smtp-Source: AGHT+IEdWqxtRSKZJaNBT3VK9xNg2FCjGk+NjprQF7hahePcPlMzKgKclRgwuixtKQWrPYtVizKMbg==
X-Received: by 2002:a05:6a21:515:b0:1f5:86f2:ba57 with SMTP id adf61e73a8af0-1f586f2bc04mr14463183637.30.1741771956625;
        Wed, 12 Mar 2025 02:32:36 -0700 (PDT)
Received: from suda-ws01.. (p1201013-ipoe.ipoe.ocn.ne.jp. [122.26.46.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af286bb9f26sm10522886a12.25.2025.03.12.02.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:32:36 -0700 (PDT)
From: Akihiro Suda <suda.gitsendemail@gmail.com>
X-Google-Original-From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
To: x86@kernel.org
Cc: regressions@lists.linux.dev,
	aruna.ramakrishna@oracle.com,
	tglx@linutronix.de,
	Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Subject: [PATCH] x86: disable PKU when running on Apple Virtualization
Date: Wed, 12 Mar 2025 18:32:23 +0900
Message-ID: <20250312093223.3362-1-akihiro.suda.cz@hco.ntt.co.jp>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CAG8fp8Qdmt9vLk=8ORccY5B+ec1huhazXG4PBaNyLEkq31HDjw@mail.gmail.com>
References: <CAG8fp8Qdmt9vLk=8ORccY5B+ec1huhazXG4PBaNyLEkq31HDjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OSPKE seems broken on Apple Virtualization.

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

Tested on macOS 13.5.1 running on MacBook Pro 2020 with
Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz.

Fixes: 70044df250d0 ("x86/pkeys: Update PKRU to enable all pkeys before XSAVE")
Link: https://lore.kernel.org/regressions/CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com/T/#u
Link: https://github.com/lima-vm/lima/issues/3334
Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
---
 arch/x86/kernel/cpu/common.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 7cce91b19fb2..6a701ec2b42e 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -26,6 +26,7 @@
 #include <linux/pgtable.h>
 #include <linux/stackprotector.h>
 #include <linux/utsname.h>
+#include <linux/acpi.h>
 
 #include <asm/alternative.h>
 #include <asm/cmdline.h>
@@ -516,6 +517,21 @@ static bool pku_disabled;
 
 static __always_inline void setup_pku(struct cpuinfo_x86 *c)
 {
+	/*
+	 * OSPKE seems broken on Apple Virtualization.
+	 * https://lore.kernel.org/regressions/CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com/T/#u
+	 *
+	 * TODO: conditionally enable pku depending on the DMI BIOS version when Apple
+	 * fixes the issue.
+	 *
+	 * However, this would be still not enough because DMI is missing when vmlinuz
+	 * is directly loaded into VM.
+	 */
+	if (!memcmp(acpi_gbl_FADT.header.oem_id, "APPLE", 5)) {
+		pr_info("pku: disabled on Apple Virtualization platform (Intel) due to a bug\n");
+		pku_disabled = true;
+	}
+
 	if (c == &boot_cpu_data) {
 		if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU))
 			return;
-- 
2.45.2

