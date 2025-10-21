Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40C13A3F7
	for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 11:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761044948; cv=none; b=iGubGMtAUgWiQ5vlwPeSCXzgYPmQ/fvwvBGSRNPtSi6k3XALq5WERbpIj+CLaxksgWgqxxLPrpsTprhQdtiqOOXeu5xGEaFAQz6Zqq4yHzexth0ZUY2fQ20KHmDpJ0p5cuTwnIjEFBLe365H05rQxfH+AatOkenACqTt6kxZKBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761044948; c=relaxed/simple;
	bh=0Jj/oz3j5238pHi/+PUT7w3mAJ0abt9UDzN0aejE3p4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=srtjgEQWL9mwrZJj8gzyRwHxj3+5uGacdk1+n8/575KgrUzTcO3758I3uVRqDsSueXT6G+7CdVoYfqGtmevOr9HfXtOKYi4xSZxRQgIMRpCTng1X670nPhOyy5Erh+WlWw8ac1bEj90eieO161AUwdsbj7/h5Tv4gHXDG2/+6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v8lY4nwU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v8lY4nwU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-290ab379d48so49720605ad.2
        for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 04:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761044946; x=1761649746; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=clvqVveEl4VakYM5nZd2uVSfls27BpwOnq3AhL7nZXs=;
        b=v8lY4nwUgR3AuRe2Q9WqCzOpplraAO01f2j1J0iauJsZCXVGN0MlSZMjHrCnj3fKBt
         ZHDYi7qlgm8RCErZO5GEB2OUO+5HI2ITzqO0/Izr/OIR5PN4rWRnEaeAr8I10YXEq/WO
         VByN7y8hJOdnYhbMchoSMtQUvqhBbM5TyxdWvOic5MUDTJU2+D2aOXTn0Im1a4RtoFU9
         VKIeHdT1IvdeGp4dFVHtIouSk3SKkjpgxuW+1fUtjAUtCSEtd9GIWaSj62t+rf13/94K
         1JqVLvzj5hzWcJfgIeeEiDYh5Ce+WwsapgVfouQeafmAuL7Ng/iUuGBHYx5mrHuATQc7
         sV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761044946; x=1761649746;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clvqVveEl4VakYM5nZd2uVSfls27BpwOnq3AhL7nZXs=;
        b=vMUeB3pqIbojyhzWPXm3Q0TJnIcrwYfNopuwopgkkdNp/YvXnEhhn7lje8E86c1f0s
         yGgt0D0GKH5gWqYTguaKqf7MuGsucVnzrpaXyS452Tr3K8hGBkjpq7ADVgT7hgN7QZ+o
         doFLhDB6M27OkPeZOxOd7QMM3jXFAsMMyYjWS/G/Fdf9/QRJmTVlpQTecS1rP2dxP67n
         R4yH5pKkKPOkNyzQ+a7nmGnzPMCTfoVQrkhrwkmm5yMmB49ZY54KhGhS7+sgHp8LlGga
         oMeXB9lZwei2Q5XpDifaO5OVo3qYC3KFdJDvmJiwWE4kcae+ApwIjrlwiyKNyYBqn1y5
         CBkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4ClCDzs1yfqxTogH6k88Xp0yHcFWBnJu3OuIl8lS62pUjWdxs1oj3Th+EcgFJ2i+l1aLKCKlb/A7mHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVHLbHtp1YvEnZuAtdKP60M5Fnx8TGz6W1S9+39nZvrkjaD2F4
	yevxZSYwNuj7HreNvFHe1RMi2ZVUm8t0G6xnYkfP1DRw9x/UQHtJwCODRAP+AmWX5oOVC53htPK
	orprUX3Qzi4TCVBdBt/BeRCQE5Dzjuti9Iw6W6z/Eaw==
X-Gm-Gg: ASbGnctadx8Nq0de8VpASH71ep8JplUBz/7Wnk27Xphel+hbjJuNuJpKc06S6MC8UAN
	evUpGuIXk3zn4m/r6wuOlIUUcg5gyETCBpdWxXaWJoNka03PJpj7BuBAxuEftJC12qOdGx/KmXg
	RzvEsmVoA1smip+HpYjBnowmwBuhoYHXJkNnsSOivun9aYvOKRYOHEkVxWkLuJWefHVp9o6HYsH
	NHrZkNGFAnznJa830cEHQFzu6Ww6NZIyB5ZeC0RkAYwtexPLSu+vcvkOYXCrypmMFEt/DPdXwYp
	UwB53/KKCWoUKmzTAmSF3XpMVnOx3JA60y2uloQuHJyo97WNr0Fe9mox7mm7y1v1ugrd
X-Google-Smtp-Source: AGHT+IFDGXUp9tKVVOyQcA7+CvoT4bVfCCGV2+qBmOVEr+wXy9Mo7bFJyDSAnV0yMljTfotevCIwB/WqStf9CbjQvMw=
X-Received: by 2002:a17:903:4407:b0:27e:ef27:1e52 with SMTP id
 d9443c01a7336-290ca1218dfmr195009785ad.35.1761044946535; Tue, 21 Oct 2025
 04:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 21 Oct 2025 16:38:55 +0530
X-Gm-Features: AS18NWCNxSm7rurPtBIV1Ywyd2Z1uJw_dWK2NUhN3UHurWzm1qYuCb5CL-5txYM
Message-ID: <CA+G9fYvKjQcCBMfXA-z2YuL2L+3Qd-pJjEUDX8PDdz2-EEQd=Q@mail.gmail.com>
Subject: next-20251020: selftests: helpers.h:10:10: fatal error: kselftest.h:
 No such file or directory
To: X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>, 
	"BALAVIGNESH #" <reddybalavignesh9979@gmail.com>, Wei Yang <richard.weiyang@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The selftests x86_64 builds failed due to following build warnings / errors
on the Linux next-20251020 and next-20251021 tags with gcc-14 and clang-21.

First seen on next-20251020
Good: next-20251020
Bad: next-20251017

Regression Analysis:
- New regression? yes
- Reproducibility? yes

### Build errors
x86_64-linux-gnu-gcc -m64 -o kselftest/x86/single_step_syscall_64 -O2
-g -std=gnu99 -pthread -Wall -isystem usr/include -no-pie
-DCAN_BUILD_64 single_step_syscall.c  -lrt -ldl
In file included from single_step_syscall.c:34:
helpers.h:10:10: fatal error: kselftest.h: No such file or directory
   10 | #include "kselftest.h"
      |          ^~~~~~~~~~~~~
compilation terminated.
make[4]: *** [Makefile:86: kselftest/x86/single_step_syscall_64] Error 1

### Suspected patch
  git log --oneline   next-20251017..next-20251020  --
tools/testing/selftests/x86/
  4d89827dfb274 selftests: complete kselftest include centralization

Build regressions: next-20251020: selftests: helpers.h:10:10: fatal
error: kselftest.h: No such file or directory

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

### Steps to reproduce
  - tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-14 \
     --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/34JgN0fZ9uXj6HVnjvjqzIhgWbQ/config
\
     debugkernel cpupower headers kernel kselftest modules

## Source
* Kernel version: 6.18.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20251021 and next-20251020
* Git commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
* Architectures: x86_64
* Toolchains: gcc-14 and clang-21
* Kconfigs: defconfig+selftests/*/configs

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/34JgN0fZ9uXj6HVnjvjqzIhgWbQ/build.log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251020/kselftest-x86/x86_avx_64/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34JgN0fZ9uXj6HVnjvjqzIhgWbQ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/34JgN0fZ9uXj6HVnjvjqzIhgWbQ/config

--
Linaro LKFT
https://lkft.linaro.org
