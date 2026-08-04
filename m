Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C140046A610
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851998; cv=none; b=mCIO0BCpiA6A7iRyJLK8ksHqP2UwlIRUENk/k0UGqKspAIlJhpasXQnncGn3aFy8Mgn5EvC4QxKog8zTfSJn2OMY9Sbyxs7IyEa0z2GeDx6iuXXKdYm1eUvw5yXPcOuYgV0C7eYW0YeiF0JV9r6o1WMge/od2wKOlJQnABr2gTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851998; c=relaxed/simple;
	bh=RsDBi8475TpIHQjUtUBpRHh5ONEgHfnupLzp2MTRyGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RGHNrxfBFwrfQMb/hd9jBirTAvceFwZfnw3+D9gvWmX7KWgVhhhH6q9LeIJI0eETzOOUj0fE1b6gjsPfzk5jTwre1strKD9Tje+8I5qTC0WoIwyElkVQQhbGZVXMVKJl6Q9a9gDb1o0Luyzy+/L73Y9EzebUlgANBhgwDLBe39s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVKNAl+L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVKNAl+L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956242332dso27517475e9.2
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 06:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851995; x=1786456795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rct+zRFkfhaiayckwn1MyC9PfAByz7KiBh2UElUWcVU=;
        b=NVKNAl+LjJ542IbGx3Ksp4yccnNCB7YHZZJgCebuqcHPiO9k+RMa6f9i/7Fajw9pkY
         fr2T0UeS8Hv/nUYHKSPCykKEoDwD4es7Mi8Xn7bK6fxL0i6NLb+eSJGCuqc/5AVdewlU
         cTLZBk8eICeWG4ClseZnOUPeDZ8mnVnVs76tXGPXZfbe17a0/TO/Ba2UOSBgahd33Law
         ivUUBZx1cXX+xrA9lYdV+P9CA/2Pu/GVVckvuu/lmE58t0EWDnjAXa3n95tvacESo+Pi
         dAhRonf5dl+UIDSyUyN9Pe35SQmm33lXe+flxo4Oxql6nugv5CHDMrVZxsk7SlxybGGY
         r8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851995; x=1786456795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rct+zRFkfhaiayckwn1MyC9PfAByz7KiBh2UElUWcVU=;
        b=sZWdqgY2vQT3nJjmIPmmkkaeTiS3+T3yHQ8tCtk+lNK8MMMVlm3boTr/2eZ3GcNHrp
         JSTPPgwX8nPi6tWOVSJU12jiX8CKfMGif9Lggn8e1zP317Ghr9enASgwO/DIhgwnZBgm
         eM6SVy5S0Wut19gZ59MsOBBGOhX7FOmgHW/Go1rCTv2Pjz775LkU0rs7BID/uFQtX4qy
         gV5Nf4oW1Zj6klsvS2rz7EnERqAii//rdUmvMbbAYUj5S3UAxPnoiOwZULIXFWzJ1ZLF
         mkhie22qsoVASCQXLbyXcXc2cIz9fLQEPNmqJR9YyWJUGHskAJstihn78QJXEhyKykDU
         WQMw==
X-Forwarded-Encrypted: i=1; AHgh+RoAjRpbW0MmfIH+F8obgq7hi4ocUr4HwFG4u1EC9yY5+YuLmxmTLOilqd8Gb6OduUt22SfM+aQ737YW9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5zq8gbh9WPaG7IOJNiCOcLTaha/twRzFsaqJKnFf107mnloYR
	+kiM9CTBh+Azb6L6X8hVZmMgpGawM2kALY+OyP5ew4uf6TTpegeY7aan
X-Gm-Gg: AR+sD12uLjMQwPSEyCJnL0obY/fNvXt2hrYpL2DGtB2Fm9yQPYO+n+vVG8im+j8NgqM
	7BwGVriN5QeUHNTk3pPqxXr2QvfMr1IUCC/pWgVF3fXVAujISrchGo8QTYODEtZB6JGQaOhTO6C
	iYI6naO2KJZypuPKuF4hqsTiVmO1cHwzMB08i0toVhG37P9mk4AnTBTby3aOzY74cwplna2MsAg
	cUk8TMMtD+r0AtY5rRPZBdbCK4lcABMrGYdfT1lcXq+BzGgo1MxFxLXdeiE6n7z5nsvVTRZH3oY
	L0CNnck7FeH5BTxCdKs3s4ydCLUUHAQIc8lMWf3/bXOysiVCpg8jt0Jn+FPRYHY5gpG9+Q4m/kd
	NHY+yam2lfUSOLh+XDPacvc/ksWdNR86VRYCDOmYQQPygngMhM9puSNkXSB8mpmzHyFp2Rw1En5
	zSXd+zjti7eSI7A5o8+ueJ3Gh3LXZGqm3F5N90Sar9PlUhzZDV5eYdfDKOFaNsAVEhsu3XrDp0A
	A1pWMt/4ApSXvNV
X-Received: by 2002:a05:600c:c170:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4980c673ca5mr396870185e9.14.1785851994797;
        Tue, 04 Aug 2026 06:59:54 -0700 (PDT)
Received: from NB-9797.corp.yadro.com ([89.207.88.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562667sm46160927f8f.24.2026.08.04.06.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:59:54 -0700 (PDT)
From: Ilya Khomyakov <khomyakovilya@gmail.com>
To: linux-scsi@vger.kernel.org
Cc: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	regressions@lists.linux.dev,
	Ilya Khomyakov <khomyakovilya@gmail.com>
Subject: [PATCH] scsi: mpi3mr: use DevicePage0 link rate only for direct-attached targets
Date: Tue,  4 Aug 2026 16:59:29 +0300
Message-ID: <20260804135929.3962-1-khomyakovilya@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a regression in the Broadcom MPI3 Storage Controller
driver under drivers/scsi/mpi3mr/.

Commit c273c14b0294 ("scsi: mpi3mr: Use negotiated link rate from
DevicePage0") changed mpi3mr to prefer the cached DevicePage0 rate.

DevicePage0 stores negotiated_link_rate as one standalone MPI3 SAS
link-rate code, while SAS PHY Page 0 and SAS Expander Page 1 store logical
and physical rates as two nibbles of one packed byte.

mpi3mr_get_sas_negotiated_logical_linkrate() currently sends both formats
through the same high-nibble extraction at its common exit. A valid
DevicePage0 value of 0x0b or 0x0c is therefore converted to zero. The later
minimum-rate safeguard then publishes the value as 1.5 Gbit/s.

For example:

  DevicePage0 value:            0x0b
  packed-field extraction:      (0x0b & 0xf0) >> 4 = 0x00
  minimum-rate substitution:    0x00 -> 0x08
  Linux SAS transport result:   1.5 Gbit/s

There is also a topology distinction. The caller uses the returned value to
update the parent sas_phy. In an expander topology with the HBA-to-expander
link limited to 12 Gbit/s, DevicePage0 reported 0x0b for every tested
target, while Expander Page 1 reported 0xcc for several disk-facing PHYs
that were operating at 22.5 Gbit/s. The cached target value therefore
cannot unconditionally replace the local parent expander PHY value.

The original failure was reproduced on an eHBA 9600 controller with a
SAS4016 IOC and a 46-PHY Microchip expander. Before the fix, a target with
DevicePage0 negotiated_link_rate 0x0b could remain visible in sysfs as
1.5 Gbit/s when a replayed topology event contained current=0x0b and
previous=0x0b and therefore skipped the Linux-side update.

Validate the standalone DevicePage0 code and use it directly only for a
directly attached target. For an expander-attached target, retain the
existing Expander Page 1 path because it describes the local parent
expander PHY being updated. Retain the SAS PHY Page 0 fallback when a
directly attached cached value is invalid.

The topology-aware variant was tested in an out-of-tree mpi3mr 8.17.1.0.0
build. After boot, Linux reported:

  PHY 18: 12.0 Gbit/s
  PHY 19: 12.0 Gbit/s
  PHY 24: 22.5 Gbit/s
  PHY 25: 22.5 Gbit/s
  PHY 26: 22.5 Gbit/s
  PHY 27: 22.5 Gbit/s
  PHY 28: 12.0 Gbit/s
  PHY 30: 22.5 Gbit/s

No tested PHY was incorrectly reported as 1.5 Gbit/s, and the 22.5 Gbit/s
disk-facing rates were preserved even though DevicePage0 contained 0x0b.

Fixes: c273c14b0294 ("scsi: mpi3mr: Use negotiated link rate from DevicePage0")
Signed-off-by: Ilya Khomyakov <khomyakovilya@gmail.com>

---
 drivers/scsi/mpi3mr/mpi3mr_transport.c | 46 ++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/mpi3mr/mpi3mr_transport.c b/drivers/scsi/mpi3mr/mpi3mr_transport.c
index 240f67a..740fccc 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_transport.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_transport.c
@@ -587,6 +587,30 @@ static enum sas_linkrate mpi3mr_convert_phy_link_rate(u8 link_rate)
 	return rc;
 }
 
+/**
+ * mpi3mr_sas_link_rate_valid - validate a standalone SAS link-rate code
+ * @link_rate: MPI3 standalone SAS negotiated link-rate code
+ *
+ * DevicePage0 stores one plain negotiated link-rate code. Accept only
+ * negotiated data rates supported by the SAS transport conversion code;
+ * reserved or transitional values must use the existing PHY-page path.
+ *
+ * Return: true for a supported negotiated data rate, false otherwise.
+ */
+static bool mpi3mr_sas_link_rate_valid(u8 link_rate)
+{
+	switch (link_rate) {
+	case MPI3_SAS_NEG_LINK_RATE_1_5:
+	case MPI3_SAS_NEG_LINK_RATE_3_0:
+	case MPI3_SAS_NEG_LINK_RATE_6_0:
+	case MPI3_SAS_NEG_LINK_RATE_12_0:
+	case MPI3_SAS_NEG_LINK_RATE_22_5:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /**
  * mpi3mr_delete_sas_phy - Remove a single phy from port
  * @mrioc: Adapter instance reference
@@ -2292,18 +2316,26 @@ void mpi3mr_expander_remove(struct mpi3mr_ioc *mrioc, u64 sas_address,
 static u8 mpi3mr_get_sas_negotiated_logical_linkrate(struct mpi3mr_ioc *mrioc,
 	struct mpi3mr_tgt_dev *tgtdev)
 {
-	u8 link_rate = MPI3_SAS_NEG_LINK_RATE_1_5, phy_number;
+	u8 cached_link_rate, link_rate = MPI3_SAS_NEG_LINK_RATE_1_5;
+	u8 phy_number;
 	struct mpi3_sas_expander_page1 expander_pg1;
 	struct mpi3_sas_phy_page0 phy_pg0;
 	u32 phynum_handle;
 	u16 ioc_status;
 
-	/* First, try to use link rate from DevicePage0 (populated by firmware) */
-	if (tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate >=
-	    MPI3_SAS_NEG_LINK_RATE_1_5) {
-		link_rate = tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate;
-		goto out;
-	}
+	cached_link_rate =
+		tgtdev->dev_spec.sas_sata_inf.negotiated_link_rate;
+
+	/*
+	 * For a directly attached target, DevicePage0 and the parent host PHY
+	 * describe the same link, so the standalone cached code can be used
+	 * without packed-field decoding. For an expander-attached target, the
+	 * caller updates the parent expander PHY and DevicePage0 can differ from
+	 * that local segment; retain the Expander Page 1 read in that case.
+	 */
+	if ((tgtdev->devpg0_flag & MPI3_DEVICE0_FLAGS_ATT_METHOD_DIR_ATTACHED) &&
+	    mpi3mr_sas_link_rate_valid(cached_link_rate))
+		return cached_link_rate;
 
 	/* Fallback to reading from phy pages if DevicePage0 value not available */
 	phy_number = tgtdev->dev_spec.sas_sata_inf.phy_id;
