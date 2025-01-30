Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BFE1B6CF0
	for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230741; cv=none; b=NAQB4EAoS/ARc0pKge8d65+wd/mvWWPVMl+Ebde0k+yUp23PlpC7RGev+0QevfKTys42Vwqe3ma77626x7arE71GiT/Ec29z9yY/O1iYr7+HGtSltwf/nwEmKrXY3eD5oWy9fVhFpXlgDmTuRYSWQuzDEOK2JcfGKl1S7kHUSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230741; c=relaxed/simple;
	bh=oOlH31+Fi0ZgrG/RXFKf+ovqVCVSyjsMJWQgNttxRF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OjGURd0xtUArszf7ED6DK4tcCVptu29xGrnDlLMWzqMd8MkzCvboQT/Hx9XxR6OlCzGkgGh5cAeGYwqmXG0RGw0FNSbbEK8IhxsNsnl7aga1OQqQHNQvyTw2In2Cf/BCm9bItubrJV8oZ9lTFN0SLbf6CYZ+3gsKZlgms3a4uMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmgfM01g; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmgfM01g"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-518957b0533so170956e0c.1
        for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738230738; x=1738835538; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gIgiURoIKeHZ75W8n0Yn2XXbNIX+HO5mOVAyC7vGTcg=;
        b=YmgfM01g7Xf8daLvBrr4aye+2QFUdg5LREB8vswlA7Q906aRHT/wK8/39/Oa2nB26C
         9h4k4VI7s4gs1uQquLyKHEam9jfvsqSfngdhW1Rt1o1L1Zonh7ShHNbLqrUv9XFAFHSc
         luzKx1c/x7uN4rTSD3PYA7aWH4n9RO9a0MJwEpAlDpJXI8JOrrJUT/77yLjeQFr+tH09
         YU3R7vl+/vLZ3RfW/L6r/8WIMZ6i3j2o3nrNJuhkKYoxitrtcwRzNioXK/Pl6BMAh4Jl
         FXllQczHWgr1/jgG7kBx+GBfzf0Xw7Adl6lvPIC3nA6+SxfmR8HNIUoZjnk69P4AGkYe
         i9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738230738; x=1738835538;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIgiURoIKeHZ75W8n0Yn2XXbNIX+HO5mOVAyC7vGTcg=;
        b=Oyjszh+vX/EhW7XYV8pzcmYkr8iYUe6mmptsakVrLQJu2IdvKpINaFKniwh3JRb8F2
         SV+Lx0dHVXcIxYb5cb2XyXoCfitDrPtH9ae2L+JtE3ZxW+97EX4GZGcbvtAt8GCETGvw
         TykiGMAfuRTWmiU9ZqCAjGJ5W0PIa4xuk+xsBeGjtiy/jQ54bzZ62X+stvYksqZ3h33a
         ymOr7Q3+jjzYQKvIpR+jWtt9M70rPKQPbHvANp6B2rXmn+NEQrjJJZsRJCmjWVyKBwzz
         kSCux/7WUBzoS/YEYNK4BLiuqu/d46SYFGfh6iIRJLA8mk+F/OD9LFanFnSWIck0zYNt
         nKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC7Pi9SUrH/8XcwEZN36Q7A2je6BZ/l+v9CylwzHGsTR871LozWZI3sP1gImEcCeGOidVieYPGQeoqmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyLNO4ZqzW/9jXLc1yqKMQAU1RsQVf49lyxNdpSjJYqtZKTgS/
	FUipRO6SriLr8npV2jKsLtfLTmCo6A+5APABiVfH0o+u+OZ/dwDTpcyr9/ONKw+vxNSXRYy4pEc
	LJDP5Kr7dIVFzJEjyvYDiE+nu74Ssp2rM1G0k9A==
X-Gm-Gg: ASbGnctZQV5Ngh/NCmiXrY+yYtS1y1MOMsaPKKJFVg7c+j4579Z1/CBev2inUTY8/Dz
	HDI4Fe5LQwlKIPLhyBMbVdMzL2UCp7tbNTvJrl/ya0ZFwGJkhPcj3+cqsG2xQAbmBcF8QocQEiq
	hr3CWsM0xK8HuobOMB7Hi08s5Tz7B1XQ==
X-Google-Smtp-Source: AGHT+IFtphWzHzB5hLr/5hK9G0Oca2XVEYUATYBwh55KvkHQqmoCAkCZVHlU7DPA7oNByuxxN4PbbEmK0DqTS/BNDj8=
X-Received: by 2002:a05:6122:65a2:b0:516:157d:c5fb with SMTP id
 71dfb90a1353d-51e9e55bbbemr5640094e0c.10.1738230738043; Thu, 30 Jan 2025
 01:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 Jan 2025 15:22:06 +0530
X-Gm-Features: AWEUYZkeZKfv6tjMqdkdLJ6wGFjSj8QJD_kr6h2mDudYF9DdNw1AJWHq70JM9Rk
Message-ID: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
Subject: linus: arm64: error: call to '__compiletime_assert_536' declared with
 attribute error: FIELD_PREP: value too large for the field
To: linux-phy@lists.infradead.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: David Laight <david.laight@aculab.com>, Vinod Koul <vkoul@kernel.org>, 
	Adam Ford <aford173@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 build failed with defconfig with gcc-8 toolchain failed due to
following build warnings / errors on the mainline linux master branch.
But the gcc-13 builds pass.

First seen on v6.13-9485-g72deda0abee6 on Jan. 30, 2025
Good:  v6.13-9338-g05dbaf8dd8bf on Jan. 29, 2025
Bad:  v6.13-9485-g72deda0abee6 on Jan. 30, 2025

arm64:
  build:
    * gcc-8-i386_defconfig

Reported-by: Linux Kernel Functional Testing

Build log:
---
ake --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- 'CC=sccache
aarch64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
In file included from <command-line>:
In function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
    inlined from 'fsl_samsung_hdmi_phy_configure' at
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:469:2:
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_536' declared with attribute error: FIELD_PREP:
value too large for the field
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
include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
   ^~~~~~~~~~~~~~~~
include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
   ^~~~~~~~~~~~~~~~
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:344:9: note: in expansion
of macro 'FIELD_PREP'
  writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
         ^~~~~~~~~~
make[6]: *** [scripts/Makefile.build:194:
drivers/phy/freescale/phy-fsl-samsung-hdmi.o] Error 1

Links:
---
 build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27067488/suite/build/test/gcc-8-defconfig/log
 details: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27067488/suite/build/test/gcc-8-defconfig/details/
 history: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27067488/suite/build/test/gcc-8-defconfig/history/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

metadata:
---
  git describe: v6.13-9485-g72deda0abee6
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git sha: 72deda0abee6e705ae71a93f69f55e33be5bca5c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEbH5NudB5wtp6BtFn2cIlatV/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEbH5NudB5wtp6BtFn2cIlatV/
  toolchain: gcc-8
  config: gcc-8-defconfig
  arch: arm64


--
Linaro LKFT
https://lkft.linaro.org
