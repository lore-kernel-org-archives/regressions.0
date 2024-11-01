Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A618D656
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452690; cv=none; b=CACyHf4o2zrGgkrGXbu6xtxnIit3lVSWmDxNrbK6ME1xT90FQE0UqTAonObCfdDSVB9CFwpFrg6fhNO5l97OdRQTR3+1EdqSWEUvRXwM9raa5F4nqY0OHiXVBrBB3ixt/jBXLFztkWmA+wvJMPRO/NhxD1/41eTTpUf0yc5CsY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452690; c=relaxed/simple;
	bh=iGBOTIP0XsSA6R7T39YCzcqONCZ51vSzVDVaWop1K/o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=j5Anj88S/zLU9KYszDa60lGY8IzsylHsq3r7XBDeSAKvcOFJXaPtxyOeRnkwa9b3apiV9X+IeBcWQgBhrgy4ke+r+wUL8IF6wBcbm6+8/sRdnm6g7c1nvZuEiJs6FxAAt4BAn+Xqjx72R9ZnJa3dq57PWx0fiX+l7VIReNKfiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZomgDUAS; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZomgDUAS"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-84fcb020503so827619241.0
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730452687; x=1731057487; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t1KkDbfeRb8/B89WlBjrN65+9n5V//dcukh2+tciQ0U=;
        b=ZomgDUAS39yS1OxMnbzm58UWmPo8E/IhjscNVjQXJY0HFygZijt12NjMUtuQjwzC7u
         2dtweNu8wOBDKxez/nP/LcJnjKgbK18RjBZLIwBqeI6qrgW/c2JOAHKWa+Ivm70zCTGw
         wDQTdZep5CcChLj3Rh59eVKg4+5ziatXiGX/9Jhlxxyuucn9a8dns7v11/ebngR07+6v
         3yA4fYc9sQru+KG919vg6SXYhCvCUp3cSBk6YRj1ptFjvaBtjIW/Wp+CsdWjH3fSVz3b
         +Il3hAlD/m7mV08+2+8HbvjXEIr1aN5lv2Nyfw2zd5w7lmtk0f6GEiL8JlrPsR8LkX4v
         Oo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452687; x=1731057487;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1KkDbfeRb8/B89WlBjrN65+9n5V//dcukh2+tciQ0U=;
        b=T+v4Og+c8geAv1iM2IzI0ddDg3Gh1arPpDUHoT8bHWfuklBjXfO3GRVNck7laU0dKb
         Nvyw3YH5284jtr2YSIqwk2W4SWi2uML6iRy2ApJFhIKe5Yo3W7mf1ekWrBND5gzuAEx+
         zZq6XFtyy7gnj/mm0ASK2lK4E3OSVcVmBGPTzZP0CQvPocdQA6mzKDhLHU1cUvMk8hYL
         8xR7PPIJI1vXKWb/zfGK4DYB65eQdOKt+TSwi+w8u5AJKwOhM4wIMlEBsx9306HRsGps
         LUhtTzAD6r7jyarSE+hbInJU4+NSeA+bHJLmtZdjkoCuECFGDLSoy+Hn79G4iY2qQU+g
         kUtg==
X-Forwarded-Encrypted: i=1; AJvYcCUX2hgVjRlCjJfsA8n49RPT+7Y8xc87pQBerMR0RXZR/DUc5pvjmZC78bUfiUJlktGou6wDiTaX+VxwdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7ZActt854qC4VxL664W/kybWFekwUiHoEU6+h97L5jq8AhTaA
	FzaGwtu/A7PSJc94uFiXuUoRZGQcAmnVB7BO9XAXtiywlRwvMOlDTu5g/iPox/AfKfZG7LA9EgS
	xDXegi/co3+/S2ujsOjdIvI+rNbyzE1c0mCvkgw==
X-Google-Smtp-Source: AGHT+IF/7VeE0qypAZsvB0GHvJRs7OROyaNMivE3QaLLNk11pGcfGJx4Il504Fo5uGv0ogFJJ2/UpZC3ZSupAKDX6qc=
X-Received: by 2002:a05:6102:d8e:b0:4a4:4868:cfd9 with SMTP id
 ada2fe7eead31-4a956c98c4bmr4297604137.1.1730452687441; Fri, 01 Nov 2024
 02:18:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 1 Nov 2024 14:47:56 +0530
Message-ID: <CA+G9fYtioQ22nVr9m22+qyMqUNRsGdA=cFw_j1OUv=x8Pcs-bw@mail.gmail.com>
Subject: next-20241031: drivers/pmdomain/ti/ti_sci_pm_domains.c:134:26: error:
 called object type 'void *' is not a function or function pointer
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux PM <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, d-gole@ti.com, 
	zhangzekun11@huawei.com, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

 The arm clang-19-keystone_defconfig builds failed with clang-19 and
gcc-13 on the
Linux next-20241031 tag.

First seen on Linux next-20241031 tag.
  Good: next-20241030
  Bad:  next-20241031

arm:
  build:
  * gcc-13-keystone_defconfig
  * clang-19-keystone_defconfig
  * clang-nightly-keystone_defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
drivers/pmdomain/ti/ti_sci_pm_domains.c:134:26: error: called object
type 'void *' is not a function or function pointer
  134 |         ret = pm_generic_suspend(dev);
      |               ~~~~~~~~~~~~~~~~~~^
1 error generated.
make[6]: *** [scripts/Makefile.build:229:
drivers/pmdomain/ti/ti_sci_pm_domains.o] Error 1

Build image:
-----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241101/testrun/25629126/suite/build/test/clang-19-keystone_defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241101/testrun/25629126/suite/build/test/clang-19-keystone_defconfig/history/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/build.log

Steps to reproduce:
------------
- # tuxmake --runtime podman --target-arch arm --toolchain clang-19
--kconfig keystone_defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241101
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c88416ba074a8913cf6d61b789dd834bbca6681c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2oElzrg2GdPSWnESXlKVCgvhX5u/
  toolchain: clang-19 (19.1.3) and gcc-13
  config: defconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org
