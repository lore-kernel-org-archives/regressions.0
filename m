Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC183DE457
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177499; cv=none; b=IlI0ChVIBrkXuwE5/P54gk9YCN/luAyXMKyKvq4fNP0tW+GqqPaT05O9PFK8ATY2MgYpzog0v5Skt0wMqWysLQ67g/938Tb+Of+r5yvrDvk6NxuPhKi/sS7vEg8ecJMIqtgeNjwYWeSVvEVB+H8Cy0h61HAaoRNUOWyw75normI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177499; c=relaxed/simple;
	bh=qSmvIDluYHg5lZ1R/2z3mlCH889NGwaa3iiw3jrqOUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YrIoEcqjO5bwmRZaxhmQ7YBRWRfre7AJMpdQLBZNGxkwI8UJ7eQVCRp0nRLMpvVb/8wAVzExYf7v55M7LruFgxt9/B8MB2fG+0tBTg9ML5tP2G0ezOiNxAuUip4EBO5jhKs01v3LmW9G2QItGqArPDlND/xdvrkRwj6KtM8tnko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9oNR5WG; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9oNR5WG"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-132c338a537so2645138c88.0
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 00:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177497; x=1779782297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLE/5Z5x2pvR1MzqaWWc0fqhrvQQle2p46SKkWlKzS8=;
        b=I9oNR5WGGJpbwg5VCNujXIHVluSLkEnorygwfrBr80m3hYWJRr5BPjXmz1XUOJixe4
         tRyZWUWblc4+B5/CjQTSPvt65eQu09OYbx84/WklzeMQk+rvRin703HjGECMp71rWQFf
         JZxlJSc8HxIgFz9dCr5zx8n7KVjqncts9yUqUhLkN4mNDEbegnw54pjW7dXFW3GyE+83
         siaz6HWmflCHrofYXS8vwcw7lq6UuJjpzMGg3oOo3+OKO2r59FOWt5bMGKXZfGCklvlT
         sMVj29732gyxDME/cgagLyQope+587SFCvxyu6pT5IaW3yOjll9hnizFTT3Y5/5+ywLw
         yllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177498; x=1779782298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLE/5Z5x2pvR1MzqaWWc0fqhrvQQle2p46SKkWlKzS8=;
        b=cR8WhzSJBLEVejyM0V8KL0GLGBylcxKR4Ng/95Wx3wEHvfR3SIrTi3edRHpTMB8Y+j
         jRBqLTEuVmQCo3F4lkqH/T3bu/JGsubXEG+2Z749DrOZjsIHLF2rMNxIekHLJ+mlNZ8U
         X791JNZ0a20z8FzvLToretCCz3EDM0nK9VvKt3rqh4Sur4WPm0WBTGhoTa6uDQ6nu8r1
         ooY7e77uAoT8nPqfHD0iglQNov+okgV1KhGioJTI8fKh9u/EMm/CW2QFwy6HH6+q13Ju
         yoLVXzKwJ0zIGg2UQ6EZvZLzo2kFeYg3bspgQL2STAVLT0lQnHYbliOYL0SwqO4Kt3/c
         65Og==
X-Forwarded-Encrypted: i=1; AFNElJ9O/iiE0srXxihJ3FWiotrVnQJpEuQ7PfvlYeLcp+PyDndZzyhdm4y6KZP6J+cMeUpRRKWpaD8e66BNKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIZjwokYWgh8Dh0kxK4AU7KwzOP+KnN8rc/cPLFhkm19vxOFWQ
	A4ycjREZGBiADtTiCwSvMocL5BnJnJejd8G+AwThDdDBRL/3eF5imM3h
X-Gm-Gg: Acq92OGhSsWm92EmDGN3Ed4+7OPVnqi6aihD38O8rR/PNMYS8a98V0Eb6UYxexovvnS
	t7Iren3srwkiysYPVglHdJgswGX74UzmhPo6+k9j+KtrnwzFRcX8JoYgsKAaDIrG2B/lOwfM52b
	lIBxY3bj0PSQiwGQ4aKazCLegTLj1aXiLIF+LQXcCqaRr0H3XvDNuR5UXZ3n18YYRxy2NJDt/Ou
	SEJydjNMFT/jFYTCgNsUUFqDQKdryAvCFZurn0wllJp3ohtmVLhzz7yKzOII8mmam0j//9PKEPM
	nDLlfgtvJkv4smfe4UQlZWyaMhVo3b9MeFaM1e1XVGM/mTl7NywoqYoIFs6y21MY6mdvI4IAC1H
	59tiCAjz33temF7PRZ8poQaoea3yu1Pp5KQiF1EY8KdrEu1lsV2CB9DLKx0AC+Qo8G+dEPMiJDR
	zEvY8FxZD5g96FldpWTHvAP5TM1IaCpM2qNIDl
X-Received: by 2002:a05:7022:fe06:b0:12d:de3e:86b0 with SMTP id a92af1059eb24-135000a5aa0mr7277303c88.19.1779177497495;
        Tue, 19 May 2026 00:58:17 -0700 (PDT)
Received: from s7t7-debian-test.local ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cf44668asm18768901c88.6.2026.05.19.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:58:17 -0700 (PDT)
From: Tony Rodriguez <unixpro1970@gmail.com>
To: davem@davemloft.net,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andreas@gaisler.com,
	thuth@redhat.com,
	regressions@lists.linux.dev,
	glaubitz@physik.fu-berlin.de,
	unixpro1970@gmail.com
Subject: [PATCH 1/1] sparc64: unify thread stack sizing and add explicit 32KB stack
Date: Tue, 19 May 2026 00:57:55 -0700
Message-ID: <20260519075809.8993-2-unixpro1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519075809.8993-1-unixpro1970@gmail.com>
References: <20260519075809.8993-1-unixpro1970@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch restructures the thread‑stack sizing logic into a single
if / elif / else chain and introduces an explicit 32KB kernel stack
for SPARC64. The previous implementation relied on nested conditionals
and PAGE_SHIFT‑dependent behavior, which produced 8KB or 16KB stacks
depending on configuration. SPARC64 requires a larger,
architecture‑specific stack due to its trapframe size, register‑window
behavior, and deeper call paths.

A reproducible failure case occurs when usbcore is enabled: USB hub
enumeration (usb_new_device(), hub_port_connect(), PM/QoS helpers)
allocates large on‑stack structures and recurses through several
layers of device‑model code. Combined with SPARC64’s trapframe and
register‑window overhead, this reliably exhausts a 16KB stack and
results in early‑boot panics.  A 32KB stack eliminates these failures.

The new logic is:
    SPARC64:
        THREAD_SIZE = 4 * PAGE_SIZE (32KB)
        THREAD_SHIFT = PAGE_SHIFT + 2 (log₂(32KB))
        THREAD_SIZE_ORDER = 2 (4 contiguous pages)
    Non‑SPARC64 with PAGE_SHIFT == 13:
        Retains the existing 16KB stack behavior
    Fallback:
        Retains the existing 8KB stack behavior

Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
---
 arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
index c8a73dff27f8..6b12a2b66385 100644
--- a/arch/sparc/include/asm/thread_info_64.h
+++ b/arch/sparc/include/asm/thread_info_64.h
@@ -99,13 +99,20 @@ struct thread_info {
 #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_page */
 #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */

-#if PAGE_SHIFT == 13
-#define THREAD_SIZE (2*PAGE_SIZE)
-#define THREAD_SHIFT (PAGE_SHIFT + 1)
-#else /* PAGE_SHIFT == 13 */
-#define THREAD_SIZE PAGE_SIZE
-#define THREAD_SHIFT PAGE_SHIFT
-#endif /* PAGE_SHIFT == 13 */
+/* thread information allocation */
+#ifdef CONFIG_SPARC64
+	#define THREAD_SIZE (4 * PAGE_SIZE)
+	#define THREAD_SHIFT (PAGE_SHIFT + 2)
+	#define THREAD_SIZE_ORDER 2
+#elif PAGE_SHIFT == 13
+	#define THREAD_SIZE (2 * PAGE_SIZE)
+	#define THREAD_SHIFT (PAGE_SHIFT + 1)
+	#define THREAD_SIZE_ORDER 1
+#else
+	#define THREAD_SIZE PAGE_SIZE
+	#define THREAD_SHIFT PAGE_SHIFT
+	#define THREAD_SIZE_ORDER 0
+#endif

 /*
  * macros/functions for gaining access to the thread information structure
@@ -127,13 +134,6 @@ register struct thread_info *current_thread_info_reg asm("g6");
 extern struct thread_info *current_thread_info(void);
 #endif

-/* thread information allocation */
-#if PAGE_SHIFT == 13
-#define THREAD_SIZE_ORDER	1
-#else /* PAGE_SHIFT == 13 */
-#define THREAD_SIZE_ORDER	0
-#endif /* PAGE_SHIFT == 13 */
-
 #define __thread_flag_byte_ptr(ti)	\
 	((unsigned char *)(&((ti)->flags)))
 #define __cur_thread_flag_byte_ptr	__thread_flag_byte_ptr(current_thread_info())
--
2.53.0

