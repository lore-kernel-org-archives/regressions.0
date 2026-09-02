Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696EC40926C
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 21:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383795; cv=none; b=ilWj+JpjaslGf4Bm0ItGToB5dAvv671NXjAH5p8eiEZr7/mNdmM6dDs498B4L+5xpD1FLgAQYVU2NphWYjIHndWyHMLCO2ltbWcRmsK/nGnOvElV5S+E2dgHp3hFK46ak9/KL4TA3g8bOd2fluGnHOgVzGtNdaUHzORt42e/mDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383795; c=relaxed/simple;
	bh=wfnSJYezHVptWVeIUjof3zlv6RSwe2Fg37Z2C7ov+lY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSrGHd5f9wfTdaFsh9TFuuh63wo+ghc/z1a/vEslZk9gOp/JbQDXrGBQvblQtbqks9jdwZMtEY6ZqVI+EmLlJNWYvxm3wi99fbBY2Q9iqSShAWiNcTMK+r6GVU/fHLhsad9Ki9rIxdUAju3Ux77m4REzTQhihp+KbCgSLAdQoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5NM5K2O; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5NM5K2O"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49557167508so15834385e9.1
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788383787; x=1788988587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FbcCt4oC+dx3pyx/2hfw60zNfjrZFxgpFIvEM7YZ4k=;
        b=o5NM5K2OEpuFnFxxlKFCKV/A4Uh/+WkZlQ4BaJgc1Nfz2QhegHsxBixe6qnK2VypAS
         tb9QiSbDsrD+iS2FQkeG6i0BsiELfPifK0/PPNYQHh75PMBwyU3qBi+mithgfptX5MqY
         0iFupJo6MWUvOXuZljxOI2rtnITSEWJSbGpMudcfju7xikjk0V12HmzVy45nlzheXwAi
         C5KqBcHbwH1wFPNBZZt9st4T1anRPSCmagECOHJ7IP3R8zuU0S9b8a/dQqUsiO2gmn58
         6y24yqy55bWYV5F5dPPvEjP5mYliR9PBJGGWkX1/XOfXjMjogT4kfJOiYA/TouIUHYk7
         xEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788383787; x=1788988587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2FbcCt4oC+dx3pyx/2hfw60zNfjrZFxgpFIvEM7YZ4k=;
        b=mw7g4rJ+FPN5NmnEnLlc6c71ammuZMyRhfGXr2mLblPkXqTUTryAMfCsbDRSTQQCOf
         5shEVR3MvyiVwrc7bYdBWpbPUfz0s4bJF2Be3PtyW5SIeip1/hdXL8aIkFZ+9PY7Ohqw
         Sdc888XKhsjnOFl6SCu974DlJVbepEgm0l7XayYlT3P+JpmdmBQE1jIT41bw+OYy2rEE
         q+Bf3GeS/He8irrak9gpTUSkL9NfR1LGQRDpMFgymDbeKnBLy5nwADExZEvxx/WOPVxI
         kRt4YwDO8muyiFflX8cLbypu3L91XN0A+VLiUKWZ1oPK2ONgqGU41GuF40t1MdMDIgmi
         sHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOmvoV4hRAx4cAfvWZT00YlpAa5g/WGgJZC+wxtb0aYQiuWNHbdA2syuqEB43GZ/TssHp5J9e2emR5ZA==@lists.linux.dev
X-Gm-Message-State: AFuF++n1h6DIbVzMd67538XlEM0CRk3O+ZAsYIDnHs/0KnmuSLVHJgth
	LjK55b5qtjstttr6DMsETLG8SPZGYmqmWGVfp3E9yCFq3qx3084Oe2U=
X-Gm-Gg: AYBFou1CvcRGt6FzAlYJvWu6vtSo202rAHPiPwDu7UMuIhl6EeGtDsJz4UiWTHu6y4r
	onItADKeaNHe9lzEFLY22VKqJU2B9uSDVw0OoZwN63jtCsk/BSDPVd8W02pn07tUSWJA9P15Ytd
	hRArMtnbkLiiAPlvnex/3DcSo5jQB0BE+45Zh5FKNMyeyScjWLNXFmw7XX3eLe+GxjBFLrkvxvk
	aR/e9E05k7T9MHyMUO/NJCkWLBfW4VuipqjgMBThXk1zvmDE+CgVuG2aU+dFhtdVkg/ACRKlLmD
	Fj0pM+2naJNZ04zOp2/Bj/eksmTA4vH3HLCXmCAWynMN0j+narA3DUWJkPoZlXX71RKCnyDdJ8w
	QVGmZmFglVQ/4JQhJYg21Mz4BGu3DRTqlNXxpFR62C6zoZaL4uKminxn8rIzFKhS4TMdOFzKqyC
	lxwvvAFgzNp5/JbSRzbnzZrQhPpSfk6qKUfP28st01MY7+SbzmLnlLd9PFFYFQjz6CMxMstxKfg
	HJFLc6+6lk0Ic7lnkcW8JfRIjzrgNlGvqWgD6i4PZ8oenC7LbKE3LhEz2dVA12KXOaP8XGznYfL
	kouW/hQR
X-Received: by 2002:a05:600c:699b:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49ce584c6femr140872125e9.15.1788383786582;
        Wed, 02 Sep 2026 14:16:26 -0700 (PDT)
Received: from chateau.lan ([2001:818:e240:a500:b099:b999:e510:5bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d4938sm19143335e9.2.2026.09.02.14.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:16:23 -0700 (PDT)
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
Subject: [PATCH v3] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Wed,  2 Sep 2026 22:15:24 +0100
Message-ID: <20260902211524.5572-1-gvozdoder@gmail.com>
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

Skip those fallbacks for IVSC devices, keying on the IVSC IDs rather than
the CVS ones: new CVS IDs keep being added, whereas the IVSC list is
complete. CVS binds a driver to the ACPI device itself, so matching on the
companion stays unambiguous there.

Fixes: c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU bridge driver")
Link: https://lore.kernel.org/linux-media/20260901194526.6369-1-gvozdoder@gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Sergey Zagursky <gvozdoder@gmail.com>
---
Changes since v2:
- Match the IVSC IDs rather than the CVS ones, as Sakari suggested: new CVS
  IDs keep being added (INTC10FA arrived after v7.2), whereas the IVSC list
  is complete, so keying on IVSC does not rot.
- Drop the ipu_bridge_is_cvs_dev() helper introduced in v2 and go back to
  the flat condition of v1.

Changes since v1:
- v2 wrapped the ACPI ID match in a helper for readability. Superseded by
  the above.

Not addressed here: separating the CVS and IVSC parsing so that no CVS
fallback is needed at all. That looks like a separate series rather than
part of this fix.

v1: https://lore.kernel.org/linux-media/20260901195036.7648-1-gvozdoder@gmail.com/
v2: https://lore.kernel.org/linux-media/20260902145440.1786297-1-gvozdoder@gmail.com/

The functional testing below was done with v1 on the affected machine (Dell
XPS 16 9640, IPU6 + IVSC + ov02c10) on top of 7.2.2, where
drivers/media/pci/intel/ipu-bridge.c is byte-identical to v7.2. v3 changes
which ID list the condition keys on, so it was rebuilt and booted again on
the same machine with the same results. Without the patch libcamera finds
no camera at all; with it:

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
change; 7.2.x has no INTC10FA in ivsc_acpi_ids[], which does not affect the
IVSC list this patch adds. Building with W=1 produces no new warnings.

Not covered: I have no CVS hardware, so the CVS path is only reasoned
about, not tested, and I have not booted v7.3-rc1 itself.

This patch was produced with the help of an AI coding assistant; see the
Assisted-by tag above and Documentation/process/generated-content.rst.

 drivers/media/pci/intel/ipu-bridge.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..bd64c0400c0d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -232,6 +232,19 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC10FA" }, /* NVL */
 };
 
+/*
+ * The subset of ivsc_acpi_ids[] which are IVSC, rather than CVS, devices. The
+ * CVS IDs are deliberately not listed here: new ones keep being added, whereas
+ * this list is complete.
+ */
+static const struct acpi_device_id ivsc_only_acpi_ids[] = {
+	{ "INTC1059" },
+	{ "INTC1095" },
+	{ "INTC100A" },
+	{ "INTC10CF" },
+	{ }
+};
+
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
 {
 	unsigned int i;
@@ -283,6 +296,17 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
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
+	if (!acpi_match_device_ids(adev, ivsc_only_acpi_ids))
+		return NULL;
+
 	/* Try to locate CVS device on the I2C bus */
 	csi_dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
 	if (csi_dev)
-- 
2.55.0

