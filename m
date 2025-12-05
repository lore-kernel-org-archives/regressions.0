Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383D3D3B3
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 23:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764976402; cv=none; b=PXwrgAN+KZh0OFCBBlqbnqyJKPJP+BNRJGDDiornKexCymmnryy5S0jamv3KMXqnJlS75/onzt5RPao9eHRavSx3LFJb6e38vBs3rnDsJDnXPxhYtPSf0UoWFySNBd96XwQHqfx+AoWktEfI+X3SreRuN1fxKg5ZrY2ZBf9G6ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764976402; c=relaxed/simple;
	bh=Z2TnggYnSPNTQQA0qeFMaIKiMc/QIExFwLuHda2smVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbyOHWgPcWnIcSHmHtiYQ0ZlPzbOnXcNKxCO4Fg0cQafj++rObw1pnbdMgV3IsiDmZvAAJkJEl3jvafI5EjDz9TEbQo4fV0tXxqQBkSmFqhaAn51t2KuOKmRcZYJPGTomaciYPUnXpac9zFyIG2xvR5o9rwARb+8MoZHiwhUNYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+pigfWi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+pigfWi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957c929a5eso3473585e87.1
        for <regressions@lists.linux.dev>; Fri, 05 Dec 2025 15:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764976398; x=1765581198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ok3XVC2kEB7d6LX2W7MFJKuf7Db93yAzAqWhVXvqPiI=;
        b=P+pigfWiUPyM6cymwT1ik8fTBamVmorxmeT9l/BDQ3MIWpReZ9aJy5HBTRjuN99ueG
         bCreYYhAmCpBCrc+JJid+YlKQjPjrHVsR71SM5JNxLmunr9BrwLtx3Mj/j5OTdVAPsJ+
         rCiFB/fq6BZImfc0S+3lAAotVxDGsos0evan7gvcoR9nfyUL5T3vq5qP4kEMKg4aJ+EM
         YeQMiT60SpyuVzGa/A2El3NDkurBk+Hc6B7MSjEwXnjaCroheKZJPMFH53S8GIZYKw6Z
         KN41SKiJY3iH8tWHrHsmALtaMFNJ7xO8C06mrCP2ZwngTJm7HWyRi7oBVLJGVKP7ENQb
         Np0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764976398; x=1765581198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok3XVC2kEB7d6LX2W7MFJKuf7Db93yAzAqWhVXvqPiI=;
        b=aX/KwdTgczbE0OgCB4Mv0MMvvtVNe/218aiFU4RHFLQ2trOVpBv8ZMbX5zkqw2D+qH
         ccJU1mT/1+Ayb4lKAn4ekvVpWcc0gCmY8LdbhuOXe10wNZW9aDtO1L305xr7NeDiTWJ7
         CO0hEMd4cmY9gnbu+ZB6Si6jffQlv1T+fK3Rj6vg/Yz+8a3OAUGfBUJep5fbozXcgXxJ
         w3w1kaOONjPqZljaSgOixL2sjueenGtUpl40M7+hcY4OmgEAhdoG3rSmkOCatxzXoosp
         l+F9yHeKFJsELw1jGIoGKrok50cuLFWC0t2PZ6CCT3bBTZCjcnzP8Eqbo60qkRMH0+s3
         AG3g==
X-Gm-Message-State: AOJu0YzskCZrBkF8Rw6M3IhdEjSmc71fjFzV4ruWf2cuEhLCI2vRuq27
	C3MxHB+QEJKVvzpo9/LyOALZFuTi7HeQlXCpSmNm5CCT+XlrpMaBl113
X-Gm-Gg: ASbGncuqRUd2opdwXY5I59+6UWcntey4i19wNcCH/hv5gJbzpG5BkV4DObiXnld8uQ+
	wi84AOM/Qq2hZVdAiQLrb7PdRzg+KSod2D5HHjz9vNZ4eLwexk0+I2BgQ3vJ054fCqSXopy1lVB
	tyoiujDYGRFGo60QimZqdEJV5czqPJNK98iYau2Y5X0hJMMx5BEmSojKoOrkL8h3kO1TpSscxFI
	R1RABQfll96Lgp7p9YrOIZXUFf75fIc4jLN9iAkyF61lP7w1l4UZYGMG/KzlH+1JJ5x1e2mr5y9
	JEGxkz/wgRPCENOkMNovG1MyMGUDi4zeCkTVGa6cA92+sFqEHU9/YLtGSsQFVEa1w77TSeA60+w
	SLak5HVMyd+/8sPED02/EqorxTfSvTcQYqsBNQPDZW5nzn9j3AckJTi6k/hp8wZdjQ+vwOv3Fdv
	AucWL14TwEeVz8A8nMJZA=
X-Google-Smtp-Source: AGHT+IHw+siol0Y/HCUauT594fFSjA/LYfEXRKCDELP7T7smqU9LZ6s7uqmUidrRDZEZmBY4flxMEA==
X-Received: by 2002:a05:6512:2353:b0:595:8200:9f7e with SMTP id 2adb3069b0e04-5987e8af414mr145380e87.20.1764976397518;
        Fri, 05 Dec 2025 15:13:17 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7c1e2efsm1918614e87.56.2025.12.05.15.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 15:13:17 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com,
	Mario Limonciello <superm1@kernel.org>,
	patches@lists.linux.dev,
	Askar Safin <safinaskar@zohomail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpiolib: acpi: Add quirk for Dell Precision 7780
Date: Fri,  5 Dec 2025 22:32:42 +0000
Message-ID: <20251205230724.2374682-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell Precision 7780 often wakes up on its own from suspend. Sometimes
wake up happens immediately (i. e. within 7 seconds), sometimes it happens
after, say, 30 minutes.

Fixes: 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
Reported-by: Askar Safin <safinaskar@zohomail.com>
Link: https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
Cc: <stable@vger.kernel.org>
Tested-by: Askar Safin <safinaskar@gmail.com>
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index 7b95d1b03361..a0116f004975 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -370,6 +370,28 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "ASCP1A00:00@8",
 		},
 	},
+	{
+		/*
+		 * Spurious wakeups, likely from touchpad controller
+		 * Dell Precision 7780
+		 * Found in BIOS 1.24.1
+		 *
+		 * Found in touchpad firmware, installed by Dell Touchpad Firmware Update Utility version 1160.4196.9, A01
+		 * ( Dell-Touchpad-Firmware-Update-Utility_VYGNN_WIN64_1160.4196.9_A00.EXE ),
+		 * released on 11 Jul 2024
+		 *
+		 * https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 7780"),
+			DMI_MATCH(DMI_BOARD_NAME, "0C6JVW"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "VEN_0488:00@355",
+		},
+	},
 	{} /* Terminating entry */
 };
 
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449 (v6.18)
-- 
2.47.3

