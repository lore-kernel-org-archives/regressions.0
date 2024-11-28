Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430113211A
	for <regressions@lists.linux.dev>; Thu, 28 Nov 2024 03:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732764152; cv=none; b=uHRDUdNZvxz96TRLuuNU8S0d40Sye/eYBsdoIjHowknEZNTmbLvLkQ6XVZ2gc5r6mrT3wkTQ5ETPyaKFl1wWFxoAs/fBXxgLi3iRuPP4sX448daVk0xjJjYfTUmLH31bg1j3BrJjo+aWwYR8/yq7YbE8krOzbeKqC8Pd5WOCSgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732764152; c=relaxed/simple;
	bh=JFWON1a1gwL/eNqi9PJoN9/0QX8IdvNZQuFcTh7vx1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luOj0vmcI2vwTcrPm1KutDn4MLTC8P3ilHXuT1mqHys4BSRU9HN5e9Qbxbyi1A9WutAeICcutX9krEBtqNI9wdau4dgRAbSlT3rjv5R+oOSvfZWtLZMKlWe4qWCrj5wCswQf5yAu5UQ5ltUC9QWNmXCbDtfQ9rvoTtBXcApqySo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysh+Y2ZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysh+Y2ZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9378C4CECC;
	Thu, 28 Nov 2024 03:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732764152;
	bh=JFWON1a1gwL/eNqi9PJoN9/0QX8IdvNZQuFcTh7vx1c=;
	h=From:To:Cc:Subject:Date:From;
	b=Ysh+Y2ZC5Cb9l50PHjHtB4R9cp8A0l/BBR/4R9J2p07l0MmBdbZB2FVLlmm8DMHYP
	 FnmJDqnJYFnJ4shCuTZQC/FTn1i9D8cS225GXfZJ/FHYpabIw5uaHMEGoPf2xP+rXs
	 QhnZfbzpwNv7v3kIVGD3zUq7pDaoeB1tXBGjmKk3dCH1SjTeWk0cDtedeYnISN2+Hy
	 6IdN7j9ctWDKAPJ6L2SeFU968JEMHsIIcsVxv+PrAyc5aGWqnHyBVhV/hXTJ5IMJsD
	 3tU8PWBmUe38I6iEcTQLtNHlstgia6L7rzKCjhJydSaplCbdqR4T+G5xenic5shyqM
	 c6TkJXO/9JVgw==
From: Mario Limonciello <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org
Cc: Kaitlyn.Tse@amd.com,
	nicholas.kazlauskas@amd.com,
	zaeem.mohamed@amd.com,
	daniel.wheeler@amd.com,
	harry.wentland@amd.com,
	regressions@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH] drm/amd/display: Fix programming backlight on OLED panels
Date: Wed, 27 Nov 2024 21:22:00 -0600
Message-ID: <20241128032200.2085398-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

commit 38077562e0594 ("drm/amd/display: Implement new
backlight_level_params structure") adjusted DC core to require
the backlight type to be programmed in the dc link when changing
brightness.  This isn't initialized in amdgpu_dm for OLED panels
though which broke brightness.

Explicitly initialize when aux support is enabled.

Reported-and-tested-by: Luke Jones <luke@ljones.dev>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3792
Fixes: 38077562e059 ("drm/amd/display: Implement new backlight_level_params structure")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 19a58630e7740..243cee2841312 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3483,6 +3483,8 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 		caps->aux_support = false;
 	else if (amdgpu_backlight == 1)
 		caps->aux_support = true;
+	if (caps->aux_support)
+		aconnector->dc_link->backlight_control_type = BACKLIGHT_CONTROL_AMD_AUX;
 
 	luminance_range = &conn_base->display_info.luminance_range;
 
-- 
2.43.0

