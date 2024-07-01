Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4718248C
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719867408; cv=none; b=e70G/MLiLkWdZ6lvEghTI9/2zpZm8B+bv7yQ13baBC6RyIlWgTKy1jLpgm8U9Gg9blMLLMf1vN6GIAP5ewEen1CJl5BStd0jiM70E00/dbnoA74qQFNti/5v/uH8ZN3UzAhkxqGZD9t+szUE1NpRsmtvYKngrtS2b+qR4SOpr2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719867408; c=relaxed/simple;
	bh=yivC1wh3WXB0Mkllna8y0JKmSTpJlJbqbl1AdYH3amQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbDon+L0ItmvLTmvExOw4jQcIFfqzTjVeKDXxKNQkb8BqKHMroyp0UajB4j3FFmCexerP9LmIHS1TMKLK1Lr4sznXciu7cZt4uW2yy8dVFPj1VrsaWvrml+XCVPV7OQNP56aLU2v5VDLW+bCWKENtJkjjcVsgAPdtePAmhpfmJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXO7NyJx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXO7NyJx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa94d0ba3dso1986875ad.2
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719867407; x=1720472207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOUox0A8P7WdAUwxhtPV8qdrltE7pejNVtILSbSQpN4=;
        b=eXO7NyJxIUISgEraOeSmi9VMnM8qInlyigf6vbvfsG0B+VkxsypEIz51bsge8VHg1H
         gsCb75vMYvS/Q42sdF6yB6tJTmW35KMVOrVyJvGQ5F04RF5/+uxF0cEiKpkOHixgqppM
         tu+PyVj883MC9B+9c+jP1kNMv2CYf31EaSLsw6lDq06uwhFQ5U9l8Pg+yVAjX3pohY88
         sW5Z4OuUIzQgcxmAGGjDRY3iSmvndIiKwsIo5BhJOr2A1T8cB95ZBY2mWi9eLW2MRxuD
         Tv3D9Iv8v/Wznc2C5OZqJ2dds4Rjprf5kQCRnt5GGYP0aBfzd+5vp7krPYEK8lEWkLXT
         utaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719867407; x=1720472207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOUox0A8P7WdAUwxhtPV8qdrltE7pejNVtILSbSQpN4=;
        b=mWUACzA6yimgYW72pZVD1WyjJ2lpL5zF6rmbUWQDTqntknVuN4Ujs+tF/PtDcnbFx0
         v5R63WWGtMtibMFPgxwY9Snz1Sqs2Pmu8TJgyRV6a8oS4TTCDrrjxKP8Juh63bUe1mKQ
         Pt5IF4arP3vMTZMWItB/v4fZdHzaHqn03CPl6IzxdwOBu9kWW8oR92VD/FCBuJqa/nfy
         5CQjOxEw0fV14cjkuq+zV1N4N3TpwaMQl5KLzev1G04OlKfPxQjxm1pOHTvtHVKD7s/4
         JEasNBMFBsQvwEyz6quOHaYJHzFDAbDZ6WLzsEzRmJvWYJNVMNcc+E563wgI4jE/S4Si
         Ct8A==
X-Forwarded-Encrypted: i=1; AJvYcCXibQr35y+AhJhFHUYHPnyU7YJvj8ltnEAjtTGtdaAJdmeut8DIAAU203swd3Evfmu2OCH1N55KJYjTldTXPuQAN6i7sAk3RmIS/7Y=
X-Gm-Message-State: AOJu0Yy8RIiMEq97VnlpqfThXoy3s7yslegzlBIOrG823lbcp6IqESIB
	Weu8K3S2QXpYP2bTzSEUzV5Q5qEY480KzOZNPwmy9XvURCt6UVy0
X-Google-Smtp-Source: AGHT+IFrTruC3H2GBbF3mUj3lqAiD5H9fk9Ju69ci44bdKZ4SKOiR//a/zscmxKXvRePm7RkETeIMg==
X-Received: by 2002:a05:6a20:7286:b0:1be:d897:797a with SMTP id adf61e73a8af0-1bef626edbdmr9916444637.5.1719867406736;
        Mon, 01 Jul 2024 13:56:46 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15393d1sm69402285ad.157.2024.07.01.13.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 13:56:46 -0700 (PDT)
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
Subject: [PATCH v4] ACPI: processor_idle: Fix invalid comparison with insertion sort for latency
Date: Tue,  2 Jul 2024 04:56:39 +0800
Message-Id: <20240701205639.117194-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJZ5v0iY=S+WKWvDAAWxLcOwvpOG5Cck1gQv4p+FfW1Nca0Yqw@mail.gmail.com>
References: <CAJZ5v0iY=S+WKWvDAAWxLcOwvpOG5Cck1gQv4p+FfW1Nca0Yqw@mail.gmail.com>
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
v3 -> v4:
- Rename the parameter 'arr' to 'states'.
- Add empty lines to enhance readability.

Note: I only performed a build test and a simple unit test to ensure
      the latency of valid elements is correctly sorted in the randomly
      generated data.

 drivers/acpi/processor_idle.c | 37 +++++++++++++++--------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index bd6a7857ce05..831fa4a12159 100644
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
@@ -386,25 +385,24 @@ static void acpi_processor_power_verify_c3(struct acpi_processor *pr,
 	acpi_write_bit_register(ACPI_BITREG_BUS_MASTER_RLD, 1);
 }
 
-static int acpi_cst_latency_cmp(const void *a, const void *b)
+static void acpi_cst_latency_sort(struct acpi_processor_cx *states, size_t length)
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
+	for (i = 1; i < length; i++) {
+		if (!states[i].valid)
+			continue;
 
-	if (!(x->valid && y->valid))
-		return;
-	swap(x->latency, y->latency);
+		for (j = i - 1, k = i; j >= 0; j--) {
+			if (!states[j].valid)
+				continue;
+
+			if (states[j].latency > states[k].latency)
+				swap(states[j].latency, states[k].latency);
+
+			k = j;
+		}
+	}
 }
 
 static int acpi_processor_power_verify(struct acpi_processor *pr)
@@ -449,10 +447,7 @@ static int acpi_processor_power_verify(struct acpi_processor *pr)
 
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

