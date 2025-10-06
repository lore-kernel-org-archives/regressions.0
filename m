Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F01C69D
	for <regressions@lists.linux.dev>; Mon,  6 Oct 2025 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750216; cv=none; b=YlMdT3GDy4pNB1IgyjzQtlr8z1RX65eBrRQ+jaEqPbTGBaB7gBeLnJXdQHN77mE+ee5SxyKYEa2okDeMy2E3L0fBBURYZqvvuh0rMJercxiwjI9DTyrVL6vKuF6pnG+FoYGOghTfN2pfnmW/t2LLScjWyt+MuuV/8HiD243H4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750216; c=relaxed/simple;
	bh=osn5ew/lMxGyS0lnJ4uClg6NxZuq+qP+tS/nSidtHrw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dQYCJx4eimongZCkyJTrUygkL56cBdOPPBdofN2TgMJ54jcY2Ga1wLeybz2neJ6eSXQQp83IQtEuuOkvMbWMpY1baRVdfQAGPXhw1KNp3F4UvzSURduh6dw2l8gG5slDPFGcoeCt+LxAhoAngSF3XptgkINvRxc47FTdX1NVjSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjbYSbQx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjbYSbQx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7835321bc98so4556132b3a.2
        for <regressions@lists.linux.dev>; Mon, 06 Oct 2025 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759750213; x=1760355013; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1b4UieRxnHeJDLUzPk+Z3+ZvYx2PdGFKhNe67w07jY=;
        b=bjbYSbQxSEbtIbmz0YzUe8uZ/ALLncvxaP6skfrThzCMbNcm7m9NB6KSLq7pya1U3Q
         jxCzT1pOT2zkoPqCRT8WAgjXFtlj4gIF6bFZCU8ozsTSdZEAUKgjInxqT5KFMuIeCjI3
         NZmpgnO/DYfmZkixcVdENLEmAL9fv6cXZjVvsxSDFl/9k4H8zo7AfuU9dsv9iY1khyw+
         BEsYAaDiUUf+oQ71yx7m9LlnRhgItWkIFGZBKpueQaMsmtJS5tfTGZAP2QbYG6v8Zbsd
         Gr0+i/8ZOw9LVZeHMVTFcJYzHo1wdtaH1m2c5YghlAgNZloJ2V5qr1eN5h12GCiTjW1W
         ZGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750214; x=1760355014;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1b4UieRxnHeJDLUzPk+Z3+ZvYx2PdGFKhNe67w07jY=;
        b=viJgsXjPZBNcTmCo3Jv21c1AY7r9Vqt5RVuVdXmqOAJs4IXRo5dmXsqKXqUiq1JzbF
         LmO82+rKxNorBfZNPH+7HYTKVsYtjkB8zEeyISgdku9RmwJD9a9jgamUIErzN3vYzyta
         d1JIO8674RvPL3fyfRqHGI64LVYzbyznp4uxQa842N7gAdIt1MC5PViB7mbyQ5cDYh4o
         Jt15adBHRa+jZVtP3kGr7U8aywJojAs9UkideTp12q9KpjMFoOp6UPAtu2qCm9Kcquj/
         oVQ/sc/l5nnA8YbXv5j4beoTJBM8Co22o35FC89sv2ztPuRc8A1wCIC263ICkknz9JPh
         l2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXl366O0SSWMH47ZJIgvIcMpI2Pf+VdKCX0IfUBQVW2zKhoqH0LJJD9Lf5q7M2DQyNSf/j9DVOz2GqkhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh8avDRy+1kmeAGExc3B3IpfihH6tn6LJUfGH/JYurQFbV7iz7
	Fhi0j+ZXVqFC659qiX59i8Ea2qK86NB+ifCzafy2K1QnRebkJ2nkTPE+AH4J4wjHxTvNsrAkm0E
	VrGUehFLpJd8ADkf8EislxO8up1U5ikemogQx1biFqw==
X-Gm-Gg: ASbGncsJMEUczxb5lbdy+BQz1v5SsgLBd0UirKPwp5plXUxqHvhb0mq8OzgHtBnUwAu
	TZreGHi8cEp0G6MC7Q0bJ/2qN6a1OrfSfj/n6kbqfV+FQiNZvI9JXL9eQ6MbPGD7FxJHvgVfaDS
	vRTN4ZgDLDH8wWWh5ErcgaIs7nkcWf4gMn2tCGH/BcOdm6ucB4+8MYCgU7ieBNyBPxyNAUjCb9f
	lGWybt/tep14NzeqqiXsejHNbWSsX7PJQIphZ7OlyDD8J0V7vqidmstJK1QRXweBGbjDkDwOx4q
	fSBEq2luuebM5/Nc0vqcbPQ=
X-Google-Smtp-Source: AGHT+IE7/BR9FHufOHH3BLOQUgqTtS1rfbVXN5odMkAwRA+sZP80yDXLfwd06HD6VkaXe09XBa5fi7EiEGqxb/9Ze6U=
X-Received: by 2002:a17:903:178e:b0:274:6d95:99d2 with SMTP id
 d9443c01a7336-28e9a6a90e8mr136255395ad.39.1759750213517; Mon, 06 Oct 2025
 04:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 17:00:02 +0530
X-Gm-Features: AS18NWAcN9W702ErPzrjZGWWRgZjF5wGQGJwFYbwG9GAp2PHp_NMPerrOOnYfiE
Message-ID: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
Subject: next-20251002: arm64: gcc-8-defconfig: Assembler messages: Error:
 unknown architectural extension `simd;'
To: inux-rdma@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Patrisious Haddad <phaddad@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

[Resending with typo correction in the subject next tag]

The arm64 defconfig builds failed on the Linux next-20251002 tag build due
to following build warnings / errors with gcc-8 toolchain.

* arm64, build
  - gcc-8-defconfig

First seen on next-20251002
Good: next-20250929
Bad: next-20251002..next-20251003

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20251002: arm64: gcc-8-defconfig: Assembler
messages: Error: unknown architectural extension `simd;'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

### Build error log
/tmp/cclfMnj9.s: Assembler messages:
/tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
make[8]: *** [scripts/Makefile.build:287:
drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1

Suspecting commit,
$ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
         (".arch_extension simd;\n\t"
fd8c8216648cd net/mlx5: Improve write-combining test reliability for
ARM64 Grace CPUs

## Source
* Kernel version: 6.17.0
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
* Architectures: arm64
* Toolchains: gcc-8
* Kconfigs: defconfig

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/build.log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/config

## Steps to reproduce
  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig



--
Linaro LKFT
