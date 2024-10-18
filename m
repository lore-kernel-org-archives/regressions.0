Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36910F2
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235129; cv=none; b=U18VLllDh0dXtzTv1lMNnhv83iQtnguc5HqjzIXVXdrG4Lfsj7VcM85NBpwXOLGrNS5urXQ6ZoSa6SLAkqGkiWvze3vxXiezkrT9d+ecPyP13xBZpCB90WHNCUO7Wy7Goex0bqN/bOZvK0iY2hLjYqiwVGGW7V53uDCDl57uKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235129; c=relaxed/simple;
	bh=UD1X7+y4g7xOHbFbP2xrOZwrUf3MVbc6tglEQbeFGag=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=o5VyUFTKL9BeZvJoytdX0hhm8W48pX+Mit3czMiAXAf/QrnGOwA8IK+2htFpFu7fQoNsPbakR7128b4uF0EkqLmrk5bF/OFUGCNeYQzWP/DvPYTc6Nw7A8rqC1S9rYEL5rylazXoXBSajYiulQ6SDztejIpHdRrh0pHLscGWNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ht194gWl; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ht194gWl"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4a46d5aa949so532353137.1
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729235125; x=1729839925; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3EsDn71iKRJbsLqCH6cdyCF8oxK7HkDcTIVHp+N4J44=;
        b=ht194gWlyv2/1tWROJIWmvsJgjahwy3V5+1RU94xgyNfc61JiFzoz+bVi3VNGyrJVT
         +JzX/UrPjXWC40YaNSIB3ZFWFGoV3UFOM2qpIAQceIrerMUWcciCYJsiwdt3WUNXicfS
         L0J38raxg0r0s4PEDUZIBwd7tAw09O2hND75kVVp7DhwaGFUkTfq1v0A4cWqO+SQWaFy
         uHpcLl4g9lTJA+N5dK4zYV7Ie1wpKSRea6jzGIhYR2zTwwKR3V49RyQw18xXnIdQ6pvZ
         tME2VGmK1rMy5Mcj+tyPxrTeNHc1TVMvXcFgCZF8tscvAImANHECuZVmn2bwOyXWspwF
         CnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729235125; x=1729839925;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EsDn71iKRJbsLqCH6cdyCF8oxK7HkDcTIVHp+N4J44=;
        b=Kpi4azUtXcduVK68rCFRg2Wva/K+JDgiWjtfPyGuSY87z758O0cPDApCX6z4zV1KDL
         6zgmAbTTBTMRWLTfwd7qjplPHxhRh2SyJnP9s9kXHSmq2ZxQIwsyIRQssUItn2KV9GiL
         z5XtBmKTNoNUFhN43YUPnWNQRBm5yN3MnLRFW5beFusSrB5tihiFSvVv+ELNC3Z+6DPW
         aEU2ZNinJFnNKhNwbeEaQtai7+VZwHW86VXmK9hNmu2pTXSOYbEWNHrIdznLLRrrwHpi
         GSXIdonCFoXsjHmmxxsqFddbDD0TD7qLG2NL9cJ1vc0FZPM/lo211f4Pk7n3vlUdxjf7
         /kBA==
X-Forwarded-Encrypted: i=1; AJvYcCU8RYX69BUp9b8HvIC7UFzeNdb0TCDUQhkLOXsIQSgj+0CqIEuKPDea9nu9CgSXVjlfwU/aumveQLvczw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBaNyk2mtMxGFK5ksOGQJxOs4jTpolgsGHJvhUdv7BW1r+e0JE
	IxwshVKm+5ajRc51KV6QwFHwD7GCebZKI0QjB3TvOFopux0p25l/0DQFOGKAYb1dDFtsK2dlgqD
	9l4x7c8c49I0kr1g+vV6FTJ51vhnkizHMnm+Y+A==
X-Google-Smtp-Source: AGHT+IEMKaiswjTQniXEOdUFmx1XXP3WE2nVkQ6nLj/7XG+PW7CpRN/Fzi2UzGnsKtcggkXYx1K6vFJBvNS/bVGOk1s=
X-Received: by 2002:a05:6102:e0d:b0:493:bcbd:4633 with SMTP id
 ada2fe7eead31-4a5d6a8c469mr1644327137.3.1729235124950; Fri, 18 Oct 2024
 00:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 18 Oct 2024 12:35:13 +0530
Message-ID: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
Subject: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, qemu-devel@nongnu.org
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The QEMU-ARMv7 boot has failed with the Linux next-20241017 tag.
The boot log is incomplete, and no kernel crash was detected.
However, the system did not proceed far enough to reach the login prompt.

Please find the incomplete boot log links below for your reference.
The Qemu version is 9.0.2.
The arm devices TI beaglebone x15 boot pass.

This is always reproducible.
First seen on Linux next-20241017 tag.
  Good: next-20241016
  Bad: next-20241017

qemu-armv7:
  boot:
    * clang-19-lkftconfig
    * gcc-13-lkftconfig
    * clang-nightly-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
-------
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.12.0-rc3-next-20241017
(tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0,
GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1729156545
[    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt: Machine model: linux,dummy-virt
[    0.000000] random: crng init done
[    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
[    0.000000] printk: legacy bootconsole [pl11] enabled
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Size (0x04000000) of region at 0x00000000 exceeds
limit (0x00000000)
[    0.000000] cma: Failed to reserve 64 MiB on node -1

<nothing after this>

Boot log link,
-----
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25476340/suite/boot/test/clang-19-lkftconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25476340/suite/boot/test/clang-19-lkftconfig/details/

Build images:
------
 - https://storage.tuxsuite.com/public/linaro/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/

Steps to reproduce via qemu:
----------------
/usr/bin/qemu-system-arm -cpu cortex-a15 \
          -machine virt,gic-version=3 \
          -nographic -nic none -m 4G -monitor \
          none -no-reboot -smp 2 \
          -kernel zImage \
          -append \"console=ttyAMA0,115200 rootwait root=/dev/vda
debug verbose console_msg_format=syslog systemd.log_level=warning rw
earlycon\"
          -drive
file=debian_trixie_armhf_rootfs.ext4,if=none,format=raw,id=hd0 \
          -device virtio-blk-device,drive=hd0

Steps to reproduce with tuxrun reproducer:
---------------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/reproducer

Boot history compare link:
------------------------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25476340/suite/boot/test/clang-19-lkftconfig/history/

metadata:
----
  git describe: next-20241017
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/
  toolchain: clang-19, gcc-13 and clang-nightly
  config: lkftconfig
  arch: arm

--
Linaro LKFT
https://lkft.linaro.org
