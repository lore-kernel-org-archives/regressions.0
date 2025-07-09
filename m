Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36CC28CF6C
	for <regressions@lists.linux.dev>; Wed,  9 Jul 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752058628; cv=none; b=b1oOxC7P+sXlWnoyXWwL3WRyp/l+clFNecbmN6CR4A/JWlZkXUJ9lFlaCfyy47QQ6OY/rzRkZojFQpI4yzNa9BoyagYqvX0bQzSikP1FDp7rZuaPWsq5pok7HwRCueyn2p2l0/RrWFogtUaEkkmlVoCGGfVuGeVkIyUSs4xm4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752058628; c=relaxed/simple;
	bh=dLZQA4g4l3IkyOO4qanx0WXyNBgnxKd6OEhOrizi5C8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hkWjHVwSYElDfsbve8S0AkLofNr9moBqxLlRasfBAc1kdpYmbQMP8zcpoqMGSA93j6ipRcCnk9SrWB/yVsME8gK8lNGd+fUroJyYQNtR3QJMjKgOc3SbF2uSJANagf3q5V/k34TRtY9UCdS/vExXCMrzwrlnSzPkwQxBgxpqbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CZluhOjC; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CZluhOjC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34ab678931so3964831a12.0
        for <regressions@lists.linux.dev>; Wed, 09 Jul 2025 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752058625; x=1752663425; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b9Fo/6q6G7ngEaiAx4m1CQV8r87Lr8o8jqTCjkiXksc=;
        b=CZluhOjCmQ7E4UvJQK3/GPIWjOxLaIrSvJyL0PQBiNdXV5b/Zy2GL2mHDPV3IWTg3I
         Q4srsu2L8l7J6qIl9GXtZffaSsrSnXU2LLJSBbjqxYEisPS/zkRjqlimGAjZmgeEU+MT
         t6e4abqEzflL5b6eEPmeatAU6+G3CSiGF2x2NJkkKh5wHDh9YsZUeL0BN2eHm2/bUz3q
         TSjHKqbUQRHXV00rTf2PlR/DprOz7ry+L531VVglIMVRilfJYoYAGmMwjahLrU6Zfv9J
         fjOkHlXHz5YJ0kv/CIpr0J1u1NW3KH0BRURr88HtuEFHXbZC3xoerD9mS1hU/az7IfN7
         O3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058625; x=1752663425;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9Fo/6q6G7ngEaiAx4m1CQV8r87Lr8o8jqTCjkiXksc=;
        b=vPUhN1bOu+ffI0oW3Ay8626XbtVX5VFzwctnoN4oI/XWoQG1tm0vFU1R2QVrX6sTQV
         wicamNUo7rKTcKfV0uuwqZC/eVbDdLX/b2ILnGZ9F678dW+hZLs9SirMOl0VAWa6ZGG4
         73b88Cs4x8HV3aA70+yLRr9l6SarW65zGQCCf7ohh2YKv+mrqGucoJjih9vHEqfM2YJ0
         EkmesA7b4eTUkmiJlo0zeJmWKugJp4jKuzBm4388aXl9WJ1QbqSgSU2JxmtyFnTSGfvN
         cq9DFs6XY5sp5XiPsg5a3mC7zNsmcM53ZMpWHH+DeCEpxT8uuBKI14nJNN7TyMJyhhPO
         nD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAI1X6UIZ5JGr+kiEpogloR3IoWRsu8p9NM4p25zoPvTW8OhYwJJ53eXuis3EA4xvk9kPmnwy8JtPSaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBXcl006FMC8KRknc2nsXKwb6j3bhrofTItwpGXtbl4H7W5zcO
	P17jUwilPy1OPsuYz7mIIR7h6QI+ZUXCFjDwOqab60jeAJiuvrNqsY3zCI53zhIY//hjw6Vxnjt
	jT+2DM8Pn2ng9VsgMwbEz6woI5V8mjyM0zIzNh5lRAA==
X-Gm-Gg: ASbGncvlQAbBDyVyEWlT8bm0k5PvQ/1m6JoN4wSkciz/qHzG5HehB+Njfpoao2HsLt5
	DPeWuHHscCM+ADJM50GBb7EWOB8qAS/GWX76RJV5Lmja1Jh63oseDB0kurhL6fh7MbLkndzc1DD
	qllbNf8esgNa/EQI4GFiR2L8npEWMXcqRu3QzyY1oOmTBDnQnCSJTGLsr1UCwp4zz+e5mqr45yk
	6HS
X-Google-Smtp-Source: AGHT+IFNutTatG/c0rc0vRQ+X24GyL7MQHT1E2ARrKA24bioV6zHc00zDGjx6jgWIb+1kHtiOYdpe+/tvUNZzqekbvU=
X-Received: by 2002:a17:90b:588b:b0:311:c1ec:7cfd with SMTP id
 98e67ed59e1d1-31c2fdbc418mr3139958a91.26.1752058624706; Wed, 09 Jul 2025
 03:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Jul 2025 16:26:53 +0530
X-Gm-Features: Ac12FXwAAHVDnWkwkMUFj6GSNlLP5G09Mrz4q7yC_iE3b_PCPAjUcbl2ua7X09Q
Message-ID: <CA+G9fYtK2TLbpo-NE-KUXEp0y8+5zXNVRFkqdMjaGgcNFFG77g@mail.gmail.com>
Subject: v6.16-rc5: ttys: auto login failed Login incorrect
To: linux-serial@vger.kernel.or, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	linux-stable <stable@vger.kernel.org>
Cc: Jiri Slaby <jslaby@suse.com>, Aidan Stewart <astewart@tektelic.com>, 
	Jakub Lewalski <jakub.lewalski@nokia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Fabio Estevam <festevam@gmail.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Approximately 20% of devices are experiencing intermittent boot failures
with this kernel version. The issue appears to be related to auto login
failures, where an incorrect password is being detected on the serial
console during the login process.

This intermittent regression is noticed on stable-rc 6.15.5-rc2 and
Linux mainline master v6.16-rc5. This regressions is only specific
to the devices not on the qemu's.

Test environments:
 - dragonboard-410c
 - dragonboard-845c
 - e850-96
 - juno-r2
 - rk3399-rock-pi-4b
 - x86

Regression Analysis:
- New regression? Yes
- Reproducibility? 20% only

Test regression: 6.15.5-rc2 v6.16-rc5 auto login failed Login incorrect

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## log in problem

runner-ns46nmmj-project-40964107-concurrent-0 login: #
Password:
Login incorrect
runner-ns46nmmj-project-40964107-concurrent-0 login:

## Investigation
The following three patches were reverted and the system was re-tested.
The previously reported issues are no longer observed after applying the
reverts.

serial: imx: Restore original RXTL for console to fix data loss
    commit f23c52aafb1675ab1d1f46914556d8e29cbbf7b3 upstream.

serial: core: restore of_node information in sysfs
    commit d36f0e9a0002f04f4d6dd9be908d58fe5bd3a279 upstream.

tty: serial: uartlite: register uart driver in init
    [ Upstream commit 6bd697b5fc39fd24e2aa418c7b7d14469f550a93 ]

Reference bug report lore link,
 - https://lore.kernel.org/stable/CA+G9fYvidpyHTQ179dAJ4TSdhthC-Mtjuks5iQjMf+ovfPQbTg@mail.gmail.com/

## Test links
* log 1: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.15.y/build/v6.15.4-264-gf6977c36decb/testrun/29021685/suite/boot/test/clang-20-lkftconfig/log
* log 2: https://qa-reports.linaro.org/api/testruns/29021720/log_file/
* log 3: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.16-rc5/testrun/29043240/suite/boot/test/clang-20-lkftconfig-no-kselftest-frag/log
* Boot test: https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.15.y/v6.15.4-264-gf6977c36decb/boot/clang-20-lkftconfig/
* LAVA jobs 1: https://lkft.validation.linaro.org/scheduler/job/8344153#L1186
* LAVA jobs 2: https://lkft.validation.linaro.org/scheduler/job/8343870#L1266


## Build
* kernel: 6.15.5-rc2
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: f6977c36decb0875e78bdb8599749bce1e84c753
* git describe: v6.15.4-264-gf6977c36decb
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.15.y/build/v6.15.4-264-gf6977c36decb

## Test Regressions (compared to v6.15.3-590-gd93bc5feded1)
* dragonboard-410c, boot
  - clang-20-lkftconfig
  - clang-nightly-lkftconfig-kselftest
  - gcc-13-lkftconfig-debug

* dragonboard-845c, boot
  - clang-20-lkftconfig
  - korg-clang-20-lkftconfig-lto-thing

* dragonboard-845c-compat, boot
  - gcc-13-lkftconfig-compat

* e850-96, boot
  - gcc-13-lkftconfig-no-kselftest-frag

* juno-r2, boot
  - clang-20-lkftconfig
  - gcc-13-lkftconfig-debug
  - gcc-13-lkftconfig-kselftest

* rk3399-rock-pi-4b, boot
  - clang-20-lkftconfig

* x86, boot
  - clang-20-lkftconfig
  - clang-20-lkftconfig-no-kselftest-frag
  - clang-nightly-lkftconfig-kselftest
  - clang-nightly-lkftconfig-lto-thing
  - gcc-13-defconfig-preempt_rt
  - gcc-13-lkftconfig-no-kselftest-frag


--
Linaro LKFT
https://lkft.linaro.org
