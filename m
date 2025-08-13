Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51399298CDE
	for <regressions@lists.linux.dev>; Wed, 13 Aug 2025 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107778; cv=none; b=fQvOGqadvKMBO0TtWDl9IGFEicoHyy9ZMbpznl1lbHIvkkoZ735psVnt6svhisfGlXcJP9jP2TH6MlUyzNxxBh006MqtwBnEVv8cNd+e+Rd3xwdmo5TNlBkWHQqzbcnAipeUXnLEw4zqrR59KUixaVe6HEbjqrfvWblqp7xLr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107778; c=relaxed/simple;
	bh=nl2yBpZRvTfmVxRWdsIQVBAvauFmBGisrTQMortALrI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ccyZidlJgKI/I7HoHR9sfMLKl/3xXX9uOO0OeMwdXkTnTxbq8wgaqjm+wjzsWJcybtzvP4p+5k7lE045pP3m6Dy/U4NcAYhdwtK4xrc8YDJ1pE1chYmqBNDE2WRva+ahOyhaJV61ihp4/hSLE57v4XXPDvl9i4ZGBz5VJTvul+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CpdA6Njl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpdA6Njl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24458298aedso165305ad.3
        for <regressions@lists.linux.dev>; Wed, 13 Aug 2025 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755107776; x=1755712576; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XoIq2ubOlyxbtRkYBP/TzvBun/sOOkbTC4CyxYULUYc=;
        b=CpdA6NjlBP18BhXDYXEP4Q/zZFHJigk1yLV5FFu+kwH3bnITwg9uO3BPYqVTOVRctB
         3nmhM79ue0WIx3l6l5xi4uKEKT2oTi79fgdP4v4bCtXcsUHDh9HVlUttZsmUum2lPeBp
         l90FVal8UWvMAX3kacplAmfjy5+DlLkKnFn+UPI3J7C5H5W2wYbRRpM0pT3TBWG8avX0
         PVXq+ArwwcU55hLWacpjjgFWQzCQdqF+xXl2MAAocV1FZQwO4kLkCCi4/Euv4yGWTq4M
         TBbQfiSzyT1kRAiLZ/kDRUk9lqPqbG7ddjfoasrRVE4CYQaBXuSqzlwtQOfOdrFAiymz
         VMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107776; x=1755712576;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XoIq2ubOlyxbtRkYBP/TzvBun/sOOkbTC4CyxYULUYc=;
        b=kSMv4YWKbnTAIbmPbCZ/z3u0G8x9LXBBfeWJ/DLFO9MtFUksNPTpzxz6z0MuXLEinA
         0ECZ0zvBeQ7QLAg2RndAadM0oBhtX5uW9sV+f8ad6IofpkTQ9tUmTPbZvumHjvz8MfeO
         vcWqUidJt+hZ/ZoEKQfJBq0Neyj1+kRRVW4Qa1KkAzd4+gmqtVgQmS7bFMKKaMTUeO5N
         6BOkD//QKLtj1piVGcaKJ4UK9+ndMpnAwrvwuUKOL5Rtg9bVvV6i4GmFCzH/GYmpJMdK
         QMp9pgy235aGDYIhOPfLyytvYLv7g8HF9h+uS61/sZKvjVQL1WztQH51XdERaoWv9ydx
         m+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCV7wS+cIzX3IJmA1vF7fDNm5sJw2k/JcFQNXLj/cmUNSoJYrTbDZMVepdGZ52uJO0jQXNuJAu4uOrbY8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPLtPm598tdVuCIyFDmRe0OzyhAFqjC82QpML4vVYfNC9+jyIL
	wJqr51rLY7BOeGIJRxYva4c4I0DRUOPTkWlf8rZZHev8ovvtfVEkZ30oRFySO8s/YHEeaRURvSW
	mXN7Ptdg6XdP03CNfmn/nKRVICRVsg8LCHvrTnF1gJA==
X-Gm-Gg: ASbGncs3OAvEELYkOsnaGgx4E/4nemiascwCPUeaaer1qhcvl/fwYoEMRs1fZ6s/vyT
	R+O1BZjcNF3XZcmSBxU2C+D6LliV3fT00nfrP0VQ2aZzQTwCAw38GwJeUQKunYmB73A2sLgYIez
	ZsN3CcebLyN90K168w/1PnYteuGZNytIvYkoDjNYZODODXVqoKFksG6PuqTe3rrqXvkj6XTo2wg
	Z4RCu/RPic4Rwc1axypShqaW2h5UeSlivPRBig=
X-Google-Smtp-Source: AGHT+IEkiAGoLbMGkvXnlFSqPQ+NERPuNoFrCDcPTgVm2ojJsZrVhHUi72yNXNyT4cDONEDGhe3E10OKGjZiy9tS3ck=
X-Received: by 2002:a17:902:e5c1:b0:242:a0b0:3c1f with SMTP id
 d9443c01a7336-244584af50amr128565ad.7.1755107776617; Wed, 13 Aug 2025
 10:56:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 13 Aug 2025 23:26:05 +0530
X-Gm-Features: Ac12FXyG0YWZ_N3cTY6hqEM4R9dYMT1co-eY8G4uUHRenE8ObEitphecfPJYjck
Message-ID: <CA+G9fYtJPqkugHFbgs8vNK5jNGivX1yO1ZiL2q97c_dazUiArA@mail.gmail.com>
Subject: next-20250813: x86_64 iov_iter.h:171:7: error: variable 'remain' is
 used uninitialized whenever 'if'
To: clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions noticed while building x86_64 and i386 builds with clang-nightly
and clang-20 toolchains on the Linux next-20250813 tag.

First seen on the Linux next-20250813
Good: next-20250812
Bad:  next-20250813

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

## Build regressions
* x86_64, build
  - clang-20-lkftconfig-compat

Build regression: next-20250813 x86_64 iov_iter.h:171:7: error:
variable 'remain' is used uninitialized whenever 'if'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
In file included from net/core/skbuff.c:66:
include/linux/iov_iter.h:171:7: error: variable 'remain' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition
is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
include/linux/iov_iter.h:163:22: note: initialize the variable
'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
1 error generated.
make[5]: *** [scripts/Makefile.build:287: net/core/skbuff.o] Error 1
In file included from net/core/datagram.c:53:
include/linux/iov_iter.h:171:7: error: variable 'remain' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition
is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
include/linux/iov_iter.h:163:22: note: initialize the variable
'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
1 error generated.
make[5]: *** [scripts/Makefile.build:287: net/core/datagram.o] Error 1
In file included from lib/iov_iter.c:14:
include/linux/iov_iter.h:171:7: error: variable 'remain' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
  171 |                 if (skip >= fsize)
      |                     ^~~~~~~~~~~~~
include/linux/iov_iter.h:190:7: note: uninitialized use occurs here
  190 |                 if (remain)
      |                     ^~~~~~
include/linux/iov_iter.h:171:3: note: remove the 'if' if its condition
is always false
  171 |                 if (skip >= fsize)
      |                 ^~~~~~~~~~~~~~~~~~
  172 |                         goto next;
      |                         ~~~~~~~~~
include/linux/iov_iter.h:163:22: note: initialize the variable
'remain' to silence this warning
  163 |                 size_t part, remain, consumed;
      |                                    ^
      |                                     = 0
1 error generated.

## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250813/
* kernel version: next-20250813
* Architectures: x86_64, i386
* Toolchains: clang-20
* Kconfigs: defconfig

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29479215/log_file/
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250813/log-parser-build-clang/clang-compiler-include_linux_iov_iter_h-error-variable-remain-is-used-uninitialized-whenever-if-condition-is-true/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31DcGmmPgATtnxuFKXwu6DM9bZu/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31DcGmmPgATtnxuFKXwu6DM9bZu/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31DcGmmPgATtnxuFKXwu6DM9bZu/config

## steps to reproduce
 * tuxmake --runtime podman --target-arch x86_64 --toolchain clang-20
--kconfig x86_64_defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
