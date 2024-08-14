Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041633D3B8
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723649061; cv=none; b=ZHU1iOgeyVIs7MjwOOX4mnf7Os4KJFMtOz8TwIbPYZgWR7zri4wHRds0ouqiYMreiLjpPmM+YQNn1ewWlT7bjL/t0D9B0F1oiXifeyNXiRBaj9defmKtx0OAxIJlbE6+p3UraISpvZT+dYND39nBO4bsG8/CHOjGrrQTpIPBNdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723649061; c=relaxed/simple;
	bh=78oeiAhmfH2ypHqpWxAX9Th+93N4qk57FjBXXcPUyOo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fV3bhIcQJOVM3Uje8WyIMYrBeAghuqjXCLqP/L5lopVAvZpT6tZjD5lBhANyEQlBW170rtozOfPkt3tjLfTev6aatb6ntXqPGZdaIY8gGtL/bpH499HL6HeY3HaWVemOV1URxKeTepGqNYmUxWQI2Sf7dKVSaAOPynZXn/Kfogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKM66Usx; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKM66Usx"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4f50d8ce6e0so3276e0c.0
        for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 08:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723649059; x=1724253859; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dKK1SjuVwmihJZM8PM/ZzRGG6/dddgwtniR8fKhlYrU=;
        b=nKM66UsxIoerWJFf/tRIqKaRehY8GUXaUCJq4Ka/5wsZwQa50dzqjw1d4Y61Oo/G1V
         QPLNlRevPetJdEEM8DTkS2HZbkRebvkbFkogDn77PCGC+yTKyuT3k8qMbn4JcY7A0k/G
         Tqusjzl8Igk2Mlz3Jx3bWzKOBRnwiR2lFmsxDr1ZELZx6CFRqy9glp5YoFnelMInJfXa
         RvB+/GpLcQdq+3hUNt7H7YjWY2x+lrmUKgrfvx4hduwYzZ1EvOZt3sTWVCxZacwSSwxA
         pVEbiie3UaYD+C5CakjRhAUJmDDWiUSEePEMhXi29yaryPLUFoSUloAU75gkTkwVSaTv
         DMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723649059; x=1724253859;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dKK1SjuVwmihJZM8PM/ZzRGG6/dddgwtniR8fKhlYrU=;
        b=ciH5ota+VE6ryxgBbP3HYknL9LqEQbHoKR/0F6yGnZJXlWN6yXQ1pn32wHS2pLM9VY
         A/uhg72rKnUfCbsNHvaaYoIzSFkqX53QpZKcnGua5SHref1lWEC/jvFCsC6JrHqDV/wX
         Cr0zx49Sgh+blkX5UfWN8GU+RvhK6tIXqTZD8LzsDG4WQfZOKFRzeH/1yQTlKubtZc0f
         jlnrRphKtzasJXa3Y/F/6wpA77T8H+GM6Gj4z+VByQPIGUM+pTSpgp2yqRNoHZ8heAyX
         XKPAh5AO5I/97rAodHIyPUpPy68fvBNmnT4wtMwup6MvZ7Bi6rt3U6Q3nnvE4A/3UVvy
         nJAg==
X-Forwarded-Encrypted: i=1; AJvYcCWHXk+eGAtW7IgbaO5agFw6c35PMkfIcWGNV4VKeFeZnJvRhEMYuZ2mOKpYSfJb2v3DY56t1o+vq9kWzpgi41E9tFnQ2kIBA7xs+Gc=
X-Gm-Message-State: AOJu0YxpEutvcdFX4W/GYW3z/qhAEyH2CUr2EI7qKGMFHZajUry2KWKX
	dd8HM09mCK5XfD/59C5SWQHqkiQMYNrnGyXNUmAm0x3Kzu3M5fqP/6xrH9XqXOEMD/VhrUIJh/y
	+ivKN5teqzM7JqTjamkfDoffCW3ncioGuSzqCRg==
X-Google-Smtp-Source: AGHT+IGe86fXSL32SXbx6PialMNJdcooGEDjrhcLw+A99XpN6IMEoxkaon/5KAJGro6qUc/B74E6x1GZ0HckRFnFvD4=
X-Received: by 2002:a05:6122:130a:b0:4ed:12b:ec99 with SMTP id
 71dfb90a1353d-4fad1b0fdafmr4024688e0c.3.1723649058773; Wed, 14 Aug 2024
 08:24:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 14 Aug 2024 20:54:07 +0530
Message-ID: <CA+G9fYuncv0fuBSC0A1z1G_UOv_XuMQz=DsrLZDK-Wc=10ghag@mail.gmail.com>
Subject: next-20240814: bcm2711-rpi-4-b boot failed
To: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, krzk+dt@kernel.org, 
	Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 kernel booting on bcm2711-rpi-4-b boot failed with today's Linux
next-20240814 tag. The boot failed with half boot log [1]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

 GOOD: next-20240813
 BAD:  next-20240814

The first investigation show the following to changes and I have reverted the
following two commits and the boot test is back to pass [2].

$ git log --oneline  next-20240813..next-20240814
arch/arm64/boot/dts/broadcom/
  6e7b99d720da6 ARM: dts: bcm271x: add missing properties to local_intc
  eb81f43c901ff ARM: dts: bcm2837/bcm2712: adjust local intc node names

Links:
---
 Boot failed log:
  [1] https://lkft.validation.linaro.org/scheduler/job/7799601#L430
 Boot pass log after the reverts:
  [2] https://lkft.validation.linaro.org/scheduler/job/7799885#L440

metadata:
-------
  git_describe: next-20240814
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
  kernel_version: 6.11.0-rc3
  toolchain: gcc-13
  artifact-location:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2kdXLykPUNEquDyvXHZbubB5T4p/
  build-url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2kdXLykPUNEquDyvXHZbubB5T4p/
  kernel-config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2kdXLykPUNEquDyvXHZbubB5T4p/config
  build_name: gcc-13-lkftconfig-debug

--
Linaro LKFT
https://lkft.linaro.org
