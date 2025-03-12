Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9023C8C3
	for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741774187; cv=none; b=foIF+UBWL46tSbpKEOgA5bs3GZR38oIYaAyfYzOTLCA+0u6bpcVV2dH1zVrN7wBgVgQYUnOVfYmc6usY4BG2+MRRjcKHG8wNLEIFhAH3Oob39FI4ElnY8jOhm6h3lLcaLL8LYy0zKAjvl4ZGAWm2ee6X4ynYcCK/1DK7z4OGafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741774187; c=relaxed/simple;
	bh=yeBvl9NQXB6/tc/9Z2/OzmuKYdFcsirwgsfjsOKJD7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASst3MRuLgGEmGmWGJJD7UQ4KurY6eOay19xte+3J9LnI1SypzY32CP5ubEF8SYAldOyVphRfUAJITNztcYorNx6Bn8Bb5+TZLg2W59dGqaOpzNeNxhM6qxWjOYh8GCUFYJ0RxN/ZQvc7xUmv3MBeMZAoUM6XLmAS0T/o7R7quo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhohR/se; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhohR/se"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fec3176ef3so9679078a91.1
        for <regressions@lists.linux.dev>; Wed, 12 Mar 2025 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741774185; x=1742378985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUkmPYNjy0UdU5Zc+KUzHJuQSSwR0lKvxdX/nX9inOM=;
        b=nhohR/seykuOcJ/PH/TodY24E+9eXDWCj3eYBRsNpKiKM/DsGyxUmox4cIPoMd1Z6c
         tsOSKNJR0LixynhCWJtCLJ18p0GSTjXDNZZpYWWj04TZ3vhRqT6tDKdeMhCp9Kuvz0yF
         pTd6UB+bf5Lc+xn/YmPPUAw3Gk5WCM+lo+D8t60tRH4ME8TVNP769exWm+EF29b0ZXNI
         X3r5V4ase35m2vwmYuNA+z66cZ3ArxxTWsRmNYhga+Tp0vU23MB1/wYJTMJs8IFx30Vy
         4iS3+0DdWIESfmhoZvvJN/6RNobp5jnu80TpkVPTGObS6o72Rqu7nNqKoHc9A6Y1nKOP
         jsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741774185; x=1742378985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUkmPYNjy0UdU5Zc+KUzHJuQSSwR0lKvxdX/nX9inOM=;
        b=hvqp3IGEgonaIWbM5k9gacWDde2zMpMw2izZywsxfsUsWsjVcQoibWFjuSAQkdj6VM
         zFuW6ZUlX4MConbDzA+U26bDtoZ3V107sGw3mH9WlqTNVeUD9AB1W91w0EDTe4UOpg+G
         D4BRK/FxX7HCZNYV09oSsPX/pdGv/iv6snZPNleI4uoMTK4i+cSP20GPwSUKyWAmaP0a
         L8VIC3f7oHgXkxMnSuYXGhMBlYXAoOrdfqLa9EERrjT254RnwzAmIq/FYEKNJnHWPwzy
         qvhBAKtEJGc/Eto21xaPdtrruhlWyJehSUPvmGw2PBUyQWWSmn5/okKhEOdqN41x4xyW
         D6hw==
X-Forwarded-Encrypted: i=1; AJvYcCUGXo3PlI82FuY1/rqBPQNn8E/zqGjohNtlX/yYKLs4/5W1CLQPF7g0qxLoWln+zwlXY1GNAtHvWvsVCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIOTLQjEvFVwhvvtQvYAeTN6fWRFHoRnuD/NuFFYFx0FX+7hdb
	BGKrSOVbph74zSoOzEdUvCp56sA4CY2zqDornrgVtQm/OJIxTdiE
X-Gm-Gg: ASbGncv3C1A+1Iseekn3mM5YDTDyKNN3Wo95m7rShcIsq+wuYNO+YLdAnx+cSWUkZNX
	uLsS481iZ3gpyJ84Kv16HuiDCgcSM0a2LcOSvyQ1p3juQrMBHbWOOmLkmSzdL4whGqvJq2mqOX5
	xzTrfR5g3fVXrg8VHGpPc97FvLM9ltii63LiyfXbLdAhl7dkQr+5rd5OBmV7wW1R6lr37OSHIwO
	xSW9OufVPaRj2Kce+Amg1fPCNvUtxP//c+laCIiggqZcM5M7au/Pak9FROtuBRbq+YDQ2/jVLGJ
	CoTTfndskUSRdmpTmDrePAXBTTRnd9cZbNqt/cz357IGmVUXFOt3DF8iYsP7EYIO19xn5bbGdoG
	AL/SFywhi9q/l7iWY
X-Google-Smtp-Source: AGHT+IG5W7avSkqFsM0U4VrqHLdYim2Wlk3cNiyBJN+U721KvUWNp1+CxCtYAdKtRAYZKbtMVRGUAQ==
X-Received: by 2002:a17:90b:17d0:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-2ff7ce7abc1mr31550232a91.13.1741774185017;
        Wed, 12 Mar 2025 03:09:45 -0700 (PDT)
Received: from suda-ws01.. (p1201013-ipoe.ipoe.ocn.ne.jp. [122.26.46.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm112380335ad.91.2025.03.12.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:09:44 -0700 (PDT)
From: Akihiro Suda <suda.gitsendemail@gmail.com>
X-Google-Original-From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	suda.kyoto@gmail.com,
	regressions@lists.linux.dev,
	aruna.ramakrishna@oracle.com,
	tglx@linutronix.de,
	Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Subject: [PATCH v2] x86: disable PKU when running on Apple Virtualization
Date: Wed, 12 Mar 2025 19:09:26 +0900
Message-ID: <20250312100926.34954-1-akihiro.suda.cz@hco.ntt.co.jp>
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
v2: check oem_table_id rather than oem_id for better robustness
---
 arch/x86/kernel/cpu/common.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 7cce91b19fb2..8d78d34cd434 100644
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
+	if (!memcmp(acpi_gbl_FADT.header.oem_table_id, "Apple Vz", 8)) {
+		pr_info("pku: disabled on Apple Virtualization platform (Intel) due to a bug\n");
+		pku_disabled = true;
+	}
+
 	if (c == &boot_cpu_data) {
 		if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU))
 			return;
-- 
2.45.2

