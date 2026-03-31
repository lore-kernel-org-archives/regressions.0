Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37A3EC2C7
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948525; cv=none; b=K17GRYmQ/o9C4P6squ8etbX7sZNso24qhgAy31lY+XzXrheSlI0+UK/57I6Zo/470YXP+WFIVaT4c/zGayToHcj2pYW7l8TWpi0PR1X6aJ3+EKau0JhBLjH5lZF/LhgAwfelsCUay+WnRHooUotl1gBuVkAPP7XwmLPwDV+lToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948525; c=relaxed/simple;
	bh=wqEtTcfrnfkB1/1JAggq7TeFTa6jZH31RqJX87K/lOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1trG/gfi/hHta2woPMUy/UteviDRl3KbBRkbjvk2rZjwkykPebMkensNviF+RZKNePKLiRgnsXgoNvye7P28OSbihy7oJ9Q0Go81Lt0c9AwowyaPbst1VPCXDXk+Q7W1sXLv40RKiSmzhK8PZNhQZN7vecy4EN4m+uv4ow0wvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5rzIaPP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGNFaEpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5rzIaPP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGNFaEpD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7olFH430858
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mwgbVgvQHgOopgtkJu/D2bFIW5S1SsBBybk
	+5nhk3pk=; b=a5rzIaPPWYZ/yKSPse1+2tR6kEr3RHcj7ZMNPi0t9/iUPCcSCQt
	jwi2yDN2+hCnDQAdLYG8HQGes5sHE1aUgtpgv33+EzRZSP8iFpEHAy5EsOHaRiii
	A89Xemcdb4dF+booUb0mX6SluqH5bzFHWrDuTwl+pS1JkN9/pfV0uFbKmvvQPepG
	TZsUoMR+lEg1SUvwrZ6BbJN9+J5WT0VqoEpgbV9Q9Exmrso/K9dqvxAjx/e8g3sD
	yZ3cLZhjv44SqvD0syeShb/NU5LQGLmXWZjzCbK2DJGLRXXTfcBwUQSSbBL5mJ7y
	SP0AZymxvlGKtgPfbbCyuP9B0Er1ZC0diug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhnct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:15:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c8768a704so2738373b3a.3
        for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948521; x=1775553321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mwgbVgvQHgOopgtkJu/D2bFIW5S1SsBBybk+5nhk3pk=;
        b=QGNFaEpDyC7jK238CkG8i/oN28AAMeRKLdNL3jer6lg5aP/DNvdU4qcTh2MQacHku6
         vXohxsmvUBe7jMu6u5y1aPv9LMZtZi64I22WRDBmsavIquYsZsOKG3bCQE1Ql6Ig3+90
         Ev0f36eW13b+AMEVGm88gzurwlncWJtwwraL5nY4RCt1xOZLbMj5wWLyiJE33gJWfY0u
         wAl8Z8QpJjvhHQDkV6mDaYXLmb55VzASDe4KVEbIFpF+AfhsQRc2/eU8Yws58jidIaGj
         +4k4rQa9LjXkXiVZ1JBVM33KVQHM7fXnfGMwqwm3M7mUhFHPvitqCCv3+9iFtWU7JjbZ
         zBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948521; x=1775553321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwgbVgvQHgOopgtkJu/D2bFIW5S1SsBBybk+5nhk3pk=;
        b=mGrnoUF50D9BmNv93qsKGA3r1BumgfY3LFk3OQJF/GlCZDBqv4aH6LjfkjRT59UHWh
         7qewkbzyjeDwmmkjT5FToVQtDoBrboP0jObjHDsVxppBPK1V0Z0wxmZ0wx/rY/zj+y4P
         nmfyY0v7zGLU+sSYTo3GLiz4z5PIfpUJ24x2SqX3ED2yvCdPSSxzPnaOOHy85wc4Zm6Q
         ndGRYdeZqeWobJjxaHrlXl70zcC8hIqzntWgg1r3XAFGzWtAq0gi2B/EeMiRN+dPwRqL
         PCMPJmkTDvFgEOB31nEYyK0kLYNNn/cLkEqZr1MOb9J1uomi2mTo9VLBOlQvsENnEjZB
         Igtg==
X-Forwarded-Encrypted: i=1; AJvYcCUCadQnKVlXzVoM4v3D+z5fmS79OE+96uwnM+daCrvBD91DlRPFI1mY/C5c5HWRDIop2FSy19bO3ISu2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwbolGAQjMMz1zwx17LXcpaK4OzQ2YCKxfVbgmNvBtk2pDi36k
	olhhCB2s5p5u8c7fI94IqawSpOWOtTjdnpDZmu2CHlyrvmFkpUjGZnXBd5diuZ7a5qBEcA55/GK
	vPenBnmMhZ/+pH87G/tI0t/m57EyETKRuf3dGZSOGRxXQI11AFcpS19RJ8t98JQMGRQ==
X-Gm-Gg: ATEYQzyIS2bZZXQrDZFLvvQ4H0p/OvdGvkKPf17Nc1V6tpgYNu8rRyDy65BIPM/e11l
	r4up2xPwmChGFJOGNluJzLWrOHUeYw1WqpxFbEjxexCGVXY1K32vqHq+qf/kb16L3uGSEUVFiuD
	s2JZR8P+6dUlIxl1p088JtalosqTeqP5w4/Prv1Rv0pGWynxZsgjQWCBr7SHPkXY8ZMmCaodGA7
	aDjeVQTIXVf5qMVoFBcDgH1mPMxrqlvVpeMhwwPjm1qqrx2dxjOqUu/2UBREhouN45VM2qDeCPz
	ZOG3rHshgjp4Z9N+m6Gi9jDJIGjUl2lyWwa3Pkuue2xPbrtYTfxZR8O7Ln0/wgXRZztnewe78ZA
	9g8uUrgYneNVIhfIln66KiWIj8sD/HBB8/fYwb5o=
X-Received: by 2002:a05:6a00:4197:b0:829:7057:b99e with SMTP id d2e1a72fcca58-82c962124bcmr13030031b3a.54.1774948520797;
        Tue, 31 Mar 2026 02:15:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4197:b0:829:7057:b99e with SMTP id d2e1a72fcca58-82c962124bcmr13030002b3a.54.1774948520077;
        Tue, 31 Mar 2026 02:15:20 -0700 (PDT)
Received: from work ([117.193.210.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca847ff4dsm9760492b3a.23.2026.03.31.02.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:15:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: stable@vger.kernel.org
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, robin.murphy@arm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        John Hancock <john@kernel.doghat.io>, bjorn.forsman@gmail.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [PATCH] Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"
Date: Tue, 31 Mar 2026 14:44:55 +0530
Message-ID: <20260331091455.30394-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb90aa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=vr9TklybbRi32TvS4M0W1g==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=lAgNKBcoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hAXPUp1672zZkZ7mbzMA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX6dNbERYURp1R
 wOookikTbb5U/iqgIODfswoZ7NVA0USR+wnTFfE/yLwhDfcMCxb2Iazl6p6SmY2aJpob9gLZZMB
 kTfZ3qdvRNIS5du+UM/FQwsvbJti24wUHTW6C2nLVr18sxacn5pysjgyo+/E0hpmlbk2qOjRs8l
 VUSvSEocbjt/WTLCsnuHm7SmTG80xQF6f0VAVIfbc0vphKGPlJgtf3RGqGTJZn9jmdArT0nLuSM
 pTFiJNgkpt213k1wY4OXwNroEspWdbIpjXw72cErDxELJskkLkNCmxA55PdJqOqHWynrEG2SrLG
 bFMx2aFLAUxrhUfp3fFov3ol9Si4paqMtgcoGaGKRG5xkTfAediV2EDJFMULhzpcgV7u7qMwk2U
 GhChDF55J1bSKNzlr5D9GBFJonUG9IaBv549xPeXA5SSR7Y4QU+bTtRfE8JO2gMFbalP6mwFJ1k
 qMmbzvN/W47pEiLCDAw==
X-Proofpoint-GUID: _Dohlc97IaIUhoREulGDBSKv1HZvf0U9
X-Proofpoint-ORIG-GUID: _Dohlc97IaIUhoREulGDBSKv1HZvf0U9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310088

This reverts commit 5d57164c0ab0ac5c99eca49c577994bfbca70a2a.

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
---

This revert is targeted for v6.1 stable kernel.

 drivers/pci/pci-driver.c |  8 --------
 drivers/pci/pci.c        | 10 +++++++++-
 drivers/pci/pci.h        |  1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 8b5796a6ed5f..fe6e5f716543 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1667,14 +1667,6 @@ static int pci_dma_configure(struct device *dev)
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
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d2d6b7da8c66..0778bb09d878 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1040,7 +1040,7 @@ static void pci_std_enable_acs(struct pci_dev *dev)
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
  */
-void pci_enable_acs(struct pci_dev *dev)
+static void pci_enable_acs(struct pci_dev *dev)
 {
 	if (!pci_acs_enable)
 		goto disable_acs_redir;
@@ -3777,6 +3777,14 @@ bool pci_acs_path_enabled(struct pci_dev *start,
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
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0debf921a9fe..85488bc8e779 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -526,7 +526,6 @@ static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 }
 
 void pci_acs_init(struct pci_dev *dev);
-void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
-- 
2.51.0

