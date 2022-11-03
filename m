Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D07485
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667486781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CJkpFb1DAm+sVktUmkKDmWhR4Gb2Q3CNwmufg7Xs7+c=;
	b=e9ftHUAFpusOYkLw+qOdJr8w4FFoc9+nS3b5kHR6sSnqg+XWKkBQnR0GMbA3Dg2PgVCmAo
	TvOj+h+Zsh9ggvTonasm9BcK2K7mNr+EIFmo1KOGy1oSQtOOcsNhrkqaj9WndcKS2XwWLO
	KLbPUA0hXM+djBytF/IWT+x0HVoqYlw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-fvlSlLANPSGylU1eHS98Gg-1; Thu, 03 Nov 2022 10:46:21 -0400
X-MC-Unique: fvlSlLANPSGylU1eHS98Gg-1
Received: by mail-qv1-f72.google.com with SMTP id b2-20020a0cfe62000000b004bbfb15297dso1415565qvv.19
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 07:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJkpFb1DAm+sVktUmkKDmWhR4Gb2Q3CNwmufg7Xs7+c=;
        b=HuEvin8GAPAyJUgZMMAhPH3lsPNBt2UqWsqmBiW6JbDU2J8NZBqdxv40bs9nbqfYs/
         X0IS6/X/ZxU3PAfw/lJ6hhmu3ZcM/Fo3xYlOi0ouHgMbJyDl7CsQ9flUNyzjjx2x/YK4
         OV6xnuskiIHUe+DOopJjgTRTiftPxF/cfD8azh0/lK9z5PFWNmHwKr61zZmdchAUSSQ4
         7ImVZzjsQ1++81Su09Zq+mPhvXH58b9tsNmc/3UCXWdaEZyWAdrDIjN4SBB/AkTUuSrx
         3B7o08Eq4r2Duman3cVO8Su3D/uZLyZMmS60d2h+srfoKS6aAyKzBUa1hLpFhTfZ3KGA
         jrWA==
X-Gm-Message-State: ACrzQf04wwLW5pgoau/I7gjT2Esv79nUuzrxncdJR8u1q28E0oqtoFzh
	2ld86p7geLS8pJ93vtANef032l15EzxKAMC66KwKzjhdbFP6HB9Mon7aTNvfAje3g8kmdmDZ8GA
	tY9FAJfDk9bw/cHYC16pDYgA=
X-Received: by 2002:a05:620a:244d:b0:6ee:7a23:dfa6 with SMTP id h13-20020a05620a244d00b006ee7a23dfa6mr23135204qkn.463.1667486780396;
        Thu, 03 Nov 2022 07:46:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44Qf1+rRdA3GgSs9RSbnt8FRAE99HpxH7zhBi9j+kvh16bWVVObc8Hqnl0MvXVtoxAOKZg8w==
X-Received: by 2002:a05:620a:244d:b0:6ee:7a23:dfa6 with SMTP id h13-20020a05620a244d00b006ee7a23dfa6mr23135175qkn.463.1667486780123;
        Thu, 03 Nov 2022 07:46:20 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id h15-20020a05620a244f00b006fa468342a3sm873175qkn.108.2022.11.03.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:46:19 -0700 (PDT)
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
Subject: [PATCH v4 1/2] ASoC: rt5514: fix legacy dai naming
Date: Thu,  3 Nov 2022 10:46:11 -0400
Message-Id: <20221103144612.4431-1-jmontleo@redhat.com>
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

Fixes: fc34ece41f71 ("ASoC: Refactor non_legacy_dai_naming flag")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=216641
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

