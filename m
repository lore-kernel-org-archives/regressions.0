Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1868226297
	for <regressions@lists.linux.dev>; Wed, 13 Dec 2023 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QsVK+j2S"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-203349901d5so146894fac.0
        for <regressions@lists.linux.dev>; Wed, 13 Dec 2023 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702477064; x=1703081864; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tqc+qNcDFUuEzhB2fkHdqgjGsYz3lDNjBTl7uP60e3U=;
        b=QsVK+j2SlijcLQlhWj2k6rj0jx37ISmkaabu+27Od4xDih65EKGtARfyROKYy52Iuq
         HJhOZlsuj7x/N8mCG4db10lGNEmzs6iXngMw5jpi/LS37BudxO9ex0j/FUGIzheHOG4q
         U+UCcEPqCdP6ef8tZKjLEzDrN3f8VrGqGUTTjS1M0g8LWS6pFI2gNXwd1X7Tw55DhpXo
         HA6ZQwyH0hd6WMflmlLst83YNCpni5EFjnWcKRT/EKXHDLjnjEM/ACBPJhsMbBVKWN25
         i08wZSt1x1nfHnuWL1egJhZpk41BJ0/N5h1JV7f0M3Qs9R5VIaJaYfeUmzFXtmbotTaD
         1E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477064; x=1703081864;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqc+qNcDFUuEzhB2fkHdqgjGsYz3lDNjBTl7uP60e3U=;
        b=Kdt+iS0JI8X7XfVvtKs1/Wsahr1Q02ilVioCw3GgvmZ1HKDPvJXKMAS2tJb4Ltdcm9
         bzuEPj+tYqoAIkTp8MujTbj5bW/KDQ0nRcUhCNVWE9TkxAx37ckSiZuoB9QDuzxpzDmY
         k9263aJ0QJunN6ls8UPXXeg3uhcD+R4HCW9SjtCAI4yXEP6zGhuRR5wHmYabPsJVbcUL
         zvNGl/JGM8SG+iLjEIvkulY7ZqSwbTLn+LKBiPZUzVDJHAWM0GoSaVqn4R22ibWOseq4
         41twtSb4IS8STQNIacAEdGTbDbpMCB9ooiOA6pHBE/9c1FVO2BjfrvJv030l0JDLs+EJ
         8eug==
X-Gm-Message-State: AOJu0YxPCYT3zd2s3t0hqSf7X671hIf9FH9kyDF0hEq/s5/P0nK3rnQo
	ms8csGyflVYx4aclmu5YsnowMUOAeD7Ec7/1ue3q8w==
X-Google-Smtp-Source: AGHT+IGrRuBBP0VXscUJrKK3DezJlHwcMBbbaSID6Hu6/oNYQJngFBsVNxknC0Ev9yzXeyl/6xEvsu74C1tnxzzOgzI=
X-Received: by 2002:a05:6870:15ca:b0:203:c01:7d4 with SMTP id
 k10-20020a05687015ca00b002030c0107d4mr2465035oad.95.1702477064167; Wed, 13
 Dec 2023 06:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 13 Dec 2023 19:47:33 +0530
Message-ID: <CA+G9fYv9j08=+-CpJdtAV1z9-8KYbYcH8YOvWjbz4TgP7pB2TA@mail.gmail.com>
Subject: next: arm64: gcc-8-defconfig - failed - net/wireless/shipped-certs.c:92:1:
 error: expected '}' before numeric constant
To: linux-wireless@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Benjamin Berg <benjamin.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Johannes Berg <johannes.berg@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following gcc-8 builds failed on Linux next-20231213 tag.

arm64: gcc-8-defconfig - failed
arm: gcc-8-defconfig - failed

arm64: gcc-13-defconfig - Pass
arm: gcc-13-defconfig - pass

Good: next-20231212
Bad: next-20231213

Build log:
-------------
net/wireless/shipped-certs.c:92:1: error: expected '}' before numeric constant
 0x30, 0x82, 0x02, 0xa4, 0x30, 0x82, 0x01, 0x8c,
 ^~~~
net/wireless/shipped-certs.c:2:34: note: to match this '{'
 const u8 shipped_regdb_certs[] = {

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Steps to reproduce:

# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig
                                 ^

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231213/testrun/21662494/suite/build/test/gcc-8-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231213/testrun/21662494/suite/build/test/gcc-8-defconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2ZTTGLGEcQd1MiMrE1GgDyvdrla/



--
Linaro LKFT
https://lkft.linaro.org
