Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8234029A9
	for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 11:07:31 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a15so14824297qko.4
        for <regressions@lists.linux.dev>; Thu, 25 Aug 2022 04:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NFLgYkCaEI5s4PbUxMHY3+5s8XqDi7XgHlnjcMfnmFM=;
        b=EjFCQyIwTjWf3QQFss/peM3xmIAfM1QI/FpiaFOZH3MDcn8eQ/vD7BNZdsW0F/o2Zp
         Xkx25BADn8V6xRArayGRfDlFumP7yr9KsB/6Awnrf5/89Th7AcswlHItjX8AKnPTI8ml
         ty2ttCErQVm6iIacMIqxtY5HGXz4y9IdzFUck5fWSdTbMRRrippJE7ZsGJTPRmDEVfYK
         RKBCbwIV+h1Bea4Lm+9IchfPiYJ6fYAS1K49Mq60OCqStd1unXf87gkMi7fgSnRuAu+Y
         5H0IpHvN3ITbhcAnEPYEzGsOdoBL6S/xydBUDMldcg8ngt1JMrqFpWK9QYPshmhIFIZ5
         iIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NFLgYkCaEI5s4PbUxMHY3+5s8XqDi7XgHlnjcMfnmFM=;
        b=07vgCIIsncrx8CWxnqj99VNJ7o1T83z/UxnKhVlzl8uk4StwmgJfhgNmCYPZL/y9x4
         kiuHLEa1dylnH+11tkOrk/YREpViIdYISL0vtKG/OEVmMk5sl5A7baGnqbk7v6gIasII
         eUrNDf/GGwS1AWodl3shz4r1iZIKUdT1aNd9en15TiTcXRhm4zCv5QMRmP+1FNV1ZHwS
         4gpsr7O4ienj2WWuQG214pnmjN16muYTLsr/ZLcPagpQH37PBjLEWAgLziZpeWb/m45H
         e9Ls74qXYoFPO9OWSM+rNTBb859aHE9DSs5q7BDUnB6quMUCq+s5Uf6BW74+TKEvAlaZ
         aeqw==
X-Gm-Message-State: ACgBeo1nIHx+b+xk1PL3Aj2oxwwjV5Zztu88okK/H++kohjOzL4a5fSu
	3Vq75KIblNPkN0OV6Q+ykwNooF7NQI4nROkUju4=
X-Google-Smtp-Source: AA6agR77tGQAQAwf1DpfAy4TV+DnFug5v7sbHYdetgTRO0PHI9Um7Ub2YFnFEwFcZX4K2Kue83ASqE7ElO7U2TNPWz8=
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id
 x7-20020a05620a258700b006a7ee6fbf2amr2570783qko.542.1661425650405; Thu, 25
 Aug 2022 04:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvHLy63+jV3qMtHtQLufoeEpAjrteQ7+2Dvdt8CcGk9MA@mail.gmail.com>
In-Reply-To: <CA+G9fYvHLy63+jV3qMtHtQLufoeEpAjrteQ7+2Dvdt8CcGk9MA@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 25 Aug 2022 13:07:19 +0200
Message-ID: <CAFULd4bT4UrdQctUdJHSV9rjpRb02PHGRwxXcg=PZF9eiAfnXg@mail.gmail.com>
Subject: Re: [next] kernel/smpboot.c:435:6: error: variable 'oldstate' is used
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, 
	clang-built-linux <clang-built-linux@googlegroups.com>, Nathan Chancellor <nathan@kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, "Longpeng(Mike)" <longpeng2@huawei.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 25, 2022 at 12:48 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The x86_64 and i386 clang builds failed due to these warnings / errors
> on Linux next-20220825.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> kernel/smpboot.c:435:6: error: variable 'oldstate' is used
> uninitialized whenever 'if' condition is true
> [-Werror,-Wsometimes-uninitialized]
>         if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/smpboot.c:449:6: note: uninitialized use occurs here
>         if (oldstate == CPU_DEAD) {
>             ^~~~~~~~
> kernel/smpboot.c:435:2: note: remove the 'if' if its condition is always false
>         if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/smpboot.c:428:14: note: initialize the variable 'oldstate' to
> silence this warning
>         int oldstate;
>                     ^
>                      = 0
> 1 error generated.
> make[2]: *** [scripts/Makefile.build:250: kernel/smpboot.o] Error 1
>
> Build link: https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/

Please see

https://lore.kernel.org/lkml/CAFULd4bgdGosQ3byMW9S+ov0uDO9iK3jCmZ-fkZQbCGOpfUvXQ@mail.gmail.com/

for the fix.

Uros.

> Steps to reproduce:
> -------------------
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
>
> tuxmake --runtime podman --target-arch x86_64 --toolchain clang-14
> --kconfig https://builds.tuxbuild.com/2Dpvef6uVvzHMztbfQRmxJfPXZT/config
> LLVM=1 LLVM_IAS=1
>
> --
> Linaro LKFT
> https://lkft.linaro.org
