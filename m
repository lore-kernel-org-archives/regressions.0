Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8226D3B53
	for <regressions@lists.linux.dev>; Mon,  7 Mar 2022 16:02:54 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id h126so31948944ybc.1
        for <regressions@lists.linux.dev>; Mon, 07 Mar 2022 08:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oUiS8St9u6jfbDcvn7O2xYzrVRnsblDuTr18hd0OKbY=;
        b=yknKkgg36doSZGb9bSrwwPi/ng2twjs+DjuXJ4ZenpwNzMJFZMROdi7E2liiIp8hkC
         hq/qjT6U0AvPIiqaIt7whbyh+wcdM0THyTzYXufY6GJxLvGfV00FKniLs+SqodA6XZpA
         f7bKXe9DI+xE45O8Gfy2alVuKydBPoffnPLCgCnVhc3CWDq6sGTbN/fc+93eWr42yJVC
         2aqQQ33rGSVAIbwH2LkMXG+QNoeEZNiAF0xNRCugNtWLXqubaXYFxG/kyTT3G959o/tH
         d+s1k0ob4NbaGm0Oo6R+WRup6oSu1xmNmnWDFkrV1huVhJ7cyMvXPZIJhYU6B8AzMRp6
         7FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oUiS8St9u6jfbDcvn7O2xYzrVRnsblDuTr18hd0OKbY=;
        b=PS6PbM3zjKWefZmrkrAU9ho2F11aXtnaYf1X/N8/Upe2YYdisu8R0WYQI8JeqZyYKH
         dLFu/19I7Klc+WOdmU/MMguim7JHC8xR88Yakuh2Mn5sOL40/YMyJdrZCcok91xQfrZp
         4/8E6tE0QgHybA/oq4Fg2Q/TtDToak2eU4SkPKIHMEOFmZXlF0SkHc8y39t3gCrb7Mmt
         rddMV6VBZ7hrrSNHePRfUMaTz/nkrgC0/LLCCyngq0sx3gub3FA6kTv7Z4dzPyXnqFCM
         s8sDUKZ48MTX0ZcBA+0Gd8TYveE8wSC5IYyakWaAyZEzqSCBfg3NJV4q+84J70iJNTii
         QduQ==
X-Gm-Message-State: AOAM532FZ+YMfGjZKInw+1rdZPqg8gzViZohGWuniwOAgSGmh+Sy1pMp
	rlPh7aMdI9NE6m0XZ2MBEB2L2izEzVuMYVz9CQxlpw==
X-Google-Smtp-Source: ABdhPJyqM5A9UkFfdBHih/0XUOqLmHjU2A+XzqehBH1mnkInSaZgB3rPF8qGTvQxZ/UiC/DWz9MJ7QkmOYnkHHZ/gQ0=
X-Received: by 2002:a25:be05:0:b0:629:1f49:b782 with SMTP id
 h5-20020a25be05000000b006291f49b782mr6723180ybk.88.1646668972845; Mon, 07 Mar
 2022 08:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Mar 2022 21:32:41 +0530
Message-ID: <CA+G9fYtGP6Mj3P4fbzTVQdtMrdN-6un+HBSXQCnkGFhpOSBLQw@mail.gmail.com>
Subject: [next] LTP mm thp04 timeouted after 15 minutes
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>, 
	Li Wang <liwang@redhat.com>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

LTP mm thp04 timeouted after 15 minutes on Linux next-20220307 on all the
available devices.

Following two tests regressed.
    - LTP mm: thp04 (timed out after 15 minutes)
    - LTP cve : cve-2017-1000405 (timed out after 5 minutes)

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 519dd6c19986696f59847ff8bf930436ccffd9a1
  git_describe: next-20220307
  kernel-config: https://builds.tuxbuild.com/2639Ukfjo4gbqTYIT0qtQgX1a5J/config


tst_test.c:1433: TINFO: Timeout per run is 0h 15m 00s
thp03.c:76: TPASS: system didn't crash, pass.
Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
tst_test.c:1433: TINFO: Timeout per run is 0h 15m 00s
[  989.498742] kworker/dying (36) used greatest stack depth: 11352 bytes left
Test timeouted, sending SIGKILL!
tst_test.c:1479: TINFO: If you are running on slow machine, try
exporting LTP_TIMEOUT_MUL > 1
tst_test.c:1480: TBROK: Test killed! (timeout?)
Summary:
passed   0
failed   0
broken   1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log [1].
LKFT test results comparision [2] & [3].

--
Linaro LKFT
https://lkft.linaro.org
[1] https://lkft.validation.linaro.org/scheduler/job/4664637#L22900
[2] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220307/testrun/8280389/suite/ltp-mm-tests/test/thp04/history/
[3] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220307/testrun/8285821/suite/ltp-cve-tests/test/cve-2017-1000405/history/
