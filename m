Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578313AFD02
	for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407958; cv=none; b=LDxAQ0lf90Z9++lGIIzxOdHYO6Omx7Jo8te/SuV9u82Z6NzCWO+m1lvUjx2BhsUW6AuINWxMM+6GOIDY+ZjBqniuSlhb29p/gu9emdXerqnNqBTFALzvrcu8+4BQyI6RwxC+8KnBb5DpQL67+U4Pxrf1kLMR7fLpjGWNBs2mimE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407958; c=relaxed/simple;
	bh=u2led2iM95H40jffR0sjXQKAm5+lVuIahsaSzLeQ8Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IklRpAJd5N4LDGK2YqRHFvnbLdrTi34n0Akcudj3b2Z5MD0Kp/x/xzgeoudQJ7+FPlnAPefAU9Yh2uMjjsOnu/wcBHKRu4KV+TMllyHdowtTd8WAoqi85jvPV2M9oePnM5plDqpdDoCnyIZF6rO2HjsG9UO4U0cINbWFoVQh6Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO5jNDyc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO5jNDyc"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2055573c8cso291436866b.3
        for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407954; x=1788012754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AACxzMxh8D3+74R+fCgOyXG6KrSSQBlsUGYlirSS7iA=;
        b=cO5jNDycLeo03r7Uu5TwjGPBjm/OzKW5afJEdYeOck3mR1jme43UIC5Rp2mmMLh7V+
         J5z8txJGCjvu97PY1NSpozd78nN1xyJs7vwloaqPtq/XCbA2+s1pw5/edEmqZvM62p7v
         9D397fuarye4I9X8T4Bp5Cp+OOiqkw4DHnn8C0jgrbN8N+zwdO6y1seeNb64Ku0DKbr4
         LqMZITKuxplE+kfrQQCtkEEMxWSwGvzWM7cnu4u7wtPjd/GQrOuAa0ZI7SWWDH4tuaqR
         PMzo1BTGzLjzvWcltlJHA57O4yH2NrNjxqtHs/3dLkXXVMzUocUl0okAPyGv7v3B6iyI
         99Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407954; x=1788012754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AACxzMxh8D3+74R+fCgOyXG6KrSSQBlsUGYlirSS7iA=;
        b=BGAzJRkiHAdwlibN6DqOfWGe7IL6OmGDZUZBHG/6ookAoFVL6W8TJhe/FGROg1qE/i
         b/hYdb51lwp9nVgen8pVyFtGxKyi619zFs4WCONiRSsZnNW+BQvLFNFi+Zol8oO4Ol9Z
         fGnRl/2kd/SF3iQ5ULzRjKwqh2BHak1SCFlMWPt1xi8hCmGmpKG8zEnBCuWrSSQMEX/A
         shIKdTcBEwnpoaAmdQm1wMSz/jG81sCVMvPxGMy3yveDj3wRhKA/wv8i0sgfujRkxInF
         s7vcJjz5kuaOAbdzKSWxX91qlF0OUjqmsrS6luBRvGcic7R0fW/k0fNH+jLxUo5ltEky
         8t+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr4yWEpmAftUkC1Eq8zbDUlvHwwyizUsmcNVIPGEMxdlQCVcFIBRMYmlsWhsNzzSvu9f1Sq+P0UAfMF3w==@lists.linux.dev
X-Gm-Message-State: AFuF++lG3T7Gwi5YgMlXfl+ea6HmmR80/ZwQDP26PRl6gwsb/6oMc0oC
	TlSxlzXhiAzmMz6fjSvFGNsBcXMKbvhkaY1MyspzsyyaHm7jj9GS+8uu
X-Gm-Gg: AR+sD133ZN8tOPx/dCfmMxPrYioT6b1gPIDAAhOsRkz9sJhz+aqxMs30s0lxmnXXHfT
	iBVEoYiaVH6LLhGtW9eP60wzKOnM/JQdAyVksfLyu8P6A4zVZWpW+5Oaa3z5saZfhcMSC2jZHyh
	IraMtLH6FtPXUdoPqoogINI1zpYn9bdZnylHFstt6idC/8zF5dEagyM9bhwGnobV6M/NB0JIlQK
	qkUrfNO4C0Q9nQe8m91f7axswXy2uHMkhaAVFbsG+egZ3/k9+mhWvRFsvZFcVqQ7x6dhmquNBZe
	onaSNvBHNhINBr1ltthqJN7MDOyKuLjyGks/x7KoGN34/hJwepVHIt+avvkokpfMZlO+AEftO2R
	DH6Y6krmQ02oPDfRTODMt/Elgm9oMc14b5QQCQ3/NC7oVm+wumabHbWZlxmXwk9ov0rs6NOf9Ww
	q3uhULHbEXEkNuw+o6soU989DicwIVTzPIPatzeU20he4fknwNDS/Olzx3oA54HxGrKhpc3lOtF
	GL+MADwTcpq+RMMf6YP/XLrw5x705nUbcFC39XW1/HAh48sy8+yCa7ARFh+nbKrEsXpGM2NeKUK
	pGAxwzI=
X-Received: by 2002:a17:907:3fa0:b0:c16:16b9:98fa with SMTP id a640c23a62f3a-c249257b3abmr609543266b.5.1787407954349;
        Sat, 22 Aug 2026 07:12:34 -0700 (PDT)
Received: from bobo (d163-170.icpnet.pl. [109.173.163.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm340625266b.43.2026.08.22.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 07:12:34 -0700 (PDT)
From: Kamil Serwus <kserwus@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Alexej Sidorenko <alexej@sidorenko.cz>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Serwus <kserwus@gmail.com>
Subject: [RFC PATCH 1/2] Bluetooth: hci_sync: latch broken ext scan on Command Disallowed
Date: Sat, 22 Aug 2026 16:11:14 +0200
Message-ID: <20260822141115.58815-2-kserwus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822141115.58815-1-kserwus@gmail.com>
References: <20260822141115.58815-1-kserwus@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HCI_QUIRK_BROKEN_EXT_SCAN exists for controllers that "erroneously claim
to support extended scanning". Today every user of it has to be
recognised up front - by chip id or USB id - which means a controller is
only handled once somebody has owned one, hit the bug and sent a patch.

Recognising them by behaviour instead is both simpler and complete: a
controller that advertises the extended scan commands in its supported
commands bitmap but answers Command Disallowed is exactly the class of
device the quirk describes, and it says so itself on the first attempt.

Latch the quirk there, so every later scan uses the legacy commands.
The cost for an affected controller is one rejected scan round per power
cycle instead of a permanent stream of failures; for everyone else
nothing changes.

Signed-off-by: Kamil Serwus <kserwus@gmail.com>
---
 include/net/bluetooth/hci.h |  4 ++--
 net/bluetooth/hci_sync.c    | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 50f0eef71..5cee010f2 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -276,8 +276,8 @@ enum {
 	 * disabled. This is required for some Broadcom controllers which
 	 * erroneously claim to support extended scanning.
 	 *
-	 * This quirk can be set before hci_register_dev is called or
-	 * during the hdev->setup vendor callback.
+	 * This quirk can be set before hci_register_dev is called, during the
+	 * hdev->setup vendor callback, or at runtime on Command Disallowed.
 	 */
 	HCI_QUIRK_BROKEN_EXT_SCAN,
 
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index c8d14128c..eb711f454 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -2265,6 +2265,7 @@ static int hci_le_set_ext_scan_enable_sync(struct hci_dev *hdev, u8 val,
 					   u8 filter_dup)
 {
 	struct hci_cp_le_set_ext_scan_enable cp;
+	int err;
 
 	memset(&cp, 0, sizeof(cp));
 	cp.enable = val;
@@ -2274,8 +2275,18 @@ static int hci_le_set_ext_scan_enable_sync(struct hci_dev *hdev, u8 val,
 	else
 		cp.filter_dup = filter_dup;
 
-	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EXT_SCAN_ENABLE,
-				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EXT_SCAN_ENABLE,
+				    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+
+	/* The controller claims extended scan support but rejects it. Latch
+	 * the quirk so that every later scan uses the legacy commands.
+	 */
+	if (err == -EBUSY) {
+		bt_dev_warn(hdev, "extended scan rejected, using legacy scan");
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
+	}
+
+	return err;
 }
 
 static int hci_le_set_scan_enable_sync(struct hci_dev *hdev, u8 val,
-- 
2.55.0

