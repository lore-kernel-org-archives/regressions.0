Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD12CA1
	for <regressions@lists.linux.dev>; Fri, 28 Jan 2022 15:22:05 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id m6so19405012ybc.9
        for <regressions@lists.linux.dev>; Fri, 28 Jan 2022 07:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=c0bMUQoFH3ZTxFaTaemDlxzYbHvdAzHC2nzZEJKopYc=;
        b=vOtjAj3afwTNgPbxyhcR3Hfa+GiQ6QAsRxL8xr40RJ9lRbkH/grIlYw1SelsmfpJ/b
         vgkR2VWtRWHZZ6a2Y6Bw1Qc7Q8Aj8FvQerJai8zazSoDMWrYkCVlgnh/xESHKdmbV603
         gtV3LTBuUGk5k+n14VWKg+sm/piMtA6rXQTdEYbcZ/cIAwb9EJ/+e/hrGxxvHiCc7dRx
         C9jQsgLwi90iBnAvP81FuVXUTsYKv5cHk1sHLThjG4goI8z77BFIpdxakkSfoFDz8Gv5
         wbkiW2nGzCJ5q/yCHz6/OSuuPS2VF+hCwgsN5PrmhlfCzljhhppEPOQ+WST7M+J2+aAj
         or/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=c0bMUQoFH3ZTxFaTaemDlxzYbHvdAzHC2nzZEJKopYc=;
        b=ZVSC1tigj2bSLXlS7i5xT7c3/CJTYLZ4itj9xy1ILY0zQ+8I6GraBVf5YVxmTJNJvi
         s6wHoDdlE7JiPOmr9LeMP2BlKaCEB4WUcfN3zzcvCA4cG/z3Qy/b3MsAkwC2eWuRep2p
         Dyvp9FXlR8HjuAI6eGnNZ/NWwrWChhA3qtRC37Gk7rWLlgArPYSailaUS6xM4mTKotjL
         L6Ht7lpMmZZbJ1t81QcjUcYgHMiPkE8FsYo8G+gzucqsUneJ2J7t1yVb/ptQLgOIUvrr
         ZX/Vw5pa/tAmFrSMVajdEBI21Wr+mRDYAwCx/pyG7mOQY7j6TlCDySlDMxU/Y9jNin0f
         ASYQ==
X-Gm-Message-State: AOAM5322p4zsd3mlhtN0E3/DmZn+UfInllw5fc8LT/FJA/ekbDE/SXR5
	oxKNz/l6SgkxzxWLMOQRbsnI0q+/BdVpF/TiYWG3jQ==
X-Google-Smtp-Source: ABdhPJyphE2C6kSYX+SJNpMHAuwxAeeAyukV8u13NW0rzBM5OZMDKVkzogZfLgT1QJ8jq3/Djm6d7uzMgiDcMawR6YU=
X-Received: by 2002:a25:5143:: with SMTP id f64mr14250846ybb.520.1643383324177;
 Fri, 28 Jan 2022 07:22:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 28 Jan 2022 20:51:53 +0530
Message-ID: <CA+G9fYvxxc4o5UjRfHVgmcaTN1ijxXX8e=OTP4t7PbRENmVBsQ@mail.gmail.com>
Subject: [next] arch/arm/kernel/setup.c:1028:63: error: 'SECTION_SIZE' undeclared
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, rmk+kernel@armlinux.org.uk, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

Following build errors noticed on Linux next 20220128 arm with tinyconfig.

make --silent --keep-going --jobs=8 \
   ARCH=arm \
   CROSS_COMPILE=arm-linux-gnueabihf- \
   'CC=sccache arm-linux-gnueabihf-gcc' \
   'HOSTCC=sccache gcc'

arch/arm/kernel/setup.c: In function 'reserve_crashkernel':
arch/arm/kernel/setup.c:1028:63: error: 'SECTION_SIZE' undeclared
(first use in this function); did you mean 'SECTIONS_SHIFT'?
 1028 |                 start = memblock_phys_alloc_range(crash_size,
SECTION_SIZE,
      |
^~~~~~~~~~~~
      |
SECTIONS_SHIFT
arch/arm/kernel/setup.c:1028:63: note: each undeclared identifier is
reported only once for each function it appears in
make[3]: *** [scripts/Makefile.build:289: arch/arm/kernel/setup.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git describe: next-20220128
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    git_sha: b605fdc54c2b28c30ef06d9db99282d8a32ae4be
    target_arch: arm
    kconfig: tinyconfig
    toolchain: gcc-11

Build log:
-------------
https://builds.tuxbuild.com/24JPvTrXx7HvkQtxoIXqZtZoZkA/

Steps to reproduce:
--------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig tinyconfig

--
Linaro LKFT
https://lkft.linaro.org
