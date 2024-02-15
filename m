Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC77134CDE
	for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708010294; cv=none; b=Wz0J5VPaQCJOUOAXfp3Gyel9sr/HluKKBZBq679B98nZgcYoaw2O9jHL/vSbDvpuyQfS4MVG2dMcgXPDU7Ni8qkAiqvpFJQON6dNP/rXGkE/pcQSDIJvIvchdeOTU3pipx/gN7MGNunnkjMnqiaS05AlVyt34nJ2iyDQVlsUrXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708010294; c=relaxed/simple;
	bh=0moq0mcoUJnqJgfLCw56ofLM3dtVq9Kx/sgkFcuifvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/u4smlT7Ka8RenXttaz2uMmoaB0IMcCTMxi7DT+JRrgHdlGzDEfQ+VEg9NEbnSR92UVFV9BQzOA9iZKNm9yWzdUu7iesC6rR/r9qL/HdEBbnnwPDNBONiGc0ULGog86k9jsczcle/QH/v2OpVIi2TxA/rNNyLkRmeYhGUCF2bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOjySPkl; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOjySPkl"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7872ade6f0aso52590685a.1
        for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708010291; x=1708615091; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kwWfU3Ro1z0XktmL8m4mtOaaeAQD2IJrZimJ0lbSENo=;
        b=fOjySPklrzwcBjVYWA59Ez8C5ypK/OEEcFo/ynGWBNf/UZZB2u2HhYLcfeKb7UEla1
         ipvvvoxE/DfxVkxKr133x6gZeoLe8PLIJgqRZC0HvLtdpgYTzi+yDlygB0Eiil8li57I
         FsjOEx9l0X3tzSpdVuqUgCFSvi5xUQjXmYZgRuSbgwOe0zUnFz1ySpCNrrYdErUbzuO/
         pUS7z9DMplI95n4OVgoZNUGwd9kJqkrH9YFf6SAkcCIWGhUgdvZMC9kpT9no6cq1xlSk
         lw1FIcLRUE7TRqzOcmnnTXKEdhv400iLF+8W6uvlTfq794hr09itD3Kg4vR+HcmcGnxS
         aBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708010291; x=1708615091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwWfU3Ro1z0XktmL8m4mtOaaeAQD2IJrZimJ0lbSENo=;
        b=G70D76Fq7xqpsuzROnLISwBsujXyM49LsqzdWZh+yrM5Vd/532IGb1cqXQ46ESXlE7
         zuKaEgwRvpdPZQhLHRBSpPlm47K/C/uXuiiP2W8qjfR/GX+8/kzXGIR2Zg2flkb1ufLw
         HWSIR8e4iEmwv0t2QXTe+u05D7gsNmflYwsW/IwFlVFJ//NijTJzV5sEX2vC0NZnVPKV
         CP6YkBKGvbDSEvkAXuUXbMb1874pvR3faTefkB18Tr/a2lXUD4B4o/NNnmtQYMNBjUCp
         MbNvVdeRCDVe3woJH3odOdEFW2ciKBIc49sFg5FfMGkMhr6XI8oTfCPB3/khVRMrSaBl
         jX0A==
X-Forwarded-Encrypted: i=1; AJvYcCXtadN4fmhoXnLfed2hbRIUGFIioKTAoDXDa/2Xd+lX+Pga02NAXZX28tSrdXlqnLT7IG/fPpIvlYGXs7kT7Eu+Pd+9S7L3/Krra3s=
X-Gm-Message-State: AOJu0YwTFZHz7AbcyGGqiFJ21S5/TnEGI6trYpNilnNPMouJ7iG9SztD
	Lg5CClyHas7Y+Y0awi7OsltZo9a9qcwEBySd0UNf5u1WaH0tJXI34OB6IYg9etzvgpJz8ZsgBno
	AhMzERlnlK+XRey0PzQvgFYt42x+DU97IVv5oDw==
X-Google-Smtp-Source: AGHT+IEZ6QB3M6um48zblbG5/nvFRICNI0XNyCLsrHF5dTGPKc3t3UmN+k1fe2w7rx+t0rUIY2qhxPuZ3tJEtf7DuNA=
X-Received: by 2002:a0c:e409:0:b0:68f:2b7:ae39 with SMTP id
 o9-20020a0ce409000000b0068f02b7ae39mr1704887qvl.40.1708010291520; Thu, 15 Feb
 2024 07:18:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuHF34bSbN9ktKuMAv1eOFVrf+Gw1MC_rG5trUQv9A_Pw@mail.gmail.com>
 <Zc4UZkFp6Jr051gE@slm.duckdns.org>
In-Reply-To: <Zc4UZkFp6Jr051gE@slm.duckdns.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 15 Feb 2024 16:18:00 +0100
Message-ID: <CADYN=9KmFfQM9BxthsOYXraE=hVtydVbOXF8dH6otx_7aSafrQ@mail.gmail.com>
Subject: Re: next-20240215: workqueue.c: undefined reference to `irq_work_queue_on'
To: Tejun Heo <tj@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Feb 2024 at 14:40, Tejun Heo <tj@kernel.org> wrote:
>
> Hello,

Hey Tejun,

>
> Can you see whether the following patch fixes the build?

This patch fixes the build. Thank you for the quick fix.

Tested-by: Anders Roxell <anders.roxell@linaro.org>

>
> diff --git a/init/Kconfig b/init/Kconfig
> index 8df18f3a9748..41be05a8ba5e 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -107,6 +107,8 @@ config CONSTRUCTORS
>
>  config IRQ_WORK
>         bool
> +       depends on SMP
> +       default y
>
>  config BUILDTIME_TABLE_SORT
>         bool
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 04e35dbe6799..6ae441e13804 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -1209,6 +1209,20 @@ static struct irq_work *bh_pool_irq_work(struct worker_pool *pool)
>         return &per_cpu(bh_pool_irq_works, pool->cpu)[high];
>  }
>
> +static void kick_bh_pool(struct worker_pool *pool)
> +{
> +#ifdef CONFIG_SMP
> +       if (unlikely(pool->cpu != smp_processor_id())) {
> +               irq_work_queue_on(bh_pool_irq_work(pool), pool->cpu);
> +               return;
> +       }
> +#endif
> +       if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
> +               raise_softirq_irqoff(HI_SOFTIRQ);
> +       else
> +               raise_softirq_irqoff(TASKLET_SOFTIRQ);
> +}
> +
>  /**
>   * kick_pool - wake up an idle worker if necessary
>   * @pool: pool to kick
> @@ -1227,15 +1241,7 @@ static bool kick_pool(struct worker_pool *pool)
>                 return false;
>
>         if (pool->flags & POOL_BH) {
> -               if (likely(pool->cpu == smp_processor_id())) {
> -                       if (pool->attrs->nice == HIGHPRI_NICE_LEVEL)
> -                               raise_softirq_irqoff(HI_SOFTIRQ);
> -                       else
> -                               raise_softirq_irqoff(TASKLET_SOFTIRQ);
> -               } else {
> -                       irq_work_queue_on(bh_pool_irq_work(pool), pool->cpu);
> -               }
> -
> +               kick_bh_pool(pool);
>                 return true;
>         }
>
