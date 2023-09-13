Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0514F6F
	for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 10:21:32 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-58d9ba95c78so66920407b3.1
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 03:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694600491; x=1695205291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McFENviulexPuoSO9u3Tk9ztgtwtFzN/enFbQhOjH0s=;
        b=ME+NSQhtK+6fRmnJvDLo1Oj59RCnsv8L6K9KAzpuNB+7y4AYk7R8gHGJNHkzj1KVht
         OjWkXAUgHdXlVlJjeUneJCPkyFFekUP1kKxfVzfpEnuY6c2IlW49km5YUCeX+rrmIwHV
         HTtnzjnj5VRxGn2NKUsrW7YPt+wC1kvQG/RYINCYdCg6rM/rp+9Y4jV7ul9wdqYmM44G
         ME7GclZfP7Xj6zLPs/NHwphFhReumqKpbfLgni9dgszYouC3uZ57ljmJAwfVyAwNxut2
         RtbphaF23AMNh+opL9MgCiPQ2/DuVCFWw4k+hJQXjE7x+fKFdLTx5XJFzfAeM+eqvst1
         tIWA==
X-Gm-Message-State: AOJu0YyRU/5y8hH4sMHS1oJFF6KzX9dqXSZ5OvNqO+5SUDUBNpaLD+w2
	SRM6PjTZ3uG7G26cVbMdZAhlRBQmsMItFQ==
X-Google-Smtp-Source: AGHT+IGnhlW87M8b86znzUv6Rd8M9p3OIkRh+NoZMtjhhyRvDTBSSza8KnxIeWtEmxru917x4KDVtw==
X-Received: by 2002:a0d:d64f:0:b0:58c:4e7c:2c12 with SMTP id y76-20020a0dd64f000000b0058c4e7c2c12mr2031756ywd.7.1694600491154;
        Wed, 13 Sep 2023 03:21:31 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id h138-20020a816c90000000b005925d7b62e0sm3000483ywc.24.2023.09.13.03.21.30
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:21:30 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58d9ba95c78so66920197b3.1
        for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 03:21:30 -0700 (PDT)
X-Received: by 2002:a25:d303:0:b0:d7a:def7:b96a with SMTP id
 e3-20020a25d303000000b00d7adef7b96amr1881114ybf.53.1694600490433; Wed, 13 Sep
 2023 03:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731003956.572414-1-dlemoal@kernel.org> <8be9c370-2f1-5815-431-f68ab868669@linux-m68k.org>
 <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
In-Reply-To: <ffc1442b-698e-65ab-9aaf-e4ca076b697c@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2023 12:21:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
Message-ID: <CAMuHMdXK-pnzMNzbNw=zWaMbQtWtca850eYv98oUjQkypgBfwg@mail.gmail.com>
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

On Wed, Sep 13, 2023 at 12:58=E2=80=AFAM Damien Le Moal <dlemoal@kernel.org=
> wrote:
> On 9/13/23 02:39, Geert Uytterhoeven wrote:
> > On Mon, 31 Jul 2023, Damien Le Moal wrote:
> >> During system resume, ata_port_pm_resume() triggers ata EH to
> >> 1) Resume the controller
> >> 2) Reset and rescan the ports
> >> 3) Revalidate devices
> >> This EH execution is started asynchronously from ata_port_pm_resume(),
> >> which means that when sd_resume() is executed, none or only part of th=
e
> >> above processing may have been executed. However, sd_resume() issues a
> >> START STOP UNIT to wake up the drive from sleep mode. This command is
> >> translated to ATA with ata_scsi_start_stop_xlat() and issued to the
> >> device. However, depending on the state of execution of the EH process
> >> and revalidation triggerred by ata_port_pm_resume(), two things may
> >> happen:
> >> 1) The START STOP UNIT fails if it is received before the controller h=
as
> >>   been reenabled at the beginning of the EH execution. This is visible
> >>   with error messages like:
> >>
> >> ata10.00: device reported invalid CHS sector 0
> >> sd 9:0:0:0: [sdc] Start/Stop Unit failed: Result: hostbyte=3DDID_OK dr=
iverbyte=3DDRIVER_OK
> >> sd 9:0:0:0: [sdc] Sense Key : Illegal Request [current]
> >> sd 9:0:0:0: [sdc] Add. Sense: Unaligned write command
> >> sd 9:0:0:0: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x90 returns -=
5
> >> sd 9:0:0:0: PM: failed to resume async: error -5
> >>
> >> 2) The START STOP UNIT command is received while the EH process is
> >>   on-going, which mean that it is stopped and must wait for its
> >>   completion, at which point the command is rather useless as the driv=
e
> >>   is already fully spun up already. This case results also in a
> >>   significant delay in sd_resume() which is observable by users as
> >>   the entire system resume completion is delayed.
> >>
> >> Given that ATA devices will be woken up by libata activity on resume,
> >> sd_resume() has no need to issue a START STOP UNIT command, which solv=
es
> >> the above mentioned problems. Do not issue this command by introducing
> >> the new scsi_device flag no_start_on_resume and setting this flag to 1
> >> in ata_scsi_dev_config(). sd_resume() is modified to issue a START STO=
P
> >> UNIT command only if this flag is not set.
> >>
> >> Reported-by: Paul Ausbeck <paula@soe.ucsc.edu>
> >> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D215880
> >> Fixes: a19a93e4c6a9 ("scsi: core: pm: Rely on the device driver core f=
or async power management")
> >> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
> >
> > Thanks for your patch, which is now commit 0a8589055936d8fe
> > ("ata,scsi: do not issue START STOP UNIT on resume") in v6.5-rc5.
> > Sorry for being late to the party, but this commit landed upstream
> > during my summer holidays, and apparently I wasn't that focussed on
> > noticing small behavioral changes after getting back to work...
> >
> > I noticed an oddity after s2idle or s2ram on Renesas Salvator-XS (R-Car
> > H3 ES2.0) with an old (spinning rust) SATA drive, and bisected it to
> > this commit: when accessing the drive after system resume, there is now
> > a delay of ca. 5s before data is returned, presumably due to starting
> > the drive, and having to wait for it to spin up to be able to read data=
.
> > But the good news is that the actual system resume takes less time than
> > before (reduced by even more than ca. 5s!), so this looks like a net
> > win...
>
> Thanks for the report. The delay for the first data access from user spac=
e right
> after resume is 100% expected, with or without this patch. The reason is =
that
> waking up the drive (spinning it up) is done asynchronously from the PM r=
esume
> context, so when you get "PM suspend exit" message signaling that the sys=
tem is
> resumed, the drive may not yet be spinning. Any access will wait for that=
 to
> happen before proceeding. Depending on the drive that can take up to 10s =
or so.

That does not match with what I am seeing: before this patch, there
was no delay on first data access from user space, as the drive is fully
spun up when system resume returns.
With this patch, system resume returns earlier, and the drive is only
spun up when user space starts accessing data.

Note that I do not have any file system mounted, and use
"hd /dev/sda | head -70" to access the disk.

> I am not entirely sure where the net win you see come from. But the patch=
 you
> mention is in fact completely wrong and does not fix the underlying issue=
s with
> ata suspend/resume and potential deadlocks in PM due to ata ports relatio=
nship
> with scsi devices. So I have been working on fixing this for the last 2 w=
eeks,
> after another user also reported issues with the patch you mention [1].
>
> Could you try libata for-next branch on your system ? There are 7 fix pat=
ches in
> there that I plan to send out for 6.6-rc2 to fix the patch in question an=
d other
> issues potentially causing deadlocks on resume. The patches were posted a=
lso [2].
>
> https://lore.kernel.org/linux-ide/20230912005655.368075-1-dlemoal@kernel.=
org/T/#t

Unfortunately that didn't work, as /dev/sda no longer exists.
Will reply to the patch I bisected the issue to...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
