Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096152836A
	for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443525; cv=none; b=BljGaYnmrPKGPhV8qlRMZXyUUaHHvZdmBHG3WvIT3UnFr14CWauUh61AD0+EA6gHus+zK8TYw2hbf1b5uIIY2N7E4UfL5qdXum+wFXmHkEdGMK7GAY+4km5d09hke4BgCYwFjv1U4eekkFIG+4HutJK6cTIE04kxkQIoUv70D2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443525; c=relaxed/simple;
	bh=YqqjyI4oiP/yXAptquTGZQq4WuZbwYBddBkxs2Tq4zw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ni3zm/K3jf8E2lzRG3v00v4T6nP0rmsp9vLtazjEb2WDzsnT10N649twhxzigOInNpgP7E1fvKZXOPF5W+kHOOL4dspBIU3hSj/FXWvPZjDuhizk2fzjWJ3f48DvNCdMeFsZmHOpJZT1QxWDGoo8AEEPBzB4fQuILwKZAZjs59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7S18rqg; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7S18rqg"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-de46da8ced2so483770276.0
        for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713443523; x=1714048323; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hBMrt7abAHFg6HP/pUKNzKWG1Ya5Ou5z4dVSJW9qzG8=;
        b=f7S18rqgEgG6hIOZ4+3cElCtYQicovd/nQi8qo/Dn6aK0Gj5swtLGWQ54w4HSqIWGj
         1uiMUI8V+FS6dGMXSdnUo0ExurtTtPcAIDXk6u8iW9ajhCsxiFlRp2Jhgt3nJXmagO7l
         z4k6fjf0jcuXxMYc+sCGmUziT52PVTLidHGGP14T9Nl+PGfdQ39in+Xo1KiA02FmV3uj
         JD0Vx8/n7YnElodZpMJCfNDs1sHTWIiFyj8YK28GauP26zPtizC/lto0SRhgWhbEMDmJ
         r24K4/IDrxP0xuwqlrU8QWjXoSv/vnlA1C4z8CQGZO3XLS4Z2XUjP6seidm63orn0Oi0
         YizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713443523; x=1714048323;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBMrt7abAHFg6HP/pUKNzKWG1Ya5Ou5z4dVSJW9qzG8=;
        b=PjHnKb+blU165rLq0eEcvZ8yUjuIzsKqgEIqTvJazyoBRMyFs+TL0ObAFZE1rYP+3N
         W+1SDXhne8d9eI/2e6xuYoxZ7/aJhZaMP3Ky3RGIW4KbQt3W8UVP9TJ7qX2vmJwqpw4x
         Dt/Q0W3fUN6TNhuMK4C9JfYKAJXHY4iliJtyRv6AwLX5613lo2N7CgNBeRIxA0o4t82G
         pfbCBS+OfZ02dtyxlaNYsluFNMte2FaWgi9lTFoHHzTtTlbFHS3qxPwVaoqwm5y9jsjJ
         G/jTLqE3dLNx22Mlhz2/pxTBa+6Oq2bFjBiddM4cVrgiTaQXKr1lm9I7h2d0j5GGvXGG
         ZQEw==
X-Forwarded-Encrypted: i=1; AJvYcCVh4lt3K1RQBgK4LeuFEhzm0ts2Vx+YjCklX3zSkTmO4UUHRiWzhb7X02frphc4IqMDLV5DiRMeLfheChhQyfry17BJVFhXtFLrcEQ=
X-Gm-Message-State: AOJu0YyurPLDxKmspFMeVHLupILtv64MFGcVb49vQ+J056y7QfajsV/I
	ODIAM2cfA3lVt4/gId7b5iCB+YjYSD4yWSa3oDXDn0SluEgJd95ZEjUrQjcloeQrS7+rO9JWbZO
	7oCowBr7+np0t23m+kXMyU+XIE1Kqu/4QdJ++Hw==
X-Google-Smtp-Source: AGHT+IE8M0WQNPrcBCZmpPscuxyU5gGtU5Y9ThtsKAZHFHZ07Igffy0ScmGH/QLZC38vl1oUYNHXJhm+5CXWUXMI3kc=
X-Received: by 2002:a25:8052:0:b0:dc7:4a05:ca33 with SMTP id
 a18-20020a258052000000b00dc74a05ca33mr2301879ybn.64.1713443523047; Thu, 18
 Apr 2024 05:32:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 18 Apr 2024 18:01:52 +0530
Message-ID: <CA+G9fYsMhzDCyqCPoZ68oMUV5tMbMmi5qF7_C+55Ec9h6YfXgw@mail.gmail.com>
Subject: selftests: arm64: sve-ptrace.c:85:40: warning: data argument not used
 by format string [-Wformat-extra-args]
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The Linux next building selftests with clang-17 and gcc-13 found these
build warnings.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
PATH:
selftests/arm64/fp
The reported build warnings noticed on following test files.
  * sve-ptrace.c
  * za-ptrace.c
  * zt-ptrace.c

clang-17 warnings:
-----
sve-ptrace.c:85:40: warning: data argument not used by format string
[-Wformat-extra-args]
   85 |                 ksft_exit_fail_msg("PTRACE_TRACEME", strerror(errno));
      |                                    ~~~~~~~~~~~~~~~~  ^
sve-ptrace.c:88:40: warning: data argument not used by format string
[-Wformat-extra-args]
   88 |                 ksft_exit_fail_msg("raise(SIGSTOP)", strerror(errno));
      |                                    ~~~~~~~~~~~~~~~~  ^
sve-ptrace.c:344:11: warning: format specifies type 'int' but the
argument has type 'size_t' (aka 'unsigned long') [-Wformat]
  343 |                 ksft_test_result_fail("Error allocating %d
byte buffer for %s VL %u\n",
      |                                                         ~~
      |                                                         %zu
  344 |                                       data_size, type->name, vl);
      |                                       ^~~~~~~~~
and more

Gcc-13 warnings:
------
sve-ptrace.c: In function 'do_child':
sve-ptrace.c:85:36: warning: too many arguments for format [-Wformat-extra-args]
   85 |                 ksft_exit_fail_msg("PTRACE_TRACEME", strerror(errno));
      |                                    ^~~~~~~~~~~~~~~~
sve-ptrace.c:88:36: warning: too many arguments for format [-Wformat-extra-args]
   88 |                 ksft_exit_fail_msg("raise(SIGSTOP)", strerror(errno));
      |                                    ^~~~~~~~~~~~~~~~
sve-ptrace.c: In function 'ptrace_set_sve_get_sve_data':
sve-ptrace.c:343:58: warning: format '%d' expects argument of type
'int', but argument 2 has type 'size_t' {aka 'long unsigned int'}
[-Wformat=]
  343 |                 ksft_test_result_fail("Error allocating %d
byte buffer for %s VL %u\n",
      |                                                         ~^
      |                                                          |
      |                                                          int
      |                                                         %ld
  344 |                                       data_size, type->name, vl);
      |                                       ~~~~~~~~~
      |                                       |
      |                                       size_t {aka long unsigned int}
and more

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
