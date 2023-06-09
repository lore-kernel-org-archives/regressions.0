Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89B408E0
	for <regressions@lists.linux.dev>; Fri,  9 Jun 2023 21:29:50 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bb2ffa1e235so2064570276.0
        for <regressions@lists.linux.dev>; Fri, 09 Jun 2023 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686346189; x=1688938189;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQDHQv5QQ7F49jvnNaX5O624EPUVQF/yKUfjfHQuFnc=;
        b=LePNwit0ABp1ENxorce8Sa7Bd4LjKtNLwa/pG6o1QxykmRLbH0P/yLOw/MmeYRuxBU
         q6Jrud4gYRsmAksqaqXcQmg5APEXk5xOkWEcVkUt+7+I+m9sjJ/lfi3LTs2oaDj9qGtq
         FqAAM5W7r38V/bKGdhcIRGRwyQYNBQJrUKdVY+GeNDUQUcUrQqxa+0OHKBldHawIOPw7
         5UVSaZlkQwYT5bOtcT9zG3ykVFoXtoJMwxzBJABVSh98ICXyKXC30TEVoan1/9xKPduX
         MeEUqzMSUINxKI7NBNQ1qRWak6K2y3wGJJpJOugPT1YrBnuhxTy/dMD/BQ0o3MPkCm45
         NNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686346189; x=1688938189;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQDHQv5QQ7F49jvnNaX5O624EPUVQF/yKUfjfHQuFnc=;
        b=DDnYyhP9j8LZxgeYYCU+I5oM5ei/eQQ45irIqYOPLl/bxcK8d7d4miiwdsttphfxui
         fdYwE/5YUGi/JalhIbx4iV1Q+499CN6byZEAjkwlWc+XjuQafP8SvtU8bPNfr0POsz36
         L2lAxqyb9SUtnXzhoiHaWr1xS4tU/Jb3wqmqLFDS1lm12OQQPA+lLYJo21tvMit/pEpm
         iI3sME6OO3Ef73IYQDoMQ5WCmt3x2tO35spELIXDOZQuQsFNMO7GBchx7VJY7LdwctiV
         Ng2lhSGAlHxDVHLd5SgX+8J1zov6zTJbzDbTL5IuDVK8nRZSXllutknVgEgMncomSHpp
         xhZw==
X-Gm-Message-State: AC+VfDyBUscsv/XlQRAROqNR3h1l5Ivd6A1hT/825cOmpMgqfkpvf1YK
	Qi6XUbgTAXFicOBLAANhNWC08Q==
X-Google-Smtp-Source: ACHHUZ6zVT6zy2xPQU6h6zNxSgG3a9+hAx3/LLoy1GtDkJTTgoju5XlmXUOBA28ACU3lez+R9dzHTA==
X-Received: by 2002:a25:c78b:0:b0:ba8:f70:1eb9 with SMTP id w133-20020a25c78b000000b00ba80f701eb9mr2046657ybe.57.1686346189501;
        Fri, 09 Jun 2023 14:29:49 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id f6-20020a5b0d46000000b00bc41075297fsm7249ybr.23.2023.06.09.14.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 14:29:49 -0700 (PDT)
Date: Fri, 9 Jun 2023 14:29:39 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gregory Greenman <gregory.greenman@intel.com>
cc: Ariel Malamud <ariel.malamud@intel.com>, 
    Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, 
    linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [PATCH] wifi: iwlwifi: mvm: spin_lock_bh() to fix lockdep
 regression
Message-ID: <79ffcc22-9775-cb6d-3ffd-1a517c40beef@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Lockdep on 6.4-rc on ThinkPad X1 Carbon 5th says
=====================================================
WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
6.4.0-rc5 #1 Not tainted
-----------------------------------------------------
kworker/3:1/49 [HC0[0]:SC0[4]:HE1:SE0] is trying to acquire:
ffff8881066fa368 (&mvm_sta->deflink.lq_sta.rs_drv.pers.lock){+.+.}-{2:2}, at: rs_drv_get_rate+0x46/0xe7

and this task is already holding:
ffff8881066f80a8 (&sta->rate_ctrl_lock){+.-.}-{2:2}, at: rate_control_get_rate+0xbd/0x126
which would create a new lock dependency:
 (&sta->rate_ctrl_lock){+.-.}-{2:2} -> (&mvm_sta->deflink.lq_sta.rs_drv.pers.lock){+.+.}-{2:2}

but this new dependency connects a SOFTIRQ-irq-safe lock:
 (&sta->rate_ctrl_lock){+.-.}-{2:2}
etc. etc. etc.

Changing the spin_lock() in rs_drv_get_rate() to spin_lock_bh() was not
enough to pacify lockdep, but changing them all on pers.lock has worked.

Fixes: a8938bc881d2 ("wifi: iwlwifi: mvm: Add locking to the rate read flow")
Signed-off-by: Hugh Dickins <hughd@google.com>
---

 drivers/net/wireless/intel/iwlwifi/mvm/rs.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- 6.4-rc5/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
+++ linux/drivers/net/wireless/intel/iwlwifi/mvm/rs.c
@@ -2692,7 +2692,7 @@ static void rs_drv_get_rate(void *mvm_r,
 
 	lq_sta = mvm_sta;
 
-	spin_lock(&lq_sta->pers.lock);
+	spin_lock_bh(&lq_sta->pers.lock);
 	iwl_mvm_hwrate_to_tx_rate_v1(lq_sta->last_rate_n_flags,
 				     info->band, &info->control.rates[0]);
 	info->control.rates[0].count = 1;
@@ -2707,7 +2707,7 @@ static void rs_drv_get_rate(void *mvm_r,
 		iwl_mvm_hwrate_to_tx_rate_v1(last_ucode_rate, info->band,
 					     &txrc->reported_rate);
 	}
-	spin_unlock(&lq_sta->pers.lock);
+	spin_unlock_bh(&lq_sta->pers.lock);
 }
 
 static void *rs_drv_alloc_sta(void *mvm_rate, struct ieee80211_sta *sta,
@@ -3264,11 +3264,11 @@ void iwl_mvm_rs_tx_status(struct iwl_mvm
 	/* If it's locked we are in middle of init flow
 	 * just wait for next tx status to update the lq_sta data
 	 */
-	if (!spin_trylock(&mvmsta->deflink.lq_sta.rs_drv.pers.lock))
+	if (!spin_trylock_bh(&mvmsta->deflink.lq_sta.rs_drv.pers.lock))
 		return;
 
 	__iwl_mvm_rs_tx_status(mvm, sta, tid, info, ndp);
-	spin_unlock(&mvmsta->deflink.lq_sta.rs_drv.pers.lock);
+	spin_unlock_bh(&mvmsta->deflink.lq_sta.rs_drv.pers.lock);
 }
 
 #ifdef CONFIG_MAC80211_DEBUGFS
@@ -4117,9 +4117,9 @@ void iwl_mvm_rs_rate_init(struct iwl_mvm
 	} else {
 		struct iwl_mvm_sta *mvmsta = iwl_mvm_sta_from_mac80211(sta);
 
-		spin_lock(&mvmsta->deflink.lq_sta.rs_drv.pers.lock);
+		spin_lock_bh(&mvmsta->deflink.lq_sta.rs_drv.pers.lock);
 		rs_drv_rate_init(mvm, sta, band);
-		spin_unlock(&mvmsta->deflink.lq_sta.rs_drv.pers.lock);
+		spin_unlock_bh(&mvmsta->deflink.lq_sta.rs_drv.pers.lock);
 	}
 }
 
