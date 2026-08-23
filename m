Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88596384CD1
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787481115; cv=none; b=fZ9NBHhDXXD4jUqiUgblkbuyWEJj14xNL8WRGOy5NNutyO+N0gRpCWbBT47P7dc000pQhweArctqN4D7kk95NGnrTmfWaln4QVJCKuJ17F5Jtp9V7XHU9ZrnphB+uh37ui8NLZD+Qi0wGfslF4UCNt91xMnECjj06b7EHVqc2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787481115; c=relaxed/simple;
	bh=dQUbW3oLnHxWw4n65dJh3z82+rr/im6seKUc5Ma+wIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/ARQcf4+b80sisagJsTS4xjWtAnD34sU49LgebIjB3JfnuZhS1OT7XWxJ18Xu0zHEM+ROkHX8qQYkh+vZUspP+t2EgsvNT4xyKDpNuN2kdncaOkHSQWURoG3pc3XPxcaQHV4T13ads+o5j0Tq3dta84PSPapEN5hBKMSd3qr6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOJl3T+l; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOJl3T+l"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c160420289bso366876466b.0
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787481111; x=1788085911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFnTFrfpFngdekWeSORF1sopRz6Cq1mU1Ri99WmzuVg=;
        b=cOJl3T+lDwNrMwTPggafsVm1EISdMXMwgT4gbvq7oU7YtddWYnqUFFPGK17VAotgGV
         H0BSid57UqlnPjM2BxamgtWCWpLLiqXtWZeLMyJXeFVcqCdC9bktoP1C8cJikV4dEniD
         ZMt9ac4G1VGUfL7rSvPiAyvsZwh3uM+ed6c7B0g9tjxH8JUc6mxkAJZ4mhPZI3Ye2vZy
         Q3ga99f3duev3eHFCV2NiBSEaRDUbKjAWIe6HGVG0UMM5U9zgdJVzWfZozU0+7mEgDE0
         PLeYXtmM3w/l57/f+POqk9PYYa+qUWF9vcb33gr8tj7mKB3hP9O9zFyr1xSY7wdF4A4L
         KVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787481111; x=1788085911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFnTFrfpFngdekWeSORF1sopRz6Cq1mU1Ri99WmzuVg=;
        b=e6uvLjnGNyz1sMO+unRnLxxL4VGjWiLLcENPbo4BAR7CKLjvaPI2Fl7KTkTVCAAprv
         FIZvppBXGSjUeH2MnpT4+NXrLbq10KPLIZdJ3CIahBou0lENPpORX8ovIjt+k8FfAkZr
         Cs232MeadcDQsFXYIvGzHIJO2J+UAKOsEEtPLJ5NFZ/aamhDFA9vf6aQ1GR4x1gSjUoD
         y+M8Z+47EIM18siU+tzX+9fhQJEue0Dlz2Dsprzq0OMR/6M9lVTXj3lrodEFKeeHB44M
         k2JLyjf9g5EQj4TBz+Gb8iI2NPHEgkdcdFXHFIx8m8k6Kqj+1p/ipzGabQqmrvZF0kLE
         i02w==
X-Forwarded-Encrypted: i=1; AHgh+RpseCmPjX3X3tKEMvU3/M/edlWpA0xU8eAu+EZqGSMnGtt368hTkVIbgsWFV51XrL7ly4KVvenjcQX99w==@lists.linux.dev
X-Gm-Message-State: AFuF++mKiTqhsinhO868EouXGaZMx3b6vLaCMiQYs1RcGH7PR4Dm+H1z
	w6xbpGUzAyvriIE70zVoTm9A6INlX6B0MDsDDoH1Myz4o4i5ZBoIb46pMEyFOwFe
X-Gm-Gg: AR+sD1290RkPwg/HbUzTzoc2LcwG4n7K2J/GZMvIooSt9jkuFPkp1vimT4IS4GyS5PS
	OA5tWZrJpABbsziN2ochRLkcUq8FUzET+jR+aBP+FjgnXOldEtB8V4o775aLXcsW3+Af9gLeDbw
	rgKqaDy4+gerntgHCl371KoelC0Utaw255Ch7ofAVrpKfEyWqa/UVhN10zNBh+14XvBmYI3c93w
	0cUwoM4FF+C47t+BHJy3rRiP7LGrtARtkGnnZdM1wrfPaPrTzTRYJiltDhZiYPZh1XZDW05iBzN
	jVBkx5r7EvhhKHOL8VDCZ9C7Ev/YqfB5ZSBKcWTKi5ygeuBG2S/WzOFD2Ii/BnG1sCOv0H1Z9He
	5t71RXnBWoqTVniU/HFJYxDdzAX64kQ/Q4gjBqO+qkQwfeWlb5zKTJJII8VXkHSRoPjgvMME6Ic
	7igVdPE4P6ogiLErToaI8iUxN/GEfwsIXPR9V0S/fACgn+mIWD0GVCdpn9leuNkDawTclSTezD+
	JVHi0qv3s/rLnpogSInm8yojgMib3k6bCz1ZvchwjVmwfobXNmsOVV6jjN5AA3r4c08TLA+d7Nz
	Vquork5RdJkl0ELeaA==
X-Received: by 2002:a17:906:81d8:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c246a6ca584mr1761699566b.18.1787481111314;
        Sun, 23 Aug 2026 03:31:51 -0700 (PDT)
Received: from bobo (d163-170.icpnet.pl. [109.173.163.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm730232166b.43.2026.08.23.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 03:31:51 -0700 (PDT)
From: Kamil Serwus <kserwus@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Alexej Sidorenko <alexej@sidorenko.cz>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Kamil Serwus <kserwus@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan"
Date: Sun, 23 Aug 2026 12:29:59 +0200
Message-ID: <20260823102959.100368-1-kserwus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 5ead2063611ae56809b1b113ac44cef9547c81d7.

It sets HCI_QUIRK_BROKEN_EXT_SCAN for every CHIP_ID_8761B, which forces
the legacy LE Set Scan Enable command (0x200c). That was validated on one
dongle, USB 0bda:a728, and it breaks others sharing the chip id: on
0bda:8771 (fw 0xdfc6d922) extended scan works fine, but the firmware
stops answering the legacy scan-disable command:

  Bluetooth: hci0: command 0x200c tx timeout
  Bluetooth: hci0: Unable to disable scanning: -110
  Bluetooth: hci0: Resetting usb device.

btusb then resets the controller, it re-enumerates and every connected
BLE device is dropped, which on a machine with a Bluetooth keyboard and
trackball leaves no input at all. v7.1.x drives the same dongle, with the
same firmware, for hours without a single scan error.

This does put 0bda:a728 back to its pre-v7.2 behaviour, where extended
scan logged repeated -EBUSY messages but the controller stayed usable. A
detection-based fix is under discussion on the list, but the culprit has
already reached 7.1.9 and 6.18.45, so the regression is better undone
first.

Fixes: 5ead2063611a ("Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-bluetooth/20260822141115.58815-1-kserwus@gmail.com/
Signed-off-by: Kamil Serwus <kserwus@gmail.com>
---
 drivers/bluetooth/btrtl.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 7f54d2d2d..03fa9409e 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1343,19 +1343,6 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 	if (!btrtl_dev->ic_info)
 		return;
 
-	switch (btrtl_dev->project_id) {
-	case CHIP_ID_8761B:
-		/* RTL8761B/BU reports HCI version 5.1 but does not support
-		 * the LE Extended Scan commands (Opcode 0x2042), causing
-		 * repeated -EBUSY failures when BlueZ attempts extended
-		 * scanning while a connection is active.
-		 */
-		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
-		break;
-	default:
-		break;
-	}
-
 	switch (btrtl_dev->ic_info->lmp_subver) {
 	case RTL_ROM_LMP_8703B:
 		/* 8723CS reports two pages for local ext features,

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.55.0

