Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8812957C2
	for <regressions@lists.linux.dev>; Fri, 12 Sep 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757676771; cv=none; b=h0tSOKWQrXM4bcSj3Jrua7M0VvYdtSE0YNId8TwCbC4rHBinP/wjmIYRFBVUNRNsAJ9ryIClwCTaJPTz1iCYUsIjlUgy+GtKA+kn1D6t1fH92yvWp7IP99j0wzH7FhINlTna6yz+v8F+R2WGCuRGZ9XehLqUlvwcD4hAERuDshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757676771; c=relaxed/simple;
	bh=mEjJFVIYIe7tqpxYWnwn8npcdZ3rzCy2M6nLHqTd3WY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HJxveRWx+dqfTlMOF7ASb5VSJgEzRdivRzc3FyhtSf9KqQeG4m8N3WhjQWoGnf3RU+m8fp2A3CA7YSrDbUXXZepZzl+h1b0FieoyS1rzcL5TEdBA0z4d5ZKlZPyw4/XOqQRzGjgIvTyOgzo0i65AN7lodsO0OlV08q+evvaPIMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j37E3051; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j37E3051"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244580523a0so17995005ad.1
        for <regressions@lists.linux.dev>; Fri, 12 Sep 2025 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757676768; x=1758281568; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6Vu9krI8L/L917eJRdmIwH3Jf+YuSh9fi/gZdnGGTM=;
        b=j37E3051gXJSQctu6j3m+wV9U/K9uO61cBSvxcH7UHDKrlsFus9mcFSG1a9FI0huh5
         1Siaw2Ns/eIm2yKxqUsRPbmIkzL8UFSPHGlR2hHRkNGm3+ksRD0D9DoSqNQEZtUrSTWk
         UQL3BIEXm+KkriHiIXLoBqhA9ScT+beCLHhIqJfzlgXPuBKDCQO7th3hyHzuEkVdzTKg
         eTMxGLaXBUcVkfuE0A73/APxWFThH/NFxcygsVU9xNO3IwvaFebJ+wJO9qhhlftT7Jro
         SPosR9MvRf1OQKY4GN58IyOvacdbD0vDNtEj4nBZhMpr6oOHPWjOejnso7d8FiKt/xE3
         dQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676768; x=1758281568;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6Vu9krI8L/L917eJRdmIwH3Jf+YuSh9fi/gZdnGGTM=;
        b=eL3Rw+ciUVGqhTA6p8KANMnhJHn+xv5BCgnuTTc9YKW9u6LlKR+Qj4Jha2vKM7wFoo
         dek9fwRJ0iUvAqcauU8Sz6y/5ioOpSFNMhDltUeiSwDR2e2qS3/4amu6w++YMwENX/fI
         XnhcQZwhLQL3//5sLViRGx4K4lvSvQeHYP8wWy03lMP5E/5Su7pnq/UX6pTAgkib5/hQ
         7AEy0wsMJRt2iqpcyGfJy4plqKlcZSyyV9J++60cCdj2lIyDgSJvzwcH3n0+Mnz4Im8U
         4pxObWjaq1tRloPJkqBnyUhB0hvm23XTINOpnZ7AlEArx1WB49d0d9H5hveaieNpOUxB
         oi9g==
X-Forwarded-Encrypted: i=1; AJvYcCXmxYFYXYMlU4fBxhqDvaXXsJ9RnDeFBOODUj9DT1rcb1TbYo2lK16fdUTE603NYAmpBpod/P1BaY/DuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsMVjtLuq8INfLN/KBabQoDfvfRUuuxrohGAq6xa8gQuJlCOia
	PUlhBJ4I/gWETGxlxMsDoGRXXhGlj6WgqqPO4U8EGjCmpAOfBgadZ7VB1qOyrdoO5AlYoTM+m11
	5vTj1RJIMPO/iHIC/AbOKb+PfC2Am9NbTMtRjfJMm1Q==
X-Gm-Gg: ASbGncufm/qEcQ3/ai9ttdhocXCzPKXl3X8iJkwf3LzONopWIKvti4LycauiLL0+Aop
	THOF68n6fWhe0BOusL20aKgRxLh42zmFJbKK+OOCKIiUS4tMWp/Dg9BGOdgRi85w5I3/ib0I+4F
	pdpCpNR8S//nAhBT4e6gAxpdc57FWlaelYyv3foGZkWedk0KDDk5LHDZRKga8mu/ZckDvNeNyvG
	HshD/hvIRfRp03OaQQz/HMvQdWBe8IIX4JfM1O6LIbBZFwgrQVIjF/awaAbjZ5W8M/F2xQ4j91x
	dHWpDP8=
X-Google-Smtp-Source: AGHT+IF1n0wZVljtgQdO4YjkTkuDA16K7j3EGrt+LavVV05cNjZjVMw0mRnQJqWQrvbyjkw61l+wH9wnd6eTRWsTKWg=
X-Received: by 2002:a17:902:c40d:b0:251:a3b3:1580 with SMTP id
 d9443c01a7336-25d24cac4eemr35190575ad.6.1757676768437; Fri, 12 Sep 2025
 04:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 17:02:36 +0530
X-Gm-Features: AS18NWCRkwK2BEtW0uxWjqehT8uEFjWUmULflZWeqoftij31KvQE0_RmSXQs-jg
Message-ID: <CA+G9fYvQekqNdZpOeibBf0DZNjqR+ZGHRw1yHq6uh0OROZ9sRw@mail.gmail.com>
Subject: next-20250912: riscv: s390: mm/kasan/shadow.c 'kasan_populate_vmalloc_pte'
 pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
To: kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on the riscv and s390
with allyesconfig build on the Linux next-20250912 tag.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250912 mm/kasan/shadow.c
'kasan_populate_vmalloc_pte' pgtable.h error statement with no effect
[-Werror=unused-value]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

$ git log --oneline next-20250911..next-20250912 --  mm/kasan/shadow.c
  aed53ec0b797a mm: introduce local state for lazy_mmu sections
  307f2dc9b308e kasan: introduce ARCH_DEFER_KASAN and unify static key
across modes

## Test log
In file included from include/linux/kasan.h:37,
                 from mm/kasan/shadow.c:14:
mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
include/linux/pgtable.h:247:41: error: statement with no effect
[-Werror=unused-value]
  247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
      |                                         ^
mm/kasan/shadow.c:322:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
  322 |         arch_enter_lazy_mmu_mode();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
include/linux/pgtable.h:247:41: error: statement with no effect
[-Werror=unused-value]
  247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
      |                                         ^
mm/kasan/shadow.c:497:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
  497 |         arch_enter_lazy_mmu_mode();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250912
* Git commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
* Architectures: riscv, s390
* Toolchains: gcc (Debian 13.3.0-16) 13.3.0
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29863344/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250912/log-parser-build-gcc/gcc-compiler-include_linux_pgtable_h-error-statement-with-no-effect/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32aTGVWBLzkF7PsIq9FBtLK3T4W
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGVWBLzkF7PsIq9FBtLK3T4W/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGVWBLzkF7PsIq9FBtLK3T4W/config

## Steps to reproduce
 $ tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig allyesconfig


--
Linaro LKFT
