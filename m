Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1F382F28
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844817; cv=none; b=QJtWCuJ0KuG5ogLuAwDI5Q8rW1EBKt53nb9qnZkIXDFMn0SpRZ29/TRueyYLE8LkxLFpMMaffa6O2kLysUovakYBFThVKoHof6tr38qG7VS0QaGqM+/pxvS/q8k7s1B7cpsESkENIam96utc0e9kpJnr/d8jek7gjl5qm8GFLB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844817; c=relaxed/simple;
	bh=FeySs9Jin21k5s/cqffYgru6EWdPWvaF785+FzNA150=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuT+hlKG4ClsjXoBRdAK2eoilnbaLkzlc1nFFUCUg4mqombJ2LyPXcBt1JDQ+ahwW9cvq4ZHePGTReTcb54qhGjIt+PRy3ZkQUMya6lOitx5hmobp4dHhZqTYomAPzly2T5atG1+E77U5PzEKz3Wl8nhKCdDoS5Xxp0LNluW+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYOOQ0YY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYOOQ0YY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b015b2d792so4341592e87.3
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785844810; x=1786449610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iVO/qwuBSDe5f/5RWdWMNeDvOmjgwposxFzhKBIqG+s=;
        b=sYOOQ0YYkCcTQPi089TNetaxbKHyFbYkCsWAwl5Zjl2Bv9hkiNcjF8zk2mxaCefuq7
         lgr6WcTjOXFueJbD44GEIcUeG36wjvQ45ZMhWSEtEhs+qhK4MBA8W8wlmXpzc23a21ZR
         8RLlef0AMAONAslMR/vTkMvo5h4RlLoWO+2wVBsQ6HhQOgCDZMNvKDz+d4FN70nMpFf0
         sQpQmzfJsgtDA7fK0EKQsMd3PXcymALuDXkSORgFSid9Al0qnBW4QlD4lzPAUvHUWFnE
         HG5tdBAuqE06V1PFxEmDyDSHp3RU2vIZC+EyrcP70B+v+ABGTQgmwRUx1m9WQpgYCC00
         Vhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785844810; x=1786449610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVO/qwuBSDe5f/5RWdWMNeDvOmjgwposxFzhKBIqG+s=;
        b=Wb7CBOnHFIijsj7g9eZURuVlVzaMDcG6EdDvbr9hOhT9G9OccYbOESpC6eqALWLOjJ
         4QCfbIRZsoZ6ZJd4Xu0MK5L+dyO0p2AcaD0GDxFdTx8L0fiFTcaIVn07jKHU7Mi2zpd7
         IcFOh2NNpYMRJonQ7+CI6KeSPEja5zwrKa0ZiofbW6ZpSO/WVzZex6WPMBzY90lVv7y0
         dUGWX2Hnpw1Z67M7p98ZsJyymiIsQ+WzYShWuZw0PJBXM6tGrlslcOEkO4wHMQVL0bKV
         B0kBEvkr4drQs/m/BYocGlUpQVcWh1FaBex1fQXKeRpAIskf4Lqh5CbJsXERPYppsv1D
         BT+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq56KAUrTN1GTF3YXfiJR4TKGFFsT7B7kbxGBSCAbcoiHgQYMjvYqtlX8ZLj2WgV/Uc/HoqFzbDTQWfLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa0/Rpoh50ziytGqWIk60alRYxxwPOlWuj7vwamSIbgjrR2B6e
	psVEstA8pBMfI8rM+U81523zRVgJ9zDdOlrGK10InYf/KjHDXnSiYUc1
X-Gm-Gg: AR+sD11i/QOTPXAxY6oWJlDN75NuXkzCXWI7JeFyIbDAGW50yWSWZTxkTH9zZwWR+bo
	Kt3OSxAT9im87+oREtzaIAZNer03G0TEEqRSXeSdWlo2Cv+i8LpbZijy+IPI2JLivjJ80E7H/Rt
	cxUH+3g5Sj9wniXlSoVMzjw0pwu6+7phMfFIhwUPznA1wsxdjjJZRTHjsxx2Z16GFDOmM5mV4Y5
	hanUcy2OgFRwvsYfwFCpzYUYQZhHmoWzpGI2KueuZMJwu/92RfGyNBy14Ob2Mo3m4x8mVg8vpXI
	R+GBfHSLI68O/a6HSADGopBJchVIjpHEL69T9aVTT1QRyC2ohMlcWcE31xKyvuo/5xIUtEynYaX
	s+fheh4H+pir3XSF8nfDb1g8aB2ZUk0tkGM/Isv5sOebszEmMZse5MLOcX3tNDHHw8PXjHDO65z
	FJ2b2WyCsXIC4gq/SP4r8nd6RIHGXWpOaM8f8K+54lHIvEe63X0+qPcBlrglBQuEHSrgZq/58=
X-Received: by 2002:a05:6512:138e:b0:5b0:1dd0:f238 with SMTP id 2adb3069b0e04-5b2e4f1b067mr3121001e87.2.1785844808457;
        Tue, 04 Aug 2026 05:00:08 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441e66sm2620717e87.48.2026.08.04.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:00:07 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Bert Karwatzki <spasswolf@web.de>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Eric Biggers <ebiggers@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH wireless] Revert "wifi: mt76: Disable napi when removing device"
Date: Tue,  4 Aug 2026 17:00:04 +0500
Message-ID: <20260804120004.523934-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 13b7e6a96a005c656d38f3da51581deaf9866375.

That commit made mt76_dma_cleanup() disable every RX NAPI instance before
deleting it, to silence WARNs in __netif_napi_del_locked() and
page_pool_disable_direct_recycling() seen when unloading mt7915e with an
MT7916.

On mt7921e and mt7925e the same instances are already disabled earlier,
in mt7921e_unregister_device() and mt7925e_unregister_device(), which
only afterwards call mt792x_dma_cleanup() -> mt76_dma_cleanup().  Each
instance is therefore disabled twice, and napi_disable() is not
idempotent: on return it leaves NAPIF_STATE_SCHED and NAPIF_STATE_NPSVC
set, so the second call spins in usleep_range() forever, waiting for bits
that nobody will clear.

mt7921_pci_shutdown() and mt7925_pci_shutdown() reuse the remove path, so
this is hit on every reboot, poweroff and module unload.  It is silent:
the stuck task keeps sleeping and rescheduling, so neither the hung task
detector nor the lockup detectors fire, and the last line on the console
is "systemd-shutdown[1]: Rebooting."

  task:modprobe        state:D stack:25720 pid:7954  tgid:7954
  Call Trace:
   <TASK>
   __schedule+0x11b8/0x26d0
   schedule+0xe7/0x2f0
   schedule_hrtimeout_range_clock+0x218/0x330
   usleep_range_state+0x133/0x1b0
   napi_disable_locked+0x37d/0x5f0
   napi_disable+0x43/0x80
   mt76_dma_cleanup+0x2b4/0x860 [mt76]
   mt7921_pci_remove+0x17f/0x350 [mt7921e]
   pci_device_remove+0xb6/0x1e0
   device_release_driver_internal+0x38d/0x540
   driver_detach+0xd0/0x1b0
   bus_remove_driver+0x127/0x2d0
   pci_unregister_driver+0x2a/0x280
   __do_sys_delete_module+0x36a/0x5b0
   do_syscall_64+0x11c/0x6d0
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

Dropping the two driver-side loops instead was tried and rejected: with
them gone, the RX poll can reach mt76_token_release() via
PKT_TYPE_TXRX_NOTIFY and mt7921_mac_tx_free() while
mt76_connac2_tx_token_put() is running idr_destroy(&dev->token) outside
token_lock, which is a use-after-free rather than a hang [1].

Revert for now, so that reboot, poweroff and module unload work again.
The WARNs on mt7915e are a less severe problem than an unbootable
machine, and fixing them belongs in the drivers that delete the NAPI
instances, where each one can pick a point that is safe for its own
teardown order, rather than in the shared mt76_dma_cleanup().

Reported-by: Bert Karwatzki <spasswolf@web.de>
Closes: https://lore.kernel.org/all/20260724151419.26014-1-spasswolf@web.de/
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221818
Link: https://lore.kernel.org/all/20260730050428.GA73812@sol/ [1]
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

Sending this because the regression is now in its second week with four
independent reporters, and the two-part alternative (this revert plus
napi_disable() added inside mt7915_unregister_device()) needs MT7916
hardware that I do not have.  I deliberately left the mt7915 side out;
Nicolas is best placed to do it, since MT7916 is what he reported
against.
 
Verified on 7.2.0-rc5 with KASAN and lockdep enabled, MT7922 / mt7921e:
before the revert 'modprobe -r mt7921e' hangs (backtrace above, taken
with sysrq-w) and the machine never gets past "Rebooting."; after it,
module unload and reload, reboot and poweroff all work again.
 
The hang was independently bisected to the same commit by Bert Karwatzki
on MT7925 and reproduced by Devin Wittmayer on MT7927 and MT7922, and
Eric Biggers saw it on mt7925e as well.

 drivers/net/wireless/mediatek/mt76/dma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 322041859217..f8c2fe5f2f58 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1189,10 +1189,7 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q = &dev->q_rx[i];
 
-		if (!mt76_queue_is_wed_rro(q)) {
-			napi_disable(&dev->napi[i]);
-			netif_napi_del(&dev->napi[i]);
-		}
+		netif_napi_del(&dev->napi[i]);
 		mt76_dma_rx_cleanup(dev, q);
 
 		page_pool_destroy(q->page_pool);
-- 
2.55.0

