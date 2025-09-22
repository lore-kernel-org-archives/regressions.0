Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF581A9FB7
	for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542352; cv=none; b=eTQySvv/FnVSZmOoa4l/glEoRO5JGcztSIhhJSy1F6koAhhrHnXdpksj4z7wwcXL44ivyI3OfjynwujeEsR0igVg8C0QZdSjNLQ9YSg9XB7PGioCXvjhllyOdvwmL65FJyQL0iOfxSP9l2qPxmF7V6DITzSVCCSVia33Rlb6nfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542352; c=relaxed/simple;
	bh=kNHccVyhVKFN1OQ3GbJtvkWS9i6VeWKckXRnMPsrSv4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tDutcNTrxLcZwhb8wFsuiR6RD8Zm2Lh5jpuefgoQEqHp2sfreZYRURtwyy9XLYVYX5tW2QKtdEbipooPCdznK8RE1faR22xS2npbfCWyV2ESx6Ig47IIj72MBGlH4dShW2eBbkvkMdA3en6PRlP3a45HKDFkr8grLFZF+b8LRbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qvwgTKvg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qvwgTKvg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2570bf6058aso57623445ad.0
        for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542350; x=1759147150; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc/ZaEN5reK8P6OfyJuXUb0G94xSPoKCeSzYTJwvaOU=;
        b=qvwgTKvg8gxAYUk0s8HfprUMAL7rpmtiQo4cEq7gO7vwvhv9OsYlBp6HCrzuu6ue9t
         Zx9G6IxftnkE514njVtM03e9GjhxL9cM0B+LvsANCh70P9p6MKQbb4x51Q0FHStigm/N
         RpOC9O9Wdmk1JKJf6e3YVYzPBSSkpd3S2m8toGV8ejN+MXU86dMNckC/w1YLaHxZUmSU
         covBycT5+gmPcwST3ZXsgZKXCjgZ/CZvfr46QGX3lZ2tR+XT3e3PW/HBqHEfi4Wyk4Ye
         Lx5MChtS9X+EY6tapjGJdb7k/l/JsHnsotNx6e2DY4WgGv/+JMq/VAhX9cojA7iQj3+n
         hKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542350; x=1759147150;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jc/ZaEN5reK8P6OfyJuXUb0G94xSPoKCeSzYTJwvaOU=;
        b=wRI/WkJjcVxiix4ybRdbk1Hcj5TbJaKJG29FjBpFMo5NyS6R4Guu/euVXgrg/EiHrJ
         jxpxMU0wyQxe0jhhfBWpkGLYc0SiiF8kTjYg25iyqxOn9fIYH7a9TS631u5nFWum0bls
         ghGpySJ/Sui6i2nSaDDa8vUJlw0UDCGHLPGuRc5Jj3PvGuk1LP7d5qGrpWJsZP1RoJLa
         csxiy0Cag1QluP5Rzqw5DHAsH7qVXW919emhQSfDtJNukputJ80aspBtavgcxFyP2SY+
         a0qBf06f9DCw8JVXutHxBO4xF88xyeTKWV5OWD9ttM9BMdfdfVysbmws7Wnm6FEzPwNC
         9Sag==
X-Gm-Message-State: AOJu0YzYnc8+3dHYHjQ3DLUaQOyh1Pyf1xPrNcIoh0u3I3lUb7JiS5d0
	saFCYkrK41x35M33+Nkij+MKUD5oZrsIoXwEiNmu2j52aLIhERGlkXqH6AGLnFyOBiU=
X-Gm-Gg: ASbGncu9ciQD6cPi0s9lCdg9FrpLEfeT2YVBKcCcsZ1pu0jSmdPgAdsDxlIO+vKpmxV
	6iHCDSQlOwRJMRiJQWMemqgBIqfh90Sz/jMY3+tr3h68gDpYkQf0vupn2aFTyDnixXKoE315EXp
	uDYnrIcfzK4ZYr+hLiRpAgEznTcQxCwftbms/WuteXAmK3unZShwpMRyy07OuUO6S8BrzpkM0oB
	dH1OUWesf2CAP6EZPQO5YRZom971Xhk0+c/Uy1V12H9iGNh3ObusctSdZj70e3mUr8TRZAQswOu
	a7aB36CJ2bIG9kX/5iqF2vt8+wd0Q7mBp5qxEZJMtmXZh6ndj0YetwEh0kPeLI0LbiXU6Hkzwxh
	AByPK9Gt+9g73ZZML
X-Google-Smtp-Source: AGHT+IHxWR26+hZsTnhMi81OB66VpMIebZyUX89KVSEEBfQ9MSMsxB6Ng+SwCJAKHMr62MsJr33gZw==
X-Received: by 2002:a17:902:c40d:b0:24c:da3b:7379 with SMTP id d9443c01a7336-269ba43eed1mr193329255ad.16.1758542350080;
        Mon, 22 Sep 2025 04:59:10 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607eaee3sm13100258a91.22.2025.09.22.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/master=3A_=28build=29_in_expansion_of_macro_?=
 =?utf-8?q?=E2=80=98do=5Fdiv=E2=80=99_in_fs/nfs/flexfilelayout/flexfilela=2E?=
 =?utf-8?q?=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 22 Sep 2025 11:59:08 -0000
Message-ID: <175854234825.725.2649537149392155937@166871acc15a>





Hello,

New build issue found on next/master:

---
 in expansion of macro ‘do_div’ in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.note]
---

- dashboard: https://d.kernelci.org/i/maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bf2602a3cb2381fb1a04bf1c39a290518d2538d1
- tags: next-20250922


Log excerpt:
=====================================================
fs/nfs/flexfilelayout/flexfilelayout.c:685:9: note: in expansion of macro ‘do_div’
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~
In file included from ./include/linux/array_size.h:5,
                 from ./include/linux/kernel.h:16:
./include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
./include/linux/compiler.h:76:45: note: in definition of macro ‘likely’
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:685:9: note: in expansion of macro ‘do_div’
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~
./include/asm-generic/div64.h:199:36: error: passing argument 1 of ‘__div64_32’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    u32 * {aka unsigned int *}
fs/nfs/flexfilelayout/flexfilelayout.c:685:9: note: in expansion of macro ‘do_div’
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~
./arch/arm/include/asm/div64.h:24:45: note: expected ‘uint64_t *’ {aka ‘long long unsigned int *’} but argument is of type ‘u32 *’ {aka ‘unsigned int *’}
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                   ~~~~~~~~~~^
fs/nfs/flexfilelayout/flexfilelayout.c: In function ‘calc_dss_id_from_commit’:
./include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                                   ^~
fs/nfs/flexfilelayout/flexfilelayout.c:696:16: note: in expansion of macro ‘do_div’
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~
./include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
./include/linux/compiler.h:76:45: note: in definition of macro ‘likely’
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:696:16: note: in expansion of macro ‘do_div’
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~
./include/asm-generic/div64.h:199:36: error: passing argument 1 of ‘__div64_32’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    u32 * {aka unsigned int *}
fs/nfs/flexfilelayout/flexfilelayout.c:696:16: note: in expansion of macro ‘do_div’
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~
./arch/arm/include/asm/div64.h:24:45: note: expected ‘uint64_t *’ {aka ‘long long unsigned int *’} but argument is of type ‘u32 *’ {aka ‘unsigned int *’}
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                   ~~~~~~~~~~^
  CC      lib/zstd/decompress/zstd_decompress.o
  CC      fs/lockd/clntxdr.o
  AR      drivers/pci/msi/built-in.a
  CC      net/ipv6/ip6_input.o
  CC      net/ethtool/pause.o
  AR      drivers/video/console/built-in.a
  CC      drivers/video/backlight/as3711_bl.o
  CC      net/xfrm/xfrm_sysctl.o
  CC      drivers/pci/pcie/aspm.o
  AR      drivers/pinctrl/sunplus/built-in.a
  CC      drivers/pinctrl/sunxi/pinctrl-sunxi.o
  CC      fs/fat/misc.o
  CC      drivers/video/backlight/backlight.o
  CC      lib/zstd/decompress/zstd_decompress_block.o
  CC      fs/lockd/host.o
cc1: some warnings being treated as errors
  CC      net/ethtool/eee.o

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1305075b320799d36f18b

## multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304375b320799d36f17f

## multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304a75b320799d36f185

## multi_v7_defconfig+CONFIG_SMP=n on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304675b320799d36f182

## multi_v7_defconfig+CONFIG_THUMB2_KERNEL=y on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1304d75b320799d36f188

## multi_v7_defconfig+kselftest on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1305375b320799d36f18e

## multi_v7_defconfig+preempt_rt on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d1305775b320799d36f191


#kernelci issue maestro:2e882f7ffaba317e489e0a937b7ab5ce4ccd25b3

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
