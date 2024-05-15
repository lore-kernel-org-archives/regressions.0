Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E151C2B
	for <regressions@lists.linux.dev>; Wed, 15 May 2024 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715792763; cv=none; b=hetSJqSFx1xyA+hGMssos2p0q1QO0CfNio80vJGW/jalStQPWWE7Ae3C4iVEQ2/Ulw9c/hhTaeG8E8PHMUYNpBG1OT9eMIe1T36SoNhAKmaxzDpM1a5CLWuGiSDjVYN/QmPaXvj+P9ct8GxTnVKj1LT6yemD+UursAX501Ee5ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715792763; c=relaxed/simple;
	bh=dw1/uSbgCqNummnAusaarJatdbzq8Y7V3aaolPrBpPE=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=aWbn9gqwrueOChWkyeeDj7MLItpf2Anf1RzeTXAWDs9i3bDzT0qGTKTFc6JVFCrulmGoQeZ4QcBfHKHLjy54CLmUi5PvDBYO9GpdGGW+m/+gwBEHG/5nucGENESKLNJRGj6fLF4kdhL2MUOFmdhCdEbG0SW38XvafaNaBoRJh88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ADmM5woA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ADmM5woA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ee0132a6f3so55442445ad.0
        for <regressions@lists.linux.dev>; Wed, 15 May 2024 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1715792760; x=1716397560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQQzdQzBGV3DZrL9QqRIhsLoIytzbr5Nn+q/+rp6S9U=;
        b=ADmM5woARqZOjIZ7fmOQEM3RwFz42uyHgR6iVlk0HcgeRFhySLKZ8GqkuhySQ+KF0K
         YDOK/NtnOM9ZnS0C5gZhUzaZc+eVcru7gaa5iRghxTRY1fdGjmZyP94d6+4ZU4LvbThS
         H7UNw7MV3o3G79L5XmDkkhulmdgCKL/y/Xtz47iORvJ1bRFkQvJz9WYYyHHVfSWTGaLR
         miwM5gw/InCjgJ+ytdYo9xoLc513LVB/6jcRrBccc6uuhLglosXJBS46klSCwooysI4P
         fwkVb05Fy6g4XG7hk5YOBVpatF4+35/Mf6ehwQJh3nE0nH3qOyVtXN/gp7LFYDlFC8ys
         Yypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715792760; x=1716397560;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQQzdQzBGV3DZrL9QqRIhsLoIytzbr5Nn+q/+rp6S9U=;
        b=GjncG10YVW7kew5SEwvf9mn+GHLhEpkSdOn0tA+yeu4GpIelv7w+0lD/WFzIAQa8EL
         2QlIWUGEJy+hkSVTUIS4NpfdHW+3ST7VXWOIkLd+sZ4rhvwslmVHfboWN3h/A8/b1fNj
         oXLLOh4+5Zwr/drSVG42fi9wa2/BvDWDAY9+qXaYEiKHbMEtPULGyEOr6YoUSBjSQW6S
         bL0vzZmZxlbIR9o+RpjsUfE7js+Q+pAZccQXQKBBT0t1Qlynh0NwWGrR+J6kdbevIAIB
         VffjyP2XACBfreVulY8GNVnZoFStxoLOyPN7GQcgBS8YQJaZ9MZB0L/arPpjdJJGfV/O
         j74g==
X-Forwarded-Encrypted: i=1; AJvYcCUhmLvFA9l5B4oMRnO6e0oZM7d9GtF/vkJrgxuLv3CZYoPBclg/y69yH8NdGSIyBJQrqX1kWXO6JSslo1+4RCvdmyuh28PsZWycCN4=
X-Gm-Message-State: AOJu0YwLjVsLrmZOa14RpjAut+gJPJv5U6yTMN9rugcj3R5xkyk8o6CQ
	Jiwo9/hfAOlX9/B5Kvf/X89S8gZV5U70LWEKRhi7vU0iBZm+cJApeeqZOvlLxYA=
X-Google-Smtp-Source: AGHT+IHcHqSyEX4mzVByjYRHADLbnyHvlA3EH+pwK15IXluhS5E+pQUXzIRMTRRMFI5dY8+8yAW0/Q==
X-Received: by 2002:a17:902:744a:b0:1e5:3c5:55a5 with SMTP id d9443c01a7336-1ef43c0ceb1mr150722395ad.8.1715792759795;
        Wed, 15 May 2024 10:05:59 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf316f7sm120938135ad.164.2024.05.15.10.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:05:59 -0700 (PDT)
Date: Wed, 15 May 2024 10:05:59 -0700 (PDT)
X-Google-Original-Date: Wed, 15 May 2024 10:05:57 PDT (-0700)
Subject:     Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to function 'riscv_ipi_set_virq_range'
In-Reply-To: <20240515-zen-calculate-289cfb90cd65@spud>
CC: naresh.kamboju@linaro.org, linux-kernel@vger.kernel.org,
  lkft-triage@lists.linaro.org, regressions@lists.linux.dev, linux-riscv@lists.infradead.org,
  apatel@ventanamicro.com, tglx@linutronix.de, anders.roxell@linaro.org, dan.carpenter@linaro.org,
  Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 15 May 2024 07:36:33 PDT (-0700), Conor Dooley wrote:
> Palmer,
> This is the issue I point out to you on the call earlier:

Ya, thanks, I just hit it.  Looks like it's a semantic conflict between 
21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early 
driver") and dc892fb44322 ("riscv: Use IPIs for remote cache/TLB flushes 
by default").  I think all we need is 

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 886418ec06cb..4fbb37074d29 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
                return virq < 0 ? virq : -ENOMEM;

        /* Set vIRQ range */
-       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
+       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);

        /* Announce that IMSIC is providing IPIs */
        pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);

as a conflict resolution, which IIUC should happen when Linus merges my 
next PR.  So I'll try and remember to call that out.

>
> On Wed, May 15, 2024 at 04:18:58PM +0200, Naresh Kamboju wrote:
>> The riscv builds failed on Linux next-20240515 tag due to following build
>> warnings / errors with gcc-13 and clang toolchain.
>> 
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> 
>> Build Log:
>> -----
>> drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain_init':
>> drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many
>> arguments to function 'riscv_ipi_set_virq_range'
>>    52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
>>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from include/linux/smp.h:119,
>>                  from include/linux/lockdep.h:14,
>>                  from include/linux/spinlock.h:63,
>>                  from include/linux/sched.h:2142,
>>                  from include/linux/ratelimit.h:6,
>>                  from include/linux/dev_printk.h:16,
>>                  from include/linux/device.h:15,
>>                  from include/linux/node.h:18,
>>                  from include/linux/cpu.h:17,
>>                  from drivers/irqchip/irq-riscv-imsic-early.c:8:
>> arch/riscv/include/asm/smp.h:52:6: note: declared here
>>    52 | void riscv_ipi_set_virq_range(int virq, int nr);
>>       |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> metadata:
>>   git_describe: next-20240515
>>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>   git_sha: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
>>   git_short_log: 82d92a9a1b9e ("Add linux-next specific files for 20240515")
>> 
>> Links:
>>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/details/
>>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gUiKdxX7qM27ritMJT5pRyZhyi/
>>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/history/
>> 
>> --
>> Linaro LKFT
>> https://lkft.linaro.org
>> 
