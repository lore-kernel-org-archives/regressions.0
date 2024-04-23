Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C821A0B
	for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713860624; cv=none; b=Hdh5w7Jf5RxtIwSJzwn9LkQurWj6+w+qau9RiqMRAbucIEilv+5WNTCxpQS6vd3uVLERJ4Prn96mTXi8F3iBwkZh4oeftKJATVtDzf+p9dX4UpJlSzQ78X8zJvOy8gRj4qJEwsFWSfmecaMU1IZpTsF6cVz5jK02DGyhfDxVY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713860624; c=relaxed/simple;
	bh=Rww7TxuzQROoyZ+YFLTo/PMMJ6PyQ1PTF3vLyCFRV18=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XmnZ7zKdlQt4a3OzUUO+8gFG9pdHikTOaQSdJLR4azNGRW+Yi9mE1spr7mOF486iJaKWU6Bi8R7t1dkATC4F+MbDycgfEmQlf2yAvb32Wnu7fdsaLFfHSjOALhcaXiQOQZO365CEjbq5m95jKdWIqPLBr3hExyysNOt4nhKqVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=deE8gM0J; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deE8gM0J"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-47b6ac9745eso1487661137.3
        for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713860622; x=1714465422; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hvJAvOkdB3nYgeq28VFan9zcQ7TGjXgnfVwBWPnAFoU=;
        b=deE8gM0JKiEWkv6cUVZucpkbAg/WUpwVyOYkU/NaUoiPBIqEKPnfWrTifqHRaVFNnY
         7GKl3rzsvcnRJqWQK/sLs+vLzjsGue9SXiGifjiaG9enSze8tUv7liOFjtyglsZY9PnK
         BAzgq/+HRUXPTHARuah6KYBaTXbA84HglEB6Gk4E5tUugOqQ0/1XHR89CSmamBf32u95
         aSfj5AjZ1HbFB6koXXKJeO4fKqCbVlKRYenAzCV1c9ahzS2qcuoJaPWrThXThPto7ZME
         dfMDWgDrIm+Qeus9Z3ZwGXXxD+o+xkSYREoC9jxd6g8EO3t33OUxvQ1nDOSI/nDiJLGi
         UtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713860622; x=1714465422;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvJAvOkdB3nYgeq28VFan9zcQ7TGjXgnfVwBWPnAFoU=;
        b=nCbUvsLnH8N7xtmnAtXQ4D04npLEOJGzw/ZGBEW2lteGkWLw1HR4KiGL+QhT16rWlF
         cueW5QQILJgdHwtw2TixCgElCuru/JOmsYV26Aq5UdX4nam46Mocfz2pcLovMNgFxl9S
         W7DWIFh0GudUEygigYaDkulsMpctgwVfAUtvM7CojhA/n4kLUglbyIZ4T2tCi6WMJ5If
         kxfhp7d5fA72PVTDnAzAwF9Zw85VVLuTljnjXu0Mn/Z+rSR5ZjskUcpfZSal+fYg7cG6
         QGYgXZtAPIpkepQ2JI6xoRA8T4HNoCUw9DOB/WFo7EjalmJJeE128aCIyvI29R10XS9k
         FZ8g==
X-Forwarded-Encrypted: i=1; AJvYcCV1if2ayw3ilB2H+O9zfCKYM4+zkMhMXbUNYt/2pSa4pEerGns2/k7Yc6FKb0cQNGbtboOkiZZifiXMuSeLQ6cEE6gde7gN9FsXfqo=
X-Gm-Message-State: AOJu0YwBPPTJGqe3ZtmXQCrgNapx/X1ysX+5IjhC6i3tb9OQyPjb/1PK
	aY4ufIV1pr1y/ErtuTLcs8HN74Hg7BtzS2rqSZuPGtTvrJfdf2M3baYx+gAHGsal5P4OwcBKzjo
	UIyYKh5IH6hqcB4K7Gcowxhd2jmqQhMMWP1kqvw==
X-Google-Smtp-Source: AGHT+IETsHlsYMSQzlW7E1YI7QU+5izexDZQYyZejyzwsbgVBBsE69lGVvchijeB+ICSBsYB3Y17A9M/NOChyEX3VXA=
X-Received: by 2002:a67:eed3:0:b0:47b:ebf3:7c6d with SMTP id
 o19-20020a67eed3000000b0047bebf37c6dmr8185544vsp.27.1713860622320; Tue, 23
 Apr 2024 01:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Apr 2024 13:53:30 +0530
Message-ID: <CA+G9fYuu0SApq057AMQmOiUC1upt_akKYfhu4BR+2BDkMoqs=w@mail.gmail.com>
Subject: mm/slub.c:3330:28: error: implicit declaration of function
 'node_nr_objs'; did you mean 'node_nr_slabs'?
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm and mips builds failed due to following warnings / errors with
gcc-13 / gcc-12 and clang-17 on the Linux next-20240423 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

arm:
 - imx_v6_v7_defconfig
 - orion5x_defconfig

mips:
 - defconfig
 - ath79_defconfig
 - bcm63xx_defconfig

In file included from include/linux/export.h:5,
                 from include/linux/linkage.h:7,
                 from arch/arm/include/asm/bug.h:5,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/mm.h:6,
                 from mm/slub.c:13:
mm/slub.c: In function 'count_partial_free_approx':
mm/slub.c:3330:28: error: implicit declaration of function
'node_nr_objs'; did you mean 'node_nr_slabs'?
[-Werror=implicit-function-declaration]
 3330 |                 x = min(x, node_nr_objs(n));
      |                            ^~~~~~~~~~~~
include/linux/compiler.h:286:55: note: in definition of macro '__is_constexpr'
  286 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) *
0l)) : (int *)8)))
      |                                                       ^
include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
   85 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
mm/slub.c:3330:21: note: in expansion of macro 'min'
 3330 |                 x = min(x, node_nr_objs(n));
      |                     ^~~
In file included from include/linux/init.h:5,
                 from include/linux/printk.h:6,
                 from include/asm-generic/bug.h:22,
                 from arch/arm/include/asm/bug.h:60:
include/linux/build_bug.h:78:41: error: static assertion failed:
"min(x, node_nr_objs(n)) signedness error, fix types or consider
umin() before min_t()"
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                         ^~~~~~~~~~~~~~
include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
   77 | #define static_assert(expr, ...) __static_assert(expr,
##__VA_ARGS__, #expr)
      |                                  ^~~~~~~~~~~~~~~
include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
   51 |         static_assert(__types_ok(x, y),                 \
      |         ^~~~~~~~~~~~~
include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
   58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x),
__UNIQUE_ID(__y)))
      |                 ^~~~~~~~~~
include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
   85 | #define min(x, y)       __careful_cmp(min, x, y)
      |                         ^~~~~~~~~~~~~
mm/slub.c:3330:21: note: in expansion of macro 'min'
 3330 |                 x = min(x, node_nr_objs(n));
      |                     ^~~
mm/slub.c: At top level:
mm/slub.c:3301:22: warning: 'count_partial_free_approx' defined but
not used [-Wunused-function]
 3301 | static unsigned long count_partial_free_approx(struct
kmem_cache_node *n)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
---
# tuxmake --runtime podman --target-arch arm --toolchain gcc-13
--kconfig orion5x_defconfig


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fUaQMPe7cZ5qJJOt50avspw7bH/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240423/testrun/23561861/suite/build/test/gcc-13-orion5x_defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
