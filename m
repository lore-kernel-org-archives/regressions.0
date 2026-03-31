Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F3A3EC2C7
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948659; cv=none; b=hzkZ/WjH5aQ23O3xE2DKENnF9ajIPz802jc6pg07H71Ul+I82VHVQLqB6EI7vhEzxcUyAxUuea2H3Wago0elu5mQV75A07mdGTrJ2S69B5qSoZQT7GVDTig4BbsZVtdeStX20TzUkA7wIva5VLHLGNmw+FaJVPRYot8oqXFBRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948659; c=relaxed/simple;
	bh=N/eES/Xh/38FhKMRuW7Q6v2kLjf92GpFC2BRpl1Ud4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mv2atuiJPPKBf5Ho4COWdOMT2ZqttB1lI1WhgRjuakzQ11pV+3gWH7gpxDgl8kUi5aFjc2FXr0ThyIa9tTFLlhw4nkpXT1HC2KscwAN1a1xGCwN147NgLempa5qmBHkTkgzfG/3UPWMXllU/b9gfaf7BCB1XZnl1Cnl5YSRCg8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf5b7NfN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqkGJ1wU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf5b7NfN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqkGJ1wU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5Xci01842632
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N5vIQzVWTdz2F4TNIPIiGoPdK8bGPWTisCz
	WzVjic3I=; b=Sf5b7NfNiJQTHSohskYwVmu7ZnhPhLyShbQHQplcY2QkqqIPGaj
	zBhr7cfuqZTDhHjOzuyLsrTVsgDe7EuRrL4qPmIE2+gYp4//xiUFeN/z5zBenaBA
	KBppuSduPZmTrf00Mg4U6hR+Ck3RU7FR/In+GEMofWbUxUx7NJWogJ+Ifu6VR8Au
	8WwJ0BWa/7MBv+AxISrlHt5PTWc2zKbbGHodCFrAN8V+xks2EDp3YlhYtQ8bIjAz
	0AjUvygqct8I9R548/dIX8TGUn0OdvzEvGLW9DctahTZkwrPpuYaDXRfgUXqclEp
	P/Sts/3RCH9Yw5Blp0qkdEmQOfFVNPmm6mQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsjapv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 09:17:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2489af602so33868995ad.1
        for <regressions@lists.linux.dev>; Tue, 31 Mar 2026 02:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948656; x=1775553456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5vIQzVWTdz2F4TNIPIiGoPdK8bGPWTisCzWzVjic3I=;
        b=LqkGJ1wUfHsndWRHHn1eWv5Pn/OwiruL9LUXq7PoK/Ry0y1mGqj4Jn8DJu/n8dLkWQ
         8K50Yuq035Dnga9s8E2Z6cG1CAegvLzAUx5eeifLL/9fsN9VhR7Ik5rDIuhKMBRyfGCS
         9zdebg41g0o3nt0ohMq55lLxskwRTZ/lo+0cr82gVJY433KH12IPIMx2k7u+L/Sptbk2
         qwdEazAmjQ2YYj2KMbQrW8FwkAxLOCeilnFJHzuZciq1A+HOLtuvVP+ZGhLX5NHWIp9C
         u1cwLaexbt2Hp9B453Nv2zG5h9i8i1HNX/QZSUJUEcuWOtwMvNwcQlMSZ7W5lHMfB8lk
         qUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948656; x=1775553456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5vIQzVWTdz2F4TNIPIiGoPdK8bGPWTisCzWzVjic3I=;
        b=kKQYBq5NGJ9R6KvoP+fpKy+qw5MKhzkpGTQ2yRIceMVlvJqyFynQj2eCsX2Vq1sMth
         5AK8FE8uqdeflfn541kSOV+nmInzfdaUBe4poWa812KZKGi9l6Dm3l5+HI01WZRUHbpt
         83dxvuNsEdGXPQb3kjUg+D/26d4lqgfQdS844YQT8Ow/ilNt/pWALse6CS/4Cl/IA5e9
         u89mLvS6bA9ai3dz6HqwWWfQJEwJ0WZGnZvQSpkpNeLlpJElJG1fqvfwfzYFgjC6dj8z
         8RZuYzCOq0Eb+I7vwRA+AwZ6Xnh6IMT4QfBauchnoCq82bBSNAdM0R2PJVnXR30i/Jzc
         rlJw==
X-Forwarded-Encrypted: i=1; AJvYcCU6mn0lqFXJ7KxfiD0xp9QBJMUysunugLZVSuX3nRRZTyuihWY3qMEBbzf9T1ecPHhQWv+4lCxjnJq6Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwT646nL9cbCb+KrCfNcqwy2ICS9rcRkG26TMLnQ7Vl/bLxlNAf
	C8FpBAvGZrIjhmYFy0XXBaryYgg9HsxWdU2kTGD7K/aBBTyCAbNa7GvLTNuI2ncDnKlYkYuFk8q
	57LxYIV3HANnRXjwQNKah0FPycD9aWOhJpqWNTjkIjsOVZYWn8RehgZ4o9kahgGfhJg==
X-Gm-Gg: ATEYQzwNE3SAda7ergaodbcalErWcpSBjrKhtaxpVdkVYx7T1RmQ52EIDmm8jZgWC7G
	/3uInQEW04ymQwICMSn6x8N32sq3bQprFED6WbMV8V0QiTGxyHeuyYbRWCHi68otM9lxLPSboHm
	FWEOPSSuzirLMNAd4c127Z2GiDpHJxeY/xsKMTiCOdtnjX7s2/b3NQ6M3tzk88iHwnt+1k3Uc9b
	dfc1cLhGF4GTIEjNA0svW0xTLy5IJ1FV8qjeqRet+Ma0CDeuuAr3UeIx1kerwOe6nMSOKkJPREW
	nkOmXurenVkeKqCbM+WLf6gc00SHVGiJ/lkduXVS5D3xXPDE4KTSeta5UYeGhAngYMre4qJMJzn
	1nO0Ts6ob9Pp6bHe6p0BbJcX3w/3HgFPRcm/npAQ=
X-Received: by 2002:a17:902:d60d:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b25ef77bccmr24215055ad.22.1774948655930;
        Tue, 31 Mar 2026 02:17:35 -0700 (PDT)
X-Received: by 2002:a17:902:d60d:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b25ef77bccmr24214735ad.22.1774948655386;
        Tue, 31 Mar 2026 02:17:35 -0700 (PDT)
Received: from work ([117.193.210.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427663acsm104909665ad.46.2026.03.31.02.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:17:34 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: stable@vger.kernel.org
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, robin.murphy@arm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        John Hancock <john@kernel.doghat.io>, bjorn.forsman@gmail.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [PATCH] Revert "PCI: Enable ACS after configuring IOMMU for OF platforms"
Date: Tue, 31 Mar 2026 14:47:27 +0530
Message-ID: <20260331091727.33552-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KJRYKGi5G_ncwEgVQ7zPsHtVyJdN9egy
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb9130 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=vr9TklybbRi32TvS4M0W1g==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=lAgNKBcoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hAXPUp1672zZkZ7mbzMA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-ORIG-GUID: KJRYKGi5G_ncwEgVQ7zPsHtVyJdN9egy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OCBTYWx0ZWRfX/4VVkzdlik9O
 kZrkcSyT1Jc4Pz2mZG85wwL00wHP5v+PiUNlZH24oO6CUYBU4KH1OyicqzCBVRCDo2rGHd1fFnZ
 8imrjNDkXmin3M4J0NNg1tJxCc2LoGaJXWN2k24w1TCxcWdaDxGxC2BFq8E/lBmag0/UDHtTmUQ
 nLjomLWiUuyAKVYmWmx+vUwUgbVoI4Oe9EYX3Szel1VHYPxw0I78hUY4aYns/6SoLCuGWqwRLDo
 uDapW7jSEOhiEYmshORpWfCRn/5D8DkLWt1IXpd9KgIW9a8hEiM2NVuTfWlmwgR6BiBr9jUbGts
 2JJvXIfGRr9CJCQpeW1nlzzIk97YXxLZTE6tDY2dod/mDMA2Mo78TWueh2I2nHNL56fkun1SJsm
 VD2jJqNhknhcvL84+iRCcLGs23WuTMo9UzW5W2NXZymmzUPjIxCx++c6MWVu9zvtYDFtFxJM9Yp
 iL8mp1N8FPeOg5jhnog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310088

This reverts commit ec494c0260bf57a6fa3aa43a91daf7a774f8bd97.

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

This revert is targeted for v6.6 stable kernel.

 drivers/pci/pci-driver.c |  8 --------
 drivers/pci/pci.c        | 10 +++++++++-
 drivers/pci/pci.h        |  1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index b7a6d8a28fe9..8c941d6267a5 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1668,14 +1668,6 @@ static int pci_dma_configure(struct device *dev)
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
index d015df77ddff..b82927905968 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1046,7 +1046,7 @@ static void pci_std_enable_acs(struct pci_dev *dev)
  * pci_enable_acs - enable ACS if hardware support it
  * @dev: the PCI device
  */
-void pci_enable_acs(struct pci_dev *dev)
+static void pci_enable_acs(struct pci_dev *dev)
 {
 	if (!pci_acs_enable)
 		goto disable_acs_redir;
@@ -3823,6 +3823,14 @@ bool pci_acs_path_enabled(struct pci_dev *start,
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
index dae7b98536f7..3c35aae7431f 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -557,7 +557,6 @@ static inline resource_size_t pci_resource_alignment(struct pci_dev *dev,
 }
 
 void pci_acs_init(struct pci_dev *dev);
-void pci_enable_acs(struct pci_dev *dev);
 #ifdef CONFIG_PCI_QUIRKS
 int pci_dev_specific_acs_enabled(struct pci_dev *dev, u16 acs_flags);
 int pci_dev_specific_enable_acs(struct pci_dev *dev);
-- 
2.51.0

