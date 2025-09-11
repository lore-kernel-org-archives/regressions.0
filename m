Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83FA27F006
	for <regressions@lists.linux.dev>; Thu, 11 Sep 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757579838; cv=none; b=cqXdFMP2I51C75ETJs9n9j9ilA42yw4UtuCdY0gbzFoYp69WpS+GkjrPnTs5vhvbPOKkzrI+Ox8q4NwRCAfWEKeZO6tIfCSOEdDEN4J3t01KUVkjMpoL0UwnfGr1hZCukhGZLjgfOUAQV7W9aG+n6g3bfVq5YCUqqNlLyM3crRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757579838; c=relaxed/simple;
	bh=dXdheL8JephKYsdZVZ5VzVXsD0ljrqlK8eaSDZXPjes=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CUxHpHisoL+IvKqphXbzU3jT/AIf0VNrYIWWKPzqimVclq/BzepTfrNNsRTRbuom+hyYVP5NIjw07yuJ0oMB+ZeuU/zlWOP1KUB+exFlnKFo2S2ivIVIdOZ4VgVocEw86qZolj0xi/JYrcOPD3Zif15H4xk7nUTFUq61AmCYq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eq+7VVmS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eq+7VVmS"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso358217a12.0
        for <regressions@lists.linux.dev>; Thu, 11 Sep 2025 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757579836; x=1758184636; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XlHLF6IxLX265PKrXSfqim3Osu2zErg+VtcQhos8Amk=;
        b=Eq+7VVmSRqpPznZDKPaPVTdqprJEdFSJvxJZqdaX7GsM1nOJdbh43sjQEZBQqOhRgT
         kaQJcYazA1+fgaaTnVSsYkVaVtH8xc9RMCnqgNfX2ohsJxX00f5VNKC03tf3s9pPXAyl
         fOzHXLb4b3mu35WMf6/HOAR6M9Upj825a9RYQipvRJPgSyqXyPukyZ75R2E7jhgQ6C6K
         vJLOFsCtNKrdQcSJXN++8J0YKtU9HUkhIX5aKgHTDLVDs/nxRgZepyB+ger+S99wvAOH
         hRbHdYchc8rsva/vbTagB2vyGQl9FgWHkWf2cygc78jZZRRp/SX360e8BLBtQvEMU/Xb
         eZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579836; x=1758184636;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlHLF6IxLX265PKrXSfqim3Osu2zErg+VtcQhos8Amk=;
        b=VVqCHyDBixBTqYziI4xJFYzkiFeO/xNvrJ9MDhMZCYBJ8uYg67LOOGibJ6Ya4T0E4e
         lQELAm0EZeAAb31ErcXY2QtanZFc/d9f+GC51CTdhS4CmpvKIPSKpcB2uNRmGE4kFTsn
         o2po4TPxNMMHITBnQaYTxAqruAv59DOt4IoUK0ZtTzWrS4WwN1VYO+tNjqKMtIePZ/fu
         lDpEivxxLc4R9ssnaAJBDDfCyuyM42hClstcFgmebj4WNW//SMIgltI1CIc+0IYxGSBD
         fF0M+YklYYDH2rMVFCyIB6Xga2lb0MAb6hbX8gIrqLhOsiPqQ0WMqjo3k3J8fL4Fii8G
         x73A==
X-Forwarded-Encrypted: i=1; AJvYcCWRHoNbpqml3034EAv6BDo0Ro5lPCH9t5GxWKYNWXdEBHjSLEKOng6vScAwW+WOhsluD9xTbvHRLVdiTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9//k9uZ2TKsNNeUau9B8saTU+R/90pcEnwO4YJwzB2ylCJnBH
	bFkxihcpfrc8L/6uikYPkXXsAwIDtIXwq5/t5k9eeMe1L96eCwZofWr7lXigUiWrgjrLmfIgfG+
	yvyhz/abOKxOJ0hHS74jBU9wzc/iJxj62RDyUMomEHg==
X-Gm-Gg: ASbGncsvEDINHyuSe+9AWW9SMs3rzxWkvLcQfzQNPj0pK7JL7zaT5WE8Mc+Kzs7e/Si
	F1lYnQk8/+CXLtlbBS+K9308jGRAi7zhR9A7aQBJWWTmE0iXCPEPMBwk0E1uP4HV3ioUrvjfi5f
	RgeQYvqY8wlvVahLd7L1cjEglXXx+jBnWcaccwnhjymdEkuTbri/sZN9kcjRbl9Nr1tvcZj7g/X
	fNKkDSqc4Nt6tpE1gZVQwZGTgwKFMyKJ1bp/POfnL5PgTqN0CbwNRX7Z/lLkZZG/YgHwmxk5wYS
	lWza8oI=
X-Google-Smtp-Source: AGHT+IGR2+igFyrerQ3HlTU0fDr7FuwZJE+/EsvxJ0BM47OK3QyzESdHU/BATUPNXmekU8opkqkhhnxnT4KYCn47WJg=
X-Received: by 2002:a17:903:230a:b0:24f:30dc:d3fe with SMTP id
 d9443c01a7336-25170e428f3mr249071415ad.29.1757579835668; Thu, 11 Sep 2025
 01:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 11 Sep 2025 14:07:04 +0530
X-Gm-Features: AS18NWDVnn8cWFJt-IwGb3BydlPhAt8pRyLoCxHvXGT9gVTi8T47w_BuQztkQok
Message-ID: <CA+G9fYtUi3bnZ2zycCot6KGeZcn67JAvz=wZm=6f2w9ZnL=0Uw@mail.gmail.com>
Subject: next-20250911: mm/slub.c:3960:27: error: a function declaration
 without a prototype is deprecated in all versions of C void flush_all_rcu_sheaves()
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	linux-mm <linux-mm@kvack.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on aram arm64 defconfig
with clang-20 and clang-nightly toolchains on the Linux next-20250911 tag.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250911: mm/slub.c:3960:27: error: a function
declaration without a prototype is deprecated in all versions of C
void flush_all_rcu_sheaves()

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
mm/slub.c:3960:27: error: a function declaration without a prototype
is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
 3960 | void flush_all_rcu_sheaves()
      |                           ^
      |                            void
1 error generated.

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250911
* Git commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
* Architectures: arm, arm64, i386,  mips, powerpc, riscv, s390
* Toolchains: clang-20 and clang-nightly
* clang: Debian clang version 20.1.8
(++20250809043815+87f0227cb601-1~exp1~20250809163919.3)
* Kconfigs: defconfig+lkftconfigs

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29853978/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250911/build/clang-20-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32XlFDtH7RdddaA6FHskupLDDSO
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32XlFDtH7RdddaA6FHskupLDDSO/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32XlFDtH7RdddaA6FHskupLDDSO/config
* Build log details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250911/log-parser-build-clang/clang-compiler-mm_slub_c-error-a-function-declaration-without-a-prototype-is-deprecated-in-all-versions-of-c/

--
Linaro LKFT
