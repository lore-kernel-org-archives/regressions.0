Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA84AEE5
	for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719781698; cv=none; b=Fydr9gvICDsSaK+b3augWLxompi/tK/EHGj7A3t38PctH9xTUGLWUAmysdmhe/pThbUyDLzLIGx6W2u+tb6pItn75D9gnquwfpsDDv8ERexGD8GsCVtiGhaxvNPmXbyzylr5zwTtu7xeyJxAPKHyxEgd5aVmkAnX+l96wQUflrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719781698; c=relaxed/simple;
	bh=gW6wjF5GOLahrzuOysh1WJhPgwoMMR9hDIpX5WU8BEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RDQ/6t2hSpu3C9djGpWXF4c62ZVdczLOg31KRgFNh095kn3nOTl116j/uEtlnsIAs0olsfTd4K9aIOkxpc3+7vMch1sUmC+v7ELUDfXYaVl7TJfiEKmtLQm4JWE6vKu0UfUeicYgKnU/3+sAvl7zbAfQTu93uxyVv8PZvLRZF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pm3LMLSr; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pm3LMLSr"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c7af3116aaso460315a91.2
        for <regressions@lists.linux.dev>; Sun, 30 Jun 2024 14:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719781696; x=1720386496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qsf4cNEXFIzXVY/Vaf+nuaEFn++A84g+B4+21rN0Vs=;
        b=Pm3LMLSrTdPSgAJzAUxbHEro9oqYuOmoGIgnj7b4berXSGPwTyjIJNg2nJECOaEWYG
         LNkaoS5gecoJUr49pJVZR3W8gr1V+dfFfleW4Rnez/1o5tmayyQTjH/9CsxoUFAasMI/
         URglC5LhlvjlP9KwkAcRxXOB6/XVP9nZ+N35Kj72P6Lh1PjTLZPO4L9inSCV/Is9Rmf6
         jZWq04sRVZ/UCip11xWw3v2so/G0UKXw3qlb9NFCUoZ2LJXsY+hoWFE3sn4qS20xUiIU
         cjFcFcOl5u9kddbX6p7NfdE27ZOvniU7zfnJi9uCARf4akVttJk+xjXbOXlHgh0nA5P/
         /8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719781696; x=1720386496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Qsf4cNEXFIzXVY/Vaf+nuaEFn++A84g+B4+21rN0Vs=;
        b=HJqgVO39dcE5SvRu8RQgX172mo5ssRv50xImTwzxiDDX7Oj0/WZZQi5YNnIPeC9IT6
         iozYjqcVAJ79inMhgXJ57pFxfknZz2O/YoYj0ZJWl7mrrg+ng7WSDWWLmrFsYR9VnBUq
         K7SAypo0QiXMU+mb8yG6czZbRFKqY1WkN3daAOj1DZ/p2aZvuucAQD/yx118FXcDxoIw
         Jh7IegMWP+fds1Oa3J0GGJqIisSQz2oAaa//Jcrf6pU+cfjKGk1tAKOyXfnJOo2D2pNN
         qgXv+mD8Wsp7ubkDmz2N8UaaGidakR1A5lmDHAvVPwWknaB42/Haifj95FLFARF1LcCE
         WYxA==
X-Forwarded-Encrypted: i=1; AJvYcCXm4wA4kWJMri26Og286cbtsQc/DydagepsKuQaH8iyfJ2OXX8J+JEPazVIM8T7RZQz5Oo9r1Iol8jnogl3FsISYJu/iCl3+Y/F0ME=
X-Gm-Message-State: AOJu0YwWFUDVNQ7BEVQcSBcDY2uvZAKcEvyyMTGg8vdx6ekePVth8T76
	69V+K/NEB+uJDkxp+nRfJ5jnuIEJ9SwELfFeubYaf9pLtcVATDzh
X-Google-Smtp-Source: AGHT+IHjBYp4uSX/3uoBSi3ABmPv0+VJCt6NLbnG/jpShcdoCDMhbXjGAwQewuZvLkKnyxHyUoNwTw==
X-Received: by 2002:a05:6a20:da8a:b0:1be:e53c:7f87 with SMTP id adf61e73a8af0-1bef626b560mr6400422637.3.1719781695895;
        Sun, 30 Jun 2024 14:08:15 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c7f72a7sm3972046a12.63.2024.06.30.14.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 14:08:15 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: rafael@kernel.org
Cc: lenb@kernel.org,
	mario.limonciello@amd.com,
	akpm@linux-foundation.org,
	jserv@ccns.ncku.edu.tw,
	alexdeucher@gmail.com,
	belegdol@gmail.com,
	linux-acpi@vger.kernel.org,
	regressions@lists.linux.dev,
	regressions@leemhuis.info,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] ACPI: processor_idle: Fix invalid comparison with insertion sort for latency
Date: Mon,  1 Jul 2024 05:08:09 +0800
Message-Id: <20240630210809.37550-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c6f4cca2-9258-4dc9-8d4e-96ab7c587783@leemhuis.info>
References: <c6f4cca2-9258-4dc9-8d4e-96ab7c587783@leemhuis.info>
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
Reported-by: Julian Sikorski <belegdol@gmail.com>
Closes: https://lore.kernel.org/lkml/70674dc7-5586-4183-8953-8095567e73df@gmail.com/
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
I do not have the appropriate AMD hardware to reproduce this issue and
test the patch. However, if the aforementioned reason is indeed the
source of the problem, I believe this patch might help.

 drivers/acpi/processor_idle.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index bd6a7857ce05..d58a7c64d80b 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -386,25 +386,19 @@ static void acpi_processor_power_verify_c3(struct acpi_processor *pr,
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
@@ -449,10 +443,7 @@ static int acpi_processor_power_verify(struct acpi_processor *pr)
 
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

