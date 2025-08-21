Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DB30C340
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755774528; cv=none; b=RwtJd0LTCb86YnJsvzINhdyKs9W9oosozcvy6ElONDqzADv1r0lNw74MAhDfZ4aqzA47xRIWyfVE82SNRvDHWpo4RM9ae0dQXZHgKQjymjj1/TY4q2wy+IvTgMYC4285U3FnDAOXDPTy04bzuJ52nNSdE9rWH9FBS6MBgDPWbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755774528; c=relaxed/simple;
	bh=wo8fFKRkmyhr5A9bJwCdfaCDsrAwCqyfhGhNWQU/vBQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r0EQc9nx6Mk2/8zsQd5C5plAiG+zP/SRvlCd7fW92WgKVMa/93uiXFKsfUofKULFkSJpo4xCSyjTsMIdfj0YrmOb2gG8OF1Mok3pt63/hf8xF/OGJSwrgEglCJZAoT9twur0iMR5iUUN/AokgeRm2OWwfrHbd/+79plhU+lau6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q6ljF4fO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6ljF4fO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2445827be70so9351705ad.3
        for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755774526; x=1756379326; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pz2lRLfqaRELH/ch1+xtt9bzWUsIFWaw5ujjaHxpXSw=;
        b=Q6ljF4fOlmqdVeIBxRo/hHI+pn7Nk29JKyKjUzRDagga9AQl5GkC9ao/uG2oEItF9j
         nqkdvDtb95Gas68imn1vYfWMRLvol8dyhLWuzkpGoMsEbUnO9cmOUmFBwbynM5RLIR1O
         Joc9pNuENLYcB1Yf8APRZ79FLSAFwge2J4tuWuV/kMZEb7btK6gexb+5Y0EQw7aJOTrb
         rCqN+sA9FZIynMaCF13b+wqqsSYLMvBN7Z/7R5LdEg7qsYXaEvluCvWggvV17mhGbM0V
         EurcPsdC4hC/s9BQuRWcrbBeQc033D/5J4qG8bMPo8SPza6Et03/Dhn8Wyf/ciTA3YTF
         8fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755774526; x=1756379326;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pz2lRLfqaRELH/ch1+xtt9bzWUsIFWaw5ujjaHxpXSw=;
        b=VVJweIgrnvz/SCQm/4ZFQOQnn1dSLp8mvB+SXPYpQP44fUtgppFQS5F6OYesapvude
         U1sl7YSb8tvuGBwSh4Zq53dlN0HZlNmHq9sRYqPCtxCtMtpptdo3Xg7E7sxUPjmgLVVY
         y23q4dHvc7qtCSfTzJH69egHUY/vydJ1KrfqGRJPJpdk8Oz2Ev1f5V5hGhtecj6Yaoc9
         3XwCuqpD0jKuRrewKH4DsEjRmFD6snXAnT6xFRECTczVhxj560hebXwqhJ6W1JcUeP5q
         sznAYpkzQRdGDXLeVmGernHWwgd41QTwQd4+J1quzugnpLVGeGeJuDKMGUGH3LD18KSq
         SSiA==
X-Forwarded-Encrypted: i=1; AJvYcCX0wJfdHMEbG5Qs30OjZ5I5a9YRhydU0pYOhzWdy1el4GC+80G3R4NK/cqaIDnqLXePpGynqK1GSkxvhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIOlx+PI0YFATWBlZA+EC5ifTErGgR3jnhqGILviyGUN7ZeVUl
	wMhKgO0kRy61No9F99CMC/49F9nEks3c2XtW+4BajMUYKvctgDP26w/ruU9xn6CMlW7YACnvV/Z
	fa9efljgwAiwENZgoQZ7sTMrHzVBh43hep/K7q6kYeQ==
X-Gm-Gg: ASbGncuyunSbClIwmM8sEcIoNvXgaOBYnk7eMvIUB7mZM9QkgWUIv/6mx/6PYgDNP4d
	nX87/C9htMtUTZMPYNU2/+hYrJcPRjX/fR0+h9Q01j0Xme4ZoONsodRrZhT77h6dzBVHia5gLVd
	sfR/MAfWiLKLvhDP30CzDlJ31YCu6eWCSSKe2NJv6XTd+3CXkSavUnVIjcwJ4cYnJSluC80kZKX
	3bngNatHpudplAGFB8Z9CauM0W37WDXkT32hQ==
X-Google-Smtp-Source: AGHT+IGqJIXkeZ1cPE92KQPkVZFoOov2gyYnj+M9lqpBVRW5SAgiAAGuqW38eqvgWo6dJioAKo2uIFcmCS3PrSxJ3x0=
X-Received: by 2002:a17:903:3d0c:b0:246:571:4b24 with SMTP id
 d9443c01a7336-24605714c82mr21886425ad.61.1755774525706; Thu, 21 Aug 2025
 04:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Aug 2025 16:38:34 +0530
X-Gm-Features: Ac12FXxrwC8J1BsX_IcVeNAB7p8j33bNwbFGted2nZTmpvEH-5C9tgp38KBgcNs
Message-ID: <CA+G9fYss3ztUGNvEu07Veck+09Lsied5TGbb-2fSw8H5wxRaJw@mail.gmail.com>
Subject: next-20250821: tinyconfig: kernel/panic.c error: implicit declaration
 of function 'panic_print_deprecated'; did you mean 'panic_print_set'? [-Werror=implicit-function-declaration]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Petr Mladek <pmladek@suse.com>, Ingo Molnar <mingo@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors are noticed with arc, arm, arm64 defconfig
with clang-20 and gcc-12 toolchains.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250821 tinyconfig kernel panic.c error
implicit declaration of function 'panic_print_deprecated'; did you
mean 'panic_print_set'? [-Werror=implicit-function-declaration]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

* arc, build
  - gcc-9-tinyconfig

* arm, build
  - clang-20-tinyconfig
  - clang-nightly-tinyconfig
  - gcc-13-tinyconfig
  - gcc-8-tinyconfig

* arm64, build
  - clang-20-tinyconfig
  - clang-nightly-tinyconfig
  - gcc-13-tinyconfig
  - gcc-8-tinyconfig

* parisc, build
  - gcc-11-tinyconfig

* powerpc, build
  - clang-20-tinyconfig
  - clang-nightly-tinyconfig
  - gcc-13-tinyconfig
  - gcc-8-tinyconfig

## Build log
kernel/panic.c: In function 'panic_print_set':
kernel/panic.c:954:9: error: implicit declaration of function
'panic_print_deprecated'; did you mean 'panic_print_set'?
[-Werror=implicit-function-declaration]
  954 |         panic_print_deprecated();
      |         ^~~~~~~~~~~~~~~~~~~~~~
      |         panic_print_set
cc1: some warnings being treated as errors

## Source
* Kernel version: 6.17.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250821
* Git commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
* Architectures: arc arm arm64
* Toolchains: clang-20 gcc-12
* Kconfigs: defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29616870/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250821/build/clang-20-tinyconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31aRY2vQ0cMol9wA63TKkoCPsxC
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRY2vQ0cMol9wA63TKkoCPsxC/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31aRY2vQ0cMol9wA63TKkoCPsxC/config

--
Linaro LKFT
https://lkft.linaro.org
