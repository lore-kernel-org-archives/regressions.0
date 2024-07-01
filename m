Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADEC38397
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828337; cv=none; b=fYGSyiVK3huyPcNwMBTeQesR36/QDow21t+xMF/8NXx3hYeb7becpb33YwlhrqDTexCoanNHnDPmTPAYyOR1+tvPm2eUraaMZM7KPj65WEjB3VcQr7FNPuV1Kv78hPEATTt/R01iCZvFuUJujerP0MCMXwhTeb1TEtpiXvLwIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828337; c=relaxed/simple;
	bh=PcbjUIaNFUdO8prWOO3zwLLEe3a64pHF28ZtjbLenhA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ijdGAIbELXftqUyHB8/3gSDD/1fOPhwVlPmJ4t0jLQjm2kpTsyuKRo+pXG1r04w7jCTZRxLCg9P5fvqluzAZGePSc73SJ9Wb+Jo6XiFHYDzBLYw+YvidX+HWBLpYf0h6rSoK71y7HswjD7kywUvY0LhAU6LlKihTn1G+rwHEu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7cPBJJ3; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7cPBJJ3"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-80fe89eaa4dso1092484241.1
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719828334; x=1720433134; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4DXBAWMyQsPIP/BlZF0MhKJYIvvGxN8nErZr4nhF+E=;
        b=v7cPBJJ3YBL8Ygr2nYOyzv9QfAK5c4RewpBUah0jEEQBHk82I41jz7x/cPFtgLVS73
         6y0qDxjn+DOwGb+hUTuQm4MzEk7g5QErWAFrSZdZhAZBebquB9534qMJPslGhMYSj0f7
         1OOmibj2396o99wOSTlPrMGQCdUwjN6b1M5oM3OAv6MXAb2xUWaWPTz5QXKE/Zxf0cZ+
         TFOciuc5jk7Q4C8uo6euQxX7iWBXCz4y+JIXaJZZ16/J4NXDBH0s02PHmLYeMEX7iKm2
         ahgobEuhYs7sB7r6Sxiot6bgdTjotk8ofDaiLRVebjw/xqqZzJ4F2/F05Oi8KKqU4ojT
         E5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719828334; x=1720433134;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4DXBAWMyQsPIP/BlZF0MhKJYIvvGxN8nErZr4nhF+E=;
        b=Oqd4hUeakBae7AZA2fcAZ4PknQhY3/uiu0hgahbIoIu2NDuMQWXDGwzwl5wrxfDTY8
         /+2wzgV3QW6aCvsw+N0SetAUG6jvN7yWTut6A6MM6zg/xTztmPLvHk68v0pBFlLEs7V7
         cLsrA/6H627+C4U1wRjjQhC4BEQporEMnju/y9aNsjCTnq3KeCsxMM/05CwNICYDpQTI
         1qXeyNwAlca2qV6miE0DiUCzLD7VwivLIAS2SD/T+hBSmssP0AK/uQquh91LtlERm1oG
         Qytb3yOVY3nHx8Ke0ZX+59oTYBkKc0fprJzb5o6AQEt2l4LOawTrAks6dc/N2cDjfV4B
         hiwA==
X-Forwarded-Encrypted: i=1; AJvYcCVaF/WND+zJLZtUu16+PCjnwlzBPyDTJhL42Ij+PIPljgq3uIiMojM/FXRnRuHoE1IwGTIruMxcnVgL2020ic5iNCrUM6q9MMyXges=
X-Gm-Message-State: AOJu0Yxfmg+vv7X9BWfMtd7RYAknhU/jrnNZtVVuTwySZD8XsDeQj1wo
	AVcX4IfrE+eexrXP+lqnrPod+19eIwfKgbGVK2CFDxjhmoIpMuPhu5FOL+37PdYRf247Ex4/llC
	02JchzHw2zDlbZOk+9ncoVOGfpfdy0+fgbpXZxA==
X-Google-Smtp-Source: AGHT+IG/UJLtDpqLnWBEhTMwLbgorI6NfFHGnvnXUhY4RXRD1i3Q/9cj2Xrr1s9Ry+0T5PQVhvZc+dVzAoKpfP89VE8=
X-Received: by 2002:ac5:cd4f:0:b0:4ef:8574:ce18 with SMTP id
 71dfb90a1353d-4f295e9d7cdmr4071960e0c.6.1719828334606; Mon, 01 Jul 2024
 03:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Jul 2024 15:35:23 +0530
Message-ID: <CA+G9fYve66bw-4xVrJnfeXtRV1et1UhEZMFAvvTXbKB2-m--fg@mail.gmail.com>
Subject: mm: gup.c:2827:22: error: conflicting types for 'try_grab_folio_fast';
 have 'struct folio
To: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mm <linux-mm@kvack.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

The powerpc build failures noticed on Linux next-20240628 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on powerpc:

  - gcc-13-maple_defconfig
  - gcc-13-cell_defconfig
  - clang-nightly-maple_defconfig
  - gcc-8-defconfig
  - gcc-8-tqm8xx_defconfig
  - clang-18-tqm8xx_defconfig
  - gcc-8-maple_defconfig
  - clang-nightly-cell_defconfig
  - clang-18-maple_defconfig
  - gcc-13-defconfig
  - clang-18-defconfig
  - clang-nightly-defconfig
  - gcc-13-tqm8xx_defconfig
  - clang-nightly-tqm8xx_defconfig
  - gcc-8-cell_defconfig
  - clang-18-cell_defconfig

Build error:
---
mm/gup.c: In function 'gup_hugepte':
mm/gup.c:525:25: error: implicit declaration of function
'try_grab_folio_fast'; did you mean 'try_grab_folio'?
[-Werror=implicit-function-declaration]
  525 |                 folio = try_grab_folio_fast(page, refs, flags);
      |                         ^~~~~~~~~~~~~~~~~~~
      |                         try_grab_folio
mm/gup.c:525:23: warning: assignment to 'struct folio *' from 'int'
makes pointer from integer without a cast [-Wint-conversion]
  525 |                 folio = try_grab_folio_fast(page, refs, flags);
      |                       ^
mm/gup.c: At top level:
mm/gup.c:2827:22: error: conflicting types for 'try_grab_folio_fast';
have 'struct folio *(struct page *, int,  unsigned int)'
 2827 | static struct folio *try_grab_folio_fast(struct page *page, int refs,
      |                      ^~~~~~~~~~~~~~~~~~~
mm/gup.c:525:25: note: previous implicit declaration of
'try_grab_folio_fast' with type 'int()'
  525 |                 folio = try_grab_folio_fast(page, refs, flags);
      |                         ^~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Steps to reproduce:
----

# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig cell_defconfig



metadata:
----
 git_describe: next-20240628
 git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
 git_short_log: 1eb586a9782c ("Add linux-next specific files for 20240628")
 arch: powerpc
 toolchain: gcc-13 and clang-18

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2iWYcbTLGMcGuxl7caQ3jwv9C4a/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240628/testrun/24464887/suite/build/test/gcc-13-cell_defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240628/testrun/24464887/suite/build/test/gcc-13-cell_defconfig/log


--
Linaro LKFT
https://lkft.linaro.org
