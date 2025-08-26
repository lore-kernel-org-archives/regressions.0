Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7A1CEAC2
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756237556; cv=none; b=ctA93K+V33bAU2o9wMK1KD7BEo7QqNuBorZeKfqZir9QVWgbab6gazQjww0FYYLYOrlqazWi5WOyF1bnA39kZXkX3AuDhIF1GVeuY0TY6JYcUh+3JjcY7kvMHY9DX9BTL9pFduY96/Xssn7BxMWqGBXfsiGzlhO2fYYk6l+b2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756237556; c=relaxed/simple;
	bh=JzdvJ3D4cIox4VnfVjxmXcW2+yE9RmgV3r9R+q8PdFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQhW53EJx1/Qo/I4EJNJni9ZiOwRMQwd1OI+AR0IwocdVuiWIzELh6q3/fajsZ721VZ3CYunStEqGDzWsjrgjZaY5nG+ITBurEXS5/WlSiuNT6gxLqPT0WuyurqlHqdHIM/pz4AxYxCLkILlWEBLIhUIu8/HRXyTReJqeobYKcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2txBGX7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2txBGX7"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f52dd2bf9so33357e87.2
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756237551; x=1756842351; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXuip4G3eXQRlL52moPjD1+7Xz7J18hYMMxbx4Ti2y4=;
        b=S2txBGX7oN9fPl6JjxSCKvlhOV+hR3zy0H6g6iLaQEZu7GtyKLypDILGzRyPLV8L4h
         1runVzS49vImhfRFp5OadYYe9+ksGG1JNguwkQCzchZvghgCZNxb29hEe2DhR6tVA+jP
         yLhYFAn1Jc32tYKLRu0+lUygzcmbGirPBEak1j1aBI7gN+IvixoTZi60wHLIhQUhsPyn
         IDLQLidKnnJiCZ8cs8Nvb/1gj0o9FcdDl8s8n4n1ADq+Kixa81pTh3/hWXaTX3r9VpmB
         Fib4eRfUftSOKHysaxfYKDxzBf4FuNwzsru+gy/HgOMHbvEv00fmwHz4sUw/ab5XUGEA
         f/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756237551; x=1756842351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXuip4G3eXQRlL52moPjD1+7Xz7J18hYMMxbx4Ti2y4=;
        b=xIMbc1hsGpQ+Od8itAX+5Fcd1ZRWT67dP++88+mriaPlAkjVLv2w4o1YVdLvSzGRjO
         tcYOBLvzkpCDSTTVnJ3Zv/wteZyeiA0CsuRxInBIC6mLCI3GBFzT6sPlSRMEK+B7B8Iw
         GfSlRK5RPG2gFixktefhxqhM6XKVL3nuS+m8OrJV6FThDLMMeJYYfPZqrVF6eqswJkUk
         GeudxHoE/uiIzBzWbwMuBFurBqZnNewBekWmBoscZReTy4ZGsnVIwvT8yFwYKTc29TZA
         qQM5nTkjfnyyqWT8dXWgeaQ37gIP6J2TbqAPRWoJ7MClYiWqvK2XX1m1waPoHDI7B2+d
         5N0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6K6Zm3sARpI6zWyHj0Au8M5iknlihikkIPvPEibc8gjQMyYxcBul0EZ66flKX6aQKC9AXMvRZSjlNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYJ3DY25mGjqadhTMJTbeb0og/sA2Jz26TLQBYoFUeHqzGPRaC
	h4o5EiAP6PZCUma4dHKZ2Nn6nLXBMaAWo5U+AGknQcm4zMZIulcvHm7njoKmTbEvDvA=
X-Gm-Gg: ASbGncsTwfjMRilbVT2/7//6wNESDXac6Pxo4TAbIJJZKMkHdiTL+uL8rtAd/YZ2FF8
	vPO9eWllTR03R181z3DAG8BUwJdLrz0ArmKuTRK76QFfLbpyJW9c0f2YVEV2y2wPFHAETlP41W2
	6JKT+ap8mGyfh4Xi16P0rEf3qT5HJnLIVdjzc/WbGIdjvNFQ7Muspj3f0MC/6vC0IpQrKGM1feb
	9zrn4/NETi8aCTy1s24WrFPFL/wpj+sYBqEDYzR/tIAru5IdUquY4u5or63t8Ea2l91SB3kzL6y
	Qwg6B4BHRBII49A0dcAq6yOrWr3G3u2jGYW127FqRnRQiZhpo2rYBFSkUpdixfrY6mAvCwEyl2Z
	/RG2RUcquDYcGmJjMGEv98841Jr+H59NEdULtG3zg/v3F1GPv8gVaqaBw/P2TJ2hvq9dP3obfWC
	Z5MfvkXcSLiIo=
X-Google-Smtp-Source: AGHT+IEt8Nv0C9k6B51P0Bu6omHX78GtGUI5akzFwO0EsKKpWO1hUm2te9ZXs4y0v64KaGbBkwbGtQ==
X-Received: by 2002:a05:651c:20cd:20b0:334:1db:486d with SMTP id 38308e7fff4ca-33650e22e7dmr16358621fa.2.1756237551336;
        Tue, 26 Aug 2025 12:45:51 -0700 (PDT)
Received: from monster (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20cc9csm23313081fa.10.2025.08.26.12.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 12:45:50 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:45:48 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Inochi Amaoto <inochiama@gmail.com>, regressions@lists.linux.dev,
	linux-next@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shradha Gupta <shradhagupta@linux.microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Jonathan Cameron <Jonathan.Cameron@huwei.com>,
	Juergen Gross <jgross@suse.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Chen Wang <unicorn_wang@outlook.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, arnd@arndb.de,
	dan.carpenter@linaro.org, naresh.kamboju@linaro.org,
	benjamin.copeland@linaro.org
Subject: Re: [PATCH v2 2/4] PCI/MSI: Add startup/shutdown for per device
 domains
Message-ID: <aK4O7Hl8NCVEMznB@monster>
References: <20250813232835.43458-1-inochiama@gmail.com>
 <20250813232835.43458-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813232835.43458-3-inochiama@gmail.com>

On 2025-08-14 07:28, Inochi Amaoto wrote:
> As the RISC-V PLIC can not apply affinity setting without calling
> irq_enable(), it will make the interrupt unavailble when using as
> an underlying IRQ chip for MSI controller.
> 
> Implement .irq_startup() and .irq_shutdown() for the PCI MSI and
> MSI-X templates. For chips that specify MSI_FLAG_PCI_MSI_STARTUP_PARENT,
> these startup and shutdown the parent as well, which allows the
> irq on the parent chip to be enabled if the irq is not enabled
> when allocating. This is necessary for the MSI controllers which
> use PLIC as underlying IRQ chip.
> 
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Regressions found while booting the Linux next-20250826 on the
qemu-arm64, qemu-armv7 due to following kernel log.

Bisection identified this commit as the cause of the regression.

Regression Analysis:
- New regression? Yes
- Reproducible? Yes

First seen on the next-20250826
Good: next-20250825
Bad: next-20250826

Test regression: next-20250826 gcc-13 boot failed on qemu-arm64 and
qemu-armv7.

Expected behavior: System should boot normally and virtio block devices
should be detected and initialized immediately.

Actual behavior: System hangs for ~30 seconds during virtio block device
initialization before showing scheduler deadline replenish errors and
failing to complete boot.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

[...]
<6>[    1.369038] virtio-pci 0000:00:01.0: enabling device (0000 ->
0003)
<6>[    1.420097] Serial: 8250/16550 driver, 4 ports, IRQ sharing
enabled
<6>[    1.450858] msm_serial: driver initialized
<6>[    1.454489] SuperH (H)SCI(F) driver initialized
<6>[    1.456056] STM32 USART driver initialized
<6>[    1.513325] loop: module loaded
<6>[    1.515744] virtio_blk virtio0: 2/0/0 default/read/poll queues
<5>[    1.527859] virtio_blk virtio0: [vda] 5397504 512-byte logical
blocks (2.76 GB/2.57 GiB)
<4>[   29.761219] sched: DL replenish lagged too much
[here it hangs]


Reverting this commit restores normal boot behavior.


qemu-arm64
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663822/suite/boot/test/gcc-13-lkftconfig/log

qemu-armv7
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663615/suite/boot/test/gcc-13-lkftconfig/log

## Source
* Git tree:
* https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: d0630b758e593506126e8eda6c3d56097d1847c5
* Git describe: next-20250826
* Project details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: gcc-13-lkftconfig


## Build
* Test history: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663822/suite/boot/test/gcc-13-lkftconfig/history/
* Test link: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/31oo1cMOi0uSNKYApi80iQahbLi
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31onzS5UmJVvvZucEhtB1veoJA1/
* Kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/31onzS5UmJVvvZucEhtB1veoJA1/config

--
Linaro LKFT
https://lkft.linaro.org
