Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D83A75BB
	for <regressions@lists.linux.dev>; Sat, 15 Aug 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786789698; cv=none; b=KwMWO2oe/+FHip8NbNR+zfeq7MHGZbCFlGe8ByStvzbkuwRfrqZEYtzkrPlG41CW5BMgyyTIENwDQC9W6+U84buSxRk9YBM6A3fz78lmFOYNnMiEWM91vltECrXnz3NHMfaD7Z81cudCq0ZnLmCj8gIWD8Sya8Pb1NkmdQG3JGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786789698; c=relaxed/simple;
	bh=eG9vOCi6dz2LS9h7tb35pxRgJtlauzumDhyiULGGUUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ieAiYswofu3gJENlBc1PJgzmc59JfLNWFOVTvLeI6NwqRoS43mZBZ2DQJl/TSk7hHCjiE/XImG78h3Ogc+F3vTXb1AWrR2Yszvz1Xptc0+bF4YFXX/Zbvehh1LlHHsO8ZKGmVwhVBg+9bFoNCRDoAuRQRtI9vgfuLnLWXi72zYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6msTT8I; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6msTT8I"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so13615301fa.0
        for <regressions@lists.linux.dev>; Sat, 15 Aug 2026 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786789693; x=1787394493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PT2DE6cl5YPBMy2m9I9NSThkbJzai5L9OY2FPvGH160=;
        b=I6msTT8IS5pwaZ/v7u5qoB86PKEaCXMq+mg9AEdODA0KxT8M3SuEfbwzTLyjB5lReB
         qCvA4fipct+NJ9r+ns6+P37qI4gWJHi23uvLpAk+R/+yuvnnBqgVN2j03ctYy9Y/nS21
         Y1N6LzhWaWknMbVDgM6+TQKMeg0HV9v0JmRybqaSIVoQoAr5NzaDJgTKIGf3FywW9xL1
         zWcF9IGB4Y3AercouJYvAhHKLbWnBjPIBZ4vcCcc762UT5K3sMD9vxKgaJ4POheWy0FA
         NZDqTUOvIGulRfxpsA1GAn1qV/SDU/GxcUGcYqznjvOSWW1jhrTRl9Cm53OBmwQgbRFJ
         S42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786789693; x=1787394493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PT2DE6cl5YPBMy2m9I9NSThkbJzai5L9OY2FPvGH160=;
        b=L7qJuhXJ4MVwwjuxUxYXb6u3PH5B3pF+HAYaALorFV1e2Ct5ZEN/B9vIlGWhoeUbSo
         8qXcEEBWHxw4Wlwg1y97CPyjJgM6VDcrkMZ/96EixiLw+l8HkCuT8O3L2uo3PmaVCe78
         ORtsr+v2U1HLaEFZc9V2vQCqbJ+lCMw6SQ7BMMeFqwnmW5jlIowcqxVsanFQyN6zXTed
         /0NfkTMWXIiL3F6PhCo9Bh1DvdR0DRMQFVJsdaobeRfIwTF9nE8zjuOcUUwd/udZ3Dc8
         EFixQAfXTfQPjbgTvONlNphmw5F4/vXWSk+uu+I8Q/uLrAfkKBu/KD0uig70tTVlB3Kq
         M+Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrVVIf1FA6Vqqm+guS5p47IK9ue8h6G1LBRL+SXh+tw6eRHZC6X/NNudscOZLbhg2jfnXGYNHt3v6+nIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFYOFpfTm7mjmDS1ilhoCRvIWJk9wvE/VwljyOSMJzQ3xvC76N
	JzrYL62Ox/7JOPtcNeH0i+deB9S0FxAM472BNInFGPhl/d8TqllgXUtL
X-Gm-Gg: AR+sD11nK4jKkyqAbNUiMHAkjrk/mo/JwXc4HKPmv4g7IsAa1h8UmQ+ilpJCmbPW/mm
	xxzBXp/ynFaiN8JS4mZoxgiapx4qi+Z7WXhhUZkCXTuqh1HtZqsG7V6o9d+WKDNbNDbGJOPttzz
	oQp4yM9Kwmgx27cxM+vCjH6Ts6UAvYOyjHvrL1zH9b/uFQMofmxZ/vM1nYhMTZ/7c/eds9nGuUM
	MG/6LXyUzIjPIaikHydvzt8R78Td/NvGbNMot0vD6L6VdtlD/BF2qlzQ0tsrrdvCjS3fSWOksDD
	WOONHvoH72QmDhUxYNRzli41F+WoZ92ufwRdE9i8o3OiQKC9kb/yDjXLjMz2NClTgsvjq2cSkpJ
	hfT+80UHQUfYpG/RX4OG9RGxBMFu72FRSSdvyIMYoC1GrQEv1Sp2UH7mFmGxYenGJyU4wvhEhAY
	qDysh1tbZSFLAHA4eJYd5jml+ABWqoVJIE6tk8klqUTPyeq4pYoYpJ851K2cUeptDsfB8o/GhoM
	/9Pc4mFM9gGdvD8VAmjzHgrInJYAE/+5mskSI+05YuNR6vig7BzuC+92+U7
X-Received: by 2002:a05:651c:43cc:10b0:3a1:5c6:b533 with SMTP id 38308e7fff4ca-3a13283bfcemr7273131fa.30.1786789692757;
        Sat, 15 Aug 2026 03:28:12 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1308d1cdcsm10996531fa.18.2026.08.15.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 03:28:12 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: JB Tsai <jb.tsai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7921: fix deadlock on 6 GHz association
Date: Sat, 15 Aug 2026 15:28:06 +0500
Message-ID: <20260815102806.32722-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt7921_mcu_regd_update() acquires &dev->mt76.mutex, but two of its
callers already hold it: mt76_sta_state() takes the mutex and calls into
the driver with it held, on both the add and the remove path.

  mt76_sta_state                          <- takes &dev->mutex
    mt7921_mac_sta_add
      mt7921_regd_set_6ghz_power_type(vif, true)
        mt7921_mcu_regd_update            <- takes &dev->mutex again

  mt76_sta_state                          <- takes &dev->mutex
    mt7921_mac_sta_remove
      mt7921_regd_set_6ghz_power_type(vif, false)
        mt7921_mcu_regd_update            <- takes &dev->mutex again

Both acquisitions are of the same lock instance, so this is a hard
self-deadlock rather than a missing nesting annotation:

  WARNING: possible recursive locking detected
  wpa_supplicant/5319 is trying to acquire lock:
  ffff88879cd94050 (&dev->mutex#3){+.+.}-{4:4}, at: mt7921_mcu_regd_update+0xc0/0x7a0 [mt7921_common]
  but task is already holding lock:
  ffff88879cd94050 (&dev->mutex#3){+.+.}-{4:4}, at: mt76_sta_state+0x2d4/0xb30 [mt76]
  Call Trace:
   <TASK>
   mt7921_mcu_regd_update+0xc0/0x7a0 [mt7921_common]
   mt7921_regd_set_6ghz_power_type+0x25b/0x2e0 [mt7921_common]
   mt7921_mac_sta_add+0x33f/0x480 [mt7921_common]
   mt76_sta_state+0x335/0xb30 [mt76]
   drv_sta_state+0x284/0x740 [mac80211]
   sta_info_insert_finish+0x4dc/0x1070 [mac80211]
   ieee80211_prep_connection+0xaf3/0x1740 [mac80211]
   ieee80211_mgd_auth+0xcba/0x1a00 [mac80211]
   cfg80211_mlme_auth+0x47b/0xab0 [cfg80211]
   nl80211_authenticate+0xa34/0xdf0 [cfg80211]
   </TASK>

The kernel then says it outright:

  INFO: task wpa_supplicant:5319 is blocked on a mutex likely owned by
  task wpa_supplicant:5319.

The damage is not confined to Wi-Fi. wpa_supplicant blocks while holding
wiphy.mtx, NetworkManager then blocks on wiphy.mtx while holding rtnl,
and everything needing rtnl queues up behind it: rtnl_dumpit, ethtool
ioctls, cleanup_net. The machine is left with no working network stack
and needs sysrq to reboot. Since NetworkManager retries the saved
profile on every boot, an affected kernel stops reaching a usable state
at all once a 6 GHz profile exists.

Before commit e88098133ed4
("wifi: mt76: mt7921: refactor regulatory notifier flow") the function
was lock-free by contract and its callers supplied the lock: the sta_add
and sta_remove paths already held it, and mt7921_regd_notifier() took it
explicitly. That commit moved mt792x_mutex_acquire() inside the
function, which is what mt7921_pci_resume() needed - it had been calling
in with no lock at all - but it left the two mac80211 paths taking the
mutex twice.

That those paths run with the mutex held is not incidental: each ends
with a hand-rolled mt76_connac_power_save_sched(), the half of
mt792x_mutex_release() that the core's plain mutex_lock() does not
provide. The lock-free contract was deliberate.

Split the function: keep a lock-free __mt7921_mcu_regd_update() for
callers that already hold the mutex, and a thin locking wrapper for
those that do not. The regulatory notifier and the PCI resume path are
unchanged.

The deadlock is gated on the band. mt7921_regd_set_6ghz_power_type()
only issues the update when

	vif->bss_conf.chanreq.oper.chan->band == NL80211_BAND_6GHZ

so it takes a 6 GHz association to reach it, which is likely why this
survived seven -rc rounds unreported.

Fixes: e88098133ed4 ("wifi: mt76: mt7921: refactor regulatory notifier flow")
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

#regzbot introduced: e88098133ed4

Not addressed here: the "if (!dev->regd_change) goto err" gate combined
with clearing regd_change on exit makes the sta_add/sta_remove call a
no-op in the common case. That call site may want removing rather than
relocking, but that is a behavioural decision for you.

Tested on an MT7922 (mt7921e) on v7.2-rc7 with a lockdep and UBSAN
build: association with a 6 GHz AP completes (channel 37, 6135 MHz,
160 MHz), roaming between a 5 GHz and a 6 GHz BSS exercises both the
sta_add and the sta_remove call site, "iw reg set NL" and back still
reaches the regulatory notifier, and a deep suspend/resume cycle
reconnects to the 6 GHz BSS. dmesg is clean. v7.1 is unaffected.

 .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  | 20 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  2 ++
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3480205d5fb9..68a059504e83 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -802,7 +802,7 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 
 out:
 	if (vif->bss_conf.chanreq.oper.chan->band == NL80211_BAND_6GHZ)
-		mt7921_mcu_regd_update(dev, dev->mt76.alpha2, dev->country_ie_env);
+		__mt7921_mcu_regd_update(dev, dev->mt76.alpha2, dev->country_ie_env);
 }
 
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index c0e2b48a50bf..43193c436ddc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -71,17 +71,18 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 	}
 }
 
-int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
-			   enum environment_cap country_ie_env)
+int __mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			     enum environment_cap country_ie_env)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_hw *hw = mdev->hw;
 	struct wiphy *wiphy = hw->wiphy;
 	int ret = 0;
 
+	lockdep_assert_held(&mdev->mutex);
+
 	dev->regd_in_progress = true;
 
-	mt792x_mutex_acquire(dev);
 	if (!dev->regd_change)
 		goto err;
 
@@ -100,13 +101,24 @@ int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 		goto err;
 
 err:
-	mt792x_mutex_release(dev);
 	dev->regd_change = false;
 	dev->regd_in_progress = false;
 	wake_up(&dev->wait);
 
 	return ret;
 }
+
+int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			   enum environment_cap country_ie_env)
+{
+	int ret;
+
+	mt792x_mutex_acquire(dev);
+	ret = __mt7921_mcu_regd_update(dev, alpha2, country_ie_env);
+	mt792x_mutex_release(dev);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(mt7921_mcu_regd_update);
 
 void mt7921_regd_notifier(struct wiphy *wiphy,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index 571f31629e9e..2ea12d3861fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -8,6 +8,8 @@ struct mt792x_dev;
 struct wiphy;
 struct regulatory_request;
 
+int __mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			     enum environment_cap country_ie_env);
 int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
 			   enum environment_cap country_ie_env);
 void mt7921_regd_notifier(struct wiphy *wiphy,
-- 
2.55.0

