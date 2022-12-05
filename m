Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D617C
	for <regressions@lists.linux.dev>; Mon,  5 Dec 2022 01:11:09 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id x6so11845876lji.10
        for <regressions@lists.linux.dev>; Sun, 04 Dec 2022 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=db2wPaycUL//qoVLgOQfvWWZ0ow+Tx+jkZYnsnlD7ow=;
        b=Nlwao8fskd0vjpROGbeTL1jKzadX0RYQFWwtQerZlyqjDQouFH6xJlwNCKjkzPVWJh
         UfTDZDio4W1ZJDw1I3LoWZ6OqENmQh19F+dbB3vbF8wz4juBbRgE2027dJvUcRcgYc6x
         DeWb2wcNvYrCFs4bKS+UaBweesx0OS4w6nNIMmDUl+bkYgiNRD39oqBBDX+ubhXUm3Nm
         pte1D7bI5KBVwjcZpLv/up4lba7U1pWBSb3SgQoM0oYu2ntErdUtjbfc5hJDQW7CImYw
         /x5pqja0ht1y3at+q9TP8NQi2kYmdSmPm2afmnNUedA7p8meaQBqZhlhvQ4SeOfcSiVV
         psdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db2wPaycUL//qoVLgOQfvWWZ0ow+Tx+jkZYnsnlD7ow=;
        b=dd4znZWOYtzF01JP3SBpoOaJG+jrdIS15JY5WLzdFmvvP8befxYFfhQfvx47PnfAyu
         1BIvKloVXaSgA15PDW6mLKmSsTk+ouq2NzFmesMcw5ZFKp1Q4DYFOkR2s6hOxvCxXwWv
         15wBnpM3rDpsaK/4+sRZTTmbWWyZajtAS7twRo87VaRvzNpx/DQ2w12xxwFne0N+Qq5C
         vwXEOHa91jztQFWw2D9QBdvmLvgQSEewvvss8qHimVdi5fjZ7ecqZqfCiai2pw1T7Vqh
         O9cz2qr9kQNTuhq3qX5FTP9EeuFpozf27TtPw4IKL5T4KBTy+BmM+JFQ0ZZq+s4ocSQ7
         CjjQ==
X-Gm-Message-State: ANoB5pmc/bNyk8Ljh8jwAcnyu8gMwn1uMhcZfZma3LmMjVhWszyCtpu0
	5BEoTf5dUo+k92kjATPWTzU=
X-Google-Smtp-Source: AA0mqf4ulcuyEj4bIDFxsEiEWlX41RzQoekZOJ8VAEwdpNTXZj5fUhIZIl3d7MBugYwpTJ8O8BBciw==
X-Received: by 2002:a2e:a881:0:b0:26f:a855:c415 with SMTP id m1-20020a2ea881000000b0026fa855c415mr12010302ljq.443.1670202667819;
        Sun, 04 Dec 2022 17:11:07 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id b13-20020a0565120b8d00b004b373f61a60sm1939171lfv.96.2022.12.04.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 17:11:07 -0800 (PST)
Date: Mon, 5 Dec 2022 04:11:05 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Praneeth Bajjuri <praneeth@ti.com>, Arnd Bergmann <arnd@arndb.de>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Carlos Hernandez <ceh@ti.com>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006
 tag
Message-ID: <20221205011105.4do4trbytq4bfw5b@mobilestation>
References: <ca8d3fff-0365-24d9-fd53-5799ac34f336@opensource.wdc.com>
 <7ee4a1bd-0674-42d8-8980-8b029ca09e71@app.fastmail.com>
 <75eaeab3-7781-d60a-ae61-ae837f5dcec9@opensource.wdc.com>
 <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
 <20221014140633.mlypet7skkxvt453@mobilestation>
 <CADYN=9LrKHRNMON3GA4piDvWeSWTASQ1u2=D30rXFdvo1L18bg@mail.gmail.com>
 <20221017155246.zxal2cfehjgaajcu@mobilestation>
 <CA+G9fYtYetV5sZVD14WkZxCE_tgTC4VVKm8BcBw5_NwXD6U=Sw@mail.gmail.com>
 <Y4cqcTRcni5H7UAU@x1-carbon>
 <CADYN=9KKGBXn-YkiiFxsUzsanTALbDV1c+tB0oUQPouE1idnuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9KKGBXn-YkiiFxsUzsanTALbDV1c+tB0oUQPouE1idnuQ@mail.gmail.com>

On Thu, Dec 01, 2022 at 12:48:32PM +0100, Anders Roxell wrote:
> On Wed, 30 Nov 2022 at 11:03, Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 03:10:37PM +0530, Naresh Kamboju wrote:
> > > On Mon, 17 Oct 2022 at 21:22, Serge Semin <fancer.lancer@gmail.com> wrote:
> > >
> > > FYI,
> > >
> > > We have been noticing this problem [a] & [b] on Linux mainline master 6.1.0-rc7
> > >
> > >     Test error: mkfs.ext4
> > > /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 failed; job
> > > exit
> > >
> > > Please suggest a way forward on this reported issue on arm32 TI BeagleBoard X15
> > > device. Build and Kernel configs details provided in the metadata section.
> > >
> > > metadata:
> > >   git_ref: master
> > >   git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
> > >   git_sha: b7b275e60bcd5f89771e865a8239325f86d9927d
> > >   git_describe: v6.1-rc7
> > >   kernel_version: 6.1.0-rc7
> > >   kernel-config: https://builds.tuxbuild.com/2I9I42JhhQqS9GOpFppfRiuqtRW/config
> > >   build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/pipelines/706371149
> > >   artifact-location: https://builds.tuxbuild.com/2I9I42JhhQqS9GOpFppfRiuqtRW
> > >   toolchain: gcc-10
> > >
> > > [a] https://lkft.validation.linaro.org/scheduler/job/5892099
> > > [b] https://lore.kernel.org/all/20221017155246.zxal2cfehjgaajcu@mobilestation/
> > >
> > > - Naresh
> >
> > Hello Naresh,
> >
> >
> > Looking at the error from the log:
> >
> > + mkfs.ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84
> > mke2fs 1.46.5 (30-Dec-2021)
> > The file /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 does not exist and no size was specified.
> >
> > It seems like the device that you are trying to format does not exist.
> >
> >
> >
> > On October 17th Serge suggested that you guys should try to enable:
> > CONFIG_AHCI_DWC
> > and see if that does solve your problem.
> >
> > There was never any reply to his suggestion.
> 
> I re-tested this on todays linux tree v6.1-rc7-103-gef4d3ea40565.
> 
> With CONFIG_AHCI_DWC=y the kernel fell on its back and no output was produced
> So changing  the ahci_dwc_init to be a late_initcall [1] made me see
> what was going on [2].
> 
> The kernel booted fine with CONFIG_AHCI_DWC=y + this patch [3]
> 
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -109,7 +109,8 @@ struct clk *ahci_platform_find_clk(struct
> ahci_host_priv *hpriv, const char *con
>   int i;
> 
>   for (i = 0; i < hpriv->n_clks; i++) {
> - if (!strcmp(hpriv->clks[i].id, con_id))
> + if (hpriv->clks && hpriv->clks[i].id &&
> +    !strcmp(hpriv->clks[i].id, con_id))
>   return hpriv->clks[i].clk;
>   }

Indeed I should have taken into account that devm_clk_bulk_get_all()
can get unnamed clocks too. But checking the hpriv->clks pointer for
being not null is redundant, since the ahci_platform_get_resources()
procedure makes sure that the array is always allocated. At the very
least you shouldn't check the pointer in the loop, but can make sure
that the clks array is available before it.

-Serge(y)

> 
> Bootlog [4].
> Thank you Arnd for helping out with the investigation and for
> proposing the patch for me to test.
> 
> >
> >
> >
> > Looking at the config in:
> > >   kernel-config: https://builds.tuxbuild.com/2I9I42JhhQqS9GOpFppfRiuqtRW/config
> >
> > # CONFIG_AHCI_DWC is not set
> >
> > This Kconfig is indeed not enabled.
> >
> > Could you guys please try the suggestion from Serge?
> 
> The patch was also tested [5] without enabling CONFIG_AHCI_DWC, this
> also worked fine.
> 
> Cheers,
> Anders
> [1] http://ix.io/4hmt
> [2] https://lkft.validation.linaro.org/scheduler/job/5902935
> [3] http://ix.io/4hmv
> [4] https://lkft.validation.linaro.org/scheduler/job/5903220
> [5] http://ix.io/4hmw
