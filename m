Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32220A5C3
	for <regressions@lists.linux.dev>; Mon,  7 Apr 2025 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046896; cv=none; b=dLvy6w4dAOAsC1IAWhFMRnSgHiHeNHKRmcsGrcmQbqH3w+AnGl1X5QJCa8QOKWuKs85qIshWefQLCjxYIv6NsPGPYwYycjeWroQEYblFRxgSJFslLWNODpFtZKMbIXf/zzyri7KRD7zqcHkLRWBjMZn2i5zCbsLYTue4pN49Vho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046896; c=relaxed/simple;
	bh=a6Z+ENeEuUU+yC9/pxXn5f1hhHRj75A4YQ3p6o52+7Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pnfjcs9/qk3IPdm2jmm+QHRLR3k5I0T0k19eh7G32lui3nc+zW2NxLOEzT6mqpCD670McZaaV67EebL6I6XduNZQQfqxcGdtTxF+qmLHlPfHWDF3rmal4hpnzP2Si2PKI1hpLDoqZOhQmPWFfEP3KO8+TDiu2G+sMWb2G5Ykhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABzrAxGl; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABzrAxGl"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-525da75d902so2013452e0c.3
        for <regressions@lists.linux.dev>; Mon, 07 Apr 2025 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744046894; x=1744651694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a6Z+ENeEuUU+yC9/pxXn5f1hhHRj75A4YQ3p6o52+7Y=;
        b=ABzrAxGlmv+cEZUwGAUErem7fNQJlRgNqG9Da0qrvoZ50ZzXvpKsBFYyf7pX13QLs8
         JcJrIBMc2ojZBAJm6gL2rqoatnZnHz/u1p43WUsJ8weW5QmRbZVJrXtoQu4eqYzydfRP
         pR/K4QbXqnxL5zO4SF5EIUt6RkfpJ/cD9QHfdpNVYNOkX5vEpxE6YKZrP2l3EbkI21Cf
         4oCV5xGJEfOvyYr4Vk4mdMGRQIrlCRWNsUuSAvYO0twWB9JLYck5S0Jo//liIoPmdZRL
         eq8T91kEP5ICOB60ZtY6sjpKtC4XvlytGuh1ntazLbT2FL1O9Z+5onzGS3Ab4Q2Pp8aI
         OPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046894; x=1744651694;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6Z+ENeEuUU+yC9/pxXn5f1hhHRj75A4YQ3p6o52+7Y=;
        b=KL/789YRad8TX/ffr6mc9KtAQaX7K5e3lWy0I6mTHGWvkG71bG+ahOQDo4f8eLqX1K
         O2qyEMzCbjoPSlPWF0s2GIXATGkYMhIceO8uzB0kXoU4aSMcq7NRQCklmVhubbEDLjWI
         lCjFnkLdErlUGok7GhqkHcFZqZpX5nvIW1O/fX0LFWi+wwFU1uu5BipNN0YQoP/1wwe0
         m+JG+8i/rWYx0eRlWri7Dby8DDqgHOCDwMrmsqTU2jgP1o2EiX7tVQ3qtlmNNZH2i0Ha
         k92fwwRQr7watWw4LWiC7ZO6V8UO15s2icK9Jvh1MaSYqwqzXa9fBHLVSGRqqSzmvNIF
         vqOg==
X-Forwarded-Encrypted: i=1; AJvYcCWPeV3H3E/+CO7+ENgJ3ZFU/+ERAhQEjaIOAXjFPD0cGqgclMeFTR/K/959LZTEFwuEqYgssh9J/M0QXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg9XWMYxalWvE1XGTWQnoG6MfGu8fa7h/eiGmRMVw+/FiQVP6q
	7V5Wxf4Qgb4Z/ugoI3DZiLmaVfChYMEhsQdPJjiZvp52+kuXT7K+3bpYTQiRIVacSmL0mRBMmzh
	v3F4tQwG3nrhTD5q1zdElg2LeWm1yBfzfRQ4qDQ==
X-Gm-Gg: ASbGncvDSjF32YQYS0tIoPTzzTRh6QCPQCFRDbw2pkwig0TdpWsB9l7rlo0vkPd+y8f
	4iiA0O0fxN60JUh+UBBOrj4lDDsxD1b7XSDf2dIe61KB785wuT2VSyNJgMJXNAjyHA6gG2q4Psv
	oN+hUcKyhhBKQmNhIbvqmz4HAIuFm4XTj6FEcDkSZMLSiEf6rwm9Dxtouyeto=
X-Google-Smtp-Source: AGHT+IEVmMkitaw4QXdhkgwEdPJbukthI9jSNdopAjIIvfIiiFbgx7Oz2lGA20nc3VtA0Aj3qI6veAxd6wO3GXeed4k=
X-Received: by 2002:a05:6122:3122:b0:526:1ddc:1896 with SMTP id
 71dfb90a1353d-52772cd6318mr5308951e0c.0.1744046893651; Mon, 07 Apr 2025
 10:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 22:58:02 +0530
X-Gm-Features: ATxdqUG0lZPw-xmkzQsqNG-x55VknO4sMa7eENem1IFu3dmqQUBmDzTB3tDNgw4
Message-ID: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
Subject: Build: arm rustgcc unknown argument '-mno-fdpic'
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, laura.nao@collabora.com
Content-Type: text/plain; charset="UTF-8"

Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
Linux mainline and next failed with CONFIG_RUST=y enabled.

First seen on the v6.14-13039-ge8b471285262 (April 3, 2025)
Bad: v6.15-rc1
Good: v6.14-12966-ga2cc6ff5ec8f ( April 3, 2025 )

Bad: next-20250327
Good: next-20250326

* arm, build
 - rustgcc-lkftconfig-kselftest

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: arm rustgcc unknown argument '-mno-fdpic'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
Unable to generate bindings: clang diagnosed error: error: unknown
argument: '-mno-fdpic'


## Source
* Kernel version: v6.15-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 0af2f6be1b4281385b618cb86ad946eded089ac8
* Git describe: v6.15-rc1
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/
* compiler: gcc version (Debian 14.2.0-19) 14.2.0
* Toolchain: rustgcc
* build config: rustgcc-lkftconfig-kselftest

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/testrun/27924146/suite/build/test/rustgcc-lkftconfig-kselftest/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/testrun/27924146/suite/build/test/rustgcc-lkftconfig-kselftest/
* Test history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.15-rc1/testrun/27924146/suite/build/test/rustgcc-lkftconfig-kselftest/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNMCPjd4rTR3hQdnzAuHzLE1NR/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vNMCPjd4rTR3hQdnzAuHzLE1NR/config
* Test history on next:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27929685/suite/build/test/rustgcc-lkftconfig-kselftest/history/

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain rustgcc
--kconfig defconfig --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
--kconfig-add CONFIG_ARM_LPAE=y --kconfig-add CONFIG_GCC_PLUGINS=n
--kconfig-add tools/testing/selftests/rust/config TARGETS=rust dtbs
dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org
