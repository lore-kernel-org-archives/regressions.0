Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBED3210
	for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 10:35:07 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59234aaca15so68340297b3.3
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 03:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694601306; x=1695206106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8m68oXdYdNHsr5k1jXa1xJVSm1qG7bdHDn2xJ0YTYo=;
        b=NJQmY4ZYAPkEWXCkkhNIqR6h8RyQweJHUeacQ+vtWgB7K1566WwTDa2ESgyRXEaoJn
         2EhQbvR2weQ+fpTHzLdXYnr9YLbjsAEttcFf3E6YRy7rNxNfKPUONkbTpGelnAPqoETx
         46tczVbwxcGaH490Byb8hCIV6YWhm9P5FpLTt0rjYdFW/jwyPf9DBSet0FsBEDZVcP+z
         gBNzX2zGaNQEvibBgvC2nitVQ++7B+C4Mr3DYhCVRPAPjHIx94rREn0zAGeyYfMdWfs3
         mBLXGlenz3Q/rsMwCCpQE3Hqc4rahUeBmn2hRz8vUlVfKhnBDcqYJFLy/xv9M/xMtUeZ
         FNyQ==
X-Gm-Message-State: AOJu0YyHrYXPmdxrPIrPbnVLrCX6oFqsIm5x0s1vEnxXjlPKL1QuEvqd
	d1SMBJsDom3rSKw2U/0ZWT1U3AaG1M0KkA==
X-Google-Smtp-Source: AGHT+IHUN5QJHNLqir+2grdCjkROg1DhnKEizjcErgg4TqukLTx13SoRXFCJprkMPxtsLYtT3+yGHA==
X-Received: by 2002:a81:77d5:0:b0:59b:b24c:4161 with SMTP id s204-20020a8177d5000000b0059bb24c4161mr1743914ywc.52.1694601306021;
        Wed, 13 Sep 2023 03:35:06 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id p139-20020a0de691000000b005865494000dsm3059424ywe.115.2023.09.13.03.35.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:35:05 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7b9c04591fso5715162276.3
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 03:35:05 -0700 (PDT)
X-Received: by 2002:a25:db09:0:b0:d20:e5c9:10e1 with SMTP id
 g9-20020a25db09000000b00d20e5c910e1mr2087217ybf.21.1694601305079; Wed, 13 Sep
 2023 03:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731003956.572414-1-dlemoal@kernel.org> <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org> <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
In-Reply-To: <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2023 12:34:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUN5M3CkUn+HyPmgynT+9QLnE1GW_-v7gH5xOObQHfz2Q@mail.gmail.com>
Message-ID: <CAMuHMdUN5M3CkUn+HyPmgynT+9QLnE1GW_-v7gH5xOObQHfz2Q@mail.gmail.com>
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

On Wed, Sep 13, 2023 at 12:21=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Sep 13, 2023 at 12:58=E2=80=AFAM Damien Le Moal <dlemoal@kernel.o=
rg> wrote:
> > On 9/13/23 02:39, Geert Uytterhoeven wrote:
> > > On Mon, 31 Jul 2023, Damien Le Moal wrote:
> > >> During system resume, ata_port_pm_resume() triggers ata EH to
> > >> 1) Resume the controller
> > >> 2) Reset and rescan the ports
> > >> 3) Revalidate devices
> > >> This EH execution is started asynchronously from ata_port_pm_resume(=
),
> > >> which means that when sd_resume() is executed, none or only part of =
the
> > >> above processing may have been executed. However, sd_resume() issues=
 a
> > >> START STOP UNIT to wake up the drive from sleep mode. This command i=
s
> > >> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
> > >> device. However, depending on the state of execution of the EH proce=
ss
> > >> and revalidation triggerred by ata_port_pm_resume(), two things may
> > >> happen:
> > >> 1) The START STOP UNIT fails if it is received before the controller=
 has
> > >>   been reenabled at the beginning of the EH execution. This is visib=
le
> > >>   with error messages like:
> > >>
> > >> ata10.00: device reported invalid CHS sector 0
> > >> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=3DDID_OK =
driverbyte=3DDRIVER_OK
> > >> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
> > >> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
> > >> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 returns=
 -5
> > >> sd 9:0:0:0: PM: failed to resume async: error -5
> > >>
> > >> 2) The START STOP UNIT command is received while the EH process is
> > >>   on-going, which mean that it is stopped and must wait for its
> > >>   completion, at which point the command is rather useless as the dr=
ive
> > >>   is already fully spun up already. This case results also in a
> > >>   significant delay in sd_resume() which is observable by users as
> > >>   the entire system resume completion is delayed.
> > >>
> > >> Given that ATA devices will be woken up by libata activity on resume=
,
> > >> sd_resume() has no need to issue a START STOP UNIT command, which so=
lves
> > >> the above mentioned problems. Do not issue this command by introduci=
ng
> > >> the new scsi_device flag no_start_on_resume and setting this flag to=
 1
> > >> in ata_scsi_dev_config(). sd_resume() is modified to issue a START S=
TOP
> > >> UNIT command only if this flag is not set.
> > >>
> > >> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
> > >> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D215880
> > >> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core=
 for async power management")
> > >> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> > >
> > > Thanks for your patch, which is now commit 0a8589055936d8fe
> > > ("ata,scsi: do not issue START STOP UNIT on resume") in v6.5-rc5.
> > > Sorry for being late to the party, but this commit landed upstream
> > > during my summer holidays, and apparently I wasn't that focussed on
> > > noticing small behavioral changes after getting back to work...
> > >
> > > I noticed an oddity after s2idle or s2ram on Renesas Salvator-XS (R-C=
ar
> > > H3 ES2.0) with an old (spinning rust) SATA drive, and bisected it to
> > > this commit: when accessing the drive after system resume, there is n=
ow
> > > a delay of ca. 5s before data is returned, presumably due to starting
> > > the drive, and having to wait for it to spin up to be able to read da=
ta.
> > > But the good news is that the actual system resume takes less time th=
an
> > > before (reduced by even more than ca. 5s!), so this looks like a net
> > > win...
> >
> > Thanks for the report. The delay for the first data access from user sp=
ace right
> > after resume is 100% expected, with or without this patch. The reason i=
s that
> > waking up the drive (spinning it up) is done asynchronously from the PM=
 resume
> > context, so when you get "PM suspend exit" message signaling that the s=
ystem is
> > resumed, the drive may not yet be spinning. Any access will wait for th=
at to
> > happen before proceeding. Depending on the drive that can take up to 10=
s or so.
>
> That does not match with what I am seeing: before this patch, there
> was no delay on first data access from user space, as the drive is fully
> spun up when system resume returns.
> With this patch, system resume returns earlier, and the drive is only
> spun up when user space starts accessing data.
>
> Note that I do not have any file system mounted, and use
> "hd /dev/sda | head -70" to access the disk.
>
> > I am not entirely sure where the net win you see come from. But the pat=
ch you
> > mention is in fact completely wrong and does not fix the underlying iss=
ues with
> > ata suspend/resume and potential deadlocks in PM due to ata ports relat=
ionship
> > with scsi devices. So I have been working on fixing this for the last 2=
 weeks,
> > after another user also reported issues with the patch you mention [1].
> >
> > Could you try libata for-next branch on your system ? There are 7 fix p=
atches in
> > there that I plan to send out for 6.6-rc2 to fix the patch in question =
and other
> > issues potentially causing deadlocks on resume. The patches were posted=
 also [2].
> >
> > https://lore.kernel.org/linux-ide/20230912005655.368075-1-dlemoal@kerne=
l.org/T/#t
>
> Unfortunately that didn't work, as /dev/sda no longer exists.
> Will reply to the patch I bisected the issue to...

With libata/for-next (fa2259a59966c005 ("ata: libata: Cleanup inline
DMA helper functions")) and commit 99626085d036ec32 ("ata: libata-scsi:
link ata port and scsi device") reverted, it behaves as before (disk
is spun up when system resume completes, no delay when accessing the
disk from userspace).

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
