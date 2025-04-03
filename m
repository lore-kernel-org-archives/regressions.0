Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F624BC00
	for <regressions@lists.linux.dev>; Thu,  3 Apr 2025 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678493; cv=none; b=ag47Kp8YY2ko75WxnwYGsF5K+kA6BNcUItTJiqYPmWFmzxWzozCnLCnzh3C7TINmDC7W5WPAIhGR3aKqphBtnz6czme79Ke9DEoUO2XD4CMYVI5GfLKqbtqj11rr1hulSSksYNRaUf/oYFga9UG8VwW2wi1HbPq+bGmRC+cR/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678493; c=relaxed/simple;
	bh=UeIf3gDzNnrDJ+aG9WHGpvz1ocmpXTtX+myrbYbpoIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Anpwp2BF0vRUWaMbdVfNUwP3WawZP8SKODvPoGWA8WKwh1G5mYJA4HFa78GT9nyDA3IogiN6X+FJRRuyw+YXMI5Sa0d8YC3LhFaj5fDj1WtRvbGVs42TawD5mYcY+jTQafrCwjXPpgoH4eploLhZaGfeVVy5iYqVrMdbRrtnSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJlsDE0n; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJlsDE0n"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso1789540241.0
        for <regressions@lists.linux.dev>; Thu, 03 Apr 2025 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743678490; x=1744283290; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xlyDq4gIl9Lr6ROGOTackUkIONaMAtJFwwX5SOMUsOs=;
        b=JJlsDE0nUJGQbCwsJUX7cy0/rvAnm1LzrPTeHw25PeG/yjxzUuiQZ3x1vn6K1o1wnI
         uL9MhKKZNT1/HZBLuT6A27cGk97jj5qwqrA8oGXRl3CXFTZRy4sXWG4PrQWRFbMwaLy0
         gm3fGGUXWfnvun5kuvaUXlhWDpaoJxzLRqRv3n9LnPMQYvnB/YmkxPUsZ4yBN2qBK+fU
         2WT2Ykq9XE9Ht6fm1jJ/JkPphbO/Ntj7xXxUh9I4uxCt3BU21v9WEh9hYhU+4U8HhYBr
         sQwpNyq4frAi8SW+KH7+iOy7xnqj/BhN3pi1Y5X4Bss44Y4aQOnMx8ZQhrkONPrjAmaA
         CoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678490; x=1744283290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlyDq4gIl9Lr6ROGOTackUkIONaMAtJFwwX5SOMUsOs=;
        b=mM3EcjNSPq9DAvAYfkCWo9ynar24G4wZYMd22mKSKm3/Sc/ZKc6MXyHi3NVVlzrBO3
         uHpvWqiCAt2Zoch4Ycwqcs2OQrKDGS8+yU4mYtUYrmpGGitH2Ndij4JhWUW9HERTD3DM
         uqCUaSV9mvpxbtPgcMSOhVbTqUwaMSH0cKizfbhnDRWWLlvZjTQoxUAYgcqReyOjkVXu
         7gxWnJGGrseL/EZ5dZ1hG/rGb/fJnfGcpZJ4Xv+wtbvrl9uMce7O59Mf7AEt8K7F53FL
         z7E3w0hGbcsEoBD96kUovuKEjMfYkY4MrrXowrp6KXdMuZRIb+t1KRkChISFJHFF5mCe
         DjbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyvz71VPi28IhMu32A+CmETFrJk9b3D3uRk5j0KTgPBCJLg7+GOgk0FrhFY8S1HkYdUWe/ag4vy5In8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6WAhlktGIXJtAGI9rRmifTupW4m4UBOtKP/+F8LPi0SsO89Ew
	p8TYtJgcbGc2xafC0AUbKKWg41yB5Xjf9E/Stj+w/3ZcIrh9UEHxlxKakFMRral/aijyUykein/
	T+4JxJmYS/xALLcnPa/qSzgisSmmsD4snIWexWA==
X-Gm-Gg: ASbGncuK4Yk/00DCMkTzkrBSpF1X4D2FfgLqAc2992KLXn0PDqqsie8XCw+/rhwVQeM
	WO3qZ7VI8OtSVN4SpxzrGH9W5G48XCFTrlZFtckFSkPB0PWmKzZOqHpV8eVUg0wzxa0Tem61Hp/
	Klwtvh/3TnbrBygx+clQExuoCSJ23tPIHqEKacW3lkhCWNDSl5gS1C6p4Clw==
X-Google-Smtp-Source: AGHT+IFA6KPAr/9JvLRrdPpJRg6g6D0xJChBb1HAxmoAW7jS9u/YJ2IJribqwlFitpYlfu7S/vxo5M+KHizDfy/TVbA=
X-Received: by 2002:a05:6122:330d:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-52756b10bf3mr1945335e0c.3.1743678490066; Thu, 03 Apr 2025
 04:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com>
In-Reply-To: <CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 16:37:58 +0530
X-Gm-Features: ATxdqUH8OMQ6KdpRKZP5fv72MvdhOmm57r-0DZ0nSqzGCbCvwioKA-IrKMZ5GzY
Message-ID: <CA+G9fYuPHQf2buj7BQ3myGnSQ3yvrhpeiT7LH5rDVtVz1v_cQA@mail.gmail.com>
Subject: Re: next-20250403: x86_64 mwait.h:30:15: error: invalid operand for instruction
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"

+ Uros Bizjak <ubizjak@gmail.com>

On Thu, 3 Apr 2025 at 15:50, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on x86_64 builds tinyconfig, allnoconfig failed with toolchains
> clang-20 and gcc-13 on the Linux next starting from next-20250403.
>
> First seen on the next-20250403
>  Good: next-20250402
>  Bad:  next-20250403
>
> Regressions found on x86_64:
>   - build/gcc-13-tinyconfig
>   - build/gcc-13-allnoconfig
>   - build/clang-20-tinyconfig
>   - build/clang-20-allnoconfig
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Boot regression: x86_64 mwait.h:30:15: error: invalid operand for instruction
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
> In file included from arch/x86/kernel/process.c:36:
> arch/x86/include/asm/mwait.h:30:15: error: invalid operand for instruction
>    30 |         asm volatile("monitor %0, %1, %2" :: "a" (eax), "c"
> (ecx), "d" (edx));
>       |                      ^
> <inline asm>:1:16: note: instantiated into assembly here
>     1 |         monitor %rax, %ecx, %edx
>       |                       ^~~~~
> In file included from arch/x86/kernel/process.c:36:
> arch/x86/include/asm/mwait.h:95:15: error: instruction requires: Not 64-bit mode
>    95 |         asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
>       |                      ^
> <inline asm>:1:7: note: instantiated into assembly here
>     1 |         sti; mwait %eax, %ecx
>       |              ^
> 2 errors generated.

Anders bisected this to,

# first bad commit:
   [cd3b85b27542968198e3d588a2bc0591930ee2ee]
   x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>


>
> ## Source
> * Kernel version: 6.14.0
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: f0a16f5363325cc8d9382471cdc7b654c53254c9
> * Git describe: next-20250403
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/
> * Architectures: x86_64
> * Toolchains: clang-20, gcc-13
> * Kconfigs: tinyconfig, allnoconfig, lkftconfig
>
> ## Build
> * Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/log
> * Build history:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/history/
> * Build details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250403/testrun/27871165/suite/build/test/clang-20-allnoconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2vCvvmy6fhzm3aMcptKXHvRi4Bp/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org

Links,
 - https://lore.kernel.org/all/CA+G9fYtzOxx1YWz2X4UYqvxB2vg7ptz6axmz-5HFLD9ieSjURw@mail.gmail.com/

- Naresh
