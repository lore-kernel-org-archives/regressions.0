Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C413AD2F
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714422536; cv=none; b=empi8t9MIIJUC97iekzENq1wgb5Be4XJx0onsaIj9o6Jv6JRkOP/12mN+E3R8digyC6CsFgpiEHFLt/Jr5i8wKMJh23z4qhVS2ULkXdJ1Ih1Zi///q2Q3lAhedYH3RY9ILTsYG6mxkcJ0/65M6Kdi5TuxkhJcwJvSIBWt6r6Rfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714422536; c=relaxed/simple;
	bh=qD9fA+6x5YEjH6N/bnfv4m+coO6ZZOEi8S65u1eBRvM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=egOr4SzCg7LlAwUeTnWsQZtojC8saBuFnhCDsB9GXI0AuUEhmLd6rAgh5Ht7T0TM+iTayvt91529XodY6DDdNpm9CY/oCaZyh/GzP9v5Z6JCDMDzRFezh766uHRhbjdyO3p6fryu9WrAoU1bGMZZUqGkxUEWJWvU+s9T8qFXE7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5g+1/uX; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5g+1/uX"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4dac6802e7aso1077420e0c.0
        for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 13:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714422532; x=1715027332; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lKuZuU03NTynIqlQQqRGb6a67x7v1EBlFYJcjyUFQ04=;
        b=e5g+1/uXHiui7QCPFXYle1zPcMHLO2X7kLCj6F/6ckMWPi9i7ub1a4L2OZWggVbsTe
         5UAgcvCsOlQ7qK9fi89Bhigd31CK08XupAagL/xcy5O6Ej9cRxR16RBJviC2w/JNnTiE
         jHO6c5hFU8jltr9HO2IMt+za9nhQBxZYTQDvKilQ5sMAl4VzmscGDq9ALQIf9DYGbWf3
         0wvjKb+PM2YONyEJfE4iRS6xfL7+dN7MnP3QNoLK3g8zZUZyazVJYpraKzpCcehukq0Q
         FI5/d5wTVZt7Y9+x4CSoT/i0v/edzxjNVc6wu7SAG5RJG0ctr0WvffxRppfPOS68yu8S
         4HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714422532; x=1715027332;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKuZuU03NTynIqlQQqRGb6a67x7v1EBlFYJcjyUFQ04=;
        b=a5sNv0be+DH9GhdX+JJcnoc6ZWAUy4+JmrjnQoUD9TtMx6l4cHsi5S0VJmxyrHLGuC
         4c08y/ktk35W39R+kGJuuWkMXnuUqDuZNanDznCbukJ1JFi//PB9ME/H4K10W4jWs4vJ
         fO+AnriKtuEeJwGA6JWWKyeZvzdhD0Pm7kRWbwRdFbSu3BytxgLoxEeBT026bigEiVKo
         N4rcXBm1hst+wA7Zqkaysc8sFeRJpYxNbU0JJp3t3+Vev7jse7waBFNGJ6q9D9UxhpgT
         ZZ2X6otw7NsuHr/+HKTHgnTAq5wBYUu1JmqukQ8qHu6kmWE4Zvx/Xu/dczFnZ/0AA+U6
         Df+w==
X-Forwarded-Encrypted: i=1; AJvYcCVlER1x9tQdRgC4NFg2btj50pxyVxxV0r37AqA1N4IjP+MX06BwKKc4BPBIpCggLlenr8AbLd2Ib6ZpK9ulIVBhgVX8Xd5PpBtwKgg=
X-Gm-Message-State: AOJu0YxDRR+iuSxOMQsTIdpBxIYiXAGDxdwQ8qRqE+oSGuGH+uZcCZT4
	xJFHvjitFjvU0qiEt3XzWhNsU/lsP37OcOXqb7fB9hSnCpN4FFJx0pd+RV/setbu1X9WVfAAFNc
	RkwVS6/5TH0ELlkWcL4A878TIhydxz642++q2tw==
X-Google-Smtp-Source: AGHT+IGWE4dZTf8eDRkrviqbjY4zijszcVXO72v7h15YxEvhFegCWLtOLh372/gBc1wZQisnIMhcKj7hvdbxUkY8IEQ=
X-Received: by 2002:a05:6122:2221:b0:4d4:20fa:eb0c with SMTP id
 bb33-20020a056122222100b004d420faeb0cmr11396869vkb.5.1714422532382; Mon, 29
 Apr 2024 13:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 30 Apr 2024 01:58:40 +0530
Message-ID: <CA+G9fYsXkn3xcdOm7H3+s4Xw_vc0f+uqCbFHHOcQE6OUascTsw@mail.gmail.com>
Subject: arm64: dts: ti: k3-j784s4: No rule to make target:
 k3-j784s4-evm-usxgmii-exp1-exp2.dtb', needed by 'arch/arm64/boot/dts/ti/dtbs-list'.
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Chintan Vankar <c-vankar@ti.com>, danishanwar@ti.com, 
	krzk+dt@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 gcc-13 allmodconfig builds failed due to following dtb issues,

Looks like the recent changes on arm64: dts: ti: k3-j784s4: are causing
build breaks.

arm64:
  allmodconfig - gcc-13 - fail
  allmodconfig - clang-18 - fail

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build errors:
----
  make[4]: *** No rule to make target
'arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtb', needed
by 'arch/arm64/boot/dts/ti/dtbs-list'.
  make[4]: Target 'arch/arm64/boot/dts/ti/' not remade because of errors.

metadata:
------
  git_describe: next-20240429
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: b0a2c79c6f35 ("Add linux-next specific files for 20240429")

Steps to reproduce:
----
 # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig allmodconfig

Links:
----
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fmJ3r7MbjcUn6ZjBeDKT6SpKpH/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23715285/suite/build/test/gcc-13-allmodconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
