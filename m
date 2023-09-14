Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D99612B
	for <regressions@lists.linux.dev>; Thu, 14 Sep 2023 06:59:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59231a1ca9eso7152077b3.1
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 23:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694674784; x=1695279584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRcqbfVHFgYkBiHh5OPsg49CeeM9fWTdX7Ou7JEBYXE=;
        b=KeuhyBUR1D/ypi6hxhrwcWN7DKDtd/clGx1fvYHbGuOMj2FDehKoPkF0I1Cbb3tFFA
         bTNLAKkJ/I0+GOzZSiuuvMYOsbKTpt4L2pr5xaP+1vwGEvP3WfE1F6k2W9sSGYWNoEml
         AwaOwGsOPnvfrGkAFAv/yFwimjgTnVC60f33mTCqpzcSo/ag7e7rxwLuNnMrNA47rsMt
         g6G3MNQBshcWlbyQS1oSyFOJmSfza5tQ/sB6ohIOdeyRUEcJKzpb8D8VD5dzF7WWVolX
         h/HbYKdl481XG0HXotYkEyxO1iDBNx0x1Weo+V/q0ayRfV1m3Pka+13YZ2c9c5zg6FMN
         oo5g==
X-Gm-Message-State: AOJu0YzKtutG7Z5AoEeDB85lm3Zgtr/OyXlmAD4zP8NGofTf5IYzUGpl
	O5A4rnqC2oLVb4yRIEjSfuB3d9JRJ9p1gA==
X-Google-Smtp-Source: AGHT+IGXnHADOglKE/RyEANTdP7OjV4CLFtHyY3PZj22oI7/FOLnBs9qV42KroaQHLVHT8UkEE3dHw==
X-Received: by 2002:a0d:e4c6:0:b0:573:d3cd:3d2a with SMTP id n189-20020a0de4c6000000b00573d3cd3d2amr5085601ywe.28.1694674783677;
        Wed, 13 Sep 2023 23:59:43 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id z20-20020a81c214000000b00585e2c112fdsm187791ywc.111.2023.09.13.23.59.42
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 23:59:42 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59231a1ca9eso7151847b3.1
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 23:59:42 -0700 (PDT)
X-Received: by 2002:a25:db49:0:b0:d63:1d3b:9416 with SMTP id
 g70-20020a25db49000000b00d631d3b9416mr4744956ybf.2.1694674782612; Wed, 13 Sep
 2023 23:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731003956.572414-1-dlemoal@kernel.org> <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org> <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
 <CAMuHMdUN5M3CkUn+HyPmgynT+9QLnE1GW_-v7gH5xOObQHfz2Q@mail.gmail.com> <0f164526-d1b6-64d3-a802-aa2a6c7951ee@kernel.org>
In-Reply-To: <0f164526-d1b6-64d3-a802-aa2a6c7951ee@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2023 08:59:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-2zvvC=8FVqOuYG-A79g374q=jt_t_SfoD=sKf5O4EA@mail.gmail.com>
Message-ID: <CAMuHMdW-2zvvC=8FVqOuYG-A79g374q=jt_t_SfoD=sKf5O4EA@mail.gmail.com>
Subject: Re: [PATCH] ata,scsi: do not issue START STOP UNIT on resume
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Paul Ausbeck <paula@soe.ucsc.edu>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, TW <dalzot@gmail.com>, 
	regressions@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Damien,

On Thu, Sep 14, 2023 at 12:08=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org=
> wrote:
> On 9/13/23 19:34, Geert Uytterhoeven wrote:
> > On Wed, Sep 13, 2023 at 12:21=E2=80=AFPM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> On Wed, Sep 13, 2023 at 12:58=E2=80=AFAM Damien Le Moal <dlemoal@kerne=
l.org> wrote:
> >>> On 9/13/23 02:39, Geert Uytterhoeven wrote:
> >>>> On Mon, 31 Jul 2023, Damien Le Moal wrote:
> >>>>> During system resume, ata_port_pm_resume() triggers ata EH to
> >>>>> 1) Resume the controller
> >>>>> 2) Reset and rescan the ports
> >>>>> 3) Revalidate devices
> >>>>> This EH execution is started asynchronously from ata_port_pm_resume=
(),
> >>>>> which means that when sd_resume() is executed, none or only part of=
 the
> >>>>> above processing may have been executed. However, sd_resume() issue=
s a
> >>>>> START STOP UNIT to wake up the drive from sleep mode. This command =
is
> >>>>> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
> >>>>> device. However, depending on the state of execution of the EH proc=
ess
> >>>>> and revalidation triggerred by ata_port_pm_resume(), two things may
> >>>>> happen:
> >>>>> 1) The START STOP UNIT fails if it is received before the controlle=
r has
> >>>>>   been reenabled at the beginning of the EH execution. This is visi=
ble
> >>>>>   with error messages like:
> >>>>>
> >>>>> ata10.00: device reported invalid CHS sector 0
> >>>>> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=3DDID_OK=
 driverbyte=3DDRIVER_OK
> >>>>> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
> >>>>> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
> >>>>> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 return=
s -5
> >>>>> sd 9:0:0:0: PM: failed to resume async: error -5
> >>>>>
> >>>>> 2) The START STOP UNIT command is received while the EH process is
> >>>>>   on-going, which mean that it is stopped and must wait for its
> >>>>>   completion, at which point the command is rather useless as the d=
rive
> >>>>>   is already fully spun up already. This case results also in a
> >>>>>   significant delay in sd_resume() which is observable by users as
> >>>>>   the entire system resume completion is delayed.
> >>>>>
> >>>>> Given that ATA devices will be woken up by libata activity on resum=
e,
> >>>>> sd_resume() has no need to issue a START STOP UNIT command, which s=
olves
> >>>>> the above mentioned problems. Do not issue this command by introduc=
ing
> >>>>> the new scsi_device flag no_start_on_resume and setting this flag t=
o 1
> >>>>> in ata_scsi_dev_config(). sd_resume() is modified to issue a START =
STOP
> >>>>> UNIT command only if this flag is not set.
> >>>>>
> >>>>> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
> >>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D215880
> >>>>> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver cor=
e for async power management")
> >>>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >>>>
> >>>> Thanks for your patch, which is now commit 0a8589055936d8fe
> >>>> ("ata,scsi: do not issue START STOP UNIT on resume") in v6.5-rc5.
> >>>> Sorry for being late to the party, but this commit landed upstream
> >>>> during my summer holidays, and apparently I wasn't that focussed on
> >>>> noticing small behavioral changes after getting back to work...
> >>>>
> >>>> I noticed an oddity after s2idle or s2ram on Renesas Salvator-XS (R-=
Car
> >>>> H3 ES2.0) with an old (spinning rust) SATA drive, and bisected it to
> >>>> this commit: when accessing the drive after system resume, there is =
now
> >>>> a delay of ca. 5s before data is returned, presumably due to startin=
g
> >>>> the drive, and having to wait for it to spin up to be able to read d=
ata.
> >>>> But the good news is that the actual system resume takes less time t=
han
> >>>> before (reduced by even more than ca. 5s!), so this looks like a net
> >>>> win...
> >>>
> >>> Thanks for the report. The delay for the first data access from user =
space right
> >>> after resume is 100% expected, with or without this patch. The reason=
 is that
> >>> waking up the drive (spinning it up) is done asynchronously from the =
PM resume
> >>> context, so when you get "PM suspend exit" message signaling that the=
 system is
> >>> resumed, the drive may not yet be spinning. Any access will wait for =
that to
> >>> happen before proceeding. Depending on the drive that can take up to =
10s or so.
> >>
> >> That does not match with what I am seeing: before this patch, there
> >> was no delay on first data access from user space, as the drive is ful=
ly
> >> spun up when system resume returns.
> >> With this patch, system resume returns earlier, and the drive is only
> >> spun up when user space starts accessing data.
> >>
> >> Note that I do not have any file system mounted, and use
> >> "hd /dev/sda | head -70" to access the disk.
> >>
> >>> I am not entirely sure where the net win you see come from. But the p=
atch you
> >>> mention is in fact completely wrong and does not fix the underlying i=
ssues with
> >>> ata suspend/resume and potential deadlocks in PM due to ata ports rel=
ationship
> >>> with scsi devices. So I have been working on fixing this for the last=
 2 weeks,
> >>> after another user also reported issues with the patch you mention [1=
].
> >>>
> >>> Could you try libata for-next branch on your system ? There are 7 fix=
 patches in
> >>> there that I plan to send out for 6.6-rc2 to fix the patch in questio=
n and other
> >>> issues potentially causing deadlocks on resume. The patches were post=
ed also [2].
> >>>
> >>> https://lore.kernel.org/linux-ide/20230912005655.368075-1-dlemoal@ker=
nel.org/T/#t
> >>
> >> Unfortunately that didn't work, as /dev/sda no longer exists.
> >> Will reply to the patch I bisected the issue to...
> >
> > With libata/for-next (fa2259a59966c005 ("ata: libata: Cleanup inline
> > DMA helper functions")) and commit 99626085d036ec32 ("ata: libata-scsi:
> > link ata port and scsi device") reverted, it behaves as before (disk
> > is spun up when system resume completes, no delay when accessing the
> > disk from userspace).
>
> I will check the ata platform driver for R-CAR. I may have overlooked som=
ething
> in that area. I tested with AHCI and libsas adapters only as I do not hav=
e ATA
> on the few ARM SBC boards I have. And I do not have an R-CAR board.
>
> What surprises me is that you need to revert ata: libata: Cleanup inline =
DMA
> helper functions". This patch has 0 functional changes and really is only=
 a code
> cleanup... Nothing should change with it. Can you confirm that you really=
 need
> to revert that patch to get things working again ?

My apologies, I should have written:

    With libata/for-next (which is currently at fa2259a59966c005 ("ata:
    libata: Cleanup inline DMA helper functions")), and commit
    99626085d036ec32 ("ata: libata-scsi: link ata port and scsi device")
    reverted, ...

So 99626085d036ec32 was the only commit I had to revert.
Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
