Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E1450E8
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 19:35:21 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so11727317f8f.1
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695843319; x=1696448119; darn=lists.linux.dev;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/kwHgGSPER833mfnZsloSnG2/QVneER5ld9wWGGfCM=;
        b=HVFI65vUSClKm5XBbKpdrAOn3m6LQQ/zToYNSWIbk3AlOEdI1jLkq87F8DxWE3qem1
         5HFO65JUsWowy41DKFZutzU10WW6k+wT3hX4uBrSUbCnZ2bvXuiqmWdqMRgJAQ0fUZDb
         RyM8zrY4hbcsmS1oSxqCNfelUDhXm+G1Ju2ANxIVCH++QVYyXLVU7gYE/PaK40sphnpI
         gyY1em8C9gStTpbtH8TZ8dk6UGR7RopKd2FIuzVPosbxC9g4wf/GAnXNYLQiAy6gXUb1
         qLSHT33xKL8U98N2fqepB134hrMCVS8747MG86wUWp2AmUc7dE+C+B3G/R4lyXqdnVX4
         trhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695843319; x=1696448119;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/kwHgGSPER833mfnZsloSnG2/QVneER5ld9wWGGfCM=;
        b=xNft2jeVeYAcTNe1nw9hQoB6aWju5JveYZfiu7Wen5mzcOHPo7gTQSx+oGXp/H2MO4
         2WkB5N2SobYROkms3Orh8KhASG+ApxVTaz+do6sxWzQbQ2vHu/YC0uxuyaMeUskz95yA
         jG3DF4yaoiAqJ+6RYfgFZ0GT5AmAiFFshOo3f+lpmmjTKSFpcuWR6JKia/o/AH2WivZq
         tJrJpbyS2tXraOznzOUMuu9tBROhuKv7q9RcFNvKJGR4qzhcfNXoq9JGwei6m4EOIAzS
         8JjOhRl0Ykxlt0yW3wv6oJAk0FoqFqOZTd0p+umzHYR9CYG7T5rGw0J51jy9sFtvQaJ2
         a6oQ==
X-Gm-Message-State: AOJu0YyL7KRG7VJOGhqc1GLoOXHSe6++Fhhks9WH6erxk/oRCKe2uBM2
	9sYdW5l4ot8bhSyNqxTUpFw=
X-Google-Smtp-Source: AGHT+IHl9dYpXN9XqXHiG6al2NGt7W95zzeD9nIMVhn3PlsdI/RctpeCZKJ/BoF5mQLG7aW3oIiarw==
X-Received: by 2002:a05:6000:1112:b0:321:6a61:e45a with SMTP id z18-20020a056000111200b003216a61e45amr3040357wrw.15.1695843319317;
        Wed, 27 Sep 2023 12:35:19 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id m4-20020adff384000000b00321673de0d7sm2379099wro.25.2023.09.27.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 12:35:18 -0700 (PDT)
Date: Wed, 27 Sep 2023 21:35:12 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: [PATCH v2] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: broonie@kernel.org
Cc: git@augustwikerfors.se, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev
Message-Id: <O2TN1S.57QJOL6TXOBC1@gmail.com>
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
The latter two received similar fixes in commit 1263cc0f414d.

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 
82SJ")
Cc: stable@vger.kernel.org
Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
---
v1->v2 changes:
* add Fixes and Cc tags to commit message
* remove redundant LKML link from commit message
* fix mangled diff

sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c 
b/sound/soc/amd/yc/acp6x-mach.c
index 3d8a51351e29..e3d2b9d01552 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -241,6 +241,13 @@ static const struct dmi_system_id 
yc_acp_quirk_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 	}
 	},
+	{
+	.driver_data = &acp6x_card,
+	.matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
+	}
+	},
 	{
 	.driver_data = &acp6x_card,
 	.matches = {
--
2.42.0



