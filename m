Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A112C80
	for <regressions@lists.linux.dev>; Sat, 11 Dec 2021 00:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639183293; x=1670719293;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=j+pEU2PK/unlZK6R1gJ5fO9x4s2w4KWtjX5taAKJMtY=;
  b=lKCo1pUhq4wDUu4C/fduqTzhRIdX/Wgrj7S0pj8cwE8JQLqojE6gsgUn
   mR1aVj8wX+/Upy2jBNUp4xV4bcbg/AG3sWlE0tL1neIRPxutnvS/cVxxr
   kmsZaJpfa92OxjwODsGUwvdevTO5jTOiVepYhC0JcFkqTc1dD2zyMXRuN
   CY+NgZ9GtgNEU0QFJIR/kMtVJ8nx+rnCjxsknDlsWs6Nglaad8ak1zva4
   M4OHg3+pD8iamqQYgKQjI668c+90xqYUzcvbAxK+nbwL5Vj292RU5vwVO
   uIqp0W/VdXqz3z87//6+FUPRgKeiReyuJIwP94XUAc1hQH9e60e0jKFIu
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="225764218"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208,223";a="225764218"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 16:41:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; 
   d="scan'208,223";a="504160187"
Received: from mmcarty-mobl.amr.corp.intel.com (HELO vcostago-mobl3) ([10.209.82.172])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 16:41:33 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Stefan Dietrich <roots@gmx.de>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Cc: kuba@kernel.org, greg@kroah.com, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, regressions@lists.linux.dev
Subject: Re: [PATCH] igc: Avoid possible deadlock during suspend/resume
In-Reply-To: <d4c9bb101aa79c5acaaa6dd7b42159fb0c91a341.camel@gmx.de>
References: <87r1awtdx3.fsf@intel.com>
 <20211201185731.236130-1-vinicius.gomes@intel.com>
 <5a4b31d43d9bf32e518188f3ef84c433df3a18b1.camel@gmx.de>
 <87o85yljpu.fsf@intel.com>
 <063995d8-acf3-9f33-5667-f284233c94b4@leemhuis.info>
 <8e59b7d6b5d4674d5843bb45dde89e9881d0c741.camel@gmx.de>
 <5c5b606a-4694-be1b-0d4b-80aad1999bd9@leemhuis.info>
 <d4c9bb101aa79c5acaaa6dd7b42159fb0c91a341.camel@gmx.de>
Date: Fri, 10 Dec 2021 16:41:32 -0800
Message-ID: <87h7bgrn0j.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Hi Stefan,

Stefan Dietrich <roots@gmx.de> writes:

> Agreed and thanks for the pointers; please see the log files and
> .config attached as requested.
>

Thanks for the logs.

Very interesting that the initialization of the device is fine, so it's
something that happens later.

Can you test the attached patch?

If the patch works, I would also be interested if you notice any loss of
functionality with your NIC. (I wouldn't think so, as far as I know,
i225-V models have PTM support but don't have any PTP support).

>
> Cheers,
> Stefan
>
>
> On Fri, 2021-12-10 at 15:01 +0100, Thorsten Leemhuis wrote:
>> On 10.12.21 14:45, Stefan Dietrich wrote:
>> > thanks for keeping an eye on the issue. I've sent the files in
>> > private
>> > because I did not want to spam the mailing lists with them. Please
>> > let
>> > me know if this is the correct procedure.
>>

Cheers,
-- 
Vinicius


--=-=-=
Content-Type: text/x-patch
Content-Disposition: attachment;
 filename=0001-igc-Do-not-enable-crosstimestamping-for-i225-V-model.patch
Content-Description: test patch for deadlock in igc

From bc78a215cd3a68375ec62a05080070876e31d733 Mon Sep 17 00:00:00 2001
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Date: Fri, 10 Dec 2021 16:23:42 -0800
Subject: [TEST ONLY] igc: Do not enable crosstimestamping for i225-V models

WIP WIP WIP

Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_ptp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_ptp.c b/drivers/net/ethernet/intel/igc/igc_ptp.c
index 30568e3544cd..b525035a8a2b 100644
--- a/drivers/net/ethernet/intel/igc/igc_ptp.c
+++ b/drivers/net/ethernet/intel/igc/igc_ptp.c
@@ -768,7 +768,13 @@ int igc_ptp_get_ts_config(struct net_device *netdev, struct ifreq *ifr)
  */
 static bool igc_is_crosststamp_supported(struct igc_adapter *adapter)
 {
-	return IS_ENABLED(CONFIG_X86_TSC) ? pcie_ptm_enabled(adapter->pdev) : false;
+	if (!IS_ENABLED(CONFIG_X86_TSC))
+		return false;
+
+	if (adapter->pdev->device == IGC_DEV_ID_I225_V)
+		return false;
+
+	return pcie_ptm_enabled(adapter->pdev);
 }
 
 static struct system_counterval_t igc_device_tstamp_to_system(u64 tstamp)
-- 
2.33.1


--=-=-=--
