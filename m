Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF434A551
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 16:29:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so108586575e9.3
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 09:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695832173; x=1696436973; darn=lists.linux.dev;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QDCfzaeGWcIi7AD4z9zDOVfBWix11jNGiL4ta6mok7Q=;
        b=i+/VS7epSLWNcoD2GLLSxtRS4uI2jNtLqQ6e5taVdxtfpd32vksR69rhSX/DFYcuRy
         thp1ZGNhzmOGhoY3OPUUi4qWWvPLWxKUMRGrjOCEnjNHv42xPBue4k80up8pafC8aI11
         /2hrE0YCbR2DG53YDQAyZVrqlCJo2gpEWrq9Zl3PHHKFX7v5fNsmQW7hjiASo+j3ERno
         PVH/9bs172K45Thn5ESB6tdjzv9GPbK7Ioahhq6bO8msxKZ9bZe51KcQ0XkJCVx59AhY
         N1eY/pav17H/9uqIrMfH6haxgN6ViAs6yDV6ww+TG0jiGYBRA5mmISCdbJ6n6NXUaG5j
         CSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695832173; x=1696436973;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QDCfzaeGWcIi7AD4z9zDOVfBWix11jNGiL4ta6mok7Q=;
        b=c6nXpyXN+Xe83cnh5xw5JTSuvJyYgiNFn2v+91I+t5oZdOkgq+WmDAhA4sGMz0Gac8
         oen8k//0ZdMixoBI5ZcveuVyjWTp4kOTkz+5fUnNiej2nC/19jMolnMF7motXfwRr6/F
         h888gNRrX6InTu+r7K00+rlyI29ptuRdCHwLLhiJ0VtV3ZxsAEW0L/0Z/yLyoAsbjX8F
         O2kxBzF1xLiuTiGbsC3HhCQtyzb/q86+DW2jrbd8gUn+rYvIv1KtdUahit5P1r9f9SNi
         dhJnCY640zKtSNlVH6HhXF2Pvl1jWCiX+wbtKVVJDxnkRU+2uWJUM7fLnC/fAY8k5FzI
         fVUQ==
X-Gm-Message-State: AOJu0YwM9m6/rGpsInjeAqE0f8Xoe3JGwmoxtFQpuB5YpuWrGfK8epUi
	qxP8pIt7RBd005Ct1v5yEbw=
X-Google-Smtp-Source: AGHT+IHZ14obC9/XSaCfdC7bhMAaNzWl5pFem971kF4c1AI/TMOUFYjMimOzF5kR/Wyx/g+tjXrfzw==
X-Received: by 2002:a05:600c:244:b0:3fe:1232:93fa with SMTP id 4-20020a05600c024400b003fe123293famr2392386wmj.22.1695832172753;
        Wed, 27 Sep 2023 09:29:32 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b004058e6379d8sm9334215wmz.23.2023.09.27.09.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:29:30 -0700 (PDT)
Date: Wed, 27 Sep 2023 18:22:39 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: broonie@kernel.org
Cc: git@augustwikerfors.se, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev
Message-Id: <R5KN1S.18M6QDS4T9PY1@gmail.com>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed


Like the Lenovo 82TL, 82V2, 82QF and 82UG, the 82YM (Yoga 7 14ARP8)
requires an entry in the quirk list to enable the internal microphone.
The latter two received similar fixes in commit 1263cc0f, see
https://lore.kernel.org/r/20230911213409.6106-1-git@augustwikerfors.se.

Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c 
b/sound/soc/amd/yc/acp6x-mach.c
index 3d8a51351e29..e3d2b9d01552 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -241,6 +241,13 @@ static const struct dmi_system_id 
yc_acp_quirk_table[] = {
 >..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 >..>...}
 >..},
+>..{
+>..>....driver_data = &acp6x_card,
+>..>....matches = {
+>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+>..>...}
+>..},
 >..{
 >..>....driver_data = &acp6x_card,
 >..>....matches = {
--
2.42.0


