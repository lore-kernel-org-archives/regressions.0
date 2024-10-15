Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0191C4A0C
	for <regressions@lists.linux.dev>; Tue, 15 Oct 2024 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003787; cv=none; b=h9735jSz5wSM7ewtXyTsG64jNw+n9vySMXXztMPeS43zJYGBOqP1e3ObI280niAn9mKKO1cuqnNn5zJx+ExLLU/fckz0xyZsno41gQgfljUMqzSY+3qq+3KxME/cc8P1Gdeq7AbX/h27yqNpWfVYOLUt1zm+kW90GOF2n1yRZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003787; c=relaxed/simple;
	bh=jftCcgpGscguxSk6kXzdvDBaiXSUimRLuEL9wKI3/7I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hGB0x07BELNzk7Q0ilK+L5gT06osE39FJZlwt11USzQT5RsMYg6ZFDEYEMw/Qxwio0xNMsglc/PPNGhXCPX3MAOeXIFyHhEZjbUND93qYWSwcIy7hcbdanUn4mZOPtgpV4vxz+tYg/K+n3I1DQjKdFPigBxbrkExisNvVlD3Wqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bH12mG8d; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bH12mG8d"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50ce2aa412dso1690401e0c.0
        for <regressions@lists.linux.dev>; Tue, 15 Oct 2024 07:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729003783; x=1729608583; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvpxbUbkgDaEkuRJpwxPS3JaI9LTJgLeDg7mwmImTTA=;
        b=bH12mG8dwu3tCLc07LU2pLbLT680l3O/p0+RZvx1u6Uty3YceWW8bXqOgKyYYPpd7F
         gSKfk62DcCnM/9GQNabksJVfubJa9l86ngBoXPSu+/EoqR53R/xU+41mmNT/rvxFvbOi
         7FU4oHLcMyxpXAMfj6pcFA33Cs0TAXvtNokS4bO+G+cSHCsUFNDsjA/umbDm+ka0Sl/8
         JLd4+LH/Qnn4I5RkpkYOVup4ZhU04x8fQ84puV+YwoRcYf4tKstQjEk8m02V09cdENdp
         Ba/hvnMntkwPgu4s3mtTu8JfCIKwWh5me0jfLpbWXYK+28BaoSkq4rYSo1Lg2LNkszzz
         Z7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729003783; x=1729608583;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvpxbUbkgDaEkuRJpwxPS3JaI9LTJgLeDg7mwmImTTA=;
        b=FETUeZgboPAeNtfBzTgqXf/6ec5skFiCqD5QQvthfHQ8/ZL0lSdtjGygU4IfGycV8F
         MWZUXJdPKFqz0Ubw/onlzHpDXocDrfU9TGCF5PcZQuKa8a1TWJtvQX6aorQBDSTpgmsy
         LlzrUpTftKddBuvcEfLnZzrr99MudAJ8rDJcE4Ce13wJle1PQ8j+5In2/rChnOVDzvoU
         owu38jBJJDmw2y+8X3hvZR/wWt9MMSExj0aZ+pWEyfhQ+XbLf05cXg5UdAmrE6ioZmlr
         iopTbYWvMIZX/HaydUDyPTvXB3d7zrR6T5Wh8vJrANQqvyuWaiRZZzkr5dGL4bFqTrHt
         22nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxxtYJh5GL0hhSAnAchbcIhID4g6AG4PjS3/SqmV2gbqURGbjbHzBLBykVjOLMY+/WzRCogTCjEAetEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFTCSB2jr2BDJXtdsig/oTexr/1po/jAPs+g9ymsiNyAC5vE4O
	/NIx9sVAHw8cJr1UckZ4iB/nb2XjpFrUY6kExZMqfdqB9J3yBRMFcsR9WSNJnximScmRBGDOrOR
	ysAqsLWwD1r9DTzJ7FjX7SF71d5PSiQAG3Zncfw==
X-Google-Smtp-Source: AGHT+IFyCjZYFgzvRtug/FF7Rkg4BIV5TdPRIQDiRczoqfOkCPSprOtAZ6MVzV6QhnnT962rmYjPy+oKdl/xd0zwff4=
X-Received: by 2002:a05:6122:3b01:b0:50d:7a14:ddf6 with SMTP id
 71dfb90a1353d-50d7a14e8a3mr2075278e0c.10.1729003782861; Tue, 15 Oct 2024
 07:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Oct 2024 20:19:31 +0530
Message-ID: <CA+G9fYuhS6Ltemvb_EZfq+j3PpTnmo4qb46Gu1s6L47wMsNO3g@mail.gmail.com>
Subject: next-20241015: drivers/of/address.c:244:31: error: passing 'const
 struct fwnode_handle *' to parameter of type 'struct fwnode_handle *'
 discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

A larger set of clang-19 builds failed on arm, mips, riscv and powerpc due to
following Linux next-20241015 tag and these include tinyconfig, allnoconfig etc.

And gcc-13 and gcc-12 builds are passed.

First seen on next-20241014
  GOOD: next-20241014
  BAD: next-20241015

List of build regressions,
arm:
  build:
    * clang-19-sama5_defconfig
    * clang-nightly-mxs_defconfig
    * clang-nightly-exynos_defconfig
    * clang-19-at91_dt_defconfig
    * clang-19-pxa910_defconfig
    * clang-nightly-vexpress_defconfig
    * clang-19-vexpress_defconfig
    * clang-19-mxs_defconfig
    * clang-nightly-davinci_all_defconfig
    * clang-19-allnoconfig
...
powerpc:
  build:
    * clang-19-tqm8xx_defconfig
    * clang-19-tinyconfig
    * clang-nightly-tinyconfig
    * clang-nightly-tqm8xx_defconfig
    * clang-19-allnoconfig
    * clang-19-ppc64e_defconfig
    * clang-nightly-ppc64e_defconfig
    * clang-nightly-allnoconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----------
drivers/of/address.c:244:31: error: passing 'const struct
fwnode_handle *' to parameter of type 'struct fwnode_handle *'
discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
  244 |                 err = pci_register_io_range(&np->fwnode,
range->cpu_addr,
      |                                             ^~~~~~~~~~~
include/linux/pci.h:2022:63: note: passing argument to parameter 'fwnode' here
 2022 | static inline int pci_register_io_range(struct fwnode_handle *fwnode,
      |                                                               ^
1 error generated


Build link,
-------
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2nShjJ9pOcjqxIXViYuRI5haZZP/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241015/testrun/25441737/suite/build/test/clang-19-tinyconfig/log

Build history:
----------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241015/testrun/25441737/suite/build/test/clang-19-tinyconfig/history/

metadata:
----
  git describe: next-20241015
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2nShjJ9pOcjqxIXViYuRI5haZZP/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2nShjJ9pOcjqxIXViYuRI5haZZP/
  toolchain: clang-19
  config: defconfig
  arch: arm, mips, riscv and powerpc

Steps to reproduce:
-------
# tuxmake --runtime podman --target-arch mips --toolchain clang-19
--kconfig tinyconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
