Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C09DC950
	for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 17:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679677769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLRKnXRPip+ks27gdmBMUhtEnFO7L9UtH6SSkGcCZo0=;
	b=PSElvA6oErRcsNzAKAlpKS0iWYS5Uis453RfBBvmGC9p/PBUTiF4k78WnqlpJT8WUntCI6
	DZDY4S8UEqFGXbdrrOQMP+X2cz2aLPMenAF5BMrV0FRGYDqEqHUXqP4TIVE7wZ9HUneZ77
	uqyOH2v058Qsa/6414JFAZm1Q+xdwHI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265--tjQfrksNIqUAqobfl4P5Q-1; Fri, 24 Mar 2023 13:09:28 -0400
X-MC-Unique: -tjQfrksNIqUAqobfl4P5Q-1
Received: by mail-qv1-f72.google.com with SMTP id z14-20020a0cd78e000000b005adc8684170so1315771qvi.3
        for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 10:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679677768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLRKnXRPip+ks27gdmBMUhtEnFO7L9UtH6SSkGcCZo0=;
        b=WjQ4TK8acnVB6ttx9jryK4t8k20hsuZ2dAtPexTcXrY3l4MTwgBHNxq7ZYuBFecoHX
         nEb8fBWG9aAzEhmhmhJ0kDQOTBg4HQkYlK8fwVQgJu8bqYAZlv6zlz0bmVpqucqb96ky
         iSnjMdC3CXD40cn30cxFbplIPDWlR6L9k3wv6VNiFTzvlWrgrenVy+B66pwTvMHuTQMv
         BZRpeFOllfQYvoIIN5oRIqilNOjvVuYG1VKEVw2zCpV5ab+wknPVpRjDqgljXKFV5QHQ
         E4yaILpNmjcZSOUcHXyMIvvbBnY+ZSfelx8EPraSIXPWu9obZ/dAWuM9NeB1cat5BQ5X
         cjBA==
X-Gm-Message-State: AAQBX9e2xbj7u/IHuUci+XSBWJGIH3Hl7jVtP/xbBLKPsCF1YQWSN47Y
	AL9LCRgL6IboxKCnOY2YaznAKjOOAKG7sVanVjPyZXiQUKbx3EZIx6C3LexuC5bxdxwrF+HYvHP
	5WVniWtgjjAr2vF63Qjfg8+I=
X-Received: by 2002:a05:622a:352:b0:3e4:d90a:b12a with SMTP id r18-20020a05622a035200b003e4d90ab12amr1803628qtw.17.1679677767861;
        Fri, 24 Mar 2023 10:09:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350apy3oW7a9FJs0e8hOcJ3R4VeI8/w3JZazN2ebmIBP53MZF2bGhguV/L5X6EHjjOcdVuhZaIQ==
X-Received: by 2002:a05:622a:352:b0:3e4:d90a:b12a with SMTP id r18-20020a05622a035200b003e4d90ab12amr1803594qtw.17.1679677767627;
        Fri, 24 Mar 2023 10:09:27 -0700 (PDT)
Received: from p1.montleon.net (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id de21-20020a05620a371500b007422fd3009esm14460324qkb.20.2023.03.24.10.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 10:09:27 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: alsa-devel@alsa-project.org,
	regressions@lists.linux.dev,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org,
	tiwai@suse.com,
	bagasdotme@gmail.com,
	pierre-louis.bossart@linux.intel.com
Cc: Jason Montleon <jmontleo@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()
Date: Fri, 24 Mar 2023 13:07:11 -0400
Message-Id: <20230324170711.2526-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.40.0
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

hdac_hdmi was not updated to use set_stream() instead of set_tdm_slots()
in the original commit so HDMI no longer produces audio.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/regressions/CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com/
Fixes: 636110411ca7 ("ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio")
Signed-off-by: Jason Montleon <jmontleo@redhat.com>
---
 sound/soc/codecs/hdac_hdmi.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index ed4f7cdda04f..8b6b76029694 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -436,23 +436,28 @@ static int hdac_hdmi_setup_audio_infoframe(struct hdac_device *hdev,
 	return 0;
 }
 
-static int hdac_hdmi_set_tdm_slot(struct snd_soc_dai *dai,
-		unsigned int tx_mask, unsigned int rx_mask,
-		int slots, int slot_width)
+static int hdac_hdmi_set_stream(struct snd_soc_dai *dai,
+				void *stream, int direction)
 {
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
 	struct hdac_device *hdev = hdmi->hdev;
 	struct hdac_hdmi_dai_port_map *dai_map;
 	struct hdac_hdmi_pcm *pcm;
+	struct hdac_stream *hstream;
 
-	dev_dbg(&hdev->dev, "%s: strm_tag: %d\n", __func__, tx_mask);
+	if (!stream)
+		return -EINVAL;
+
+	hstream = (struct hdac_stream *)stream;
+
+	dev_dbg(&hdev->dev, "%s: strm_tag: %d\n", __func__, hstream->stream_tag);
 
 	dai_map = &hdmi->dai_map[dai->id];
 
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 
 	if (pcm)
-		pcm->stream_tag = (tx_mask << 4);
+		pcm->stream_tag = (hstream->stream_tag << 4);
 
 	return 0;
 }
@@ -1544,7 +1549,7 @@ static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup = hdac_hdmi_pcm_open,
 	.shutdown = hdac_hdmi_pcm_close,
 	.hw_params = hdac_hdmi_set_hw_params,
-	.set_tdm_slot = hdac_hdmi_set_tdm_slot,
+	.set_stream = hdac_hdmi_set_stream,
 };
 
 /*
-- 
2.40.0

