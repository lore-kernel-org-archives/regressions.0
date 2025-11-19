Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103530DD0A
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573432; cv=none; b=BSnq7MER49l50DObptn3oqEyoDjeU63PlyJoZQXbavdnqRxgJt/+pZUJi43iVCZ8NHMxNBugiNJkN6sH6Gbd+RSl4B5L9YquJzHkxRvN8xlAEXbI6SHXryqovQct7ej7O7K7OgTdBs65RNZsfF4hsEFTrz871HvleqjE++YScaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573432; c=relaxed/simple;
	bh=DulPoKHD+kYa5guw7XEkGvzu8pnfnuu0PPM1s5kskN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYJEW/ClKVf/NkRD3kjM+YmQ0uRdG293KNspTmTM3LAsuliQAyDp5io/y3bpDJrBOfKnaAOv0YA1wbsXVmSD68WiHdDq67mtyhNXKbfwfcv2HK/ZhZnLtiV9NlD9IrEnG+OFUeSruN5xwQJTtAFu/r2oGxlCyVI7TZKo6aa01Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJafdsmd; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJafdsmd"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so6762852b3a.1
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763573428; x=1764178228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TMBoUXycCoalUx2IdYMe60O4++ie5VkCIVBelZSQqfI=;
        b=QJafdsmd7cyDmuBi9ibZgIoyDKEZ7sTOhg0WJ2xoKPYMsN+ysDXlNaaaY8iJT/WaBF
         5wBswEoLg0H89lnU7NU0VFtWLLmIeqN2SDo1gCc2gKENwKmMYiktt/145y/SieCshUVd
         TwPY+OYeS7hkZh+UGeP9Znc009ETpYl042XqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573428; x=1764178228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMBoUXycCoalUx2IdYMe60O4++ie5VkCIVBelZSQqfI=;
        b=QIjPkBY81TEt7rXwhXszLpDfyR/5sCHlz+ibmKpN8fzsJlsDVaRoF8fCzM3sGxWzTE
         pl2bfqhHPIci7nJYJqCGvPdrvRv1SybI8FmkKLrd4l/N9+7gTJu5RP/sHgSFoCFj4fIv
         V3fhseWM8p7YUOD0EY0ClHYxA/MQ0LrW2a+XDpM4DLYBr/E7J41ClDKBti0UZPB9d1sV
         dGihDCSWKinql+LFdtGvCqPQZyPVkb1jS1KqmJYAYiPPpQPzBOnD6r8qnvDg5dEVXWh2
         AlpekCbGiZSI+B8ouX+Uqiu2XpDTinxdjO4h8qIzTCSZaK0xujfcRrTrRBIP+56jN84i
         eEIg==
X-Forwarded-Encrypted: i=1; AJvYcCXDD6yI/1VA2qvxvVSOYt3BaPq0g1Bi+lSes3tPGM2ffJj12Wvf+RDZQajnFROf4TA2Oi95AVurMfkwtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNoUh0HvxNvkpLfyYvW3FKPPOIo2AmKlc7LSIykIui1M2tYGas
	mY7Dz2uOlBEUYPj+qlFmJMDdrZYuCXocS4t4ziKoNnbJRLziMlBtAzBLTkh4buuebQ==
X-Gm-Gg: ASbGncsozCwyVAU+OI0Hd1d5pSqM8US56Ow2+ILfEmO+efJ1UdRuAhrBdK6z4/x8h8r
	EYa+8ytoqwVhu3PKvV3fukJwknS2oxpylrOO1YeyGduCDAmPYaNZGLB/Gn3ZNUrrKGmjox4/jpL
	6gMYnlvCxjnSLHgaqtBQGps21/bJGte3KiV2nawl+ksTw3PJ2JqQrQzUQfvQZBPEtqJ1Vb9xVBN
	1CUjcHZNRnIEqqTa0GVaDK10/d5cEzudkC33wgGfbFO9I6s8qFFoHP/ZiEV1g2KInq9ymSQnNqQ
	PKAewrKNIAj5AaLkOf0OgZuKqZFvKHqQ2SfSiK599WZ5Pkkfc18kSoxoPO4+P4gPW7WyBmeHcU7
	UzkgULE8CDEmkVOdB1YnPDakQw4GvT0juhqDL04s0XHFwrqPmXp5ZZ8cltS4OZrwQEYec5mlfhm
	1u8SlZNph22a3gs2vRDdmtCT2JzCCn73Io8NDLDcR4zMe0lmk1iUEaFkJx/b+eTfaAhxuEnpE=
X-Google-Smtp-Source: AGHT+IFB2YSTkbyEbeQu8O7Mtor+aeK/rpWG1+Is+9xqP/zrbkSWBMOGAREHyl95i2ctzd/T2DJJ7Q==
X-Received: by 2002:aa7:88c9:0:b0:7b8:d12f:90ae with SMTP id d2e1a72fcca58-7c29de3b6f2mr4341114b3a.21.1763573427806;
        Wed, 19 Nov 2025 09:30:27 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cf0b:c8dd:8f4c:d649])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92772e713sm19839792b3a.54.2025.11.19.09.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 09:30:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: incogcyberpunk@proton.me,
	regressions@lists.linux.dev,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	johan.hedberg@gmail.com,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Wed, 19 Nov 2025 09:26:42 -0800
Message-ID: <20251119092641.v2.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I have no way to test this commit myself other than to compile it. It
looks fairly straightforward, though, so I'm hopeful it will fix the
problem.

Changes in v2:
- Rebase atop commit 529ac8e706c3 ("Bluetooth: ... mtk iso interface")

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

