Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448B7468
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxMDMd14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699783569; x=1731319569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=guZIojW3h1FI938ribiE72i0mMCrjI52bWuqz4iLNzg=;
  b=lxMDMd148Ast3Sj1qBB2sZ5x372geXv3em3HkxRnbztUN9DKRGCdU+VX
   qrWUDetRClaa7lDNxE2rZIeJ60r4+vapImGzN/RdfcCq+G9a+6Q4SQVI2
   WtSKmCGF+txOHeSRfWVblULJZp9AGLTkZhQY0NBrCH6Mqi64ZCmnFq0g0
   ElaeiOiWDHsiCAnOOvGhwTRO5hXytZtsFyymO3ByFnVkbHfsiV/AQWk8u
   zKOf7Vj7oHilfwdyzHJS4mCoaRJMzpgyIdiLsren+GPBRs2jZXF3qFbPl
   fPEiTm8DbmAJtmbIHUbH+pfB07altk1dhUx2WR8GMImXKEUlb1rUdG60C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3345655"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="3345655"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 02:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="834482050"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="834482050"
Received: from egrumbac-mobl1.ger.corp.intel.com (HELO egrumbac-mobl1.lan) ([10.255.198.134])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 02:06:05 -0800
From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	Anjaneyulu,
	Pagadala Yesu <pagadala.yesu.anjaneyulu@intel.com>,
	Greenman,
	Gregory <gregory.greenman@intel.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH v2] wifi: iwlwifi: fix system commands group ordering
Date: Sun, 12 Nov 2023 12:05:58 +0200
Message-ID: <20231112100558.20826-1-emmanuel.grumbach@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
References: <20231112095943.19353-1-emmanuel.grumbach@intel.com>
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
Change-Id: I18f7b57c7c565537e3d97f8c7ff83f0cc8e4709c
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
---
v2: remove ChangeId
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

