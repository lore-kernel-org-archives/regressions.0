Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1F53AA
	for <regressions@lists.linux.dev>; Sun,  2 Apr 2023 18:46:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o32so15828210wms.1
        for <regressions@lists.linux.dev>; Sun, 02 Apr 2023 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680461202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fL5kMIjPYpnHHKeS2SPDtm2N2DyJU46jDFtlSQzTIdE=;
        b=eVklQqCoz1Tq/KLQJ0bLn41TVCm/sG4SqGKgFTyuPaKg80AQoLJHKdDnFNzGEaAHNn
         4ZWbSzpGKK/2Kyw8CO7H3Dus54q3YpTIvqpX9RjsYmxdwGBqViQ2PPKpJ4IxNYt3RcD1
         QdrNBuDE/A6ZwtqBFsRkNRzRkTiH0qrE2gfBHuZPq8AZiSt5dE70R+IpAq6XZ1oDb/iv
         0nZ0gB37fHPS5dgLGRI1gT/em4RNbD1t2fuDl4PyU0ooW9doPsauqcrecg27ZPRI5ULd
         Gn1XlroOqmrnOxpOOdopEDsygKCTkF/g7fgsOEpXM5nGF2NstQ/aWSK0jevl2fNyXz+H
         F9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680461202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fL5kMIjPYpnHHKeS2SPDtm2N2DyJU46jDFtlSQzTIdE=;
        b=HNkSYmS3aYnZR83xIAjQBVmLH7S7XlZndP098hOe5juHq4CzsYidIbzqiAtP9IORev
         67yKd7euXUQ+h1ejRXjh64arzGKzETr+n/hfMeylt+gJYNgn7DVwYa5ZWo1n5NAnQI67
         r5hq8OS0drfbcGBHYH27TFpzW4d96eVPBxf/18Yweim/LJ9HwPQ+WX01caeZ+S6SXbvW
         yh+SK6+L8ep58cKoR5+gtY6gp+vaXhib0bK2tS4Vw2g5qXnB28xTKL5NHwD47brnol7H
         sH3QZFF1BhT4ysjtgAXAuQcK47Stnd8y9xDSkpCpdN9OZTJX6nHh9UD0pB2NNip8AXhI
         Q8Zw==
X-Gm-Message-State: AO0yUKXXomOaesvXN/QrDoRn3MvkY/L9odEvXi2W3IFLmRGoBL852neq
	8Bn2bXZtZwR79gEdbeDdJRF25D13sMUYfw==
X-Google-Smtp-Source: AK7set8ileFYcrcNgki5dzD+xnN6Nwba4uuVA6bQw6oGXycgB/Qi22mqAuWNotDV1zjpjd/skwe9pg==
X-Received: by 2002:a7b:ce8f:0:b0:3eb:42fa:39d5 with SMTP id q15-20020a7bce8f000000b003eb42fa39d5mr24394767wmj.29.1680461202481;
        Sun, 02 Apr 2023 11:46:42 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c210e00b003f04785699asm6585996wml.43.2023.04.02.11.46.41
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 11:46:41 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C4877BE2DE0; Sun,  2 Apr 2023 20:46:40 +0200 (CEST)
Date: Sun, 2 Apr 2023 20:46:40 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: regressions@lists.linux.dev
Subject: Re: Bug#1033732: [PATCH v2] x86/acpi/boot: Do not register
 processors that cannot be onlined for x2apic
Message-ID: <ZCnNkHJMdI7OvVHe@eldamar.lan>
References: <20230105041059.39366-1-kvijayab@amd.com>
 <88f59aa6-f3c4-999b-3994-0f2e3fd88c45@cegetel.net>
 <c02a2a2f-2b40-e13e-ac40-e5d19a66b5ba@cegetel.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c02a2a2f-2b40-e13e-ac40-e5d19a66b5ba@cegetel.net>

Hi

On Sun, Apr 02, 2023 at 12:41:46PM +0200, Guy Durrieu wrote:
> Le 05/01/2023 à 05:10, Kishon Vijay Abraham I a écrit :
> 
> > Section 5.2.12.12 Processor Local x2APIC Structure in the ACPI v6.5
> > spec mandates that both "enabled" and "online capable" Local APIC Flags
> > should be used to determine if the processor is usable or not.
> > 
> > However, Linux doesn't use the "online capable" flag for x2APIC to
> > determine if the processor is usable. As a result, cpu_possible_mask has
> > incorrect value and results in more memory getting allocated for per_cpu
> > variables than it is going to be used.
> > 
> > Make sure Linux parses both "enabled" and "online capable" flags for
> > x2APIC to correctly determine if the processor is usable.
> > 
> > Fixes: aa06e20f1be6 ("x86/ACPI: Don't add CPUs that are not online capable")
> > Reviewed-by: Borislav Petkov (AMD) <bp@alien8.de>
> > Reported-by: Leo Duran <leo.duran@amd.com>
> > Signed-off-by: Kishon Vijay Abraham I <kvijayab@amd.com>
> 
> Hello everyone,
> 
> My system worked fine with kernel 6.1.15, but stopped booting after
> upgrading to 6.1.20 and resulted in a kernel panic:
> 
> ---
> [ 0.117782] Kernel panic — not syncing: timer doesn’t work through Interrupt-remapped IO-APIC
> [ 0.117848] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.1.0-7-and64 #1 Debian 6.1.20-1
> [ 0.117913] Hardware name: Gigabyte Technology Co., Ltd. ABS50M-Gaming 3/AB350M-Gaming 3-CF, BIOS F50d 07/02/2020
> [ 0.117982] Call Trace:
> [ 0.118634] <TASK>
> [ 0.118685] dump_stack_lvl+0x44/0x5c
> [ 0.118143] panic+0x118/0x2ed
> [ 0.118198] panic_if_irq_remap.cold+0x5/0x5
> [ 0.118256] setup_I0_APIC+0x3db/0x64b
> [ 0.118313] ? _raw_spin_unlock_irqrestore+0x23/0x40
> [ 0.118372] ? clear_IO_APIC_pin+0x169/0x240
> [ 0.118429] apic_intr_node_init+0x101/0x106
> [ 0.118485] x86_late_time_init+0x20/0x34
> [ 0.118542] start_kerne1+0x667/0x727
> [ 0.118598] secondary_startup_64_no_verify+0xe5/0xeb
> [ 0.118658] </TASK>
> [ 0.118711] ---[ end Kernel panic - not syncing: timer doesn’t work through Interrupt-remapped IO-APIC J---
> ---
> I tried an update of the BIOS up to F51h without any effect.
> 
> I sent a bug report to Debian Bug Tracking System. In reply Bjørn Mork
> identified ce7d894bed1a539a8d6cff42f6f78f9db0c9c26b from the linux-6.1.y
> branch as the likely culprit.
> 
> After building a 6.1.20 kernel with just that commit reverted, my system boots normally again.
> 
> I reported that all tohttps://bugs.debian.org/1033732  and were asked to report the issue 'upstream' (which is what that mail is).
> 
> Hope it will help!
> 
> Best regards.

Trying to make as well the regression tracker bot aware of the issue
(but dropping all CCs to not spam them with duplicate information):

#regzbot ^introduced e2869bd7af60
#regzbot title: Regression from "x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC"
#regzbot link https://lore.kernel.org/lkml/c02a2a2f-2b40-e13e-ac40-e5d19a66b5ba@cegetel.net/
#regzbot link https://bugs.debian.org/1033732
#regzbot fixed-by: fed8d8773b8e

Regards,
Salvatore
