Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BBE175A5
	for <regressions@lists.linux.dev>; Tue,  5 Aug 2025 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754373548; cv=none; b=rkD3P7JmqHgA9KvdCu14wvrtCgTrT5HAeGKtl2eWMFzPXN5gsdZLM6yD6LXz5Y+0mJJIymYD5l1t3+xlQTBwlvuW60G8WCa3E9DyYEuvoP6gdh1v+407TCYBslmhiJ2s+8sKKdXj5yN+dq4GLNk03u+N66x7+GM7ZNhFuYkTOrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754373548; c=relaxed/simple;
	bh=PsHxA5qYLNfYn3Ntg2UdobfFyiyOtVnT3rYc6relMsU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=hWaNNwAp7YdV1xyb+cxGSuFejC7DobWmaAH8sdePGe9msb8IyxAzVgevbJcLhHQXXW8lNB3OygpKPYicGt9fPxkj99WwaAVRetZ4bO3Jl4GANZ6lqpvsWMfMuIVPJ5Il2rjtY9VZXaToc4vZHeu28vK7k0LX0aMmYuSY6jE9buc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=2LcVY8LJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="2LcVY8LJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76be6f0557aso4205095b3a.1
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 22:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1754373545; x=1754978345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72FlBR8B/06WvSFn3arGkV91t1Crr+n+D2Jq2Led2/8=;
        b=2LcVY8LJZfohgvp3LbQ9AdDuI6xmsz2bxWpT/1LzQCD6mee2KVCNF/ZZ9qxrDYOc2Y
         VQNv4qi49gGadtSY3VOyYDaH30dDUcI4pJB1R+88H9iuxazhK+P3P5LmY7flbY4AC/Gv
         sSHgMe1wMu13eFh7ivG2JuO8WDljPtm6P602aYqpZmPb45RTBf6t/DVl8Y0GiQSt+7S5
         yWXS9pNI66o4ssAKn/YXxyVk/JxqeChqJCzipCkeun8mcxUQSiN9OONO7ZJ9tbUL2MF8
         26xCyDUyvTmgj1obCMMCNnUAzP36PXLoRj7ziNn/qybgi7rM67sIow2CQXL9hzgvJqlH
         Nzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754373545; x=1754978345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72FlBR8B/06WvSFn3arGkV91t1Crr+n+D2Jq2Led2/8=;
        b=wyXcztKKDDpG53yaV44kW2OXKzCxs5+vS49LLpDJnRDSl03RVIs3ibhwwTD8ab5+lS
         23gsKAtZ0nDcjecOsjFm1IdV/9GGOql4vhlyafAIHJq6hjqTJGCSRjjfFWf+etZ2LUJ0
         Gd3s49B1Z0QZj77OVoRKOmSbzClbbsF4PD+wSVYlIneNoJK9LATESo+iLBv7z2E05omN
         iRNeiBKHlw+ipKGRrDvXk6oGuRMgGlZ63eVwGtmfMlitEZIjAg02YjMAle1JrW7Q7Lzm
         zhQjtJfywMIldR/BE6eIJBPAEHJ+AUXgAvfLk1EwClGS2TGMLN++7TZ/dg7g6JFKTenu
         PiWA==
X-Gm-Message-State: AOJu0Yw5mQHYpTY7KO7fA6uV0ysRfd18X7xPMDjlayHgryrKqBwgaz/y
	AX0AAN7QbmFM1dMJ9t6508kB3FVlgmxn4mHsId16pzoR7HNC/D74j+R6az/vCx9Afn8=
X-Gm-Gg: ASbGncu+XqJpNO0s5eMNcweHfL10PanXktagWGyTevKI4a723bRO2lehCcCYP9argms
	nZTUcDC9iO12ShA1yHhQCVAg4ra/TFbYsLBkRiG2ZHelROSe7Y/qQAjgn0CtVnb9xdf/AFweA6Z
	YFSZ1JdlYMvEex/t+p4OaDa3ELCriIpKZiKLiDlguqQTlvQpf9Df9/svEj1nRTo6fRUfFQL0Eau
	IHiyi50mUjGPJMJUcRSoyAR0+bN/PcOL4oscPaBHr89ZfYp3gZxo9iQ74N3487q/FQC7mfDKo0K
	MHpzOCwtob6MZSX8BfzfgZ+6Xt7ck+mCvk8p3+WWYoz8uN30/0eKaQvluOGu5NhAFvGIREAQHdf
	oqBK7DrXeg/DMrVfX
X-Google-Smtp-Source: AGHT+IG3RL7ptDva00+qEgfxzM6EESJNf/FpVXY6H5HgG5ct1fGYSEvfhYrM41Vb2WNUE5ShyTKtrA==
X-Received: by 2002:a05:6a00:88a:b0:748:33f3:8da8 with SMTP id d2e1a72fcca58-76bec303299mr14889217b3a.5.1754373545593;
        Mon, 04 Aug 2025 22:59:05 -0700 (PDT)
Received: from 508e4dbc6f9f ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf606978bsm6284528b3a.89.2025.08.04.22.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 22:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [REGRESSION] next/master: (build) the frame size of 1448 bytes is
 larger than
 1024 bytes [-Werror=fr...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 Aug 2025 05:59:04 -0000
Message-ID: <175437354419.1010.14815981800290011272@508e4dbc6f9f>





Hello,

New build issue found on next/master:

---
 the frame size of 1448 bytes is larger than 1024 bytes [-Werror=frame-larger-than=] in drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.o (drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:4d4120bf99fecc5f852604382b7c406b99440116
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
- tags: next-20250805


Log excerpt:
=====================================================
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:608:1: error: the frame size of 1448 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
  608 | }
      | ^
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_init.o
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c: In function ‘dcn10_log_hubp_states’:
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:447:1: error: the frame size of 1156 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
  447 | }
      | ^
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hwseq.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_init.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_dce80.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service_dce110.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service_dce120.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_dcn10.o
  CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_dcn20.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:689185f279d5d217e5430785


#kernelci issue maestro:4d4120bf99fecc5f852604382b7c406b99440116

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
