Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77717B
	for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 10:14:19 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gi31so19955880ejc.5
        for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=rcpUjo+cyhxrF2PUlntwQQeQhblXyhNJQMZ6x8R4WfU=;
        b=fXlMHdh22iAOkp3d197BppcPR8XsI4EebfdCp2ByM+AuZbMtpcWbm8oUBwGpGUFc7k
         6cR4QkyyMUZ2DCwkTQ0hUKYkRxUdkHasMqeKndSQHnqV2oeYLDjuPFiedCijZsoQsc/M
         d321fxsRuympwfr9adDcnLOkaisFvOINQvsYaBD9ROWTX00k4q2lxZT9oJjfbSJlegjS
         5GD+SOcHYTi7TqlE/b3u8E70GYK7T/73PHyyRYRJee2RLY5bGv2FiNs3VTg8kgkiXf8y
         LQEN539+FVp//KzJVqb4O2O7//UbhoYo/Wj7C8tjrbvdptXYl05DA6fsllEAN5sxi2cA
         Fngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=rcpUjo+cyhxrF2PUlntwQQeQhblXyhNJQMZ6x8R4WfU=;
        b=VwNQlUISxwFU/U4GY3ohhS7cxLN5sVUL4x3pMvyvHcvEYwtHNPLb+xBRX7wRb433EW
         YEdUDGFlZ722sRJOntD9BSpuUn25ut12hwSEMT8p1FQFMXMyNh/ANbPIpiLniVOk2V5z
         1U/sVKz23ZAeONcV9qcfWgtZDH1JF8bBEhUSnFDmbw3Mwd8Ol6knCc540Tv4dyvOSvty
         ydxLYmNYTtLh1PapXAKIhjl+ttmAP25QxGN/cvUXwUaspHBGE4kvZKAQQZXRjmNS/m3p
         7Lm2KyLBsFkTzwms/catCGKSyFOH1lsPTlwvY/arm/h7uunpL4/cMc+GYel48HSBy9Cx
         awKw==
X-Gm-Message-State: ACgBeo258X8SHlU6FGkI6mo8COk2vdhwBUgsfXZ5/E1O5bY4lqFy0Ya3
	/kA8qI3iCZ3s8WrKIJpdgroUfKk2s6CTLpipKoPRPxxlwKsqsQ==
X-Google-Smtp-Source: AA6agR6NV/6jojdTjYjTVv3lqUiVn7Xxllsko6ljv3UJddHUctRmt+3eGXXi1SJS8oCEFxsto2JNt1A8K7u5y7RNmb0=
X-Received: by 2002:a17:906:fe46:b0:73d:939a:ec99 with SMTP id
 wz6-20020a170906fe4600b0073d939aec99mr3100308ejb.169.1661249657957; Tue, 23
 Aug 2022 03:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Aug 2022 15:44:06 +0530
Message-ID: <CA+G9fYsm_2WZncWJbwkJkbnOJFvnC76jQdUWkHhyih4GRKjMGg@mail.gmail.com>
Subject: [next] mm/pagewalk.c:318:12: error: variable 'err' is used
 uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>
Cc: Rolf Eike Beer <eb@emlix.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

x86_64 defconfig builds failed on Linux next-20220823 tag with clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on x86_64:
   - build-clang-13-x86_64_defconfig
   - build-clang-14-lkftconfig-kcsan
   - build-clang-nightly-lkftconfig
   - build-clang-11-x86_64_defconfig
   - build-clang-14-lkftconfig
   - build-clang-nightly-x86_64_defconfig
   - build-clang-14-x86_64_defconfig
   - build-clang-13-lkftconfig
   - build-clang-12-x86_64_defconfig
   - build-clang-12-lkftconfig

Regressions found on i386:
   - build-clang-11-defconfig
   - build-clang-nightly-lkftconfig
   - build-clang-nightly-defconfig
   - build-clang-14-lkftconfig
   - build-clang-14-defconfig
   - build-clang-12-defconfig
   - build-clang-13-lkftconfig
   - build-clang-13-defconfig
   - build-clang-12-lkftconfig

make --silent --keep-going --jobs=8 O=/home/tux   -
build-.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1 ARCH=x86_64
CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang' olddefconfig
.config:5286:warning: override: UNWINDER_FRAME_POINTER changes choice state
make --silent --keep-going --jobs=8 O=/home/tux   -
build-.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1 ARCH=x86_64
CROSS_COMPILE=x86_64-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang'

mm/pagewalk.c:318:12: error: variable 'err' is used uninitialized
whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
                else if (ops->pte_hole)
                         ^~~~~~~~~~~~~
mm/pagewalk.c:321:7: note: uninitialized use occurs here
                if (err)
                    ^~~
mm/pagewalk.c:318:8: note: remove the 'if' if its condition is always true
                else if (ops->pte_hole)
                     ^~~~~~~~~~~~~~~~~~
mm/pagewalk.c:311:10: note: initialize the variable 'err' to silence
this warning
                int err;
                       ^
                        = 0
1 error generated.

metadata:
Build: https://builds.tuxbuild.com/2DkF28RfJ2VeMSGwDNhsXXu3dbo/
config: https://builds.tuxbuild.com/2DkF28RfJ2VeMSGwDNhsXXu3dbo/config
git_describe: next-20220823
git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
git_sha: 05477f3653b82d8b3bcf39d2937d9893124976db
git_short_log: 05477f3653b8 ("Add linux-next specific files for 20220823")
toolchain: clang

Steps to reproduce:
------------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

# tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
--kconfig x86_64_defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
