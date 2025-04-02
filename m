Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE631EFF82
	for <regressions@lists.linux.dev>; Wed,  2 Apr 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598175; cv=none; b=gi/HB+LFdaKFt6A/vBrXRY7e4OOYr0WNLugxZkYqhOX6dyl2lx2sDid+wupSCnEitj3kX39TPpPQ/tuK8U7tTZ1pGow7eGQFSr2lzFRlkUwInnEvFwnvjiXbO1OjY6ErYlQDARE7yNP4URJEmQ/AM82bjEKryvmF5CyMhdtzmfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598175; c=relaxed/simple;
	bh=iy8gPSknBpYANxR3oDbou+tV9uyY16PAcTCT3p0TVTQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SVk+zediXD1eByOAxUAqhc+ak9E6kKuy5QG2fTonJ3e0znSL6Q8H3jfumMRuIgFfHH3cE6EuC1wjsxGuilr7CTRrgDLH3cVqbWRZWLPddMPygoX0QyuFx2goJtTmGjiEi8oygL5mH0L8UfMAgm+dmb6Q5AkqjIfcxWMrjJnjHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgBgNtpr; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgBgNtpr"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so6113876241.3
        for <regressions@lists.linux.dev>; Wed, 02 Apr 2025 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598172; x=1744202972; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=jgBgNtpr323qAty5eIoA6dwbvarRiiIPY2MDol319x7UScNC6lN0qyZjbPJRD2Pb/y
         LQ/DFIgZdfhapthEYkxRCzrUARYb+UyBu3KCE5fF5yjqYFD250JeZpLBzEQ4PxbgWkNW
         g4J679PNC+f6d8KAsybdefEBbdMR3UHNZCjlTyjWWCmHcda4FsVY3WXom/RSRVoMlUe6
         ohqfWswm5F47SRX10I2J5iRovWDuGOKNXZypaOBGlAs4H6ohx0HUYWEdmIWMY4mpknwZ
         V2V0Ph2uyxU5/dtefv2+oOLGCtLosD8xVuKKFCeggPEsusma4a81k7hypLs5uL2Lja5L
         UIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598172; x=1744202972;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=u9GivDrlfGQwIyU4nuFsF35I8ihaaPPQnboS0AnsNjf8PklaVDb1vRiuYavAaW/7Vc
         1Fsf7dBe1ewS0n1RYwDAVgvqvM/c1515zYdHaoPVn4yaVQmWi0NeUXVKO7MLH0g0N7P2
         LSrTiWSvM9vBB6T6rlmTXoZe+bOGGdHWpredMEpstyWV0ft+XTcKCmRUL9sASWjABwbU
         dI19bibh10C6Efgu9C3+jTGdBTHv+U6sOjysJrzyvyHTd+k/+vWCjmQzf4hV1fkAXZCd
         JXGurPukt6//dGqVRvMun2jA851gNSvGKT9CqyUuNusS2ICq1BQQEyONjr6oTcROddSQ
         7Xfw==
X-Forwarded-Encrypted: i=1; AJvYcCUFH4qUWFsMjOXKS1EnbTGzFHdlMXnXmwMuCEybPzMGjyxmC0p95chG6fjkUT0H2DNFCv3cJU1dz7emiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yze/5/d8zl7uLAOPm7l6kdkVQJB6Izyfek+QVzAg75pNc6Qz9jt
	oamFeIfE81vAtBETUoDyN23inP3BXgbyr8en0j3NF/Lt1sCagsCC2bJmVV4PVwfzsA2bVaurEL2
	oEXc3a8t70kQYmqir7duxj7/1tF552siG+XFwzA==
X-Gm-Gg: ASbGncsy0DnaOsQIoVUk+baCsfOHu+ZjOcw90RMoOt8uqtduhUUBVnpM096F8uIHThb
	aIglprUH3vhiADU1aBqvFAclHWRtWU4tbmANp8bqXdVhWYNG/bmpFLFLnR4urXeC8q6usxOPyhx
	FDz+7lIZW2pAw4XdzfNkLQ0I9bk6M+qTeCJIX4lS8MWrO1SUMkqoI9jZWLSCA=
X-Google-Smtp-Source: AGHT+IEZPV71xCZFRaiMP7CnHUqII0vri11WJXA0JOvFvWq6jg//KmbiEFno6N5n8nVLL7zZFwNgKtdEbJvUoV78150=
X-Received: by 2002:a05:6102:f8f:b0:4c1:9bdb:6188 with SMTP id
 ada2fe7eead31-4c839e38348mr1583448137.13.1743598172341; Wed, 02 Apr 2025
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:19:19 +0530
X-Gm-Features: AQ5f1JrYBDqdwedr2g0EeIuRXqX4Zi5GT7DMBhpK7McR8fimUhQCIrzEPDNgmhA
Message-ID: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
Subject: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
the lto-thing, hardening and lto-full config boot failed with toolchain
clang-nightly on the mainline master branch with no console output.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on rk3399-rock-pi-4b:
  - boot/clang-nightly-lkftconfig-kselftest
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-full

Regressions found on dragonboard-410c:
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-lto-full
  - boot/clang-nightly-lkftconfig-hardening

Regressions found on dragonboard-845c:
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-thing

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
no console output

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
Starting kernel
...
<No console output>


## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboard-845c)
* Toolchains: clang-nightly (Debian clang version 21.0.0 )
* Kconfigs: lto-thing, hardening, lto-full

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/config


--
Linaro LKFT
https://lkft.linaro.org
