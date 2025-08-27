Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF778634EC
	for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756287931; cv=none; b=Ib14aMKCgNb3auZ7L7fk/zborzdySbWxn2V4uvJlOB3X3Z31Xtrjb5baHzVQMdqo1IMrYdX6wZfsXK5E+IytHan4bdV9HfdgFpQkZiZmImHV0Fi3OPtI9+j7XEnfNKZ83L/VCPasRnGaTLiqz2QSW5Ymqr5lEs5IUA2kj84Z2wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756287931; c=relaxed/simple;
	bh=R6h0C8QF6kFJPhSbdoTT06TREMj72FGcByDJ7m35uj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ+nq/6A8hRrSGnq3dBADPWywWnaq8ewSySpXxqp83f6E3IZYO0b1ay1pyXl4o2qRRZy4ecgUQAO1BcuB8xPCiGhDiCnXHQZnquQxKee1z7wqk9MBuGYnyZdAurvK23vr8zpuI161eHGN2chy72FPILAcAxoRQzkHT70oivVfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I45s4PWm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I45s4PWm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-327705d0a9bso417147a91.0
        for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 02:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756287929; x=1756892729; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8ciAYaijUW2dV5+W66fBDEosTSZxoFX6wI5Kkuevz8=;
        b=I45s4PWmqMQYKeH+6N1+sN403dz5eRcCnac07lDk/8yrdwZmk86hHek/sDKQ0plaXz
         pwa6tJUgo+/5brRrbL7F8ifgA+BaQ4JCRrqHFqJYtydEQXymYffyQHjW8QQhxWREhECj
         0M5yBHC+5MWUr8h1PgO0iJgtfstQPkEIuuj26jF3MVdLlmgIervtBv7mBtMklfcDHmUY
         EAXa6C+64aVUcVOL1yHFXgg9d2eAS8FjpJjwVuR5BzA+QQCt6HzciosL6RIZ9Sg5FyMr
         nq342hNDumq9dyMtQgSj3HrzDuJ1Q3SFAbSJo8czwOLuVjqj1oONHpglpOAzYOMVvJ+Y
         RX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756287929; x=1756892729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8ciAYaijUW2dV5+W66fBDEosTSZxoFX6wI5Kkuevz8=;
        b=VU00LZRrGRUnsonXBU7bpKgkABBI3ErOJqeYsEpflBH4CmCwSRXAn9Bh/zKkHFETCl
         +SuOW6Esz0JkDPfsYH5NrzkY3Wryw9tZ15ibCny2CDPbN9r014or606hPDLx2aqqy/yN
         yBlNbsU4nngm22D7rOWt3Bu3NBQ1rcE9CLpi36nMG2r9Ck16LPmO2HzpqS4+XCegv0MZ
         JwEEoECinxct/62IL+lnxkfEs5U1nEQQOsRRaYbTJYoLHHYv7R3iKts7kl/Cr+kBd/aM
         NqihL53m03fGOvsTY+w3kwhqlhajKGjfIJ1Ad19uzro2tgf92YY/F0l5RkRgQpNcT4cX
         7NBw==
X-Forwarded-Encrypted: i=1; AJvYcCXVz9VnWoGqC3WEoxispARuvW+Indqv0NccPXHH1UPi30sdhgCPMRz3tH9mmSFDSozViX6Jon6MJMVN4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDvGSlVtou/FBs0Ztoz6moJDtOlW3YB54GDshPlZtOg1Z61moo
	TSjFbPaf7Qb28RkmZz61/v0SASXSpubbkA6FW1mWueNvbpXkEw4G4H3t
X-Gm-Gg: ASbGncu/OHH6psyOLBqBae6fabOnEm5h1wR5a7sQO5heCTrHbT9p7cUa9MhcmpGmaVJ
	7SjGm/mTZiWukW63Y+QqXNsGTCjE5mqkEgq5d3Ne5jvWoNHWZNqoEmw9a/goufuZu6OxyS4/Eh5
	o8zSS22jADOmOOclv12lN0j+HatvNbj/T6oJJATTaQKY6ftyUSoZRDx8j19GnH4X5gVvcFTeIU6
	tkfximIoMWVtNEzHM9GTBtMng/UwN4im5yXm7LXVOk6WL71HEWjILhXBDBnZArPvrbNJgiNbYbg
	NdrNidf9eUjLKk6Y+wo1e4yuRhWO6/7KjO3fIuP9nuNE7rzfXzG2mYqY2EipMsXonx/Ry9W1QL/
	as008u8KS28X2tQBBigsGWdpZpkEYj5nL
X-Google-Smtp-Source: AGHT+IG7BiXciOhftT0zwrL7uy6uZPq0abR96qO3gTIwFnSas8/UNM3c8OCqxk8XY09pWhYXxF+JYQ==
X-Received: by 2002:a17:90b:288e:b0:324:dfd8:3426 with SMTP id 98e67ed59e1d1-32518a8c604mr23986705a91.35.1756287929150;
        Wed, 27 Aug 2025 02:45:29 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3276f59fdf7sm1592558a91.5.2025.08.27.02.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 02:45:28 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:44:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>, regressions@lists.linux.dev, linux-next@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Shradha Gupta <shradhagupta@linux.microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Jonathan Cameron <Jonathan.Cameron@huwei.com>, 
	Juergen Gross <jgross@suse.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Chen Wang <unicorn_wang@outlook.com>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, arnd@arndb.de, dan.carpenter@linaro.org, 
	naresh.kamboju@linaro.org, benjamin.copeland@linaro.org
Subject: Re: [PATCH v2 2/4] PCI/MSI: Add startup/shutdown for per device
 domains
Message-ID: <sn27guw2aho2fudqigsuaz4pmlwxuu53qj3raoytd4s3a7ky4n@lnocdajrtmsp>
References: <20250813232835.43458-1-inochiama@gmail.com>
 <20250813232835.43458-3-inochiama@gmail.com>
 <aK4O7Hl8NCVEMznB@monster>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aK4O7Hl8NCVEMznB@monster>

On Tue, Aug 26, 2025 at 09:45:48PM +0200, Anders Roxell wrote:
> On 2025-08-14 07:28, Inochi Amaoto wrote:
> > As the RISC-V PLIC can not apply affinity setting without calling
> > irq_enable(), it will make the interrupt unavailble when using as
> > an underlying IRQ chip for MSI controller.
> > 
> > Implement .irq_startup() and .irq_shutdown() for the PCI MSI and
> > MSI-X templates. For chips that specify MSI_FLAG_PCI_MSI_STARTUP_PARENT,
> > these startup and shutdown the parent as well, which allows the
> > irq on the parent chip to be enabled if the irq is not enabled
> > when allocating. This is necessary for the MSI controllers which
> > use PLIC as underlying IRQ chip.
> > 
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Regressions found while booting the Linux next-20250826 on the
> qemu-arm64, qemu-armv7 due to following kernel log.
> 
> Bisection identified this commit as the cause of the regression.
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducible? Yes
> 
> First seen on the next-20250826
> Good: next-20250825
> Bad: next-20250826
> 
> Test regression: next-20250826 gcc-13 boot failed on qemu-arm64 and
> qemu-armv7.
> 
> Expected behavior: System should boot normally and virtio block devices
> should be detected and initialized immediately.
> 
> Actual behavior: System hangs for ~30 seconds during virtio block device
> initialization before showing scheduler deadline replenish errors and
> failing to complete boot.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> [...]
> <6>[    1.369038] virtio-pci 0000:00:01.0: enabling device (0000 ->
> 0003)
> <6>[    1.420097] Serial: 8250/16550 driver, 4 ports, IRQ sharing
> enabled
> <6>[    1.450858] msm_serial: driver initialized
> <6>[    1.454489] SuperH (H)SCI(F) driver initialized
> <6>[    1.456056] STM32 USART driver initialized
> <6>[    1.513325] loop: module loaded
> <6>[    1.515744] virtio_blk virtio0: 2/0/0 default/read/poll queues
> <5>[    1.527859] virtio_blk virtio0: [vda] 5397504 512-byte logical
> blocks (2.76 GB/2.57 GiB)
> <4>[   29.761219] sched: DL replenish lagged too much
> [here it hangs]
> 
> 
> Reverting this commit restores normal boot behavior.
> 
> 
> qemu-arm64
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663822/suite/boot/test/gcc-13-lkftconfig/log
> 
> qemu-armv7
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663615/suite/boot/test/gcc-13-lkftconfig/log
> 
> ## Source
> * Git tree:
> * https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: d0630b758e593506126e8eda6c3d56097d1847c5
> * Git describe: next-20250826
> * Project details: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826
> * Architectures: arm64
> * Toolchains: gcc-13
> * Kconfigs: gcc-13-lkftconfig
> 
> 
> ## Build
> * Test history: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250826/testrun/29663822/suite/boot/test/gcc-13-lkftconfig/history/
> * Test link: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/31oo1cMOi0uSNKYApi80iQahbLi
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31onzS5UmJVvvZucEhtB1veoJA1/
> * Kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/31onzS5UmJVvvZucEhtB1veoJA1/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

Fix patch is here:

https://lore.kernel.org/all/20250827062911.203106-1-inochiama@gmail.com/

Regards,
Inochi
