Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16CD18DF62
	for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432155; cv=none; b=ZTonl/Hjl7OFxdckRRvj52nJHy6dspIGpu1qkEB4XRvCNIRsy3r/+u8aN6cXDgxbA7LJoUkQoHKtdpm9Bw/mzFDh2KZdt30CGFLD9/CH9NOku/37+PmrbqmGxP5+1PTsjfdV1aWUxQP6Cnfz3wS5RZFiaIRXx2LZAGZqamViIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432155; c=relaxed/simple;
	bh=Gzfs8ekUj7A3y/LG9Rcdqmp5q5m+aBsb1GKoNaKBk5M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=R8qngg86tSGzWD6xGb+VQ5oPSyxr+ZxQfbkIqVMaCwD48zw90kPrYMXsmHumnhjljhe6zHXwKRf8fozj7EGNEHQUPDXYgzKLHKUu3c2uvUzBXr1R3TjnmnURrDjaLKLpAjOBKZsEkSCNojVvOJ79oWO80/lVd9k4ZmTvuPr4JWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YTTXrJcn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YTTXrJcn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23aeac7d77aso18077275ad.3
        for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753432153; x=1754036953; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6SlG4p7PzGNJex+qeliN43z/Wd9scMaF4+MTCIpEF4U=;
        b=YTTXrJcnwISYg8IZQiNmYF+CWGeIVIOeTcgCTYn98SBZcfkNOHspDNf+B37bu2BwJ3
         YdxBc5fhkJtbQcV3Uvh4oe7wjfdEXpYzFOsZJ+CwbljmudazJ+HJQG8Y8EdsHRPNaj2+
         0MtlRVuO1vCryuo2ndSpdJLCRx54twbBTd8jKkApHp1bewlgRFh+npqz4BFubrwGoUTW
         tYaLDuc9E+ciYfYFMEzoapRe1pdowzsGiXiH7tFjZSxmV78Kbfri6U6EBFDOCohOYe5A
         fkgi2LIVX8vxqmfjw05qHsmfMVGUcEw6vHjC38t69Hzx+sTU6yJ9mzod5Zp1PCy8GgRn
         QRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432153; x=1754036953;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6SlG4p7PzGNJex+qeliN43z/Wd9scMaF4+MTCIpEF4U=;
        b=PjZrBm44oRV/5baozV0dhOTRV3tk3Und645dHzi67Go0hivpvbI5re6fwyY4AbTocT
         e0bsRlItlu5v6f5b+sFymMg6DCqWyQkNlQCz/CzWz0pmcbLncVH0qjvXiicThA/vxSvw
         qgbDrsjTEi6Dj7+xxp3RckCTb6x5+NLJs2c2fd6MLAe7geSOHqo9maKYxA7rOeRWLTMS
         MlZLDI2DiPhFtzbUWMhpnUwHC1D/4kAWj1eMPrctPRQ4+KsEBfdW0xGIRx+3gSBbPaXN
         iSOzwPTRQiRL8Q0d7fJ7oBgUUKYv3wdZFhRKUorXJVf5VoLHoN0NCTi6hYG/f2ziR+Ri
         eo6g==
X-Forwarded-Encrypted: i=1; AJvYcCWfr8vfuJX3DPDEj5SiD1X+3ohUq+mjaL+nmNDsyYomb8fRKY74mf4N+busGh+K+tgeVtq0/9mVTvMmHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBVWpdhEcWomZFnZQSrdbiTavyzNZSfPKdwtBCFQ0Y/PRT1CR9
	gzd2lEH6A7rmhzqljwSHFOvoZBC3lOTtoRmjzgENs3fs8LczdXo8jjy2wmy20Bc/myPJgrJce84
	EI4BwdhEKCRDfk+j59PikJOd8Imu6nnxG1M4C+3BJiA==
X-Gm-Gg: ASbGnctyFeDjs444FrED/CrY3AXm9JkP5R8DZ5GedmZ/M/SvjefqnF9LidiG+86fH7R
	1HrxthMJBnqfPTjZVP4JKEREe1rL3Vl+/3zOBBQOYUa3QhCUXWF105ZiCBtsGjtKv/erGCUtUMT
	4Hf3AXcWGG0iV0uaL/cm5CUzYFQ03rYFmClSWMuEn093rljwaxFa2RbHQSMnj6znlkdQLOJ0yBs
	mr30QvqJMn3LbfDlEzDmpzJoKUbUL2l8nCmgCI=
X-Google-Smtp-Source: AGHT+IFSOXd5d9LlBPfvNONAe739PRS1T7pG7hnn8qLMr/8kfPoBeVKvxu7CgmKTzBsjPnN0S5gW0/AjsKP4cqXAV5c=
X-Received: by 2002:a17:902:ea0e:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23fb3167767mr14742145ad.44.1753432153221; Fri, 25 Jul 2025
 01:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Jul 2025 13:59:02 +0530
X-Gm-Features: Ac12FXzWcEWmXcr7ADQOYVMNJ8JhbU_ZioQdsFR-c7JnlJg189CYfO6gbl9zBIk
Message-ID: <CA+G9fYtBk8qnpWvoaFwymCx5s5i-5KXtPGpmf=_+UKJddCOnLA@mail.gmail.com>
Subject: next-20250723 arm atags_to_fdt.c undefined reference to `__sanitizer_cov_stack_depth'
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, kees@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions noticed while building arm builds with gcc-13 and gcc-8
toolchains on the Linux next-20250723 to next-20250725 tags.

First seen on the Linux next-20250723
Good: next-20250722
Bad:  next-20250723 and next-20250725

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

## Build regressions
* arm, build
  - gcc-13-lkftconfig-hardening
  - gcc-8-lkftconfig-hardening

Build regression: next-20250723 arm atags_to_fdt.c undefined reference
to `__sanitizer_cov_stack_depth'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
arm-linux-gnueabihf-ld: arch/arm/boot/compressed/atags_to_fdt.o: in
function `atags_to_fdt':
arch/arm/boot/compressed/atags_to_fdt.c:135:(.text+0x118): undefined
reference to `__sanitizer_cov_stack_depth'

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250725/
* Git sha: d7af19298454ed155f5cf67201a70f5cf836c842
* Git describe: 6.16.0-rc7-next-20250725
* kernel version: next-20250723 next-20250725
* Architectures: arm
* Toolchains: gcc-8 gcc-13
* Kconfigs: hardening

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29244662/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250725/log-parser-build-gcc/general-ld-undefined-reference-undefined-reference-to-__sanitizer_cov_stack_depth/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250725/testrun/29244662/suite/build/test/gcc-13-lkftconfig-hardening/history/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/30LiHIefapv5cGlikeKrTz4lSKR
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiHIefapv5cGlikeKrTz4lSKR/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiHIefapv5cGlikeKrTz4lSKR/config

## steps to reproduce
   *  tuxmake --runtime podman --target-arch arm --toolchain gcc-13 \
              --kconfig defconfig --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
\
              --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
\
              --kconfig-add CONFIG_ARM_LPAE=y \
              --kconfig-add hardening.config

--
Linaro LKFT
https://lkft.linaro.org
