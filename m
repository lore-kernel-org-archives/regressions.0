Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A7D2FB
	for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229496; cv=none; b=EpucPByJG90fttKkrwnu86BxOoENRDSAeYI3BwkZwQEgdpFqClgjtqkpQV23BwjeOGWIccsxwL6jTFJqlsDnfG2Lr89lMCyC9cB5FPRDDudkQZbasn8BB8DqgSAzNteNOvuYkOA0RtRtiuW29byFfmvyymt1BRHYAD6NiHYS+94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229496; c=relaxed/simple;
	bh=FABrqX+Hjw484256YaPHen56rdftKHMIcVK00b4E1jA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sUEDSovlurlGicUuIDXe9aMOI3psqlXAbRCuIBt+XVMU8AJRHe9c/xKQPkPazQYFf0yVtd03TX3eFM0cxwj1VIDtOLygz1OEdqENVdw0G/fAeOk6ov36dyASrhXmSmaMwcUbB7aBLcv7V1LjBRUE3tWDSxJtq8PkCmJEGMNziyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6y+29Ay; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6y+29Ay"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afe1009960so153941137.0
        for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738229492; x=1738834292; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=;
        b=C6y+29AyXkLoINUP9oERIw5vPENsFuVeHpw85tcI90gjY8EmBTaXVb6na9bvqmu8VX
         GNKmB38ijSSS/YsZHqnc3G+frW4ncGjjnLfnTBaPO+t60stdkb8T4uwvv+mfh81buey3
         N6lJWYj4ADTpNPee/QRuXYs0SntuEW8ViW1hT/P0BlG+PKELKqieAcAB6nbi9BdAT/03
         D1OixDeSO4Lo9Q1pYDr7wpeQx6j30Jw75OW+QG5sGXxkTuf9L5VmxVImhKxKsP4tIIX/
         RPiccWOufxkZwzw6Hw478+6IwEYmJ/L6ActVOQ2T+6gQLM4ybh56zrmzE5BGIGZZ0JO3
         jkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229492; x=1738834292;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=;
        b=ti3TiQsR+Moj6Kdk889it0X8nRj9LFVhLAjDjyUgs4GA0xpURH8ZYGmDSBbMtKi95x
         qzjAyPkPuMZKGmm0z9hy2MkqGTtRy813qnHz9U11EfQw8zRMy9WaXaqgHYA0xlid6KCB
         pU6XynRLAqM1m2xLc1G/MBi+2CdKLEPFf6hxbUdSvU2eCG5Yw/HwqwXkobWsN5JHsvoX
         0DJgI08uoqoI8B9YsVouPQPbfJpWN8sn/bvFw6Y8FS3172+NQnhQEtTXnJuClqPc2CbT
         yKdA9MjlAsQtQz8VXdd+InB6/9Ayg/gukx1SNBYub69qwSJ2NqIRh90KvDw4GDctwCcO
         Q99g==
X-Forwarded-Encrypted: i=1; AJvYcCUugWXzsENPANGL4EjHgmsHuftcaEnM7iZ4RTT/5BIfqkC8Ea4Ji1tsLnT4vZ1HF1vO6GiL76G9d/Vvmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl8QmWkzW09KTGxr5c/kzPdRIvLHiVTiYMs60KHIRf2MOLcxhc
	i5I48BlXJkYzaWB9HcFiitLEqKv5uUZUFv3GHIco8KGXbXgnfldA8bUUBAwLBm1+bUwxfzLEWKl
	fWcXuwA5AQLYjH8069vSCDG/BF+OjTJTbB6Bt3Q==
X-Gm-Gg: ASbGncskpm7eLChorcJyvuDMVYjL9PB8zRGZKDzQSRN+SR0NPtnUxY5x4R7r3GUoKW0
	G+pUYKcjr2yZXA9CgiYuLpQUxlQzmgsG1BVRMI7bsHc2RKqqnsFwbkwKQtled8GFQsAFIKHv3TI
	vzZiKrDVHOZdVJH0NXyd1PAJhEr++ODw==
X-Google-Smtp-Source: AGHT+IHHO4p75yBvoZrH4CWt7Sm3+WjJipBubc0F5yEZyIihuApBbf7n+j83VZzoGbXPEsG7JEuXYNAUETI3Fr3UyNs=
X-Received: by 2002:a05:6102:161e:b0:4b2:5d16:f75 with SMTP id
 ada2fe7eead31-4b9a4ec7f86mr5303490137.4.1738229492696; Thu, 30 Jan 2025
 01:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 Jan 2025 15:01:21 +0530
X-Gm-Features: AWEUYZmjjTJhG4gbVvsZPMKcHyLA3_iG79mE5k3okwZmPnMLWYy8tDLAX5wqlig
Message-ID: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
Subject: linux: master: x86_64: gcc-8: error: call to '__compiletime_assert_909'
 declared with attribute error: clamp() low limit dsc_min_bpc * 3 greater than
 high limit dsc_max_bpc * 3
To: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: David Laight <david.laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The x86_64 and i386 build failed with defconfig with gcc-8 toolchain due to
following build warnings / errors on the Torvalds Linux master branch.
But gcc-13 builds pass.

First seen on v6.13-9485-g72deda0abee6 on Jan. 27, 2025
Good:  v6.13-7644-gc2da8b3f914f on Jan. 27, 2025
Bad:  v6.13-8265-g9c5968db9e62 on Jan. 27, 2025

i386:
  build:
    * gcc-8-i386_defconfig

x86_64:
  build:
    * gcc-8-x86_64_defconfig

Reported-by: Linux Kernel Functional Testing

Build log:
---
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86
CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from <command-line>:
In function 'intel_dp_dsc_compute_pipe_bpp_limits.isra.80',
    inlined from 'intel_dp_compute_config_limits' at
drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_909' declared with attribute error: clamp() low
limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:523:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler_types.h:542:2: note: in expansion of macro
'_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
  ^~~~~~~~~~~~~~~~
include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_),
__UNIQUE_ID(h_))
  ^~~~~~~~~~~~
include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
 #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
                            ^~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of
macro 'clamp'
  limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3,
dsc_max_bpc * 3);
                         ^~~~~
make[7]: *** [scripts/Makefile.build:194:
drivers/gpu/drm/i915/display/intel_dp.o] Error 1


Links:
---
 build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/log
 details: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/details/
 history: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/history/

Steps to reproduce:
------------
$ tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-8
--kconfig x86_64_defconfig

metadata:
---
  git describe: v6.13-9485-g72deda0abee6
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git sha: 72deda0abee6e705ae71a93f69f55e33be5bca5c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEcVft7ytiSSvOSnAuAxlCgRH/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEcVft7ytiSSvOSnAuAxlCgRH/
  toolchain: gcc8
  config: gcc-8-defconfig
  arch: i386 and x86_64

--
Linaro LKFT
https://lkft.linaro.org
