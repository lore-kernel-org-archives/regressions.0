Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF96FD6
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667481959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gPvea2fildMPjjeLpBpmnKqPPFqFIQbi64w+Mdeh/2k=;
	b=IhT0pEtaz8RYH8YKi3DA0qixPM8ZTipMNNMq3uJ0z+zmiOYOy3Bq+1n+uKQJApm0/9hbKB
	YtHaiWwVUru1pxqF8p2cfAm5h1lMzL/KkF4s9LyE37pDHHkTZJdQY2beNmrzr8U2YhW5FH
	UezU7L/jO9beXzayFuYEmOQHc1/iAn0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-fEGCqvbxOYmHRiYQGajRAw-1; Thu, 03 Nov 2022 09:25:57 -0400
X-MC-Unique: fEGCqvbxOYmHRiYQGajRAw-1
Received: by mail-qk1-f197.google.com with SMTP id bq13-20020a05620a468d00b006fa5a75759aso1930986qkb.13
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 06:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPvea2fildMPjjeLpBpmnKqPPFqFIQbi64w+Mdeh/2k=;
        b=zQWv/s+ty5CpxsNCC/ntz+kHv7Vymb82Il4KhirsRqHY4g3lVR8AIULwD2nHTvYrrw
         zLW2CpdibUy8Juvg1da/eRUBE84m3vwZJuUu/Fz0M+0yTXyOux/NWzsK0VmVjdrshQEn
         adV4xkjaRFQ4AQbkv0j7ts4mIsHMYvjhkGRa89lM+pMK6fEwN4EeYWE0cB7JkehAFY/x
         qECOdJxtsyCW95rYPt5mdCAG5sJOZKuH4CEQZ/poqpAAMhQmZNwYsFaR260A39hd5g7/
         DVLqzcPjKjvNJC0ONAQ7qIqxSGPr7y3IbcGXLbJDC7P0UA95QIHOU2IwQ1Cd/+AhRbVM
         f4EA==
X-Gm-Message-State: ACrzQf02mJrEVrXX24kzaH1farBvnMehHzJ6IgMK544YK0+MMEZO2wZD
	8tfQYA20SIIYQe8UB/uQy2sWHMFZYsrUhSSxlWI0wCg7PwmB2EhG+V3Burq8nwkSwi3iVEqq0ZS
	lVxLCN5+js2u95/V/t31XhAU=
X-Received: by 2002:a05:620a:7ee:b0:6fa:5811:760e with SMTP id k14-20020a05620a07ee00b006fa5811760emr6896688qkk.363.1667481956774;
        Thu, 03 Nov 2022 06:25:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6REhdMvAmSgmT22cTSQCx1WutrRM31JFApEyOPUiCm23hUNlEyIN5/ylb3fbW5ZoGw/15ddQ==
X-Received: by 2002:a05:620a:7ee:b0:6fa:5811:760e with SMTP id k14-20020a05620a07ee00b006fa5811760emr6896670qkk.363.1667481956561;
        Thu, 03 Nov 2022 06:25:56 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id gb4-20020a05622a598400b0039853b7b771sm502853qtb.80.2022.11.03.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:25:55 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	cezary.rojewski@intel.com,
	ckeepax@opensource.cirrus.com,
	jmontleo@redhat.com,
	oder_chiou@realtek.com,
	regressions@lists.linux.dev,
	tiwai@suse.com
Subject: [PATCH v3 1/2] ASoC: rt5514: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:25:24 -0400
Message-Id: <20221103132525.3247-1-jmontleo@redhat.com>
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

Signed-off-by: Jason Montleon <jmontleo@redhat.com>
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

