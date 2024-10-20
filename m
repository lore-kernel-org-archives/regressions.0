Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE244195FE3
	for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 17:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729446012; cv=none; b=u7gyEQmIfLbW9FGJNxawuRTK2dhjlijbMDwBAOc+BS1w170C2u1SJomscDZENw02kY/HAHuNLSVHb3s4oqeFz7tHJHYszaUhTGeKRov3GF/FcB9YbPj5CN7EJwmdIFY5rh15/Gpojs+ZODfQtmZoXJ5cqSekLuxWFihyZ4PX9VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729446012; c=relaxed/simple;
	bh=/MZUMPHP1MmyAsHFI3p+nistd/d0UbV6Cq7ocTvO5bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL+gOBu4+T+HcN+Kgzf1eq1J1sIbmbas1x2JW97vPBsarlHgDfmjXxNvZ35LBIvHRMZG5YeLH2AIch8GzhCryp3JgeCe4vs/Iql5k/Z/KMcP90PYUQRLfeI+b63yGzrf06TunBmOSMeDdAEOYpduO9AjcVl76M3OLsPgAGBBdNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OBVa1Kb0; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OBVa1Kb0"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-84fe1bc5284so1179683241.0
        for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729446009; x=1730050809; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5dQElZmdOpFlm9UG88kAU1LTaBVdJQXUvWqA3Tf+jXw=;
        b=OBVa1Kb0aQyEGnx12OAm4P4p90FFrYhdyCxXMGBVLR2XSjA+gucQHhPQsdbbxnv+U6
         PiBL6cPQQ209PN1zDoQtqMMx7+D0EZTY7RVfCt7vhNvK5DpN1wLyqR7zrctM2K4llpuQ
         qFDVXX/I5V01UUOEwcJoHzEZ7UQHBRofchCfEQOXma06kSwf3+WncEF10ivPpU+sM+bF
         dki1ZbkPW2U8V8g/cTDUDbuDqBYi06lOIM4DfzpV/Gq/4MljXLP7htG6lhqvwC2jUkG9
         KOqI7Qkj6OXs1QbMHUm6qjAmjqAGKQGtF/JpglWbrc9uHal78f5Ffjn1tY9QjP+ZrfSM
         z6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729446009; x=1730050809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dQElZmdOpFlm9UG88kAU1LTaBVdJQXUvWqA3Tf+jXw=;
        b=wd6MT7O3kYHrDR6LoJq+gTxp4Efbt6Q8Ous2Pp1Dk872riV0HMfe/RdLxAbb0Bo3J+
         vsvmxLkvywt1XlE//ysKxKLgcZZj7DU9HxNieNqhg4UZU+kGO/v6QhYVzaYgCjAIt6Z9
         fR34tv1LP38OBwV2AmbmOkT1Z+h8IS+sT0AYQEsmDgewd7LHPdFyioTTxZYUacqIZA8A
         os64+/Tuj/ZnHhws88bwk5qJwcmIiCou01CmxbhgASFXeVa9OFzo+RJDX+8sBFWhYSIa
         buoLa8c0kPE6OEs1PFr0PMNAwEFr3/NY3AH/vQJVRHXX6CRQJN+AQWW/58qksg8dQrgs
         ivPA==
X-Forwarded-Encrypted: i=1; AJvYcCXUF2y1J41T0nzJBNoohfRL/QwCEcJ3y/FKJ44luR1S7fHC/pd4JQBt5nfNZy8iqS3X40PYh6OrYbjwqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoiSDyei63iuXNEoKahdyx7jEw91RhPKm9n4tbq5gPDz699P7q
	3LfYL4R0zfj2quWGjuuKJyS5s6kEjNvIumEn3eVlGJIjmGTH8F38NEfS/kKjNaDMWHsajuri+IG
	/fOu4AA82ALFN5mLGoPqqMXWxGc4vfwl5KyrN7A==
X-Google-Smtp-Source: AGHT+IG4vi/NuEfb80CzvtYT1ihWDnjiE86tCBRUI0Pm+Ge1Bb280g9GXaYQ34p3oxV9/F2MPuI42yWtHFMEmMGjwcQ=
X-Received: by 2002:a05:6102:3a0d:b0:49e:94e8:acd5 with SMTP id
 ada2fe7eead31-4a5d6b746e3mr8432271137.22.1729446009509; Sun, 20 Oct 2024
 10:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
In-Reply-To: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 20 Oct 2024 23:09:57 +0530
Message-ID: <CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, qemu-devel@nongnu.org
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Aishwarya TCV <Aishwarya.TCV@arm.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 12:35, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The QEMU-ARMv7 boot has failed with the Linux next-20241017 tag.
> The boot log is incomplete, and no kernel crash was detected.
> However, the system did not proceed far enough to reach the login prompt.
>
> Please find the incomplete boot log links below for your reference.
> The Qemu version is 9.0.2.
> The arm devices TI beaglebone x15 boot pass.
>
> This is always reproducible.
> First seen on Linux next-20241017 tag.
>   Good: next-20241016
>   Bad: next-20241017
>
> qemu-armv7:
>   boot:
>     * clang-19-lkftconfig
>     * gcc-13-lkftconfig
>     * clang-nightly-lkftconfig

Anders bisected this boot regressions and found,
# first bad commit:
  [efe8419ae78d65e83edc31aad74b605c12e7d60c]
    vdso: Introduce vdso/page.h

We are investigating the reason for boot failure due to this commit.

Anyone have noticed a similar qemu-arm boot regressions with
the Linux next-20241017 and  next-20241018 tags ?


> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Boot log:
> -------
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.12.0-rc3-next-20241017
> (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0,
> GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1729156545
> [    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> [    0.000000] OF: fdt: Machine model: linux,dummy-virt
> [    0.000000] random: crng init done
> [    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Size (0x04000000) of region at 0x00000000 exceeds
> limit (0x00000000)
> [    0.000000] cma: Failed to reserve 64 MiB on node -1
>
> <nothing after this>
>
> Boot log link,
> -----
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25476340/suite/boot/test/clang-19-lkftconfig/log
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25476340/suite/boot/test/clang-19-lkftconfig/details/
>
> Build images:
> ------
>  - https://storage.tuxsuite.com/public/linaro/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/
>
> Steps to reproduce via qemu:
> ----------------
> /usr/bin/qemu-system-arm -cpu cortex-a15 \
>           -machine virt,gic-version=3 \
>           -nographic -nic none -m 4G -monitor \
>           none -no-reboot -smp 2 \
>           -kernel zImage \
>           -append \"console=ttyAMA0,115200 rootwait root=/dev/vda
> debug verbose console_msg_format=syslog systemd.log_level=warning rw
> earlycon\"
>           -drive
> file=debian_trixie_armhf_rootfs.ext4,if=none,format=raw,id=hd0 \
>           -device virtio-blk-device,drive=hd0
>
> Steps to reproduce with tuxrun reproducer:
> ---------------
> - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/reproducer
>
> Boot history compare link:
> ------------------------
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241017/testrun/25476340/suite/boot/test/clang-19-lkftconfig/history/
>
> metadata:
> ----
>   git describe: next-20241017
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git sha: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/tests/2nYi2nidfMq35VigDlxJblZzokr/
>   toolchain: clang-19, gcc-13 and clang-nightly
>   config: lkftconfig
>   arch: arm
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh
