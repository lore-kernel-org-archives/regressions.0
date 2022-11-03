Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860E6FD4
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667481357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tF48IIsES7IkkOV8CP2SYktqbQsH3Wm7oCaHUYKuyUE=;
	b=b8vUpoi9C/7JlvPOUDmAHXXkLBN7WZ0QeNAS+UKwO59XWBcfRLsltnI6HpyjC/OzcpNDjA
	z+3+eu3zbmXjG0zgZAh21a/g4oZmLo7Phj+h4+EXr5rlNzK6OVXRgJH/5qPMZjLjgFUvxn
	xQxPOn/yWdv3Ql01woqTR4Zjsubrju8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-HxolSIdONeW3dElLk-d2gw-1; Thu, 03 Nov 2022 09:15:48 -0400
X-MC-Unique: HxolSIdONeW3dElLk-d2gw-1
Received: by mail-qk1-f199.google.com with SMTP id w13-20020a05620a424d00b006e833c4fb0dso1934415qko.2
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 06:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF48IIsES7IkkOV8CP2SYktqbQsH3Wm7oCaHUYKuyUE=;
        b=nvz6hbUsFcltTKHefqs+E3Ai+96h3FSdpmzmwvdCavpv5HFmwoftxceqdGlnoaMb/8
         h/CBKylyHzgJFcx0ETA743+pqN9rwZcNfyT5hMjiWAmBtcHxRJObYrQDS9pyBWg5OvvW
         2I5hM+amFdxylYRpuZ7fmmhuHUiPEykpZ9pn1ev5NO6GhwGJpZomZzCZZYyV19J0ijqI
         9JTW0c2M1AdzYq3IaDXJwokiqdfmufzqRmfyLYTO4BcAUlufMNXKcn4L4YQ25vETi7Pg
         aRXxM48PSHw5q9ROoVm45fbeltqmT12d5htzcuOFlCgJ27nTw0cJPN5LY0Tl9BXHT/Nd
         Zd2Q==
X-Gm-Message-State: ACrzQf3RL/FBncaFrVBSMNSB+1eC8nJBs05Y0g8BV7YLtn1oB49prvyR
	41F9bWSFeWWrij+NdmlsSBJzyUfHsdx0LiBWZMfQ6CdASUNP1zv3YP0yYw3cQ6iM9xVd82mW1/g
	yw0QQc860lVvhl22Q/eGAV1I=
X-Received: by 2002:a05:6214:621:b0:4bb:ce2d:e29b with SMTP id a1-20020a056214062100b004bbce2de29bmr24951602qvx.80.1667481346767;
        Thu, 03 Nov 2022 06:15:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5+plLN60XMHL56pa2r+xcXzlCL7hdTgEUxSIuEWPE35WGQNnWo+vfMcQr5EP5GltbbvMpIig==
X-Received: by 2002:a05:6214:621:b0:4bb:ce2d:e29b with SMTP id a1-20020a056214062100b004bbce2de29bmr24951582qvx.80.1667481346518;
        Thu, 03 Nov 2022 06:15:46 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a16a800b006ed30a8fb21sm715086qkj.76.2022.11.03.06.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:15:46 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ASoC: rt5677: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:11:44 -0400
Message-Id: <20221103131144.2942-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103131144.2942-1-jmontleo@redhat.com>
References: <87v8nwmgso.wl-tiwai@suse.de>
 <20221103131144.2942-1-jmontleo@redhat.com>
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

