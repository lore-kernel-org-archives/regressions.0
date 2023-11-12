Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BF6FCE
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAsOz9cY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699783195; x=1731319195;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BMfR+xMy33jsc8DrNjnelvskKSad3bMdkrfuZZdnBoI=;
  b=lAsOz9cYu3Bic9mTZ8x61gihCh85Ag2JIdN0U9xY3ObtYxzmjKmPcPHz
   e95r5zv/2dTBUAuIQqc2Cb1do0KalSgk4lvrtPZpMzSqatKIYOaaIphZ7
   MO3O8pqv/edA7Laa9hLs7/y/IFhd1zmDKPjZ5dF7KXdpZDW7rX1jPqM/A
   fOo9G9FnwG+kn27ZyuIcfkL/tfV+JEOFWLBRZqvpNR90PXp2xZryOKsER
   /wAxvzCd+bVPkwxyfziHwmSMJEm6lNcChRn1f8XAIC66KpjX0wN4Xzbzk
   lHG29gdo/BHPdBxCOiB59DAUWdY5e6yRj9tFO00h4yCY4cgrAYU1HkkTX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="456816425"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="456816425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 01:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="830002729"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="830002729"
Received: from egrumbac-mobl1.ger.corp.intel.com (HELO egrumbac-mobl1.lan) ([10.255.198.134])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 01:59:52 -0800
From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH] wifi: iwlwifi: fix system commands group ordering
Date: Sun, 12 Nov 2023 11:59:43 +0200
Message-ID: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Miri Korenblit <miriam.rachel.korenblit@intel.com>

The commands should be sorted inside the group definition.
Fix the ordering so we won't get following warning:
WARN_ON(iwl_cmd_groups_verify_sorted(trans_cfg))

Fixes: b6e3d1ba4fcf ("wifi: iwlwifi: mvm: implement new firmware API for statistics")
Change-Id: I0112bd7da4559a8e69e84cd8f55ba8e6fe8252cb
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
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

