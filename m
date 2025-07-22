Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04657F9
	for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194565; cv=none; b=Gwy67Nc7amUSHAenrMPFFvOl0SF+pOn4BUB+34EcBSkJe3QoBqPrCl6AjaucXiVID8nlOI8qZYjeBsaoHK+x37rPFC4/+ptl3qdmrtJoxyGElUHZDV5gaCN83ARi8RhfP7o+eBcK223Mzr3F19wwoidqlWxzVGdLiUuBb33Ziio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194565; c=relaxed/simple;
	bh=Bz2lYfbytRSiejdP21L6tfMCCVrhxdwYUI5Y2oAvcNM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HWhddicZBNtZVjC8CmEEHLysjZTqrJUYtpC4PngnCG1mwS6ha6G47k2gyppecs4bbF5QRkfqu7scE/PdhflKUmoGUnG8UckvEnWH2HBppThmK2DMvkFIkbTubNJxrQm/2ECpT7LI4ZduRkIXGEiq6q87k6AV2sKA25pzmeKkVkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p0kaabCD; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0kaabCD"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so4657450a91.3
        for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 07:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753194563; x=1753799363; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w4j/dqB0FEJVP++msFICUJGBS7c5vIhwDliD0r1Ztug=;
        b=p0kaabCDq8bPpUaPZwoyxDG0+U4lFeJaxi4NFM00RWJlxorCIQ27GoCKRW8MT+kP01
         LCJysOhB3WKV91yMTs/6A1q4CtfFFV4sIKWzK8mm4FCkZixdykpZY+YdSUPmUTf7QUf/
         ZwR8giy+gpJMm1tNq20bolZncu5DilArRJ6msH29TYVoUVbzXRQoITgG2YnzW3/6Nu7T
         mh++ryiQB9gLpLE1OSU6PwaoAFwueWdjnzJsR+tEzb2T1Obod8UkH98lPjDfA734+wI7
         Q7KWuCr04OBrqV8JbpG+5YAd1R/u3ASroe7KCeSRANASdpVRFhHzK6LT3fTJ1WxMXaW2
         pHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194563; x=1753799363;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4j/dqB0FEJVP++msFICUJGBS7c5vIhwDliD0r1Ztug=;
        b=SLYw05UNILBXq1/NoOE2twU+2ocNka5Ei15LBgIy3xa85DODMlW5eTtwGuRcbNyChp
         YYCQD3/0CNbKIiAD+InG/c1GefpH/8bNy/2GMr8Z1hveRgaTboQnQDYRl9vriKjUUmtL
         hZdmz0bOyWzylLmicaUOuUCVQhFLAtCQK9hobmrQ+4F16XOOW0lWWADrjO9QDlX5/Tvq
         WXHjH0cl5Yu6W+pbd5xVeLsluyTi492pOlFq579GzWAwT5xtqcNsfEWm3k96/XxFp8wY
         3mEit3hBRHbHEIJsDXfrxmF4bfoQbKRHtg3tjkEZ33ACB+UvSmTuXr0ruPVDgtipznwm
         Baog==
X-Forwarded-Encrypted: i=1; AJvYcCVoTUH5jOofB15Ri9wx9ItluRIJI5gwz93IOjRnjsmV5nO+nfVdceQW8DoL0J3R7vsPCe6/pf8yKOxfOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsUpVToTIhM00JFTkhPNlK0Z2RMtGnhmdDaxfVummd8Erxqwl1
	Z/n3ZPn9BqyBfJgbeYKFYSzcTNynWxEu8h3Og8HmsjJV25VQOJ6D0axnt2b1xtDQXumShCcjtpp
	CTQfmZ7c7v0VHTEsqrmlEHm24uIgmc/390kWwKq/2qA==
X-Gm-Gg: ASbGnctR4zvfClAtsKE47StDMaNI3AtIDHEOxuniBh9ui+HEalVNV3wpu8HE1Q5flKv
	Dgia0fP3or/430xAi1GkNCWPCX+GpfI36YkANQesAPw+mHfYYyHQPGL3zpzYK7xtfq44+DtZ9tD
	2SmgXxFm852bmbJi0SMxeyzVS6t7zncvoxWY6eFQTOl/09ibMbeO4Z+eKB8jVvSl/yMyT5jsIdk
	Dc6RT40ApyXxlvXHFvMHWxpGO0DCapxFy18KctD
X-Google-Smtp-Source: AGHT+IGViVGo30JiX8Iobzc1nz2CMFoTAV0xD2CPDCL3v8RSJq2399IbiFlY9qPHicdWf4XFVuhv/Tq4f+y6dIWOKcQ=
X-Received: by 2002:a17:90b:2710:b0:311:fde5:c4c2 with SMTP id
 98e67ed59e1d1-31cc2512f33mr21973154a91.1.1753194562844; Tue, 22 Jul 2025
 07:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 22 Jul 2025 19:59:11 +0530
X-Gm-Features: Ac12FXy-ZjVvt-T4i3MttzsHoSjov0ZMbtIf-x7c-wsH5Vg-oeIRD3f4bfuDeLg
Message-ID: <CA+G9fYupPsQoBrtF=-WT0nSy6m+yG1p9m68Z18Bp-Y=QMFD_tQ@mail.gmail.com>
Subject: next-20250717: arm64: rk3399-rock-pi-4b: NFS mount failure with 64K
 page size
To: linux-rockchip@lists.infradead.org, linux-mm <linux-mm@kvack.org>, 
	Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The rk3399-rock-pi-4b device fails to mount the root filesystem over
NFS when the kernel is built with 64K page size.
CONFIG_ARM64_64K_PAGES=y

This regression was first observed with the Linux next-20250717 tag
and continues to persist through next-20250722.

Device: rk3399-rock-pi-4b
Build Configuration: lkftconfig-64k_page_size

Regression Window:

 Good: next-20250716
 Bad: next-20250717.. Still Bad: next-20250722

Kernel Config Impact:
CONFIG_ARM64_64K_PAGES=y  - NFS mount fails
CONFIG_ARM64_4K_PAGES=y  - NFS mount works as expected

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Boot regression:  next-20250717 arm64 rk3399-rock-pi-4b NFS mount
failure with 64K page size

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 6.16.0-rc6-next-20250717
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 13.3.0-16) 13.3.0,
GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT @1752747461
[    0.000000] KASLR disabled due to lack of seed
[    0.000000] Machine model: Radxa ROCK Pi 4B
[    0.000000] efi: UEFI not found.
[    0.000000] earlycon: uart0 at MMIO32 0x00000000ff1a0000 (options
'1500000n8')
[    0.000000] printk: legacy bootconsole [uart0] enabled
[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory
node in the DT
[    0.000000] NUMA: Faking a node at [mem
0x0000000000200000-0x00000000f7ffffff]

<trim>

[    6.520442] Sending DHCP requests ..
[   13.295867] platform sdio-pwrseq: deferred probe pending:
pwrseq_simple: reset control not ready
[   13.295887] dwmmc_rockchip fe310000.mmc: IDMAC supports 32-bit address mode.
[   13.296260] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to fe310000.mmc
[   13.296278] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff650000.video-codec
[   13.297085] dwmmc_rockchip fe310000.mmc: Using internal DMA controller.
[   13.297660] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff660000.video-codec
[   13.298653] dwmmc_rockchip fe310000.mmc: Version ID is 270a
[   13.299536] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff680000.rga
[   13.300164] dwmmc_rockchip fe310000.mmc: DW MMC controller at irq
49,32 bit host data width,256 deep fifo
[   13.301117] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff880000.i2s
[   13.304227] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff8a0000.i2s
[   13.305148] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff8f0000.vop
[   13.306071] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff900000.vop
[   13.307009] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff940000.hdmi
[   13.307937] rockchip-pm-domain
ff310000.power-management:power-controller: sync_state() pending due
to ff9a0000.gpu
[   14.620509] ., OK
[   14.636949] IP-Config: Got DHCP answer from 10.66.16.15, my address
is 10.66.30.7
[   14.637647] IP-Config: Complete:
[   14.637955]      device=eth0, hwaddr=0a:fb:82:cd:ed:a8,
ipaddr=10.66.30.7, mask=255.255.240.0, gw=10.66.16.1
[   14.638845]      host=10.66.30.7, domain=lkftlab, nis-domain=(none)
[   14.639417]      bootserver=0.0.0.0, rootserver=10.66.16.116, rootpath=
[   14.639440]      nameserver0=10.66.16.15
[   14.641679] clk: Disabling unused clocks
[   14.646347] dw-apb-uart ff1a0000.serial: forbid DMA for kernel console
[   14.647091] check access for rdinit=/init failed: -2, ignoring
[   14.762496] VFS: Mounted root (nfs filesystem) on device 0:22.
[   14.763768] devtmpfs: mounted
[   14.775761] Freeing unused kernel memory: 4928K
[   14.776566] Run /sbin/init as init process
[   95.816464] random: crng init done
[  195.556677] nfs: server 10.66.16.116 not responding, still trying
..
[  195.556703] nfs: server 10.66.16.116 not responding, still trying
[  195.556869] nfs: server 10.66.16.116 not responding, still trying
[  195.557010] nfs: server 10.66.16.116 not responding, still trying
[  195.557055] nfs: server 10.66.16.116 not responding, still trying
[  195.557114] nfs: server 10.66.16.116 not responding, still trying
[  195.557166] nfs: server 10.66.16.116 not responding, still trying
[  195.557217] nfs: server 10.66.16.116 not responding, still trying
[  195.557269] nfs: server 10.66.16.116 not responding, still trying
[  195.557304] nfs: server 10.66.16.116 not responding, still trying
[  227.459759] nfs: server 10.66.16.116 OK
[  227.459868] nfs: server 10.66.16.116 OK
[  227.681008] nfs: server 10.66.16.116 OK
[  319.645474] nfs: server 10.66.16.116 OK
[  407.677657] nfs: server 10.66.16.116 OK
[  499.834818] nfs: server 10.66.16.116 OK
[  587.895692] nfs: server 10.66.16.116 OK
[  680.052774] nfs: server 10.66.16.116 OK
[  768.113810] nfs: server 10.66.16.116 OK
[  860.270785] nfs: server 10.66.16.116 OK
#
[  948.331418] nfs: server 10.66.16.116 OK
#
[ 1096.679211] nfs: server 10.66.16.116 OK
#
[ 1274.856436] nfs: server 10.66.16.116 OK
#
[ 1488.985700] nfs: server 10.66.16.116 OK


## Source
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250717/
* Git sha: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
* Git describe: 6.16.0-rc6-next-20250717
* kernel version: next-20250717
* Architectures: arm64 (rock-pi-4b)
* Toolchains: gcc-13
* Kconfigs: defconfig+64K page size

## Test
* Test log: https://qa-reports.linaro.org/api/testruns/29168904/log_file/
* Test LAVA: https://lkft.validation.linaro.org/scheduler/job/8364278#L924
* Test run: https://regressions.linaro.org/lkft/linux-next-master/next-20250717/testruns/1662101/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2zzwHDuV3xvZBKkAtqlmroSxuIS
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2zzwEbz0aS3AtluE2oRQ9gMvFTY/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2zzwEbz0aS3AtluE2oRQ9gMvFTY/config


--
Linaro LKFT
https://lkft.linaro.org
