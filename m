Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87888746A
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 22:38:23 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31f71b25a99so12009163f8f.2
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 15:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695854302; x=1696459102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RqKnQ384vFzLQtfAR/lBEgRDbU9k5LVLEF+EOb6OZQ=;
        b=IkyRS9NSbnizTwHn7SgbrkHe+MekYPtGK6cCZz+XpFiSeJw0J+r9Sk7Vut9LSyP0wC
         8tSrZh69ctuztn1OabP4QQNwvMw3gi8Dem5RIgaUqYE6ydnXKiW4W+5QTLWSgox8AycY
         egs1RxEebLd++zS7h45ndscLTQ8Y/qmOmkR2UGXU1Hop233eJ4i+JMeY6y8zCN9+Hw+B
         RLIjKeSA/eJ4GMoIG9uJyetKKzobbyMdhR9HOYlQW0gxkSGjX0YUdj0+/kl61HaQbFdJ
         Ngy3XxcE8/ktthhmKPd58vOwf7GRIB3WiE8WSQ1xKbA5y1ToiQbB6FBuj2eAQKnNh/En
         9alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854302; x=1696459102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RqKnQ384vFzLQtfAR/lBEgRDbU9k5LVLEF+EOb6OZQ=;
        b=AT3iytUVIgKk4kzg1A5QgCjOmjidS7WXVwggd48HNaShfI63RfNk04UAy2Hy9OI/UN
         +EapozA4MhQqyEFsY+K9J3Wz2uaWJshTMrpvrtZVMlk8RgzBIO2KhO0OQaivZuyZsEsb
         e4ULV+DekUJ97c3CyN4hzjTULzUXYS7Fys4/WG9PWeShZvuemtNBz+pWO+puubI0xf5k
         0crCBg70XDPriD/DMG7CsVZv9ZV9yvE42nFbMddf1ovDaQR7SxxPIjBdS508e98fX3JP
         VlmtXTDtGXZR4fDIOTUjj7cG3kUsx4AmTemLE+9wEev11+fosGCCOZCt4kLtC5rvo1zE
         K6Eg==
X-Gm-Message-State: AOJu0Yzey5AcsH5jT6syS+8459CmiblmPOZcp2Q2koWFbysosJfjXoW8
	lkMWpmlrcZpeYYiYO4MaSxM=
X-Google-Smtp-Source: AGHT+IEtPyqOdvggdme1F7Zk7QQYP32qu1nZmurf+Vdr4qpg/HWLBeF4/Hp888VsCYml8AiGnn90Rw==
X-Received: by 2002:adf:e749:0:b0:320:bb1:5a73 with SMTP id c9-20020adfe749000000b003200bb15a73mr2917396wrn.22.1695854301359;
        Wed, 27 Sep 2023 15:38:21 -0700 (PDT)
Received: from yoga.fem.tu-ilmenau.de ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id j2-20020a5d4642000000b00317e77106dbsm18013776wrs.48.2023.09.27.15.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:38:21 -0700 (PDT)
From: Sven Frotscher <sven.frotscher@gmail.com>
To: broonie@kernel.org
Cc: git@augustwikerfors.se,
	alsa-devel@alsa-project.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	regressions@lists.linux.dev,
	Sven Frotscher <sven.frotscher@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Date: Thu, 28 Sep 2023 00:36:07 +0200
Message-ID: <20230927223758.18870-1-sven.frotscher@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
requires an entry in the quirk list to enable the internal microphone.
The latter two received similar fixes in commit 1263cc0f414d
("ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG").

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")
Cc: stable@vger.kernel.org
Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
---
v3->v4 changes:
* re-add blank line between commit message title and body
---
v2->v3 changes:
* add message title of referenced commit to commit message
* make whitespace consistent with surrounding code
* use a patch-friendly e-mail client
---
v1->v2 changes:
* add Fixes and Cc tags to commit message
* remove redundant LKML link from commit message
* fix mangled diff
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 94e9eb8e73f2..15a864dcd7bd 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -241,6 +241,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.42.0

