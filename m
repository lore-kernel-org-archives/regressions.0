Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD781AD0
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403227; cv=none; b=BzfWHxMtuIRsr+L1zNvryI70Tm/6E6XPG4BI7iyB1jLxLLOn6+AJ1K2bUHOObTbuQvO8qNUE1Z1OZMuMqiaq34G2bUWNKQOcJEpZOsqk5oF9px9MnMphDspTTixCGsh2B5EfK1o7JhTwA9EzXC6fHiUgxACH+MmfuCN/dO9ScS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403227; c=relaxed/simple;
	bh=/3w9Zil+4uYrNOmcYMZkGVooAinr9yG2hncXQUB9lek=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DQdQmBC5XyhAOMgRvwOiQSWN4gdD/m7Ct9ZaziwyJIpCrOb9laYhkTd+63rSf+J8OvHnFzPXepomFvNiqaL+sRmDdwV3+RerDQUgWRExKoAINRGgy4+r2qVheJ7OL6myAHrcec2bT+5RwBI/bX+k14fM+/niYZillkteXAHhK9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aC5jTA+P; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aC5jTA+P"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5af2358c7e5so2652550eaf.0
        for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714403225; x=1715008025; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kq/mDhjDx0haJOXMYO5ieP1vWAdfCIwGNjDIS1vV1ns=;
        b=aC5jTA+PRAcXkLnoJoDIfcjaNEkmyMnLFKQKC4ZkwkEra0gNfpO4g2ovBbBDWELEPd
         lgH8K3wfpEOspo6xHmZ6WORaJbUwH1bAPBE8bjTsa5bpnR8c2xI/NAEurwaKmXcZu4hB
         ifjB3cWK/Uejz7AXNqPClZyGL+bG1d+SkKQy7cz1tTDo6dLtQ/j8J7pqs1+r9At4cnOH
         z1wPNo7JkaBuoBu8n1dFIlv7cUgY+kEYCYOsRvLO8BnZBFbmCPoAGMWtaSx37JCbFUvQ
         XMK6Q6kl/DzMGoXx0h3vLuHV5E/QCmIQsYZZ71qX6nIPEhvnOEjSoq8bIqAPrPTbFZie
         2VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403225; x=1715008025;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kq/mDhjDx0haJOXMYO5ieP1vWAdfCIwGNjDIS1vV1ns=;
        b=UPqf2sHRrVZO4fT75xRwQHPszeCfi9Poh3f3ZqlQiDDMx+6prDfFTVVE20JJ51zcnI
         VRS4DKVV+J9Nt+gD0S4iXFBJ06Xi3pItO1CV0qHuzDcQ9HldA8ADAJ6th6qtSX1oto79
         x5zBtddU82Wxi2baBPYIbA88ZtEtGG9s/NSCJnHSDasPsE8rH4epRvB0Uuns+X6rxsKS
         wnpzvPcGEDEuFQfd5ow7uX84r6Ssi/Tfo2C2Bm5bP2FvfZWzvZd/9uaol/QL6N9mq2ns
         apM7zVAufzIag63CFRamvtQ4LMtuDinPdef8WEYwpZKgT9ymV6k1YWUFgBj4F39IQmee
         TR7g==
X-Forwarded-Encrypted: i=1; AJvYcCVtLV0GpnNPp13a/vpdSNpbuo+ZPkA9QGoKH64eeZ5Uh3nZ/WoS6810yaAvvAYrj9A9xsknOJ0+le30qeQtm+wYKfsF028210QDWxw=
X-Gm-Message-State: AOJu0Yw1Lf+gXnXbqAqX1ZS/fhpMHvqzEtuxdatX3jf4R2WolY18H+En
	7W9cUSZbaMKA+f7Qdjb/bvBwH4CwZ17i3IksBXxqeegEsWpnF05XRiEpXbRFjaL+IIHAVYWDCmZ
	Ea8uw2hcFAlBSK2JfxXeEevtCo+JRAafjjjvx3w==
X-Google-Smtp-Source: AGHT+IGi7klXrfkLGYDk0bH46vsiOhdwy/HLQn/JmrZKyHF7xJC4yozyKeAYx8uVrhCWOCacbYNZwg87iwhAtb2HZSs=
X-Received: by 2002:a05:6358:5d91:b0:186:3fcb:8da9 with SMTP id
 s17-20020a0563585d9100b001863fcb8da9mr11016997rwm.21.1714403224770; Mon, 29
 Apr 2024 08:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 29 Apr 2024 20:36:53 +0530
Message-ID: <CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com>
Subject: nouveau: r535.c:1266:3: error: label at end of compound statement
 default: with gcc-8
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Cc: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following build warnings / errors noticed on Linux next-20240429 tag on the
arm64, arm and riscv with gcc-8 and gcc-13 builds pass.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Commit id:
 b58a0bc904ff nouveau: add command-line GSP-RM registry support

Buids:
--
  gcc-8-arm64-defconfig - Fail
  gcc-8-arm-defconfig - Fail
  gcc-8-riscv-defconfig - Fail

Build log:
----
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'build_registry':
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at
end of compound statement
   default:
   ^~~~~~~
make[7]: *** [scripts/Makefile.build:244:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1

metadata:
  git_describe: next-20240429
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: b0a2c79c6f35 ("Add linux-next specific files for 20240429")
  arch: arm64, arm, riscv
  toolchain: gcc-8

Steps to reproduce:
----
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2flcoOuqVJfhTvX4AOYsWMd5hqe/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23704376/suite/build/test/gcc-8-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23705756/suite/build/test/gcc-8-defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
