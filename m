Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB722E4251
	for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075604; cv=none; b=tJ9izdEZvOlauoquiLFEmIKqOS0dRKiL5usk8Q76OWrq/UyZhh3KeS3CM+LMVoUa+BDbIe/cc4qFW47E0d5LOIPrtF12MwqoOI5oqujQXS3bCGt6EDPtKYpxzRYzUXEHdj8RBtB6a7+9vYMlva7SWRTEKeAecmikbhCu6BYrAZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075604; c=relaxed/simple;
	bh=IbZZvF1YeIlcvUq/+fdnzFkqnxbyQDarbgl2bwQ6gi0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Rcnx9Tgg25XEZtcFkbMnixLTYKkG9dA72dpTH9KUhVEMpv6XWob/bfL5PnRS6NnQiGUHZsFoDVpWO7idbREocEPUhJKq5BP3gyulwgAL01YXsmdhB22eWCge22GRFh4ZZ8MrFvThp11Hl5H0bocSNeP/TaBIQ5Pasou537GFhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhVxNh4b; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhVxNh4b"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad4e6d949so22047006d6.0
        for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750075601; x=1750680401; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TpU5wAMG3sQlhcsZQZqrmEByJp0SllVR0AKHGW2r9qE=;
        b=IhVxNh4bE/zMG0KUR0HY6tdrl2pf3kxyuY0FGI0h5AKnFaW9wQTMr8Tc1cXKU5phWQ
         Eo08Vseth3Vdv3eNAQU7Th7HLYp61s9x2H2ScczPtcMAuGDV+akZhE6syQY1Eg+B138b
         bLLZKUOw4iA2h/IDksrL2z/ZN73AQo1KXa1gjH8mNpOdGeJi8N+9VrxWkqCJLzL/PqeX
         0htTNC+0IyJBjTbTi9737G9dFv/bqKtFDtnmoddAOgO05EZnE4ViJHITeTatpuJpezdQ
         xZeUJk+HvyxAQ+2PyM4FLj6JCb7sZk6PjMTgdm2WaJn1MZdIrNeHu5qYrzH5EFCR7hhg
         KyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750075601; x=1750680401;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpU5wAMG3sQlhcsZQZqrmEByJp0SllVR0AKHGW2r9qE=;
        b=k89gWF1Fp621PhIEGc9ResAFuFy85o0EfSFBSV5zmTZUYQDTzibhYntQiqvLjerSMF
         2rFp0VrPXoA6W0If6G8Nd2KWVXDQWyykqYSz9Fr+R4R9b68z6sJyesx82sVUojOBHAtr
         TJZa4wbn4GIZd+XcegEIxXZ6XETrTu+x2XHLVuPUNU1a04z7O87KUNxKyQ4WO6+j/1Mm
         KAr5Njty5l1KzpyUXxI40KR6xxKhW0VN/3Hf2KM+wKcz9hcTvZh/1EUkPgwvC1R0tFON
         FemaePqNjF/VnDzgrjxBa4juw19Auf6/oegMC7Nx49UAsCrjghG84S1a8fi5rW50QQMK
         Nr8g==
X-Forwarded-Encrypted: i=1; AJvYcCUwWLqXtYCYO7bk/MDLeFLpV32bBaicmpSeKCHKhMrxrcmM4u33A6gLTo+9Q9nsdp/kJs0b2H38bCdkjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkp2T94PTFiVvoJBvUHQKqtP69IAGKXprvydky0iqMN5TBcVAg
	45GwZw9ZzsE8Z7fmE76V8G8UvYslnIrTl7UeTngQ1bQBf/5edSI56MH6jzQRbAQku5m8Ag1P1YC
	Ja9A918i9wDOVX2tAhq05pp0b+KpiNY7XOA85uafysQ==
X-Gm-Gg: ASbGncufgGNPigLv4BLtlGa6/DUtBiTt56/qMn/FRDJf35rAzw/S3vJPxESajHvnfLW
	v5mDQQTsndJuUBCjkt3mfHUuDGqZP3YeH0rqqIESNqBHZtgdULWA+ZI8a7fCkBlDSpD3jkJA8FI
	B2bRlbum3OCqt25eTx4j+YHVimoy3/Ypc25+NKMRLHXkL3J6XW7k8hpIBA7FbBRx66wmj/WkTIL
	w5s
X-Google-Smtp-Source: AGHT+IFeUKnKrR3PiU9rxHEIRNQyrCJR8n4GoHXj1LshKjqrOlDxmNum5ASc/NWBGVeJbSNt1PqkzC0aodOI1wfeH5o=
X-Received: by 2002:a05:6214:500c:b0:6fa:c6ad:1618 with SMTP id
 6a1803df08f44-6fb4776e76cmr143231416d6.27.1750075601411; Mon, 16 Jun 2025
 05:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Jun 2025 17:36:29 +0530
X-Gm-Features: AX0GCFs0r1nB19T1N_2PPwY-kXlE37v4o6Iuua4hbniHaojK4KFbc8YBvkBv6Uc
Message-ID: <CA+G9fYuDOnN6TrcVYcMZT5UPNc34mOHQZsfyFvpq+Ndhz8p48w@mail.gmail.com>
Subject: next-20250616: S390 gcc-8 allnoconfig mm mempool.c In function remove_element
To: open list <linux-kernel@vger.kernel.org>, linux-s390@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regression while building S390 with the Linux next-20250616
with gcc-8 the following kernel warnings found.

Regressions found on S390
 -  build/gcc-8-lkftconfig-allnoconfig
 -  build/gcc-8-lkftconfig-hardening

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

First seen on the next-20250616
Good: next-20250613
Bad:  next-20250616

Build regression: S390 gcc-8 allnoconfig mm mempool.c In function remove_element

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build errors
mm/mempool.c: In function 'remove_element':
include/linux/compiler_types.h:497:20: warning: asm operand 0 probably
doesn't match constraints
 #define asm_inline asm __inline
                    ^~~
arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile(     \
  ^~~~~~~~~~
arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
  __EMIT_BUG("", 0);    \
  ^~~~~~~~~~
include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
 #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                         ^~~
mm/mempool.c:149:2: note: in expansion of macro 'BUG_ON'
  BUG_ON(pool->curr_nr < 0);
  ^~~~~~
include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
 #define asm_inline asm __inline
                    ^~~

## Source
* Kernel version: 6.16.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
* Git describe: next-20250616
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
* Architectures: S390
* Toolchains: gcc-8
* Kconfigs: allnoconfig

## Build S390
* Build log: https://qa-reports.linaro.org/api/testruns/28763376/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250616/build/gcc-8-allnoconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/config

## Steps to reproduce on S390
 - tuxmake --runtime podman --target-arch s390 --toolchain gcc-8
--kconfig allnoconfig

--
Linaro LKFT
https://lkft.linaro.org
