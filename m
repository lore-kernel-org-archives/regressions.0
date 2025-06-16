Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8195F2877EB
	for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080984; cv=none; b=obBb1nLmLwJOC0HdJfB929rKXTCZtRLyE0aFGYmctTEEpxC7uGMJbFnsZx9L2mWKEBSPI3fckeeAJ1+MRjx12jwUHFj+qx678jwAedVKU5/sQKwdLmHe+tPCL4a2RWRTSz1187FYwoJgGkEivmDNppCh4yZH9kypeRBV3WoOanE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080984; c=relaxed/simple;
	bh=/+idoE/lxLeCl2JtJe6gPh2aQ6s2yMmO2sp39/Hq4LQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6KHiwTEL+evxr4ZZUNILAaJTz0dKKWmbIv2RSH/XEFlGF730RvlurINdep4t20Y3TaEiOOuBfklHvkQ6RtQ7ZppCc2cphPnj4Dm8O3yBKvcvzcQduWOT0pbe6/wpQZSgrW9U9Ss3SAUcWT8KA9QsKsilAoDRph36U5YICxwMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RMpL7216; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMpL7216"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7f4adaedaso767236137.3
        for <regressions@lists.linux.dev>; Mon, 16 Jun 2025 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080981; x=1750685781; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VAKYpzBXefjsewghnaRDPZDlVtldMHNII6S2fBTACcE=;
        b=RMpL7216llJEtUNxckRS826xGJD+SMOx/pV6/nJvTUlY7r3sBvCy/x9eHxNd4eLoiu
         gSDttfsYEmVgQoRX3d0ZeRhb7OJklzDv4Rpp45dzE1O4mu2XRB1WXBHWcPaPKoLaXHRO
         BQyd3u4JFqPT/LkKDmgf9tIgJu/BoWkAVlaQDKfrg9uTCYjDmcrEc4w1A5VWrYhQQojf
         Jhaksx8KI8MsZMOiocNBaWr48DrucgnfjS6oRY+E46/KJRgwB622AsNZFrDfYdID9M3X
         hdRbItvkW8E2/xOrQAq9KCNQjSmoCgkTtuXI7aYYjJbkSBuN17IejQSYHbm3FhbeJLNo
         VSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080981; x=1750685781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAKYpzBXefjsewghnaRDPZDlVtldMHNII6S2fBTACcE=;
        b=ikz88ZlC0BKi+WYD7C8MqeG2BHSuL5cnHpQqqMK3v3Z2V80SUpJO9Oh16JIgTsf1L6
         J989om+z2HuDzFsnS2ve5DlkFHap/r8wexgHiJB+u7QcxKeTeyRk5xtq506MJgJ8t2rn
         25EmHoqhYaIqeubd6juEZW7dodsPiHW5W66iNFXNP4dPc7Ix7oK6yI5EALRDup9Arnbt
         J8ohUVNmYiTcptxgMe+pRs6tSm1+Es4h3WCLu5wrYz1UC/BkgjodxEp8DmbRaFOjTwkq
         4weyLMcrdYeLsbF3siU9rT6V7TyXtVVvjRKiwpgOkG10kS5COA84SKvYwHi3JLHFrZBi
         hOHg==
X-Forwarded-Encrypted: i=1; AJvYcCVORvJ2GjyXrtolUxXYAHZuV6ATiw7V1fAnEcb6VDwGpHYd5QLKKrTmoCrRnAVZc7ZPFz6XASvir9kECg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr98wLK+bMfv1HG/I1h02OOCWC/3EhAj4ohnOe9qoJR/IxUzmS
	tn30281BHa1PGcAUFxZ/RS32lo+1Ka+U+s/qBFQ5FCQ8NhSvNsxlSuAkRa37uFfGuBdh8kFwTl7
	X1KyXUzrNZOqVgRJbacKfC6PSQta0q4neY+UOKpS20w==
X-Gm-Gg: ASbGncs9cbU/GSuSgGGmEUVcsUnRtwYjf1GGFV1HEGwje1o7+X/lPbzkhZfkvaSnKuI
	tBUw2FMGv/zpKchJKQpGwQq4WjOaxYGUSFUR+FVnNVJ9fHU31YwL02fCTIOvgLqrqKUWvW+4Q/S
	ZosmsXTf1tSICnvOB3b7llEh7HaikEbfR9faDEpdwelKDnnwiznWssLh4OXbTUFEIAIV9tQhNof
	6Wv
X-Google-Smtp-Source: AGHT+IFjLddFL80fWZC8vtshfMJbUrfVgeQJ3XiDOZyHT7t6Zgm568hBaOqMVNU/MkIqnSqDCwMMu8ds8ugaE3rTBR8=
X-Received: by 2002:a05:6102:26c2:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e7f61c6ecfmr4938693137.16.1750080981324; Mon, 16 Jun 2025
 06:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuDOnN6TrcVYcMZT5UPNc34mOHQZsfyFvpq+Ndhz8p48w@mail.gmail.com>
In-Reply-To: <CA+G9fYuDOnN6TrcVYcMZT5UPNc34mOHQZsfyFvpq+Ndhz8p48w@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Jun 2025 19:06:10 +0530
X-Gm-Features: AX0GCFv0xdxpPep8RlLL46Klw14koqqEINGKyWY-3_14LVoll_HdAqjvhj2iHm0
Message-ID: <CA+G9fYuu5r34=bndUYWNxe_yLgBaPGXmK9WP3WTtoXMs_2LX-Q@mail.gmail.com>
Subject: Re: next-20250616: S390 gcc-8 allnoconfig mm mempool.c In function remove_element
To: open list <linux-kernel@vger.kernel.org>, linux-s390@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 17:36, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regression while building S390 with the Linux next-20250616
> with gcc-8 the following kernel warnings found.
>
> Regressions found on S390
>  -  build/gcc-8-lkftconfig-allnoconfig
>  -  build/gcc-8-lkftconfig-hardening
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> First seen on the next-20250616
> Good: next-20250613
> Bad:  next-20250616
>
> Build regression: S390 gcc-8 allnoconfig mm mempool.c In function remove_element
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build errors
> mm/mempool.c: In function 'remove_element':
> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably
> doesn't match constraints
>  #define asm_inline asm __inline
>                     ^~~
> arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
>   asm_inline volatile(     \
>   ^~~~~~~~~~
> arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
>   __EMIT_BUG("", 0);    \
>   ^~~~~~~~~~
> include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
>  #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
>                                                          ^~~
> mm/mempool.c:149:2: note: in expansion of macro 'BUG_ON'
>   BUG_ON(pool->curr_nr < 0);
>   ^~~~~~
> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
>  #define asm_inline asm __inline
>                     ^~~

Anders bisect this build regressions and found,

 # first bad commit:
    [45c79ca947c936085c94b716be92eaf9a1bdc8bb]
    bugs/s390: Use 'cond_str' in __EMIT_BUG()


> ## Source
> * Kernel version: 6.16.0-rc2
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
> * Git describe: next-20250616
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
> * Architectures: S390
> * Toolchains: gcc-8
> * Kconfigs: allnoconfig
>
> ## Build S390
> * Build log: https://qa-reports.linaro.org/api/testruns/28763376/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250616/build/gcc-8-allnoconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/config
>
> ## Steps to reproduce on S390
>  - tuxmake --runtime podman --target-arch s390 --toolchain gcc-8
> --kconfig allnoconfig
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh
