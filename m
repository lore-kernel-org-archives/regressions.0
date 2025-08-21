Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EFC3093B6
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773828; cv=none; b=NSrER0Mb7NAcUhijeea3/qIQwRW6EzIMqWunCBTFcTuneM4uSAXvzxGz6GDy7wUa61ALs0lSVS58G+KOSNGkcFE9RB6R/ioVMA9I6b4AFaEzI74FqjvZrRLv4eyrZ9sO+JiS1OzQ+VwtzcTlph+UaWCK6Qdy+6rs55J304YU7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773828; c=relaxed/simple;
	bh=GKkrz4iTgMP3imRBkVGMq2ugMtvxmgGCSinBgcoSxj0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qcrp9BhecDhwzupqQFvW7Lgu+2SpIjpho0k+EfIEIdfAObikDEp/4rIedTL8nTUydI/DurnDOCPrP0oAp7G/FSwNPCvycFHmq8z/VeiMTZIkBeTY9Suol9G3NzMOT0awPxXhlj2drQr1Xe8QH8nHB+ZYg0tCt9yBHDNTD5ouWRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdBcOIOe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdBcOIOe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-244580591b0so6675005ad.1
        for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755773826; x=1756378626; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BXsydsgT+UVZBwSeBHcvaKFCB1p8eK/mNY2QWJNzsz4=;
        b=HdBcOIOea+BtGz/+F6Pk0dPL3YQBc/W9nN6UA+f3Dk+GYof/Qhz33LhC93yP53fV5l
         pfgYYUFi9FRgeS/b2+VkKhOdHQGEiGBcgOv6RudgX72V6oFVAMoJbMe+QIWHgaPF0njZ
         k2nWvxN1PSiAXkOe6uKYgH38dEmEIhQAPwqAMSMn5+eGXR7Y0q8DYZkVj1tbL7+r8UX8
         5jMZyFLvZwe/5J8TFcMuj0vidCXgX50pJRVelNd9zP9XoUfsNwQnO9mruNe/JeJcuT2g
         R2WV9yV7YYikNnsVWpr82Tnk/wVqUBl6th2dwj9At0xV18PKe6FJ5oIUbtIs+yT/1OHh
         8dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773826; x=1756378626;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXsydsgT+UVZBwSeBHcvaKFCB1p8eK/mNY2QWJNzsz4=;
        b=l3rsiNR9f3pPKHjKkeFhHzNEPQ/e3CWczaRkB+OFO+IIpFRkIan1ALUJHhOcgmKUzP
         KcaOXAIe18jfl8gVMCQ53h287t8OIJGpxhPfX8zGAhKsZB1QyHdYuFKcxGuKNUtZgIyZ
         ewFhpsQazz9Wk1caPm47XDzmawZ7MVNQ/pW8Ck4fuDKcrDM6FW+3crvzdald3MIdmDTB
         /1JcMNncaFHdRCGG4XspthG9wmxYgkHrpzBdT2OzPb7Bq46xO1YY+ZmIgND2RAqWSGqQ
         yeTlZEBOAljYfW04KM2Ma2xaZIbe4QoOMENYyzIZ7U3GaZWpHMfebNUY5PHelrFrHslv
         sn/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrq48DYccGaAiOCkJ/vHF0nJieXDw/Vitm5qeZXipGaIngidNau8dTdc0RhgIhgrJ5cU0LGWQ/+DSIrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu189YiSNkKwyuPTswBc4DJQflCKu8t8cxCstY0c9AcKkqFILl
	rb70uI6wDRM3LuDwUsxdgBbvCWU77LH2bM0TGJnFSgZFchzFmNJ8v05C60fwpJ2D61GChuYIsOb
	qE+fnoGcxCt6qGCLNbq0RZeOMSJ7oUiMJFIyzYR/MWA==
X-Gm-Gg: ASbGncvSW2x4U8/tDo9hatYTHEpS9EInB8scT6bWdlJFh4jNIp2jmGj22MltiRqz4kx
	pNV7P00oQ/1eCy0AWnm6BWJ80JgwQg6pb1ACfW7W5ZifmhiTMLJLY6WkLYkGZ+qJXM3jDl5o/Am
	Sa+n6GUyHPeT78ZG+B10z5r38sRM4cJwO9YtG9Qy75zGvAdoaqXB4/5dZ6Ix68cnsGezKv3C+RI
	ypdZQU5UHSy52b89OlPtZ+6wgFJRsmkzROsDg==
X-Google-Smtp-Source: AGHT+IFA9JWo/za7RvCQ3N8qUZg3xh+FzJDUXahmuU7qDSv65XS/0qQKuLW50NG6gdpjZGNKx/9zfTkOGpG5BzWpnok=
X-Received: by 2002:a17:903:b50:b0:240:6fd0:25b7 with SMTP id
 d9443c01a7336-245fede05e2mr27786565ad.38.1755773826455; Thu, 21 Aug 2025
 03:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Aug 2025 16:26:55 +0530
X-Gm-Features: Ac12FXwxxHIFgYcRpbKhe10fmgTcb2IwuVwDMdkZzGeMc7x8TUDiIvJE5OkVtOk
Message-ID: <CA+G9fYthMAr3w=U_GmbLPgMb7xNdjbqmxYWF0iUEuJzxnw3dxg@mail.gmail.com>
Subject: next-20250821 cacheflush.h:61:3: error: incompatible pointer types
 passing 'memdesc_flags_t *' to parameter of type 'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]
To: open list <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed with mips defconfig with
clang-20 and gcc-12 toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250821 cacheflush.h:61:3: error: incompatible
pointer types passing 'memdesc_flags_t *' to parameter of type
'volatile unsigned long *' [-Werror,-Wincompatible-pointer-types]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

* mips, build
  - clang-nightly-allnoconfig
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig-hardening
  - clang-nightly-lkftconfig-lto-full
  - clang-nightly-lkftconfig-lto-thing
  - clang-nightly-tinyconfig
  - gcc-12-allnoconfig
  - gcc-12-ath79_defconfig
  - gcc-12-bcm47xx_defconfig
  - gcc-12-bcm63xx_defconfig
  - gcc-12-cavium_octeon_defconfig
  - gcc-12-defconfig
  - gcc-12-malta_defconfig
  - gcc-12-rt305x_defconfig
  - gcc-12-tinyconfig
  - gcc-13-lkftconfig-hardening
  - gcc-8-allnoconfig
  - gcc-8-ath79_defconfig
  - gcc-8-bcm47xx_defconfig
  - gcc-8-bcm63xx_defconfig
  - gcc-8-cavium_octeon_defconfig
  - gcc-8-defconfig
  - gcc-8-lkftconfig-hardening
  - gcc-8-malta_defconfig
  - gcc-8-rt305x_defconfig
  - gcc-8-tinyconfig


## Build error mips
In file included from include/linux/cacheflush.h:5:
arch/mips/include/asm/cacheflush.h:61:3: error: incompatible pointer
types passing 'memdesc_flags_t *' to parameter of type 'volatile
unsigned long *' [-Werror,-Wincompatible-pointer-types]
   61 |                 folio_set_dcache_dirty(folio);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
'folio_set_dcache_dirty'
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
arch/mips/include/asm/bitops.h:89:70: note: passing argument to
parameter 'addr' here
   89 | static inline void set_bit(unsigned long nr, volatile unsigned
long *addr)
      |                                                                      ^

In file included from include/linux/cacheflush.h:5:
arch/mips/include/asm/cacheflush.h:70:3: error: incompatible pointer
types passing 'memdesc_flags_t *' to parameter of type 'volatile
unsigned long *' [-Werror,-Wincompatible-pointer-types]
   70 |                 folio_set_dcache_dirty(page_folio(page));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/include/asm/cacheflush.h:42:27: note: expanded from macro
'folio_set_dcache_dirty'
   42 |         set_bit(PG_dcache_dirty, &(folio)->flags)
      |                                  ^~~~~~~~~~~~~~~
arch/mips/include/asm/bitops.h:89:70: note: passing argument to
parameter 'addr' here
   89 | static inline void set_bit(unsigned long nr, volatile unsigned
long *addr)
      |                                                                      ^
2 errors generated.

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250821
* Git commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
* Architectures: mips
* Toolchains: clang-20 gcc-12
* Kconfigs: defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29616797/log_file/
* Build details mips:
https://regressions.linaro.org/lkft/linux-next-master/next-20250821/build/clang-nightly-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRYnoYJbpEW0zZyTGvO2w7OCn/config

--
Linaro LKFT
https://lkft.linaro.org
