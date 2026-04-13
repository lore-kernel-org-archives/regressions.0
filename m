Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555613B892D;
	Mon, 13 Apr 2026 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776093141; cv=none; b=XfVE6kXS2Lhn7p1X9cf/Z+fGa6c23Yab+E4EkIs0kt8dyM/Uag7RRXFd8P29KpjtgL4eZYfcGQGzSAt3U2wKQB5kflnpYsasvPTHdg7WB9UP2lQ/fdWEY2IEiiwSgToUimrvsi6VHYIjkvrqTtkzZNg57w5ZjLORGHA1SR400eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776093141; c=relaxed/simple;
	bh=AfXdVsuEGCOXGeyaQk65BaNEEseDhx8yL7YHZEZz5F4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=FEsAwjdbsLaHA+CoUkg06qOhT8jl+B7PSZPg/aYa2TB9lyfChRhCsSMetckp4EFGbPqCtaXC3svI12IroiEk+UuHwQXhARkfM6/BsD8YAFp1AoVVV+o/e1pPNNIMZX/vEPtakj0sDHil52O3+O9qf+Dq88dnNYKPMz/LvPFzsio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mpu1aBnJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mpu1aBnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E0BC2BCB9;
	Mon, 13 Apr 2026 15:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776093141;
	bh=AfXdVsuEGCOXGeyaQk65BaNEEseDhx8yL7YHZEZz5F4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=mpu1aBnJewdOxRxPHL5ytjeT7G3eKu5N9Wlyyszk5Zcfr6di7MvhIwQvQvprGohtM
	 6sX0FqjSRvtobuUKVvBCy0PCc2+Tbr9dTn5oVy7vHfOA5MNM1OLPMU7V63DdtcJL5W
	 kKEKLQIAHcowb5qDe9krZUtqoScihpXRng+fMK90=
Subject: Patch "Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"" has been added to the 6.1-stable tree
To: bhelgaas@google.com,bjorn.forsman@gmail.com,gregkh@linuxfoundation.org,john@kernel.doghat.io,manivannan.sadhasivam@oss.qualcomm.com,regressions@lists.linux.dev,robin.murphy@arm.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 Apr 2026 17:12:10 +0200
In-Reply-To: <20260331091455.30394-1-manivannan.sadhasivam@oss.qualcomm.com>
Message-ID: <2026041310-headpiece-rasping-acf8@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-pci-enable-acs-after-configuring-iommu-for-of-platforms.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From manivannan.sadhasivam@oss.qualcomm.com  Mon Apr 13 17:02:30 2026
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:44:55 +0530
Subject: Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"
To: stable@vger.kernel.org
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, robin.murphy@arm.com, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, John Hancock <john@kernel.doghat.io>, bjorn.forsman@gmail.com, Linux kernel regressions list <regressions@lists.linux.dev>
Message-ID: <20260331091455.30394-1-manivannan.sadhasivam@oss.qualcomm.com>

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

This reverts commit 5d57164c0ab0ac5c99eca49c577994bfbca70a2a which is
commit c41e2fb67e26b04d919257875fa954aa5f6e392e upstream.

The original commit attempted to enable ACS in pci_dma_configure() prior
to IOMMU group assignment in iommu_init_device() to fix the ACS enablement
issue for OF platforms. But that assumption doesn't hold true for kernel
versions prior to v6.15, because on these older kernels,
pci_dma_configure() is called *after* iommu_init_device(). So the IOMMU
groups are already created before the ACS gets enabled. This causes the
devices that should have been split into separate groups by ACS, getting
merged into one group, thereby breaking the IOMMU isolation as reported on
the AMD machines.

So revert the offending commit to restore the IOMMU group assignment on
those affected machines. It should be noted that ACS has never really
worked on kernel versions prior to v6.15, so the revert doesn't make any
difference for OF platforms.

Reported-by: John Hancock <john@kernel.doghat.io>
Reported-by: bjorn.forsman@gmail.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221234
Fixes: b20b659c2c6a ("PCI: Enable ACS after configuring IOMMU for OF platforms")
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Link: https://lore.kernel.org/regressions/2c30f181-ffc6-4d63-a64e-763cf4528f48@leemhuis.info
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/pci/pci-driver.c |    8 --------
 drivers/pci/pci.c        |   10 +++++++++-
 drivers/pci/pci.h        |    1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1667,14 +1667,6 @@ static int pci_dma_configure(struct devi
 		ret = acpi_dma_configure(dev, acpi_get_dma_attr(adev));
 	}
 
-	/*
-	 * Attempt to enable ACS regardless of capability because some Root
-	 * Ports (e.g. those quirked with *_intel_pch_acs_*) do not have
-	 * the standard ACS capability but still support ACS via those
-	 * quirks.
-	 */
-	pci_enable_acs(to_pci_dev(dev));
-
 	pci_put_host_bridge_device(bridge);
 
 	if (!ret && !driver->driver_managed_dma) {
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1040,7 +1040,7 @@ static void pci_std_enable_acs(struct pc
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
  */
-void pci_enable_acs(struct pci_dev *dev)
+static void pci_enable_acs(struct pci_dev *dev)
 {
 	if (!pci_acs_enable)
 		goto disable_acs_redir;
@@ -3777,6 +3777,14 @@ bool pci_acs_path_enabled(struct pci_dev
 void pci_acs_init(struct pci_dev *dev)
 {
 	dev->acs_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS);
+
+	/*
+	 * Attempt to enable ACS regardless of capability because some Root
+	 * Ports (e.g. those quirked with *_intel_pch_acs_*) do not have
+	 * the standard ACS capability but still support ACS via those
+	 * quirks.
+	 */
+	pci_enable_acs(dev);
 }
 
 /**
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -526,7 +526,6 @@ static inline resource_size_t pci_resour
 }
 
 void pci_acs_init(struct pci_dev *dev);
-void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);


Patches currently in stable-queue which might be from manivannan.sadhasivam@oss.qualcomm.com are

queue-6.1/revert-pci-enable-acs-after-configuring-iommu-for-of-platforms.patch
