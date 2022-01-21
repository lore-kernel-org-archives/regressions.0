Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70862C9C
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 09:38:43 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id h14so25813416ybe.12
        for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 01:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JekWhR8CMAxMCtnFBApW6vamUlJTaekkAKvbq4p6qw8=;
        b=Mu93tn/1YAjVBeQULNJalS9X6HhXvdWuyJXmfAqYbyxtxM0dtvMRc+raEPKdaKvd1j
         W8jW7wwFnUYqcxvwlY4G9B0sR9xprDxdAKdd0JyJVIAgSzP1Vg36C/ZZqPTTMQVeQKlk
         SB/QuNjdCsYqzTCpkkZ76PVrvOBoNAiR5+qeeYz+B++Ax0BLwt7s6J+GZE4wEO1Ju2aR
         Dr1e04+a6xS3r5LKxcnKAgOstzSLyEfXClE/U0xMM/BWLLZ8pSHvYlj3Y/C3mUpkO+gS
         Ap3JYFS/dUwYBdBnGvyFqeEfUmllZvIoJyVvlsiHvrpEwZY5WOtx/o5APydHInZdx/kX
         IW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JekWhR8CMAxMCtnFBApW6vamUlJTaekkAKvbq4p6qw8=;
        b=LGjGagWcNGT8WI4fAjOb9EDQ1Ob+Etidm6i8kMMnoc7vsHEkCQkkWBdtlWrwRAM3BK
         udMOBdDoSFmf5+FV5uidvU8UZuRrHPiXyEntg+5W2kBHKkGe71CKMar+a2Qv8g+6Usl5
         qxxei9GnEmk/O9QSkm4AeDhnn7BiABUmrYj6qwuEk1am0Vl7aexPCRmbw8VPa/onavmT
         M2WHBqXI3dL/qlCe1a6HU76/AObHMYQjEb5Tv6qp7xlYtK4ejnlNIrJE4xrUxX7UYc7c
         kyAdKhJmAscUWdg7BwkjKisX8rafDFDt4wciHU5LnXYTpj0IQGRLLZ9gmETNbEbe1Xd0
         gEiQ==
X-Gm-Message-State: AOAM5335/MtA55E/V1zxEgG3TCnlt7bYsdgtxh/jAN5TbzBpmU0dLZOD
	x9pO+jFC9PheE//l3CNHYgnTFM7XzAoiG7NUF0YMSA==
X-Google-Smtp-Source: ABdhPJxwPwDcVZlwqlEbNURijL+6MLGocOVUhJTkp4UaAqzb1wi8hvxpYQGzCNUitvJcHn3KXKIEEW0s6ye7Cf9nlng=
X-Received: by 2002:a25:c04c:: with SMTP id c73mr4847013ybf.553.1642757922889;
 Fri, 21 Jan 2022 01:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com> <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
 <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
In-Reply-To: <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 21 Jan 2022 15:08:31 +0530
Message-ID: <CA+G9fYuMc9qjQE+XoKUzwhMP4O5QE5FbCEhJEmrd_Q8LaC4nFw@mail.gmail.com>
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer type
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mips@vger.kernel.org, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Zeal Robot <zealci@zte.com.cn>, 
	Minghao Chi <chi.minghao@zte.com.cn>, CGEL ZTE <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jan 2022 at 14:47, Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 2022/01/21 17:58, Naresh Kamboju wrote:
> >> I just posted a fix. As I do not have the environment to compile test
> >> mips, could someone test please ? I will send the fix to Linus asap
> >> after confirmation that it is OK.
> >
> > Please share your patch / patch link. I will test it with tuxmake.
>
> I posted on linux-ide and CC-ed linux-mips:
>
> https://marc.info/?l=linux-ide&m=164275458614058&w=2

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

- Naresh
