Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D581C8FA7
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717071668; cv=none; b=W2WCfdUaw+JBLeKQNWD2UhdQs0C+LIilEVaT9lgQdFNV83+XnUAhW1n4FZmaPSW8Exy/M5VIQc1CvhqhxssbQXHiqYJ1RmMnmwJ6IFyEd4u/Ehr6X4FBUtarc7EdPP3i1sSMH+Hk+vtyh8ubIwATlo23TTBA88Q4lnQV/LcAemg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717071668; c=relaxed/simple;
	bh=8HQgs2bIZJeSzUXXR37T/KQj003N1PicGc6R84rQ6b4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=j80bqxHNSHjUKfMzwnt/cvWB3yLk0Yr49sQZam8ixdY6q2DS/sSV7aQu0L8RIvGfnnwMnkGRliAuhJJjhxrEJ8rZYg6OXogdJ2X7H2BCiXsOCuwXdF6zFdmlKuws7iLIlstCENwxzVT9fxEDHYNaUqamVC6ocjJGRY31qzvYEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pC6pQr1C; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pC6pQr1C"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4eacd4c1c93so280629e0c.0
        for <regressions@lists.linux.dev>; Thu, 30 May 2024 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717071664; x=1717676464; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v1Y4EC+Vl3y/mxPDgl8+ARcytlJRa8bN9srCkIlilYA=;
        b=pC6pQr1Cw7QN++Rt/20Bm32WSOl04Sv44sD7om1jNxuIjw0bQgjlmJh+wufAGih/mO
         GozCJ+ukf/f4/2tUXcnfKHjUU2pExzfSBj2o4ikf5pTM9LZ0IRSQ4x9ybK8BJd6xwzhv
         fBE+efFP9PLWA7sMGKnHsMbWif9O0RmzU9cLlfoa3DHsCC+OQR6Tp6WHC8z9d1y+2jj3
         lD0JnfqaeFGm04utcmL4NJDlREX/9dOfvw8oYQTgOnfYAiHvzdQpn8+CT3OJp5b9G655
         P2jV+cf43Dv/ZJPU1LvD/y4If3zqaUGVsSuPHxGZmEWXky1ahJMXqmK4TyaYPquLFyAm
         J/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717071664; x=1717676464;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1Y4EC+Vl3y/mxPDgl8+ARcytlJRa8bN9srCkIlilYA=;
        b=WYB1JKLaBdSKRLWEs5zJsz6UnN2LRyHzMfLuo0ig5/2oDJF3XnjVU522vFCvsEs8wr
         5XNd1F7xjxq4nxiYbmQUYoz5xg6MzMrr1qoUIUgKaX7bLxQ93nvjlSMWRBz3kCdm0dVY
         +OrcBUjx2pKfkIVujCOjYdpcd02Fht9U4a0TGG/u8sIlD2Vvz0fDkJ5nkki6EmI+XV/0
         sKyvJFMrFMncAYU9Be89m5SyroFbmQaA39De5D1bEbd5P9TzA64tk2f0EOCgHivRr0rh
         XqG0JotqR0tnUzWJWfgEaFux/fbfSM3q7XwhBvdVHhseh5bayevoqrv3cfi1M43TZaSJ
         HNcA==
X-Forwarded-Encrypted: i=1; AJvYcCXvpvb6ON+05bZtduqYkvPDth7ItnsAeDSoEyGG9VPB3Ndv9YvWpqVg/rtI68jzMgm7TmswJquRwdWFnTYum6zox+6OpwkXDA583Mk=
X-Gm-Message-State: AOJu0YxpapDnIBfn9JB/teBWTESlWByS3u7iWX2STNXV9BzsJymbQy3E
	TJOK08h7pTvc30igESRZE+0Kbsd6wxQ0/MeYxyJS6SSrhDwC3/qouI/ZUEiAMeNuyaB8tUQRJmp
	a4k0t91SeaCuTeIQCoFNh5OifT1D8nQ6XiM+img==
X-Google-Smtp-Source: AGHT+IF8N1bqnuXOjZNpSTjG4359awFqoPkPrI5tsAypoZsac9kT1nKvP1mjv7Cjntk3JR1XaZe3bUmc9hbvrM4pRhE=
X-Received: by 2002:a05:6122:319c:b0:4e4:ecd0:fcba with SMTP id
 71dfb90a1353d-4eaf21a9480mr2299111e0c.7.1717071663960; Thu, 30 May 2024
 05:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 May 2024 17:50:52 +0530
Message-ID: <CA+G9fYuZ+pf6p8AXMZWtdFtX-gbG8HMaBKp=XbxcdzA_QeLkxQ@mail.gmail.com>
Subject: arm-linux-gnueabihf-ld: kernel/rcu/update.o:update.c:(.text+0x1cc4):
 more undefined references to `__bad_cmpxchg' follow
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rcu <rcu@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, eeraj.upadhyay@kernel.org, 
	John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

The arm builds failed on Linux next with gcc-13 and clang-18.

Config: arm imx_v6_v7_defconfig - failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----
arm-linux-gnueabihf-ld: kernel/rcu/update.o: in function
`rcu_trc_cmpxchg_need_qs':
update.c:(.text+0x348): undefined reference to `__bad_cmpxchg'
arm-linux-gnueabihf-ld: kernel/rcu/update.o: in function
`rcu_read_unlock_trace_special':
update.c:(.text+0x41c): undefined reference to `__bad_cmpxchg'
arm-linux-gnueabihf-ld: kernel/rcu/update.o: in function
`trc_read_check_handler':
update.c:(.text+0x4b0): undefined reference to `__bad_cmpxchg'
arm-linux-gnueabihf-ld: kernel/rcu/update.o: in function `trc_inspect_reader':
update.c:(.text+0x1518): undefined reference to `__bad_cmpxchg'
arm-linux-gnueabihf-ld: update.c:(.text+0x1548): undefined reference
to `__bad_cmpxchg'
arm-linux-gnueabihf-ld: kernel/rcu/update.o:update.c:(.text+0x1cc4):
more undefined references to `__bad_cmpxchg' follow
make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:34: vmlinux] Error 1

metadata:
  git_describe: next-20240529
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: 9d99040b1bc8 ("Add linux-next specific files for 20240529")
  job_url: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/2h944W0LTbtfMPlDNiOq17hXpQ8

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240529/testrun/24129266/suite/build/test/gcc-13-imx_v6_v7_defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240529/testrun/24129266/suite/build/test/gcc-13-imx_v6_v7_defconfig/log


--
Linaro LKFT
https://lkft.linaro.org
