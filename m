Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F91F03E0
	for <regressions@lists.linux.dev>; Wed,  2 Apr 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600037; cv=none; b=SV3Rhfyzi39giIe2v7bPMmUiH/Zm8hWUUs0uBg/WufLidwGT4KKxcI73Snic9JeyG1+rrjBL8gyWM3KPwxSr6vFEHCdqrt3rg/DbXqtFu4ebLJsKei2WKddnqbWchRjASR0dnp83xGRSfdAqfqn4V5TbSsD0gjfF3GJX8l1GnMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600037; c=relaxed/simple;
	bh=N+huIrTauyuCYVT6DvX3IHTIVyunCkxZO6lbTCo1G8w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZukLxayNC+MsPyyPinAFFx69zN8bgFJC5g0dsmTs2GxykQSVmYcHdg3W6WlZT1FqD4qgZ9mP3I0jznQ/ssMB1NLbtEQNIM74H4r8c7kd85a8S83r18lpAJGRprefB+oStlvC9PGnn3c5GEAvHCRimQA3BaiC+ynn4tVDZm3FtkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZbwM/va; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZbwM/va"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5240764f7c1so2665434e0c.2
        for <regressions@lists.linux.dev>; Wed, 02 Apr 2025 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743600035; x=1744204835; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=In+1Y69nMBfgKqa4StrtMwmuVIRitgkzeLMrf8QA0XQ=;
        b=sZbwM/vahXJPmmfX6NcQtLRKRMU65OEWjUQMIq/vdu/WqfGnDsOBuV9Ns0cXhVmLdf
         6FpzlIcsH0R2/+QyTq3pNQ/fo2+dcB7nT59Ne9Rf2qvjupN2fuiVwZiGzXxzAYe64q01
         HVqxck1z5jINaHq7xb8K9BwQe++FZuFokOjZ74P30oVStN1DRhI2OMXf0V9NOlcwqyEx
         YgFTwmpseGgOtf44DgpqMcZux0gtqtiz6/OQSionmNplETArEUWNVSbFzZORh9ut5lhQ
         AidRdAwTj5yWHT/nZMdWrA414dkvacIvSCBHNEB3wyJ1Bmz4aducmjAJUcNbUSWxBOyk
         N6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600035; x=1744204835;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In+1Y69nMBfgKqa4StrtMwmuVIRitgkzeLMrf8QA0XQ=;
        b=HXNb/jPFStnm/qSBjItHo+6oTe64ObruEaqSNy5A3VX2odjF21WJQKaJCTxEuRxblG
         VQJ18SRmBfXY+K0GrdGFpzycpa4BlgjQXpfQPtlyuKfrtYn96y7p/taK+9BQCr1ciEcV
         B6e7kdTKcQ1qczd8iYt7gr4tlhULNSE35nlrISiDXVR4H/Ym7A4GX7ftu/a7qFToy+bT
         TCGA3JBk0zkmZEmWc5pg/9hlWxG2lIYGYdESCyPptd861HSCxh7Ye+GUvIXVzMtvVJ9i
         XfBEZQpf8GOmLjzLWe4OaqOXs3Qu77ceJ1lnWTgxb2PB37YngMC7FZkV106CM5et8rPg
         iccQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn86jTxh/yVHkyZyGYZVDETKdkXZUTJeYuO4zN9UExN6xnYKNs+LL98gAkmZRxzWNvp5uplJeESohZSw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqjh14maJKK2cL5Esq2HDfQq931JIe6rG2uIOXUoc9zq+XNSZr
	LSMIUdNc5Gm7P29OvLX4FfEXbENxc5F99MjDC4BuyFLuL1+BfEYsoCDq6R2tux037fRMgkUeqzu
	UmNBSfFlLMiEdzzaAy8IEVgTmsmMe0wfZHIhesw==
X-Gm-Gg: ASbGnct0K2iDd4Aw3h90N+s5MqAQ923w51NGCXCXu9o8gJYzgfP4q3P5AAskL/fCs5D
	M/kGOzaBuqs7IBNgGP4QXlrgQmgklAiz7N2hWv/G67CrS6YDPmdqXXPmHkWJSYr/qBBYBWvkVu9
	hmmAVLMTRFnp72aSZ6bOzRdn8DPIK8tq6NZMEJfR0dBYSgXF+UGDX7dmCne5k=
X-Google-Smtp-Source: AGHT+IFsHe2qgE/3dZ7ATZQlTlH2f6sgRKoBUonASYXuz0Bb/UAqUiZV1X4Y0sczKgfKtwF36TiHquI/NJM5jnDcsl4=
X-Received: by 2002:a05:6122:249a:b0:526:42c2:8453 with SMTP id
 71dfb90a1353d-52642c2849fmr5205649e0c.7.1743600034755; Wed, 02 Apr 2025
 06:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:50:23 +0530
X-Gm-Features: AQ5f1Jq96Wf-mikRgwQXfn81V0rc9lAZ1ueGPOm8SXNAmq3Q4b2XBmmyCtKsgkM
Message-ID: <CA+G9fYug_77HoqyonvsnJiya2q+0-hf9k4Yjk_dDn7P91Sq+3A@mail.gmail.com>
Subject: next-20250402: riscv/mm/tlbflush.c:195:23: error: 'start' redeclared
 as different kind of symbol
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv builds tinyconfig, allnoconfig failed with toolchains
clang-20 and gcc-13 on the Linux next starting from next-20250328.

First seen on the next-20250328
 Good: next-20250327
 Bad: next-20250328..next-20250402

Regressions found on riscv:
  - build/gcc-13-tinyconfig
  - build/gcc-13-allnoconfig
  - build/clang-20-tinyconfig
  - build/clang-20-allnoconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: riscv tlbflush.c error 'start' redeclared as
different kind of symbol

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
arch/riscv/mm/tlbflush.c: In function 'arch_tlbbatch_add_pending':
arch/riscv/mm/tlbflush.c:195:23: error: 'start' redeclared as
different kind of symbol
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                       ^~~~~
arch/riscv/mm/tlbflush.c:193:53: note: previous definition of 'start'
with type 'long unsigned int'
  193 |                 struct mm_struct *mm, unsigned long start,
unsigned long end)
      |                                       ~~~~~~~~~~~~~~^~~~~
arch/riscv/mm/tlbflush.c:195:31: error: 'uaddr' undeclared (first use
in this function)
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                               ^~~~~
arch/riscv/mm/tlbflush.c:195:31: note: each undeclared identifier is
reported only once for each function it appears in


## Source
* Kernel version:  6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: fefb886b1344e222b3218f3c0165b0fd770e8b88
* Git describe: next-20250402
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/
* Architectures: riscv
* Toolchains: clang-20, gcc-13
* Kconfigs: tinyconfig, lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9owDFW4gzrtyDZItZlOSzN7Zd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9owDFW4gzrtyDZItZlOSzN7Zd/config

## Steps to reproduce
- tuxmake --runtime podman --target-arch riscv --toolchain clang-20
--kconfig tinyconfig LLVM=1 LLVM_IAS=1


--
Linaro LKFT
https://lkft.linaro.org
