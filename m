Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239222F1E
	for <regressions@lists.linux.dev>; Mon,  4 Dec 2023 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXaZ4w0l"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d8d28e4bbeso924192a34.3
        for <regressions@lists.linux.dev>; Mon, 04 Dec 2023 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701691727; x=1702296527; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=;
        b=QXaZ4w0lffja4Cv8gkN07wPP1fmMYGKk7ESGzDeOHVWa5SMG4pHOpPsmBXbyxRDTzm
         qSaMePLbLeyFq67laQUBMs4GSXKdHP1OwG4+f9/D69YVOigg9Oow4iZV7M+VM7sj2XiZ
         NaqfYTYBRcAsTWu1atMk2Hi497rfrHUeN2qjPiTfgkEhSVQUz4YQFt0q8/TBM6C7s5O5
         xd+uWY5wTNFSKE+GUp+jQp+//cH/H0lLDw9FzgnO+xvkE36CKfVbgaqeQb2HBZUaeJm/
         /1Sbqr6AXjiMAdHx0ZdTZT6fELtY4Z/0Fadh0Y5qVcBxbaZbumJS/0+lxRWARSVy3hNZ
         CzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701691727; x=1702296527;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=;
        b=bBhzNQmbO9ZhxS0yYujpCW7WzsWzBlfZFZL/HpZzDCxMizXCYrBIzjsRCdWVnNLdMl
         1IdOphtbe0zLaBV0RLIYZ9BAInBEWwmDj0pzluLWg8VbHE82LICvO3+dsJx8/Khx+pse
         5Ofuy1zeyPZ9RRB5vQS5NftmNyvA39bP8aiRaEY0mJFtZ3pwrZfUVeHTyILyapzyDZBV
         F5l0BJtY8YJCkBJSHflrfGhpg9nyWcZ3u49OUyZCMTzEolMAZ06kKQWAsTEZcf0XyamS
         P+PdI7DmM+1GiePJ/VI8ByPvPUL3CIY4bCbUjB+ETUyG4jLod2GyMsk4mJHVB+lEp+Kd
         XY1w==
X-Gm-Message-State: AOJu0YyJuno744/X8SOzLJL3dKFdB3GyCt0ijdWmTOJAk+WzpuK/Ynw0
	a2LD7f4uO8bfNKfNnel9YSlt9DtNcVzlx8yIpteWUA==
X-Google-Smtp-Source: AGHT+IGpxhG9ncEHtpz4tZmgtmPIk7IOrxR6wBSf/VSlVIlLP3HqVCGl9n1/Gfb0hG0y3KjTRRQ8IEEqRzi+yhZ9cYg=
X-Received: by 2002:a9d:75cc:0:b0:6d9:9e2f:e743 with SMTP id
 c12-20020a9d75cc000000b006d99e2fe743mr1360919otl.16.1701691727048; Mon, 04
 Dec 2023 04:08:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Dec 2023 17:38:36 +0530
Message-ID: <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
Subject: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error:
 initializer element is not constant (struct group_desc)
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
for arm and arm64.

## Test Regressions (compared to next-20231201)
* arm, build
  - gcc-8-defconfig

* arm64, build
  - gcc-8-defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log arm and arm64:
------------
In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                 from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
is not constant
 (struct group_desc) {      \
                     ^

Links:
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2Z43zPIMN6vxVKd9rKJFdOKXpox/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472198/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472585/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472800/suite/build/test/gcc-8-defconfig/history/

Steps to reproduce:
---------------
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig



--
Linaro LKFT
https://lkft.linaro.org
