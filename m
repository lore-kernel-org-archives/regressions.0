Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E991EB2A
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850253; cv=none; b=Yxt7g0FXklV7YXVoM2KiStpvxJRDlehOT8rc7fv97tIiGE0nc+WjeuKkFJXLaTqlybKP4sEWjdzJ1q6cjfxBTV4mDI6D29epkCd4QXwH2aJ8/Qewq8Rkx1nYnr/rWgDAZSZdEfzMJNUVOZ+aldzsasuXv9FNT0OmXu1JOrqZb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850253; c=relaxed/simple;
	bh=JJBkH7Al13LxC//C0xc0C9jvMQejnq/a8D4NLDpgFR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ykb2Ai0D6mJaGwrUmkXte1Vu1TQ9yzbkNSEy/aJsg/G8W8wLEGi1b55NtSvtpG2xzesey4/L0GWU9O68n2Ie2iU76w4yjj8CnfPk/dC12PySLRUvo3+Y2ymhfSTuLwF89hLhinAhoRulBM3JK/0qsEZi8pUcTqk8dhcZjIrVsxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOCOkP54; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOCOkP54"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6e3341c8767so63023a12.0
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719850251; x=1720455051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoEcYR1g5oH3dAILbBlutSD+nWIJxLrC3IcTtmXSnwE=;
        b=nOCOkP54O0mEE4SDrogFbf6B/np7xBq6SyxkYJQ7m7xbA4gfImNg6IUd+TxwA9M9aw
         wR6WppS9jFWM6S4455Ce76JfAmRQZAR/GN87dgp1spYvT+SMxLmdsfNtpLpM7bCD1rOx
         wArT1RKotu65/xwGDyhl35i/4vpZRpH91rZFasr+Q3JRTWLNOA4hk0tq32lu+YVGEIzn
         7xNOnm6RJ4S1kF9of2czJ+m+lUW5nEZsi8N1RJWRM1JyapM3Oj4RlGxdl3gQvrSeYQ25
         DNlE2a68yvPu8OcblFWSdD+FFZHUgjsbrQOIBHL+rxrqrIIJvFI/QQwiXZ5URPT1QsmX
         dpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850251; x=1720455051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoEcYR1g5oH3dAILbBlutSD+nWIJxLrC3IcTtmXSnwE=;
        b=Ze3f4zmP1TEIWZVc9RB+TW1dn2gB8L2r2uf3PQ2is3IM9GmCwHtt/CrIW2oJSExAlH
         22eWTkBYQ2l0xNwkmJZXJTiSeyeF6An9wmeJAcdGErBLZIvrTMOu1IC1jRJBypVt6W+C
         bcBlp/X4OKnz7FnuwIbbusb/ZLjBw59IaRUKlBrqKJTGEgX7zSWQDTEap+aTACVOw0j4
         Sy2esx5eLOQdl9Zl9+qZDAfWnw3iEjRFq4Y2Tupd7HWJLbLEM/DFr0BUf9oSkFFyBSR5
         +hzJI2il7MrBZfRmYZJ625FS3EiQpHxYfTzJNpZ0CK7dfP/9VtEMDfmzCvrzpeMcegwX
         om6A==
X-Forwarded-Encrypted: i=1; AJvYcCXBYAAklIfT97ieZwPhXXT86afxAZjITRTQdpGxMJ8u19wY7HruWznVHrSr5Z5v6DufWOVFamw6L8WnBAO4CPcaQPzIFnGDHHcKZUo=
X-Gm-Message-State: AOJu0Yzt/zn3BBFGcdebwI0yf1QyeMYzboKUkxMr6RxQaePcR0GgXU7T
	la85MwppAEA3XOkrHEgNbQR6zfYwLY3MDFwMTnt069DkLfF9WIKT
X-Google-Smtp-Source: AGHT+IHv5njWpXlLJKd7jZGo50/1bQI4dmpYuwRc4avqH65vW2H8edCc6GRajls/zL2hTY0cM1nU0w==
X-Received: by 2002:aa7:8016:0:b0:705:c237:4429 with SMTP id d2e1a72fcca58-70aaac182c2mr5965307b3a.0.1719850250915;
        Mon, 01 Jul 2024 09:10:50 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d100d79sm4452638a12.82.2024.07.01.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:10:50 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	mario.limonciello@amd.com,
	akpm@linux-foundation.org,
	jserv@ccns.ncku.edu.tw,
	alexdeucher@gmail.com,
	belegdol@gmail.com,
	regressions@leemhuis.info,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] ACPI: processor_idle: Fix invalid comparison with insertion sort for latency
Date: Tue,  2 Jul 2024 00:10:39 +0800
Message-Id: <20240701161039.80008-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <46742c5a-5df4-46d1-bf5f-b74067866fec@amd.com>
References: <46742c5a-5df4-46d1-bf5f-b74067866fec@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The acpi_cst_latency_cmp comparison function currently used for sorting
C-state latencies does not satisfy transitivity, causing incorrect
sorting results. Specifically, if there are two valid acpi_processor_cx
elements A and B and one invalid element C, it may occur that A < B,
A = C, and B = C. Sorting algorithms assume that if A < B and A = C,
then C < B, leading to incorrect ordering.

Given the small size of the array (<=8), we replace the library sort
function with a simple insertion sort that properly ignores invalid
elements and sorts valid ones based on latency. This change ensures
correct ordering of the C-state latencies.

Fixes: 65ea8f2c6e23 ("ACPI: processor idle: Fix up C-state latency if not ordered")
Cc: stable@vger.kernel.org
Reported-by: Julian Sikorski <belegdol@gmail.com>
Closes: https://lore.kernel.org/lkml/70674dc7-5586-4183-8953-8095567e73df@gmail.com/
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
v2 -> v3:
- Remove #include <linux/sort.h>
- Cc @stable

Note: I only performed a build test and a simple unit test to ensure
      the latency of valid elements is correctly sorted in the randomly
	  generated data.

 drivers/acpi/processor_idle.c | 36 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index bd6a7857ce05..17cc81340b4b 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -16,7 +16,6 @@
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/sched.h>       /* need_resched() */
-#include <linux/sort.h>
 #include <linux/tick.h>
 #include <linux/cpuidle.h>
 #include <linux/cpu.h>
@@ -386,25 +385,21 @@ static void acpi_processor_power_verify_c3(struct acpi_processor *pr,
 	acpi_write_bit_register(ACPI_BITREG_BUS_MASTER_RLD, 1);
 }
 
-static int acpi_cst_latency_cmp(const void *a, const void *b)
+static void acpi_cst_latency_sort(struct acpi_processor_cx *arr, size_t length)
 {
-	const struct acpi_processor_cx *x = a, *y = b;
+	int i, j, k;
 
-	if (!(x->valid && y->valid))
-		return 0;
-	if (x->latency > y->latency)
-		return 1;
-	if (x->latency < y->latency)
-		return -1;
-	return 0;
-}
-static void acpi_cst_latency_swap(void *a, void *b, int n)
-{
-	struct acpi_processor_cx *x = a, *y = b;
-
-	if (!(x->valid && y->valid))
-		return;
-	swap(x->latency, y->latency);
+	for (i = 1; i < length; i++) {
+		if (!arr[i].valid)
+			continue;
+		for (j = i - 1, k = i; j >= 0; j--) {
+			if (!arr[j].valid)
+				continue;
+			if (arr[j].latency > arr[k].latency)
+				swap(arr[j].latency, arr[k].latency);
+			k = j;
+		}
+	}
 }
 
 static int acpi_processor_power_verify(struct acpi_processor *pr)
@@ -449,10 +444,7 @@ static int acpi_processor_power_verify(struct acpi_processor *pr)
 
 	if (buggy_latency) {
 		pr_notice("FW issue: working around C-state latencies out of order\n");
-		sort(&pr->power.states[1], max_cstate,
-		     sizeof(struct acpi_processor_cx),
-		     acpi_cst_latency_cmp,
-		     acpi_cst_latency_swap);
+		acpi_cst_latency_sort(&pr->power.states[1], max_cstate);
 	}
 
 	lapic_timer_propagate_broadcast(pr);
-- 
2.34.1

