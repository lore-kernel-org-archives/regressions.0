Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD017A2E1
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756190166; cv=none; b=KZcZ4twE1ySdCJHI0u9qwPyV+haoDRWEkeK5A3L/IPlrkoLoblo2vGF8B1hlc2vpcA+yl4lUo2I3bT+G9Qm5H0ObX5DrUeHIZjqkI/TgfN0JGLmLok5Nzj/jPDkPQiYQlN/OT2L/o5NDPiP/VbW62ym93qHTNkc18AguJgjmCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756190166; c=relaxed/simple;
	bh=2BqXMcZnoG8t6tVC4Nu0TiARTMl3Fi3Qmn7b0TTYb0s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=haXVSlNaSpK/Q6iSlhE+D6lDZFWixNmxeGjOba850gRbQSflCehaUELvi+X/ro8oRemulLmjI7sjwwLQC0s/5rz41EYGGeO1fzugo9RNkJUznAKNf2Wfx40GszN0LDgyGUUXclXEwFAmw0Yl/Z7axWAS//M0vychFvF//DSwOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYm7wPOa; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYm7wPOa"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b49dcdf018bso1497020a12.0
        for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 23:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756190161; x=1756794961; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZCZJrCEqdKPb4Dv2x8k8eTvQ61vGgPIzxIHFjirYy9A=;
        b=XYm7wPOaXYVPfA+yDhQHWdQzSdJjHlloaoMRAwQz9qE59fr+jD8ZARPTeXFztm0+kI
         YzvVCOnqA246hj9T5cnAwDxg4sq7nalgvhqMz+G4lXeKwEd5r2zwL3/a5OdIodzrHsu2
         M9gSyW0fSgMUJCJPeIxNJ8Gl5skDQbEEIarzZJxfemyxvOPkoNawPZs2YTGqC6D9tLDV
         wvuJ5iFsQeKgnEZ4FCCKPUrzSixmzKeNpb9zTqI9VUCTte6hodg4oPSPI7L7vymD4o7R
         AQRpfuhuYNxnN2iPTO4xrihi4TsSA2lfmVIb+iujUAz0f6ubL0sWzcyWpQzfW0TUlR0x
         MOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756190161; x=1756794961;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZCZJrCEqdKPb4Dv2x8k8eTvQ61vGgPIzxIHFjirYy9A=;
        b=kgD1KpP6ET1CoGSCgDLOszIdRfqKzICCb45OkQ4u4BZdqd4uBiZQRi7XE55nHtb8Mf
         ZD6TuPLxqkn1jGxztjDU2lRpzMzGDkFgqFukel9PPTbtHKIW76jvTU9N/j8tULLW8ZV8
         HwGb5jiF4k7UYgDZESicxmtmzRM4h8vDSTf40R5ebdu8T7YWhybuaofDNOHNppU1k8fd
         3KcmJEN/JEUnDkzMahjNTagBgcjt5SlnjAhWC+gFH0RmSXpGrNoNQnwzq7YTw4HTYmwA
         aybZ/heiE2aoxJ0VcMQRH7EB9bPIMtAOyI/te5F7zjXDLBdlvYjQCSFApVBK7ivECm1U
         9boA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2z/1wyOXBX6kvkwXJYNy5ODbcm+DN90fBaUwbM/LIheAYI698dQ9nsjnM647Jfek29MoP4oT+W41sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySjmyH8Fz/IS3/7RxuGJEKCq6lvqXh3wpIAo0o/jKpNJ6HukTB
	D+pD9NdZiGRoyWbJkB+98tX+3X4aaXK00/xX+w92pDaFH3IvkCdQOVya0U+CpD0rOGzRTHqBXw6
	VT0ojoqaD2UHusTEh/C77Tt1V7ZbWizHGe5JM8cIczg==
X-Gm-Gg: ASbGncuPS/KoFkpTeFWF/HYrvYzsOw7Gqu9Wz4TuvWwalnrF3MeZgaSZtrEe3Jq2VYU
	BJQitz4IbMFDL6/BZlfDg181ZibBZAzkMpCtjz6vohrvIvNk3Vy4B7edELxWkqUky9IBDih8q2g
	6mMQ/WnMJ225DXJLMpDm1Elo095DxUDGRl+EyxbLTTcyML2ZoqsjfIrSNkdlGC7CR70KtlRM4Md
	6cy6r/vPeg++RJMmAA4UN3E4G1C83gr3wLDD4Q=
X-Google-Smtp-Source: AGHT+IEQn4WiuIgZyEMURTgqGtjunWBRbpXl5so57HtpTznUyYEK7Ey9gxQd0qtxzwA+AVUwTTM+dZG94+sYVO8I9HM=
X-Received: by 2002:a17:902:f64b:b0:246:7a43:3f82 with SMTP id
 d9443c01a7336-2467a4378cbmr141502145ad.45.1756190159816; Mon, 25 Aug 2025
 23:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Aug 2025 12:05:48 +0530
X-Gm-Features: Ac12FXyuAWdifk3AbEFJtNbFPLOMAyfmI2knp7BoLYQE5klP6No3TL9rR5qjI0I
Message-ID: <CA+G9fYuR9auMS=hg9Ri+A2SeCQ0jHkW7mN3k9RDG66vE5cfJdQ@mail.gmail.com>
Subject: next-20250825: arc: seqlock.h:876:2: error: implicit declaration of
 function 'spin_lock' [-Werror=implicit-function-declaration]
To: Linux-Arch <linux-arch@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed with arc defconfig with
gcc-9 toolchain.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250825 arc seqlock.h:876:2: error: implicit
declaration of function 'spin_lock'
[-Werror=implicit-function-declaration]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

arc:
  build:
    * gcc-9-allnoconfig
    * gcc-9-tinyconfig
    * gcc-9-vdk_hs38_smp_defconfig
    * gcc-9-defconfig
    * gcc-9-axs103_defconfig

## Build log
In file included from include/linux/mmzone.h:17,
                 from include/linux/gfp.h:7,
                 from include/linux/mm.h:7,
                 from arch/arc/include/asm/arcregs.h:149,
                 from arch/arc/include/asm/irqflags-arcv2.h:9,
                 from arch/arc/include/asm/irqflags.h:13,
                 from include/linux/irqflags.h:18,
                 from include/linux/spinlock.h:59,
                 from include/linux/sched.h:37,
                 from arch/arc/kernel/asm-offsets.c:6:
include/linux/seqlock.h: In function 'write_seqlock':
include/linux/seqlock.h:876:2: error: implicit declaration of function
'spin_lock' [-Werror=implicit-function-declaration]
  876 |  spin_lock(&sl->lock);
      |  ^~~~~~~~~
include/linux/seqlock.h: In function 'write_sequnlock':
include/linux/seqlock.h:890:2: error: implicit declaration of function
'spin_unlock' [-Werror=implicit-function-declaration]
  890 |  spin_unlock(&sl->lock);
      |  ^~~~~~~~~~~
include/linux/seqlock.h: In function 'write_seqlock_bh':
include/linux/seqlock.h:902:2: error: implicit declaration of function
'spin_lock_bh' [-Werror=implicit-function-declaration]
  902 |  spin_lock_bh(&sl->lock);
      |  ^~~~~~~~~~~~
include/linux/seqlock.h: In function 'write_sequnlock_bh':
include/linux/seqlock.h:917:2: error: implicit declaration of function
'spin_unlock_bh' [-Werror=implicit-function-declaration]
  917 |  spin_unlock_bh(&sl->lock);
      |  ^~~~~~~~~~~~~~
include/linux/seqlock.h: In function 'write_seqlock_irq':
include/linux/seqlock.h:929:2: error: implicit declaration of function
'spin_lock_irq' [-Werror=implicit-function-declaration]
  929 |  spin_lock_irq(&sl->lock);
      |  ^~~~~~~~~~~~~
include/linux/seqlock.h: In function 'write_sequnlock_irq':
include/linux/seqlock.h:943:2: error: implicit declaration of function
'spin_unlock_irq'; did you mean 'write_sequnlock_irq'?
[-Werror=implicit-function-declaration]
  943 |  spin_unlock_irq(&sl->lock);
      |  ^~~~~~~~~~~~~~~
      |  write_sequnlock_irq
include/linux/seqlock.h: In function '__write_seqlock_irqsave':
include/linux/seqlock.h:950:2: error: implicit declaration of function
'spin_lock_irqsave' [-Werror=implicit-function-declaration]
  950 |  spin_lock_irqsave(&sl->lock, flags);
      |  ^~~~~~~~~~~~~~~~~
include/linux/seqlock.h: In function 'write_sequnlock_irqrestore':
include/linux/seqlock.h:981:2: error: implicit declaration of function
'spin_unlock_irqrestore'; did you mean 'write_sequnlock_irqrestore'?
[-Werror=implicit-function-declaration]
  981 |  spin_unlock_irqrestore(&sl->lock, flags);
      |  ^~~~~~~~~~~~~~~~~~~~~~
      |  write_sequnlock_irqrestore
In file included from include/linux/sched.h:15,
                 from arch/arc/kernel/asm-offsets.c:6:
include/linux/rcupdate.h: In function 'rcu_read_lock_sched_held':
include/linux/preempt.h:227:49: error: implicit declaration of
function 'irqs_disabled' [-Werror=implicit-function-declaration]
  227 | #define preemptible() (preempt_count() == 0 && !irqs_disabled())
      |                                                 ^~~~~~~~~~~~~
                          ^
cc1: some warnings being treated as errors

## Source
* Kernel version: 6.17.0-rc3-next-20250825
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250825
* Git commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
* Architectures: arc
* Toolchains: gcc-9
* Kconfigs: defconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29652436/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250825/build/gcc-9-defconfig/
* Build error details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250825/log-parser-build-gcc/gcc-compiler-include_asm-generic_getorder_h-error-implicit-declaration-of-function-ilog/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31lrYki7MzYyqtJKnutAe2oawoq
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrYki7MzYyqtJKnutAe2oawoq/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrYki7MzYyqtJKnutAe2oawoq/config

--
Linaro LKFT
https://lkft.linaro.org
