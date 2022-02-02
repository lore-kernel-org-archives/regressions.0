Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C72F25
	for <regressions@lists.linux.dev>; Wed,  2 Feb 2022 09:02:49 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id k17so58857338ybk.6
        for <regressions@lists.linux.dev>; Wed, 02 Feb 2022 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nnsoRIvHiPW86fgxS/TUyo3uILbX1Bq5yPw+gC/F9ps=;
        b=jcYJckd8Ljg20UUBM8DwyMlBxEUJU28BoexIQ5gFXf8MFvRLjMOwgeby/nQAUMck+R
         zgeldWz3rlkcnHIGXEkgSKvRPy8SUHeUS3OrmhopQkVqhEAb2vNDUW2fuvWFp89tK3iV
         9pB0F0wRWI2n8otQ+w22/W+XEbEhKoHirdS2nzt5A94k2sUJjmpGoGOwTrJJxUF6GF+8
         vycFMQyzdnVq7soCNlNJ1H2g4Vh2o/buypgUT7NDXDrtB7mmB8AFaYV39p8BDzlkzhp2
         aTnWX/6l1y5ppo1UeaT56ne2iZtsOl+OJyMbbD2/SyJOdlqo/h8+2E92sypqrb0rK0f0
         wwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nnsoRIvHiPW86fgxS/TUyo3uILbX1Bq5yPw+gC/F9ps=;
        b=PhpZXKI2Z7RGCum10H4ONNt+qaFuOkI6jkIviS4mXYPf/Fa6NxCpa2mbiUbW1w/WQq
         XAb7Xz7poU41vKEp/fqItpqltFWi/w+mZAm6HwMiSgJQzoXcRJH3civtI77/ZzYfvurp
         L8vPwzj6OQISrxsVT8qYXx+/xVkN+ynRd66fpN5/YdmZUqS3kBxp3llDmHmq3fCvUC/C
         O1WsGME84h1FtdOPV5A5njGc7GyO4biClVXqKa/f0ePY64mwQ77m8opVdkIyGNUcDt+s
         t0DmcT8tt/W8bI3ictbxxcaKjAxBkVNDtXOrHTBHTKTuDuVlycbgks2KUyeqgNf3+39j
         YfeA==
X-Gm-Message-State: AOAM533Tj2dkbp9Yk2RFu8m3giF2VJa80ZByxVSI37k5+kqMVW4zKogr
	I0zpLcXfEAcpYaOsp/URyzyXSNNycGpc8eaSer9BCQ==
X-Google-Smtp-Source: ABdhPJyvdt2XcB7jzRbFPAV1aT4cuO5tnJlamsO5G6CPh11//XRMrUWWSxF02QNQh572rdlKdwV2g/+q7FXHG2ral+o=
X-Received: by 2002:a25:b13:: with SMTP id 19mr37709652ybl.684.1643792568511;
 Wed, 02 Feb 2022 01:02:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Feb 2022 14:32:37 +0530
Message-ID: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
Subject: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to `drm_panel_dp_aux_backlight'
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	dri-devel@lists.freedesktop.org, regressions@lists.linux.dev
Cc: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Grace Mi <grace.mi@ecs.corp-partner.google.com>, 
	Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

Following builds failed on Linux next 20220202 arm architecture.
  - arm-gcc-10-omap2plus_defconfig
  - arm-clang-nightly-shmobile_defconfig
  - arm-gcc-8-lpc32xx_defconfig
  - arm-clang-13-shmobile_defconfig
  - arm-gcc-10-shmobile_defconfig
  - arm-clang-11-shmobile_defconfig
  - arm-clang-11-omap2plus_defconfig
  - arm-clang-13-omap2plus_defconfig
  - arm-clang-11-lpc32xx_defconfig
  - arm-gcc-8-omap2plus_defconfig
  - arm-gcc-9-vexpress_defconfig
  - arm-clang-nightly-lpc32xx_defconfig
  - arm-gcc-9-shmobile_defconfig
  - arm-clang-13-lpc32xx_defconfig
  - arm-gcc-10-sama5_defconfig
  - arm-clang-11-vexpress_defconfig
  - arm-clang-11-sama5_defconfig
  - arm-gcc-9-omap2plus_defconfig
  - arm-clang-nightly-sama5_defconfig
  - arm-clang-13-vexpress_defconfig
  - arm-clang-nightly-vexpress_defconfig
  - arm-gcc-9-lpc32xx_defconfig
  - arm-clang-12-vexpress_defconfig
  - arm-gcc-10-vexpress_defconfig
  - arm-clang-12-shmobile_defconfig
  - arm-gcc-11-omap2plus_defconfig
  - arm-gcc-9-sama5_defconfig
  - arm-gcc-8-shmobile_defconfig
  - arm-gcc-10-lpc32xx_defconfig
  - arm-clang-12-omap2plus_defconfig
  - arm-gcc-8-vexpress_defconfig
  - arm-clang-12-sama5_defconfig
  - arm-clang-nightly-omap2plus_defconfig
  - arm-gcc-11-lpc32xx_defconfig
  - arm-gcc-11-sama5_defconfig
  - arm-gcc-11-shmobile_defconfig
  - arm-gcc-11-vexpress_defconfig
  - arm-gcc-8-sama5_defconfig
  - arm-clang-13-sama5_defconfig
  - arm-clang-12-lpc32xx_defconfig


make --silent --keep-going --jobs=8  ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc' vexpress_defconfig
make --silent --keep-going --jobs=8  ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
`panel_edp_probe':
panel-edp.c:(.text+0xb74): undefined reference to `drm_panel_dp_aux_backlight'
make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git describe: next-20220202
    git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
    target_arch: arm
    kconfig: vexpress_defconfig
    toolchain: gcc-11

Build log:
-------------
https://builds.tuxbuild.com/24XRim72vFXix6l6MdAJNENy6je/

Steps to reproduce:
--------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig vexpress_defconfig

tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig https://builds.tuxbuild.com/24XRim72vFXix6l6MdAJNENy6je/config


--
Linaro LKFT
https://lkft.linaro.org
