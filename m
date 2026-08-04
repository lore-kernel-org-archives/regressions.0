Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32075371072
	for <regressions@lists.linux.dev>; Tue,  4 Aug 2026 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853720; cv=none; b=AmeifjXfpChVzCEBgG9B0Twe+k6B6hglpn54o2woHz19PBNoJXqNqPyCR2mfQ0j7uzSym92sTkhxcbwhJXZu924T+G0nLSSna90vg5EyxglODiDOwWelK2/WvGYh2Kc/UbPxT3zCSVw0WXZgYfCTqHd1XS4w2UxFQblU+KxOp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853720; c=relaxed/simple;
	bh=bsWjYObHJsXoFHI/HjZRmVWuqy426x5I9O0ER1ILobI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVKQ9s7p9fBd5Do66nsQFIEiOtvLiY7W874ajbbqVIJG+uUrSP+EoRO947QQlRpgks31MO8g9endmhlJC5lTbJZcprZvFMoxZzEkBtD1z0JfRXF87rPsg9ssOSUt/dM/vktmSUZQZcl6khkX94kDznwNTcjy8dkGNcEbe54Qi1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciKDGRkK; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciKDGRkK"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so6451924e87.0
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785853705; x=1786458505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gll1NPiGFUih/ZjZ/8FSJN48lAj1cn9L2KE3KQ17M6w=;
        b=ciKDGRkKw1ve8QhFyKmRzkcF6Sja2Vhbfhg6LHveu9Yu8PqI+bQPt2GJZruFpwE3gu
         5Wm9YcAp/Ab6A1jC6L0EDiW1g0KzfJCi0WN4W73uORcHGv7peUZ54L9N6sOZCg9caGSo
         8LHDoMjLwKnDNx15GsOHpUk2Oe5GjWG714LoKdWbZ/mHMTvT9/5ic0qVirEe39bcHsx7
         zMjvKiOMPoTLCE3e5i/yRgFqdYKsPoyrF1YsMOfqIz2YIX70turcudMCTHakOPcFxv+y
         Yw8XDKIhIfqw97eZ2nkPjkPVcmShlTY+34CK3uU/+x+uGuQj3iSU9e4b7nM5DeE0NX7m
         Y6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853705; x=1786458505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gll1NPiGFUih/ZjZ/8FSJN48lAj1cn9L2KE3KQ17M6w=;
        b=c1DitmUGDgXWAoN8mIXo8mtGPyLMNL/IR5s+ea05WSswbIeWaPOqkgHs8gYRnuQkLm
         z7PnYviWSjkActDcYXGZ86ELBDLVob/sdAKUD3KyFyxRbXXbUzDAWTsRORIxpaUlkkvv
         HsTOld//QqC7x4MVgLnIBjZr5wOShxvmf3oIdWWihpt6BS6vMGFYhhof000ocWiIwPfD
         43dBJRVWW81gqkcB2wNd1m2eR+Z8DtAT3XjaQfzp2EJkWISGJlftX3eFb9fok+O9++6N
         YrmFs1axpqtxe95Fwn18TwN+ZNZsp2wWpcEkT5dbncErRvVQCyAURgJXcXUf4oG2T741
         anQg==
X-Forwarded-Encrypted: i=1; AHgh+RqPWi7pDOZIfDclxF9Wk6KYQVP6V1YNckov17TwWzwBQxCRV9VXaiZeW28BcGi4hFZQp6qFAjhCNZD2zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzcGy4J4PL1E/8SpielxWl3Px607DIW74rNNTBw8XLdow1xNXT
	9LjqpnRFZVDtb84YPKZxQSmGf8wn2GK9we7HccSOGAeofhIBsBjP//tM
X-Gm-Gg: AR+sD10HLW1gzDSQnAGkq4WKgp3glXM/dfFZ9MPpRbKycK10iEB/YqT6MQL8AWhU+R1
	O75sg/D0EYnMzaQW31bJRNuqZAOcR0oesrQLL8NzwHasbIwiz6enir30RZRXPTn11YBX7B1iBeH
	oWgtxurKuRuD26yEAbdi4AW90gee94qSIHVY7y0mKRIZWSvvAW7eSAYMPC3LU2Sf6J/9J2XSQvb
	6Br5/1nJiEsJ+6qOl7PnynBxGhwm4JaZRqRnOdi3aGRy9BsA9LrfNXEfwv5Q800OqLBVb4b9h0h
	g4W+i3OMDvFUObb5rJWqngT/WZtcAT5dgppMxervrG8r54GZy0tAtKjxPdHsL1F2xmwsVhR7qSS
	cwVWywobpBJHscFApyaEvIHvNPUOOis28YavKVdB8JrnEAZGnTC8/sE9lXhbZFtImix08605Mun
	gBLn6VfK9gOJaz1oYUa2fBRTEU/iLOahIjp1Vxl1RCcOdqMeiuVP/geyBORyy7WzjoT0fqpMo/9
	/mIA1Cma9HmePmc
X-Received: by 2002:a05:6512:3e03:b0:5b2:f437:2a88 with SMTP id 2adb3069b0e04-5b2f4372c35mr139220e87.36.1785853704781;
        Tue, 04 Aug 2026 07:28:24 -0700 (PDT)
Received: from NB-9797.corp.yadro.com ([89.207.88.244])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e245c435sm2647990e87.82.2026.08.04.07.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 07:28:24 -0700 (PDT)
From: Ilya Khomyakov <khomyakovilya@gmail.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	regressions@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ilya Khomyakov <khomyakovilya@gmail.com>
Subject: [PATCH] scsi: mpi3mr: use DevicePage0 link rate only for direct-attached targets
Date: Tue,  4 Aug 2026 17:28:00 +0300
Message-ID: <20260804142800.4326-1-khomyakovilya@gmail.com>
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

The topology-aware variant was tested in an out-of-tree mpi3mr 8.17.1.0.
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
