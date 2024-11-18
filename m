Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99273194125
	for <regressions@lists.linux.dev>; Mon, 18 Nov 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935453; cv=none; b=kQiS3G+0goq0/fRyicmFY5HJCeTiTb/z+umgRlc3E//n+jD5ywGUjAznOh0fKjk75snx0EKpfaiphmze9YRdyizRQ1ItEgpH+q/X0prJ0bT8uqQSwJqyUq3/fQTlYFHG4FYXacNWRSj0SU2nZhBq+XYQq5oa+gJZH1ZL+DxCvUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935453; c=relaxed/simple;
	bh=Op2I8dr35muBs/N0wwVSV8bMfv9/DBnetL23eBdhKSw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kqarYZuMtK1jp5eXx3XMgmn4kO8HBhVULK8aCDwDfYImmoYEXeiQE0anUPdlwRuCR74TTuMuJJZLifwn/6WznabxAYHKK0b03OszQ+eJ5XdiYADMtW+QfrJIVfpLkhmv2mbm1N9iQV71kn4u1bTpkRMUU4Zhi1dwDRRPcl27ayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ibQtaOp/; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibQtaOp/"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e604425aa0so2102628b6e.0
        for <regressions@lists.linux.dev>; Mon, 18 Nov 2024 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935451; x=1732540251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YTw7RWvWoc0SMzgWBayRA2wygazsMYV1x3KYiELVVeY=;
        b=ibQtaOp/c2tef2715ew/fFuHJTx/QDoJKK1SV6ziAwwCHT6VejJ+NiKCS/1F6JmjTP
         UNdIps2kz5lZAY8tokbQCNXzc+ojRMp2EFa60tZiHG+eAPV3dpaeq7MqXWbjb7dXCTux
         mlONjsCTAZG4QFHFfm0iSmwEvJt8OfdXm30zi9rfeuNnA30GBktlmGaDXIKnjl92aZrh
         3iF5duM1X8vhYMjZPkN2hptGA+D8ETtvy5O50ywBi3Vt+l4HFtfHXDfaVdaS9JxO/fIq
         1vfUK23j49BX3XPKacChW0Yf3G9oqv8yk+5leX2+Q+Aln0e0H8en+a93wtOh8Z7oOlNM
         1p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935451; x=1732540251;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTw7RWvWoc0SMzgWBayRA2wygazsMYV1x3KYiELVVeY=;
        b=GDHds+ElVinHZfZ+TE5fnZPlafm6VJvaaA/paGyIRO9+UgqSATAQ1cquT12UwS83yd
         nhMDHg1cA/wfGVZ2Kz40ETkgiWSYcuXnEEobKm7kvgSoYX/8QdyYU2PLrPb45Kuuqe3T
         bkxQzFJjfTtAfr0rWCnHqEF1DXqzfIyvRHPMBTQ1NM59/y/Z9YPttmfdTDM/205F4jDv
         TKUqGeKhv42uD1f2CcyMoJ7slMsB766sFQG2sJcJFpNDsonUqbZZlQQAv7eQDgJjiqLK
         mP94xonr8wsuDeFrIz7rcRPvh8AVisPggrp9eW9s4MCW5Rc8a1ogSK3ubyc7+0mRB5i9
         VyAw==
X-Forwarded-Encrypted: i=1; AJvYcCUPd2XL6J9n9eMTJl57RKJqXJVirHb6Vb8AzgDwsRyMmtCkpmo5SA1Q1fRL3vYjNvOGnvyIpv3LC5dYNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTWSjD9ZmcsN86P7SeErjubV7GozxT6VoLSAXov3E6q8mX7+ka
	23KbIRDq/hOysYx5SZJ/D3wntm5k1PrkSBAdJEvfXtAIUqoa6LX13c21Uaz3dw5oxtd03Bk8xR/
	Dys1hWciySgLVYnSUNvPkiwFIp+LYwBxXY6vD6Q==
X-Google-Smtp-Source: AGHT+IHGcZHpXIet+VQyE38gSaCHSlt7RMcXTgIjtwxRtsxmDxLBiM8FQSw90gh105xogQgSb+fpkFDsIdEuZz4rOJY=
X-Received: by 2002:a05:6808:2017:b0:3e7:a284:9b13 with SMTP id
 5614622812f47-3e7bc7d87a8mr10574272b6e.21.1731935450734; Mon, 18 Nov 2024
 05:10:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 18 Nov 2024 18:40:38 +0530
Message-ID: <CA+G9fYs+gwu67Y0Tm2FHfNuUA5eLxT2FAWkfKvYrEbXJUXXiiA@mail.gmail.com>
Subject: drivers/clk/davinci/psc.c:281:10: error: incompatible integer to
 pointer conversion returning 'int' from a function with result type 'struct
 davinci_lpsc_clk *' [-Wint-conversion]
To: linux-clk <linux-clk@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: hanchunchao@inspur.com, Stephen Boyd <sboyd@kernel.org>, david@lechnology.com, 
	Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The davinci_all_defconfig and multi_v5_defconfig builds failed with clang-19 and
clang-nightly on the Linux next-20241115 tag for the arm architectures.
Same build pass with gcc-13.

First seen on Linux next-20241118 tag.
  Good: next-20241115
  Bad:  next-20241118

arm
* arm, build
  - clang-19-davinci_all_defconfig
  - clang-19-multi_v5_defconfig
  - clang-19-multi_v5_defconfig-65236a87
  - clang-nightly-davinci_all_defconfig
  - clang-nightly-multi_v5_defconfig
  - clang-nightly-multi_v5_defconfig-65236a87

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
drivers/clk/davinci/psc.c:281:10: error: incompatible integer to
pointer conversion returning 'int' from a function with result type
'struct davinci_lpsc_clk *' [-Wint-conversion]
  281 |                 return -ENOMEM;
      |                        ^~~~~~~
1 error generated.
make[6]: *** [scripts/Makefile.build:200: drivers/clk/davinci/psc.o] Error 1

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241118/testrun/25881399/suite/build/test/clang-19-davinci_all_defconfig/log

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm --toolchain clang-19
--kconfig davinci_all_defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241118
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: ae58226b89ac0cffa05ba7357733776542e40216
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p15j4StPnjuuRXu3qgndSTbahH/
  toolchain: clang-19
  config: davinci_all_defconfig and multi_v5_defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org
