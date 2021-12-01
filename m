Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF31C68
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 18:58:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="216547098"
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="216547098"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 10:58:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="500371301"
Received: from ammonk-mobl.amr.corp.intel.com (HELO vcostago-mobl3.intel.com) ([10.212.205.220])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 10:58:40 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: roots@gmx.de
Cc: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	kuba@kernel.org,
	greg@kroah.com,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] igc: Avoid possible deadlock during suspend/resume
Date: Wed,  1 Dec 2021 10:57:31 -0800
Message-Id: <20211201185731.236130-1-vinicius.gomes@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <87r1awtdx3.fsf@intel.com>
References: <87r1awtdx3.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inspired by:
https://bugzilla.kernel.org/show_bug.cgi?id=215129

Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
---
Just to see if it's indeed the same problem as the bug report above.

 drivers/net/ethernet/intel/igc/igc_main.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 0e19b4d02e62..c58bf557a2a1 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -6619,7 +6619,7 @@ static void igc_deliver_wake_packet(struct net_device *netdev)
 	netif_rx(skb);
 }
 
-static int __maybe_unused igc_resume(struct device *dev)
+static int __maybe_unused __igc_resume(struct device *dev, bool rpm)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct net_device *netdev = pci_get_drvdata(pdev);
@@ -6661,20 +6661,27 @@ static int __maybe_unused igc_resume(struct device *dev)
 
 	wr32(IGC_WUS, ~0);
 
-	rtnl_lock();
+	if (!rpm)
+		rtnl_lock();
 	if (!err && netif_running(netdev))
 		err = __igc_open(netdev, true);
 
 	if (!err)
 		netif_device_attach(netdev);
-	rtnl_unlock();
+	if (!rpm)
+		rtnl_unlock();
 
 	return err;
 }
 
 static int __maybe_unused igc_runtime_resume(struct device *dev)
 {
-	return igc_resume(dev);
+	return __igc_resume(dev, true);
+}
+
+static int __maybe_unused igc_resume(struct device *dev)
+{
+	return __igc_resume(dev, false);
 }
 
 static int __maybe_unused igc_suspend(struct device *dev)
@@ -6738,7 +6745,7 @@ static pci_ers_result_t igc_io_error_detected(struct pci_dev *pdev,
  *  @pdev: Pointer to PCI device
  *
  *  Restart the card from scratch, as if from a cold-boot. Implementation
- *  resembles the first-half of the igc_resume routine.
+ *  resembles the first-half of the __igc_resume routine.
  **/
 static pci_ers_result_t igc_io_slot_reset(struct pci_dev *pdev)
 {
@@ -6777,7 +6784,7 @@ static pci_ers_result_t igc_io_slot_reset(struct pci_dev *pdev)
  *
  *  This callback is called when the error recovery driver tells us that
  *  its OK to resume normal operation. Implementation resembles the
- *  second-half of the igc_resume routine.
+ *  second-half of the __igc_resume routine.
  */
 static void igc_io_resume(struct pci_dev *pdev)
 {
-- 
2.33.1

