Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC151A3042
	for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731673201; cv=none; b=ILXCEhaIJb9p8EtfR+yCpgEnVeN2SHMj9zU4bxosNwhDwkhkds4hJo+n8ijHY8/SiC2hwcZnlG7aqkD4/IQvY5eG9jZA303h//yb+eSMqALWWxNWvUr55rT5Y9dShlT+gc/UidzlEiOS/yPF43KXnBEPxua3G9ErvSLGsrlAWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731673201; c=relaxed/simple;
	bh=uN2T0hKnqxB4NWs/1gfOc+22eYGA6JVtajykVUMCbdg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=knipcIA5Vs/PqmWcRDO2ZiI+RPEZIZa0LW8Cur5oqnuOVOt3N4l+/HwjC8oZ1hwUB9EnCQwYaPlnTFuUwmEp/MV8zkggyAjWWO2QFuepfo90D7CVEmJXsPVnhQ2DQw02oBiZ2kQiqboWT04GGEQ3TsIu6GVqtJabXFlrEcthMxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Obk0s+fc; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Obk0s+fc"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-514543a08d0so813652e0c.0
        for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 04:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731673198; x=1732277998; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BrmgfHiQVdWt3bBrDk5codO30Y6e5vUnxjycTHd1oVY=;
        b=Obk0s+fcwIbfJUYfQ9lOPU2iwBGXggH9njXARRSBIVnV1gA59qtlNIIDAgjIzIadu4
         vzOcbBiRd005AB7JCqltjXqN0Dg0lOZ/BsCB81R6FtfUrBrd1gJszM7gT4Pkqi6kPOm9
         /V8MnCDzcCJfeC4DXO8Rz8F8BRMu8dfqRrfH7UOrQh+ZDzpOceeQr/uXD9HH6RRmORJm
         G4hd6sRvu9ZYpF0HE8p2bkdqNaUJxElOg24D87wvE9rA+Xj0HevLU8nSCM/OU/7pPquI
         r36TzfBTML+3wbDw1DVhYJuFm8BuFqgQDUej1ViPQSIcEYxzQV5CJdMEo4gKPV1e+X57
         f08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731673198; x=1732277998;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BrmgfHiQVdWt3bBrDk5codO30Y6e5vUnxjycTHd1oVY=;
        b=fknr9xdThgPdxMilpwg7Uy9w88ealXj5EGjORShv5oipJulDnEIJmUpHe8WXkVSKrB
         yXFDxkQjEsx1yz4V5hIyucCXbJ2ih5PX1fACl47VwjjCtESK0XrzpY4Pl7lqx5JJZJoh
         TE3jboD1/jsRHhKkcGquKMj9PAxCQajy7J4HsgB1xBXDrcEX2wQ0/YWW4ySxEGuLDzBX
         l5MiWp46ix13d1wKCTcX+ARm9UHAqMxRLaCuao1ZQooanBsH+JeP+EWXARpW3ZNOWGFn
         u6MnFNLu/r41lnHjGSi3RsSlaKgiwT2nFX/LCfqtAXYIc3ZXLM2jhlbnFuge3azb2rMc
         y8gw==
X-Forwarded-Encrypted: i=1; AJvYcCWQSEBvQZy1xegd6xtc2t3uV02RIOjmlM0FqLgGl4flOcY+hZPuJso18HlT8Xy75kasPoeVXNAuFc5FAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMzLzIkyqreOSvfNefNVqJOSVonOXOYKEHsX528ZuytSy89hy4
	vSTCVJqv8xyEAFjIt+NiOeRfwuTZJrN522fjznpdtql93CnpXuhOzsA9+6pCBtjArbhL8hdOH3R
	Lf/cpZE2tlDpmUnjTlzzTEYng77y1vtuDjVsVwA==
X-Google-Smtp-Source: AGHT+IHDI7wr6k8bNzIN8dP+INAqSB/KifXxi0/sCOrtTa5mU7qUxRv4jWPQh+5k7/tidliCeLz9YCf87oIZixyf+pI=
X-Received: by 2002:a05:6122:3c4d:b0:4f5:199b:2a61 with SMTP id
 71dfb90a1353d-51477f99aa8mr2714614e0c.9.1731673197759; Fri, 15 Nov 2024
 04:19:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 15 Nov 2024 17:49:45 +0530
Message-ID: <CA+G9fYtPQ=L8g5i=3vzBOW4dPSPYviKGR0xP-gR=2Ta_FZFBPQ@mail.gmail.com>
Subject: Tinyconfig: include/linux/blkdev.h:1692:17: error: field has
 incomplete type 'struct rq_list'
To: open list <linux-kernel@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Content-Type: text/plain; charset="UTF-8"

The tinyconfig builds failed with clang-19 and gcc-13 on the Linux
next-20241114 tag
for the listed architectures,
 - arm
 - arm64
 - i386
 - powerpc
 - riscv
 - s390
 - x86_64

First seen on Linux next-20241114 tag.
  Good: next-20241113
  Bad:  next-20241114

build:
  * gcc-13-tinyconfig
  * clang-19-tinyconfig
  * clang-nightly-tinyconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
In file included from init/main.c:85:
include/linux/blkdev.h:1692:17: error: field has incomplete type
'struct rq_list'
 1692 |         struct rq_list req_list;
      |                        ^
include/linux/blkdev.h:1692:9: note: forward declaration of 'struct rq_list'
 1692 |         struct rq_list req_list;
      |                ^
1 error generated.
make[4]: *** [scripts/Makefile.build:229: init/main.o] Error 1
In file included from kernel/sched/core.c:41:
include/linux/blkdev.h:1692:17: error: field has incomplete type
'struct rq_list'
 1692 |         struct rq_list req_list;
      |                        ^
include/linux/blkdev.h:1692:9: note: forward declaration of 'struct rq_list'
 1692 |         struct rq_list req_list;
      |                ^
1 error generated.
make[5]: *** [scripts/Makefile.build:229: kernel/sched/core.o] Error 1


Build image:
-----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241115/testrun/25823523/suite/build/test/clang-19-tinyconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241115/testrun/25823523/suite/build/test/clang-19-tinyconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241114/testrun/25810736/suite/build/test/gcc-13-tinyconfig/details/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJibjMRLtDUebXPN6WOC65CLb/

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm64 --toolchain clang-19
--kconfig tinyconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241114
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 37c5695cb37a20403947062be8cb7e00f6bed353
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJibjMRLtDUebXPN6WOC65CLb/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2osJibjMRLtDUebXPN6WOC65CLb/
  toolchain: clang-19 and gcc-13
  config: tinyconfig
  arch: arm, arm64, i386, powerpc, riscv, s390, x86_64

--
Linaro LKFT
https://lkft.linaro.org
