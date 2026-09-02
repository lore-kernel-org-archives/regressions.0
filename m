Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AEA4A49B7
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361027; cv=none; b=ZjDsNLqeASgAlZ1brPV0A12zO5e9gg9JuANqfRhOaJcxSbMcDrv9vTNDB9xNmYg0UcxzkyPactGlJaEo9FvsUa5TrrIf5GBhgP8AH1veCu4CcIWVrEUIVHXgFRXF6ZqMoLA1bxaX6qDjyhJQJvmjT0TBqNYNJP2TIdWIbA0iWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361027; c=relaxed/simple;
	bh=YXYiQ6MlkwSY9s0/iRzorG5wwX8F6Ons+fpr1FTHCdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PIa32wANalJlL+zxQ310HaIHIy14lTEd7jHMu3Kvtnktc6l1h0ICTtrf+3O18WOVd2RRec/acfy7U5MGTWUZ0O+TE/KowwabXguggvEvu35I+zgRYXoW4vDWxCDD4FOD8IadJysReTE9+HWvrEe3jmEsF+YUAxn363CIj2g+PwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jksBk4gs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jksBk4gs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso11391035e9.1
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361019; x=1788965819; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKBfOg4ndfWf72OBMR4MzaBGR2UKb0LfrmxRQ5wr5p4=;
        b=jksBk4gstZcPmRXerdkWX8h/Qqw71NDL2yOqQSoQAjarHfgGmbesDUoPK8RwcWyAz0
         dVPXyTM+zI84ggv1f7j7UI343GCwVK6gjGjWCnKGghClGHKpgZZo2Xmce/YhsprEbD5l
         y+zuTDtxkPjlrgODG7IGOTCSfukHoMJa++Rskzn/68PssDXkFgxvrk89VXIwnFr01RBi
         QGPDXi70OCv3sLU2Gcdu8FWJYt1ZiH9m0N80+vRb6ct+fdyu4CY+puPVjUDGXPKS6ZUo
         tel4i0JBnyavznKMEyLOlRNnt3Ok2ziEj5ZrYPCAWu71VM5p3YioAuFc1wz3ZRAqKYfa
         xP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361019; x=1788965819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKBfOg4ndfWf72OBMR4MzaBGR2UKb0LfrmxRQ5wr5p4=;
        b=gfJb7MlyUc4yXZN+r5+sXA1XPC/cako0e5GIfAxTJ08Tlg+xeqRRcGA7+lFHtMhkTi
         kKjfnTS0JxfX/mcPhoCf2FjukotckDCpky8A+yK8WtcqbHm7IwG9Y+7XxF8iW10GR+2T
         IGKqKT9SxyKI/zNV7kWqeda7MK59N/mBn5fNE0S+bm/2LjdNsA7CbJtzscOn8i06nbLs
         ffmnY8YUIyoy1Or0PhaAEBvZViYJG7w0TyHxm8YstiN6K4p1Y+iKYDaUch3UN6x17l6t
         s4DwwgZYBwUuMR9Jj2gXBXWSIFngUnZbDp1o72XMyTPoyZgI77FuiZUnPMUzvKU8vz0k
         WtkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpvDO0+Eatkrxnsw6ZVDuJwPFszfTxkQOcCNi66v2CTh90e4ln+ES7VqQlVnWQw+60NYhoSO5LGVXlmQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kefGRPZKF+IR1L+BRaDz1bcr2h4BhJ/n3bru8iKzVXG8z/yaFV
	LAuH89RbdTT97ePMBDMbcGqgxSVG0ox+I+ckPi8zqeH+OjREBbHDtPt0dcmHVA/pYO7W
X-Gm-Gg: AR+sD10hXHX/Le5MYizKfprQkvt+2u9duLcQJKsfMkt0W8RXizT8N+S7jLFDtNr224a
	jxLD0a86/gc1e4pPccJdOBc2P5hYabHjngyOy1ZpI/Kgsv7KXrwh25ub/kjqQMS5yed8FFfxWxm
	WzURdS1jBfzNaoqs6QwWEWKBc+k7i69Z4c7HLSbLbVMI8PW99WA/HLq7T2runDDStpmiPl0fE4q
	ysGAUDYVxU29Mc5aIU/fMkycswhMSCpEoOorbgjh3I5JGhckqTV8edRSNLuLItWG6JQoj9CkUGq
	KYKDo84Vt1z3p2RiT95cB0c3G781Z7TVZzY6sCDRz+7lxzvRe1WieafOxLmIF0+8mvTbtrgR1ZY
	Va3j2CxptYAjDnPau5fdaXhVtBx7PhCqBInNK8N6luw+9xPSB6MzSYYx2zXNhGA4Kj0oLKZtQcq
	wKqs2rcMSSTnWjO4pLl8dHTiS0RB65WzwIGU/8huiz5+qdHd9beHDbCsuXMPaDlZNuHqXsSfTEm
	x3kd+fYJnxcR4xR8geT1eTkM0EeluNKuBvKQsGm8/ZmMpJpWyhMVUZ7RosmFwwjvC3nrlNm
X-Received: by 2002:a05:600c:3494:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49ce57ee273mr106063775e9.6.1788361018773;
        Wed, 02 Sep 2026 07:56:58 -0700 (PDT)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm61084215e9.1.2026.09.02.07.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:56:57 -0700 (PDT)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Sergey Zagursky <gvozdoder@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Wed,  2 Sep 2026 15:54:39 +0100
Message-ID: <20260902145440.1786297-1-gvozdoder@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU
bridge driver") the internal camera no longer works on laptops where the
sensor sits behind an IVSC, for example a Dell XPS 16 9640 (IPU6,
INTC10CF, ov02c10):

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras
  ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: mei-csi probed
      without device fwnode!

No sensor subdevice is registered, the media graph has no sensor entity
and userspace finds no camera at all.

ipu_bridge_get_ivsc_csi_dev() first looks for the platform device named
"intel_vsc" and returns its mei-csi child. That device is created by
mei_vsc, which on this machine only appears once the LJCA USB bridge and
its SPI controller have probed, about a second after the IPU6 probe that
runs the bridge:

  07:59:29.297  platform INTC10CF:00 created (ACPI scan)
  07:59:41      intel-ipu6 probe -> ipu_bridge_init()
  07:59:42.391  platform intel_vsc created (mei_vsc)

The commit above added two fallbacks for CVS which match on the ACPI
companion alone. They are reached for every entry of ivsc_acpi_ids[],
IVSC IDs included. The IVSC ACPI device has two physical nodes:

  INTC10CF:00/physical_node  -> platform/INTC10CF:00  (no driver bound)
  INTC10CF:00/physical_node1 -> platform/intel_vsc    (mei_vsc)

so bus_find_device_by_acpi_dev(&platform_bus_type, adev) returns the bare
platform device. ipu_bridge_instantiate_ivsc() then attaches the IVSC
software node to that device instead of to the mei-csi client, the bridge
reports success, and the probe is never retried. mei_csi later probes
without a fwnode, the CSI-2 link is never described, and the sensor ACPI
device, which has an honoured _DEP on the IVSC device, is never
enumerated.

Before those fallbacks existed the lookup returned NULL here, the bridge
failed with -ENODEV and the probe was retried once the IVSC device had
shown up.

Restrict the two fallbacks to the CVS IDs. CVS binds a driver to the ACPI
device itself, so matching on the companion is unambiguous there.

Fixes: c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU bridge driver")
Link: https://lore.kernel.org/linux-media/20260901194526.6369-1-gvozdoder@gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Sergey Zagursky <gvozdoder@gmail.com>
---
Changes since v1:
- Wrap the ACPI ID match in a named helper, ipu_bridge_is_cvs_dev(), so the
  polarity is readable at the call site. acpi_match_device_ids() returns 0
  on a match, which made the v1 condition easy to misread. No functional
  change.

v1: https://lore.kernel.org/linux-media/20260901195036.7648-1-gvozdoder@gmail.com/

The functional testing below was done with v1 on the affected machine (Dell
XPS 16 9640, IPU6 + IVSC + ov02c10) on top of 7.2.2, where
drivers/media/pci/intel/ipu-bridge.c is byte-identical to v7.2. v2 changes
only how the same condition is spelled, so I rebuilt it but did not boot it
again. Without the patch libcamera finds no camera at all; with it:

  $ cam -l
  1: Internal front camera (\_SB_.PC00.LNK1)

  $ cam -c1 --capture=5
  202.794954 (30.05 fps) cam0-stream0 seq: 000003 bytesused: 8386560
  202.828224 (30.06 fps) cam0-stream0 seq: 000004 bytesused: 8386560

The media graph gains the entities that were missing:

  - entity 349: Intel IVSC CSI (2 pads, 2 links, 0 routes)
  - entity 368: ov02c10 21-0036 (1 pad, 1 link, 0 routes)

and the restored retry is visible in dmesg:

  pci 0000:00:05.0: deferred probe pending: intel-ipu6: IPU6 bridge init failed
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras

"mei-csi probed without device fwnode!" is gone, ov02c10 binds to
i2c-OVTI02C1:00, and eight v4l-subdev nodes appear.

This patch is against v7.3-rc1. The version tested on 7.2.2 is the same
change without the INTC10FA entry, which 7.2.x does not have. Building
drivers/media/pci/intel/ipu-bridge.c with W=1 produces no new warnings.

Not covered: v2 itself is only compile-tested (no new warnings with W=1);
I have no CVS hardware, so the CVS path is only reasoned about, not tested;
and I have not booted v7.3-rc1 itself.

This patch was produced with the help of an AI coding assistant; see the
Assisted-by tag above and Documentation/process/generated-content.rst.

 drivers/media/pci/intel/ipu-bridge.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..a29d4bdb8f02 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -232,6 +232,20 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC10FA" }, /* NVL */
 };
 
+/* The subset of ivsc_acpi_ids[] which are CVS, rather than IVSC, devices. */
+static const struct acpi_device_id cvs_acpi_ids[] = {
+	{ "INTC10DE" }, /* LNL */
+	{ "INTC10E0" }, /* ARL */
+	{ "INTC10E1" }, /* PTL */
+	{ "INTC10FA" }, /* NVL */
+	{ }
+};
+
+static bool ipu_bridge_is_cvs_dev(struct acpi_device *adev)
+{
+	return !acpi_match_device_ids(adev, cvs_acpi_ids);
+}
+
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
 {
 	unsigned int i;
@@ -283,6 +297,17 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
 		return csi_dev;
 	}
 
+	/*
+	 * The lookups below match on the ACPI companion alone. That is fine for
+	 * CVS, which binds a driver to that very device, but not for IVSC: there
+	 * the ACPI device also has a driverless platform device, which would be
+	 * returned instead of the mei-csi client. Return NULL for IVSC so that
+	 * the caller fails and the probe is retried once the IVSC device shows
+	 * up.
+	 */
+	if (!ipu_bridge_is_cvs_dev(adev))
+		return NULL;
+
 	/* Try to locate CVS device on the I2C bus */
 	csi_dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
 	if (csi_dev)
-- 
2.55.0

