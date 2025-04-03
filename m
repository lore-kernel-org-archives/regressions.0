Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5602459DB
	for <regressions@lists.linux.dev>; Thu,  3 Apr 2025 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675660; cv=none; b=bBbxgBiabD0YmQELdTJovFYnjvUPVoOtFOAPwydUBKU5M5JkiH4pLdbM8F5BuX5+i6Pblf7qt9JCNclS78pD59412tmgT6edmAbUtiYmrjqPDtV7lYOoknlUNyCbKBncLDq0I1es15n5zRE06TeWSzf23hzAQTUgwTikaVG7dBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675660; c=relaxed/simple;
	bh=GezOMWTmbvUlmddSRUJtzgQ2URqpf4G0KrSTl9O1bbM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IoWog1QLLLfQ/LkWxm+yeFbQUzvm5TrCatpIj9zKLa5S2VqV1KHONv5wcjNGgrbHDr8yyh82oo3KBjkh1x+ROlJAQ7BF6nrScw11A+9jF/5jhy8pB9E6wycaVc14GxAQOzsIfv3UaFKBd7oSD6b8vV2c1BDRQ6mBvJJ309gYyH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ly/lY+m5; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ly/lY+m5"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523edc385caso355421e0c.3
        for <regressions@lists.linux.dev>; Thu, 03 Apr 2025 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743675657; x=1744280457; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EFfDTMKsLOvbQi0ro5INzOuYGDYKTLhDyjOF8V3RES8=;
        b=ly/lY+m5RhfoTYZPKmI0lWEpYaLWL5LHCEpw7RFyNwJjd25D8fUfpZmrU3GOvKj0Y7
         aBT8IPfG2aVKMCry4M8qj7n8musvTnnF6r+TPLNyIW2dDAmvTejqjhzAfvGn043kjsFe
         3njt2MpXrbiIGFXrcPtUEAt2YBD4wVL2ejWVaintz4cGBCPFkUts9eX6veNqRqzpmlk5
         1Y+qsShRjNJaGciEfFDTC752eIyfe+Y9vJ9Ca07lW6UdkBnw25zE3Ip9D6eMl9paHl77
         bhE3RO6cZutUy9KI+DkzFI5+fJWlJX2yfq/BYemePO8wSOmilId8xq6go8VltNNHMz7M
         QY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675657; x=1744280457;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFfDTMKsLOvbQi0ro5INzOuYGDYKTLhDyjOF8V3RES8=;
        b=SjHyd6AzA9O+xdYrW1tvHW8Tuz3yte662WW4jhZUnqrrfQ1uVDa3jl9tgCmZJPrQkX
         1mqdXekQ+dEf1xKEiZdPH3LjCvooou6WHlWO8/+vcsKAf71W/vnm4/xseH9il3Mmlkgd
         VHf0H74LH0a/4XCc9RL/kwHWiLOMNhFZydh/nvSplYTcMfpe3gQoDQp/hlG3tev2EjDJ
         Pzpz3zc4uaxdrHXQPYgQT322ybkouuejbOQ/SYd1HyfMtRqb/1a9iZ/lTIGTJ7wqr9iv
         y8fQEu8XTMd+0WSR7Y3ed58Ofkr+CnIIAufYb+FzBuSnU1iUw5BB3m7wzmj3cXcHp6Kd
         dFsw==
X-Forwarded-Encrypted: i=1; AJvYcCXZEzkvz2PwzczLJfF2XgS9sL/m/xZCb8Z5AJypUPKPy7/Bzdqh4WrgEYOGpDj++h9k0N2IbxKbWuB2PQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbvMYSIy2PUyIGrAxi4oXSV/YoiDNaEV3/yI9fenOB7zxy3i0o
	ZWUpCz2xcSwreUV0emrXnXDDBROEdUVcUT4D403z1IG2SFlUHZUwYYKH9kXkNSpTS5TdkvGm0qD
	4+LHS1tgmjgIpSEmJAwKm+pI2IS+TJbEVXHUYJw==
X-Gm-Gg: ASbGncssMSGqymWQm0QtMrpVEZOF0z/QpHjdJco8t8Dd2cOaXDrG4X+kROmpih36BW8
	vUhOlKZwZvzT05SUMQLvza9546m6AWt7sVL1apc6rMM2yTPqyWR/W34y1vCLxae/98Nzan7JyWS
	BOOHLjIH1rxKqKzcsR9mAKk4qUgDvxwFyHZPgHKNEYusXZIRNwTS9icw//DA==
X-Google-Smtp-Source: AGHT+IHjKBz8LLfkDN1C5xR8N2aNArNqGWfvvXVddkpcmhmRSktPMSHP6GCF1+dehAbnJ6v37EnE6gWHZbLivdA/PoU=
X-Received: by 2002:a05:6122:1785:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-52758c9eb35mr1160475e0c.2.1743675657436; Thu, 03 Apr 2025
 03:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 15:50:46 +0530
X-Gm-Features: ATxdqUFcLm8EJq5bKx8BVwRxzBv71uPhfhvOEYclA0j-Xltycxe1onkZpRNwYYM
Message-ID: <CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com>
Subject: next-20250403: x86_64 mwait.h:30:15: error: invalid operand for instruction
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 builds tinyconfig, allnoconfig failed with toolchains
clang-20 and gcc-13 on the Linux next starting from next-20250403.

First seen on the next-20250403
 Good: next-20250402
 Bad:  next-20250403

Regressions found on x86_64:
  - build/gcc-13-tinyconfig
  - build/gcc-13-allnoconfig
  - build/clang-20-tinyconfig
  - build/clang-20-allnoconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: x86_64 mwait.h:30:15: error: invalid operand for instruction

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
In file included from arch/x86/kernel/process.c:36:
arch/x86/include/asm/mwait.h:30:15: error: invalid operand for instruction
   30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c"
(ecx), "d" (edx));
      |                      ^
<inline asm>:1:16: note: instantiated into assembly here
    1 |         monitor %rax, %ecx, %edx
      |                       ^~~~~
In file included from arch/x86/kernel/process.c:36:
arch/x86/include/asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
   95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
      |                      ^
<inline asm>:1:7: note: instantiated into assembly here
    1 |         sti; mwait %eax, %ecx
      |              ^
2 errors generated.


## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: f0a16f5363325cc8d9382471cdc7b654c53254c9
* Git describe: next-20250403
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/
* Architectures: x86_64
* Toolchains: clang-20, gcc-13
* Kconfigs: tinyconfig, allnoconfig, lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/config

--
Linaro LKFT
https://lkft.linaro.org
