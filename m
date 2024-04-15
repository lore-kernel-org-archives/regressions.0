Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642D40875
	for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713178035; cv=none; b=nfPm76RTV4dnlwbaxhhEg5FCa8IBgs2aMLkgLeHsSbnLG9+ny7yR2YLSBIKPSqWn8swO2HUkYA32M9DaMMgqsMX2a+DRj8apasqKTWzxvLrKuWonWYBW3bCvUF6flRn2/OA8NMQFf1vP8P+QK7PFE6uBZBGH9KNISyFxiSeE9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713178035; c=relaxed/simple;
	bh=W2Fbao+/FlwxfuGH1OFvZW2kvHWXUxBXy9sroyi2Gh0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Xui0O0wHb4NcFBnBXc75ikFYpAs9P4Yam3LfJHCnyYI0LIZlRhPZgcoUzovm8distMAJI+3X4zlaLWBz7R1eR0OpFfwLOF2imPfpkna2Ce/Sv466A7OsA7GQvP/DEfG4OyF5qkAdm8v4UP0foJZmeySSv6w2OUR/0FitjUANgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LjxEaZ8d; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjxEaZ8d"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7e0425e5aa8so1069739241.3
        for <regressions@lists.linux.dev>; Mon, 15 Apr 2024 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713178033; x=1713782833; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5kbitX8QbhgxnsV5uCd0z4f/iShjUxkr6d7+ekg5tWU=;
        b=LjxEaZ8dJsCX4VYwhSlQcANNgzhm/G/wC5/KJ2vhCdsZY6/mp0oU2CxrQXowZiWUzV
         9fdWbNOEz+MONj1eNmS9R/2ceviOSz6AL42tXS6z42dylPmhDPciSlBnyoztcdx+96Z1
         zDs9KcXPWbOhuHZjXm0nzcaqKMy4qlz6qxllsQnDcG6AVUCDcp+L9hWn5cWjrDFZiZVd
         0jHsFvQp78tMDx4fiNmhZNwG8lf4/nFAk7zVDIsGBMEu/Hq63+AYPuJMlU0wWms6hV3Q
         JLtYyc/O3fArcTeV9y2Zy4ur7Togx9fgEbBa+7MvI733w4XnwulcjiiBUE/sHjnbI2u7
         UHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713178033; x=1713782833;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kbitX8QbhgxnsV5uCd0z4f/iShjUxkr6d7+ekg5tWU=;
        b=g7sroqVPn1Rbt8ERaAuVCgHCfib+6mphDcnarw6fSsT3o0lF+FlGDpPOnq63vFP7cx
         S/GCZ/ImTehrWpZKKb398G9EZcdbcXwrl3Wc7eEQW9rTrj5qZNGkODSXYRflOdDrupHP
         SmNE08jml2kQGw2w3fx7+CTP+lTYSCvbS0cufk7cSIQ+X1BY4+xntCn+n6Vo59vax0YD
         IpF4gLxPTPGyO4GdOdXhaDiBWnTX1Cxp1z7vdOHFbh+HDkNm9M5jmzg4cUqa8dWRUR+q
         kAKihMupN5/WQ9gHwypP05HKNwmzT358oq4bj703KxsMPPVzXwHIZccCBdyLmRW+jX/K
         eC7A==
X-Forwarded-Encrypted: i=1; AJvYcCXVUeJrYyqPqeMRQVkPSFaetUesSJA8ZDJ5VNQMq/xEqX7xRFhzkzR6ZBckLroJnE1M7voiZbvuv22J55c/1DeBQTJZ4S1nCVlTF8o=
X-Gm-Message-State: AOJu0Yw/YA8+lx6Z2qFT2h3McX/oLQP629wvu66xok1ylIBhZhhgnrKX
	znSrIuUO6dda9ltRCISKCkD0KTaJ3Cf3ZND/V9y5ZfV8AqhFasUw5bHvDEpwM87csTDHMxhvpeh
	2pwZtVfbZXX1n8fnQ1sXP7SuLc9zYGkwyNm63xA==
X-Google-Smtp-Source: AGHT+IE4veDIOcK0vTkuxFAc8PebEblKLgDeLZg7etQEi0PYMGKyP1c0eS0dCvLk7/PMRnxeklqAIbshIYBCJ0ceNwA=
X-Received: by 2002:a05:6102:3590:b0:47b:8ef7:bc1e with SMTP id
 h16-20020a056102359000b0047b8ef7bc1emr175678vsu.15.1713178032756; Mon, 15 Apr
 2024 03:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 15 Apr 2024 16:17:01 +0530
Message-ID: <CA+G9fYvMdqT3BFNkspktVVtVqd=en8-x3Oz1Ekfia+cceV2LHQ@mail.gmail.com>
Subject: sh: arc: cmpxchg.h:50:12: error: implicit declaration of function
 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	Vineet Gupta <vgupta@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"

The arc and sh defconfig builds failed due to following build warnings / errors
on the Linux next-20240415 with gcc-9 and gcc-11.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Following builds failed.
sh:
arc:
 - defconfig
 - tinyconfig
 - allnoconfig
 - vdk_hs38_smp_defconfig

Build log:
--------
In file included from arch/arc/include/asm/atomic.h:13,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/bitops/lock.h:5,
                 from arch/arc/include/asm/bitops.h:188,
                 from include/linux/bitops.h:70,
                 from include/linux/log2.h:12,
                 from kernel/bounds.c:13:
include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
arch/arc/include/asm/cmpxchg.h:50:12: error: implicit declaration of
function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
   50 |   _prev_ = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_); \
      |            ^~~~~~~~~~~~~~

Steps to reproduce:
---
# tuxmake --runtime podman --target-arch arc --toolchain gcc-9
--kconfig defconfig
# tuxmake --runtime podman --target-arch sh --toolchain gcc-11
--kconfig defconfig


Links:
---
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240415/testrun/23463978/suite/build/test/gcc-9-defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2f7sIl2MlKB5Fgq7JtTpYQ9lnXw/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240415/testrun/23463981/suite/build/test/gcc-11-defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
