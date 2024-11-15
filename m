Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0C1B982C
	for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731677122; cv=none; b=Dp2bCUjAEcIrL0s2mAU/eNlawcKSGjSWC/agDN++ERD0uYohj/25bGRdmGAAHwsJOM2DH/KwQLpr4v9pirFjo9PDoxWldwhDdRNClujU1Mkp1O51utRqdcX7CNMZWzUAi/6Ynx16MvSgZwDKLYjqOFSVciihp5sEgA4wAl7cHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731677122; c=relaxed/simple;
	bh=aVtH8GKvNB4hotlvO9ZD/QPTN/0jxawpj33QBA46sQc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gfw8viiQPVSj28AC/mx2Y7PZFCp/vHu4c13emBdabcMLFAut0iwG01q5KAjHXCVXR7cibYUJkg7/RTFrbd5U8YngukZpWiZrKK02HfblipXjv6IDAKiKWzVMy7X5lWi9qNtQVCu8KJZPRx2dbiPZTC97FM4VSHXUM+HkkvUzeG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKZhJGH+; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKZhJGH+"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-856eee9f8c4so28906241.0
        for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 05:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731677119; x=1732281919; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXYAb6PLHFnX5ddiFPzuGuSWsu4V6JIF0+6sI4IJYrc=;
        b=rKZhJGH+8Nx29zQlkYCHoUISy1aNbUq9rF3QrTCbKh6OjNYprX4y84JyQDn8yXKOti
         nk2KOw/1I+i3CmWdgdILCYGNtGioGROUfs6qIsl8x358Ls7/ryIavs7yalrVcWDye/1S
         N0H1AWtJYpc3Tl9WVqfgioizwMF4NrX/yeaSl3Ji88N+OFPVKr56d1eemdwcYUCRHWHR
         6rlPdhzK5qG9A+JV0Qh4pKx+Og/U2tthUumL0VcmO8y/xE2am2ZJgAHC+1UGHQw1vSD1
         wyH2rIHYO/kVoYuIFmKw7CZEOlsU/gU3z7E8WAUI8Mlq4MyU+30O3woKrENmRweSvnP0
         HMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731677119; x=1732281919;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXYAb6PLHFnX5ddiFPzuGuSWsu4V6JIF0+6sI4IJYrc=;
        b=K2nvKQbmPENWA+dIFv8kdkRUazeKKvgREsN+D3g89xBwd0aFXA3z/TwSOhsxkL2580
         cgdDQRwoVGRmvbAhHBoeoiSgnKjNF7PCvWvMtRNFw9CohGPm55YQawLEA49P2E/hrkr4
         xwdNupYjuFRzB4NwKfVj4w4tgLa+nHTlBY7oDFglR4cOYLrBN1Iv82p6G0lyTiCRm5E2
         dUBxH/DpkgM6pjqEPPy7BCg/ncvx3Tx19QM8HBcaaTEMEV0a8nLcuIG72v0RHpVRC21e
         jt/aBeyijXYQNk1tqTscD1SlXFbfBEE8PzD+A74xQkA3RI0MO6tYMj9B4fVLSOKepw6t
         lRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+i96AgS5XGp0umZ9hJcxce+OB/6rftcz/1N9C0Pbg8zEWH7VnW02VyjJn2qqvQLCgyWWCp+rAixwWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBzoXgudRhgYAtbO/puFMc7iJM+z37nQ/G4WNN2mLpGyiUIKeN
	6GEqVmXxWmu/CUUOPsACJOdOUCvx7XqTCEvcNBrlAdnpbt5fUMXdHLhLYpcFHJYJxh8Jb4CVg01
	XGwvbmHNQxHwrZbgMAHGWjm9NHnHschPDKkiJRw==
X-Google-Smtp-Source: AGHT+IHP9qntYDPkv8gz3RyGGvJS5CGBuoRgWcRvYQNEWDKJ0JaS2OYT0qdnUSe+4HP41XhcqjGcI8JG9uxcwd0IfNU=
X-Received: by 2002:a05:6122:1787:b0:50d:85d7:d94b with SMTP id
 71dfb90a1353d-514786d3b56mr2773887e0c.11.1731677119052; Fri, 15 Nov 2024
 05:25:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 15 Nov 2024 18:55:08 +0530
Message-ID: <CA+G9fYv=qPeZKkF+ntWxUXbAKjz4gXnBM8y60C4F=YHv+jgZZw@mail.gmail.com>
Subject: riscv: include/linux/perf_event.h:1679:84: error: macro
 "perf_misc_flags" passed 2 arguments, but takes just 1
To: linux-perf-users@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	coltonlewis@google.com
Content-Type: text/plain; charset="UTF-8"

The following builds failed with clang-19 and gcc-13 on the
 Linux next-20241115 tags on riscv architecture.

First seen on Linux next-20241115 tag.
  Good: next-20241114
  Bad:  next-20241115

build:
  * clang-13-lkftconfig
  * clang-19-lkftconfig
  * clang-nightly-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
In file included from include/linux/perf/riscv_pmu.h:12,
                 from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                 from arch/riscv/include/asm/kvm_host.h:23,
                 from arch/riscv/kernel/asm-offsets.c:12:
include/linux/perf_event.h:1679:84: error: macro "perf_misc_flags"
passed 2 arguments, but takes just 1
 1679 | extern unsigned long perf_misc_flags(struct perf_event *event,
struct pt_regs *regs);
      |
                    ^
In file included from include/linux/perf_event.h:25:
arch/riscv/include/asm/perf_event.h:15: note: macro "perf_misc_flags"
defined here
   15 | #define perf_misc_flags(regs) perf_misc_flags(regs)
      |
include/linux/perf_event.h:1679:22: error: 'perf_misc_flags'
redeclared as different kind of symbol
 1679 | extern unsigned long perf_misc_flags(struct perf_event *event,
struct pt_regs *regs);
      |                      ^~~~~~~~~~~~~~~
arch/riscv/include/asm/perf_event.h:14:22: note: previous declaration
of 'perf_misc_flags' with type 'long unsigned int(struct pt_regs *)'
   14 | extern unsigned long perf_misc_flags(struct pt_regs *regs);
      |                      ^~~~~~~~~~~~~~~
include/linux/perf_event.h:1680:22: error: conflicting types for
'perf_instruction_pointer'; have 'long unsigned int(struct perf_event
*, struct pt_regs *)'
 1680 | extern unsigned long perf_instruction_pointer(struct perf_event *event,
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/perf_event.h:13:22: note: previous declaration
of 'perf_instruction_pointer' with type 'long unsigned int(struct
pt_regs *)'
   13 | extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:102:
arch/riscv/kernel/asm-offsets.s] Error 1


Build image:
-----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241115/testrun/25823358/suite/build/test/gcc-13-defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241115/testrun/25823358/suite/build/test/gcc-13-defconfig/log
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJj2d60yO8ruYvm0gjhi4YHS5/

Steps to reproduce:
------------
- tuxmake --runtime podman --target-arch riscv --toolchain gcc-13
--kconfig defconfig

metadata:
----
  git describe: next-20241115
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJj2d60yO8ruYvm0gjhi4YHS5/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJj2d60yO8ruYvm0gjhi4YHS5/
  toolchain: clang-19 and gcc-13
  config: lkftconfig
  arch: riscv

--
Linaro LKFT
https://lkft.linaro.org
