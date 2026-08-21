Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBBD438470
	for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300474; cv=none; b=n2erPAXIvXc1NILIdr2cCdED6vdHn8F5S5Id6GkseRXRjyi8mkXeBLfmH0Fm487tyc8OWnqT7v9iFnqe02sT47cT6Aj2kpH1QPnRpmrWCewvBcl33JUhS7+AdcGy8xpF4lx1/PzHtv8RkUhp+1wbqimi4oA+KFQ1Ggys1lN2sgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300474; c=relaxed/simple;
	bh=qHCCnpjIvfzg9V5+zQYUaUwK51/+s8Z2yVhiYOm040M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXJE5gadhfRMfdz/CFPvIxzFjfnvtw+Ls3bPVm7QQRZq/ALyDs1aJEIYeDpPIeOn42tFoIkUKwHxvui+hRDdaUNt5+6VXQMcjZ4kPh9vH+RkbdkBN4UsDkJ+Ca9ltVpt0XLYWZwWNo8LVkNRPJ7QFoxvXBYVMDdvdfwjyqvhOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=holtechnik.com; spf=pass smtp.mailfrom=holtechnik.com; dkim=pass (1024-bit key) header.d=holtechnik.com header.i=@holtechnik.com header.b=dzCGE+zj; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=holtechnik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=holtechnik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=holtechnik.com header.i=@holtechnik.com header.b="dzCGE+zj"
Received: from localhost.localdomain (192-184-175-24.fiber.dynamic.sonic.net [192.184.175.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: phollinsky@holtechnik.com)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 68BDA485B86;
	Fri, 21 Aug 2026 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=holtechnik.com;
	s=default; t=1787300047;
	bh=Jnc3bKG1dNqdc4K0sUeMIAQ7ScdNJT1I7FHb0MA7Tqw=;
	h=From:To:Cc:Subject:Date;
	b=dzCGE+zjBYCD8+R9WQp8UqXcSKuoXFg/yBUbeZtOYvy5Ha7kEQbO2MpEX4kzetxTh
	 +a62ci+g7BVPZwhS3Ni0n5IeBrEbSGgB+girpOe75RDZeTRCkxo968buL4DeVhOIP/
	 y23v+aS1pAkmfc1mQVsCJ+HNrnjWayAauDuhodOs=
From: Paul Hollinsky <phollinsky@holtechnik.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konradybcio@gmail.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Paul Hollinsky <phollinsky@holtechnik.com>
Subject: [PATCH] drm/msm/adreno: Only check for PAS when a zap shader is present
Date: Fri, 21 Aug 2026 01:13:25 -0700
Message-ID: <20260821081325.89088-1-phollinsky@holtechnik.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs") replaced
the qcom_scm_is_available() check in adreno_zap_shader_load() with
qcom_pas_is_available(). These are not equivalent: the former reports
whether the SCM transport is up, the latter whether the TrustZone
firmware implements the peripheral authentication service.

On SC7180 Chromebooks (trogdor) TZ does not implement PAS at all. SCM
call-availability queries return 0 for every PAS command while other
services answer normally:

  svc 0x06 cmd 0x01 IS_CALL_AVAIL    -> 1
  svc 0x02 cmd 0x01 PAS_INIT_IMAGE   -> 0
  svc 0x02 cmd 0x05 PAS_AUTH_RESET   -> 0
  svc 0x02 cmd 0x07 PAS_IS_SUPPORTED -> 0
  svc 0x0c cmd 0x16 MP_ASSIGN        -> 1
  svc 0x05 cmd 0x01 IO_READ          -> 1

so qcom_scm_probe() never registers a PAS backend and
qcom_pas_is_available() is false for the lifetime of the boot.

That on its own need not matter, because sc7180-trogdor.dtsi does
/delete-node/ &gpu_zap_shader;, and the intended path for such a board
is for zap_shader_load_mdt() to find no zap-shader child, clear
zap_available, return -ENODEV, and let the caller fall back to
SECVID_TRUST_CNTL.

The problem is the ordering. zap_available is a static initialised to
true and is only ever cleared inside zap_shader_load_mdt(), but
adreno_zap_shader_load() consults PAS before calling it. The discovery
that decides whether a zap shader is needed at all can therefore never
run, the flag is never cleared, and every call returns -EPROBE_DEFER:

  adreno 5000000.gpu: [drm:adreno_zap_shader_load] *ERROR* PAS is not available
  msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu hw init failed: -517

Nothing retries that deferral, either. adreno_zap_shader_load() is
called from a6xx_hw_init() rather than from probe, so the -EPROBE_DEFER
is not a probe return value: it propagates up until adreno_load_gpu()
returns NULL. load_gpu() re-attempts on every DRM open while priv->gpu
is NULL, each open fails identically, and PAS cannot become available in
between - which is why the error repeats and userspace stays on
llvmpipe.

Move the availability check into zap_shader_load_mdt(), behind the
zap-shader node lookup, so the driver only consults PAS once it knows it
needs PAS. Boards with no zap-shader node take the intended -ENODEV
fallback without ever asking, and boards that do have one keep the
qcom_pas_is_available() gate.

Fixes: 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs")
Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
---
Reported and analysed in:
https://lore.kernel.org/linux-arm-msm/20260808034716.58888-1-phollinsky@holtechnik.com/
Konrad agreed with this shape in
https://lore.kernel.org/linux-arm-msm/b63e93e4-2f4c-4cad-b726-e1b0565379d7@gmail.com/

0be72be03ca7 landed in mainline during the v7.3 merge window (via the
soc-drivers-7.3 pull), so this is based on Linus' tree. Note that
msm-fixes and msm-next both still predate it as I write this, so it
needs a base that includes the merge window; happy to respin against
whatever base you prefer, and it can equally go via the qcom tree the
culprit came through.

Tested on a Lenovo IdeaPad Duet 3 (sc7180-trogdor-wormdingler) on
next-20260805, which carries the same code: with this applied the GPU
initialises and logs "Zap shader not enabled - using SECVID_TRUST_CNTL
instead", and userspace gets a6xx rather than llvmpipe.

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 489462065ea9..995161215ad5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -52,6 +52,12 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		return -ENODEV;
 	}
 
+	/* We need PAS to be able to load the firmware */
+	if (!qcom_pas_is_available()) {
+		DRM_DEV_ERROR(dev, "PAS is not available\n");
+		return -EPROBE_DEFER;
+	}
+
 	ret = of_reserved_mem_region_to_resource(np, 0, &r);
 	if (ret) {
 		zap_available = false;
@@ -170,18 +176,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct platform_device *pdev = gpu->pdev;
 
 	/* Short cut if we determine the zap shader isn't available/needed */
 	if (!zap_available)
 		return -ENODEV;
 
-	/* We need PAS to be able to load the firmware */
-	if (!qcom_pas_is_available()) {
-		DRM_DEV_ERROR(&pdev->dev, "PAS is not available\n");
-		return -EPROBE_DEFER;
-	}
-
 	return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
 }
 

base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
-- 
2.55.0

