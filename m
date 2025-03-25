Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785CD13AA2E
	for <regressions@lists.linux.dev>; Tue, 25 Mar 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900348; cv=none; b=DNLpG3HhB6Nkdzo39d+/Oev01xZ3acN+8ykNR8cDVmCm+CVn95WuU3Jh1v9/QFrEm2nHBE7+SeaVbTALTV1Mqi+p40kUdPqZjOPunR+xP9ue9+g4kLuH5xaiy/ScU+dPjB3RR5Lku730bhXa/1xSSeO0oK+A6x+XnvNVg4paqoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900348; c=relaxed/simple;
	bh=s+gw0EhuF2+JAPAKnD6AJRgNI3V6xfEl9ikM7X1eus8=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=TrcFqTD1w3tVAL9n73qc0s/4+w1i392gZxpQ7WXcJpP5py8yibcd4xEeZgvUsPA7/KkBh+qP1fAD5MD9vUrhXitULv7lPxNSkKPeOREaUEGO7bvoQiqv8kMTtlA1Seg8TG+vGNeDbxjZPG0lLTTtWbrQ9BTj7DI+xUfHyz35B8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=BUGA+7Yb; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="BUGA+7Yb"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ff2adbba3fso39963677b3.2
        for <regressions@lists.linux.dev>; Tue, 25 Mar 2025 03:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1742900345; x=1743505145; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoqlivxnEmW58kKpXtRzQWKOoHR2WrghMasX7yrP+yc=;
        b=BUGA+7YbPSAevmMTw5oeuOjeaspOhi/Zesgb7bYE0W0LAruDgF3kdLwaaljOwgdBRF
         LGETRKXOIejBLHnrTRjAWyH2Whc16kKzg39qkI2fhVPP6mVJYxIE41nmmENkT51n1hPr
         3jNiR1vPMwmczkuBoFhwyzVwgIntFsS27GgTGM3fBKCfrViArvmtuXgsCC1mDf1eP5rf
         hhfLL4jy21tqKeCWj8Y0mjmm6jaTaKBRofwP7dxP7iyHujygut1o3Z7kDwUsyUqb/ag1
         gFWJhv++3ugmeL1KK4JY8DgZY9IU4ZTyAQBoLcMdXCsaRrO0tweIPO/03f/I67YWUDxK
         TGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900345; x=1743505145;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoqlivxnEmW58kKpXtRzQWKOoHR2WrghMasX7yrP+yc=;
        b=A03gxDt6M3KQA7/PMr8jHy1qxIeb/R4paGdfPyQ2/OowPEwTTywc/JstfGZuhDrHzs
         Qk3Ib/U1+PLnzZ/gd0XBaVSsTUA1/LeKmYDBshAaqdD8Gt4s7hrN+gLvopKYUrw88rLc
         qJooS8x1+qBxGky8gq5i3jLuKq44pO8+Rtk+LU1e1yJCi+5RM/CgWNAyjvnIwCkEMqhU
         K/bnmYKfwqILPFhuqc+DaKM3Imz0ftkOxvfgKxmRn2DIDUmHKLb026C/+pcKQQn3/CBS
         tdqKDoJRcdmt9DKl4sg5CppJ2KKFFs5CGZmMIEc8E+PWZZ4hUmgBuD5nMiSwhgQabY0h
         +icA==
X-Gm-Message-State: AOJu0YwVYiN6apIJoDkmcsfNf89Of1QmxU2khXYfYQFz3pRA3GVO5DoT
	cMAMQfgreK4ojJ1T1RsAXzctnUb0U2O3BVJUW4bc13N7UjQ9eiNC9UMKl3VxTUaJ7YNGaDvHbT4
	OLiIAyxIjJxqluQb44Z+QwSrtsdnYDYMMCBdcMg==
X-Gm-Gg: ASbGncto331h1fvQJVE4Qh7VdEPqQjVhhcvgXQ2QykazkFtbmloS6IkLHIWaidJN9MD
	IUurqKrBqhSTySjL3xjEC8s4btdTWkJtolXKjjiZiX/74dXGQIRvn7SiiUPH2iHn/xEfDxqnwcJ
	+mDRXXLpX7NPakeOTE+ZUY4M4v
X-Google-Smtp-Source: AGHT+IGfe1+5IZ+mPHvDqqafrr9Ya230tk12gPxlrX40cPQBR5QUEx+w5VIkjHuk4we0WiYRTtetp+MRsOh1n5Vr1U8=
X-Received: by 2002:a05:690c:4510:b0:6ef:5013:bfd9 with SMTP id
 00721157ae682-700bac4ace8mr229157127b3.10.1742900345051; Tue, 25 Mar 2025
 03:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Mar 2025 06:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Mar 2025 06:59:03 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 25 Mar 2025 06:59:03 -0400
X-Gm-Features: AQ5f1Jr6eQ9u9nC6LTjjzifshxeySm5ScOXZGjFIuU2H5zkCg5gGaP7IRG96hXw
Message-ID: <CACo-S-3XaqDNx4mZG1fyjO8Hre=TFSjr3VET9QdhxtH1L8Cm6Q@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) undefined reference to
 `btf_get_func_param' in kernel/trace/trace_...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 undefined reference to `btf_get_func_param' in
kernel/trace/trace_output (kernel/trace/trace_output.c)
[logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:8eccb2c3d8def056c6112c94af6a3189cc4f9ba8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  eb4bc4b07f66f01618d9cb1aa4eaef59b1188415


Log excerpt:
=====================================================
aarch64-linux-gnu-ld: /tmp/kci/linux/kernel/trace/trace_output.c:716:
undefined reference to `btf_get_func_param'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67e284be67593f2aa0313e07

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67e284c167593f2aa0313e0a


#kernelci issue maestro:8eccb2c3d8def056c6112c94af6a3189cc4f9ba8

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
