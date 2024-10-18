Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA13188719
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236375; cv=none; b=MVggxbgJE+wiEFl8JRGwazZgXss+4AhcKkgAQ4Vf838EJ8wm0bSwAb+8OZGyoMPJ3/M068RBI8kiHcw+W4VNiU0jPVTdQv0SIyDMPaFAn33tGZ8+foilGJ2GacE9DZuB0JCcVoq9YtRTg/Eizidp2BL3jWv8yxqaErWWzXaqqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236375; c=relaxed/simple;
	bh=+ThqRqTmtPY/PQjy0QZGOVcGlJssgbmHUwKG+5/KdP4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=haUDD++A1wQl7rMk8jc7yYiiaNRqxcdTHNbgQqGcPUFCrOf6YqjZTP13U/UOabEmQc5oLXdfFnocNdFzNaOK5Eugm/pLcDI9NnwPONu1EfeP1M0iZ2o09wYryfP6bCdTN1Hef6/dOXrElu0BGcR0kGCi8URgXBDBZ2kYLMQh2C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X4t0T+Iv; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X4t0T+Iv"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-84fc9005dccso525036241.3
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729236373; x=1729841173; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=piiFALoQ7z5HAKzAwidaLMXt4WFJputVxFgFqSQ8Dsw=;
        b=X4t0T+IvaPohQiGy3cOENQ7S5WR10hDbt6WGQukBz6OrwNDoAMnqA6wfDoVI77dncQ
         pXoEmx8Ui0awArEFpUJtySJQI9WKO2P9cNwgo4++BJJ2vo7rki8QxQME4ksY18m+lkM/
         hwI9TH4AvOotVQ/AjzLkVj8eIeMyJKEOGWU8ZnCC5LxOA9/qyZ2lVCOSagIu/+av36dM
         pjcZ0drdbFSM2tKbTEkiKbYr+hTIb/LR/wwDxWY94uMVoXeKa6x+8p3giQmT/UJqOAds
         JjhSAhCkNGOD2g59DOVNx4/a50H9d0q5fpgo2LfNB7LKQK8dFVICACAhtJxZrVr46BHV
         XxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729236373; x=1729841173;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piiFALoQ7z5HAKzAwidaLMXt4WFJputVxFgFqSQ8Dsw=;
        b=CvCa2/PjzkQYYboM2YfDFRIDowlbDHwU5Er7rJRy5qSjGv03YZEnJrVZpNoS/xHHXZ
         mrpBAWm6m+cYiI4xoUKJFH4IJ6Oz+kXvueW9xNcsSVvp3AhuYvMTlW8trFasG4hQWB8i
         +TfChxrqAsmLk3f5mJ4wmu63BrTPBRO43OUP2hXmdGchFIH1uChCE9JU8IhmFJGQ5Dht
         5tnJ9+fzOQkYQDa7ExOShB+zxHqvdMEJ/Qhiywdlpovwwl5Q47fFKeBQsDrQYa0t9LWV
         bcOo5mt1nCWkYMI3H1vrzI/qdnyWoNdOu3pvJyClDOLmzajnLsAvgRMkuIdYPMHZpGON
         D4MA==
X-Forwarded-Encrypted: i=1; AJvYcCU/GHcinEnAegpyMoMZMzHI5W5Eei7vqa06Os5RArssXhicwdTgcTQWnTy5KKzCFXVbMleUboWesOnS9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaRH3n+zMkCbbPQT+9AiUc6yjyTAu2H/5OFkFyGDLki/N1Moaq
	k9ywrc883tk2oaGRQmpU9Ab+yLI/EBbT5K0WS+hj0bC2U0POXEU4Mlfuxv73gZyXdt+u5AJily3
	MnkxOTfQFPN3IIzfr5rIiWh92WysMtx06Q/1hFw==
X-Google-Smtp-Source: AGHT+IEDuknEZ7zRw7JqileQVNCYUrrUoiK9et5lckka/21EGUZiz4WBPeJonXMswilj/CNUKIzQ6VeF2HZtz3KX07Y=
X-Received: by 2002:a05:6102:956:b0:4a4:97d1:aea0 with SMTP id
 ada2fe7eead31-4a5d6a92561mr1705997137.11.1729236372962; Fri, 18 Oct 2024
 00:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 18 Oct 2024 12:56:01 +0530
Message-ID: <CA+G9fYvx05D7TfRjvdPtKM9iWS6i7b-EHuBAbHEQghvMEg221g@mail.gmail.com>
Subject: Qemu v9.0.2: Boot failed qemu-arm64 with Linux next-20241017 tag
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, qemu-devel@nongnu.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>
Content-Type: text/plain; charset="UTF-8"

The QEMU-arm64 boot has failed with the Linux next-20241017 tag.
The boot log is incomplete, and no kernel crash was detected.
However, the system did not proceed far enough to reach the login prompt.

Please find the incomplete boot log links below for your reference.
The Qemu version is 9.0.2.
The arm64 devices boot pass.

This is always reproducible.
First seen on Linux next-20241017 tag.
  Good: next-20241016
  Bad: next-20241017

qemu-arm64-protected:
  boot:
    * clang-19-lkftconfig
    * gcc-13-lkftconfig
    * clang-nightly-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
---------
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
[    0.000000] Linux version 6.12.0-rc3-next-20241017
(tuxmake@tuxmake) (Debian clang version 19.1.2
(++20241001023520+d5498c39fe6a-1~exp1~20241001143639.51), Debian LLD
19.1.2) #1 SMP PREEMPT @1729156545
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: linux,dummy-virt
[    0.000000] efi: UEFI not found.
[    0.000000] Capping linear region to 51 bits for KVM in nVHE mode
on LVA capable hardware.
...
[    0.000000] Kernel command line: console=ttyAMA0,115200 rootwait
root=/dev/vda debug verbose console_msg_format=syslog
systemd.log_level=warning rw kvm-arm.mode=protected earlycon
...
<6>[    0.305549] SME: maximum available vector length 256 bytes per vector
<6>[    0.306214] SME: default vector length 32 bytes per vector
**
ERROR:target/arm/internals.h:923:regime_is_user: code should not be reached
Bail out! ERROR:target/arm/internals.h:923:regime_is_user: code should
not be reached
<nothing after this>


Boot failed log links,
-------------
 dmesg log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25475692/suite/boot/test/clang-19-lkftconfig/log
 test details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25475692/suite/boot/test/clang-19-lkftconfig/details/

Build image:
-----------
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2nYi294C2rkwmj8hWZ0XnFcTd7F/

Steps to reproduce:
------------
   /usr/bin/qemu-system-aarch64 -cpu max,pauth-impdef=on \
   -machine virt,virtualization=on,gic-version=3,mte=on \
   -nographic -nic none -m 4G -monitor none -no-reboot -smp 2 \
   -kernel Image -append \"console=ttyAMA0,115200 rootwait
root=/dev/vda debug verbose console_msg_format=syslog
systemd.log_level=warning rw kvm-arm.mode=protected earlycon\" \
   -drive file=arm64_rootfs.ext4,if=none,format=raw,id=hd0 -device
virtio-blk-device,drive=hd0

metadata:
----
  git describe: next-20241017
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2nYi294C2rkwmj8hWZ0XnFcTd7F/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2nYi294C2rkwmj8hWZ0XnFcTd7F/
  toolchain: clang-19, gcc-13 and clang-nightly
  config: defconfig
  arch: arm64

--
Linaro LKFT
https://lkft.linaro.org
