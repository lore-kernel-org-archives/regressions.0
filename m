Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526941DDD1
	for <regressions@lists.linux.dev>; Thu, 10 Jul 2025 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143943; cv=none; b=Do2JPRoWbZT1uhL8/58aSIXbNkA+Ts3n6KdMhnvINLoc6YTGRCN0P1QUq89vGFSl2H3t7dOnaOrDJ5vzaVzG4jpJ9KaydhJ7a4ojgB1aqd0sy9swr6dYxiheVogJXZErfUMfHJLXlB5jF5ZIl/hbLWEicSTmpaPdsbtFaTM3oR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143943; c=relaxed/simple;
	bh=bOq1S86mddNs1t3c+GIE+flM47EO6XwLKrs4d+t/1vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzmDHRToPtS2/guw0VYlpVR72nOnT+A6ArCXXQB/0QYYO+jBq90QfL4Go2qYqXcASFm/L+Lr7p6wrd3n2VP02krXZWW49AFxkQ7ZrhNp0fy7Gx5jHljWRGjgYL1p+SdAbxs+UpKxqATogPl0xvT+4ZDvBMSEnC3fg09oplAkRcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqNpjqM3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqNpjqM3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso840671a91.0
        for <regressions@lists.linux.dev>; Thu, 10 Jul 2025 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752143940; x=1752748740; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MLPDqWFr7HY4ZL0X+/Ee2b+5Y/FPW1cep7YKLBKdVvo=;
        b=lqNpjqM38cwL6yeGO09Mk8Z22EeZ/UzH5zSFaMntFJwFeFM5jWMVCDCcxnIAmYjN3b
         IZL+L8hDKRC6KvG3nPOOoL67jblA8OscCHCEogXAnaGklL+262M4F8Snv9NEGw4FE5sm
         JPJIEiFaHQEk+8kje1JuI+7GceDDgk1mIYWMq8oVbkd9yyw34WY1RdJ3Ex+shWWNI/xQ
         LovLWjuvDgzzfvPSm+aIi/cn2D9X1Sv/uygKgtTEsA1Hpeh4/37eJlIB3UQhrKrZYQ2G
         Eno2/Y9PkZLq6iEfkkMl5MQtKvZoj4+DdgjlGSg98qWMpoUFEX4UW9TZkdRT4ZpPQMWe
         9FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752143940; x=1752748740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLPDqWFr7HY4ZL0X+/Ee2b+5Y/FPW1cep7YKLBKdVvo=;
        b=plyqX6LGLCkA7rZ2omSawdPF3Cho5ge1n1lu7FLnmQVUP4JeeyZn9JXN5uqsiJsb9M
         1Xapv/gZDihfvQMjY5onPRcIVGMtY9dzBPvBY9lGeWzkp/lrRYKJo8l+tpZFZYOEny1g
         XuQxCLb1TWHZmLEu3tbcz4Sukb3CMsFX26TCy9NlYyZfm/Cyr0R8gOkbkRAQ7l/zyoYt
         QA09WXAEVEgIasKtLfeHxb83E8qKpiztACPD06h+XelTP8h2e7y2AbOlMCJKHkP76y/S
         14EQfynafsXplFlN+F1OgTIvZk+9YJmipLEoq2O8US5eiE5HjP5FWcbhGUVB/8pZKaRd
         HTYA==
X-Forwarded-Encrypted: i=1; AJvYcCWuYonhczTjrfyCB/26ExSTYsxsGcMKYfVe3ads4D6nVs5MyQ52jwG1S1piYvoFR3GScjx55vLOdaDXNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTz4wTzW6zgi9//63XbHq6dH3EjmuyyCHFg3rwjggzpAKg6xqT
	+ZC53LhiJb//tYQ7Eo5ZNgPNMy75hqJl6K/jd+ZvlLxNi4IbjouyyMyWv7c+y0cIiCWkdEyJodX
	xva6rqgsYUCsEI9WfXPfvjIHm8ihGzj/Q0lyr81v2ka/7Ov4PmGG7lXI=
X-Gm-Gg: ASbGnctr6rOg2mymo7RUBtq+NFiXdMadrBPuDSuSF4c0H1nUj0k5WKZpkhiTDFIU7x2
	lJ7c1Vg90NyDP/SOFDZi+bgkhyd7yZOI1YeB6GIGUO7WemlMvSvoLN8SEO23IRxCQhqnS4adpxu
	KeO/X/1Dpl+e65ryMwCOaZ/JMmyTMSwHEFZIvyguWULazL38jlFmUp9igQnHCUoOcaEDW2CEMvJ
	tAp
X-Google-Smtp-Source: AGHT+IF9HrmL73KmCwDT1MWVIrgb9v//Mn1nJ3PtCEIP384xvWi3eMjx3HlKX4Pj8a+SRL4ABwL4m3N71r4QX1de5KM=
X-Received: by 2002:a17:90b:4d01:b0:311:d258:3473 with SMTP id
 98e67ed59e1d1-31c2fcffda2mr9114226a91.13.1752143939684; Thu, 10 Jul 2025
 03:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvif6kDDFar5ZK4Dff3XThSrhaZaJundjQYujaJW978yg@mail.gmail.com>
 <20250709002521.GB1599700@nvidia.com> <CA+G9fYtOZLYe7yN7EdaEHLyJgVypgKFO2R6POoiEZv7PcLw+3A@mail.gmail.com>
 <20250709162609.GD1599700@nvidia.com>
In-Reply-To: <20250709162609.GD1599700@nvidia.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Jul 2025 16:08:48 +0530
X-Gm-Features: Ac12FXx5xt6u8jalX3Lvwlf9RAo_uOe7364GnM5xmt0PiJa5mXcltsuEN5V11ag
Message-ID: <CA+G9fYti-72RmdttPNsSzBAxVyt-Oci37mOwCE=YGUR83hEa6A@mail.gmail.com>
Subject: Re: next-20250702 WARNING iommu io-pgtable-arm.c at
 arm_lpae_map_pages qcom_iommu_map
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: open list <linux-kernel@vger.kernel.org>, iommu@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Nicolin Chen <nicolinc@nvidia.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 21:56, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Jul 09, 2025 at 04:14:26PM +0530, Naresh Kamboju wrote:
> > I have tested this patch on top of Linux next-20250702 tag,
> > and found kernel warning,
>
> Oh, yeah, I guess that hacky fix is not going to work.
>
> Then this is probably good enough (against linux-next):
>
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -335,7 +335,7 @@ static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
>
>         mutex_init(&qcom_domain->init_mutex);
>         spin_lock_init(&qcom_domain->pgtbl_lock);
> -       qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
> +       qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_2M;
>
>         return &qcom_domain->domain;
>  }

I have tested the above patch and it fixes the reported issue.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

* https://lkft.validation.linaro.org/scheduler/job/8351756#L2565

--
Linaro LKFT
https://lkft.linaro.org
