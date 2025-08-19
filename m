Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30130E0D4
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755592841; cv=none; b=hpDr3yyF229yhcB0Yv2QhfL24ggXj3DwOy3sSD10F3f8AlCcWzTtdLtGdC+uNlaraayHYo7cwE/P+mEo9VnRWy95gA9Z3vyWc/NM9vTR5GBj1JFBPuU1n+edRwMIO1L0GmviFHLnP3mHPxJV1ZqXnjjeqqH2ePvLrXCEzc+3AHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755592841; c=relaxed/simple;
	bh=s4rCdNrJl4PbZFUL3SQdLxne9G64dePB0cGlGicB9/0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n3QYYCYbfI7xYg7RCZkFs2cw9QCWpZGTyIlv6NMeckHTjiIqDDsuB+eQ1eMMfniJrkf9RDmJILR/ZhZ3M3YZ1g2VZRa4lbtK6x8SjFUgw+K18IxY5ne6yCFQPlahQEf2sgATnUk9l2NWG1/I3REH8VZuo9vNrD7cnIxQ+mlNVVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVE2ZhuS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVE2ZhuS"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b4717330f9eso3571642a12.1
        for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755592840; x=1756197640; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fOvEbU0Cnc0FjNAEZg7vmgeVRfzmShXkhUtYM2eUAbM=;
        b=VVE2ZhuSEVRoux23LL0sAm+awuAKo6f6P72mQHghN5JjqSa/0bB8aZzF5BTnoEChBp
         tgh0ha6ZbLQhWxwWmQBIBdKoibUqJB9iFh1RbSDepZcep+cjRi1e/tHvZKgFX6i3D6QU
         StmeayLPLKHY2jbnXWq7FfRFyIYFRoZ5fD0CU6cD0liTsnfhBxAkCEXOjtEgW3ZxxDKv
         uYZpw1al/ndOnFKeNBxJW4bgVTvhDksIeuxeHcQG8XeQ+A8ioa5JXl2cXyNvpV+LwODo
         aNMbBd5bhXDhMkojGpqK4kJofzf48vDQnoPlvkDVaeUx6JUNv1gKh7J3xI4mShJcLZc+
         wTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755592840; x=1756197640;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOvEbU0Cnc0FjNAEZg7vmgeVRfzmShXkhUtYM2eUAbM=;
        b=L0K5MdCXoajfmN2ctd9g3swlCELiKq3SPNXNfRpmUzPhtd+VE81475t3PqqYpanWSS
         khmWdwNCNNwxbp7o9UD1omoGOPNRvYA1vHsiwmTjSG1mB0ellyfEuUKPhFFGHGhEU0Ob
         iVvVnwGdhiu333TMle13LdUzUNOwvsQiIDEw2NA1xNK81vjsM0fkZH+A5oFkCyYSQXPK
         n02RYG7u0wd/627Rj+shvj/1sr5e+7WWaYiTM5Hc+jW9VgqXy1gCQ8B/UJmVjglz6+vf
         DXT1dJOrYn5YFIDhmToFdfQLvsDhWZuMa8e+KfJwvcobvLfUSDxzkE4v2z4nUMVB3xHF
         YO3w==
X-Forwarded-Encrypted: i=1; AJvYcCWcQKfo5/iAKJ2kaBLY6ZAdSNnTubr9zfgxH5GS8FJydrVZL+WIuiXB4GnmuRo8000FXbZaIHxcyV1+cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI/hTrkawFeQ7lO0+vYmXbYDM/RrP5G0wljelf+8upSxJ5N/Dd
	wd3AFI1rYrNrqfV2L6/D2XZmZR0nV4mkVRa5IBoBlNfZ/xdTrp7htwOiKbAxjFLF4Ts5EjFoO8k
	GXFNpZX1y32yUaV5hopVJkMI9zgylDQns+SM9xsJLlw==
X-Gm-Gg: ASbGncvtJ9iuVMHM0YLwrBjpYYZE2lLmsbvwa4WkbSqdk7tWI6RwKBd38aEA9H7bqap
	zbUEEzZLsU4o8mOe629L/YfYNIhPZetemzPJ00qEELPWXNvNx8JoirdUJVNOW+ZTR50kGfPnc6+
	miisQss0L+Ipo/Q9WR5YULEDic9s4HARMcL0AWMFqW/tJcp/CEBT2liVlByNtezOHi0T7xEpzeD
	SM57Wsu6OEFcgWKAQuRBx04Q/dGc5KTN9KGmGp9VQf37Cy1ew==
X-Google-Smtp-Source: AGHT+IEGGBLrKnJA5rKPO3tG/2IpmKWfgJNSJRlHDGAPjusotj2Hf8o9mNnZTQtC90ugTktRZGVV8VN9rh1Puc8/i0A=
X-Received: by 2002:a17:903:1ce:b0:23f:cd6e:8d0f with SMTP id
 d9443c01a7336-245e02d83f7mr22374655ad.13.1755592839617; Tue, 19 Aug 2025
 01:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Aug 2025 14:10:27 +0530
X-Gm-Features: Ac12FXwQ9ahb2ew69m1KVEd7V2w8TSXSPCLlnKGNCFNH7jf-h193q59E6JrscyY
Message-ID: <CA+G9fYv+gELzgcL4y8rOQbTxv2Y2JQTFhNkgUcLbzPJ_yDTziA@mail.gmail.com>
Subject: next-20250818: rust: `ARCH_KMALLOC_MINALIGN` is defined multiple times
To: open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, wedsonaf@gmail.com, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <benno.lossin@proton.me>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Build regressions were detected on multiple architectures (arm, arm64,
riscv) with the Linux next-20250818 tag when building with Rust-enabled
configurations (rust-gcc and rust-clang) from selftests/rust/config.

Duplicate definition of ARCH_KMALLOC_MINALIGN in Rust bindings is
causing build failures across affected toolchains.

First seen on next-20250818
Good: next-20250815
Bad: next-20250818 and next-20250819

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* arm, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* arm64, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* riscv, build
  - rustclang-nightly-lkftconfig-kselftest

Boot regression: next-20250818 arm arm64 riscv rust
`ARCH_KMALLOC_MINALIGN` is defined multiple times

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
error[E0428]: the name `ARCH_KMALLOC_MINALIGN` is defined multiple times
      --> /home/tuxbuild/.cache/tuxmake/builds/1/build/rust/bindings/bindings_generated.rs:125708:1
       |
5305   | pub const ARCH_KMALLOC_MINALIGN: u32 = 8;
       | ----------------------------------------- previous definition
of the value `ARCH_KMALLOC_MINALIGN` here
...
125708 | pub const ARCH_KMALLOC_MINALIGN: usize = 8;
       | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
`ARCH_KMALLOC_MINALIGN` redefined here
       |
       = note: `ARCH_KMALLOC_MINALIGN` must be defined only once in
the value namespace of this module

error: aborting due to 1 previous error

Please refer the full build log information in the below links.

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250818
* Git commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
* Architectures: arm arm64 riscv
* Toolchains: rust-gcc-13, rust-clang-20
* Kconfigs: defconfig+rust

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29578517/log_file/
* Build details 1:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/rustgcc-lkftconfig-kselftest/
* Build details 2:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/rustclang-lkftconfig-kselftest/
* Build details 3:
https://regressions.linaro.org/lkft/linux-next-master/next-20250818/build/rustclang-nightly-lkftconfig-kselftest/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31RcUoS2AqZLljDCs480MNNEyxJ
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31RcUoS2AqZLljDCs480MNNEyxJ/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31RcUoS2AqZLljDCs480MNNEyxJ/config

--
Linaro LKFT
https://lkft.linaro.org
