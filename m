Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD456FD6
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667481963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/osXEXoceD/V9gqfveYOQdnvKpq5BFrtlU8yYodRj8=;
	b=QhikFJwXcVLNBeuXHP6iVUHiyrgvEWo9NHxAOMDoKGtOCWjsCkTPElIB/tzQru8iixFO8l
	LMQPyjIxxK9n4ose7zHXsL1ItOg4tHXph/8SvoF/KixajY9nq56hm8AP4EIPaVHgaUBvoV
	fTecQhUrrasmAcCML0THKNIKFa69Yok=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-utOtgEn_NtCkRtCSs1ixtQ-1; Thu, 03 Nov 2022 09:26:02 -0400
X-MC-Unique: utOtgEn_NtCkRtCSs1ixtQ-1
Received: by mail-qk1-f197.google.com with SMTP id j13-20020a05620a288d00b006be7b2a758fso1957377qkp.1
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 06:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/osXEXoceD/V9gqfveYOQdnvKpq5BFrtlU8yYodRj8=;
        b=wKiScyDci+nn2zVmZ1oEX7HON2hK4cfpjuABstEZOvkqDJzsh5BCGWAzIBKEdRj9x8
         RvZTv20R7Zul1FGOWFkfiG6XpUG7LeDTh+gNfAYMrQ7frMYa3J9t2sXUERU4/E6HRjSr
         XtMxDVOKPZuU584dW1WtgAOqXMKq3AtFrwXhlBEvHknPb7jabneEpWC++fqfNJo6Bz24
         QJe4jL8tE8H5vw9w06caZpV7IZIdJ9WjO6/UPh5QdFBCohIsZbooH78urv7+mlZrJpGM
         u6Ns5LcqhOimTQcA2oKtnMn6bagsuRDO22/AWPGTv99DAtHpwm4999S8td61cEiL1u8O
         8A0Q==
X-Gm-Message-State: ACrzQf2RZRtD+RuRrOXn+yd8u4J/mE03BFlDcJWNKamPhGONX0vOoQbx
	uEm+luVToLCDAaQSFp7SBsGd+R8/reNxbSf03V6fS+PjiPiuHxKqDzMNamVC300j0WfmTOo4qVh
	1nQtKhy2Mjzp6qXMaDBAyzj4=
X-Received: by 2002:a05:6214:1c46:b0:4bb:fce3:bb36 with SMTP id if6-20020a0562141c4600b004bbfce3bb36mr17863209qvb.59.1667481961093;
        Thu, 03 Nov 2022 06:26:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7I/1vcdAKxOv2K5w+1HF6EPIBG5Vvmyfb0fLUJqGTDDFjHpfvRjBNSGSk3CcQcJaVwzeAIBg==
X-Received: by 2002:a05:6214:1c46:b0:4bb:fce3:bb36 with SMTP id if6-20020a0562141c4600b004bbfce3bb36mr17863180qvb.59.1667481960711;
        Thu, 03 Nov 2022 06:26:00 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id gb4-20020a05622a598400b0039853b7b771sm502853qtb.80.2022.11.03.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:26:00 -0700 (PDT)
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
Subject: [PATCH v3 2/2] ASoC: rt5677: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:25:25 -0400
Message-Id: <20221103132525.3247-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103132525.3247-1-jmontleo@redhat.com>
References: <20221103132525.3247-1-jmontleo@redhat.com>
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

