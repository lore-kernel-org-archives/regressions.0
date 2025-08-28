Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9D43009EE
	for <regressions@lists.linux.dev>; Thu, 28 Aug 2025 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756374907; cv=none; b=TEl0CGrZXskjWOM89Lnou+PXge4GS50uW7ni9k7/fcf0+ewsRx7YuRq3d4CgygUDHUCYhEvW7xUdyEEUT/TMp7JzgZGo6LT9uf6K3AymN7rGoAaYbgw/CeFtcA5oAdnmDC84usm2SfT88QeYuHkjSlHeUI2PjkWMtLQ0ktYmjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756374907; c=relaxed/simple;
	bh=ZVfqOwwixQhN1YsADMJ1GsK96L3zPIgJ19cSnfmn7Po=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tBualpb7biEhEsIuQTX0OeR6oPe4IESjh5pChrxAHSQs1lhyd3CsPwmjtf8UBHZgkRq1Dtp//4IVbOgharM7AGif2I8QRimfbV9JPWwy5uGp0F6WKPu0OGi4eeigWUIxZZvAT6suo0rHzAiBP0YfrvRBnolYky2oafuY3lPSP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQrboDOB; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQrboDOB"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b49e0686139so752137a12.2
        for <regressions@lists.linux.dev>; Thu, 28 Aug 2025 02:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756374905; x=1756979705; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0jvuITZ/unJkIw6qmtKmEjkIbRFIhMwWVAIfVS1zjig=;
        b=TQrboDOB86JzqIhHGLk7urNHNs2ljeRUwd9I5P1w1MIsFzZ4cyaFH4IImeQ8mISRSo
         HJ1B/nlv7CDjMYFhG1COAG/NknEyWuq2fTeRB+1nvt+BbrXXNmJdi8y5BubcGRNyyIva
         69noOT7WeWpXcaJW/qX3YgfHtRoGLxjfoEUnw7QezQJBqKLMTbdfrQ5iGanltYyYZzJ9
         ujjqw/yheFzN88rYh4lfOLUjrYSspiloTyRx3LGehweWPMsMtmLCQi60Qi7g/+LL8mYy
         T9NBJjEpwukI7iU4vpdNlv0q2Uv3Hm55dWAAnSLNlg8RFN/SPRmzx+3n9mYQpmR54oh9
         CvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756374905; x=1756979705;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jvuITZ/unJkIw6qmtKmEjkIbRFIhMwWVAIfVS1zjig=;
        b=CuqgA5Pq5YsT3NonqUu+zfZs+IHawxf1sXSMo1xaYU+vMMT/TquxNgQ14L0gQOA7hx
         Jp5QpxQwAc8WdvE7JWPdlBEtovkT9O8Jr50kYalAxrHJqVppvAQdz3OqGYw8qudOmsDd
         YeG9zSUKdrIvb/z9i7SHxA6TUdwx3PXid0UJ8/b1IaYhfR89K+GqEhwiDdPp/ATXyqW2
         geaATCCF7tg9evioGwYcryaINyg7Rha0IkNpxja1ArLBsaLp7Z2DOykeFnXtx4LU4lzZ
         lBEWLYU3vGmIa4q8rGQ5tOvjzKIvL8u7BqZubk8pyVknneuZfHkbyqIQ9UOoeatYRWL0
         gMaw==
X-Forwarded-Encrypted: i=1; AJvYcCXFnzMbe0hjD26r07uJoEnuBxo1AYQEGAagKQlFFohpROY4m9rkud18n0LuQ22AfR7Mn4LFanKLY6JizA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgbjGUJAQUUJjKVFVjwBDLfIcifA/XGQKztY3dpzuIusQl807y
	U3VzOrvgJfaxV2/MFrd2+911fKVQa3a/JexFoPar9EFd+FK0PGD/3TJleCGlpAI0yXtshcRyktq
	2fYLlm7DisJl58W6GbC0JIpz83t+Ijhr7B5hX6N8/Ng==
X-Gm-Gg: ASbGncs6zrWCfTX4Pdkj0pFxZTzM2fLQ2PFQrgHIjY7SNPJLSaoud1ikRg1Hz7N+j/+
	YlIcK2Cm/PhJhn9jM0Ihn6oRjt+6tQK+KnE4yTBbGcRgjjKcoaopaE6aam+2KZ24LvJgx2yGMmQ
	mzEBn2EXm72dPB9Qp835w3d9/nhQIPq0Aa5Ok8mEBE+c2MbdW6MJMd+OJdbIxMWSS9fHVnqM1aU
	JlJ1pxk5M2iGiUeRz6EBMza2z/kcLqp7YOSZCSi
X-Google-Smtp-Source: AGHT+IFguJ+Z2YRJ9oQ+HqMrtwdA6Gs0EPRzyWeqEUpa81kCuYGFXDbA1Lv8HrhL0LBAfCI3DqPu7qWgxYGM1sgbFHg=
X-Received: by 2002:a17:903:11c9:b0:243:47:f61b with SMTP id
 d9443c01a7336-2462eeecaaamr332793775ad.45.1756374905075; Thu, 28 Aug 2025
 02:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Aug 2025 15:24:53 +0530
X-Gm-Features: Ac12FXyceiP5RR-C_nUh1L7LdZ5AX72S9AZ1y-5AioD-F1Rzld83iOQ0aG3Om6s
Message-ID: <CA+G9fYuysVr6qT8bjF6f08WLyCJRG7aXAeSd2F7=zTaHHd7L+Q@mail.gmail.com>
Subject: next-20250826 gcc-8 compiler_types.h:572:38: error: call to
 '__compiletime_assert_478' declared with attribute error: FIELD_PREP: value
 too large for the field
To: open list <linux-kernel@vger.kernel.org>, PCI <linux-pci@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on arm riscv mips with
gcc-8 toolchain but gcc-13 build pass for the following configs.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

First seen on next-20250826
Good: next-20250825
Bad: next-20250826 to next-20250828

Build regression: next-20250826 gcc-8 compiler_types.h:572:38: error:
call to '__compiletime_assert_478' declared with attribute error:
FIELD_PREP: value too large for the field

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

arm:
  build:
    * gcc-8-integrator_defconfig
    * gcc-8-omap1_defconfig
    * gcc-8-footbridge_defconfig

riscv:
  build:
    * gcc-8-defconfig
    * gcc-8-lkftconfig-hardening

mips:
    * cavium_octeon_defconfig
    * malta_defconfig
    * defconfig

## Build log
drivers/pci/pci.c: In function 'pcie_set_readrq':
include/linux/compiler_types.h:572:38: error: call to
'__compiletime_assert_478' declared with attribute error: FIELD_PREP:
value too large for the field
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^

Anders bisected this and found,
# first bad commit:
  [cbc654d18d3743cff70b2dafb64c903b8cd01f2b]
  bitops: Add __attribute_const__ to generic ffs()-family implementations


## Source
* Kernel version: 6.17.0-rc3-next-20250828
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250828
* Architectures: arm riscv mips
* Toolchains: gcc-8
* Kconfigs: integrator_defconfig, omap1_defconfig, footbridge_defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29694807/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250828/build/gcc-8-footbridge_defconfig/
* Build error details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250828/log-parser-build-gcc/gcc-compiler-include_linux_compiler_types_h-error-call-to-__compiletime_assert_-declared-with-attribute-error-field_prep-value-too-large-for-the-field/history/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31u6OUKGnkxZYEIbLMDV9Fi1OgZ
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31u6OUKGnkxZYEIbLMDV9Fi1OgZ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31u6OUKGnkxZYEIbLMDV9Fi1OgZ/config

--
Linaro LKFT
https://lkft.linaro.org
