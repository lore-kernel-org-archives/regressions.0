Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8E714A60D
	for <regressions@lists.linux.dev>; Fri, 30 Aug 2024 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725000324; cv=none; b=tp0FdRWUfMXJBbwbHDiczv5GBzjhl46+D0hVgtXJnn9pyf2tfy9Mu8X6DyTlDzvBXzMsgsPRuIAsEPmGudgXm6DJjFkQbOwi0zP0zI/ZnAIoH099ZlpkaFLWJFVMEjP0Xe1WSyXDFGEYV97OFR06VqRBjOvOFOTI1rOme4L8TXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725000324; c=relaxed/simple;
	bh=z2tMGYCX6QIF8USqnak/joMuhfj1TNUKUkBSSXPLdCM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hhu3obWsCgQV88E1ZmiqEjyinDgI8mEkS7UZd227OOvXKjSDTwsj0TQPeUg4Bh89qJETPixbmzJ895AuxfKqx8KQ4bAqELW75bX0/IoGXlkRhb0n9GTefaLS95GxUlM8C7pSdo/F5OZTP5ARvyayzLOv5vgfeGXeKmImJKPRNW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FDe9Ang4; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FDe9Ang4"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-498d0c68a14so506114137.0
        for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725000322; x=1725605122; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rbpFfZAAGy+MvWzUwDXlPYpxkRy+IDxVTjCRFwW+Hxg=;
        b=FDe9Ang4AlU1ZQry/RdZ30cYG4JOlN/G5PQmCvByuRyj+Pd7PBS1k3X/kxcZBDeHjs
         7Wu/uPx4RFBOzEn8f8nsYv4U2Gaj2k05xbsmdjM4126Zh1yYiOx3cFA9k+eKyX+vAjKi
         sR4CRZY9YS0tp/DjNpK5SqYTG6Ir1Nd1zuhGUv4GWECQL1sv56/8I7WNQ44nivAgnOtp
         MIIiBHCcMFsSrKh0dtOapmm5D2ElHsAsOGo4qa0J6GYPOi/LO/SWKmL7hYaapYv66aJW
         /mgBH+2jmWhXJZR4HV0J3xoQ/giaEoi4ux1MF2kCj/3/+xEJO09R/2CZTvOAMnrbPd9a
         q+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725000322; x=1725605122;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbpFfZAAGy+MvWzUwDXlPYpxkRy+IDxVTjCRFwW+Hxg=;
        b=GMIs+czy/y1H6kQJhTlFqHLFGAU9gDSGk+gTz4jlhnOpmN7m9b/CPu6cp8gWkZ441A
         r5a9qTgubxwnU7nPp/lPUz0GMyT3QGSuW0Oux5pZhi/AKi5C17vTTlxHeCBOO3Vq/nV+
         j421/1cDVM9TRsqA+uLKjFhqMBrt3K17CVWwmOLCA+XgrrK5RpZ/KHqDr2dA64ZbmoF5
         JK/58zgMNXUzFgt9D8LuNwMfcbCJq4lG7pAUYXB9bZduBNaQ7LsyeV0xCIbzlVBdueaR
         YA93rVhuAU9fRNFBMUlESsywHtqYl5aH0ogCpYSzx3TxThSbbM2rz2sWIgA6fNlaAwN1
         1HNw==
X-Forwarded-Encrypted: i=1; AJvYcCWPqb8/T1AXr5Sqo8hRzL0PoSd+1LXC26rcLpDJHl75zjnGW10SQ0HLEXoytAFmrEZeGwcm9o+XFjkYPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsQez1+GIOK50NNRw19wdvq5HqUrGv6OMP/uInXI6xUanp/wLR
	LIB2IGAqV+GBOCDDsFjXtJ6F9qeeWAAje/K7vASCVxpsvlodqnFmnWPboJnASuua4Pa6nagNPmq
	AdGfEn09p9TR2lXi4oJF0R+277cMun2ESDkyswg==
X-Google-Smtp-Source: AGHT+IGjtT+iRsWBRGw877rPBsoWnB7aehlawvTFpCsFP81H03YlByPMlEYvHuWNIHaoPnc0CqKmfajXR5onhPoZMMU=
X-Received: by 2002:a05:6102:3754:b0:498:ccd9:5b1e with SMTP id
 ada2fe7eead31-49a5b017424mr6994044137.4.1725000321654; Thu, 29 Aug 2024
 23:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 30 Aug 2024 12:15:10 +0530
Message-ID: <CA+G9fYtemFfuhc7=eNyP3TezM9Euc8sFtHe4GDR4Z9XdHzXSJA@mail.gmail.com>
Subject: net/xfrm/xfrm_policy.c:1286:8: error: variable 'dir' is uninitialized
 when used here [-Werror,-Wuninitialized]
To: clang-built-linux <llvm@lists.linux.dev>, Netdev <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

The x86_64 defconfig builds failed on today's Linux next-20240829
due to following build warnings / errors.

Regressions:
* i386, build
  - clang-18-defconfig
  - clang-nightly-defconfig

* x86_64, build
  - clang-18-lkftconfig
  - clang-18-lkftconfig-compat
  - clang-18-lkftconfig-kcsan
  - clang-18-lkftconfig-no-kselftest-frag
  - clang-18-x86_64_defconfig
  - clang-nightly-lkftconfig
  - clang-nightly-lkftconfig-kselftest
  - clang-nightly-x86_64_defconfig
  - rustclang-nightly-lkftconfig-kselftest

first seen on next-20240829.
  Good: next-20240828
  BAD:  next-20240829

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
--------
net/xfrm/xfrm_policy.c:1286:8: error: variable 'dir' is uninitialized
when used here [-Werror,-Wuninitialized]
 1286 |                 if ((dir & XFRM_POLICY_MASK) == XFRM_POLICY_OUT) {
      |                      ^~~
net/xfrm/xfrm_policy.c:1257:9: note: initialize the variable 'dir' to
silence this warning
 1257 |         int dir;
      |                ^
      |                 = 0
1 error generated.

Build Log links,
--------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240829/testrun/24977652/suite/build/test/clang-18-lkftconfig/log

Build failed comparison:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240829/testrun/24977652/suite/build/test/clang-18-lkftconfig/history/

metadata:
----
  git describe: next-20240829
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: b18bbfc14a38b5234e09c2adcf713e38063a7e6e
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2lKF49FRX1FB3IVv46cfZc30s9y/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2lKF49FRX1FB3IVv46cfZc30s9y/
  toolchain: clang-18 and clang-nightly
  config: defconfig

Steps to reproduce:
---------
 - tuxmake --runtime podman --target-arch x86_64 --toolchain clang-18
--kconfig defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
