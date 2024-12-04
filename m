Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4B1DAC93
	for <regressions@lists.linux.dev>; Wed,  4 Dec 2024 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308285; cv=none; b=pP8tlWhZdaI+I0xQ2Dhg7B6Kn9ReJVIbSfMxaYKQxSTHMD23Wx3VEmDDsiN6eGWUGqY2kcgMi6GdjqIRcer4dPL3Hf5xNdd4maRe4NaVzutO20kB4gKxO7rcj9SQCut7g7pUOe0Pgq+rgNO3EwZ89LxREyvwHUZANEzmVLFre04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308285; c=relaxed/simple;
	bh=vAsH6MnaEk9q60JG7f9rI5ko+v1PT6qYTJsjyeNqYbI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZMfpPpMPvmzPL370VgSW/aKFIGkiIK5pkK8aHaW6UbDFynTdbGOl1QXYSSXXy5ENzPPR1xDBUO5ewJQ75kP7c29xvk6GANiigSw9cjVWlqyExk00Xfn/4IWcq37cgUihuT2t7evI4p5cyImslmWNsdqafnLk8ZT6qe0U2nVLpPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8RAVC6X; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8RAVC6X"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85bc5d0509bso734429241.1
        for <regressions@lists.linux.dev>; Wed, 04 Dec 2024 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733308282; x=1733913082; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MHZqGoUWlClziZon67vL+ZIDd0uUbSc5vRlqScvdhAg=;
        b=W8RAVC6XO1Y86SZI+OoDPrKrLCeqM/oebwelYFppFkxFembHME1rUOsTAqTvW17M64
         RlupFbAlPesHoVfabxJhudzYspa0XYPqwgNfNlRnCPd+uw08dCbQ1NOuHFmPLF4xN7yX
         N1StaHOiiVpP8SrBqBoz52gN1uawd62OV0/Jt8/TfHyzhLg2XHperYvgS8VRWRIoitiv
         tgvjjBHyJ2EAeYGJfAWnKquXzj52PzZlgECGI6QMrstRz7/lq5PBLXxVfD1akNArSwQa
         DnqeXHGdIh70LfhxzwI5gugl1mGCsCbN4Yq0cPODXnYG0SxGxHeRfGvMm8NXyjhPMiCF
         dI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308282; x=1733913082;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHZqGoUWlClziZon67vL+ZIDd0uUbSc5vRlqScvdhAg=;
        b=O5K3txUGY+Wqa7qAg2fkzb1OPWPWH/hVomNgZLxmboH+STZVjrk+DrJ8aaVtUfashs
         pa5L2dJJtqqkwB0QkEGR5lDPe1uaenfmiNp3qJimdFC8OFVqU8cLW8hMkoExvPcwNT48
         f4eJ47AxfeoeROB83nFzgrHOMraaLjQBjzisTpQTn2HoYOhIonRqNWLoJdtmVM/uxlxX
         jfG18rP9bbmq0hVSsWIrJ5lMhvEdiHZ+1sJAEUoC1Py0ALQTQ7W6cOeYFXQHj4jt2cbz
         CETXeS5E6ysv/8LnJu8HtA4SiPYFMK9t0UCbuE9m1WsXIF6wYiBFFpVFZFl9KHwKzX02
         gVqg==
X-Forwarded-Encrypted: i=1; AJvYcCXqukaBMl2VzviV1fM6hECLFUHVGKl/J2EHO6zY7kH7Jn1b+eeh8m0DtWZiP4DuXvE0xClPfdLSbaNM0g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc1t8LniSZcqSMwdD6nJo6F6VC74DDW4gQ65J37W6sYe3cEzBA
	pvcZ4I0qwh+6npuEh2O/lnFRh5dTswN0X61KNISBtUDcnx4LT0c3atfJHh0w0rxuNdkL00wtUHj
	oAlRHD1iSAREoOpW4s1xXfH6xNImHPf3NPdpUxw==
X-Gm-Gg: ASbGncv4fefqIsIuZrrv1eGqhEfXGBk4oWfGVQq4DGoIEqgkRs/IPqVXLE6+ym00wdl
	Ok4mACnts11v+l9je4/bcIWDcz3VWLPqe
X-Google-Smtp-Source: AGHT+IGzmWUJVmPN1eOgu9kN8rAcGofAl+lpuZp+XiCWblexF4Qy5RN+9yN7Hxl4Y5rZ7gNdO/a89AZ+ZMppZu2Bfcc=
X-Received: by 2002:a05:6102:26d5:b0:4af:3fc1:e02 with SMTP id
 ada2fe7eead31-4af973825d7mr6798788137.27.1733308281831; Wed, 04 Dec 2024
 02:31:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 4 Dec 2024 16:01:09 +0530
Message-ID: <CA+G9fYsD7mw13wredcZn0L-KBA3yeoVSTuxnss-AEWMN3ha0cA@mail.gmail.com>
Subject: s390: block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
 declared with 'error' attribute: clamp() low limit 1 greater than high limit active
To: linux-s390@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	linux-block <linux-block@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

The s390 builds failed with clang-19 with defconfig on the
Linux next-20241203 tag due to following build warnings / errors.
Build pass with gcc-13 defconfig for s390.

First seen on Linux next-20241203 tag
GOOD: Linux next-20241128 tag
BAD: Linux next-20241203 tag

List of arch and toolchains :
  s390 defconfig with clang-19

s390:
  build:
    * clang-19-defconfig
    * korg-clang-19-lkftconfig-lto-full
    * korg-clang-19-lkftconfig-hardening
    * korg-clang-19-lkftconfig-lto-thing

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
===========
block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
declared with 'error' attribute: clamp() low limit 1 greater than high
limit active
 1101 |                 inuse = clamp_t(u32, inuse, 1, active);
      |                         ^
include/linux/minmax.h:218:36: note: expanded from macro 'clamp_t'
  218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
      |                                    ^
include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
  195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_),
__UNIQUE_ID(l_), __UNIQUE_ID(h_))
      |         ^
include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
  188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),
                 \
      |         ^
note: (skipping 2 expansions in backtrace; use
-fmacro-backtrace-limit=0 to see all)
include/linux/compiler_types.h:530:2: note: expanded from macro
'_compiletime_assert'
  530 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^
include/linux/compiler_types.h:523:4: note: expanded from macro
'__compiletime_assert'
  523 |                         prefix ## suffix();
         \
      |                         ^
<scratch space>:38:1: note: expanded from here
   38 | __compiletime_assert_557
      | ^
block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
declared with 'error' attribute: clamp() low limit 1 greater than high
limit active
include/linux/minmax.h:218:36: note: expanded from macro 'clamp_t'
  218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
      |                                    ^
include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
  195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_),
__UNIQUE_ID(l_), __UNIQUE_ID(h_))
      |         ^
include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
  188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),
                 \
      |         ^
note: (skipping 2 expansions in backtrace; use
-fmacro-backtrace-limit=0 to see all)
include/linux/compiler_types.h:530:2: note: expanded from macro
'_compiletime_assert'
  530 |         __compiletime_assert(condition, msg, prefix, suffix)
      |         ^
include/linux/compiler_types.h:523:4: note: expanded from macro
'__compiletime_assert'
  523 |                         prefix ## suffix();
         \
      |                         ^
<scratch space>:38:1: note: expanded from here
   38 | __compiletime_assert_557
      | ^
2 errors generated.

Links:
---
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/details/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch s390 --toolchain clang-19
--kconfig defconfig LLVM_IAS=1

metadata:
----
  git describe: next-20241203
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAPS9UrJkbAKFHktQei7eqW4Y/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAPS9UrJkbAKFHktQei7eqW4Y/
  toolchain: clang-19
  config: clang-19-defconfig
  arch: s390

--
Linaro LKFT
https://lkft.linaro.org
