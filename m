Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89028983A
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920159; cv=none; b=cURe6oZcJIKX6iDz6+sswjHjVKAxXXtLlGiY5/lBDSW9kMQVhFh/bEVhy7gEo3wM7kUNRj9bqWPnMnjEb3atvlXfsNwWYyIwKjA/ptH0sYr/n1rVZ/X2wQioSX70qTY/F+iJk8OgaZ0sSNDKd4YtCLmfCJiueD6GjBfzy7edGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920159; c=relaxed/simple;
	bh=9d/cL7spZ/Wpwt5q//l/yGfX4IJgepMQQJ1VLqzbCYI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IeIPnYRL6tx2b4tuFa/HSWmxeY/ImWwqCGLsFu/WiquU3rF1eRc48amsw7kbLkq8AxSqbVe7GnZxTcHe7bADuBnwtj2S2OXTKWs+iFSwTVC+mSHo2xo1270mZeiSU3ssAVJ2dxTqYF+/WK/JQPSIre2b9yBVpTMLEGtOoWbQq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YfnR8ZMN; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YfnR8ZMN"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86a052d7897so530989039f.0
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747920156; x=1748524956; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZfTBhDhdrqletUuYxc3+baMCOgR/beos1y6YIz7hWx4=;
        b=YfnR8ZMNIPNr7mO8zX/xkfJOYwavI2tbmyjmXiRKshCfmYSA3+ThQsd34o8DV87Y4g
         HpwhiLTnpslpf2guQ6APGLWppW2Iz1zfWCOrYKGTJ++GOL/2bb7FusxIfK84JvPRIw4x
         asv6/RXma71TfxWUNqjil3mqOH9al6r3f8btSvlyo4UuFMmimwoVONCUb2D5EoY+2lCw
         Tx7TcstcO0HYPmyh9mgTCiU3JGtOqgawo1GqYAfHLRR8wozOoeMettTrk8cA7LnWqbSz
         r4txL4gDTSurwNWI1xcBx1ptp/sLDNa0akyH1Y0ujQjczlmcWrKZ0O816r6B8EOqermW
         ymCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920156; x=1748524956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfTBhDhdrqletUuYxc3+baMCOgR/beos1y6YIz7hWx4=;
        b=T8Cjvl7aeFjocZliGB6CJVVKIntPaiwFTEI0wH5yNiil3EziYdAf+L8TjNXuaZXIy1
         SmSWZSBe54ZzopLQ6DoiQQ6aJkOoUQng52PJadKL4vwW0cC6V3korpH2XA8bNo6IAdAa
         eNP8CQpWGlqXd8tdiPDz/CBGj4wyWpUq6HUeogp8r5yev8vfXWNo9j/0aBA3NojLtyi0
         gRueG+s/y8yPePIRmhrAgi3lYLq7j6n8+/24yiUdEW1MSE6wfafSC61FD1591W8SfNUX
         Pub2lA1qolfsY/YpBrVFvexDhcSLO1sTGKo4e0jM692mgtdh/NEPJhP8w0JLunu4xfiH
         u1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3GMnc44SrgwR1jpzKEpUaiwNLdRDcbxRF50WFN8xIDusyNFcacI+N+l08uDyrFXeL9NyDeVn5kSuniw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUS0IRRLKvRYXiFEa9WymKyboY3LBtgQJ1xLg82F0KRZJtIq2s
	bH8M5BFYLFCkTGPmTlWmeJv9oY9wg48K1vByI455U6gqcygj2ivMmxGW9psAFB+ScoUClaGrHgU
	J5s4MDCUHAwIGV6Uq7w6ZXeFRTT4Bwt+TY1+0zIVUcdjNkbfiZTJL3Vw=
X-Gm-Gg: ASbGncuATeA4wkU6HiQ5bcQVeM5z6mjrOKMf/9EavaoN20VO1inQjS+IRUKNH4RDebd
	hFPqCWH79WayOj0iEBxiTvYPw3QrY0dslcHFMKfTR7f1eTauV+HA0m2QcJoDQusvn7OrOG/WXnf
	V2S+Arlbj1N2cI05wWkXB0TPwn5pfUn0V0nDWOy8AtJHLkgroXolR4BTuc3OouAZq+m8Id+KkT2
	2pv
X-Google-Smtp-Source: AGHT+IH2x7M+ebP0fF6u65wtIJfC2HKWreUBC1mFxNZYez5c2LjS+RbEJT03nVtElBzCk2DLszkS0XUj8hnQ/3AfrTc=
X-Received: by 2002:a05:6902:13c6:b0:e74:b106:ec71 with SMTP id
 3f1490d57ef6-e7b6a317681mr31915653276.46.1747920145756; Thu, 22 May 2025
 06:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:52:13 +0530
X-Gm-Features: AX0GCFs4fMOBdKUjtk4Ii_YEa3Zj0uO_GBWF7untQbLfXNpr8KzqJEF5L9aKhfg
Message-ID: <CA+G9fYsZPSJ55FQ9Le9rLQMVHaHyE5kU66xqiPnz6mmfhvPfbQ@mail.gmail.com>
Subject: mips gcc-12 malta_defconfig 'SOCK_COREDUMP' undeclared (first use in
 this function); did you mean 'SOCK_RDM'?
To: linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on mips malta_defconfig build failed with gcc-12 on the Linux next
tag next-20250521 and next-20250522.

First seen on the next-20250521
 Good: next-20250516
 Bad:  next-20250521

Regressions found on mips:
 - build/gcc-12-malta_defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: mips gcc-12 malta_defconfig 'SOCK_COREDUMP'
undeclared (first use in this function); did you mean 'SOCK_RDM'?

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
net/unix/af_unix.c: In function 'unix_find_bsd':
net/unix/af_unix.c:1152:21: error: 'SOCK_COREDUMP' undeclared (first
use in this function); did you mean 'SOCK_RDM'?
 1152 |         if (flags & SOCK_COREDUMP) {
      |                     ^~~~~~~~~~~~~
      |                     SOCK_RDM

fs/coredump.c: In function 'do_coredump':
fs/coredump.c:899:64: error: 'SOCK_COREDUMP' undeclared (first use in
this function); did you mean 'SOCK_RDM'?
  899 |                                         addr_len, O_NONBLOCK |
SOCK_COREDUMP);
      |
^~~~~~~~~~~~~
      |                                                                SOCK_RDM
fs/coredump.c:899:64: note: each undeclared identifier is reported
only once for each function it appears in
make[4]: *** [scripts/Makefile.build:203: fs/coredump.o] Error 1


## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28516701/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28516701/suite/build/test/gcc-12-malta_defconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9ld0H5IJGyGHQxUSopFLZrU/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9ld0H5IJGyGHQxUSopFLZrU/config


--
Linaro LKFT
https://lkft.linaro.org
