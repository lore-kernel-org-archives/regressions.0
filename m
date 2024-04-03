Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ED85B1F8
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712129903; cv=none; b=UZ5/u0ioaetUM7g8N0x8n25ZFYA2/cQD6vFBnFlT09qHOzxG/Q5YE7gVqUPEYB910BN/70WQBePLw22HLs5RLzlX4lmINWZZMS9s5SlYaDM7f1S9VSC6lscqcDml51dhtoGQwswLh/9ihg+SGJmYYnsAomLOFgO5pk2LLjwfSys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712129903; c=relaxed/simple;
	bh=9WbOVVSwUWwd5K793ppWlQLxaj4rX8ZTjnhFhq5Y5v8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cpRZQ1+3ik4ioJf0wqqIu91TgMSdxYuXgAU9Pm3A299OjklAT8IjPh6jIQXt8inR8vit3JAVM24HoHXoKkpgY4SWGUBe+E3FxXLuqByefezjrrxwZJ/vu9qsFKHZcgflzQUwZr3vy2ci+3oO+Qv3bmn+Cn4Bp+Vo3+vhOnVaiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h5jTtbEx; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h5jTtbEx"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7e3b3e33ae3so278980241.0
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712129900; x=1712734700; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QKsiTWwQltevYA1r+W4p6ubtTr4MlTT13dNzhqyl5yk=;
        b=h5jTtbExD3olT3RfzP00t/JzotC1K2JGqcnUMVxx5T+qexjEu+4MgEXZy3GCdSfMne
         hesjJdY65uik9UPUVyuAzA/7STFwCzVIGXMf0x+5GBXD88m3NHBBlLYlQlRLXJHPO+Ek
         sOI19L4I34Mxz1aXqR9tQjSN0D9FpFU7+KG/7WiaT61Ov7wBOd5nn9RH0e/r+1ekHx2u
         WODxxtn2DtIS7fgzQxWUI6grllQIS38nI8vUnxqF14zsIWfqwIl+BcWlMumA0upNOZLk
         nFvtUlmQCAwg7zWHd+itA753PmgCsnQaxRJfC7EeXWX7t/VPVwcqpjtnXvIz2xb/VSO9
         fh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712129900; x=1712734700;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKsiTWwQltevYA1r+W4p6ubtTr4MlTT13dNzhqyl5yk=;
        b=LH9mNyOsfwAABQrtZsA1FAs/XlskMleLDKlG2vR+BVrcqURJVeOD/UAG6E/cpWk7vy
         EA+//y7AtB+ElORAnx4jn1kOrN8D4NVplQk1TgHAFxsAYs/586EH3nQiMfdk87fbGhdQ
         lr/6zPz9zUeM1xflMJm8enQg3qSJ1c6TTif3LCED/cccDZ1AHB3f1ljxY0GdX21iGwwu
         VWDPIJSaHgcZmX5CHj09b8C6m7em/HPl/9CDrpioSoBMgcDEOSu1Lt1LtTBdiS9O8MNY
         q5ymZLMbIZ81R3VgngWIkkgWYHhA4VC4eRCM8GxNPQvE6vdUnGtW1wqcj0MRM7QntNAA
         qDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKHNzxsKC53dooh7uDH098k5uzgECbe5gncNfi7WIfvKXmfOwzsmu0OEO2w2A5KV23pAZKpvgaI/RMDpIHy6SvaUoAto8Rlh3zE4Y=
X-Gm-Message-State: AOJu0YynQwfKuARtz+gsKSGv3pCANW2EiFrZ4QtoakW2F3tDf/wES4MP
	VqPWe/EH0f9fl8Uj8b4DKbabJLeKO+kB6QnpaXTmn9KJDmQNpS1BZ8W6/7gZysKsUs+eHcVB0Ps
	0TeuJI5+ckFW0Totsj2zUMbBV6HO8m0WDuLWyzA==
X-Google-Smtp-Source: AGHT+IEDsnkIj6HCOWhXVjqLOlYJRYneScfnCc6Qn1cRIG8coLw2kTdZBaOy3HnsF7h3qlnpsiRbKmaYqRzZ9wPLo58=
X-Received: by 2002:a67:e359:0:b0:478:32e2:1833 with SMTP id
 s25-20020a67e359000000b0047832e21833mr11298728vsm.22.1712129900501; Wed, 03
 Apr 2024 00:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Apr 2024 13:08:08 +0530
Message-ID: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
Subject: kernel/sched/core.c:961:15: error: incompatible pointer to integer
 conversion passing 'typeof
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux PM <linux-pm@vger.kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

The riscv clang-17 defconfig build failed due to following warnings / errors
on the Linux next-20240402.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

riscv:
  build:
    * clang-17-lkftconfig - Failed
    * rv32-clang-17-defconfig - Failed
    * clang-17-tinyconfig - Failed
    * rv32-clang-17-tinyconfig - Failed
    * clang-17-defconfig - Failed
    * clang-17-allnoconfig - Failed
    * rv32-clang-17-allnoconfig - Failed

Build log:
-------
kernel/sched/core.c:961:15: error: incompatible pointer to integer
conversion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node
*') to parameter of type 'uintptr_t' (aka 'unsigned long')
[-Wint-conversion]
  961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Steps to reproduce:
---------
# tuxmake --runtime podman --target-arch riscv --toolchain clang-17
--kconfig defconfig LLVM=1 LLVM_IAS=1

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/log

--
Linaro LKFT
https://lkft.linaro.org
