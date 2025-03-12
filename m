Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667D217719
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771873; cv=none; b=Lc8VbUBuPbXWeNqcFUsiATS/ecMZe1NPdyIUVvTX5Pj7s6eUnQvvZyLP93OuwXNS2zCUxFSaRTGAOat4zUVf3XUq2cnBXhw0qhTG5bbS4ABa8Xou719W/eerTxEo4Bqj68+DJ+WSSHm1UBrkdnSdl77Mz8naH1cHMlvQQ0SUWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771873; c=relaxed/simple;
	bh=AJFYsselPuXjJibCrn6MCM+n/v4qg9jDCsprzufOyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoioEzb3iQxdUVuGQIea9qIXsEpB5MeFf+1i+iUlkmpuCklF4JXbo44QV+DNirJVvG16INW7Zc/GPcWWi6HYEY+tssdBUdU6u1AX95cxI04CbZMmWHC5miGQJeUj0qHbP1P9Zny4Pj4kCmhR1d+iR06msmL9uG1dxofGlFwFvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rgp5U1a1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rgp5U1a1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22401f4d35aso115261235ad.2
        for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741771871; x=1742376671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cfHPSAjnz563cQ/IjEM8qX7blxJggGwTnmch5E4glo=;
        b=Rgp5U1a1Cu4vXMbk5l+US5ZpEdU3tsNnwpQrW1gmVZpaEUbPWp35vrYINLMylbtyff
         cX6gIVlyPR7/+hRQDz4tVBFnWKjd3o5sGzCvxvbTlKwy/YhfBr+QNHrwdJeIVhVWpi12
         fO8PXcXp/BPGraE+4hKMn6iv1LzM8sB92VwBt6+LLRW5WpUOFreXR/JETon8PqwHE6Gu
         3dmKVYhAgR1ujEaTGpP67IsWRt5BSfMZr+4+vWEyZCMlc5tQAAkejr88pCbEd8oFIqdo
         J/XFD3XqzFRSDCIQ7zpXKxKpKNRDc8Xew8mtKdEnJKpN9Xo6dx9I9t/y3IcabeeBpIke
         ZlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741771871; x=1742376671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cfHPSAjnz563cQ/IjEM8qX7blxJggGwTnmch5E4glo=;
        b=VkVJIEsNHeeUY/GK0odvnGECvEyQ1SNi7eNb/lGBAY8ZzUSx/3qWE1zROZYtM7rzua
         rGBTA3XaNr7Kjde6iZulHP6xSrfJLjWbLvy41WVAzO8+YFNlPnTpxyiP9PMtgFQNdjg6
         sEZXLzAC67LjdHIhRJ557VzzIrvoZr47lVO0eIdb+CVtw1gpcEGUBymPjgcg2nl+8Waa
         t0hU07TM0sNqBHbezHTLknDZ3z7l7L2iUcpGIo3w1DsYo+InK9UnF0jzPFZxNip0YoGz
         ucRCN3WDtLBi1kT0jf7/2iIlQO9agNMm71thcH05EvkAoBqBHZ70I4/IJcf+aLYCvuaz
         wY7A==
X-Gm-Message-State: AOJu0YyXK4CwkTpYEpVoNF2nicw8RETHr6a79SshPtTnDHmsHHAz71Jf
	qaXH35YDDzn+B+JPCxpkrlCkxTUd8hz32M9lRv7BV9ptddnXp+lf
X-Gm-Gg: ASbGnctMLEmX+F0J1Xq/g7CEQn+ZQakHxSjjO09OFK03W5C9amdCZ+1Lsi8f0PKwEKs
	oBGzUBzpy6AL70D7MYbZ1+E8kGN7QCFX5BNpzCmEzA9AM7szbPXyI4XbXc6u+kTHXneGAfQXdso
	66HV+hEZFiqSRj6dOi/NzYjaTSQR/ipwI+lANccLs4+hFJj/vhWTqKkiU2xhfHJK/pZDQ9kJSQB
	MwufF0zmjE//6DvT16BIcX00YQGlvn6PnFB0AkIVvWGbMW8dUy2f3oTM0dMGM8BCedRiIDc33hW
	7v6NcUyYbYFz8gL5JtFt1WOs+DcU53lO4VGkRwUTg4pH3LcfIPzMjfQqFY8uqHbbRV+WXkT/2NE
	Wzz3T7d8T8pyV0gl3zukOIbSv32z5oA==
X-Google-Smtp-Source: AGHT+IFdwOgvz1/F+51Q44vWmdTDiogqs7ZXg+6WrD2f7crlFUbM2VoU1rMoKZ/WGX3+R43Wz4m2kA==
X-Received: by 2002:a05:6a00:1911:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-736eb87c200mr9370899b3a.16.1741771871047;
        Wed, 12 Mar 2025 02:31:11 -0700 (PDT)
Received: from suda-ws01.. (p1201013-ipoe.ipoe.ocn.ne.jp. [122.26.46.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736af66b00bsm9877956b3a.167.2025.03.12.02.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 02:31:10 -0700 (PDT)
From: Akihiro Suda <suda.gitsendemail@gmail.com>
X-Google-Original-From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
To: x86@kernel.org
Cc: regressions@lists.linux.dev,
	aruna.ramakrishna@oracle.com,
	glx@linutronix.de,
	Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Subject: [PATCH] x86: disable PKU when running on Apple Virtualization
Date: Wed, 12 Mar 2025 18:31:02 +0900
Message-ID: <20250312093103.3334-1-akihiro.suda.cz@hco.ntt.co.jp>
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

