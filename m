Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A0EDB
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 22:32:21 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-405524e6769so63849465e9.1
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695853939; x=1696458739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9WCpJ9NzeLVvWIWMoXZNdOxnnzDXic6RaiR8cReCog=;
        b=Qw7tX6aiiaQdSCgSznM9qUe3EwTOTdgA5y1Vpwi1qfidVDkp8MWZOyg1dax8AM0Lbe
         I1BiqdTyAqoYIen2ZZpBazmVGxNfdW8JMZfyCGdtMKoRQXy/vIGsCgLFUXta9w86N1y5
         lUUiIyq6QmoXL0DmejEmudM/OWBwZApnsia3MQfpA1ri9mEjvE73j7a6nEfA5pA0jL+4
         clB2nA4Z0Te48HkP/GstCbpGfwI0PAJA0Eteclgs5rCKx1FYES07mJjj1UgYCqeZyVdZ
         n4poanK4C9giCMNp3cli42MPTvdhg9Jg+6uHEgNkyToM03u0rGIcEAJcvbLUffD5N4nR
         hfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695853939; x=1696458739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9WCpJ9NzeLVvWIWMoXZNdOxnnzDXic6RaiR8cReCog=;
        b=Da40/6Y+r6iaqh5zmVIa37uX2ebnCVYPVJGCldq8iJFY09gL8R3G+vg9K7+4u2setm
         m2gsigHBgjxVDU1SSwJptA8iuukY2Njoux9u+v3ml2sPaXREPqtbTDngLDPKWlLo35od
         Gg3uI6h189p6YeYyus4FFX5q8bjt0eNN2ZtemTlFbzax+FK4tNyzbGtkVhNBGih4J21p
         FkyG55YQwjqn3rzsvRve7NmaSndZ3pAM80BO7FsUSx5yOXV4d+86FDemvxfipYJHP2lL
         b0TvNb3s6IJ7POaQVjz/o0LNiWlKTP8AbqUd8MUUhu9HtQXeve5QJr1ETR2l1rXtc4zO
         kd7g==
X-Gm-Message-State: AOJu0YwJXI5pcPxZmkk7N58t0dkSU3zO2h1GrzrdWZnlAtfUignlas4/
	E3d9eLJnOQ23kpnmsisFJkk=
X-Google-Smtp-Source: AGHT+IFj90YtQ231dKDr0LEfgiMpXwVWVmPmdjVad5uEus1rDhNZDLL8aaM/ziz9du6rV9rqF69JKg==
X-Received: by 2002:a05:600c:1c13:b0:401:c717:ec6d with SMTP id j19-20020a05600c1c1300b00401c717ec6dmr5932985wms.15.1695853939206;
        Wed, 27 Sep 2023 15:32:19 -0700 (PDT)
Received: from yoga.fem.tu-ilmenau.de ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d4a8b000000b0031ffb51f6f9sm18019304wrq.30.2023.09.27.15.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:32:18 -0700 (PDT)
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
Subject: [PATCH v3] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Date: Wed, 27 Sep 2023 23:48:02 +0200
Message-ID: <20230927215058.16220-2-sven.frotscher@gmail.com>
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

