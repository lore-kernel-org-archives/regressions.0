Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94F1F8AC5
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 22:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756247691; cv=none; b=FFL4yJshlgsFGEplEGafN7oB3NSB+XvWuXWJFdOOolnanNxctxQgEMvInK9s+qGiMhYtkSfSUca+zLKDjStEHddKU233FGxXPkbWKY1NA9HyIC62kYd+OyTERzsVNNcmsj6Ra0JXEGqPHwrZwIOIPRZyt0K4ZHz3Cxd9xMl3PP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756247691; c=relaxed/simple;
	bh=EEkJaAafcOKFyB4lTny68tiYrsafHivmnU/TOutPJ5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCWkaEDbn3qRfhDzEW06sK+jD23yHHlBqnuUZT6rmJZHeYWQO63hvS3Ilqf+HQwN/tepHXjKpjJKxue2mouoN1Hq6HhDY7w0HSxEt73RI4V2OuAOiqWZ1/Jb0LSsC78DkyVUlhDYbHyEG3XLDGpEnnpaL6Azl40YlIWQKyFPj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnkDjaJ/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnkDjaJ/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77201f3d389so847439b3a.2
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 15:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756247689; x=1756852489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MlcTGMUgifx2RiHCp6Ej2dJ6SNZ+6djc1Qx2bk17n0s=;
        b=XnkDjaJ/3bcnA9bunsFPV0KJZ/fFGjC7qeNOsNOtgb9iBlZxvlTOmQ7G/zIQDlDPnw
         jDLR5t/ah8kq+n6OlSIYqrREzJphi8slq1gQd89Ls5AOMC740NLUWdX5PX0Z28efZsj3
         NcAIwfZAStNS5mwfRTlDzAvnedwBLqxhp/wx6w7vFNgaDVDBk9j1Z7suxfJMhtLpSD/L
         Nfr+S4iMPtsJ2jJPsetfMqq2uhK/75qq3H0WQdcEuf1mTsSENP86eJ7kKIisJc6zIXZc
         2CIByROhtJ5MF+MZgS9jB8wuS50oxGExjLMwIo3cU+lg5HlIfe2yGvU53m0Pin+Eoypr
         3ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756247689; x=1756852489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlcTGMUgifx2RiHCp6Ej2dJ6SNZ+6djc1Qx2bk17n0s=;
        b=K23F09YfteLJI1lMU6cfcG2a9nE1aEYTjx7RIJ4nQ668oQZiflC+I3TeQkKEKbJeZv
         GrBCuTuyRWoPHHZMqt6LDLOs5kqVPQ1uafHDvrxYzglavv4cyQQfoVaX4ObxYeKxLj74
         4HT3oH17ONgodR3PALIK79G7eZip6nAc/yliABVsopIAGx/Bw+AmS3cD7MzP7Vn9X19M
         62vrMG43cBavEqB7ytC8VnRMLxKc0gLO6UlwYyB1sNSIlh0IRYBNCi05LxglTPsqIsL1
         lmDjnMbn61aZk3+EU+gjDlHPfv9m7nDl5FxgUgd3BMrp3kbcdtP3pd4yVHnltKqk4qxR
         H/qg==
X-Forwarded-Encrypted: i=1; AJvYcCV+BP1bq0BjrIEtaYxGxZq0Xohu24yGGgnGVK5NQqSseJJECESFqzavA/catRv0ulHRi8XO89Q4wahrBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YybO0OeMokA+HQzkylsVnUk/bhgP+ka81OcxGKbjH0uiqprMXoa
	DhbTL9uvixe0BESAup5tWDncGhIKg2PFFF+2i20VxnVPYymc6EEVnkmT
X-Gm-Gg: ASbGnctf5eT14tNzMm0edGqO7l9Yr1urIamE9s0e9dUqOZVIccd686U4/64i0ryD8kj
	sY71AZTs/YxhARzHeE/hWGntcAg6lehnwC4qQRYLTypqnPnu/id01A/wOvL3/FVcg834m3cFVdf
	VvTI08bFBTx2Y9SuOVVfrpZ9Nd95QN760Y5aq3c77EotlTD6wbPgQ9vvaMY51KNysKT3GeRGDK1
	I8ty+W/+LoE/gv/ZqSP1h8V5jnG4ya8hDZwz3iL+0bex3pyh8o0HpWteUspWv0LKgCeJn9ezeKj
	QbHJ+4w62nsg4E+7+h6qV9tgZSe8XXbGtMDos/hdL8VE3F/0jLKHW2Bw1hlAekxDu83SpqgA/yx
	Xt/1kaHIlbC84D4SWeE6NXQ==
X-Google-Smtp-Source: AGHT+IGfPCTEG8tOKAPJA3d1mdxq78PjG+UtrfIta7Lka4CvtlAMw+MvEMkZiwuGdL1KIgPUDoDSww==
X-Received: by 2002:a05:6a20:734f:b0:240:dc9:71cf with SMTP id adf61e73a8af0-24340d15950mr26206331637.38.1756247689031;
        Tue, 26 Aug 2025 15:34:49 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b49cb8accbasm10005917a12.13.2025.08.26.15.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 15:34:48 -0700 (PDT)
Date: Wed, 27 Aug 2025 06:33:44 +0800
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
Message-ID: <db2pkcmc7tmaozjjihca6qtixkeiy7hlrg325g3pqkuurkvr6u@oyz62hcymvhi>
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

Is there a link for me to get the command line args for qemu? So I can
reproduce it locally.

Regards,
Inochi
