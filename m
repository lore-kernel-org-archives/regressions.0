Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F3F207E19
	for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073149; cv=none; b=hrw5QxubVqi1N0l0uehKEYJihQbZ9C20I+HHMLZmaPbM4FzWtFKu3b4oAHg3wJVz6y3pSMG+EITDoeZYVZWHJb1uLJoSPqwt8/ZukYoLFWcYy5b7E2kmV6haRsSRq96nSYurW78Tt98SeTU39Fa8DZHTYtVvNu7bkzP+PHRZstM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073149; c=relaxed/simple;
	bh=FYzpNZ9GyLS6784pDtNjKtQfxbArd0BLrfELq66obic=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=XuVYKTny5Xo1pKCEeLcsARqXYC7NJj0dW9/f87KM4t82CFjBFmKLhlk4/h+2Yn8X/3SdMSFpT/YHdMRAN7e25LyvjMY485HWlcvCmftOTkJ1Nu0XRuCkyK2M1HlzmC9TzAszKqWiQcMTWU0R/ZEoGI9Z8jLnIAZ/FMPzjmcX6Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=o4MBN3tr; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="o4MBN3tr"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef60e500d7so7107187b3.0
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 03:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1743073146; x=1743677946; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwIQ8Bo4gfeRjz1WZOiKd/61cFVkrdacIw+brYh42ek=;
        b=o4MBN3trApwSwxmM6TED5jZfENoafvwN1hBBMTCEwkVk/h4l4Hj+689cELz4T3HF3Z
         1RudYNU4WgaRXXSNKLSTEO0MuCBUD6SitjufZTGcfMCJGpABSLFvi/IPblr39fNZ7/Z8
         qxX5+97RP/O45YxvsY2l8KDwNwgpoKKMGEyvtRpuHuvPo8XkXXnw0IFe0J6lWBekaP9b
         bngIMS2tLgOzmT4CPEHHj1MTvTpWOpYH3EzOLHUH2WkmV24XbbJVDwlUWg5ZLXbRCbjN
         amJfqsUulekdWrOCIZOybBDJSf6x7SirYkkuluOhITC+gGaa5nFn5LbXd96r9Qap8fOv
         NpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743073146; x=1743677946;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwIQ8Bo4gfeRjz1WZOiKd/61cFVkrdacIw+brYh42ek=;
        b=Ko6+PGaDMHDajK4PI93Mrv+WuXtq0M6dNSb7Z8CObQ+X2bPmcEc5Et5OBDzl4sNgho
         oAhe0CRiVwScCm7ng127WErSkXdVzSYzp2UBYtI4xPqBdS1lv+hhPYLwTBD/dxOVHRY4
         naIHib+2pN4uSBwIOedxIcArj25iRCMO11yhsUgnSHBSKeNBYTbtiqplYOeotE6lHlIE
         JcbgoLM3+tVewl/EHMNGLtzq7VgSbuZ/pOTuFrJ7XeJgO6wsSEJCJAoGNEyqG5tWCG0A
         hPFkbB0ugX48eJw/P29faScK5R3F2Hfbfj2dojp8ed9O9g/B8oM9+iyZvQhxBhMobUvg
         4qWw==
X-Gm-Message-State: AOJu0YzRzDZ1u3HAYtPTYjGwMI1D7FQsEZ4/xY+DexP/2DRMJbfZMm6y
	6LQ0oudy6TSv/6FPrVANSh9bhBjB3hvLMtos1bm7h0mkNtjRc1JoFYBIn76/9Bfj8q+ex/De8Y+
	JKY6Q3fVaUYA+NvKCnsCR4Emh55EGXwiJquiafwHYW512SIh3
X-Gm-Gg: ASbGncvh26KNfDmywrbnHXEte+yzeSintbST5GEf1WB117Qr2DzmEAGToXGEYvHcxwM
	HtvKmxtqNYxfHS8EBdGkH4vg+YoMKjpGgXLvyrMba/wPsBhfJnKwRLp7Y14Pby4uBX3Ge1ufbRP
	dBo6MPIXrsY1YLP2CcSPHcht8T
X-Google-Smtp-Source: AGHT+IGlAxKX5BHdUBnjwpLgHU4nF5GVBasNLL0cFx6ttp5dXiVH4Z+4O3+DPqc5jglbXAEWkqkFsK9G0dKC0Kp8PT8=
X-Received: by 2002:a05:690c:4b13:b0:700:a5f4:d1eb with SMTP id
 00721157ae682-70224ef8d12mr37395137b3.3.1743073145568; Thu, 27 Mar 2025
 03:59:05 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Mar 2025 03:59:04 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Mar 2025 03:59:04 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Thu, 27 Mar 2025 03:59:04 -0700
X-Gm-Features: AQ5f1Jovb_ViLEyMywp3LZEjWkmEKwHluYatRScoL9AfxTrzZbGq3ZKDWtKN8Ok
Message-ID: <CACo-S-3LW8ZM7t7HCzMPQQqj7=nmUQ9tBmGMdX7J05n_4zFwQQ@mail.gmail.com>
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

- dashboard: https://d.kernelci.org/i/maestro:ce590d011e565072b6129bb2b78e5c87436cce48
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  db8da9da41bced445077925f8a886c776a47440c


Log excerpt:
=====================================================
aarch64-linux-gnu-ld: /tmp/kci/linux/kernel/trace/trace_output.c:717:
undefined reference to `btf_get_func_param'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67e51f0167593f2aa0389761

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67e51f0467593f2aa0389764


#kernelci issue maestro:ce590d011e565072b6129bb2b78e5c87436cce48

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
