Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03162F90D3
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 06:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189265; cv=none; b=lfdBoWfgc3WxDOlZcLNykhGLltbk90ISeo9z7GNt/LbaJn9Ma+4t3hgm5SjcBDK0cYabunf55fCQ8tTTpbX3AQK+foL4wwXZWybWry3xzaH7LUsUMDeQW6bfhYNl5f/dIy53pJAr7Hdi2sAjm5GU6wkL2ViolZDbD/6YCki282o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189265; c=relaxed/simple;
	bh=S7v/e+cN4Wf16k7rEO/bWPt2ZPC0mpZbm9jUun95K3U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ryxggl3tUtQEboN2/x1zwW+M8pLH5da8duUUI3owyGmbGREwgYr0bPAz6BD2JuYXzWIqfEzaT7baDLiQxSatlmq9wGlYVzbic/7AVX6tCDvdZ0X/GkSj3XlUXwg32pCCaZUSO/YudG3+eYfLR5k2gSo4vmz1aUUnKzopVo6eEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNNeoENJ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNNeoENJ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47173749dbso3675345a12.1
        for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 23:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756189263; x=1756794063; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MFYRl1ZFHjhZrd7h6GtCM5LUiRUxEc7ppUKwn5M/+7g=;
        b=yNNeoENJVnnyM8IFAwSxDR37JRh/FuxvfHPoyMbKHBz1W/q2OTL14TC2QoaJXVixBt
         0vNuhAoR6a2FxLAqfPRL4z9j0zKt5NV/lbAuNQcFtB1aoClVphGgTlKcxjnl2lwAUfad
         YQWBCx8+2r8RVqZD0t4SRW0iSj3dAOnqUN+O80I0U35mvqoMjyv0l01IAZXPqEkSPk7I
         1kDyF9jECoEiocLsprlHcHd3s0MmQvyQpd/38yVbHM/O+rhk0mhUJ6myPzDRcCXvk44N
         xaeZVHBTQo+TtCx+dR4vgrxJiK1hmhWBVWgYB86cQSTcxrt5nNzoTExEVKBYy1AccruS
         BKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756189263; x=1756794063;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFYRl1ZFHjhZrd7h6GtCM5LUiRUxEc7ppUKwn5M/+7g=;
        b=c7ytP01skjuaTvlpe0HXGubURQdlCJaulVeymooBd4jkeDScXVSAiqsD9LbF2SOkSQ
         +Fv7wn6H6tygBNynij2EEf9T64g0KO5WFwg5nBcob1XyI4PSF5mYGsG1JWecua1Qyh+y
         B/FVMRuWgQmSmaNYhtlLLf4ARDJaJYZlNVkJoTiA/p2pBRYJsa9RmmNLVBLZIRfxzQpa
         rLAaHDSAm/gnl6YVH8B30qe2j3xw9ZxbVQvGXJa8CpzJkbsqnfoO72lY9iCAtixmL+5F
         M0/lsf3K9uiWRIP2UCZE7aBCY3+dStckmtxWarvuAjbNe5pw5fSl+hW8Teno/vDHo8XK
         tNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEvJM0sS7W4LUdWeGA8ajMP11C8F8xrLvMg1/bss/Ce81EFPR78fCPBb0GbrXx/Zg9pDeGrQllugKrbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMUrQGg2F+6pmINSHcXstMXCTBuWvc1ksIU8kJoHyLJzfLq8o6
	rT0tdOiFFL3oFpqsgoOK1xudDCTg2cQRh/YYRb7AW2oBvGjfs8cG9RfUAvRvFBu7nFTQy77Z296
	ooz/1hTZ0vcJAksEjSlYccgvosoa//OvLlbcBY3TV7A==
X-Gm-Gg: ASbGncucGWgnp9uUqSoK/yuZmPInFEe+KiuvHhlkC47AChgl8zOWoARVV+XfAARnDaV
	AMDz9E2zvbeLd53zTOAcuRQ08cBToy5qLzMGlsQEj+Kzjsyp/0pQlIs3QqHdfRojo6/LE4/EViY
	GdKNiU8wkrUe9IO6Gt51NDRGO3H5b26iKk9sqW47zkBtecD8c424Xdf0GU+3bBKIZXQEC6O9+gD
	5KORGXTN6fJpZTi4GZIjRKOqu0ApqU5EW5AYRM=
X-Google-Smtp-Source: AGHT+IEaOAsyEwvYZhL6gwxls7OPv3CjgiN4RcC1NbjL3gx6dd9cjdG1OkopmuigZ7xW+OLJUx5JyXWtdmH6vWAFnIU=
X-Received: by 2002:a17:902:d585:b0:246:b41a:bb90 with SMTP id
 d9443c01a7336-246b41ac045mr106384895ad.2.1756189262339; Mon, 25 Aug 2025
 23:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Aug 2025 11:50:50 +0530
X-Gm-Features: Ac12FXxpo9Z2nstlPDzyogezkDDH4eyaoMNNWqxf1iMYZc7Yw19lKOYzdQTyf50
Message-ID: <CA+G9fYs2Wp33dq0jeuWqU+67z3VzP2LyHBXSD+SecqqG2OiJfw@mail.gmail.com>
Subject: next-20250825: riscv: pgtable.h:951:40: error: incompatible type for
 argument 2 of 'page_table_check_pud_clear'
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors are noticed with riscv defconfig with
clang-20 and gcc-13 toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250825 riscv pgtable.h:951:40: error:
incompatible type for argument 2 of 'page_table_check_pud_clear'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

riscv:
  build:
    * gcc-13-lkftconfig-rcutorture
    * gcc-13-lkftconfig
    * gcc-13-allyesconfig
    * clang-20-lkftconfig
    * gcc-13-lkftconfig-libgpiod

## Build log
In file included from include/linux/pgtable.h:6,
                 from include/linux/mm.h:31,
                 from arch/riscv/kernel/asm-offsets.c:8:
arch/riscv/include/asm/pgtable.h: In function 'pudp_huge_get_and_clear':
arch/riscv/include/asm/pgtable.h:951:40: error: incompatible type for
argument 2 of 'page_table_check_pud_clear'
  951 |         page_table_check_pud_clear(mm, address, pud);
      |                                        ^~~~~~~
      |                                        |
      |                                        long unsigned int
In file included from arch/riscv/include/asm/pgtable.h:139:
include/linux/page_table_check.h:125:75: note: expected 'pud_t' but
argument is of type 'long unsigned int'
  125 | static inline void page_table_check_pud_clear(struct mm_struct
*mm, pud_t pud)
      |
     ~~~~~~^~~
arch/riscv/include/asm/pgtable.h:951:9: error: too many arguments to
function 'page_table_check_pud_clear'
  951 |         page_table_check_pud_clear(mm, address, pud);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/page_table_check.h:125:20: note: declared here
  125 | static inline void page_table_check_pud_clear(struct mm_struct
*mm, pud_t pud)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:182:
arch/riscv/kernel/asm-offsets.s] Error 1

## Source
* Kernel version: 6.17.0-rc3-next-20250825
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250825
* Git commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
* Architectures: riscv
* Toolchains: clang-20 gcc-12
* Kconfigs: defconfig+lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29652465/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250825/build/gcc-13-lkftconfig/
* Build error details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250825/log-parser-build-gcc/gcc-compiler-arch_riscv_include_asm_pgtable_h-error-too-many-arguments-to-function-page_table_check_pud_clear/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31lrb0XugzFZYDePlPNpSIVTzeB
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrb0XugzFZYDePlPNpSIVTzeB/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrb0XugzFZYDePlPNpSIVTzeB/config

--
Linaro LKFT
https://lkft.linaro.org
