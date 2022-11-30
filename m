Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164B4A42
	for <regressions@lists.linux.dev>; Wed, 30 Nov 2022 09:40:50 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3691e040abaso165308227b3.9
        for <regressions@lists.linux.dev>; Wed, 30 Nov 2022 01:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AQat4vhVRPhTXaZs0nu09wTFQazHaXBzXg5iczgp6mA=;
        b=ofFQSuVu5ajzpYIwE9gi63qtctlx+tugjpXcFVn+OQ8mO6YwPj9HI58bKcWk7zumYv
         XNR0qwORgC9sVXJ8gS14hgXIuQX8R3T8Ty3x79W5OrEDVZXE/Hw+0SqKfo/DDFINBgOl
         uSSNAS9yprw0w9JhW/8PqKPmaRAxXg02jlaX60YgdzWMsybxxa9YLHCOHapdm6JrJ0n7
         R2fRFhtzZp2vpSnTTFTSz9SS30ly920A3drIJqME4jrl3Ys6ImIlW3q5wiJ7BYc2yL9d
         +MuoEm8iDljhVIhZfrXBl+DYv7dp+gMoh3EmxUyvWA10PS7G1W0JdqeZUgkSTEtWRH0Q
         Vktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQat4vhVRPhTXaZs0nu09wTFQazHaXBzXg5iczgp6mA=;
        b=viVGk92lZfnSz7E4MvztADlsPfJHR6foZ8MLNzmpgv0iiIxtD5DLeSymryg7VMSN+n
         1yKY4DuAxZ8KBlZdYDX/MBbn1Ku2e2u5Cq039rtfpChpY+JSKxDqbVQzr6yZHXfuz/tr
         IW3nWAroNOjEWTMW1Es0WUGt5ARPWsftrB1T++orRzwq9BlN40TzMvZ44FkfdHD7TaV6
         YLh8D3KZ7+8hMg7vFhbeKNgboZWxxjLNMLy4rFwllEsEjSuGZvT3O1Qcsf4e0mDEq8BT
         H2laWkIitEuOAeCgW/FcJsl3ev/F69nq7s68zGVLlgM6W6KV8zqCODOTjZbmTwNK2HGY
         kBQA==
X-Gm-Message-State: ANoB5pnwXqcr52oSFvJNN9Rmp8ZjeFFgNmbGUsfZSqOOSLQHX6bsZoe7
	+w/vavj21Wz7LtCyeWZi/1b7e3w4aNx/8mx7syAh6Q==
X-Google-Smtp-Source: AA0mqf6KMymJRYnHxHiIkx2KBXzxnTi84c6jLxC5Bl8eM1MzMjI5A7O9pao3Le/GrwP90CJWMmj8xmmzuINsuhzPysc=
X-Received: by 2002:a0d:cbcb:0:b0:3c5:469e:b93 with SMTP id
 n194-20020a0dcbcb000000b003c5469e0b93mr15813361ywd.443.1669801249762; Wed, 30
 Nov 2022 01:40:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvRXkjeO+yDEQxwJ8+GjSmwhZ7XHHAaVWAsxAaSngj5gg@mail.gmail.com>
 <bf1b053d-ffa6-48ab-d2d2-d59ab21afc19@opensource.wdc.com> <CA+G9fYvUnn0cS+_DZm8hAfi=FnMB08+6Xnhud6yvi9Bxh=DU+Q@mail.gmail.com>
 <CADYN=9L8tt2T-8O+u5NSMSUOkZDvEggnvzxH6aMmd5Rn9yDeuw@mail.gmail.com>
 <ca8d3fff-0365-24d9-fd53-5799ac34f336@opensource.wdc.com> <7ee4a1bd-0674-42d8-8980-8b029ca09e71@app.fastmail.com>
 <75eaeab3-7781-d60a-ae61-ae837f5dcec9@opensource.wdc.com> <CADYN=9JiX-=PcKMzAcSm=p7Dh6kYT7Kbv-8kcNF0MQ4=1hFS5g@mail.gmail.com>
 <20221014140633.mlypet7skkxvt453@mobilestation> <CADYN=9LrKHRNMON3GA4piDvWeSWTASQ1u2=D30rXFdvo1L18bg@mail.gmail.com>
 <20221017155246.zxal2cfehjgaajcu@mobilestation>
In-Reply-To: <20221017155246.zxal2cfehjgaajcu@mobilestation>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Nov 2022 15:10:37 +0530
Message-ID: <CA+G9fYtYetV5sZVD14WkZxCE_tgTC4VVKm8BcBw5_NwXD6U=Sw@mail.gmail.com>
Subject: Re: TI: X15 the connected SSD is not detected on Linux next 20221006 tag
To: Serge Semin <fancer.lancer@gmail.com>, Praneeth Bajjuri <praneeth@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Anders Roxell <anders.roxell@linaro.org>, 
	Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, regressions@lists.linux.dev, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Carlos Hernandez <ceh@ti.com>, Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Oct 2022 at 21:22, Serge Semin <fancer.lancer@gmail.com> wrote:
>
> On Mon, Oct 17, 2022 at 09:43:24AM +0200, Anders Roxell wrote:
> > On Fri, 14 Oct 2022 at 16:06, Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > On Fri, Oct 14, 2022 at 11:22:38AM +0200, Anders Roxell wrote:
> > > > On Fri, 14 Oct 2022 at 09:53, Damien Le Moal
> > > > <damien.lemoal@opensource.wdc.com> wrote:
> > > > >
> > > > > On 10/14/22 16:31, Arnd Bergmann wrote:
> > > > > > On Fri, Oct 14, 2022, at 2:22 AM, Damien Le Moal wrote:
> > > > > >> On 10/14/22 07:07, Anders Roxell wrote:
> > > > > >> [...]
> > > > > >>>> 8)
> > > > > >>>>> If reverting these patches restores the eSATA port on this board, then you need
> > > > > >>>>> to fix the defconfig for that board.
> > > > > >>>>
> > > > > >>>> OTOH,
> > > > > >>>> Anders, enabled the new config CONFIG_AHCI_DWC=y  and tried but the
> > > > > >>>> device failed to boot.
> > > > > >>>
> > > > > >>> I thought it would work with enabling CONFIG_AHCI_DWC=y, but it didn't...
> > > > > >>
> > > > > >> As mentioned in my previous reply to Naresh, this is a new driver added in
> > > > > >> 6.1. Your board was working before so this should not be the driver needed
> > > > > >> for it.
> > > > > >>
> > > > > >>> However, reverting patch 33629d35090f ("ata: ahci: Add DWC AHCI SATA
> > > > > >>> controller support")
> > > > > >>> from next-20221013 was a success, kernel booted  and the 'mkfs.ext4' cmd was
> > > > > >>> successful.
> > > > > >>
> > > > > >> Which is very strange... There is only one hunk in that commit that could
> > > > > >> be considered suspicious:
> > > > > >>
> > > > > >> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> > > > > >> index 9b56490ecbc3..8f5572a9f8f1 100644
> > > > > >> --- a/drivers/ata/ahci_platform.c
> > > > > >> +++ b/drivers/ata/ahci_platform.c
> > > > > >> @@ -80,9 +80,7 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
> > > > > >>  static const struct of_device_id ahci_of_match[] = {
> > > > > >>         { .compatible = "generic-ahci", },
> > > > > >>         /* Keep the following compatibles for device tree compatibility */
> > > > > >> -       { .compatible = "snps,spear-ahci", },
> > > > > >>         { .compatible = "ibm,476gtr-ahci", },
> > > > > >> -       { .compatible = "snps,dwc-ahci", },
> > > > > >>         { .compatible = "hisilicon,hisi-ahci", },
> > > > > >>         { .compatible = "cavium,octeon-7130-ahci", },
> > > > > >>         { /* sentinel */ }
> > > > > >>
> > > > > >> Is your board using one of these compatible string ?
> > > > > >
> > > > > > The x15 uses "snps,dwc-ahci". I would expect it to detect the device
> > > > > > with the new driver if that is loaded, but it's possible that the
> > > > > > driver does not work on all versions of the dwc-ahci hardware.
> > > > > >
> > > > > > Anders, can you provide the boot log from a boot with the new driver
> > > > > > built in? There should be some messages from dwc-ahci about finding
> > > > > > the device, but then not ultimately working.
> > > > > >
> > > > > > Depending on which way it goes wrong, the safest fallback for 6.1 is
> > > > > > probably to move the "snps,spear-ahci" and "snps,dwc-ahci" compatible
> > > > > > strings back into the old driver, and leave the new one only for
> > > > > > the "baikal,bt1-ahci" implementation of it, until it has been
> > > > > > successfully verified on TI am5/dra7, spear13xx and exynos.
> > > > >
> > > > > OK. So a fix patch until further tests/debug is completed would be this:
> > > > >
> > > > > diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
> > > > > index 8fb66860db31..7a0cbab00843 100644
> > > > > --- a/drivers/ata/ahci_dwc.c
> > > > > +++ b/drivers/ata/ahci_dwc.c
> > > > > @@ -469,8 +469,6 @@ static struct ahci_dwc_plat_data ahci_bt1_plat = {
> > > > >  };
> > > > >
> > > > >  static const struct of_device_id ahci_dwc_of_match[] = {
> > > > > -       { .compatible = "snps,dwc-ahci", &ahci_dwc_plat },
> > > > > -       { .compatible = "snps,spear-ahci", &ahci_dwc_plat },
> > > > >         { .compatible = "baikal,bt1-ahci", &ahci_bt1_plat },
> > > > >         {},
> > > > >  };
> > > > > diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> > > > > index 8f5572a9f8f1..9b56490ecbc3 100644
> > > > > --- a/drivers/ata/ahci_platform.c
> > > > > +++ b/drivers/ata/ahci_platform.c
> > > > > @@ -80,7 +80,9 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
> > > > >  static const struct of_device_id ahci_of_match[] = {
> > > > >         { .compatible = "generic-ahci", },
> > > > >         /* Keep the following compatibles for device tree compatibility */
> > > > > +       { .compatible = "snps,spear-ahci", },
> > > > >         { .compatible = "ibm,476gtr-ahci", },
> > > > > +       { .compatible = "snps,dwc-ahci", },
> > > > >         { .compatible = "hisilicon,hisi-ahci", },
> > > > >         { .compatible = "cavium,octeon-7130-ahci", },
> > > > >         { /* sentinel */ }


FYI,

We have been noticing this problem [a] & [b] on Linux mainline master 6.1.0-rc7

    Test error: mkfs.ext4
/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190702A00D84 failed; job
exit

Please suggest a way forward on this reported issue on arm32 TI BeagleBoard X15
device. Build and Kernel configs details provided in the metadata section.

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git_sha: b7b275e60bcd5f89771e865a8239325f86d9927d
  git_describe: v6.1-rc7
  kernel_version: 6.1.0-rc7
  kernel-config: https://builds.tuxbuild.com/2I9I42JhhQqS9GOpFppfRiuqtRW/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/pipelines/706371149
  artifact-location: https://builds.tuxbuild.com/2I9I42JhhQqS9GOpFppfRiuqtRW
  toolchain: gcc-10

[a] https://lkft.validation.linaro.org/scheduler/job/5892099
[b] https://lore.kernel.org/all/20221017155246.zxal2cfehjgaajcu@mobilestation/

- Naresh
