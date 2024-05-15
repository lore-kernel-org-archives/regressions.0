Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D7638DE9
	for <regressions@lists.linux.dev>; Wed, 15 May 2024 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715793212; cv=none; b=K6tO32aNsBoURoPRiHAzRK/18+f1QNmwPLVusvqAl+PwDHtZf2j984kN2+UoWSdaGZl6kGy0I1dBeBg3LACc5yO7kO4HdXobucB8CcYrZJJPILUZW6Sm+NxlTj5FZdd7ZSqvx65YyC5CzYbH16k9M3iVps6a1fFoic6ofwX0Vp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715793212; c=relaxed/simple;
	bh=cvIV6f3GkDNs0QXxlEwPSB7F2//s6+TIdkMo1948Phs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiU0KthE3GAFpL023KinII+LIVUI9g3abVSG/SfTtObWAyS0ZuIjgcEf3j+BJxmXT2VgA201pyGKXu9Jw61uiZBNnlkQKaOfmMUXlgpr+Zll0btTAq0nQN8meX1V9gldRODzCBrhp4YkmtuQrBDNEt/qbH/trvJbhnx8O6/NUPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cKkBpvdl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cKkBpvdl"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so18633181fa.3
        for <regressions@lists.linux.dev>; Wed, 15 May 2024 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715793208; x=1716398008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nG8JDEZluA+U+D68g8z0TeZdm/BEqT6rREHFgTIhPW4=;
        b=cKkBpvdlGXfC10bE4DVXhb+fjIup9+G2aF8uFv3BHEIrOtVoMiubDhts8+/89unPLM
         XpC7nf4hfluX70IyMKSxPvLB+0y9Qhmt1Gp2wHLuEUy5OuJ2Y0bmajf2mCCpG4NRHksM
         b8w01PBql1z01VQaX9tnogJfj3GqdFBin7+8fZY9Cg3nuQvCa1HD9xC9gHuY/cWgmu0N
         IhUlWruMy6TZddeiPekkIarkyVpQ3pI8aJ7sUaMm4Rm6uYRcsFZij9cuVOjBMsdtmYNz
         8E78TFoMzVWd/leQmGVE1umrf3I6GQW0pO52LjBDDVjEeZneFpaNCIgZcEy+oyhDE/la
         qMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715793208; x=1716398008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG8JDEZluA+U+D68g8z0TeZdm/BEqT6rREHFgTIhPW4=;
        b=Okid8dP1ArDAJfZItfKXH/dbWXA+PlcOG3pSV0RyeLUU6Iy3x5qe/2Wj/Uct8ULGnJ
         gTXtnUdJnliZRPcYvdUpK88KLb0aJ8Y0nqrUqHKPeCgmpeP7E1NA0tcAf6THMnYpa1N+
         KwuGqsyAps8WIKyErvozzKytc4B3xhjpECml9pxLYw4Y3GhCUjWBrsVG31rgdWG9rttR
         tqgX4iLEUqvz3T+F1T70MNkdxSzJcE6Zz20/rLoeQ2OrpUVhEpBAMZ5OS5VBfQB7jxpp
         o6PqB853pI+EeI84nMmx5ReSmCLlBFVjuiH17laW7hHr6hiJHgtQ1GVVWDZh8RWxO0wh
         A46A==
X-Forwarded-Encrypted: i=1; AJvYcCWJHVbOPOJOB5HqMsfGC9H43PGZO0Y3RyqYE/FKjfZYa5PJ3zAVSTsYVsMq0Am+jDBvYze4GHVAhoeHFctzr1GQj5a7iltDHTQdABA=
X-Gm-Message-State: AOJu0Yzulpg8q6tghvN/GWyhPoOCWwmqrmIqlc45xueMo7pMyndD7iBe
	tJ7ghHzPj6VHqMxYwoirwvHM2ioHc3AXwOAeJy+LGRtRqGHAV3uZiFfH4r3KHsqkwJdlBFk+Wqd
	lx/9BoNJn+Py5ur1SeqWY1AWNFRCSvTuYOUWceQ==
X-Google-Smtp-Source: AGHT+IHfmskTbYDtGDQ4I7DObIPA2665F5KMdb6W8Wv/V4mAtLm81tAYf7jnYNcndFdsqSurRzjwAe2PkfScQpV143U=
X-Received: by 2002:a2e:7a0e:0:b0:2e2:466b:1a56 with SMTP id
 38308e7fff4ca-2e52039e2c3mr125315251fa.53.1715793207549; Wed, 15 May 2024
 10:13:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515-zen-calculate-289cfb90cd65@spud> <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
In-Reply-To: <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 15 May 2024 22:43:14 +0530
Message-ID: <CAK9=C2UkTD0hYymjow-yHHfBDh4CtRv-G2BPt=ncstLRmpYgyg@mail.gmail.com>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to
 function 'riscv_ipi_set_virq_range'
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-riscv@lists.infradead.org, 
	tglx@linutronix.de, anders.roxell@linaro.org, dan.carpenter@linaro.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 10:36=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
>
> On Wed, 15 May 2024 07:36:33 PDT (-0700), Conor Dooley wrote:
> > Palmer,
> > This is the issue I point out to you on the call earlier:
>
> Ya, thanks, I just hit it.  Looks like it's a semantic conflict between
> 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early
> driver") and dc892fb44322 ("riscv: Use IPIs for remote cache/TLB flushes
> by default").  I think all we need is
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/ir=
q-riscv-imsic-early.c
> index 886418ec06cb..4fbb37074d29 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
>                 return virq < 0 ? virq : -ENOMEM;
>
>         /* Set vIRQ range */
> -       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
> +       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
>
>         /* Announce that IMSIC is providing IPIs */
>         pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwno=
de, IMSIC_IPI_ID);
>
> as a conflict resolution, which IIUC should happen when Linus merges my
> next PR.  So I'll try and remember to call that out.

Yes, your conflict resolution is correct.

Thanks,
Anup

>
> >
> > On Wed, May 15, 2024 at 04:18:58PM +0200, Naresh Kamboju wrote:
> >> The riscv builds failed on Linux next-20240515 tag due to following bu=
ild
> >> warnings / errors with gcc-13 and clang toolchain.
> >>
> >> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >>
> >> Build Log:
> >> -----
> >> drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain=
_init':
> >> drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many
> >> arguments to function 'riscv_ipi_set_virq_range'
> >>    52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
> >>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> >> In file included from include/linux/smp.h:119,
> >>                  from include/linux/lockdep.h:14,
> >>                  from include/linux/spinlock.h:63,
> >>                  from include/linux/sched.h:2142,
> >>                  from include/linux/ratelimit.h:6,
> >>                  from include/linux/dev_printk.h:16,
> >>                  from include/linux/device.h:15,
> >>                  from include/linux/node.h:18,
> >>                  from include/linux/cpu.h:17,
> >>                  from drivers/irqchip/irq-riscv-imsic-early.c:8:
> >> arch/riscv/include/asm/smp.h:52:6: note: declared here
> >>    52 | void riscv_ipi_set_virq_range(int virq, int nr);
> >>       |      ^~~~~~~~~~~~~~~~~~~~~~~~
> >>
> >> metadata:
> >>   git_describe: next-20240515
> >>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> >>   git_sha: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
> >>   git_short_log: 82d92a9a1b9e ("Add linux-next specific files for 2024=
0515")
> >>
> >> Links:
> >>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202=
40515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/details/
> >>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gUiKdxX7qM2=
7ritMJT5pRyZhyi/
> >>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202=
40515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/history/
> >>
> >> --
> >> Linaro LKFT
> >> https://lkft.linaro.org
> >>
