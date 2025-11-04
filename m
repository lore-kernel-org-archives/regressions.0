Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A8271479
	for <regressions@lists.linux.dev>; Tue,  4 Nov 2025 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253947; cv=none; b=sfPKshaAwCyHeNXeG47dgxp4NpT6yFxGZ+witB2vpuTZJbsoJ4m0JtCYqDCG5bhOJZpt5YCxT/mg8bwYvaoGucBANbvIiNv8JeW0C+runaJUZKhBjmftYaesrv824k/YxN9xsua6GlikFj2ujt5j+Yn1Uflu5bfIUw3DamX3wWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253947; c=relaxed/simple;
	bh=X9D2ZMejeOuJYhiaf+iM2vDRfimhm1I5uplt40ZcrtE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BdHNSw4l9Cup31bnaElP1tFuL9Fx6iup5hJ5QHI50OpnD4q8AhOGQpRlvPBT27wl3My7mIUGVqHC+lBBh7ezfYPSc7PIluIp9X7FlaBrFBMPb8v0blrB7gJzd6cL0T9m3GLo+7k5Qgc+KFSAKSwIWApVtNwne2loZKReUWd18ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FyHy4nES; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FyHy4nES"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso1530241a12.1
        for <regressions@lists.linux.dev>; Tue, 04 Nov 2025 02:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1762253945; x=1762858745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wjm/T/q4UFVx0GR2qhWDjx2Kam+zJ27u+3ToK37WMgQ=;
        b=FyHy4nESEo8GAPYo12GyGnBeVqW1FgX7zDwVjOrq0fuyquklKBm7w2WR/0Oe4gLgCt
         d+ucIRuxFGshlGCtd3D6q75eGa1XIHaVZJE8p3RPX5dBcwQUU+TQrMM7WTR5XFYPj5IM
         TMFwTqB21xfLFQHChJDvHQU8XfRIOkLpokFLskge4i6WuWRh9WrwaMeks3h6hCdixmz7
         lkLP8HXx89aPErYlvhyKevbrZ95PT7IDnWWUVPLWxF6KZc3uWbisWsFDeYC//5E5jlFz
         cSMMcDPKHn2Db1QQ7arj0n2f+uxm6a2EMcCrg1YTNScAP3yxsW/VGfPUvsrln22072v0
         ex4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762253945; x=1762858745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wjm/T/q4UFVx0GR2qhWDjx2Kam+zJ27u+3ToK37WMgQ=;
        b=h3sKRi/f9uVuGWP6cVtD1Tu2+HyTouzYdrUVLqYCZqSni09gNNzGFaLhyjh/Gqyj9B
         gpr3815Z0+O0isun6zlarr+PHKnc+RfIi9PZbkW/guvsoGAWCJAjZgujGKxlq9hNe7yS
         t5id8MShajq7vwdDe6bLibxHUBnfQzrGLDZY/hKW6t94izNuOabtpTw4xbDzdpDoPtVw
         sk+1GisflQnVCSGUJ2rTbNXmXnHswTcVU3Jpcys9K5VlIpklzERIoaZ8tlwtxOHZ8nrf
         DazXC51/rxtEMX4v0WWIzaaglo4Z2ipJTXxaXfsx3bL3NMp8eVmL2E5LFESZ7cKq/20c
         mH9A==
X-Gm-Message-State: AOJu0YxUuGym9fciO4NHVsTKwzAvZDDzYPiQ9lDBdHKBcPzTQJPUMqw4
	jPpWBMf6Pcnsonjfwr1Qwbj+hz7vGrxmgfqRokmGDvJsJTP9SNaf3qss3BsYTOse2wU=
X-Gm-Gg: ASbGncuMc8ji+Bqvdcna09tOCVJ4JSW5rFfaw/HA1hg5ZO0HLKC+fmiOgu9T6qIH+Au
	bFfzhfqrwxTXXgSeKJt3v877bc1PKnGi0b/njQNo30n1xNdjeCIUwwl9qU2+E3CcBYClKmhEVtP
	i8nfvWLyLVqCF8XQ163aTn2Knt9Qpai4hGlMGRS4ZlcJEBBfKbsIO2XzhV/2ao+Jqsz8TgZ/T4F
	Xs9/Q4Ss35QliYM3tCWu9l74iX7ePL/16wBLhchX0/nZkwWKPqFlbECjTtlosKXSeHTpaM3JyDd
	0nsG0qbRS4xf6dgmM/GmxQr7btStuDnJIXb3n3c/0i5ztK8nVwZXAgeaNhAkjyBiF3wv6yfDiNO
	gfWFlswXkLq1K6rlWzYezVJEwZ7HfxiTBwtMlowBGRaL3EPzZFBTbPcL2cjU/7nIVJbG9VA==
X-Google-Smtp-Source: AGHT+IEE3tpjnfYLy2MvsRp9gnymo9WNb/VqOccqW6Wx2eS51Tu6VZ5UcpgFdCxGUETRUfl0FydykA==
X-Received: by 2002:a17:902:f651:b0:295:1277:7920 with SMTP id d9443c01a7336-2951a43ebb3mr216891085ad.28.1762253944862;
        Tue, 04 Nov 2025 02:59:04 -0800 (PST)
Received: from efdf33580483 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a7afefsm22519275ad.111.2025.11.04.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_implicit_declaration_o?=
 =?utf-8?q?f_function_=E2=80=98topology=5Fcore=5Fhas=5Fsmt=E2=80=99=3B_did_y?=
 =?utf-8?q?ou_=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 04 Nov 2025 10:59:03 -0000
Message-ID: <176225394342.3644.6412596085150396269@efdf33580483>





Hello,

New build issue found on next/master:

---
 implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  17490bd0527f59d841168457b245581f314b5fa0
- tags: next-20251104


Log excerpt:
=====================================================
drivers/perf/arm_pmu.c:935:24: error: implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration]
  935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
      |                        ^~~~~~~~~~~~~~~~~~~~~
      |                        topology_core_cpumask
  CC      drivers/iio/adc/bcm_iproc_adc.o
  CC      drivers/devfreq/governor_simpleondemand.o
  CC      drivers/memory/tegra/tegra124.o
  CC      drivers/memory/brcmstb_dpfe.o
cc1: some warnings being treated as errors
  CC      drivers/memory/tegra/tegra20-emc.o

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig+CONFIG_SMP=n on (arm):
- compiler: gcc-12
- config: https://files.kernelci.org/kbuild-gcc-12-arm-SMP-6909cb01f21f07610dca0839/.config
- dashboard: https://d.kernelci.org/build/maestro:6909cb01f21f07610dca0839


#kernelci issue maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
