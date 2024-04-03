Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364B5CDE1
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712130817; cv=none; b=aIS42wWs3PzZ8vE43faU+2VCHvHmGTMbo5H0vM1Rg0Veb1LEAbXUTvBznakhV6paRRKwymDPZNB/vbS4I773IzZAmTSsYQAoezGpGBz9DUN4hg9FC8ejcxTXGRlM0HI22k3aajUmvHM8NUO8dF9EvwBsY5EF9zCOdBzHaMmukCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712130817; c=relaxed/simple;
	bh=lu4lr9wamx7dI/HCTq6kawIsHy+GqxMxRmNu/rjakdA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BoAQNbHb94wtF3VjW77vXc1sstNfOptU7g/LRSxhbvmF1NBKKNFj2MZa6bRppnw28hX6r7vJs1Rx+fi0sPEDH4AibDiM3K0BiTotB3rXkIMBJ4lCcu3vuKjVTl2suLksOvKuv3OizQf9cq6LXhEs73TPy4ETjsdEC9l9JOwJpqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zPwmlCXb; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zPwmlCXb"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-476cec93716so1793764137.2
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130814; x=1712735614; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7p53XmkkGTALNH4Ix0xvzQLOZKvgVhwnYYuHGcSQF4=;
        b=zPwmlCXbq7tiVjW79e6B7HVrI4zoEmHDHvJy/rr+rxNO/KmzxO4KyGC3s1bqb4roia
         hTDtkEcbZgsGdlQibLm8bhRhBFRHpshkT4LR3sc+x8p94f8+CG0H8LUEOGIv75x5IVZK
         1DNR3oBGGzBSpEcENZRTjsrQL9jWyXZBfOWsMjCW5oXvryQ8Asx+2gd/rDe8ZT+uHYwt
         tTlcZSje0UFulnSFW3pyFhuLCZAaxcsPpkdb6ubJJXcRDLuZX7lXtkFLe0YHjXuokB3H
         Fc8UD+7dpTKhXpGBQ7SULxp64LC/G8P4HCA0mCwTIaI9bPT7UpvnFMJyHP0OBOd8gSf4
         R8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130814; x=1712735614;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7p53XmkkGTALNH4Ix0xvzQLOZKvgVhwnYYuHGcSQF4=;
        b=GvnoaF/OOfDeE5Fge1bmc8wR8MAylgpsOZ4DtjapbrlFjaUQ8JYazuRUpjO65dcKzO
         VZiNVWpnKFtvhVvFjtK0pGyG3Fp16Hd+38PF7xpVRQUfMbANS7UkhPwMxEQEKGC8O9VO
         l63Pb8fs2cFntYlXX7HLlr3Zo2Dm4do3EVC4ggYK+KvnbAyHRoLyA75nMvga+vAY+BgD
         DaWdLok/QOON/nBmoQafsGsKU6jvvOaGwi/SnCiOmKxXE3+BkSInkVxlxrk6DxY0RKR7
         wmgbgjR5PUmCupx7PMcNg9jkhmknmFT2186ff3mLDAQn5KWiy/RrmrRNIZgTNizBK0xB
         OkrA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfjD6ZD442TnXabZ79TNbMacIhZW0+4swnWnL2/b9WXtFGQxQhmuzbuW543YE/673IDK0vA4gondAB235IUk15J+lkyudKABiE6w=
X-Gm-Message-State: AOJu0Yys4Oy9lKU4+MLSaJSG6RuOeKpYf/aXcA5mxI6XB1+IqFYXCrlC
	dH2gQZWJswPBwwhaKCmKbYUDpFeGlwxa7sX71y8/i+QG0sOh2ChHC+B1MPwdTchdI/fgH/ex+UY
	XTZ0vVgUxyUCOymhr3hwGaBvRT+lHSajuNgy204mf/LQtW7rXOA4=
X-Google-Smtp-Source: AGHT+IG60A9cZw5q2ghP0j48oSICnM4EvMleBb57CwMtDkNbKO547PHL78ohs2lagIPlHsnadarK5o/Vf4QbZb3wFa0=
X-Received: by 2002:a05:6102:4bc6:b0:478:8714:e1e with SMTP id
 id6-20020a0561024bc600b0047887140e1emr8289869vsb.4.1712130814422; Wed, 03 Apr
 2024 00:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Apr 2024 13:23:23 +0530
Message-ID: <CA+G9fYvUwyf-5yB=xZVAPXrF3C9z==7bbhDYBnX9jdJ1PxzPnQ@mail.gmail.com>
Subject: sh4: parisc: asm/cmpxchg.h:60:24: error: implicit declaration of
 function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@surriel.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The parisc and sh defconfig builds failed due to following build warnings
and errors on Linux next-20240402.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

parisc:
  build:
    * gcc-11-tinyconfig - Failed
    * gcc-11-allnoconfig - Failed
    * gcc-11-defconfig - Failed

sh:
  build:
    * gcc-11-defconfig - Failed
    * gcc-11-dreamcast_defconfig - Failed
    * gcc-11-tinyconfig - Failed
    * gcc-11-shx3_defconfig - Failed
    * gcc-11-allnoconfig - Failed

In file included from arch/sh/include/asm/atomic.h:19,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/bitops/lock.h:5,
                 from arch/sh/include/asm/bitops.h:63,
                 from include/linux/bitops.h:70,
                 from include/linux/log2.h:12,
                 from kernel/bounds.c:13:
arch/sh/include/asm/cmpxchg.h: In function '__cmpxchg':
arch/sh/include/asm/cmpxchg.h:60:24: error: implicit declaration of
function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
   60 |                 return cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
      |                        ^~~~~~~~~~~~~~
arch/sh/include/asm/cmpxchg.h:62:24: error: implicit declaration of
function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
   62 |                 return cmpxchg_emu_u16((volatile u16 *)ptr, old, new);
      |                        ^~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
------
# tuxmake --runtime podman --target-arch sh --toolchain gcc-11
--kconfig defconfig

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264271/suite/build/test/gcc-11-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264273/suite/build/test/gcc-11-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
