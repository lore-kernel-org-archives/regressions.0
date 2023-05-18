Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15FAD3C
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 08:54:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f14468ef54so2116895e87.0
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684400086; x=1686992086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjAvVBk1hRLHZrA8OFaE6F4f4RtrYr9WV2xvjiGYmh4=;
        b=g32/8heJ3DktSiEENGsRXd/v01cczhkq4W1Yo5mCj/C2Ef4XQ3F8RBjeoC3Cm3DN8S
         7M/2xNp7FAvmxQ9FOwsLAQ801Rl13p7l+bPmWxjhWSofWnKJJ3RlBpOVsBp6BddReuYe
         OBgU9Ahs9LpQM2V0pui+DuCGk5FrCpA07QC1eBgCz8eQWG/FCFyQXMTkPMZzR9PjJWE6
         15dma5h07NttmZepJmV9ilnjYzDM4HmqK543iEqme5pbcZFchnMll0aV+zuPCO8drIv7
         u+8cRTckWZ3Qsddb3ZEtRBkclqOnus/KX6IqkIqNyes5kdUCnbi1GXgB5K6RLjc+i99A
         9Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684400086; x=1686992086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjAvVBk1hRLHZrA8OFaE6F4f4RtrYr9WV2xvjiGYmh4=;
        b=hF28Gf4oFKpZU2aPr0XcDY+gMfASEOY+O0j07Xuj5MNHE22HfLhzW3KxVjYs9jImGc
         bepIO4QDwcI6AUi/ynb+8+3nSIPL+Pa+jywc610CbGuBWiUTXbc6YEzyWPFR8dTSAGo1
         /3pWyMfgtQSCLLxPNar2V3zwiYYtncmxzX2PJD6gfZZLUHJ8+qrkR1xrFWevP8+lm17m
         B93hvUW+jsmkRdMR6FYEfT5d66KrH2/ZZhXlHd/F3yRMqWmec388aH8tQ73Y3bSY8IF3
         tBZWDbBrmj8NTnFJa+g0sPTOxDlp+tGSrTRgrLCaxYznGnOW8MCMIKbgf0pQT1nMFG0R
         r4Hg==
X-Gm-Message-State: AC+VfDxdcD7ZbkhsbnSyCpONMfJnnelhP4NYc0H6JdhieWUT1OkU6fRh
	aSLBtXN95ytMi+V1yH5JREKgXA==
X-Google-Smtp-Source: ACHHUZ66yUDz9VH5R8zAhzwAIypF9QSua+hRd28G08W56sm7WWljOyDQ3Gn2wHIXgoozj0EISiOr9w==
X-Received: by 2002:ac2:5dc2:0:b0:4f3:82aa:142d with SMTP id x2-20020ac25dc2000000b004f382aa142dmr1171051lfq.47.1684400086103;
        Thu, 18 May 2023 01:54:46 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id r4-20020a056512102400b004f24db9248dsm177513lfr.141.2023.05.18.01.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 01:54:45 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	todd.e.brandt@intel.com
Cc: vigneshr@ti.com,
	pratyush@kernel.org,
	michael@walle.cc,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@leemhuis.info,
	bagasdotme@gmail.com,
	regressions@lists.linux.dev,
	joneslee@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Todd Brandt <todd.e.brandt@linux.intel.com>
Subject: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic flashes
Date: Thu, 18 May 2023 08:54:40 +0000
Message-ID: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We failed to initialize n_banks for spi-nor-generic flashes, which
caused a devide by zero when computing the bank_size.

By default we consider that all chips have a single bank. Initialize
the default number of banks for spi-nor-generic flashes. Even if the
bug is fixed with this simple initialization, check the n_banks value
before dividing so that we make sure this kind of bug won't occur again
if some other struct instance is created uninitialized.

Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
Link: https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0bb0ad14a2fc..5f29fac8669a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 
 static const struct flash_info spi_nor_generic_flash = {
 	.name = "spi-nor-generic",
+	.n_banks = 1,
 	/*
 	 * JESD216 rev A doesn't specify the page size, therefore we need a
 	 * sane default.
@@ -2921,7 +2922,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
 
-	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
+	if (nor->info->n_banks > 1)
+		params->bank_size = div64_u64(params->size, nor->info->n_banks);
 }
 
 /**
@@ -2987,6 +2989,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
 	params->size = (u64)info->sector_size * info->n_sectors;
+	params->bank_size = params->size;
 	params->page_size = info->page_size;
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
-- 
2.40.1.606.ga4b1b128d6-goog

