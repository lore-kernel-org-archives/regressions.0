Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62872D5A16
	for <regressions@lists.linux.dev>; Wed,  9 Jul 2025 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057881; cv=none; b=XV0imlFoPZ4JnE38I/1b8v9gMGNWItI4pnSd4F1ATMBlo0qaCdwioH0z4uTIt/w4N45vPRYIYg9Cokx1nhYeI/BmccjwaEVj7qISYmVS7Zzd+WuN1O/e+i+07FNXNGw8eLU+0VyXWlXVj54DSICF2X5UWLHd5ZhpKs0kjpvppVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057881; c=relaxed/simple;
	bh=yOCb08n6dTxn+8x6DVj9LK4gXyvl6SKEuzpMFpGrFiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjcTOAarKQ2DpelSbDNRJTktJjUvJ6QAzIDqeVGSoOis3RvkisnykNL4p+AeXXZ82okzqAPvyvViENbA2Dw/2+FQxTE7I+i1Gt94i+2zoFWZ3NLwFE70IT7YUssPPBJfmVi7ikTUB33p0TZM9KWt9P3Vja/HUES/EmnONyB0Kdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTnIuBw7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTnIuBw7"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso4508272a91.1
        for <regressions@lists.linux.dev>; Wed, 09 Jul 2025 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752057878; x=1752662678; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D8B77kU2J+Ybm9h9uGUkEFQ01LW8PrgIRBca0KXYjU0=;
        b=hTnIuBw7tpw+iNyjDrG+9m0KXYUqmxmiEokhQHbJgSOLK3mIb3ltvqqSDW+dhJyNu3
         2L400ZaVmN1WWRpIWmwiyduinGw3jrq/ncgoGRTwRBiUyLSGzO1xBHsBkgIrxfDoACsb
         ET7YHolSSZ+OacBgXfAbB8D0Fnfb+WgWZgxSMmfOtf5gvXkQ1xshHSZE5lbcxsjUPS/a
         IAShN8Lwr+3jN3SawQ+ARRK3HBVLgYoo0pomfMMEHMwG1D4t+MjSgoVjkVJx/Ik9xXrC
         ID8jxlTYTn/p8LSI1HNGzXo5wlySiQXJQC4qePrtrQLFOlLXjuOFNzFoWeH50xySLUz0
         hx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752057878; x=1752662678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8B77kU2J+Ybm9h9uGUkEFQ01LW8PrgIRBca0KXYjU0=;
        b=II2EDFznrSaAVEcgsMBummmE/4003c1iwY/l8zy4euPjn8OfDteUQWihsnCge6IU9y
         M9QrVJT2bl3/qo6IhOnceOc89jnVgo6PE2Ryhj5aiu1C/4t0O67v6uSNOQx2WQMesqmX
         zAtFcUDtDXlJLwOsH0ROOdI+dwmlaCJADPPE1ZQeXPOOrRvO5CM/LFTbSMrmabnY/2Mi
         RQneGBO9vCMDNdHkmOmbNCvd3Puf97kECiBmaeI/30faTMVjJO5WtWsVTtZaRbkwzUri
         J0u7cY2cHfqp5L90HJ2lpiMTi+s3wOfsSRe0NqAmXKqYp/v8Sq5Mcw+FJaOyx4yCz50S
         ubXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbPphn6+p4DTW72THS4G55I15ocH/glLNka6YMJvpab+WSsg5qyL8B00e8arqG3yykRcWDkASHIYXuew==@lists.linux.dev
X-Gm-Message-State: AOJu0Yybrxq0eC07lbLcSqbqS/EgNDL28bhde6+tVC4pN5r+pHNrww86
	LgFr0n/pGgkhKqYOmlV7EM9W6ewSsx7fsiu6Kbfp0ACidv4Ds6N9fdBIu7jlbwydp7AiaqP61ED
	rh+qWHejJ6mXlA6glAwMZ0AZIEXzmnQotQC4KAmKzCjkYLu4enWeGqHI=
X-Gm-Gg: ASbGncuk0/0JDg++CEG5lDEAREvxatxV5rgIo0VRfiD/pauyet4I17cfnO1jfETvLnT
	GD825b70/LCeEpNCKAx9KR6FUAxoR7HBFcXzAkAId8ttc5MQyaSvcQDl9+8e39JNRBpj6WDxbOG
	i23mNqPv6o9WV1F01mO+RuXiY7nwM8Cb1L9LPRhI2+wBqONOcSr/SZLD1WGUAAhftiU4NFgo9uZ
	J4i
X-Google-Smtp-Source: AGHT+IF2a95UFz+E3M7dK/4U3eUSAXdz1qQAmh7AbREiDIoBeb2vVRykyPSOAbfKv9PM3hbNEiDH/BibegL1kGds8rA=
X-Received: by 2002:a17:90b:2811:b0:311:a314:c2d1 with SMTP id
 98e67ed59e1d1-31c2fd27addmr3020424a91.6.1752057878131; Wed, 09 Jul 2025
 03:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvif6kDDFar5ZK4Dff3XThSrhaZaJundjQYujaJW978yg@mail.gmail.com>
 <20250709002521.GB1599700@nvidia.com>
In-Reply-To: <20250709002521.GB1599700@nvidia.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Jul 2025 16:14:26 +0530
X-Gm-Features: Ac12FXyU-FP3ktQ1sRAwSIeSHnaGDmqm4MOSRwtxAVa2cr-dh9UvRjWr4CHKisQ
Message-ID: <CA+G9fYtOZLYe7yN7EdaEHLyJgVypgKFO2R6POoiEZv7PcLw+3A@mail.gmail.com>
Subject: Re: next-20250702 WARNING iommu io-pgtable-arm.c at
 arm_lpae_map_pages qcom_iommu_map
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: open list <linux-kernel@vger.kernel.org>, iommu@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Nicolin Chen <nicolinc@nvidia.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 05:55, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Jul 09, 2025 at 02:26:20AM +0530, Naresh Kamboju wrote:
> > Regression identified while booting the Dragonboard 410c (Qualcomm
> > APQ8016 SBC) using the Linux next-20250702 kernel tag. During device
> > initialization, the kernel triggers a WARNING in the arm_lpae_map_pages()
> > function, which is part of the IOMMU subsystem. The call trace also involves
> > qcom_iommu_map().
> >
> > Test environments:
> > - Dragonboard-410c
> >
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? Yes
> >
> > Boot regression: next-20250702 WARNING iommu io-pgtable-arm.c at
> > arm_lpae_map_pages qcom_iommu_map
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > List of suspected patches with recent changes.
> >  * https://lore.kernel.org/all/0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com/
>
> Can you test this fix please:


I have tested this patch on top of Linux next-20250702 tag,
and found kernel warning,

[    1.510468] ------------[ cut here ]------------
[    1.516302] WARNING: drivers/iommu/iommu.c:1142 at
iommu_create_device_direct_mappings+0x240/0x258, CPU#1: swapper/0/1
[    1.521001] Modules linked in:
[    1.531485] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.16.0-rc4-next-20250702 #1 PREEMPT
[    1.534538] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    1.543473] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.550241] pc : iommu_create_device_direct_mappings
(drivers/iommu/iommu.c:1142 (discriminator 7))
[    1.556924] lr : iommu_setup_default_domain
(drivers/iommu/iommu.c:2992 (discriminator 1))
[    1.563170] sp : ffff80008002b9c0
[    1.568113] x29: ffff80008002b9e0 x28: 0000000000000000 x27: ffff80008174e2c0
[    1.571596] x26: ffff000004c58030 x25: ffff800081d75228 x24: ffff80008221eba4
[    1.578714] x23: ffff000003d99410 x22: ffff80008002b9c8 x21: ffff000003ce5900
[    1.585833] x20: ffff000003ce5948 x19: ffff000002e6d5a0 x18: 0000000000000000
[    1.592951] x17: ffff000003d4a000 x16: ffff000002c37e00 x15: 07690720076f0774
[    1.600068] x14: 0000000000000000 x13: ffff800082237670 x12: 000000000003786e
[    1.607185] x11: 0000000000000115 x10: 0000000000103758 x9 : 0000000000000000
[    1.614303] x8 : ffff000003ce5d00 x7 : 0000000000000000 x6 : 000000000000003f
[    1.621422] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000001
[    1.628539] x2 : ffff000002ce0000 x1 : ffff000003d99410 x0 : 0000000000000003
[    1.635660] Call trace:
[    1.642766] iommu_create_device_direct_mappings
(drivers/iommu/iommu.c:1142 (discriminator 7)) (P)
[    1.645031] iommu_setup_default_domain (drivers/iommu/iommu.c:2992
(discriminator 1))
[    1.651277] iommu_device_register (drivers/iommu/iommu.c:1905
drivers/iommu/iommu.c:277)
[    1.655877] qcom_iommu_device_probe
(drivers/iommu/arm/arm-smmu/qcom_iommu.c:860)
[    1.660392] platform_probe (drivers/base/platform.c:1404)
[    1.665163] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
[    1.668723] __driver_probe_device (drivers/base/dd.c:799)
[    1.672371] driver_probe_device (drivers/base/dd.c:829)
[    1.676623] __driver_attach (drivers/base/dd.c:1216 drivers/base/dd.c:1155)
[    1.680615] bus_for_each_dev (drivers/base/bus.c:370)
[    1.684434] driver_attach (drivers/base/dd.c:1234)
[    1.688255] bus_add_driver (drivers/base/bus.c:678)
[    1.692073] driver_register (drivers/base/driver.c:249)
[    1.695633] __platform_driver_register (drivers/base/platform.c:868)
[    1.699368] qcom_iommu_init (drivers/iommu/arm/arm-smmu/qcom_iommu.c:943)
[    1.704226] do_one_initcall (init/main.c:1269)
[    1.707873] kernel_init_freeable (init/main.c:1330 (discriminator
1) init/main.c:1347 (discriminator 1) init/main.c:1366 (discriminator
1) init/main.c:1579 (discriminator 1))
[    1.711607] kernel_init (init/main.c:1473)
[    1.716118] ret_from_fork (arch/arm64/kernel/entry.S:863)
[    1.719419] ---[ end trace 0000000000000000 ]---
[    1.723302] iommu 1ef0000.iommu: IOMMU driver was not able to
establish FW requested direct mapping.
[    1.734231] platform 1c00000.gpu: Adding to iommu group 2
[    1.748218] loop: module loaded

Links:
 - https://lkft.validation.linaro.org/scheduler/job/8350682#L2838

> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -229,7 +229,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>                 goto out_unlock;
>
>         pgtbl_cfg = (struct io_pgtable_cfg) {
> -               .pgsize_bitmap  = domain->pgsize_bitmap,
> +               .pgsize_bitmap  = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>                 .ias            = 32,
>                 .oas            = 40,
>                 .tlb            = &qcom_flush_ops,
> @@ -246,6 +246,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>                 goto out_clear_iommu;
>         }
>
> +       /* Update the domain's page sizes to reflect the page table format */
> +       domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
>         domain->geometry.aperture_end = (1ULL << pgtbl_cfg.ias) - 1;
>         domain->geometry.force_aperture = true;
>
> @@ -335,7 +337,6 @@ static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
>
>         mutex_init(&qcom_domain->init_mutex);
>         spin_lock_init(&qcom_domain->pgtbl_lock);
> -       qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
>
>         return &qcom_domain->domain;
>  }
>
> Of all the drivers qcom is the only one that uses the 64 bit arm page
> table, 4 & 64k sizes, and was using the ops global. The io_pgtable
> code will remove one of the two depending on PAGE_SIZE which makes
> things inconsistent and hits that warn.
>
> Jason
