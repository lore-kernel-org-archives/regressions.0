Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776883;
	b=WLWzt87ru8m2eQ/vuQbIJACFV/23m66X5Q4IBfhlbhjrBR8xuiklAarRiXRpdi42J4cF
	 /szz53RsTbyxBaBNJDSJfn2uHGQtzYUbGzgBnwk70e9uXcU5aTh1y2ZTbihFUcssVnfmV
	 HMsrcHNRMcwm5WKr2YOsLfHKuuPTzsunQHqQu4fwcA3QfVRTeZVFnRzesdFTX9pKYJbte
	 5kQDZWGiKjH7ZnSsq9VMAjE88KJTaVK8fQSTm8FAm33+YafzAlltIQNhybYXe6/CF3fdw
	 2VmehRBC38D47wMQZR5EmH4KESPHBM5CRQOdv40P1CSBLml2n7Ps5F7m2mVVJmQlOTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
	b=xKU5Yc2eZ8njbTiPhT3cACT5GDvafNy/IIN558+kQ/gm+OvP4/MyPG5V1gq7wOnDBjxZ
	 0w+2pfQQIF1Vqfy8xarhdoWbgGb3QC8pwVT6JpdD6mq2RrEN3q7Gd7N/1VsVuUOBmO9o1
	 Hc5NcNF30/xjZKivuA9rQIzOa1X5ivtRCEWnWO4TD6V0BChQF94n/G0Ha+faj5TXkiODk
	 wuZ8Odkr352iKgFzXnPZ145UKguUsydB9Co9G2XKkY0k+JbPISN+PTGnpqPRgnPGDBkXG
	 gjF4bEse2BTapi01atKqzLpZhnBr6LjBOPv9xsvmSt/lEm+VMj7OaA4PbRyf4oOpJxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCEDLckO;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E97606D813
	for <regressions@lists.linux.dev>; Wed,  4 Nov 2026 07:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E97606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCEDLckO
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e942864693so2120825ad.1
        for <regressions@lists.linux.dev>; Tue, 03 Nov 2026 23:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793776883; x=1794381683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
        b=xCEDLckOMTYHkUgtC2eVsShtFDwLp/0lvMTcM952CoMZ/lJLqbKJe/CsN8f/4WqigL
         uPuenLTr1nZbX3cOMR+4NlKblqcj+lUX1gBehg+7HvhiBKUhPmfn5bH0r9Xmv7gk8I+X
         UKkRC0Ekg7NzWJGaJPkXhBrMB70jXarfoIfvbojoIx/5RW1tUgAPvceBmRXUo7nw5HuS
         vFz+Vj5ullPGTkjnDnQLdaLL+cg3FfCYKUvU6rh1ZNMfh0WszFK30Uq/Yz7DtRvYe6mB
         /TY2Bc+pFMlO/0DbwA7pnZf8nu+GsIC2YhvQjFOKZ0k30rKyk49ZDtz8F0nf6mQ3nSrQ
         lRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776883; x=1794381683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWUgScfm6w4+IrfkuhBQdFNaFEhNCbHPUn0mlOI8xXo=;
        b=BYccU1voYAf9iTy3PEsmlQQ7JdvgIOGMvyJhpTwud3fBeD6liUOtLKRu0+vczBsVjV
         gla65HQw8RldE/rYahZHsG1qnrEidloIFkzuocl/cn6yo2RACQ+qlla8wmsIiOnuNGgf
         WTaEQU+hDwcRAyFxc4iE3eXDzQpLscqP46Qkx+Njq+FIWaw4p0GZHXJmnqu4CpAHRAiR
         7ebYH1SLLcAcaw6DAgKDrARJe2lrAZTg7dWxRH/trXywTCKH6EhlpoghHvrPVWJc3cBA
         sSgUNFXnzyff4RZUp0dFfaKIgPYd75kWU8+5TeE07PqelMS+cH3aLWpztHoqZ6LRLpoi
         P0Yw==
X-Forwarded-Encrypted: i=1; AKwUvBwc3SKrzLS0vR8lWQxG31zszsSg92TR63bBXyMvnbiNRkxT9qmaRYjIIXQwt+QJ6XxmTwr9YyAgP/S82Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8TyRpxzImHA1CMCgTQnFwCExT3M6B3GFI/Tpf7wpeNJUQeDj3F
	+QrLEZNdNFIPY9qM8nJyMrTrkeAiA99IFRxMQct6STwImSjT5xg9mC4=
X-Gm-Gg: AYBFou2S2o8CwudrvT5RnZbaaAGl5lslywP8oIBs+6S/S01I28HzOWc+/srPqBAon0x
	MSycCv4lCRm99WhHj0/B2znDtgd877AhWSytSqGQS85IAp0x0AYT1szcEaOAUjqmNDQNIpHs7cR
	oqJx28nP0kJuDdkdObS6S0mDRZmcf1AKzwbNnIpORN0U3aryrTs1cy/mR4cK2BA4xXu/KF9RMxH
	48l77Xlgu58878RjBVwEyw9vEEjmbuRQCG3f8yhjU9e90HLfMeAOTmd5K5hSy2/ACtt1dB96t61
	hGfy/OJUENj8uzDkfSGfgN/5rUJN7HwKm0w7RZUjk3CO/6pNBb/7dc6YsfWSlW7VbdkHBNsVofW
	Ea8bDRrv/t5ti4PhZ42h7vfLF7qkFE0r0DxGoYPiz+oeHLPayzxOxeNHOc1LrhCvyd8GTaysZDT
	ff3ln/+vxVwjLvze7iHPrIazbXp40PzA+ZyU7jQY+b8r3aptnvIC5eBPxy1l5wYHfHTEeF4yuaS
	Mfn6ZQnqq5kTyF6D52ckyi+60rryIVpSh34ReRj3rZVUTYAkFoGiEDKHluHwV2OrvH292yx764p
	CkfOeKtFvuTmbbYxW504RCMm1wKgJwFXyor3AAc/H0JfOwZwTGYCUUziG42s4DhVLk2F
X-Received: by 2002:a17:902:d2cd:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2eb364f8fe2mr149925825ad.51.1793776882756;
        Tue, 03 Nov 2026 23:21:22 -0800 (PST)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0906c514sm3950345ad.29.2026.11.03.23.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:21:22 -0800 (PST)
From: Burke Cates <burke.cates@gmail.com>
To: robin.clark@oss.qualcomm.com,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Xilin Wu <sophon@radxa.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
Date: Tue,  3 Nov 2026 23:20:48 -0800
Message-ID: <20261104072048.3486286-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1bda647ce61b ("drm/msm/dp: move link-level teardown from
display_disable to display_unprepare") moved msm_dp_ctrl_off_link() and
the PHY exit into msm_dp_display_unprepare(). Unlike
msm_dp_display_disable(), that function does not check power_on.

When link training fails, msm_dp_ctrl_on_link() has already turned the
link clocks and the PHY off, and .atomic_enable() returns with power_on
still false. The next disable now runs msm_dp_ctrl_off_link() anyway,
which writes REG_DP_MAINLINK_CTRL and pulses DP_SW_RESET with the link
clocks off. On an ASUS Zenbook A16 (Glymur, eDP) the SoC then resets.

Skip the link teardown when power_on is false, as before that commit,
but still drop the runtime PM reference.

Tested on the A16 by forcing link training to fail and then blanking
the display: the SoC reset 2/2 times without this patch and 0/3 with
it.

Fixes: 1bda647ce61b ("drm/msm/dp: move link-level teardown from display_disable to display_unprepare")
Signed-off-by: Burke Cates <burke.cates@gmail.com>
---

Notes:
    Test base: v7.4-rc1 with out-of-tree Glymur platform, board and eDP
    PHY patches; drivers/gpu/drm/msm/dp as in v7.4-rc1 plus a local
    knob that fails every training attempt. The reset is silent (no
    pstore), so which of the two accesses triggers it is not known.
    
    As before 1bda647ce61b, a failure after successful training still
    leaves the link up. Xilin Wu's hdr10 v2 09/20 handles these paths
    more generally; this is the minimal fix for -rc. Happy to test his
    approach instead.
    https://lore.kernel.org/all/20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com/
    
    The bug was found and this patch drafted with an AI coding
    assistant (Claude Code, Claude Opus 5.5); I reviewed it and ran the
    tests.

 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..76784cc45228 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1528,6 +1528,14 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	/*
+	 * Failed link training leaves the link clocks off. Avoid accessing
+	 * link registers after a failed enable, but still release the
+	 * runtime-PM reference below.
+	 */
+	if (!msm_dp_display->power_on)
+		goto out;
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1542,6 +1550,7 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 
 	msm_dp_display->power_on = false;
 
+out:
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0

