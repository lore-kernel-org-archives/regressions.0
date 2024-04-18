Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DD15ADBB
	for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713433090; cv=none; b=rhkfI0yetnyCxy/N9ZwsuQXomcNfHByyIBXeCGZI7unrP5cvKV0t7tx1blpj6rHiVQj3UdGOhpHLTX6xOdGCPs8cHXNhySyPhjH8YYPT6xOjD4hleHGMKo2+2dv1ZSXddmcSj8ORo6V+RXKd4T9M4Ji9QrKVjYnj/IavSo/Jvg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713433090; c=relaxed/simple;
	bh=8ShK6BZyhaLHMQr2Rr9oA5Mcbeoqx2IAhm4x1HZZarY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bal7mCiQ82DOGJ7lDvpTQ3sN2OMsfyNgDMSCmWdkA90wWvuSc10XKY5Hr5xOfBmECApjW6e9B1pdgM4XV7t8jSGipiSAroMqM5NkQbNRJnQVzKzA5eDqfAShXuca9+nTKjLlSWNDqx754rRA45ZLzT7EBXtuL+JfW/OjjTIONG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S/OaMBAI; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S/OaMBAI"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7e6b9c1f636so166134241.3
        for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713433088; x=1714037888; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mFeVdDbx/Wm34+9Q/l7q6aDREQ/YSdgqO8vqBbzLk1U=;
        b=S/OaMBAI0n+WMUNhfO9NXqWZ7sLuTsxFAGBtxoDAxSiptZayDWg1Iqkd+svy4rBFkT
         nM92zfqdpU225Ue8PvmG13/TucCoWQnQ+ZLuKL++zhX2p2Qoj+u+8U+MJPzttdy/9PfI
         FiRmjb6WY2vPybkc6P+LFQEyIxKbbcHsn2sSQ2J2gKR+COjUWTZtgpwBzCN8pMLAoXyZ
         U8IA3Mg/cCZcVqBEoTUxot+dMjjJqoApTq1ZUsVFAfNm2LcvPcq/XHLRXb5qysNAChvN
         c28auBTeTa6AU0Zg/MTTOpxP1a/I2ggTwQIxc3Ik8B9rKGTT5hkxPikDbqHdP2uB1TQz
         BSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713433088; x=1714037888;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFeVdDbx/Wm34+9Q/l7q6aDREQ/YSdgqO8vqBbzLk1U=;
        b=bE8P39zvYBOKfXaMTPAlr1E/IpCVYi2bngbGVc8Si/DjrI1wsq6jXmq0r41HHcJxF7
         c5P/e9WuSTmWv5egkqnOBIivq08j8El5l4P39tIFdd40W5PjfIHozMj2kaHWLJvWk/+e
         aTao3qQ5W0EDOKxWKDuiwSId4+JFCKglmZlXfl4Gj5RZHS5FvxDaj9BBTZDeQBDzy3cm
         KP2MF2cRD8zRJ4/2B4Uu1HlsJ3H/T3jeE/3w3CGDhr4yuhT5Oemh0ezK1IJSFn+GyslN
         I3zHVYcshJqtBjJq0REc4n+ykDHwqsggA4VrEiuQceufOsee/7q4Nbxy+Pny6MjDMUk6
         czcA==
X-Forwarded-Encrypted: i=1; AJvYcCVFxCIieKtQGixP6nUAhh+sxGwA94t/KkCwdZjC1OqExMxbjIJNL9N0Yz197iZ8rseGgaxLF2PeRHht+wP88kFFOMRHF1yB3vyl8ZQ=
X-Gm-Message-State: AOJu0YwVXA5HRQbgTgoQtQM6UqKCY5HLHlI2RlBkzWJ0okDjLGS4dYSR
	NgZv5D6yRshzp70GxEV0GT3SdXe220z9p4OIvQxPxNOIFq/dKQ/X3vtJOMhWVX32mbWZa6gRnYk
	kocakIlMkKB7fBYzG9uuXF9Dj71qwyUpGAWFVNQ==
X-Google-Smtp-Source: AGHT+IEoDIR/L/aazTWb4Qg2+VKVTMbhyKp0gSJZ3qS35wjNaK3q5yTn60lPAs6KLT11MyJ/yXVClp46VBRESQ9PGlA=
X-Received: by 2002:a05:6122:1da5:b0:4d4:17c5:8605 with SMTP id
 gg37-20020a0561221da500b004d417c58605mr2452601vkb.7.1713433088326; Thu, 18
 Apr 2024 02:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 18 Apr 2024 15:07:57 +0530
Message-ID: <CA+G9fYvJ7=rahqJ9g35=XzEvAq9+zAiq8PNhBE-ceb2EED2gnA@mail.gmail.com>
Subject: selftests: resctrl: cat_test.c: In function 'noncont_cat_run_test':
 ../kselftest.h:74:9: error: impossible constraint in 'asm' 74 | __asm__
 __volatile__ ("cpuid\n\t"
To: open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Shuah Khan <shuah@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The Linux next building selftests with gcc-13 found these build warnings
and errors.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
Path:
selftests/resctrl/resctrl_tests/

In file included from resctrl.h:24,
                 from cat_test.c:11:
cat_test.c: In function 'noncont_cat_run_test':
../kselftest.h:74:9: error: impossible constraint in 'asm'
   74 |         __asm__ __volatile__ ("cpuid\n\t"
         \
      |         ^~~~~~~
cat_test.c:308:17: note: in expansion of macro '__cpuid_count'
  308 |                 __cpuid_count(0x10, 1, eax, ebx, ecx, edx);
      |                 ^~~~~~~~~~~~~
../kselftest.h:74:9: error: impossible constraint in 'asm'
   74 |         __asm__ __volatile__ ("cpuid\n\t"
         \
      |         ^~~~~~~
cat_test.c:310:17: note: in expansion of macro '__cpuid_count'
  310 |                 __cpuid_count(0x10, 2, eax, ebx, ecx, edx);
      |                 ^~~~~~~~~~~~~

Steps to reproduce:
---
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13 \
  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2fDW3wG8BqWxf0afUI5f4wkArPi/config
\
  debugkernel dtbs dtbs-legacy headers kernel kselftest modules

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fDW3wG8BqWxf0afUI5f4wkArPi/

--
Linaro LKFT
https://lkft.linaro.org
