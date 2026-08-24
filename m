Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC83932C9
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549570; cv=none; b=X08WKTn7XOKmb/ny0pe/9g498QoV48F4LUiltic0/hGL22A2YXufZefk5gXDaFDS5ah1CrgPtiteKIlG6gANNJvhY/+DxF4MPslOoD/L+ypli+ZC226N3ZOsEvfFmeRLvQsP6pOPbrM9cUSez23MFq+soXYwTA75WHs5DdMF3oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549570; c=relaxed/simple;
	bh=9/DXQtHwhTHLTnJ8cmF+7DiBZjnxH/ksRQYyyob9yqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXgndT1270UTIKoeRDOcfkaw6QGF5uUy4VGbaWzS3fYPbo1ogn4QIRXMXc+RoNV27Moy0Ww9JjBC5ywUSsMAf/v47ZfgYvUcWLNgYQLTLcvjNRqVMdO2KsE38XVBA5jaxJaZJ127uIB/9b1oQMTz5DaRvSE0Mg0B1M/EWUzmejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHbGNVfg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHbGNVfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787549560; x=1819085560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9/DXQtHwhTHLTnJ8cmF+7DiBZjnxH/ksRQYyyob9yqU=;
  b=gHbGNVfgdemjevzKgnahPWMXmfgBCK6RpvHGC3KFPF0bbxVOQF9038re
   E24XSaINwPYhlvJ/+41a6pJko3BGLcbAmrs0pQhAZhk3Y6D/jkMmnMLLb
   mnBE0ksMik1OAxk/m07anOn21E88ikBqAeFvHF9wox585wUymMH8vZ/pt
   X6Y0wPgSwKYJL9gNQlvcyGdPXyvEVeqrhFDHB95jGjXngS8tG62qNjQmI
   mt3rIG/h5oTygVMj3mtyG5v3Tt6G+4Te6TADzM2ha4t2pdnU7YV8GHxoK
   Wbw0+m92W0NmExdKUiU9yCjIFAeejcArkbsTMzp0dYKiZSi3Z5Quf2v9B
   g==;
X-CSE-ConnectionGUID: +t7XYWQlS6i1wEoWOHHkDw==
X-CSE-MsgGUID: 75PLdtKsRRKX8TYFU1mqwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91862772"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91862772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 22:32:32 -0700
X-CSE-ConnectionGUID: Y1gLesBxS/S+Ol8fthurIQ==
X-CSE-MsgGUID: Wso0R4UxTjKD1UMOE6dH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="271108216"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 22:32:30 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexej Sidorenko <alexej@sidorenko.cz>,
	regressions@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728
Date: Mon, 24 Aug 2026 13:32:27 +0800
Message-ID: <20260824053227.317496-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5ead2063611a ("Bluetooth: btrtl: fix RTL8761B/BU broken LE
extended scan") set HCI_QUIRK_BROKEN_EXT_SCAN for every CHIP_ID_8761B
device to cure repeated 0x2042 failures on an 0bda:a728 dongle. The
brokenness is per-dongle, not per-chip: on a TP-Link UB500 (2357:0604,
RTL8761BU, fw 0xdfc6d922) extended scan works, and the legacy scan
path the quirk forces is what is broken -- LE Set Scan Enable (0x200c)
times out with -110 about 30 s after firmware load, btusb resets the
device, and the adapter re-enumerates in an endless loop (382 firmware
reloads in one boot). 7.1.8, which predates the stable backport, runs
clean on this unit; 7.1.9 loops.

Move the quirk from btrtl's chip-wide switch to a btusb device-table
flag on the USB id the original fix was verified against. Other 8761B
dongles return to their earlier long-standing behaviour.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2521504
Fixes: 5ead2063611a ("Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan")
Cc: stable@vger.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
#regzbot introduced: 5ead2063611a
#regzbot link: https://bugzilla.redhat.com/show_bug.cgi?id=2521504

 drivers/bluetooth/btrtl.c | 13 -------------
 drivers/bluetooth/btusb.c |  8 ++++++++
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 7f54d2d2d13a..03fa9409e3ee 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1343,19 +1343,6 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 	if (!btrtl_dev->ic_info)
 		return;
 
-	switch (btrtl_dev->project_id) {
-	case CHIP_ID_8761B:
-		/* RTL8761B/BU reports HCI version 5.1 but does not support
-		 * the LE Extended Scan commands (Opcode 0x2042), causing
-		 * repeated -EBUSY failures when BlueZ attempts extended
-		 * scanning while a connection is active.
-		 */
-		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
-		break;
-	default:
-		break;
-	}
-
 	switch (btrtl_dev->ic_info->lmp_subver) {
 	case RTL_ROM_LMP_8703B:
 		/* 8723CS reports two pages for local ext features,
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2bae85b0016c..84614e60d142 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -67,6 +67,7 @@ static struct usb_driver btusb_driver;
 #define BTUSB_INTEL_NO_WBS_SUPPORT	BIT(26)
 #define BTUSB_ACTIONS_SEMI		BIT(27)
 #define BTUSB_BARROT			BIT(28)
+#define BTUSB_BROKEN_EXT_SCAN		BIT(29)
 
 static const struct usb_device_id btusb_table[] = {
 	/* Generic Bluetooth USB device */
@@ -619,6 +620,10 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x0489, 0xe130), .driver_info = BTUSB_REALTEK |
 						     BTUSB_WIDEBAND_SPEECH },
 
+	/* Realtek 8761BU Bluetooth devices */
+	{ USB_DEVICE(0x0bda, 0xa728), .driver_info = BTUSB_REALTEK |
+						     BTUSB_BROKEN_EXT_SCAN },
+
 	/* Realtek Bluetooth devices */
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0bda, 0xe0, 0x01, 0x01),
 	  .driver_info = BTUSB_REALTEK },
@@ -4403,6 +4408,9 @@ static int btusb_probe(struct usb_interface *intf,
 	if (id->driver_info & BTUSB_INVALID_LE_STATES)
 		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_LE_STATES);
 
+	if (id->driver_info & BTUSB_BROKEN_EXT_SCAN)
+		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_EXT_SCAN);
+
 	if (id->driver_info & BTUSB_DIGIANSWER) {
 		data->cmdreq_type = USB_TYPE_VENDOR;
 		hci_set_quirk(hdev, HCI_QUIRK_RESET_ON_CLOSE);
-- 
2.43.0

