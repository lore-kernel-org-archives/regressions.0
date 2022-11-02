Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07129A0
	for <regressions@lists.linux.dev>; Wed,  2 Nov 2022 20:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667419553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
	b=G+FCkyDJ3DQ13MikGtwBiO+dGosj9vhGgkbzbcshTw6dqRCSpclyS58bJSNQw/U8odyr0e
	5r9FRudTXrQE6hUGRrfqrLsNVYDD68RNcUC/gh2stxXORHvWHoi6k3r8XOSc9RXlfXBsMa
	QToTA6iU+ydm3AX4BSEpUlLFvkHsRm4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-rS9jxx2fMIKlTIuaqj1ZVA-1; Wed, 02 Nov 2022 16:05:52 -0400
X-MC-Unique: rS9jxx2fMIKlTIuaqj1ZVA-1
Received: by mail-qk1-f198.google.com with SMTP id bl21-20020a05620a1a9500b006fa35db066aso7866837qkb.19
        for <regressions@lists.linux.dev>; Wed, 02 Nov 2022 13:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
        b=oxw6dWDYe0VrzVdI+tx6gfBqh5/NBbXLzp1BK3gBa3V9gmx3eDRoaLax7Mi2blYNuw
         WkoLLfy1rTLwe6BXCNNB2PayvTspPikUVfdWr8G7Kz/6rZEqhYAiJvzuoPxALz+4D87k
         tWxqU0iY8ScIfMGmr2ac5Hi+4kJtfazW0bqHc4OpFAy3R28m2nB3ZFA6NLpLORub3Y0n
         XtbpDTWVdDSmnAGQMP6XPUh8K88rD8F0RJStEkzsKgQDGXAJLp476XqVRbXjOLyH4MSV
         VcL5rq8l3fCDZIgVLpyLHh/GAPDksC6LvRBFi+MiFQ9HiKEsFGuomotDXksQ2x4M2/C/
         3wTg==
X-Gm-Message-State: ACrzQf15nB1Nv0yZTr4IlWHUWYFow/pOKKNGeF1ysCtpPbpjXHfPrQ6S
	UNq6mrSQvc4Z5WjRDXGJ2fH44eJlCG8gpGKRUds2a8vrF5kIYqKHCGnD2QOvx2hz3Ha0cS2BONi
	wMoDjsrncnSlMziimp1EaR2/Npwpg/ngKcG593gLjQy1pLv7Ji4XjNSK81SHKfMxBAIzh/8hzzg
	c=
X-Received: by 2002:ae9:e70b:0:b0:6fa:509f:cb2d with SMTP id m11-20020ae9e70b000000b006fa509fcb2dmr6619198qka.181.1667419551847;
        Wed, 02 Nov 2022 13:05:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CrBAmul+SCZYHBCb6wd3h5Qc27RUpezgm/1M2t7EUgGC8eesqAc8ynMlkBSqvxPbKonQmGA==
X-Received: by 2002:ae9:e70b:0:b0:6fa:509f:cb2d with SMTP id m11-20020ae9e70b000000b006fa509fcb2dmr6619169qka.181.1667419551537;
        Wed, 02 Nov 2022 13:05:51 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id br30-20020a05620a461e00b006fa468342a3sm3831105qkb.108.2022.11.02.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 13:05:50 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: regressions@lists.linux.dev,
	oder_chiou@realtek.com,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Cc: Jason Montleon <jmontleo@redhat.com>
Subject: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
Date: Wed,  2 Nov 2022 16:05:27 -0400
Message-Id: <20221102200527.4174076-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Starting with 6.0-rc1 these messages are logged and the sound card
is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
it to function properly again.

[   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
spi-PRP0001:00 not registered
[   16.928561] platform kbl_r5514_5663_max: deferred probe pending
---
 sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 1a25a3787935..362663abcb89 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver rt5514_spi_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5514_spi_pcm_probe,
-	.open		= rt5514_spi_pcm_open,
-	.hw_params	= rt5514_spi_hw_params,
-	.hw_free	= rt5514_spi_hw_free,
-	.pointer	= rt5514_spi_pcm_pointer,
-	.pcm_construct	= rt5514_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5514_spi_pcm_probe,
+	.open			= rt5514_spi_pcm_open,
+	.hw_params		= rt5514_spi_hw_params,
+	.hw_free		= rt5514_spi_hw_free,
+	.pointer		= rt5514_spi_pcm_pointer,
+	.pcm_construct		= rt5514_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /**
-- 
2.37.3

