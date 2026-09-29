Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34523ED60
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715551; cv=none; b=d9THxCtzXxhsjogH/kX/lz+t9GAu8zSqttMRqIXLVSBp70ZJ34gRpPFVmymjD+j54gZCFDqgnpcI6pFFwu46l8dFLjSic+CwgkagG+LTNFyZK3uz07URUsZ960R0Vpr8E0qwus/BipXZSaILtH1o54flKxS8skjVCZotvInRfuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715551; c=relaxed/simple;
	bh=Mwg2F7EMxSB9qk8R4KxVgeEsRz7cg25fpzzomRMjgZ0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=fO0EferdhtRWMEyML+F7Psm0asXssEkXXUg1n4YhJ0U45voXloCm/OG7ixwhQn2mVt86sA7j92vv8Fz6KlL/Zlppo+4/Za+xLzVQuTHVri262jTniTWsxmxpVx9Q845ojxp8clAvh+MiwLCwbqN160eQUEoyfZzXbvSXG21eLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=grRrBwIZ; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="grRrBwIZ"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso640047eec.0
        for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790715549; x=1791320349; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QDC6N1i7/WIoTTlW5OifAcXTE45CQVdFc+pyj5FO050=;
        b=grRrBwIZ+DXxp3OiGyIXucGsfJnIffTbM0In+G5CjnlpWKNI6j49NYoHN5XNuTYGiG
         e0LgcJQDpc01vJAk/lQpkWBivq2XySAfo/rjHykU5vZbK8ls+5V4iS4xZTiNdKSfflvA
         mEPLqjgHGDJj2gVTQ56D25fYYOfUdDLB3gJAGTDI/vcsoU/j8rUBvPrXfM4Un0X8AtGo
         JaJXzVZocRhz7sZXSUoCe4Pk/78JRSiYQWpUUGod40aeojFW4uW08tl9RKBaL1xbtM08
         HrbG3TOsDoiCGw5ZpK7V1Q+f9RvrifAm85CWwsz+ZhdW2h8bXyac5AiiKhU21rROAjAu
         r0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715549; x=1791320349;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDC6N1i7/WIoTTlW5OifAcXTE45CQVdFc+pyj5FO050=;
        b=rkSbkExvtPxXlOArv17JSdQ9tqkEcOEkbIqhQtodwdWqKP7dYDRfrLc6yMOr1IsPQx
         yzIa6yAdpPmQk5JRv9HdK83G+Ms57Wg3dDy6Pv2N4TGuMPm8ZA05JInGXft3g0sl122H
         UNwqCrzIPIu+twfUuYOjTPTSZeS1TWZC5Q+UTLVEduqFmJevL4ThWsAbkAE+34Jx2WNw
         eBrrRkAmTRD6mvUzwmnVUXbnWxFKsFvbEOSnGu3DJmN8smcTObi26dFg1slvU5H9zfEC
         SssbVf1WfSyFqNvz2aFPbmJuTmE+SYGkEK4I/t7tly7+gNWQ8RDRKQyPzqVjPOoOhu/b
         MCPg==
X-Gm-Message-State: AFq9FYLGZyZ/gmiLoNsKjO6U0SUQbwf46IFVtZk/xGHWniK6WEuSTJG/
	O5eWiB74ZEdcHLGe8r/jD/r19P3kEk7ixMmwF0WIZ+nZs6GM9dCVmt2Y+8jRwEljJSCldkQzLni
	owDne
X-Gm-Gg: AYBFou2WKX5dglyS0L47iVh5vGhsh6yAFaiSnCqS8wlXKuFCbzSY4qMUKAd5uipRu/2
	V+IKCJLpeHdQTBPXPdRQKjncqxAW55m+fkNzu3D/OKkLEmMhu28ezHYZWsdG+CQyJ2mzaVWH/Kp
	9LOfK0nqg7ZIaUIJyaSRKxGZsWeC1dr4MKS0aqNZ+RsP9KJd+QYr74q4Kzp5ohat7y7zf4PDZpM
	TllV2U51PpPDF96Vt604poJ1aSQm+EDVND+hDogSxT1YHtPxdeNuMZjRePj7GUCTDSorNuhnzZV
	S06q93WpQPhnZ0RZx/PmP/fvvb8qIrWcp+eh3E+fwO6zZV431Qb4esqVxSMRDbnnjkt9HELg+Xv
	myToUy+mP0mMvqn2tKeCypwYRnODjE7Bwj2Ch1kH5Y1I9eqrB5b8kp0aMcKcdNLX9tSWmpmZsmH
	TIxbSyKTtWyG0dAjJ0MJQoo6Qod/4kODnOvveX6V1/fuoot2+gNo9cmMC2lCUqX4Q=
X-Received: by 2002:a05:693c:4092:b0:347:3f58:8e34 with SMTP id 5a478bee46e88-34c6568725emr722571eec.38.1790715548527;
        Tue, 29 Sep 2026 13:59:08 -0700 (PDT)
Received: from 5a6d9a2c18a2 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bea1bbsm1439218eec.23.2026.09.29.13.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)stack frame size (3120) exceeds
 limit
 (3072) in 'dml_core_mode_prog...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 29 Sep 2026 20:59:07 -0000
Message-ID: <179071554396.61691.9694528946845866461@kernelci.org>

New build issue found on mainline/master:

---
stack frame size (3120) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (3120) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
 10513 | static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
       |             ^
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179071554396.61691.9694528946845866461@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:c442def18583faac8c1d29491493caaae38c9f93
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  6f8319e3e9a44dd537d17f41565a8453c560a581

# Builds where the incident occurred:

## x86_64_defconfig+allmodconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6abbcedb5ec73975aaff067c

#regzbot introduced: 104484baf7484266fa0cb8b26362b105cf2d6a10..6f8319e3e9a44dd537d17f41565a8453c560a581
#regzbot link: https://d.kernelci.org/i/maestro:c442def18583faac8c1d29491493caaae38c9f93

#kernelci issue maestro:c442def18583faac8c1d29491493caaae38c9f93

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
