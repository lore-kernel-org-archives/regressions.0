Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215E2EF655
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755695645; cv=none; b=R7H3Kc67brtx6M8AwgO6r3CCJUlWolJRliobLfOp5M/pHhNc3DXnmjhFwI66tJ7wDcFVOtmLWFYzWEBWklTl0s1K2TP6ZRwj2sv1bVHOb4KZARPPc+pvwbezcVEIsXb5MZczBSZx9ablcF87LvvTd1wCX8r/3AOEm2coO3OshCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755695645; c=relaxed/simple;
	bh=KPSqciT5t06cKS/juMXRjSVgnjxRqIsScfumcMkysfU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hAxmQuKxT9SJP7FfWkycSKfuJKzM6i3yukxEWLi5qCNSdLPoSJu3VBO7F7isA2cR20CrX05j6hhDHE3EJpxkZLV1Zc2lyIkJs97kx8ztSa1ZCBFLeRKHhOhGePL9T1tszUc1Us/655ojf6yuolgPPz4DrzDehlxabpcCqRdQZrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5IMLkeD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5IMLkeD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244581cc971so75704385ad.2
        for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755695643; x=1756300443; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UEhLj+QpdbdIXsYiUCu+v2MbxwMNrA1QXcK0xjWmvUg=;
        b=G5IMLkeDnXmAgr4nsfml+6yWbtxNfLXmJXzl6kew0N8I/V1T58Pe7g3LkbTyy/beyz
         uGuijg08aQOHF+EbFHELHdEcXL1woIXxxZCyObSLPCF7G+iiLUvukO7kWagAWMcyvQak
         N8se//52TnxDclmxMELl+cTH6EYxj8WBegnUIRrFLizA/Ub/mWQ27SHfi90aCDOriYaS
         vfw5p2qZcB/R6jKxsoQDCX8QEgCYrKk+3rYYuJigskIVFr0Ffy8IcW/n2IvB9vnAoE6n
         8Ro6VOkr5aLY+woXDr90jdR13lrDBWCqxrFJ/W07yh5GfNW4FS3RJY4FOLWhwQhnec2b
         WoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695643; x=1756300443;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UEhLj+QpdbdIXsYiUCu+v2MbxwMNrA1QXcK0xjWmvUg=;
        b=enbM+vPZllP9Xw0tV680xBgKoQRbKP2MAKhG6aWs/SDG4UdaqfYKul8gtcw//AFaig
         l2WOw8ZIvs9JP4T386lnTEXqtBHQi/XLGvLz6wy0BXvFYJ14wiFGpVkxNWVXf/cdSenb
         NnI3t0/ZyEJmrj1/KFSHEZRCj6OS1pw14fCBiMpt6S6A6tnL6Hjv+AU85/+RDYxxELHk
         PZvxf/krbVluuMUDOUjLXSPuIUp1fiX9YcvLFcmtFy6cpxECGLVnHezV1LEuoP6VHuDL
         LRV/B/mxzDM6lWz+wVCIUkGIXdZJkCwJtmJ/QiNbJ95pBvSMHx4ghjngVTDG33t3/FN1
         +67g==
X-Forwarded-Encrypted: i=1; AJvYcCUyw4ga/mAEamSaPh+b4yEVd+FWe8Um28v2B2UO4oycxxyres22ptj6W7HdPPYUP2H+MugfRW7z/Q4uZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfkVU0H3dvClEvYUyD9ttlTuvMsW1FDO6r6QOn63+OMMfvn8bd
	oVJTeQz+kZtyuHkiE0GxGZ3hHfh3tVR5jmAZP+hNT5iwfz14FPj8pGIZ+ip15n35Tz4NkTu5Wpj
	uq1jZh2c1EzQ34zTKXABCEvRs9OQ/8BOH8JrcFJ3XBg==
X-Gm-Gg: ASbGncv84fV4/9Yjrm1chr29xSo2WcD65z0/dr8dEsZrQ8JN0Co3d0WBoB5BY6f3r3e
	Cca7qp3EuiVHQNAPKi+EvEDg3Kc9p7G92ZpNmoX5mwScKkTWUq0ec4uxlbpmjVTUtZApXcXtjfe
	PFnWOc5fZev1PNVoU0h5Agy0Z2O7mC5yhUTbsIb4N1k4jrEzJUz5TQZjx6Ocets8NhFDjJxAyUq
	dqpy+Qtpg4CY1OgPUM1Ccna47L6U2pXgjZAXeg=
X-Google-Smtp-Source: AGHT+IFBJmOUaT50s2oqxUyYw4FxsnPw5mGp4PfDEiEg3YvV4hdLkFdHYDMKytflbhE2y2paxnWvZ4jXvQbb3KvxgAs=
X-Received: by 2002:a17:903:1b48:b0:243:926:b1f3 with SMTP id
 d9443c01a7336-245ef1728b2mr39549355ad.24.1755695642929; Wed, 20 Aug 2025
 06:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Aug 2025 18:43:51 +0530
X-Gm-Features: Ac12FXxC0MUMoUEpSUxG3tHBnH_B58ps1yvcBAmlPD_lH0pv4jzn6YQynSvCFy4
Message-ID: <CA+G9fYtS9nDqC7g-B4285gmxDNRkYQixyPYMuzgDg5-sy2FumQ@mail.gmail.com>
Subject: next-20250819: sdhci-cadence.c error variable 'hrs37_mode' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed with arm64 defconfig
and x86 allyesconfig with clang-20 and clang-nightly toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250819 sdhci-cadence.c error variable
'hrs37_mode' is uninitialized when used here [-Werror,-Wuninitialized]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
drivers/mmc/host/sdhci-cadence.c:297:9: error: variable 'hrs37_mode'
is uninitialized when used here [-Werror,-Wuninitialized]
  297 |         writel(hrs37_mode, hrs37_reg);
      |                ^~~~~~~~~~
drivers/mmc/host/sdhci-cadence.c:291:16: note: initialize the variable
'hrs37_mode' to silence this warning
  291 |         u32 hrs37_mode;
      |                       ^
      |                        = 0

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250819
* Git commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
* Architectures: arm64 x86
* Toolchains: clang-20
* Kconfigs: defconfig and allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29595553/log_file/
* Build details x86:
https://regressions.linaro.org/lkft/linux-next-master/next-20250819/log-parser-build-clang/clang-compiler-drivers_mmc_host_sdhci-cadence_c-error-variable-hrs_mode-is-uninitialized-when-used-here/
* Build details arm64:
https://regressions.linaro.org/lkft/linux-next-master/next-20250819/log-parser-build-clang/clang-compiler-drivers_mmc_host_sdhci-cadence_c-warning-variable-hrs_mode-is-uninitialized-when-used-here/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31UgO4773uaneRjyDrf418EXcDd
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31UgO4773uaneRjyDrf418EXcDd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31UgO4773uaneRjyDrf418EXcDd/config

--
Linaro LKFT
https://lkft.linaro.org
