Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489AE2DC794
	for <regressions@lists.linux.dev>; Thu, 11 Sep 2025 19:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757618341; cv=none; b=swY3AFnXKlNlAJz1OhAz1xKToYuRSA8MKqVbfoXLLgQu7u38j+IBK9Jczd0Wdq3z9yypjE23/v5fsQu/MRopq3V+6T6gQfxavuU9hSVw97XlBxbKBDhh6sxiJZ5SimuLJSTCos6s9lIL30gZKvgJp7m27Po7wQrHkPcKMATWvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757618341; c=relaxed/simple;
	bh=/Ke+Nb1gsfRDyew1MtLRw+g0cKYvwkI9gUaQtMkfHhc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AQsfGiVxmXV+QF3a4oimovPlT6oZlrZLTMs9fiNN2MR2uW1tHVKsKvUjA7CGC8+X8ImLH3JO7CMS7VQuJFBz+gIVWa6uxDjP6SdBHQHBL9Obqem6O14dWgiDPu77D8rRkRsXgwDtOX4RghpJ3Rf0LUFg7nz4J16ItqUn9vVzAmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v9FpK6PY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9FpK6PY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-25caef29325so6167575ad.2
        for <regressions@lists.linux.dev>; Thu, 11 Sep 2025 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757618339; x=1758223139; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OMzXnLutBDyDe0cFRFFwMkAW7rZFHmfwIn2gFvrd1lk=;
        b=v9FpK6PYtDJrnWDnfv1gW97XYvU4TckO0mf6M4aFGFUPWzLhfGCIkP53NpipAVONbr
         rFrZxl/ondH40ZOB53+XsblLo1/Fi34PwL10TELJlK4il39HHqgpu9gr49zqmWyfyWMb
         rmb+7q7PAn/WzqbAJg98HH9hPp6UfyX6h2xLVMSvBzvXrxnuTejDdJh/R5/5S5VnFpcU
         K5ZEDvRSD0depD0G+Kl4+Iclr0c0V51wGCNcUvq13Y2g4Cp6ipwJwEufP/P9vTepduCU
         rHSIs7rf04M0mtCq6KfMnI+PSnrn1ct+rKU93qmTqToXj05+jisbnQyJoYn/MOgYv1Ac
         jd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757618339; x=1758223139;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMzXnLutBDyDe0cFRFFwMkAW7rZFHmfwIn2gFvrd1lk=;
        b=VZATThOfv4ll50APpLiMMEdmJ84JeLNnknlqAgeheSKnXEjTya7xKo4WVhFRPi3hFH
         Dj8kE5JDnvDsACta/zO9HwjMiw9pG/1Ijn/KNbAv9G+RFEQoRIktyX7D9Po1kDL0I3Nb
         dWeu/IQYdPFA3fIzq0Cd81K8QhpWLgs91+OYjMvK6uFmRObnnSTC+VqEHJ2OZ+Q9BOw+
         ECcwdHtGNy9+B3+m3T6rjt80KnPUfgKNxoCKhqZPM8/qwro1dbZYNlC/yoEFEyv78rGk
         mSXPaeErETcEpTtqkmk2ewM7xQt+xcvZFD8nq5rHX2OsZMCmfmvSAEVedDDvSDhu+Jd2
         4GXw==
X-Forwarded-Encrypted: i=1; AJvYcCXZD1eDYq6NCb8G0GV/7hYC6jM782RsafLZFP1SDGsMAoqSgE53Ct3+ejn1tSkns4m7ogNDmCZFGg7dgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwClZEA9Mj9H88cdLnagyBWKro3jt+9fZme2jnxZmvaba5f+M87
	6Mf02TDyASSYpBet4OM4ewerU+XtRZmHUK1d0ne4L3MDVsnE2t4MCfGjaQ9k3ITfc34NGMc4PJE
	VLTcK7espxLXNtE0juqDg67izbgCus6UPOJM002GjHA==
X-Gm-Gg: ASbGnculgPIzNF/fz/voyxWbhKuEBCE2MuDLM4ejRNBeM+OeIieO/eh8/5aLAJrvaMb
	CKchFPZ84GGClycnriaz4zJfJNOuPMTMCBX+SDIhrU3S+uupdtkcbAdI08S6GkMdJMT1Ca+fulg
	k1REph5BWjBeDykg/67DXjLRhSI19KMLBwJ/jAnHG3egVDkFvaFqvW/3OcKCdVf8I/6Dw0b6fW1
	ansSSH+xkssCIZST/EkFbbZ9WJW5Dwh+kbuqxUVUJ39F9wE3skwHnwS3f5LyzkQzK6FoY+C3dgK
	kUpsig==
X-Google-Smtp-Source: AGHT+IFcvNFERCt1pxcRVC0LrxIO5qX9I6ZaHaKu41AXHxq/mmXTSKA/Xpf/xNIANgUEzlw3GdicyiK9s1eIUs3kKeA=
X-Received: by 2002:a17:902:f60c:b0:24c:c8d1:2bec with SMTP id
 d9443c01a7336-25d26a50ba4mr4742195ad.40.1757618339416; Thu, 11 Sep 2025
 12:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 00:48:47 +0530
X-Gm-Features: AS18NWDec12kyfne2e8LlQ-fqp880gCW8MHrmOTo3P_JiNjAs1Vmr9Ipa42F9ss
Message-ID: <CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com>
Subject: next-20250909: selftests/arm64/gcs/basic-gcs.c:390:30: error: use of
 undeclared identifier 'HWCAP_GCS'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on arm64 defconfig
with clang-20 and gcc-13 toolchains on the Linux next-20250909
till next-20250911 tag while building selftests/arm64.

Regression Analysis:
- New regression? Yes
- Reproducibility? yes

First seen on  next-20250909
 Good: next-20250908
 Bad: next-20250909 till next-20250911

Test regression: next-20250909:
selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
identifier 'HWCAP_GCS'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
selftests/arm64/gcs/basic-gcs.c:390:30: error: use of undeclared
identifier 'HWCAP_GCS'
  390 |         if (!(getauxval(AT_HWCAP) & HWCAP_GCS))
      |                                     ^
1 error generated.

The suspected commit pointing to,
  kselftest/arm64/gcs: Use nolibc's getauxval()
  a985fe638344492727528e52416211dda1c391d5


## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250911
* Git commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
* Architectures: arm64
* Toolchains: gcc-13 and clang-20
* Kconfigs: defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29827060/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250909/log-parser-build-clang/clang-compiler-basic-gcs_c-error-use-of-undeclared-identifier-hwcap_gcs/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ/config

## Steps to reproduce
 $ tuxmake --runtime podman --target-arch arm64 \
 --toolchain clang-nightly \
 --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/32RzudgbCUiqGUoFtquJ9IEIDXZ/config
\
 LLVM=1 LLVM_IAS=1 debugkernel dtbs dtbs-legacy headers kernel kselftest modules

--
Linaro LKFT
