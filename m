Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACE7210F4A
	for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753445978; cv=none; b=PMPTWvVPOlTZdVG9SnO5s8ewPhd5sSPsRd3z5ADBvmcMeuVyIoBs2uBqYVYWeLJj5pO2Pa+ugrISbuGG66YA2vAsNQBWH5gXrd5bkHAbM2/bOkohIf/o0wWuiwaSRyMFh/R9HrfY9WxGOEDD9WupNz8esaursh8LVLwgDRmoTc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753445978; c=relaxed/simple;
	bh=C0Hps5C7VVp6TMJa5SSauLjDYas/RuYUmWcHmSjZVvE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MZuY35olHil2Kr5X+W5SLYJaModDEaNr5J6qPTpQfqMODapIaosPg7s3XjhVFPmhuPQwcGCkfZb1L+qn2wKC4FJ+O2SBZkpOJDdy6Nvg1su0c6EfTZJmHdZ4S0ak4Xob450bftrIEmE6SMZd2xDrp/i5XQpCoFoL0S+qyKK2ssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szjkE0YE; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szjkE0YE"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23f8df98e41so17698975ad.0
        for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 05:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753445976; x=1754050776; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NeMfxo6+NjtkxLuUXyqyKSelgastqUQJsatQRBwVL9M=;
        b=szjkE0YE4/f2xzFNpMBcirnWyBkrUBCtPshLlTV7/ScAjeo6ZkUG7BxxWtWkDKb+Dl
         1Rvx8pM8/T8gQdM/0iIvy6ZfsNKTmRG749u16M+WyVnU5PVMaDH+pjoebdtkCg2Xj8O4
         hFTR9RG8AtjVfQmn9ZudLrKgIgkVAs0MFsIkbAnm3sqhbK1qGBVsBTkzO95nrslpp/fb
         zv/acAXR4pkd3TVoIDfoJPhurnJxneKjTCihZ8FgREb39PkhlW9TnOl9sF02iJxjUJRy
         W8CNMKBd5iX1mmYqG6G4WCnbDoatUGvj0WbPdraF3/NKAYgrthrFbDDddnqdv/QvbSs4
         grtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753445976; x=1754050776;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeMfxo6+NjtkxLuUXyqyKSelgastqUQJsatQRBwVL9M=;
        b=MfP/DJDVWa5ta3nI1AoPs94mF62okSS7KX9yNs7cwLVwSZvuCWT1FjN6ypmBboIo6R
         fNc1v27URdgo1OlgIMRMQc86QN44N2dMwuIVmXvw9eR2Of2HjW/LjUpwZGCsqMTamCO/
         hmLeYs/qv1ThV8r+dOMvToN8/okN0ptxcifNQfY5i5wSBFv8PlfQfcczixxp0RYz9LTi
         KFsP/XVKRUkyqd70HB103ln5LA1x0ESMj+54+WNjAQnWonKSLP332IxCcfx5aBqAPHLN
         oBlnVdt522w1h+5eqm9YG0N9IhmnSNIb0YVU5pW5uBtTPnt4r/2vNoltKcZaO+VV6erg
         UOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrsNl4Syp2xRyuqenbWkwwIDueSeXWkxzR9KCpmC5fp2mkjdmLrqQW8Vq4Y2+7yhCbPQa6gf+VBZJR6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWqLvJHpBo+Gw+I2IQLdlwiSK1f5N7heJp/w9/3l5+8BpmujOe
	204QQ+U917RJakL91aPE11Vj+2TjFAnzNTgbALkFQpMkCu2UkbmDttsNBxajJs+wAu1truZXkrF
	GuoTnVtE9+os6vQ+spBBs0sP5mvCh1NDl/RN503nRyA==
X-Gm-Gg: ASbGncvxrlImnT8eWZITm9R4hzlsOKsAkXvh0R5zwDvyJ2nWY0zwn8Dn7AqeMVCUMuR
	U3N2w1l+nPCWNlwLnCxAir5KdyUkkU981h/XNqCutiDSomRFbhm2p+bCT9pdLWL8Iw69Jkv0bSG
	kxrmb4Rr0GD4hiabouoQeh+FySAOw9YZZIyRZXISjjdqNmcYssHI46RdvtK+5WMk5eh6MRFQfL4
	TzR7OnmlZIs44sLMJf6eFDnXljAVBiYCQP84UE=
X-Google-Smtp-Source: AGHT+IGdYljlX5X3dzqQG4BZUzWT+e8A4L5gJt/XoCo4bLpcHRLiUWIeX/SHGfQbsZ8DVFMGkkjaR0FrY9REWiry2is=
X-Received: by 2002:a17:903:1b05:b0:234:b743:c7a4 with SMTP id
 d9443c01a7336-23fb30e42a3mr30388225ad.38.1753445975730; Fri, 25 Jul 2025
 05:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Jul 2025 17:49:24 +0530
X-Gm-Features: Ac12FXwd36DF0XFKorhLZXh2IFhKm9PTaX7sVXvKuHjnNnv3_TFODhgbB7WE3cU
Message-ID: <CA+G9fYs2LDdWX-w=7JA26tkYN450qg0230H9mfB-PymqmPsZ4Q@mail.gmail.com>
Subject: next-20250725 nomadik-rng.c undefined reference to `amba_release_regions'
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions noticed while building x86_64 and s390 builds with gcc-13
toolchain with allyesconfig on the Linux next-20250725 tag.

First seen on the Linux next-20250725
Good: next-20250724
Bad:  next-20250725

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

* s390, build
  - gcc-13-allyesconfig

* x86_64, build
  - gcc-13-allyesconfig

Build regression: next-20250725 nomadik-rng.c undefined reference to
`amba_release_regions'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
x86_64-linux-gnu-ld: nomadik-rng.c:(.text+0x6fa057a): undefined
reference to `amba_release_regions'
x86_64-linux-gnu-ld: nomadik-rng.c:(.text+0x6fa05a0): undefined
reference to `amba_release_regions'

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250725/
* Git sha: d7af19298454ed155f5cf67201a70f5cf836c842
* Git describe: 6.16.0-rc7-next-20250725
* kernel version: next-20250725
* Architectures: x86_64 s390
* Toolchains: gcc-13
* Kconfigs: allyesconfig

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29245454/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250725/log-parser-build-gcc/general-ld-undefined-reference-undefined-reference-to-amba_release_regions/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/30LiIUwnkUApDe74DgNCqkngoPB
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiIUwnkUApDe74DgNCqkngoPB/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/30LiIUwnkUApDe74DgNCqkngoPB/config

## steps to reproduce
 * tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-13
--kconfig allyesconfig

--
Linaro LKFT
https://lkft.linaro.org
