Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA72BD5B0
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756212155; cv=none; b=sB80Xoq9vKJpIwMiqXzWqwslR43I1ydjRy578YMIvgX9C48oz3oUaejs/1xoh/fdikhXScTwydA+krL95Ch+L8wKKecdtUTsEOwIziu1T3hgRQr/REfEzAIXW9mZo5LmE3Jgp7nCzxAaBmM2q3fBO3dk1NQ6w6D2hPXzI6LLeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756212155; c=relaxed/simple;
	bh=S0Bpq4OtfC8Cw6JaOppgM0dRbUEeZh7tZ/ZTZm1OrYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqqymatF+Sr6YQMI9Pserj6Jn7l7V91UdGBkh9/G5ZctjmWqpnO8XGK7UKmvs3J4IOl6uBrlu3NUvegqQa6b39Vz2MANiMmelQco+TRK5AJ91kIgfhA2c7+U+d6EQNtqVYqud8roC4MJvhZ7aqaCGRNLUbGuKiEk5jH5DaGox4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNNQquJM; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNNQquJM"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4c1aee9ecbso1280119a12.1
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756212152; x=1756816952; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ihIdRxo3zaCFTaaQOEAUMowWjAiYBG/G7mxYDcyFFLY=;
        b=UNNQquJM28SzhLiPSjjzOP43QgJoe0uHgZ78vRRWAF/VOgUWKcifCB4BpjM6Js72ZU
         E/nEA55EZe7VJ9aDmMynBY1rmasXt6r7E7zWNj8QQuJR71K0dJQ9RTCwiPQCpnXna59j
         KPHdUVMoHB5tOH1j+aJNr7ABhExIm8dQqIg+4/evk5px56GdNlFXvum6bP1BAvPoRrHM
         BYgYg1fPNZ7I/6CSGO+XE/RgKsC5Bzq246QciaSEP+OeF4bs8nfb08FiHwBAZAXy+9Gu
         256NVJqN7o/BLHooYV5mPzviQ7OzR41OAmPO7Eab8AzIZIg50dUPsigaB6ow3tC0kWct
         Y2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756212152; x=1756816952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihIdRxo3zaCFTaaQOEAUMowWjAiYBG/G7mxYDcyFFLY=;
        b=hT1Y60L6oG4UbrvkJ2x3TGeojj5m+ze9AbV45WeiP0+9Q6D9CTJcNl02wDzoiFvKRc
         udLkMGvHQGfGnRolgezd7heVPrEyauH39pGVQUU4/hMuqdKpEDnQZP/zCsxxF+L0hX5f
         GE+zMCxmD34rMmVF51B6V65IZ45a0gVMHVczAO0B+BFThE5ZNO6/9PSdW4j8mYizYLoY
         gcb1qQ6pY7ozBQJquCpIX8BQxjht/cF5/HKPAF1/f9y78mbVe/VUyVjjPekdZEd96LtR
         FXDc4xKg11AamnZEXkxH4bnuZs7qABhwUIMrD57MQUZuStYEdsuIXzHo4xjrAbRXV2ew
         VK+w==
X-Forwarded-Encrypted: i=1; AJvYcCV/WnLpUjfho89o/izyQVpBVd1cXRpCq8JgECbr0M4Na57j+21Csok2gdVe7R2dtEvPkys+/SidM9JaYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzB+RlQHL5T7NG0N3w7Uf2NApvboVeg2J3LUFeb20VmGr0nNyaX
	JLN2Vj7SVKZRlLXZ7gGRZ2G87K+GU+SCWjyOOQ9w1qffteZN1f8uz1gHDTTOrAi0reCfqAVyjte
	waEWKBnFUlFo5rpF2lQuBKY8DQZOLcRUMJAfXhqGT8g==
X-Gm-Gg: ASbGnctLmKTrXExxBJMkt5h6PQw59rLi/V/6aHrZOGRMdwMdQB8RUlrQtaBm4JnBZ3y
	x9nP9BUxtP0lGzh1IUwFnY+RaLlxWM96puiMTA7qSp1sWCwMp8bSRUK+QARglSIPk/5PJnzNX8o
	U7M2AH0LyHx6JR33lL7HcYVJB1ZlPEHGtmtK/09066rSWBV1L8nFioz7c2tZxaPfHBS/Frk8nlT
	H5/VLDyX8KCM7mMoABDhunrGW7n4WmsAL0KGJjW
X-Google-Smtp-Source: AGHT+IH4NyVaZSDy6n4rrA41KU9v9fWAF+kl8XT24+x2ai2ACAdw9OAw+btvXA9avZlDxdZPOwNmJ8qepSzZ92IMffg=
X-Received: by 2002:a17:902:dac3:b0:246:bba8:9b8e with SMTP id
 d9443c01a7336-24875397544mr14665275ad.21.1756212151245; Tue, 26 Aug 2025
 05:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuR9auMS=hg9Ri+A2SeCQ0jHkW7mN3k9RDG66vE5cfJdQ@mail.gmail.com>
In-Reply-To: <CA+G9fYuR9auMS=hg9Ri+A2SeCQ0jHkW7mN3k9RDG66vE5cfJdQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 26 Aug 2025 18:12:19 +0530
X-Gm-Features: Ac12FXxhveQA1vmrTzmCHnzem-lWe0TWCdRXPN4ReZjhi1Wfyu2PglXf3y83Y8w
Message-ID: <CA+G9fYuLx27WRsS185pDnCVOtsLhn_WQRY4EoDBU8dT-hm88Rw@mail.gmail.com>
Subject: Re: next-20250825: arc: seqlock.h:876:2: error: implicit declaration
 of function 'spin_lock' [-Werror=implicit-function-declaration]
To: Linux-Arch <linux-arch@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Vineet Gupta <vgupta@kernel.org>, Ye Liu <liuye@kylinos.cn>, 
	Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>, 
	David Hildenbrand <david@redhat.com>, Chris Li <chrisl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Aug 2025 at 12:05, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following build warnings / errors noticed with arc defconfig with
> gcc-9 toolchain.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20250825 arc seqlock.h:876:2: error: implicit
> declaration of function 'spin_lock'
> [-Werror=implicit-function-declaration]
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> arc:
>   build:
>     * gcc-9-allnoconfig
>     * gcc-9-tinyconfig
>     * gcc-9-vdk_hs38_smp_defconfig
>     * gcc-9-defconfig
>     * gcc-9-axs103_defconfig
>
> ## Build log
> In file included from include/linux/mmzone.h:17,
>                  from include/linux/gfp.h:7,
>                  from include/linux/mm.h:7,
>                  from arch/arc/include/asm/arcregs.h:149,
>                  from arch/arc/include/asm/irqflags-arcv2.h:9,
>                  from arch/arc/include/asm/irqflags.h:13,
>                  from include/linux/irqflags.h:18,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/sched.h:37,
>                  from arch/arc/kernel/asm-offsets.c:6:
> include/linux/seqlock.h: In function 'write_seqlock':
> include/linux/seqlock.h:876:2: error: implicit declaration of function
> 'spin_lock' [-Werror=implicit-function-declaration]
>   876 |  spin_lock(&sl->lock);
>       |  ^~~~~~~~~
> include/linux/seqlock.h: In function 'write_sequnlock':
> include/linux/seqlock.h:890:2: error: implicit declaration of function
> 'spin_unlock' [-Werror=implicit-function-declaration]
>   890 |  spin_unlock(&sl->lock);
>       |  ^~~~~~~~~~~
> include/linux/seqlock.h: In function 'write_seqlock_bh':
> include/linux/seqlock.h:902:2: error: implicit declaration of function
> 'spin_lock_bh' [-Werror=implicit-function-declaration]
>   902 |  spin_lock_bh(&sl->lock);
>       |  ^~~~~~~~~~~~
> include/linux/seqlock.h: In function 'write_sequnlock_bh':
> include/linux/seqlock.h:917:2: error: implicit declaration of function
> 'spin_unlock_bh' [-Werror=implicit-function-declaration]
>   917 |  spin_unlock_bh(&sl->lock);
>       |  ^~~~~~~~~~~~~~
> include/linux/seqlock.h: In function 'write_seqlock_irq':
> include/linux/seqlock.h:929:2: error: implicit declaration of function
> 'spin_lock_irq' [-Werror=implicit-function-declaration]
>   929 |  spin_lock_irq(&sl->lock);
>       |  ^~~~~~~~~~~~~
> include/linux/seqlock.h: In function 'write_sequnlock_irq':
> include/linux/seqlock.h:943:2: error: implicit declaration of function
> 'spin_unlock_irq'; did you mean 'write_sequnlock_irq'?
> [-Werror=implicit-function-declaration]
>   943 |  spin_unlock_irq(&sl->lock);
>       |  ^~~~~~~~~~~~~~~
>       |  write_sequnlock_irq
> include/linux/seqlock.h: In function '__write_seqlock_irqsave':
> include/linux/seqlock.h:950:2: error: implicit declaration of function
> 'spin_lock_irqsave' [-Werror=implicit-function-declaration]
>   950 |  spin_lock_irqsave(&sl->lock, flags);
>       |  ^~~~~~~~~~~~~~~~~
> include/linux/seqlock.h: In function 'write_sequnlock_irqrestore':
> include/linux/seqlock.h:981:2: error: implicit declaration of function
> 'spin_unlock_irqrestore'; did you mean 'write_sequnlock_irqrestore'?
> [-Werror=implicit-function-declaration]
>   981 |  spin_unlock_irqrestore(&sl->lock, flags);
>       |  ^~~~~~~~~~~~~~~~~~~~~~
>       |  write_sequnlock_irqrestore
> In file included from include/linux/sched.h:15,
>                  from arch/arc/kernel/asm-offsets.c:6:
> include/linux/rcupdate.h: In function 'rcu_read_lock_sched_held':
> include/linux/preempt.h:227:49: error: implicit declaration of
> function 'irqs_disabled' [-Werror=implicit-function-declaration]
>   227 | #define preemptible() (preempt_count() == 0 && !irqs_disabled())
>       |                                                 ^~~~~~~~~~~~~
>                           ^
> cc1: some warnings being treated as errors

Anders bisected this and found,
 # first bad commit:
   [7cf258e5720ffdd5505faa04ab5afa9732ef0f6e]
   mm-replace-20-page_shift-with-common-macros-for-pages-mb-conversion-fix

> ## Source
> * Kernel version: 6.17.0-rc3-next-20250825
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20250825
> * Git commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
> * Architectures: arc
> * Toolchains: gcc-9
> * Kconfigs: defconfig
>
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29652436/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250825/build/gcc-9-defconfig/
> * Build error details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250825/log-parser-build-gcc/gcc-compiler-include_asm-generic_getorder_h-error-implicit-declaration-of-function-ilog/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/31lrYki7MzYyqtJKnutAe2oawoq
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrYki7MzYyqtJKnutAe2oawoq/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/31lrYki7MzYyqtJKnutAe2oawoq/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org
