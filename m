Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8782D4B4D
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703565; cv=none; b=P+M4FM71F0lma+uKsvyAAB6XS0iPKUG34zWPh1bXOVEYRAKi4sbODqJi0Huq7bM6PJk2hyUgpd96gklb52MOwLb0viIVF0opr73BJ5GZZAuHGYGKRvEiWjbq33J1jVqfetwoJ3JY6/evfB96WiFsqyCMMrnwMH1jMLhMqXFjStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703565; c=relaxed/simple;
	bh=j7unceZnAbI/jKhe8OzwmUSk4YWeCfoezAT5k/+mbtE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ii4Goog7vKlgxq+IEQcvYAXKbohysEZudBUFn0eBEKnVBQ4FlhENPnCDo7qm+mIx7ottSbD9Le55hbNwSct5Q926vqH04yqxaJddhR/7Rt/Sp5eY232hNHvwx4kjRFSBdNjlH9dGkxBcwTRlMkYjaia0AHVxbn1eAZJcMEgdMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nk9OsJaT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nk9OsJaT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313a188174fso3497516a91.1
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750703563; x=1751308363; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kruPxOyyvUJ301Bt/UNLMGQOlJa4yMmtInWP2erojtI=;
        b=Nk9OsJaTvEddkHbSxqDLjdTk2QyGcaFif31U6lEgeoElZjnjsJxCajl43W7tQZaafL
         hZhMXRqnODHbiZ+6HrwMUXwYo/YION0uzqVVBXrDtuuRVKfl2wDV9kzdicTcNSYxLwEB
         LV0Je5aE6Bn/TthlVpoWOk9hEv+wVfYbx9mkOMCZP1T1yyTCqZePNIEP3i4uEWjFe3sY
         LD4bZ1pIWdQKIM76QS9hYQRiL67w4pWiFybBDfINznYzhf8AN4uR/1gCZkkrp6NpdXpe
         qrrcR0FeJcRSq34/SbSN6uaGGrt21fuCPA56DxhK51Cu3lFKtqlOHnzZdqHRTSxHX27T
         wzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703563; x=1751308363;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kruPxOyyvUJ301Bt/UNLMGQOlJa4yMmtInWP2erojtI=;
        b=MpSkafFc7M/Vls8p9spmFCW59oe4UArRlNPxo5DI2g0u8Z5YLocjix8GWG5BnyKgH0
         6kadNEc3oW32sBO18Tc3cBmMis/WJcF2abWTET4+2L2Jmupq87wJazFbsM6x+kR9IbYU
         M1dGkMrm0qPiSM3O91HYRwDu5/gnsqg5db+4iS+2vigh0BzRTm0k84ypA3BNwQ49Ipt2
         H6Pks3dFV7zo+HAYErBoTjZuMIMAZLI18VFoz8VgQOuLa8SilW3FjpA5L6r+A8qxSHeR
         u2PCSashqGsnNoSVBwIuZSxCgjfT1GIhS9BxpQia6pE62KeKpQ2jMcGhxK8Fo7GlfsiT
         y1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVQjrNwcxi3PzEs49QlrxhA5cKKpMuFIHwcTjgwvwPZOx2MF0//NKad1waUnkplSTLM2o941WW8Cdx23Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsLi29nRgZoC6E/m60IZMYjsaB/WIx3M2gI2KCFLrfXSIsFTTs
	r7omSSZd+x4qTuDejduG+LNFPEmQjo7Zg/23SnNiw0iSRu8sGfBT7MlxOX03OjZyp8lYeqCiENx
	J7305e/7uc6JSLZYr337uH1Fs5FME9A8hp+pi6PHZ9A==
X-Gm-Gg: ASbGnctCixjrmMoZPwmrmr/eCh1nRh8bWtgZlvWJ5mngv0x7J8in8U3lsnnGM+/asLg
	8N/2d+nGntVJuMpGQdxplLjr/FQB+kKC723tlD852iNcBrlnKN8wvhd/FNmPfr+S2IjicoXBBUG
	jj8G5wrimczVBfWFcVFtw98zoK8dIUS1jR/bmbSeNNZmrNwp3u4piLDEutWXTqSXWglNnp7rYEV
	RTY
X-Google-Smtp-Source: AGHT+IFN+MuBxJ+QUL+UQe2hu7b0+Ppkb80MQX/ZVfwxCOW2lGiDat39qnGph06M7YMdl+YKMYdCUOnoxk8zPjTW19g=
X-Received: by 2002:a17:90b:4fd0:b0:311:a5ab:3d47 with SMTP id
 98e67ed59e1d1-315ccc48857mr832647a91.1.1750703562413; Mon, 23 Jun 2025
 11:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 00:02:29 +0530
X-Gm-Features: Ac12FXz8Xagh8-R9UdOPbyOpKzegWYcA5INp1WSEVpTVF86rd3gJifht0qGqOmw
Message-ID: <CA+G9fYv2i5AOYOkepUq_Rz1wxfzu1o2W59xDgui7VPw7g-fV9w@mail.gmail.com>
Subject: next-20250623: riscv defconfig raid6 recov_rvv.c use of undeclared
 identifier 'raid6_empty_zero_page'
To: open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-raid@vger.kernel.org
Cc: Song Liu <song@kernel.org>, yukuai3@huawei.com, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv defconfig builds with gcc-13 and clang failed
on the Linux next-20250623 tag.

Regressions found on riscv
* riscv, build
  - clang-20-defconfig
  - gcc-13-defconfig
  - rustclang-nightly-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest
  - rv32-clang-20-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv defconfig raid6 recov_rvv.c use of undeclared
identifier 'raid6_empty_zero_page'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
lib/raid6/recov_rvv.c:168:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  168 |         ptrs[faila] = (void *)raid6_empty_zero_page;
      |                               ^
/lib/raid6/recov_rvv.c:171:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  171 |         ptrs[failb] = (void *)raid6_empty_zero_page;
      |                               ^
/lib/raid6/recov_rvv.c:206:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  206 |         ptrs[faila] = (void *)raid6_empty_zero_page;
      |                               ^
3 errors generated.

## Source
* Kernel version: 6.16.0-rc3-next-20250623
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
* Git describe: next-20250623
* Project details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/
* Architectures: riscv
* Toolchains: gcc-13
* Kconfigs: defconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28829977/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/build/gcc-13-defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmqfZ6v24dxq5kjorJbgH6hC8/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmqfZ6v24dxq5kjorJbgH6hC8/config

--
Linaro LKFT
https://lkft.linaro.org
