Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A092D878C
	for <regressions@lists.linux.dev>; Tue, 15 Jul 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578598; cv=none; b=mkQfyvHpIOffJK7OQw9rWjpu0dRfvYieQHiKHT70FLj54Z/D0u7lPm6V2vEApVVOvMMuv+zf/m1iRHYFJIGLVO6bRIIV1UXOhrQRSbwWjOoR8hu4JminppI/MODgkVCgFP6LQZHYcvugKywygegiOUnQdLiruLKGGuzQsYsmhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578598; c=relaxed/simple;
	bh=IY0RYliD52Wg81NkyznsIfbLs+A8l+WlswZeYFbvDtU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ED+Q5AfC/tbmYedJs5gXEkGef0fwXLTUJuMonhVyjoz1cZ0jb4kv2nc/Opkr28Y4BY+2EQJCBmJGIm+tKs4ybcSHMkvCh4ARuxkcg1dIePceJk4dKw0oCATuJU+uZFmKT4t3MasnxxbmSLbiW6WuJq+LruMXkqTU+VO43ok/iKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IM2bBlr1; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IM2bBlr1"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so3988748a91.3
        for <regressions@lists.linux.dev>; Tue, 15 Jul 2025 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578597; x=1753183397; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NcnVHT6qn7BJ6Ec3gjN6DJVTr3Q8w/Kv+WVRHHdtL8=;
        b=IM2bBlr1/ZnIB5DLo/ZPwK7tA4WDZ3Y60YvPJhC8+tj3asH17qkCuQy3kAZFA1Nesb
         3as95vbCn3ZfrAx9YwW45ToEGlNTsMUgsfSnwyPkIMcq6Paf0EmndPPdYoZ1C5MuCptx
         LSbD2JeXc8AgNKO77eNy22tMBrZ+v2ic7OhSsANT48NfOfXYIIGP44SD+pqLM7wLPNA3
         wqJgYKiCBTktjFTu/TNmgZBxPwimWNHE9KlpGXcLw+bMWa/R2/b4I2XaI1DCfL93gkrv
         gOONkaVnGAecpwbErROv4i9hzm9rV/NNVyOqK6KALAE1oGxEcGXjEQZanHrr94xTjoXK
         EHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578597; x=1753183397;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NcnVHT6qn7BJ6Ec3gjN6DJVTr3Q8w/Kv+WVRHHdtL8=;
        b=q/TdAifMucMSdm6rRSTGcvct+ERhl3ktfh7sa8k4Fo3qCBarlcSAzf4EV9/UhP6Qrk
         +Tzd9TEALPFqLR/ltf/+NSXC7H26hnf1CvQ+9cx5Pq/QbswOOtwNz1A/DmtaWK3Wg0S7
         goT2eMwldocwX8sogrCPnC4t6zTCuOAG9wMFoBwqJgGOWg0EkJP9w7dfTWWL1sKDq+Ko
         Lcr6YTumXLbUZvNdO0yyVIkw5VsQ2yCB1f/9w8PT8RtSPf2xYEHzs3PgKR6yAgGblQaD
         G+UZT4JTm4nX1aQJN1JiLb4nEeoVX93a1ewrVLyxF59MQpACm39ZtoLdnL5fHkk8zWAt
         sVOA==
X-Forwarded-Encrypted: i=1; AJvYcCUDT9OPdU9n8jTN+/yheg9pZpKq6o8Ccv9trWLd0Le6q4q/aWiYZ4GWpLUnzuJlZK7qIETui47fxfvirQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws1R74HKu2hDZfCQTj5AATgJxSio3i3cesYOc5SmV5hynvek9s
	oM3+7L9hQlhL4ssrApvJ/oLoMzkZddgrDJBNlM2ziGgdWnvq9P+3FRmf568vkeiS356eX8M+3NM
	8Qmpj5xebmKuIKRUDR5KUv66HWRKwYXlZOphGyRFX0LjFfpWZUT58Oro=
X-Gm-Gg: ASbGncssopUMLgvTPVbFLdPnyImKwDReimnlhm6YV2jpFbqZeGSUajVnCMnh3IsB6lZ
	rn/yIn2OYvQ1eC4uHSBLvPZLTilyi2A/2avXsmkiXmC9qcYl9SmjogzbHUTB84Tam5fyALij8Or
	LyEOjBaPjVG9VYKvykdJz1PJw0W9cZVH4TtFoO60F9aeDCLZJTac+TFnclQChy5q1yPm3/mnEHp
	m2oqQuswQHyLvBzWzYBa5OLTSoaWRLKCGGAERz5bS5lpsGRL2U=
X-Google-Smtp-Source: AGHT+IELZ4SimOBJO6yrghuVWIOvvAedlzL4IeD6zPpIQjSz8JGeh7uFbZ7kG0dhBVgjaSWgYEdK7o4EE+MZnbE6CoQ=
X-Received: by 2002:a17:90b:4c0d:b0:315:af43:12ee with SMTP id
 98e67ed59e1d1-31c50e1763cmr20865064a91.16.1752578596648; Tue, 15 Jul 2025
 04:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Jul 2025 16:53:04 +0530
X-Gm-Features: Ac12FXw5_VIt4EBOG5y1_FGQ9hbqKjaE3fl3SBQ4AiBXr0z1r7gqAHncSjssGvY
Message-ID: <CA+G9fYusqGejrepNPCR-7ZZDPeQQfZgf2z=_aUz_03QHm7Ccaw@mail.gmail.com>
Subject: selftests: arm64: mte: check_prctl.c:72:17: error: use of undeclared
 identifier 'AT_HWCAP3'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Benjamin Copeland <ben.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The selftests arm64 mte build failed on the Linux next-20250703 onwards
with clang-20 toolchain. still seen on today's tag next-20250714.

First seen on the tag next-20250703
Good: next-20250702
Bad:  next-20250703 (next-20250714)

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression: next-20250703 check_prctl.c error use of undeclared
identifier 'AT_HWCAP3'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
make[5]: Entering directory '/builds/linux/tools/testing/selftests/arm64/mte'
  CC       check_buffer_fill
  CC       check_child_memory
  CC       check_gcr_el1_cswitch
  CC       check_hugetlb_options
  CC       check_ksm_options
  CC       check_mmap_options
  CC       check_prctl
check_prctl.c:72:17: error: use of undeclared identifier 'AT_HWCAP3'
   72 |         if ((getauxval(AT_HWCAP3) & hwcap3) != hwcap3) {
      |                        ^
1 error generated.
make[5]: *** [../../lib.mk:222: selftest/arm64/mte/check_prctl] Error 1
make[5]: Leaving directory 'tools/testing/selftests/arm64/mte'

## Git Changes
git log --oneline   next-20250702..next-20250703
tools/testing/selftests/arm64/mte/
1f488fb91378e kselftest/arm64/mte: Add MTE_STORE_ONLY testcases
391ca7c81b85c kselftest/arm64/mte: Preparation for mte store only test
d09674f98cdbf kselftest/arm64/mte: Add mtefar tests on check_mmap_options
64a64e5d12f07 kselftest/arm64/mte: Refactor check_mmap_option test
49cee364c8665 kselftest/arm64/mte: Add verification for address tag in
signal handler
ed434c6e08132 kselftest/arm64/mte: Add address tag related macro and function
2e3e356560ef5 kselftest/arm64/mte: Check MTE_FAR feature is supported
cfafa517c9e65 kselftest/arm64/mte: Register mte signal handler with
SA_EXPOSE_TAGBITS

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://regressions.linaro.org/lkft/linux-next-master/next-20250714/
* Architectures: arm64
* Toolchains: clang-20
* Kconfigs: defconfig

## Build
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250714/kselftest-arm64/arm64_check_ksm_options/
* Test run: https://regressions.linaro.org/lkft/linux-next-master/next-20250714/testruns/1615508/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2zrW3Ut4mYWOxPVnJTOY5qrft0P
* Build link: https://storage.tuxsuite.com/public/ampere/ci/builds/2zrZgjFum1wBbTRrsvDGnHC9JMt/
* Kernel config:
https://storage.tuxsuite.com/public/ampere/ci/builds/2zrZgjFum1wBbTRrsvDGnHC9JMt/config

--
Linaro LKFT
https://lkft.linaro.org
