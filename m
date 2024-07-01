Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CF14D2B1
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719835123; cv=none; b=BnzsK2eaG7nBJAPobu2D2KCTDBTo1LROdoGmyNXi/AZ4aS9cdpdMn7ri/vbirfpsr6vUumRRKqnoNTwnq48fMS9FN1V3dqzwl/gjTZOBOTsMWB8xg+OVsCqrNIboSMgdHk+MZx2xkwctBjWEiMGkxXsvI6jLHbjO054MTe/HBnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719835123; c=relaxed/simple;
	bh=gEOE+ocBdbt+fDzHf37CbGhJxzEUg6Nqi3RW68DDFgk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=V9uMYO0RZbeQ6mPyz16dQ54/FexL0MlVSHqrTxaAG24tphbqQ8T7FtHhvutNmZ5PNJNC87dtL1Cnp5rc+rmaZDBUvfaaHgfblPizC07pPy1zhEBiQjCixFiX5792pFd3eZrasG6PKJPQXUCDOlL+Ql+uc4d8mzkMQ+QMzcF2Kbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xT4/W9nV; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xT4/W9nV"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-80f6e7315cdso704220241.0
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719835120; x=1720439920; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FiDSz9VE0AFUeXEbzLB0AhJfOiLVcxxxs1VWcvfxXRY=;
        b=xT4/W9nVEQSGDSgKe2j+Du74dJJiPF98VTMThqvlfMGximByvc+yb8gPQ9JpiF0Eow
         7usVKg5jnypdy/VdIhNpHLGZD5ZWog3/V2ElYHy3OmP9XxfN21GF3PMiXs3QC5T15RkA
         HM6pFkCqPM1jGJukqAZSlFMeejp/0m8rYLZPRz3NE9LOayZJWxhpzW2YB8FBeVlzwGVc
         4BTTTULoEaAyQ1MAEfOMJaPnZK1HMGBIeUfY14ScYn/Zgnduas6EGAZCH8SrhNHGtHDK
         KWBOLtdk/Xt4gTE7zNnUXcQn75dpphUwZiB8W3n9IaJurkWlCbo1SUF9+gAuhTVgig4s
         4eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719835120; x=1720439920;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiDSz9VE0AFUeXEbzLB0AhJfOiLVcxxxs1VWcvfxXRY=;
        b=q82yDpJSkZpyW9eU5KpBOu/V29qB0kiITrhaGro709QGHvKQ66JMEFL+UfEnnu18It
         WRYVxS7XBbHaVAuhaVfOKQnGszft7jWvXuTYmCBuekR/ShAF5y7oy5oWsw2iJoWKMT5Q
         Ty7Yj0DFVBwxlQjKi8hdBUxyapIu36PDjTdQFeivjnHUJ9S9rzc9Ic2J/HH3OxEgPEsu
         lHDyCAo9l48T7cJ6nSGyzZng+EHxFvayEErF1uQCXxTTAa//WrG9ILEaXGovJnIZDoFu
         oBsKHXXbfBm2ubSVqsSQ6yRl2iol6jiFfnHQhENLyfewecHI8GDAP4Kv0lJZLGsr8bnb
         Z/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVw5UGjPb2qrVAF9+aeT4FbldjkbOgHXfNf6IbeSeBJYvUY6vvvFx21bmxLMw+PYGQ3we8zT8PPZA8rHcA+Zt+nx2qKNIzwmvE2uQc=
X-Gm-Message-State: AOJu0Yz4SStGqq/iwxjrMzSKxIc3tPN3oGBHmwMHZq+DWvpIkOBHPJJm
	MAM+MFMcTzoFRqllW8vWtK1yPNcnZ0ndcw7v9C++t5g7JUwJfGh7n1u5enlfPxoAPmZzYN++W3o
	GNJsesvlcldlBAL+HRM8uyLlabtiLR+npC1UzqQ==
X-Google-Smtp-Source: AGHT+IHXyYi+vErcz2WdDS+6TqDK+01dX2IbGbbnCkxLEnQrj1qDcp5NDG5b+X0fZ+YTkKJiTZEaWoLMJRjDqFi0TsE=
X-Received: by 2002:a67:f343:0:b0:48f:5abc:8b93 with SMTP id
 ada2fe7eead31-48faf132dc7mr5756721137.27.1719835120661; Mon, 01 Jul 2024
 04:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 1 Jul 2024 17:28:29 +0530
Message-ID: <CA+G9fYsXsbHp+0cWoTjEhkpANOav=GLSjPx5ghtUY-FjMPyoSQ@mail.gmail.com>
Subject: Mainline: v6.10-rc6 boot failed across all arm64 devices
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The mainline kernel v6.10-rc6 boot failed across all arm64 devices and
qemu-arm64 and no crash log found (earlycon) did not help.

But the defconfig builds boot PASS.

The boot problem is with defconfig + Extra Kconfigs and builds links
provided in the bottom of this email.

The boot test history shows that,
  GOOD: v6.10-rc5
  BAD:  v6.10-rc6

We are bisecting this issue and get back to you with git bisect results.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Following is the list of build combinations that boot failed.
Regressions found on qemu-arm64, Juno-r2, db410c, db845c, e850-96 and Rock-pi-4.
 - boot/gcc-13-lkftconfig-64k_page_size
 - boot/gcc-13-lkftconfig-kunit
 - boot/gcc-13-lkftconfig-rcutorture
 - boot/gcc-13-lkftconfig-16k_page_size
 - boot/gcc-13-lkftconfig-libgpiod
 - boot/gcc-13-lkftconfig-devicetree
 - boot/gcc-13-lkftconfig-debug-kmemleak
 - boot/gcc-13-lkftconfig-debug
 - boot/gcc-13-lkftconfig


Steps to reproduce boot failure on qemu-arm64:
----------
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2idWuAb51mcz7lO1BAj8Aw0BrNY/reproducer

metadata:
----
  git_describe: v6.10-rc6
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git_sha: 22a40d14b572deb80c0648557f4bd502d7e83826
  git_short_log: 22a40d14b572 ("Linux 6.10-rc6")
  arch: arm64

Links:
-----
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2idWrbdtwMqpD9wx7IPRGJ7Dsx3/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2idWrYDposdlRsS4jwF916a0qGE/
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.10-rc6/testrun/24473346/suite/boot/test/gcc-13-lkftconfig-libgpiod/history/
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.10-rc6/testrun/24473903/suite/boot/test/gcc-13-lkftconfig-rcutorture/history/


--
Linaro LKFT
https://lkft.linaro.org
