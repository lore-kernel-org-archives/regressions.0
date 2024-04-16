Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D7817554
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 04:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242014; cv=none; b=bZhiPlxe4zSWTYmEJJtbF9oPxQgXGTdL9qg5dzWqPorWtbVlyI9e5l2bf2zitP5foJmHFgY2uSkSqXgaI/MxFOpuwaLTHBEg/K+qwtHz46ZCxAIlywSM+TxgW4UiC5NAjRPCFt3BZwkaPI2OsTkgtIbwDRN7wrVhiomInWjF+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242014; c=relaxed/simple;
	bh=ET5pyKN9r4SlZzma8e0fiAbkahwzN7k33++Uo0oQh9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c63LFs0KvDYqCLA7EsTU6kdsBi9nxns/lxHW+gjRBCZWiN8KfPzDDcQ7zblWqQnjJqXc5GokqDXJaoQAC9h9sIDXJ5FAL3Fb85s6bYQ9r50XMdFlqu49qZFu14PY9D2PGPWvCXefpOBLOgdmsQNdqpVpiA/o/hBTip+0PgcepvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qVGiUamw; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qVGiUamw"
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id CC2303F176;
	Tue, 16 Apr 2024 04:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713242010;
	bh=8+sIYCY+3Pc8+EMiPSoH0rMhXyMl45YAVFAQyJoev2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=qVGiUamwNeLPxTXVB3LP1mYoRsnNYsQ1gOKtJRu9KsiIsvc/vIJRIRV0mHEs9nHEG
	 PSsdGGqYRl61oA0eHRN01lSn+kpSnNK6uRmHPG/tmWcMb+fe0xowJ6psXmykAm4rx0
	 /6Tp4HSTnzTFA3AwJi7xx5SpsQKiHLrTL0wSkD/iRhTik/IA2ccHqy6CMg/AOp8eX0
	 LUJLI6HwCQnnEIU51CKErEBXNLAu3sFOb2nOAAnqbXgQInsIer4c62wFsHZOXnBQAs
	 DBHT5Aa1VmvYpP2KXaZaKgd9OTIh8EYFcEGvJ7hL8ZO87QM96JcJT6htSm6OkC8+rb
	 HPJc8ngqqnAaQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bagasdotme@gmail.com,
	regressions@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	kch@nvidia.com,
	hch@lst.de,
	gloriouseggroll@gmail.com,
	kbusch@kernel.org,
	sagi@grimberg.me,
	hare@suse.de,
	Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v8 2/3] PCI/AER: Disable AER service on suspend
Date: Tue, 16 Apr 2024 12:32:24 +0800
Message-Id: <20240416043225.1462548-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
References: <20240416043225.1462548-1-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the power rail gets cut off, the hardware can create some electric
noise on the link that triggers AER. If IRQ is shared between AER with
PME, such AER noise will cause a spurious wakeup on system suspend.

When the power rail gets back, the firmware of the device resets itself
and can create unexpected behavior like sending PTM messages. For this
case, the driver will always be too late to toggle off features should
be disabled.

As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
Management", TLP and DLLP transmission are disabled for a Link in L2/L3
Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. So if
the power will be turned off during suspend process, disable AER service
and re-enable it during the resume process. This should not affect the
basic functionality.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=209149
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218090
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v8:
 - Add more bug reports.

v7:
 - Wording
 - Disable AER completely (again) if power will be turned off

v6:
v5:
 - Wording.

v4:
v3:
 - No change.

v2:
 - Only disable AER IRQ.
 - No more check on PME IRQ#.
 - Use helper.

 drivers/pci/pcie/aer.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ac6293c24976..bea7818c2d1b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -28,6 +28,7 @@
 #include <linux/delay.h>
 #include <linux/kfifo.h>
 #include <linux/slab.h>
+#include <linux/suspend.h>
 #include <acpi/apei.h>
 #include <acpi/ghes.h>
 #include <ras/ras_event.h>
@@ -1497,6 +1498,28 @@ static int aer_probe(struct pcie_device *dev)
 	return 0;
 }
 
+static int aer_suspend(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+	struct pci_dev *pdev = rpc->rpd;
+
+	if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware())
+		aer_disable_rootport(rpc);
+
+	return 0;
+}
+
+static int aer_resume(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+	struct pci_dev *pdev = rpc->rpd;
+
+	if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware())
+		aer_enable_rootport(rpc);
+
+	return 0;
+}
+
 /**
  * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
  * @dev: pointer to Root Port, RCEC, or RCiEP
@@ -1561,6 +1584,8 @@ static struct pcie_port_service_driver aerdriver = {
 	.service	= PCIE_PORT_SERVICE_AER,
 
 	.probe		= aer_probe,
+	.suspend	= aer_suspend,
+	.resume		= aer_resume,
 	.remove		= aer_remove,
 };
 
-- 
2.34.1

