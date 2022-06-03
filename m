Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4481D
	for <regressions@lists.linux.dev>; Fri,  3 Jun 2022 02:03:20 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ec42eae76bso69173047b3.10
        for <regressions@lists.linux.dev>; Thu, 02 Jun 2022 19:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=A63naTJt6zUwlvsuridWvEjPR850QwDyhCVKh38nSkg=;
        b=BA+nmzQ0FWBRZdwycD89lmG45gs/rZHmmHf4aXaNUBF4rJpKNO6fZv1aKWNIqY7nZF
         woEVBUvPkFGR9N6ZkFJBmMUjvWwIY0hg8x7WUEzTTGWIsqnJ8F2ZnpTuPGQHqhagUX5S
         zsbVo78PCaODionwH7zAabX8oO06A6vqeRZ9CxV78TTuDpJxkGJ+Nqz+Jg9tH/GJEbT8
         iHSSS0ytgervWGnmaghPu99QRU2hSJ+8zAm6vGpuJXAc7bJACp5pPU3eZ+Nbzfxpn6/N
         zTBzTiz5PRZ399D8AePUXfiR9I092HroZPKrXaU6jMI5UCqqBWaEqRD/u15iKhNeufBP
         WQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=A63naTJt6zUwlvsuridWvEjPR850QwDyhCVKh38nSkg=;
        b=FrYESGps7txQYgQjChgbkqfo0n4JYcwh7vk1I2uxcWD0A4+vj+l6XIhCMklT/3cWde
         QDvs6PZ9kx7WV6+TKCSB0MfNs6RU+4z2rEFuFJEarw/bWkWl6ciuz2Uvu5YhiP3OV0GD
         mfHp0IFqP34b+aiJ7a+mVkat2VZycJ8R5LAeTOBrf5vvI5SS0Ly5jTPf5dG3yuFRPai7
         Yg9Z4I/WjLIUUy1s+c8au7wXkXkpuPv9WQ249x7/0GN0m2UQGgtGRdtNgm/PW0/5cgw2
         JFpgyKt+3p/FsRo9d5PyctbUHsex6TwE26QkvsTszWvCQRQmi0GVSc/I5HOmUzONMIfx
         FOtw==
X-Gm-Message-State: AOAM530oJMvOL0DCT5EQkP4h7kybkfrExPCqBGxxyFUkhe11cGjIe65t
	u2VLvrHcocw83wwvhV9jvQBQ13pyDfAj+auv+kys7g==
X-Google-Smtp-Source: ABdhPJzJwy/AoL8jAbntm39SvG2wCGLTOiet46mi3kxXZTznFyNhscdIk9C8MGeZg1TG+JxhbHlKdw0wtXgD1cQgbI4=
X-Received: by 2002:a0d:d4d5:0:b0:30c:8231:b950 with SMTP id
 w204-20020a0dd4d5000000b0030c8231b950mr9252585ywd.189.1654221799635; Thu, 02
 Jun 2022 19:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 3 Jun 2022 07:33:08 +0530
Message-ID: <CA+G9fYts-KH-R5EkBpz2u6H_Cx6YTXus1JKJS6yBxGhb0O2qQQ@mail.gmail.com>
Subject: gcc-12: build errors: arch/arm64/kernel/setup.c:225:56: warning:
 array subscript -1 is outside array bounds of 'char[]' [-Warray-bounds]
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, John Donnelly <john.p.donnelly@oracle.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"

While building Linux kernel with gcc-12 for arm64 the following warnings/errors
noticed. These are specific to gcc-12 builds.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/2/build
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from arch/arm64/include/asm/thread_info.h:17,
                 from include/linux/thread_info.h:60,
                 from arch/arm64/include/asm/preempt.h:6,
                 from include/linux/preempt.h:78,
                 from include/linux/smp.h:110,
                 from include/linux/lockdep.h:14,
                 from include/linux/mutex.h:17,
                 from include/linux/kernfs.h:11,
                 from include/linux/sysfs.h:16,
                 from include/linux/kobject.h:20,
                 from include/linux/of.h:17,
                 from include/linux/irqdomain.h:35,
                 from include/linux/acpi.h:13,
                 from arch/arm64/kernel/setup.c:9:
In function 'request_standard_resources',
    inlined from 'setup_arch' at arch/arm64/kernel/setup.c:350:2:
arch/arm64/kernel/setup.c:225:56: warning: array subscript -1 is
outside array bounds of 'char[]' [-Warray-bounds]
  225 |         kernel_code.end     = __pa_symbol(__init_begin - 1);

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch arm64 --toolchain gcc-12
--kconfig tinyconfig CROSS_COMPILE_COMPAT=arm-linux-gnueabihf-

Build link:
https://builds.tuxbuild.com/2A2iyFqotDfgkLynaKzmpf8H7Nf/

--
Linaro LKFT
https://lkft.linaro.org
