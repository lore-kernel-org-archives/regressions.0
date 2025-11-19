Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0B2D9EC2
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571265; cv=none; b=e0EJOX9IAa4DvjwZ1jxVLyy/PlnNqF/1ixEqRbmEcu+ImXOS+R/czXQnRcM0Vg2qOzLZv0gDbVbo3h4KYDcGH2Pi9Kr5qnHCo+Wv7EaAy++p/iMHC8uRuUujPx5Qr5aD4WcgzODiAVw9/OrNGSqgu8llI3rFE5/A02W//4hy6Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571265; c=relaxed/simple;
	bh=h4wdFPYGSI5IgxCym5OqjAQMc9s/zRmY7IaPrPtm9Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTg3IzFG/0AcBtga1ybA2Vl0DudFp3pWfJ4171/XBfR6kBkJXNtT6H2qXU04bBMOUwF6QFq7JeJuFkIjk6L6h5HZKacaQRf5PjAAXNrcXTeoblVYKSTWdgUXOquNPruPRiFiXp+FQLbjzNVXW2oHMNln79R9HVELu5v7pk50z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h4W495jG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h4W495jG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so6719950b3a.1
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 08:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763571263; x=1764176063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=;
        b=h4W495jGxc04RE7OWFjeeynQyeSJ2nVNeo1K5AVBO4DV5hnXovaulQtv1663NIEvwH
         xPf3zJour2twuJiLnIWgGgOXSy24UjZ2/kXxqTqSVnTnazR/bLBXHINDzrPelYh6g4fn
         v7KJSYZvrjVJOdadZJ66bvJW6nAmVbBt9Egew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571263; x=1764176063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNHinq4/2cTHhTy5HKSefqHwCj7EyOMXN8DmFkxYCE0=;
        b=D8r2DS61ztDHDBJCZ4XoVBUK9PLU0hq3liQEuBPVehzzznkoOjM0y7Lw1QBqZHfcjI
         8V+XrxPPM/h9W1XrehAuaIx4QyFM2aCGfiSpxS549TI+Qclw8N+o69r9dvvwoxuNdK57
         MdxOmW0ZbrZcP3Q8YLYST//ojJNFrJIqbEJb0qhFUtXJRwtiY28SDWbYA400t7frC2cb
         idKoSAYGjcYxBRC5IG5hWlMWzyziHltdsyHLDmbhsl2d1vCumSu6FpcNAJO+wwaZTDjQ
         HYrKUgwmMYj2WKRoRxiv0WXKH3x3u27TeX6FTJbQkEB002WegjddOcUUpqMlTf3Ao6mf
         uJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs1MoY20mHVZL5JJxHcISUZTXm2nk+UyCGo5VxoZK0cgRvhcz6JNP3gKQKTVlG+Blx5YFl5WiPOmMQMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+qHSAOOXyyC0gjjyYO5n/2noNcqMnEvrIbjDT8/UnRIEZHU4C
	Cw5dojinwhjWOtpeTUjTXG0xmXIUm+ocRVvPyGSnYIE3P2HzeZzfUg2KSSN/B6/A9A==
X-Gm-Gg: ASbGnctzRkv01hA6GK/fhltMpxqhsiL3e4JP0MdYgwYg0OksOc9L4/fxFCXBhwfPKKB
	cH2BBPANHVQPJGb3DO4klXX3gw4DKh9zxzACLAWLsjx6bBlpgqEEEK6LWJUlPPO20HKe3Ff2TZA
	r02sZ+avZGSEN8e/fFy59n7k/E9nTF5hGr8r+k2jUxEKhY89+CFSqSJ5Jwci7/yHNzBevtxkIWy
	r+GY22ZcvIUhSVB1/+YNFnYACGefIJ9DmUdKPtN6YK+DFvcpvlSOrfQkxqdWbuZRkHATaBWr8mw
	dimW2ZB9UOdMjs2+dUv0Z0maOq2EC7kDMnZ1ymj8TNFQLmn4625JVzZX2ml6wWxoepu3oqoyXG9
	ZrxjhARYJ7Cc95/f0aZ1wGBG8NCZjeuiVYcJ8vBOIdqf2QVmatDZqcgcosv87/v8veP9CFnVs9c
	Xn0XVcdI7QWEv2RefnKtT3/e3j6obFXJhJgmmcjurn+UeUm1t6YPcVMqTI4rPMJ9wbIcmlTzZmd
	jIWcuuCsw==
X-Google-Smtp-Source: AGHT+IG6Mf8qsXvOK1ixMYCQNU/FYpCBumYnKBfjBKtdbVbifmpntuvtxBUSy93dyel1BQ7M/vgfNA==
X-Received: by 2002:a05:7022:eac7:b0:11a:a20a:4413 with SMTP id a92af1059eb24-11c93887b01mr7150c88.31.1763571262673;
        Wed, 19 Nov 2025 08:54:22 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cf0b:c8dd:8f4c:d649])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm61967659c88.5.2025.11.19.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:54:21 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	regressions@lists.linux.dev,
	sean.wang@mediatek.com,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Wed, 19 Nov 2025 08:53:55 -0800
Message-ID: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
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

 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a722446ec73d..1466e0f1865d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
 	int err;
 
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

