Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F916FD4
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667481344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
	b=h6cnDoeQrlAXOFw996BqyoHeMx9K2VNnzzleuXtzH8+UEgVHs0fph0Hbrb4qwb8ll0EWbR
	pUiZgjO5cKr53CfHU0IowwUhal0dw15G0fhiupJZnyXrIQG0jafCT9NnMbPxNyDKSyWRsq
	yJ79PsHtY6p2xRCA2dnZgy79eJXV6VI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-UwBaoobpNYewVgptCTrWdw-1; Thu, 03 Nov 2022 09:15:43 -0400
X-MC-Unique: UwBaoobpNYewVgptCTrWdw-1
Received: by mail-qt1-f197.google.com with SMTP id cd6-20020a05622a418600b003a54cb17ad9so1843796qtb.0
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 06:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
        b=bsg41iV30clYFNxvxvBAJqtVoFGDRgXwjuDBXiIyQFmLfRgIXMGjYSPh/0Dom3KUND
         WufsWzsA4kmE14JS31nlLqvPpIEI0eJbDf4ea/W3Qvt3j2gPpQO94Q7uz9ltXhI7X0Qw
         Jd7EGxYJcpM0TJjV5gAoaHuTyG+yLWQaeT9IVilcwWSfUqvRhV6/1iNhxIVxy7CXS9Jt
         QwYvVlCDtzGjQV/tIhTyCrGy1jGl5o6cPXyUcxjKE10YIbGivdXJiOHo7zWGPeASLhlr
         d+nbzjnKRL4qCeFVcqtwlOwBxZU2kXMF/0Yk5ql1iZPG1zUhPX+0gfIJSMiO4QDG8CgM
         4QvA==
X-Gm-Message-State: ACrzQf0y+Oga77R3dAnaySjPSiXZtlyZ6CTuiKGJPch0lNbYLxLLu7lB
	ve7qLn9V0qicXejn+McG4so2fjFwNzpruz4a6x+4O92eI8yC0cBgI+9bpF5V0cCC0BPyEvzWdc7
	I4aHpPc6HE3nYaTO1b85PPYA=
X-Received: by 2002:ad4:5763:0:b0:4af:b800:be6b with SMTP id r3-20020ad45763000000b004afb800be6bmr27135092qvx.70.1667481342669;
        Thu, 03 Nov 2022 06:15:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wkWwSvE6CHEup2Ef6gKWqj9ltK6zJLHkALp15tzqRFgB62fZSsYulXaxwOSpn1PVBkiMlpw==
X-Received: by 2002:ad4:5763:0:b0:4af:b800:be6b with SMTP id r3-20020ad45763000000b004afb800be6bmr27135055qvx.70.1667481342442;
        Thu, 03 Nov 2022 06:15:42 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a16a800b006ed30a8fb21sm715086qkj.76.2022.11.03.06.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:15:41 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ASoC: rt5514: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:11:43 -0400
Message-Id: <20221103131144.2942-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <87v8nwmgso.wl-tiwai@suse.de>
References: <87v8nwmgso.wl-tiwai@suse.de>
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

