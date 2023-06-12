Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36CE1C75F
	for <regressions@lists.linux.dev>; Mon, 12 Jun 2023 15:37:32 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b072753301so10685171fa.1
        for <regressions@lists.linux.dev>; Mon, 12 Jun 2023 08:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686584250; x=1689176250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kN4DlUQA7uUq4M1oOXNMJsrd5bBIUI1Ul692O3Zdi3M=;
        b=VgpkVKjnP7aCRiiH3UfNASdWu/Cs6F10ojeo+4OBxP7Of91z3TzaOMHycvc6CZmq0R
         cz1FWQggd76t4daCkNOcjHoiamO5l1p7/uqJZmORIKaWhUfzmnDgAMymnRkWxF/Av0jf
         Th2dzKqj0Xa9L/KvhOuD330yLkEjdg/mbBMpLoV3t59P2V3cYAokpIodj6P1otSXaZaV
         UZwvmkNOefrqiFrphrFgkV/LUa1frdZJY/yjqzC01pyKh9WVf+s6+Viiq6MqlDLRaz8R
         498PazFuLvO5Q5ZwT8/jfhuOKxtjaEfuIgHzdFAPlHxzKfUdXgzpimkk44PYDLiKJAE+
         ughg==
X-Gm-Message-State: AC+VfDz/vLAp9AX9TUAFatMz0+bCHb7NpWY6aOZ43qR9d1mUxkES14c5
	gtR2jmLk0SfDA8Sg1F1CkvotkSTHmuooGcHD8rM=
X-Google-Smtp-Source: ACHHUZ7GaR6GW+7c1Tx+pO2YhPOg8IIZoHId09yzPOQfILOJmNA2MIhRbuNndChAPZnDPE7mJI7tR0KCtr5pOEUxvMM=
X-Received: by 2002:a2e:b108:0:b0:2b1:dc69:67fd with SMTP id
 p8-20020a2eb108000000b002b1dc6967fdmr4353607ljl.5.1686584250321; Mon, 12 Jun
 2023 08:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
 <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com> <ZIQ6bkau3j6qGef8@duo.ucw.cz>
 <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com> <02e4f87a-80e8-dc5d-0d6e-46939f2c74ac@acm.org>
 <4005a768-9e45-0707-509d-98ce0d2769bd@kernel.org> <0505654c-e487-6b91-57cf-fa7996f5c738@suse.de>
 <6957a93c-b933-9b08-2f9f-901c4782cd40@kernel.org> <CAAd53p5CsAAX5G1J2WH5N5JT5dZB_BD2AW8WL-S=pHZtGXr1sw@mail.gmail.com>
 <433015f6-9ca6-e4ce-e070-a75378419564@kernel.org> <1bc3eff1-6f86-4546-9360-19b6d0236bc4@rowland.harvard.edu>
In-Reply-To: <1bc3eff1-6f86-4546-9360-19b6d0236bc4@rowland.harvard.edu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 12 Jun 2023 17:37:18 +0200
Message-ID: <CAJZ5v0jn9-vsJZdH2v0yh8axmJmqOwkN=vuqs=Re=Nnf0WWkLA@mail.gmail.com>
Subject: Re: Fwd: Waking up from resume locks up on sr device
To: Alan Stern <stern@rowland.harvard.edu>, Damien Le Moal <dlemoal@kernel.org>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, Hannes Reinecke <hare@suse.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Joe Breuer <linux-kernel@jmbreuer.net>, 
	Linux Power Management <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Hardening <linux-hardening@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux SCSI <linux-scsi@vger.kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Hannes Reinecke <hare@suse.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Martin Kepplinger <martin.kepplinger@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 4:33=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Jun 12, 2023 at 04:47:09PM +0900, Damien Le Moal wrote:
> > On 6/12/23 16:36, Kai-Heng Feng wrote:
> > > On Mon, Jun 12, 2023 at 3:22=E2=80=AFPM Damien Le Moal <dlemoal@kerne=
l.org> wrote:
> > >>
> > >> On 6/12/23 15:09, Hannes Reinecke wrote:
> > >>> On 6/12/23 05:09, Damien Le Moal wrote:
> > >>>> On 6/11/23 00:03, Bart Van Assche wrote:
> > >>>>> On 6/10/23 06:27, Bagas Sanjaya wrote:
> > >>>>>> On 6/10/23 15:55, Pavel Machek wrote:
> > >>>>>>>>> #regzbot introduced: v5.0..v6.4-rc5 https://bugzilla.kernel.o=
rg/show_bug.cgi?id=3D217530
> > >>>>>>>>> #regzbot title: Waking up from resume locks up on SCSI CD/DVD=
 drive
> > >>>>>>>>>
> > >>>>>>>> The reporter had found the culprit (via bisection), so:
> > >>>>>>>>
> > >>>>>>>> #regzbot introduced: a19a93e4c6a98c
> > >>>>>>> Maybe cc the authors of that commit?
> > >>>>>>
> > >>>>>> Ah! I forgot to do that! Thanks anyway.
> > >>>>>
> > >>>>> Hi Damien,
> > >>>>>
> > >>>>> Why does the ATA code call scsi_rescan_device() before system res=
ume has
> > >>>>> finished? Would ATA devices still work with the patch below appli=
ed?
> > >>>>
> > >>>> I do not know the PM code well at all, need to dig into it. But yo=
ur patch
> > >>>> worries me as it seems it would prevent rescan of the device on a =
resume, which
> > >>>> can be an issue if the device has changed.
> > >>>>
> > >>>> I am not yet 100% clear on the root cause for this, but I think it=
 comes from
> > >>>> the fact that ata_port_pm_resume() runs before the sci device resu=
me is done, so
> > >>>> with scsi_dev->power.is_suspended still true. And ata_port_pm_resu=
me() calls
> > >>>> ata_port_resume_async() which triggers EH (which will do reset + r=
escan)
> > >>>> asynchronously. So it looks like we have scsi device resume and li=
bata EH for
> > >>>> rescan fighting each others for the scan mutex and device lock, le=
ading to deadlock.
> > >>>>
> > >>>> Trying to recreate this issue now to confirm and debug further. Bu=
t I suspect
> > >>>> the solution to this may be best implemented in libata, not in scs=
i.
> > >>>> This looks definitely related to this thread:
> > >>>>
> > >>>> https://lore.kernel.org/linux-scsi/7b553268-69d3-913a-f9de-28f8d45=
bdb1e@acm.org/
> > >>>>
> > >>>> Similaraly to your comment on that thread, having to look at
> > >>>> dev->power.is_suspended is not ideal I think. What we need is to h=
ave ata and
> > >>>> scsi pm resume be synchronized, but I am not yet 100% clear on the=
 scsi layer side.
> > >>>>
> > >>> Which is my feeling, too.
> > >>> libata runs rescan as part of the device discovery, so really it wi=
ll
> > >>> run after resume. And consequently resume really cannot wait for re=
scan
> > >>> to finish.
> > >>>
> > >>> What I would be looking at is to decouple resume from libata device
> > >>> rescan, and have resume to complete before libata EH runs.
> > >>
> > >> That is the case now, for the ata port at least, even though that is=
 not super
> > >> explicit, and not reliable. See ata_port_pm_resume(): I think that t=
he call to
> > >> EH in ata_port_pm_resume() -> ata_port_resume_async() -> ata_port_re=
quest_pm()
> > >> -> ata_port_schedule_eh() should instead use a sync resume, leading =
to a sync EH
> > >> call.
> > >>
> > >> That EH execution essentially does ata_eh_handle_port_resume(), whic=
h calls into
> > >> the adapter resume operation. That in itself does not do much beside=
 some
> > >> registers accesses to wakeup the port. There should be no issues doi=
ng that
> > >> synchronously.
> > >>
> > >> The problem is that after that is done, ata EH calls ata_std_error_h=
andler() ->
> > >> ata_do_eh() -> ata_eh_recover() -> ata_eh_revalidate_and_attach() ->
> > >> schedule_work(&(ap->scsi_rescan_task)). And the rescan work calls
> > >> scsi_rescan_device() (yet in another context than EH) which causes t=
he problem
> > >> when the scsi disk device has not been resumed yet (dev->power_is_su=
spended
> > >> still true).
> > >>
> > >> So it really looks like the solution should be to have ata_scsi_dev_=
rescan()
> > >> wait for the scsi device to resume first, but not sure how to do tha=
t with the
> > >> pm API. Digging...
> > >
> > > Probably use dpm_wait_for_children()? Right now it's an internal PM A=
PI.
> >
> > But I am not sure if there is a relationship between ata_device and its
> > scsi_device (dev->sdev)... Need to clarify that.
> > >
> > > Rafael,
> > > What do you think?
>
> Look into the device_pm_wait_for_dev() API.  It's the appropriate thing
> to use when you want to wait for another device to complete a system PM
> transition.  (However, it's not appropriate for runtime PM.)
>
> Of course, if there is a parent-child relationship between two devices
> then waiting is never necessary.  The PM core guarantees that a parent
> will always be at full power when a child changes its power state,
> unless pm_suspend_ignore_children() has been called for the parent
> device.

There are also device links that go beyond the parent-child handling.
Please see Documentation/driver-api/device_link.rst and the kerneldoc
description of device_link_add() for more information.
