Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF3387
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 14:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihDbnv+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699799798; x=1731335798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dN+HYs9Jz972l1dYiObo3VtC0jUjqPql+zQFKw3tAJM=;
  b=ihDbnv+aicMgA7ic35z/7vBPRjmGYqb+5LR+iUsjYDtViwJCNYDFZtns
   VNYFqB7UFV7Gweb+2QY+0guqEJDvI5mIMA+L0hhOi3GbL0bzMQjtTlEtN
   /i1IwTpTpovPwwnU+s0ZvbD1rWSRuFrzNwUXcNgUxO+Dc5rwGOCJXrjBz
   IPJTRzS2TxMWoMdAZ1LFU9NrfcTj5r4qKS4NM0H1hvh8pJz8fnsAsLRt7
   gOA1Q2LIjEv0kJa2eOiojOWgDChyAz157AY70xu2hZxGgLz4aiI93J8Zd
   FHTeenFVYUQfRG3Fni21QPg+IanpUZ71oLIZX0VAuupwtqjkVQoS330K4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="421430982"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="421430982"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 06:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="887733051"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="887733051"
Received: from miryamfx-mobl1.ger.corp.intel.com (HELO egrumbac-mobl1.lan) ([10.254.153.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 06:36:31 -0800
From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	pagadala.yesu.anjaneyulu@intel.com,
	gregory.greenman@intel.com,
	Linux Regressions <regressions@lists.linux.dev>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	=?UTF-8?q?Nikl=C4=81vs=20Ko=C4=BCes=C5=86ikovs?= <pinkflames.linux@gmail.com>,
	Damian Tometzki <damian@riscv-rocks.de>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH v4] wifi: iwlwifi: fix system commands group ordering
Date: Sun, 12 Nov 2023 16:36:20 +0200
Message-ID: <20231112143620.36619-1-emmanuel.grumbach@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Miri Korenblit <miriam.rachel.korenblit@intel.com>

The commands should be sorted inside the group definition.
Fix the ordering so we won't get following warning:
WARN_ON(iwl_cmd_groups_verify_sorted(trans_cfg))

Link: https://lore.kernel.org/regressions/2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com/
Link: https://lore.kernel.org/linux-wireless/CAHk-=wix6kqQ5vHZXjOPpZBfM7mMm9bBZxi2Jh7XnaKCqVf94w@mail.gmail.com/
Fixes: b6e3d1ba4fcf ("wifi: iwlwifi: mvm: implement new firmware API for statistics")
Tested-by: Niklāvs Koļesņikovs <pinkflames.linux@gmail.com>
Tested-by: Damian Tometzki <damian@riscv-rocks.de>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
---
v3: remove ChangeId
v4: add the required tested-by and link tags
---
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
index fef86a8b4163..1627b2f819db 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
@@ -550,9 +550,9 @@ static const struct iwl_hcmd_names iwl_mvm_system_names[] = {
 	HCMD_NAME(RFI_CONFIG_CMD),
 	HCMD_NAME(RFI_GET_FREQ_TABLE_CMD),
 	HCMD_NAME(SYSTEM_FEATURES_CONTROL_CMD),
-	HCMD_NAME(RFI_DEACTIVATE_NOTIF),
 	HCMD_NAME(SYSTEM_STATISTICS_CMD),
 	HCMD_NAME(SYSTEM_STATISTICS_END_NOTIF),
+	HCMD_NAME(RFI_DEACTIVATE_NOTIF),
 };
 
 /* Please keep this array *SORTED* by hex value.
-- 
2.41.0

