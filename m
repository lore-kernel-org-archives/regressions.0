Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140557C
	for <regressions@lists.linux.dev>; Mon,  4 Apr 2022 09:58:53 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2eb680211d9so22426917b3.9
        for <regressions@lists.linux.dev>; Mon, 04 Apr 2022 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BSO0kFh3YEWrUECL7RSnVqkqACtkuW55j7gZPsyRTko=;
        b=ax8AZ1pm4ofTW+s0FnLRVMNYlqHoNDED5O0kTeYCr19DQHGTWUrgy54PtSPmwsxEr0
         CugW/TfIWmE5ZrEaHDHmkXvKL/KlXAbkXRbaq1h6hvgSS4zIGu/ugQjHbhlRQcc+qXYK
         JiTr2Yr4m2w4C87NSpvzhpLhe+tX875Fhog4L0K398FAbtph3dAs1+29F7HViZ8llf4/
         SNoYtYW7EoQudSJ8Et6LSW6s+fVN19jj6y+TVk7j4+CNHNQ5iesSEG9igyq3uggL7Hhq
         yYglHofcVo2rkMaDar9g6lsNEgI1UEvgnviQKcb2hSn88aGKvntd9MJS6iGDXtpFuEc6
         F7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BSO0kFh3YEWrUECL7RSnVqkqACtkuW55j7gZPsyRTko=;
        b=8G6k4QeHQs8BBm3dmS6DbTWH8nK4umzL2KJN5FedGe4EO1XQ/zIGllnjvfYkwibvaR
         dLq5x7hWUAFo81smjHBZW7vOR8JpVI1LOopqWNe5ylv9GCSPbOVP63wx87+wx8okGweZ
         42qLg1W0LuqOfRr8OCu3eUJcJqPyH2PBrvcLkaSxnx8KwfIywTPF4T1XKg/XrldnF4+z
         llYjERz1AZPMq2fIgOQjfD9/MF76XoCXkqnF0LJrk9952rLztLVwMbrhOsAO3TtzJHIN
         MTlIb4/hBBS/HWmBLHn12s5bBhKQhy/dcV/3LHpnstMtJmnF2i/opsoIwxc5ssgq4171
         0KtA==
X-Gm-Message-State: AOAM532IGx0/piiN0c1AJlaL0nmD/wDC6kh3VpkG3vuPT08sHvcQLlcS
	YF8UrahqL8UlvMm3eXtB0MKbREh2cZFRGhGHMGYcWA==
X-Google-Smtp-Source: ABdhPJyFL3cKn7V7sre/I6PQA8Oqq4hzE7C9nhhnTPXZUCObFfK1+FNV4saECxlTNxJ/XzfZ+W6EaQDzGSl+ASXQgsw=
X-Received: by 2002:a0d:ffc3:0:b0:2eb:2327:3361 with SMTP id
 p186-20020a0dffc3000000b002eb23273361mr13812616ywf.36.1649066332945; Mon, 04
 Apr 2022 02:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Apr 2022 15:28:41 +0530
Message-ID: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
Subject: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Guo Ren <guoren@linux.alibaba.com>, 
	Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"

Linux next-20220404 riscv defconfig builds failed.

Regressions found on riscv:
   - riscv-riscv-clang-14-defconfig
   - riscv-riscv-gcc-10-defconfig
   - riscv-riscv-clang-13-defconfig
   - riscv-riscv-clang-12-defconfig
   - riscv-riscv-clang-11-defconfig
   - riscv-riscv-gcc-11-defconfig
   - riscv-riscv-gcc-8-defconfig
   - riscv-riscv-gcc-9-defconfig
   - riscv-riscv-clang-nightly-defconfig


arch/riscv/kernel/compat_signal.c:7:10: fatal error:
linux/tracehook.h: No such file or directory
  7 | #include <linux/tracehook.h>
    |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.build:289:
arch/riscv/kernel/compat_signal.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
    git_describe: next-20220404
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 696206280c5e5c028caf9fd259999cb72b1f6127
    kconfig: defconfig
    target_arch: riscv
    toolchain: gcc-11

steps to reproduce:
  # To install tuxmake on your system globally:
  # sudo pip3 install -U tuxmake
  #

  tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig


--
Linaro LKFT
https://lkft.linaro.org


[1]  https://builds.tuxbuild.com/27JdBBUbSHIhFJ9Wsq3Z6ssitb6/
