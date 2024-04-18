Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F52E57B
	for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443685; cv=none; b=OoJRQlestGSr967h170Sejg8NE0kMrTCDGBsc2JSUWgYvCW2g6FuljfxlyHn54+TMUBG0eJmuDobigCejkVUEOpYrF3qxC/6OUcItrS+YV5PCWJ5igjF9D8DaByCMeIqvrj5S+yLYlSCk9KAV63+d3Q+lwy5y0l3umtQK0jxNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443685; c=relaxed/simple;
	bh=B+6GB4/OCyyStGw/ue3Vas1OEHIwT7vYsI2tWaOCaHs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=J4cY72dIXUdh1fIRXCncik1KpXgb3yTxGk6NsvzbczEldikafox4ukGRMe6gYDUAm77Eb+BecMaNx6rdtuqruxgzXRIkU8WCyhWoTAjL1HmaLK+cY/tOKNIP3HH0aHhyAMbwd356W/4YE/Rzafa0wLmdqGu7UWJLI4H3imbxcOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QtrWmH4x; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QtrWmH4x"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4dac112e192so247797e0c.1
        for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713443683; x=1714048483; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ipPrK9EjD6DeorbTfyjfvzjZb+slj22QZKPXwKOud0E=;
        b=QtrWmH4xa4R1t3ZofyH+7yZYN+40yw9KJno7XawuVDpPiAhXb17/8A9k2cwtgMBOS/
         zKeaEzidJneQLNyy8nJzvzMYPMG0Wi+yl5jFkyQvLGt7neomLv3aNetFuMDxmw8/bXUU
         IQa4mbHB8wMNLRW0fgt1p96W1hhU7xi4q2ngKGuCJgAYiblRuLpJTEJfDU+lxOBwuny3
         kyzv0dRtQsLqWW7X2tpJzhn88cyw3fjFn5tJ1HzwSvStT5UnrZl+PqCXkP1hD/ccqNn6
         qkZXgxtq7yWFlhLgUB2XhMSLY139NJchzkojJ/eybd5YRpWvOyWPqVBmce/dKKQQnWKS
         e3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713443683; x=1714048483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipPrK9EjD6DeorbTfyjfvzjZb+slj22QZKPXwKOud0E=;
        b=VvcHluQ+JnFe6u9uzT/86rZjc75+M8l0q5gJ2FYxPX0pT1fVYmC/BVr96UQ3pZtJ95
         scYWXB6bqcXHAnwGqpAZxoEXcIVqIgKiTrR7YtaLzfPAuIE8gMoXsbVTWwtJfgGYXZ22
         lVHqhxz6Tuz0fOYn21hSFYJz9OLkx+HZD3visG22mvQADI3ZwI5FO0xv5JKSWixrhvF1
         Bec0W2kpEFmNHCuOZKx3T2ZNpcKorWvnSzTUmErteMGDsviTfeT3KQ3Qj2h7iDSzLcvc
         Uim6EM44i2LWICVoFgwx7cCtrUbvZuoXk04SNxgmIafToFND0Awl/1jBDCGpneP05CYb
         72Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUXZsByPBmxU8a5f37k+BM/l24KlhuI2AMmFcZyvhPRAO5oTZzCXVBjb2fIGUZMyzPrvWQ+FBnQc2Mx2wbjtFZCnYxD/7qY+JC6Yqs=
X-Gm-Message-State: AOJu0YwZR5pi9W0Tc/lpft5oHJxc1hbEoQiVuJTmAoxtAeME5B1zDlll
	utSkODTz49iAwFvE7MMS8hBkR15C+Pyu2ghtDcKHl5REzWkUhXtO0MWpdeT0dqqCNPM4A1D8hPJ
	Ub5ze0bchXKn9KgLEe7ndJwRkc3K9Y1t/GXHxWQ==
X-Google-Smtp-Source: AGHT+IE3NKjPZchvxKTF6nxS5pBTq01eu1Q3p1+qrHemeOlAnU1tkm01Opcsjyvz+j9/RhVgmEuttM3ePjf773uDYCE=
X-Received: by 2002:a05:6122:507:b0:4c8:ee1:5a0b with SMTP id
 x7-20020a056122050700b004c80ee15a0bmr3133353vko.15.1713443683124; Thu, 18 Apr
 2024 05:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 18 Apr 2024 18:04:32 +0530
Message-ID: <CA+G9fYtukczdEnnqtD4jeHqDYwf30A2RpfK8knB6jaJSE+mobg@mail.gmail.com>
Subject: selftests: arm64: check_buffer_fill.c:94:93: warning: format '%lx'
 expects argument of type 'long unsigned int', but argument 3 has type 'char
 *' [-Wformat=]
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The Linux next building selftests with clang and gcc-13 found these
build warnings.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
PATH:
Reported build warnings noticed on following test files,
selftests/arm64/mte/
 * check_buffer_fill.c
 * mte_common_util.c

check_buffer_fill.c: In function 'check_buffer_underflow_by_byte':
check_buffer_fill.c:94:93: warning: format '%lx' expects argument of
type 'long unsigned int', but argument 3 has type 'char *' [-Wformat=]
   94 |                                 ksft_print_msg("Buffer is not
filled at index:%d of ptr:0x%lx\n",
      |
                           ~~^
      |
                             |
      |
                             long unsigned int
      |
                           %s
   95 |                                                 j, ptr);
      |                                                    ~~~
      |                                                    |
      |                                                    char *

<trim>

mte_common_util.c: In function 'mte_default_handler':
mte_common_util.c:41:101: warning: format '%lx' expects argument of
type 'long unsigned int', but argument 2 has type 'long long unsigned
int' [-Wformat=]
   41 |                                 ksft_print_msg("Got unexpected
SEGV_MTEAERR at pc=$lx, fault addr=%lx\n",
      |
                                   ~~^
      |
                                     |
      |
                                     long unsigned int
      |
                                   %llx
   42 |                                                ((ucontext_t
*)uc)->uc_mcontext.pc,
      |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |
               |
      |
               long long unsigned int
mte_common_util.c:41:48: warning: too many arguments for format
[-Wformat-extra-args]
   41 |                                 ksft_print_msg("Got unexpected
SEGV_MTEAERR at pc=$lx, fault addr=%lx\n",
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Steps to reproduce:
---
tuxmake --runtime podman --target-arch arm64 --toolchain clang-nightly \
  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2fDW3nAXzFH2GOEle3S3MVC53A9/config
\
  LLVM=1 LLVM_IAS=1 debugkernel dtbs dtbs-legacy headers kernel
kselftest modules


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13 \
  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2fDW3wG8BqWxf0afUI5f4wkArPi/config
\
  debugkernel dtbs dtbs-legacy headers kernel kselftest modules


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fDW3nAXzFH2GOEle3S3MVC53A9/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fDW3wG8BqWxf0afUI5f4wkArPi/

--
Linaro LKFT
https://lkft.linaro.org
