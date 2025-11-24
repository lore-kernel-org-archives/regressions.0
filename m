Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F3306D58
	for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996347; cv=none; b=l+DFEyAKSY8ssBZFGh9ybrUopSvykSsW3KznsfmGTCR4RN8nCDcI59h8T+R/aGQnEVIca7BeqFHJSby6H4MdMfuQE+pMwdSIDFcXIoEq/2wvqOgjClPRhBqBA1wxiNR/7aA1leqReRb78HrHcGQ6m4CQ5BppeRd5CKYXuuWx/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996347; c=relaxed/simple;
	bh=EYCo3wbfHfmFQa02o2RM6yKpAm+wUjGxK4y/z4rDtRQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=sUp+aKLLeeg3UOPPNvEcxr7yeNGG2bpRN5SM7s49nJsgiOiVuKdzlBPkxiaSbGYYvmfuLLFSLdTiZMDtPp3sC9FjMkJCGTwrn6YNxtUk48AgtScw/O2GhMJIpTmNavAbp6Fdi9lw3YY5Y2rSoJWlO6CSVDe7CXdVeMKEGCurjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=IcefUWt5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IcefUWt5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29558061c68so59594695ad.0
        for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 06:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763996344; x=1764601144; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dv6QicMlocvWNqzZyLpAtw1qAxWRLCWMymXPN2jh/1g=;
        b=IcefUWt59rTxIB1c4YkGB2gMjKOxHp/tloecbh/zq09yfMYXvT49Km9aWDzwEvzUER
         Q7skds/7p4v1uZ4BvbSIVZgRaStdmoyGCSUdaaS0hwgUHCd3pkgF7F9zoWN8awIcE+lt
         leHJinmW8HKcOPVXcROOmsmPhSPUcZstgF1ky+PG6bID+rUlYm/+ijkWNwdDlb1k/Baa
         R/eq4KVbs72L7/DevAy/P7tnkJsRgZRJSC6nCAF6Gb9CoCbbUqxDDYBjEey/LASuhAQH
         gfQN3EWNMamG2kUXPKPGKyTLLn1LBaMmZX+jwAMb0kGPnwmGlsYsJPpoq/75QTmlBF9B
         B8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996344; x=1764601144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv6QicMlocvWNqzZyLpAtw1qAxWRLCWMymXPN2jh/1g=;
        b=wVwvgPnrfyzcooAzdhWPu3A437wmllnbB+w0Ge6h6EGCm9qx0jLdr068QhZRqx+mVC
         Mudzucx8pxKPSeJ9HNOAGa8LWi9E4QUXQ6o5T+r2pvXPfuAMLmnm3WRon5GXjWnCPiJm
         jXUq5OFzRYlKQuNkOto6Ww7uXdOfOIhNd3vo3WsmUYeDUlFRF/LZwwsCdnxbHWUguBQf
         85smTbUe1DK2Ws/2oPxPpz3RoO+GSvkve5YF3ACr2imUCnLEJOBe0D5Gjm0bGbpd6ryh
         O3iZ22ftucsNvbwjGSNhna0A2qJOi8Ef+QJpVDEutaWWizJTjSrmqU13S2deZFUNMkbZ
         484Q==
X-Gm-Message-State: AOJu0YwXRW4ybwmzazqzAhT5Isyh5Ohe2IMu0r1excBVVoyzs27Z/uhg
	Jxn12P70u3CSk1xF3rZFX7cGR8DkbonxdCm2AgHpaCltbumhFi9jE9i3w2o4dNaGfKo=
X-Gm-Gg: ASbGncuVs+8PP83VcWbFQV0Ca373B/iMrdr7kFy52H+eDyqfxGqH5hKX1et67aOUL5W
	/msicFNSMZ7hqc5li82i5yeRiq6vIog7cAjTZaF0+UrNeKLjd69wEpAEVLo1YLDnsk5id2vPXHY
	CTbhajwp8/3ETrGxpMGG6EEs2n1Rj58YlC8QfNA4fVdCisaAuQBF585ov40K6ePgKCxicJGOo1x
	STAQuaPlbZe1GE0QYprkyahiJ65BoPT2geTAadcAn8FejMv8Kt2Uj+XTbmeKBZEy3P/3sDmYADe
	7nDZdKaJ2T1b3ncfQPIqtHRaA+as0t5rCaDNBuJu9WKFhYM8eUcLLPI7carej8btUD0c2fPKuTr
	w/+p5yKIXoa6MGyEBBD3U5yV4bQNGH2HQkN51/CVmXS8BtuAUu4KcpetpOkKb0BHA+mHDA6U4so
	K08Dri
X-Google-Smtp-Source: AGHT+IEcD1trdqbQc69BpMtP07XzKrL5FxEsJvdGMtrXzOAwZdyZ5P6FgeXOFwPwpZPHzq6sPYhugg==
X-Received: by 2002:a05:7022:301:b0:119:e569:fba0 with SMTP id a92af1059eb24-11c9d717b91mr6102020c88.15.1763996344103;
        Mon, 24 Nov 2025 06:59:04 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e945sm68165405c88.6.2025.11.24.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in vmlinux.unstripped
 (scripts/Makefile.vmlinux:72) [logspec:kbuil...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 24 Nov 2025 14:59:03 -0000
Message-ID: <176399634273.129.10917573478902375918@f771fd7c9232>





Hello,

New build issue found on next/master:

---
 in vmlinux.unstripped (scripts/Makefile.vmlinux:72) [logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/i/maestro:c00f35c84d5655a6e8aec309bdb4a82398243097
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  422f3140bbcb657e1b86c484296972ab76f6d1ff
- tags: next-20251124


Log excerpt:
=====================================================
  LD      .tmp_vmlinux1
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_create_backlight':
/tmp/kci/linux/drivers/gpu/drm/panel/panel-visionox-rm69299.c:343:(.text+0x4b0): undefined reference to `devm_backlight_device_register'

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+CONFIG_ARM64_16K_PAGES=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-16k_pages-6924699cf5b8743b1f5eec35/.config
- dashboard: https://d.kernelci.org/build/maestro:6924699cf5b8743b1f5eec35

## defconfig+arm64-chromebook+CONFIG_ARM64_64K_PAGES=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-64k_pages-692469a0f5b8743b1f5eec38/.config
- dashboard: https://d.kernelci.org/build/maestro:692469a0f5b8743b1f5eec38

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-big_endian-692469a4f5b8743b1f5eec3b/.config
- dashboard: https://d.kernelci.org/build/maestro:692469a4f5b8743b1f5eec3b

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-mainline-big_endian-692469bdf5b8743b1f5eec52/.config
- dashboard: https://d.kernelci.org/build/maestro:692469bdf5b8743b1f5eec52

## defconfig+arm64-chromebook+CONFIG_RANDOMIZE_BASE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-randomize-692469a8f5b8743b1f5eec3f/.config
- dashboard: https://d.kernelci.org/build/maestro:692469a8f5b8743b1f5eec3f

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-kcidebug-692469b4f5b8743b1f5eec4c/.config
- dashboard: https://d.kernelci.org/build/maestro:692469b4f5b8743b1f5eec4c

## defconfig+arm64-chromebook+preempt_rt on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-preempt_rt_chromebook-692469c5f5b8743b1f5eec58/.config
- dashboard: https://d.kernelci.org/build/maestro:692469c5f5b8743b1f5eec58

## defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-arm64-chromebook-69246a08f5b8743b1f5eecb6/.config
- dashboard: https://d.kernelci.org/build/maestro:69246a08f5b8743b1f5eecb6


#kernelci issue maestro:c00f35c84d5655a6e8aec309bdb4a82398243097

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
