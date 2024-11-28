Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E76F2F2
	for <regressions@lists.linux.dev>; Thu, 28 Nov 2024 03:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732764309; cv=none; b=kbW5Y6e2NHLs4gwqZag9pxaiMJxN2w3+ZanpjP85J71fDYaB4vkoYCM6qR3gFvUDMk0qGe+W7piQEGsygY5C6RPhj3vkG1PVMYfCYHRWOzksN2NApbdQcwWCfCncoiT4/RuUNie/eEkZ/AGpk7DaGmUdVdzef8DXDZBjaOYtXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732764309; c=relaxed/simple;
	bh=ZQ+mmZy7wN9T1VM98lQ76O17LVrc1NXFHB7fmFPwqcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQVps1pTYFOed/EJmr9gwRYxAaxXAqnQyQFTFm5S4jzVVKZeUqkkI30XW1xQQ1JGrWinxn0Yw4zTwe80lDbaAoZxuXIljaX/E7O4MA+gFPk77M5ma02CckUSlnprjWDz+rov+EJfBldnm5qvsv6JQrJSyMD8IH+Fl/T2pLoIMWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XECOsdnI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XECOsdnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78907C4CECC;
	Thu, 28 Nov 2024 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732764309;
	bh=ZQ+mmZy7wN9T1VM98lQ76O17LVrc1NXFHB7fmFPwqcM=;
	h=From:To:Cc:Subject:Date:From;
	b=XECOsdnIkibVIGSwVBosr5FdSJ7M+VipHfjVVYRWyYjjRmddg9zqfe+gPwzIPWQDL
	 HYOk+QFY0pCT7WlfccptluX7XRD0Ax+gQmYSRl152CNhrEuezIxTH2Csvsrt5AsUa9
	 D1yoXuCMvWFktQ037mSaoUx0r+Jm4rDAQs1vjJZ+Vhvu1W5P3Qt/jUdA5MFFtzm6op
	 oJ23o2TxURE40k8pZ4OTez5gQVswkEWQx1Wr1trDSkJbLlEu1oxcPu7nk23SSJzCDg
	 Vetf9ZZoU3cBKLuHOf8K0wJz/XGMQWvdbnFmAYwsQTeqH2yayFvjlN19fkM/hasByx
	 upz5Lfy+td8oQ==
From: Mario Limonciello <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org
Cc: alex.hung@amd.com,
	regressions@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
	Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: [PATCH] drm/amd: Sanity check the ACPI EDID
Date: Wed, 27 Nov 2024 21:25:00 -0600
Message-ID: <20241128032500.2088288-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

An HP Pavilion Aero Laptop 13-be0xxx/8916 has an ACPI EDID, but using
it is causing corruption. It's got illogical values of not specifying
a digital interface. Sanity check the ACPI EDID to avoid tripping such
problems.

Suggested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reported-and-tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3782
Fixes: c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if available for eDP")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index b0fea0856866d..6cbbb71d752be 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -907,14 +907,14 @@ dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
 	struct drm_connector *connector = data;
 	struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
 	unsigned char start = block * EDID_LENGTH;
-	void *edid;
+	struct edid *edid;
 	int r;
 
 	if (!acpidev)
 		return -ENODEV;
 
 	/* fetch the entire edid from BIOS */
-	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, (void *)&edid);
 	if (r < 0) {
 		drm_dbg(connector->dev, "Failed to get EDID from ACPI: %d\n", r);
 		return r;
@@ -924,7 +924,14 @@ dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, size_t len)
 		goto cleanup;
 	}
 
-	memcpy(buf, edid + start, len);
+	/* sanity check */
+	if (edid->revision < 4 || !(edid->input & DRM_EDID_INPUT_DIGITAL) ||
+	    (edid->input & DRM_EDID_DIGITAL_TYPE_MASK) == DRM_EDID_DIGITAL_TYPE_UNDEF) {
+		r = -EINVAL;
+		goto cleanup;
+	}
+
+	memcpy(buf, (void *)edid + start, len);
 	r = 0;
 
 cleanup:
-- 
2.43.0

