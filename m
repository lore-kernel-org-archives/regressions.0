Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795EF7481
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667486785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJXibA0h5EKEv6IPvm5uKuXU6CZAaOV8NDSOv2jfpHY=;
	b=KrJ6ucy2gsPD2BvQtJv8F++EZzaGsl/t1CIEPS+qEdQa//1CtF6KKKaoMQbPe9PDPMfGJp
	T1IvOJRDv4lvZ4tiEorGlEzHC6auPhy+rwdnLUSSgxxz8EV5HcrhSHkwU1vcwDby52QdyB
	ZlBVmkrF5s7HfrnqttYA78PZdWCaGLI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-NkQxD5MYP96EbScQa1jMzA-1; Thu, 03 Nov 2022 10:46:24 -0400
X-MC-Unique: NkQxD5MYP96EbScQa1jMzA-1
Received: by mail-qk1-f198.google.com with SMTP id f12-20020a05620a408c00b006ced53b80e5so2098222qko.17
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 07:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJXibA0h5EKEv6IPvm5uKuXU6CZAaOV8NDSOv2jfpHY=;
        b=eVyecMZ0nLI2AhMvvUv+8cz6f/aClaDMtAnA+Pj26HT6IfCvqPGWlOd6GxoIzMSoPI
         KYIJ/+7yul4HbRC9Igii+93tKVyjBHIYW1d7BAixh/jBgBTQjfvdkkSQ6SKYHUciSFO7
         Rn3kbLtpPDNHkbLTFfH3pKHOc17qKiTLdjxlOgo8zIt/ywjSGBPnnVdKYlGt2oM0w1ge
         7q6ZJLdyZloNgQhuL3jUQfIcdT+2fvZ1P/ECpXYRXaaF51CG8XDfLe8MPzWFre7HojDY
         b/S5CIqQarS20kCeKzDggxZWaVrljfLynjL668zxInp8UC9qnyXGaubLPKM+wAazm0xM
         5nxA==
X-Gm-Message-State: ACrzQf0uMAKqSGhTRrwBgV9QVQbuAoXfYU80JJ/7cF2CptbgY+RzUnaO
	trnJdwJrFnPiPwraZonxx3zS2JcnLe0C952YH6LrZI3vA1YsEdr8JKyzZivQoZG95xAjt11tg59
	mNDAgYgOc2iQ3acq3qbo4HM8=
X-Received: by 2002:ae9:ec07:0:b0:6cf:4190:246 with SMTP id h7-20020ae9ec07000000b006cf41900246mr21110395qkg.760.1667486782959;
        Thu, 03 Nov 2022 07:46:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bk/lucYFrTehGoPTfO4GaH3jiwxkOh9YtFwCTaUkFUDWKuoNdHR7lGGIqfCeXvIoqPaCE1A==
X-Received: by 2002:ae9:ec07:0:b0:6cf:4190:246 with SMTP id h7-20020ae9ec07000000b006cf41900246mr21110377qkg.760.1667486782760;
        Thu, 03 Nov 2022 07:46:22 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id h15-20020a05620a244f00b006fa468342a3sm873175qkn.108.2022.11.03.07.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:46:22 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	cezary.rojewski@intel.com,
	ckeepax@opensource.cirrus.com,
	jmontleo@redhat.com,
	oder_chiou@realtek.com,
	regressions@lists.linux.dev,
	tiwai@suse.com,
	stable@vger.kernel.org
Subject: [PATCH v4 2/2] ASoC: rt5677: fix legacy dai naming
Date: Thu,  3 Nov 2022 10:46:12 -0400
Message-Id: <20221103144612.4431-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103144612.4431-1-jmontleo@redhat.com>
References: <20221103144612.4431-1-jmontleo@redhat.com>
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

Starting with 6.0-rc1 the CPU DAI is not registered and the sound
card is unavailable. Adding legacy_dai_naming causes it to function
properly again.

Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
Signed-off-by: Jason Montleon <jmontleo@redhat.com>
---
 sound/soc/codecs/rt5677-spi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 8f3993a4c1cc..d25703dd7499 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -396,15 +396,16 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver rt5677_spi_dai_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5677_spi_pcm_probe,
-	.open		= rt5677_spi_pcm_open,
-	.close		= rt5677_spi_pcm_close,
-	.hw_params	= rt5677_spi_hw_params,
-	.hw_free	= rt5677_spi_hw_free,
-	.prepare	= rt5677_spi_prepare,
-	.pointer	= rt5677_spi_pcm_pointer,
-	.pcm_construct	= rt5677_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5677_spi_pcm_probe,
+	.open			= rt5677_spi_pcm_open,
+	.close			= rt5677_spi_pcm_close,
+	.hw_params		= rt5677_spi_hw_params,
+	.hw_free		= rt5677_spi_hw_free,
+	.prepare		= rt5677_spi_prepare,
+	.pointer		= rt5677_spi_pcm_pointer,
+	.pcm_construct		= rt5677_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /* Select a suitable transfer command for the next transfer to ensure
-- 
2.37.3

