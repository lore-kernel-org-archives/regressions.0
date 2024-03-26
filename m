Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FA74BE2
	for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711435177; cv=none; b=VusPk4Msi+vHKfWy/vQPtho0fSTELMTcC5DVEaUbNMDdNp3KJC0pulPrEorr0qLzuONmxNx5qhFQDLIw326b/+FpxaJBHqmr9l8ugIzeBvKupMbvfyT7v9zHDrrcrsk7lDGEPVJRePiDDeNNZczfsk3jqlvRi2u5NDR8TkHtcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711435177; c=relaxed/simple;
	bh=8hkG47Q40QgzkBdUkNgiugWCufZOCQ5wxIkjT5JKDc0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oe3t/daJw8jrQj6lJPNU1MPHwZiYrn8YLdU5CzxulP/PLS2HdTnP8g6ekJbTTAvaNZSwugiPmkqELLEF8KLtDS2aXZZQGLGdXJpElDUZ6mWIe3vsB8ZZANLkyIYxIQTYyK7qxUvIARpqAZszOLYxkJ+VHi+PNYVS/L5Bjh+NGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zYLQLmvq; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zYLQLmvq"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7e06168551eso1467157241.2
        for <regressions@lists.linux.dev>; Mon, 25 Mar 2024 23:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711435175; x=1712039975; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=drVZ42Pjz6m24bstfIZiE8BogPtQcG+Q1nzebdlWw4A=;
        b=zYLQLmvqqsOHGxOj45F0EK0iiowws1LoBSnv6pU0xaK2lVjDvYLzkwUujYEdfOzYhc
         1j1d4/ObiYIMwdRn6YiItvSVdUApJMCUyUWMLofbg2k52oiaSBfjjrO35ru+1scmhYoq
         b7gtQecpK0PfocrGE7aH3F6JfZ5YXjsUhhoaWefEFdsCbQIT0pnzgRevs/aRNnZQkISL
         Oea3cF661cOP8Zf6O8tM7pz5sdoi5McNU8ggk51EFxovyPWEosfDMy2N8g8v76IrcnCz
         Sb18PR8aks3eF6vROzlOr7/8mUfBj2nkz1pEO+gkHt7ErQz7xKiLbg9So9GM3xWDLuWN
         xM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711435175; x=1712039975;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drVZ42Pjz6m24bstfIZiE8BogPtQcG+Q1nzebdlWw4A=;
        b=W7j1Q/mvNWkTZnWJzYy9s0f6xdM0zj3NP9r8H6/p3hyXZOvlgioWg9v1aHa7lJ67Yq
         Sb+BS6h3LdYfdTP8Jj4hPGWHKvY01WWO8eMShEk4oz0WxDzmV1Bgcx+GQIx54JPdLqVV
         IrzanN3VKNq4wO9W0TXNzBszjhl/8s2h4phDSDCh8dp1KupClMnEq3D2cmvdpirc0Txx
         kDPih755ui1usJQzgo18HEwpQ4t4HRw3cmW7yOwSAh2N0nIJbjDZwSbBcc+cmF18OHlF
         Bei+dYbmq7k0wQKnaFV/MyFB/M79v4vosTu+hoeckOrhfkpl7DTpgxENpGI6Rv1qKHEn
         qHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW20AB0P2fwXI+rbelq+Q0lDW1F4qqjFJNZjGEMrpEVPlVfTRZlLboZ16yjAs87PP++xKeigKAhKXC66CQDTYmSSznuvA3OKXelw8s=
X-Gm-Message-State: AOJu0YwhhWzEG0CuOYwgwJ2S68Jpx7ye3AQGu5cfNMGNmmF6HK7TBZz2
	MjjNvEAMrR00KSDeIMdUQ6W96YuzTYhB84VUMyugnYDGNwJY+1zRqRyGVW25n8CEMxtffXZhedy
	jW8hXM2NCPObiUz3CXXwRxvV0+u3/ibEvMIg5Cw==
X-Google-Smtp-Source: AGHT+IHEXqKXr2zeKfb/dcXtTpJUneKb2/8gxWMltBIlJ3SC8orv+0q/CSPQOhwnG8MsvVlHWmkE85wSNg0nDxpryiY=
X-Received: by 2002:a1f:f843:0:b0:4d8:7a5e:392f with SMTP id
 w64-20020a1ff843000000b004d87a5e392fmr6046584vkh.12.1711435174828; Mon, 25
 Mar 2024 23:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Mar 2024 12:09:23 +0530
Message-ID: <CA+G9fYu49=6_L6r8hdagZHUSGk+JfjioFaqh+kRaxhce84Q5Kw@mail.gmail.com>
Subject: next: arc: defconfig - gcc-9 - mmu-arcv2.h:82:2: error: implicit
 declaration of function 'write_aux_reg' [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-mm <linux-mm@kvack.org>, 
	linux-snps-arc@lists.infradead.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, vgupta@kernel.org
Content-Type: text/plain; charset="UTF-8"

The following arc defconfig build warnings / errors noticed on today's
Linux next-20240326 tag.

Regressions:
    * arc - defconfig - gcc-9 build failed.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
arch/arc/kernel/ptrace.c:342:16: warning: no previous prototype for
'syscall_trace_enter' [-Wmissing-prototypes]
  342 | asmlinkage int syscall_trace_enter(struct pt_regs *regs)
      |                ^~~~~~~~~~~~~~~~~~~
arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for
'arc_kprobe_handler' [-Wmissing-prototypes]
  193 | int __kprobes arc_kprobe_handler(unsigned long addr, struct
pt_regs *regs)
      |               ^~~~~~~~~~~~~~~~~~
In file included from arch/arc/include/asm/mmu.h:21,
                 from arch/arc/include/asm/pgtable.h:14,
                 from include/linux/pgtable.h:6,
                 from include/asm-generic/io.h:1047,
                 from arch/arc/include/asm/io.h:232,
                 from include/linux/io.h:13,
                 from kernel/dma/coherent.c:6:
arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
arch/arc/include/asm/mmu-arcv2.h:82:2: error: implicit declaration of
function 'write_aux_reg' [-Werror=implicit-function-declaration]
   82 |  write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
      |  ^~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
-------
# tuxmake --runtime podman --target-arch arc --toolchain gcc-9
--kconfig defconfig


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240325/testrun/23149630/suite/build/test/gcc-9-defconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eA2VSZdDsL0DMBBhjoauN9IVoK/

--
Linaro LKFT
https://lkft.linaro.org
