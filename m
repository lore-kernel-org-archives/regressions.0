Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EE6358D21
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763655234; cv=none; b=FSkTMpke4OJ37nhDEjR9sEvZc+Su+FlLUE56eL9oAWUs12ipsiBzNklv/xyWRHstiphyFZsbYTotrR+avszYHtqd9gvltLqQIUfIKbMy7GDgqPLoFjyvJHDOtVLimGrp1wQtP5yM6aQZ7wW296TQp1Fdo24qrnwczJX17AljuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763655234; c=relaxed/simple;
	bh=gN67dPn5HJkDHA9rzNNREU8a/Ke/QYzy2kebu4ZH7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GtBHLXDInYUyzhwKHw+iqQMBOBbvDc+w9S6b9Dd1ESooi6btLSSnoi46S8FI5NlACHodVQnqRSiaDRss0ibRX41rX23l1pbiQqLAIq+cKQqW8F+SSn9GPSZzWIAZXw5EBp21LdMVp8YUshd9y7RGZiQYzyGz/VYfc2OvHg/53Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gohieE96; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gohieE96"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297f35be2ffso16373845ad.2
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763655232; x=1764260032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=;
        b=gohieE965CKMZxqlmAW2m/klwiqA2Tb01LPmUSNLTADoF8Y8LH+YRHAaST/tr27bti
         fortDoYqnuW/PVEZ+RTlp0myI8M5Ev439xD4oZ6W+tGPuoli7f4BgLrECMenE9UhVDcq
         kGpeVv/wQPcReLvceJ0jJ+afI0ecPMsCpQmpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655232; x=1764260032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaSUH4/iI6K4vkTA9vG1I3sRuhxHn3+OXrhAbv97RTc=;
        b=tc++qmL/0F41WfRlq8NBJTtX3cEPhwJCc8+AAYXjIlETQuuXgsdRj+GCddesg67lcw
         4gA76j60R1yrQsqKrGNt/NJpsCkDn9aD552rkTAFyWgr0CAavARF0fzDErVfDOzLP2aT
         q35IjjItE1Kmy2Q8gJcOJx7nhWU7Xk5Ap0D1FJFHP7NIrShFgpYCdiOqdrM1sMiEnZ5j
         u8oGJfC4iWgkRJXpsW9ILBGqAZMazqSPr8xFVwk6fYb1KaOHI9zvhvKJlx/x8VEAWHOW
         rzKUptqQ7loe/zEwylmm+66zD5/pF3hPErPKs7xkwhyu8xk4TFt4FgZZgqDzAPAQnauJ
         c+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXJZMMmikLDmIYGCzypA/TN5aCfklXZh6GwBBPtwnuCd6OVDGt/3xErZvHfu5cKHhPM81iHyh3rP4Z4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWewH1xdgy3ggPst0JuzaKX6QCCDLqCon/pJOsqFUnVc4wjxFT
	EOn+mBw5qn+LW4rAOPSUKj/KcTzS2hiLzBlwWserpGipsS6AyPuR2oi/vvI+dsz94g==
X-Gm-Gg: ASbGnctS/DRr0bgQLaRqHT+MD0eMwv8ui0jpQYglgDUcKX0rme6OV2aQ8VZaoz3Vt46
	o7z//E1wbMHB0XnhVpxQW7pW/vCoxhfw4aVFA4Ae5wEXdoJFE/Rv7Iz7PkWtCCcZoWL61wmm07W
	q/36a+kMnC4a1T16L3v1HjYBTtyhwLz24mQIL/dPUXLJI8o2+wHDsfgw/4oYtJnHfmnl4xog1M4
	alJQcC8LrqSUKMZ4VV4tSSKCJmFZW3PEfNbPDMQEIXXL1uy+EwkKrmxHu3TMqxJkHtusNxH4wPW
	YAhQvykrf5iswlwlHPU4xqQEbArkXHCKJnxu6mEP0BgNlilJxAkw4mu3dlcnSO5Rna3qBv2wQTx
	19i/0baZ3J8V8rWUoSL3ExIOk/dJoYkNUx+6mJeB5i5PsWcRjd9N8hGdkObM10LmgUII66I2wi0
	/EkR3JNeWRfTEMWnN1PP2mIvScdfK+/wE45Bt0MNjLiLA3iAOQcZCUJLO5y7H0DdfKLsNbjpY=
X-Google-Smtp-Source: AGHT+IHXE1Lf/Npuwj0zFjBOEWKicuzA3UumJeheDegj7w9jH2aGLxpoO1AX2E47uPWOL3GSil4eRA==
X-Received: by 2002:a05:7022:b88:b0:11b:9386:826b with SMTP id a92af1059eb24-11c938a5da8mr1482106c88.48.1763655232027;
        Thu, 20 Nov 2025 08:13:52 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:b075:e64a:7168:da0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm14316777eec.2.2025.11.20.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:13:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Thu, 20 Nov 2025 08:12:28 -0800
Message-ID: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
  usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)

That function can return NULL in some cases. Even when it returns
NULL, though, we still go on to call btusb_mtk_claim_iso_intf().

As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
when `btmtk_data->isopkt_intf` is NULL will cause a crash because
we'll end up passing a bad pointer to device_lock(). Prior to that
commit we'd pass the NULL pointer directly to
usb_driver_claim_interface() which would detect it and return an
error, which was handled.

Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
at the start of the function. This makes the code handle a NULL
`btmtk_data->isopkt_intf` the same way it did before the problematic
commit (just with a slight change to the error message printed).

Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info
Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()")
Cc: stable@vger.kernel.org
Tested-by: IncogCyberpunk <incogcyberpunk@proton.me>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Added Cc to stable.
- Added IncogCyberpunk Tested-by tag.
- v2: https://patch.msgid.link/20251119092641.v2.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid

Changes in v2:
- Rebase atop commit 529ac8e706c3 ("Bluetooth: ... mtk iso interface")
- v1: https://patch.msgid.link/20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid

 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcc62e2fb641..683ac02e964b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	if (!btmtk_data)
 		return;
 
+	if (!btmtk_data->isopkt_intf) {
+		bt_dev_err(data->hdev, "Can't claim NULL iso interface");
+		return;
+	}
+
 	/*
 	 * The function usb_driver_claim_interface() is documented to need
 	 * locks held if it's not called from a probe routine. The code here
-- 
2.52.0.rc1.455.g30608eb744-goog

