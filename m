Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F612DD95
	for <regressions@lists.linux.dev>; Fri, 24 May 2024 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716563436; cv=none; b=bEdBT3byqoduwzEO3TDNf6VGqbzk4kRiy33Gcw6i8zqn1JXPNkjjcU2yoyWv39fwOA3bHTBh3ISLcclMwzwQW5UXDTGEyNRb6JEw+kWtiGpfxTtl676BORq+Wm1lnxqzd08SWBX4saCrWSQPKvsUz6rg1u9CeCD/XuNX+szY0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716563436; c=relaxed/simple;
	bh=PUnc9znH3XnYmN1qWdPzarIaZgPvGA08yivr+HVT7Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8WdCxXu5p2DUznnxww4TkvolgS/uuAgais/MHApOUqWsd5fWWamcHhLum8/fpv4xQY/ALwKhX85u0XDvtClgq4HRPWXKrWwBwei9dhudzTbROBQB+S1rbFaSCWfS7zTVjPms4rGMYoZjcatpKEMlcqDFDQFYCp8cfP2LsJupMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItRdNxm7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItRdNxm7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b441b08so7061875ad.0
        for <regressions@lists.linux.dev>; Fri, 24 May 2024 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716563435; x=1717168235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Af8OGgxbQV2zOwezxQcvFU86Dm2eLu88EEanROVZ7Gs=;
        b=ItRdNxm75rTNE5dBC49Kw1SEjZhKQHJXjYcr7dvSUAe0jedplkCZRj2L5LzDYMtgbs
         JeRePV6mgNtEtdvDGZmzhZ9HTFco62iuM84kYyXK+34oi/64xbw/DeVVdr55FZfk+84h
         y4QPPRm6ekksQa/SAKw/px/kimM7Bcm8ErlfE+G1PyWOIbHQClpTzTM3Wiqxdh+Qzzkw
         c5cTnV+42U5Q0RrirtrzgKMhu+UaNMzm802eV0Phps4ZEI3Ex62iZ8kHUyXGG4o8XRnF
         PLXlFfyPtO0WvN/XwVHTloudU/c9LT5ZqA+TQdtJI7SHI5bQxkc0VHD3UXGkeW9X5Fnp
         NHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563435; x=1717168235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af8OGgxbQV2zOwezxQcvFU86Dm2eLu88EEanROVZ7Gs=;
        b=hyP3wW094WihIrwQkwl8YTPybDwul7dOsMvcHSw+p+W/8Y1OsfjGu2c7OvWQVAkD+6
         vEsZhK+973cAnL1IsDUY0ohInvAHiFBdvGiRbHxm7uw2L5xArzDX/ta1dKhso37UEvMt
         JyDnXVXI9B4OPCWMOP/a7tBYqTMGLf2YjLXN8hrBsma/MW67KoNRgWwF1uGPiE3a9hqp
         fYr/F0RTWDUGp3v+1bLO3lWGwdHaRBBif1FezwWKeQdtjzYOv2Z3mzrF3yEUwpUo/cHg
         rvF/q/ovF24B+q4V+dFnlg7ojPzI/WtwzIZuSXRxlxy2lj+W6vkDPkoEhJys9vwzWr0Y
         m2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2rhukIeH1Zq/K212fY2pB3Pi//I1wOUGpwiekpj6G5DszVKonzNd+yGQd6dkH2I41i4V2c5q7JjFTNcHEqwFP/F4DbEU7e66K2NY=
X-Gm-Message-State: AOJu0Yy6XZ60VsNr5K4LfJvDkUE7Fek/N7uscUMcWxX4iCXmlf075bY7
	7oIdj+fBFtensMqf/aT8MugCWjq6OMCSHg4oZY7psL5Fg+QOnZ+t
X-Google-Smtp-Source: AGHT+IFKYN2gEtwY0G5Fgxz9qkP4RfG7v4i0vZYDVcNVAVijtzn7fY8SJLSV2w+zed8Sv5SV56vdfg==
X-Received: by 2002:a17:903:230a:b0:1f2:fe12:b79e with SMTP id d9443c01a7336-1f4487029cemr23870065ad.17.1716563434513;
        Fri, 24 May 2024 08:10:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7535d2sm14989705ad.22.2024.05.24.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:10:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 May 2024 08:10:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org,
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev, linux-riscv@lists.infradead.org,
	apatel@ventanamicro.com, tglx@linutronix.de,
	anders.roxell@linaro.org, dan.carpenter@linaro.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments
 to function 'riscv_ipi_set_virq_range'
Message-ID: <ab42f444-b10c-4992-bc6a-83e269cfe9d0@roeck-us.net>
References: <20240515-zen-calculate-289cfb90cd65@spud>
 <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>

On Wed, May 15, 2024 at 10:05:59AM -0700, Palmer Dabbelt wrote:
> On Wed, 15 May 2024 07:36:33 PDT (-0700), Conor Dooley wrote:
> > Palmer,
> > This is the issue I point out to you on the call earlier:
> 
> Ya, thanks, I just hit it.  Looks like it's a semantic conflict between
> 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
> and dc892fb44322 ("riscv: Use IPIs for remote cache/TLB flushes by
> default").  I think all we need is
> 
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
> index 886418ec06cb..4fbb37074d29 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
>                return virq < 0 ? virq : -ENOMEM;
> 
>        /* Set vIRQ range */
> -       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
> +       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
> 
>        /* Announce that IMSIC is providing IPIs */
>        pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
> 
> as a conflict resolution, which IIUC should happen when Linus merges my next
> PR.  So I'll try and remember to call that out.
> 

Unfortunately it looks like the conflict resolution did not happen,
and mainline builds are now affected.

Guenter
