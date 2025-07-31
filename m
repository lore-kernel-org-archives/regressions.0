Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB72C158D
	for <regressions@lists.linux.dev>; Thu, 31 Jul 2025 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753968754; cv=none; b=oUqwPSi2WD62mOgAiFD/RipVNKacIUhEJZQvyXeTjGF0TNKwHTC7gjNNUBLRntnn1KW+ApaHTIFd+DDZlq5KeXpbw8Y3QP7Ep2AYzfuq6ZYtJuMT9NH/bt7b1pllpg3cXZJgSHdohcMJeK4d0ksDhQusvBbKuxMEdbg8S8OyjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753968754; c=relaxed/simple;
	bh=DwLv3NVgK+NLuVZxUkGdJBfD5FPTwniAQK5bZRxIfmU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a+y27PTtyb/rXDzJEyG0wG3RLTi29eV99Xowft1gejg3lCAAkIpN3/6afwiZ17L/bimCIgCUJZQnXDOvHw/zBSJIDyS/68CFm/MpqGbNJw29+byEtt4BC7j2L+kzLPn87E3/ByW5KAzl+h2szPr130w9smSTq3lSigi2HQeZrhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mxHcerDJ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxHcerDJ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76bc5e68d96so451892b3a.3
        for <regressions@lists.linux.dev>; Thu, 31 Jul 2025 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753968752; x=1754573552; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cmXYzT6zJ9rS420ixrln5bVB+UwoUFt5tecWAfMb5OA=;
        b=mxHcerDJvhZqwm6Rkam1Zc7lxE3eKmI+GZQY2LBJyPDSoJn8S1zOTYJJVB1gr3VpZX
         jmH0LOvHcM14d0MOEYhg14veZUNLbLmT+DGg8yrIM1s1N+le7A2n6XWcx9Emvpx71QE0
         hZizGd3C8Y4l3kaKLJXwd9q2pLN7I7vZCZbX1UBMM8DPiolB58HNziyOHHWsHWFl/RFF
         TNEUS0ya4sKenuCiN/j5Vi8NVT2TgP2FfWbbhV/io1QyvK1E3TNCtJLVo6XR8h+xPsnZ
         9LJR+lUQ8kETDDfZZusfJ0u+cjDNJV6I9AQlxGEUKcKhdmQy9fjzujlexTQsGv5mWP2j
         B8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753968752; x=1754573552;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmXYzT6zJ9rS420ixrln5bVB+UwoUFt5tecWAfMb5OA=;
        b=a5rjt87GL6+xzn+D/KcBW9y8JA2goNQUVbHMXjYKQv8fCa2PHzBAArDr/nHSZieYiP
         1DHkxQxprIdpcHbY5TbNkNlRpPGex0jHt/Woz9PbbEKaMeSD6J1hx7YuORh55jVTv0zD
         RKsZPghPgP/YiC5SEkChAMz4IXfW1A97rkWjnJNPq6MomA7hjW2BDf7QO+roaAXm5AiN
         f7pIjmbdGQZhzttHlRLUzSrI+eHHTpq0oR8FCfZDNCufdJZ9rsCW0S6piHxNkEr5BlE9
         vqhKnavlZbIUjnhoXGBOOpP6RpnorRhnOiL7theNCGYeGVCAtAnBspiOqi4M6WGV4iQi
         gRHg==
X-Forwarded-Encrypted: i=1; AJvYcCWj/IoY1AdFG9b7ejEDat8ipaHgY8EMRvUCiqEVcdAH9G7D76KJoEjbIrPCCTWrsce+guezTJhoGvFiZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxri1IF4G1F5bg1SJrS5ojJ8lNJ1e9G648JlGC5aH3Od+zQ+dCF
	/ZS5wOUlRu/Ye1N4EuIPazRkkdXqY3SLS/61x1qwm6Z1/PCyssI3LBjS+xkpppQNBz8ahMnYz7y
	q9P/HAyveWxtHO1cJa4vLzPOj3ABLcqbGqE7X+N5m4w==
X-Gm-Gg: ASbGncv2JxHxMGciqMSum+ZBNkJZISV4Oh4o9+8kw0WOw5DvqxlmbYehyhZQk/sG1GR
	q+8ETvMwYNTvGgKMfVRlj8miyQLZVmPLDS7sYSLwwKchynIhWfr4vahhkZktzr4r8a5X3PTQuCz
	GsmJ1U1Gw9jtd4RRyUZ3dOevuWbcIstVhSPq+oJBhntOmjdCS8zSNhp5OWu6oRBchGUHmEy6zZC
	Umn3oqhoKBJIE7P7s5HxTc3B6SOZSfNGqA1Cbji
X-Google-Smtp-Source: AGHT+IHMOlGLBVMZYIfdD8TgOlG751bAmep6oG9qqVy6znDcDyIXiYVE8rT/XtpzFlKEZWKLciEH9UdIeYkn8YVABic=
X-Received: by 2002:a17:902:ef11:b0:240:725d:c396 with SMTP id
 d9443c01a7336-24096b17fb3mr112149505ad.34.1753968752058; Thu, 31 Jul 2025
 06:32:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 31 Jul 2025 19:02:20 +0530
X-Gm-Features: Ac12FXz5D2sJ8CLUiMTBbTCix6pCoDq6lk-VMWBeOCc2LNXohdtN5ecn-7jz4iY
Message-ID: <CA+G9fYv-c6D6tJKw9x05+U_VxrpTAQCKADTeYg4jsjaJkX+isw@mail.gmail.com>
Subject: next-20250730 x86, s390, riscv gcc-8 hardening.config vmlinux symbol
 `.modinfo' required but not present
To: open list <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: kees@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions while building x86, S390 and riscv64 with hardening.config on the
Linux next-20250730 and next-20250731.

Build pass with gcc-13 with hardening.config fails with gcc-8

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250730
Good: next-20250729
Bad: next-20250730

Build regression: next-20250730 x86 gcc-8 hardening.config vmlinux
symbol `.modinfo' required but not present
Build regression: next-20250730 S390 gcc-8 hardening.config vmlinux
symbol `.modinfo' required but not present
Build regression: next-20250730 riscv64 gcc-8 hardening.config vmlinux
symbol `__rela_dyn_end' required but not present

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log x86
x86_64-linux-gnu-objcopy: vmlinux: symbol `.modinfo' required but not present
x86_64-linux-gnu-objcopy:vmlinux: no symbols
make[3]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1
make[3]: Target '__default' not remade because of errors.

## Build log S390
s390x-linux-gnu-ld: .tmp_vmlinux1: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-ld: .tmp_vmlinux2: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-ld: vmlinux.unstripped: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-objcopy: vmlinux: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-objcopy: vmlinux: symbol `.modinfo' required but not present
s390x-linux-gnu-objcopy:vmlinux: no symbols
make[3]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error

## Build log riscv64
riscv64-linux-gnu-objcopy: vmlinux.unstripped: warning: empty loadable
segment detected at vaddr=0xffffffff81e5b000, is this intentional?
riscv64-linux-gnu-objcopy: vmlinux: symbol `__rela_dyn_end' required
but not present
riscv64-linux-gnu-objcopy:vmlinux: no symbols
make[3]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 84b92a499e7eca54ba1df6f6c6e01766025943f1
* Git describe: next-20250731
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250731
* Architectures: x86, s390, riscv
* Toolchains: gcc-8
* Kconfigs: hardening.config

## Build
* Build details 1:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250731/testrun/29316787/suite/build/test/gcc-8-lkftconfig-hardening/details/
* Build details 2:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250731/testrun/29317240/suite/build/test/gcc-8-lkftconfig-hardening/details/
* Build details 3:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250731/testrun/29317236/suite/build/test/gcc-8-lkftconfig-hardening/details/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250731/testrun/29316787/suite/build/test/gcc-8-lkftconfig-hardening/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30cmb9OdgONks9mQHuMJ5hkW09f/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30cmb9OdgONks9mQHuMJ5hkW09f/config

## Steps to reproduce
 * tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-8
--kconfig defconfig \
           --kconfig-add CONFIG_DEBUG_INFO_REDUCED=y \
           --kconfig-add CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y \
           --kconfig-add CONFIG_IGB=y \
           --kconfig-add hardening.config

--
Linaro LKFT
https://lkft.linaro.org
