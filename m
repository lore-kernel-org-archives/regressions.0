Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393C13D607
	for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286689; cv=none; b=UwsbUNTZXhhh0kupt+5+3fUKSvqHbHJibDJ0gtMDb311/O5iXHW002QhgswMT9N7D+FxC2Bwpie2NnQBvRwKc2aBjydIqxFSw6MSemXlncbbvXaj8TxNSA1VkEhN1gEE0MMqMtAxFqlzAIkfQ9vPF4VMeZ5vFhQCYmYrkEeymSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286689; c=relaxed/simple;
	bh=7NG6uQtL8OtRJ9iIAYXtet9++FwRd1n+ZGC5Hg85Cjo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qHv0KTSLyqS+NFm7c8YXJHFg7shk77BDyHMAsasobnkFlFxJt7LqNBAK7dXZfVRiKDaRdON8rzS6XSINoVg3pqqet8LYrzzn4bsowCVPbLuNIGzdlbr0vA2rvdVZsAumQQVZ7hmLagvBlHSbzT+s5e49SvTjwAOXpupk+/4KU4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2ypWxEm; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2ypWxEm"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-80d6534e302so324163241.0
        for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718286687; x=1718891487; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qu/FWTV7834QtugMZZVu5W6bYVpF/xbRojpTSuPeXsU=;
        b=s2ypWxEmMydWJplof2rzym5FweX8m+i0yefr3H/hrmot//IpJ0+bc5KCCng/ag8fVE
         0xUG+5xculU9uawy+2EUnXpPYTjhLdNufSX0nlGTcydb2uffikOMLNfJLyCNnFtxRbbY
         QSuQ6PiqbynIY8WNVlls5P2aoNhBWPQzbgLOZVu0T7Pw97bUxM7Mub8NFK0PsHUury+V
         4AiE10Px0Fit5GYnNzK70/lmlYaHXOiDGIuh15UFj0GDDWw3zRhnAmQoZRhBC0zgQu9x
         Ut9Bkl9eg7KlndaoyLcNEuUumfJGCOjTNh7ywdq2wsPFKT9UOCJ/hl7qbEbBOlYdISiA
         e0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718286687; x=1718891487;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qu/FWTV7834QtugMZZVu5W6bYVpF/xbRojpTSuPeXsU=;
        b=VLHYy/KvLcq//69l9r3cVWVJhnVGdN5qrgDNBs3k2CurhXHKfvh+KuOO0J0MIPq785
         1nlOFfUuTfoTSfeW66FNgfu2JIpt0WVzr+wbuzLMjEhmRaTZ1rScRzm/nCQshHhdOMR6
         61C2rVZCeTOccvnUmLYHThiu3COPGAYEYACirKtzQpaLWRggko6C1ZJeO1H9y8/NYjFS
         GeE1yEeBmfA9Dma4aCmIpyls5G97f+NFVvgx51zMNfEGVTlu2++CDgXZrSGAPJXUoXBv
         UqmRES5KgRBIZBXcoBG/5N6k7SHH/GAhZfiLUA/Vhw2V/Z9qfPWlcO3TMN+QXnDWoPuH
         uwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCURv+oFvZBwATtysqn5I3gEa05CBrjKHuN8VkXIPbXInKFKFl+WkhfN+StV8+cXHivwwsMHsBSfywQlfHqL2+5W32CpZq5/pOrfD+Y=
X-Gm-Message-State: AOJu0YxmeSrxZrdlQyEHiiCwYQrfma69ULNhc0yD0dZt6lDGoVRssCFq
	i12ajOLwNr9aVIhAKX3Y1fFx5w6A51RX6iU6LL94Y/C0HK7Bg7TxLsp93Ep0h/uquXqr8TrQ+9e
	svhbS9Q4LlF+PnpzWQ7ZC6BpetbGx7bHAj1zFbA==
X-Google-Smtp-Source: AGHT+IFt1qa9H5XAsUr+NTtJxBrGKdzFxfLI2hYbTpXslmysQ/glm8BiG+LX1EBRuRywvOkWId2XTxCK7ADRK0UzvG8=
X-Received: by 2002:a05:6122:1cc:b0:4ec:fabd:d4ab with SMTP id
 71dfb90a1353d-4ed07b0fc91mr4556612e0c.8.1718286686932; Thu, 13 Jun 2024
 06:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 13 Jun 2024 19:21:15 +0530
Message-ID: <CA+G9fYtobhBTnH1=2oHxesLfyYd2VGK55nJn+iniWPj2vyNCOQ@mail.gmail.com>
Subject: selftests: arm64: fp-stress: KERNEL-1-0/3-0/4-0/6-0 - gcc-13 - Failed
 - clang-pass
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Morse <james.morse@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"

The following selftests: arm64 tests failed on FVP-aemva test and kernel
built with gcc-13 but pass with clang.

arm64_fp-stress_KERNEL-1-0/3-0/4-0/6-0 - gcc-13 - Failed
arm64_fp-stress_KERNEL-1-0/3-0/4-0/6-0 - clang-18 - Pass

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log:
---------
# timeout set to 45
# selftests: arm64: fp-stress
[  269.882519] NET: Registered PF_ALG protocol family
# TAP version 13
# 1..96
# # 8 CPUs, 3 SVE VLs, 3 SME VLs, SME2 present
# # Will run for 10s
# # Started FPSIMD-0-0
# # Started KERNEL-0-0
# # Started SVE-VL-64-0
...
# ok 13 FPSIMD-1-0
# # KERNEL-1-0 exited with error code 1
# not ok 14 KERNEL-1-0
# ok 15 SVE-VL-64-1
...
# ok 37 FPSIMD-3-0
# # KERNEL-3-0 exited with error code 1
# not ok 38 KERNEL-3-0
# ok 39 SVE-VL-64-3
...
# ok 49 FPSIMD-4-0
# # KERNEL-4-0 exited with error code 1
# not ok 50 KERNEL-4-0
# ok 51 SVE-VL-64-4
...
# ok 73 FPSIMD-6-0
# # KERNEL-6-0 exited with error code 1
# not ok 74 KERNEL-6-0
# ok 75 SVE-VL-64-6
...
# # Totals: pass:92 fail:4 xfail:0 xpass:0 skip:0 error:0
ok 16 selftests: arm64: fp-stress


metadata:
------
  git_describe: next-20240613
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 6906a84c482f098d31486df8dc98cead21cce2d0
  git_short_log: 6906a84c482f ("Add linux-next specific files for 20240613")
  arch: arm64
  test-environment: fvp-aemva
  toolchain: gcc-13

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240613/testrun/24304165/suite/kselftest-arm64/test/arm64_fp-stress_KERNEL-3-0/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240613/testrun/24304165/suite/kselftest-arm64/tests/

--
Linaro LKFT
https://lkft.linaro.org
