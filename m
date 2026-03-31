Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0B63ED5A3
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948398; cv=none; b=E4NkwccSxWIwR2KmS0pVGzcyYeyebcncaIg+ago76sh6t4OFyfD4BwwblDXKBgOoSpKxBcpCvpU1+NwwgZMa7FD0N56hQhvohACU9QHOrTO3OEr63ZuR/u2CHEG6zDJrswB/zFUnm3Lhoek4ddVSDbk7IUH8JGHsvSEPN1vy5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948398; c=relaxed/simple;
	bh=HMS/kiTT0EphGAkmZl0wKbCjbDHW6VeoLhCBKAXNnXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7rt4IBtixVONDXfBSImSwRi89vPm5jwu5acjKPPSvx/MrbBGRIHurus/yA+bYEnMp1mormVd/EOO92IZPjkXAyR/uSrFTmUOzHzG7SWNasYRMtCLlg7EKjbXuZUCKOXyYJkFOuSesPIPUY+4IibZPtfJGK18XOxZeJw5Dy8mWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeHlKM3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfIOqFxW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeHlKM3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfIOqFxW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8Av3Y058044
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D38zhW0VILV4j4J3w9UTb84asghozlWF+eh
	bzg3K3+g=; b=QeHlKM3J36TQqCS8rIOPt3xKrBb0cOucxUhc+kaoylprjuHMgAn
	IKCWNu0HrglLJmNSabmh26iq2i5K78TduFUZGcIL0RITeBczledezotg/2Rle59v
	3oR+aCai4+uSZg89OVWgl4fMz6xOEKe6w+iAKqvfRz0ldeuMw9VSDjAPtx2sHwhJ
	BQXY8EoTIb/KwK5XSTiWZ3K5R5HNPkgWPAWxYRctTebfg1XWZXA/7/bFgOZGv2xV
	93hMGNd+b3CEUGw5rDG5BMJmtUScPxzxAzPCk6rLIfhWeJKneoKqIyVKQ1EVdUi0
	YrYf5bZShp/DPjHN0zvZNPFMJaltBCObUxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkr907-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:13:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso9754588a91.2
        for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948395; x=1775553195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D38zhW0VILV4j4J3w9UTb84asghozlWF+ehbzg3K3+g=;
        b=FfIOqFxWCiviEuFOvct8/nG0exCWClIn/oJNN4wCUmabL2iTSs3hSHfGAbJvQizceH
         Ww/YVFOC3kkQXMn+9eEGjrckCOThPl/JhJjXT6Vnav7kLJmcSbrW5/V7bfvoLfEl0/bB
         P5ZIvnAi0sf5mc98pbejmCQdIxV9ek3nSXzUXe/47Sc0AlZz22ztxEMxcyFq7OH3taKM
         hVpgOazRLzRh8dqMVnd6oLnG54jYVeSIlw8qPJV+b+Q00WECa7o6R0o8KjUsfJ32WSs3
         WhLNLQagYhBTBQDWnMY65RlFLaiDTcCjdCb52/SIb1bAu14SRpU+LfkZs2pCHpVpKXrp
         LfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948395; x=1775553195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D38zhW0VILV4j4J3w9UTb84asghozlWF+ehbzg3K3+g=;
        b=pxYtpkhfp2TpgcMJ9QK3zSbf2X1qXlHevQ3EV2L6sCil6TmBNg/3LeWjmwrMJ0CUVv
         kmCqDNplcI0+DUNf/4xU0eq3/Ffo8VSTk+tLxOHq91Mka9qIoT1fOVyLktpvqaq7Uqqr
         CwGm701M5HL/PkSgiP8SEczDQRkUHrpk6Zn6Bf6UTlG1uQJwtGK7edDJi+z+CGgWNmnH
         kbAG4CHpJPwrTvu21CFhiGvRh3wUVK9ajVOY+xrBrKytMAoHT/UE58Kr2i6wPVbZ3zru
         NkVF1aalp+KZE0vk1jQUfYDKMpUzj9R72uP//M+k+cjqm3UUzMcGAY6ZnjR2oz3YhNoA
         CiXw==
X-Forwarded-Encrypted: i=1; AJvYcCVVvhj59ts/D9txFm4HgJ3NABdjVIPxcCuCNMhPI1ksNd4BqHHbOymL4YQuuxGWb7JIPenZiyLLhruZ0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUYyhVR34gyd9f/Px5C2STcKNx4KsnpUoPcqrZKOMIwZY/4Id9
	3LEY50Grpr2jEHgcK5xPZ0AJbFD9IHlD9O4M+HoqkEybpVmKLgA4RseT36w/N2aYy8NvznyQQ75
	rSEzEqi/vCQEmwhKhb8nByTq/OBU6vang11g2qnrBYzQspNerW6gTE8ZBP510tcak3A==
X-Gm-Gg: ATEYQzxvlvGQG/pmlkmjXSqhDkeGA0ATyGWCvvX2TIJAkcqmUpYKxztVfGeMW+REksc
	ZkX8gO2vZJmEQkzGCTqyby8Nvlc09R0r3A6pe4pIDMKwcDKlloKYVRW9wv3eAt/eRvHRcmhTUpd
	zBL0Dzn/ygAfgyhFHNxakaZU2TCx0f4RP41XazowL0gsAg73cOS1Rd90cwpDioUb1Rtxb4TqyfZ
	JM24oW5KRk6v224PPCdw/acST4alzyQlax6igHPYc0kIi2lTuS9WzWpsdh1iXXuNnENw/b/MlwE
	OfbKsRuddWOW+gcud3IEAhScLeCsuGKMN9aeylkwXSmKn7kcDrohPFYNyksVvTve0bJaiVwUMim
	RWHiJGT95WBeJnmK8d5x7dAW0u5Ryc+TWQzPK6tk=
X-Received: by 2002:a17:90b:48d2:b0:358:f0d0:1a19 with SMTP id 98e67ed59e1d1-35c2ffffaa2mr14258423a91.12.1774948395083;
        Tue, 31 Mar 2026 02:13:15 -0700 (PDT)
X-Received: by 2002:a17:90b:48d2:b0:358:f0d0:1a19 with SMTP id 98e67ed59e1d1-35c2ffffaa2mr14258399a91.12.1774948394510;
        Tue, 31 Mar 2026 02:13:14 -0700 (PDT)
Received: from work ([117.193.210.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm986527a91.9.2026.03.31.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:13:14 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: stable@vger.kernel.org
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, robin.murphy@arm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        John Hancock <john@kernel.doghat.io>, bjorn.forsman@gmail.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [PATCH] Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"
Date: Tue, 31 Mar 2026 14:43:06 +0530
Message-ID: <20260331091306.25210-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX+EhFQxUurEfY
 g6TCmUnruQ2eNPf9n2iBG4EZEdq+mSrXBZ/TEhZOnnQyDVH+BWNNsZ82pJNGY1czWo+v39TnidR
 /m8kaALfBbkEKFe+fP6TO3JVh0O/Exlvln34Uih/6/bJLosqMbuyBmHoye5mP1koKyNw4A0lfZc
 hojrZz0KC+QNh6L58ak2krUKX+rXAT5eh0PDvb392Bu6HcZeiJh331Rf43OH9yD3EJ7By1NPYA/
 EiLWdxbhK+N/3LgNafShkuSLF6OmGNzMX0Hngps2rcVq8h45nKi9DpJShIUHElyqs39WchutIKo
 B/W58+vB183NTZZzyu94bYApZOATp0DzwtCMmKOLhUEXXgAEQnTFKZJvY1xkY44QMlhJOTYLVQy
 YgUGwRq6p/rQ5fyNeNAhCcEmCji3AMpBl+jpBWtvxUtiank0RlNTHhA3bs1GA+aWG1/DaeQo2lo
 UQKeJaVKo0hvqlh9O2Q==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cb902c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=vr9TklybbRi32TvS4M0W1g==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=lAgNKBcoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hAXPUp1672zZkZ7mbzMA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-ORIG-GUID: eVgOF0TtK1xdTTAusz33zFMx3hGcevG1
X-Proofpoint-GUID: eVgOF0TtK1xdTTAusz33zFMx3hGcevG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310086

This reverts commit 573497f350b3cdb526c8c38955ddd287c5d4cc53.

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

This revert is targeted for v5.10 stable kernel.

 drivers/pci/pci-driver.c |  8 --------
 drivers/pci/pci.c        | 10 +++++++++-
 drivers/pci/pci.h        |  1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index de500afdcf97..fe15e59e7c56 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1601,14 +1601,6 @@ static int pci_dma_configure(struct device *dev)
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
 	return ret;
 }
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 82bde2a92cf6..c25bb6bbc6d9 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -894,7 +894,7 @@ static void pci_std_enable_acs(struct pci_dev *dev)
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
  */
-void pci_enable_acs(struct pci_dev *dev)
+static void pci_enable_acs(struct pci_dev *dev)
 {
 	if (!pci_acs_enable)
 		goto disable_acs_redir;
@@ -3548,6 +3548,14 @@ bool pci_acs_path_enabled(struct pci_dev *start,
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
index 5079800f56ce..c2fd92a9ee1a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -547,7 +547,6 @@ static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 }
 
 void pci_acs_init(struct pci_dev *dev);
-void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
-- 
2.51.0

