Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB7D512
	for <regressions@lists.linux.dev>; Fri, 12 Jul 2024 12:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786405; cv=none; b=L4fkTByPAXNbAnlqZOfZQqkVMLXYnd/OL2j6oUEU3YtUIoJl1FUI3KLhAA+Z6FMChzDX6Fu/Qo24jkEYLVqip62BzPKn+mULGCtPOmLQ9yYByb8Er3cH6FR95nGCELf9ooNHcBBO2AiiocdZZSAYVeKSnpBv4LGzh3ezu9ChkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786405; c=relaxed/simple;
	bh=LBj4SQRwyrE8yY7XesL7tCePMcwxLzLVnEVEAGo/kgM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZvmEEzf4pGoFEuVz/SXqc3bbc51OTU7fVWFK51rxq75CnGkdNIkkBCLYvFSp42vBqUsIAZr9+6EvJFaMTWhFnqccdbnnSjojh/no3paVmj5YXLhJAIfymiSva8eilBkrbwld1SRKj9CDoU9PHgc1pjWn6mrBP5N7Lv9qaEZb9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eFv5gurO; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eFv5gurO"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4f485148d8fso732636e0c.2
        for <regressions@lists.linux.dev>; Fri, 12 Jul 2024 05:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720786402; x=1721391202; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gwhdBjeO0fqelfc4OGEmz1A/F4AWgJGOt3zPASzEWac=;
        b=eFv5gurOfquejORbv0RIKmeCZSbpOR5SStLn7+mSGYDNgJ44BWX37dxJ/lf8M9AIaG
         OKCWbXOr/vGFJQUVHKSfdCCdZ0U905Uyb/FbxIDztRq32gVIv+JJpG1tCD8nN9czd83X
         czuECn5IjbN6W7qsVSAMBHL1nCweibRbo+Fgc7Jvv0VFTJa7QYV7lo0BDW081fD6yJac
         mUd8npxOob0cNKFRG4/lq2du94e7jRW0wZELKCl7RXyaW1fYs/yAMgywsjghD/tjAW2s
         TBvoz+QZj0S/Ysry6jIz2xW/KfWqbw68+5xpRV63lC8UO6K7xIDN+l6WZa5jP26W/7Pt
         RrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720786402; x=1721391202;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwhdBjeO0fqelfc4OGEmz1A/F4AWgJGOt3zPASzEWac=;
        b=HqWUE3AyirQ0ZT3LdZJebjCQr8L7pQDME+7FYqTvRTtBpWSDQh8Bj2Ke0F3BEfwEjH
         EwGqNPfAQdACsEkSfa5VGdMfVlEBcS0cxxvL6c88GuKCkmdUaVdfpWCl3queyNoXAbZ0
         tKorHi+bBuA5WvD0nc7I7wGc6pw70lDWUV9uX25x535U6oMkEWo11Cvnb2/rrsgcKD0z
         coeBVlOz9tRFxRpsOpRiND2v8rWMM2LGW4wUPDO1eZXyk9X+dymQg3iTgdv/Z6Btd3Yu
         iADVn182CvAWb46dR0PS1UJsrQwQaU2b/uG9AyzuI5ybH8kaXfqLLOro5bZoRl7mVlIM
         jGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSzbF+CqDBpWnUY6TiPdAqCuHc3AUzhDpEh3P7jATjf+7KiaOArQgCBxJEOmsDsSxAHkh1WgTgJxhKyYkItePYtxsoLMnSzAwSHYI=
X-Gm-Message-State: AOJu0Yyg/e9Ncj0NLEZ1oUHag2Kszg3foogDIKxUaPacJU2rrWKEIkA3
	z4ZKvgqmQq3j2FLViJXrvYVphXLxS6nOfxUCbHF9LACSgHqjOLK7sNpxXSrSisJyoe/T+SQF6oG
	Oh+kLFE0AMOQtQdCf2wqeVmF7ZWuwT0IIK6MuAA==
X-Google-Smtp-Source: AGHT+IEgrOE8YMX97+A4eDRf9A0EAdSUgcmTic5fHDg/T2R33V8gb4DhoqOcfnYofwrjC9lpqa3D2Ysp+1hDHZh7sj8=
X-Received: by 2002:a05:6122:2a0e:b0:4f2:ff08:ba3c with SMTP id
 71dfb90a1353d-4f33f1bf527mr14016158e0c.5.1720786402550; Fri, 12 Jul 2024
 05:13:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Jul 2024 17:43:11 +0530
Message-ID: <CA+G9fYv0xfJbt=+STRDu65G-Tq_w9wEH3C0q1ucyoAa7DbWLAQ@mail.gmail.com>
Subject: next-20240712: task_work.c:(.text+0xc2): undefined reference to `irq_work_queue'
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

The 32-bit arm, mips and powerpc the tinyconfig builds failed on today's
Linux next-20240712 tag with gcc and clang builds.
The defconfig builds pass.

  GOOD: next-20240711
  BAD:  next-20240712

Build error:
------
arm-linux-gnueabihf-ld: kernel/task_work.o: in function `task_work_add':
task_work.c:(.text+0xc2): undefined reference to `irq_work_queue'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build link:
-----
  [1] https://storage.tuxsuite.com/public/linaro/lkft/builds/2j8Y3PffxvTIFJIR8HODmHEU9oM/
  [2] https://storage.tuxsuite.com/public/linaro/lkft/builds/2j8Y3PffxvTIFJIR8HODmHEU9oM/config

Build details:
--------
  git_describe: next-20240712
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 3fe121b622825ff8cc995a1e6b026181c48188db
  git_short_log: 3fe121b62282 ("Add linux-next specific files for 20240712")
  arch: arm, mips, powerpc, s390
  config: tinyconfig
  toolchain: gcc-13, gcc-12 and clang

--
Linaro LKFT
https://lkft.linaro.org
