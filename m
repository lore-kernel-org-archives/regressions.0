Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94153138E
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 05:37:22 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5FAB23F26D
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 05:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686721040;
	bh=L700u4JHszhgKkjQdfFwXH0svBOHFooI3nofINxb84U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=J8IR/UxZxnrMUz/OAv3XXvPm/4AplucihaWNCEeMJtGEtiY7NfzqJo94cgJpEVvBF
	 uffa5xuZKao1NmrVvu6ewpNcRBAsvoqqbJNEkp+jnsqK2pm80VY+uq84zvV4WNpBPR
	 vP2JdnDq8BtdJi6NFHmkIWmFxaC17gwjZX5iWjpAOLeYu91bnliqDfPaE9l9U6nOlN
	 i1/fJTj3Ey9MSm0WoOhwRpZOVFBocTba16yOWHmT0lvfdiwZiCpG+fp20WPu9imn6W
	 yoFdr8XzZTBl/EOXL3UquEEwXKnil6F9FWVXolpmbAKhG3aryXbrKLLiwWLtQibI76
	 aGJS2xJ6NVudg==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-39c876f188eso4687734b6e.2
        for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 22:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686721039; x=1689313039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L700u4JHszhgKkjQdfFwXH0svBOHFooI3nofINxb84U=;
        b=UpqEukHb7Q5ZMJ/ZVavPy+7mMMlT1rvvizt3rrM6KcFcl9NPCvuqbpjVUbCYB91Vpg
         gBn+IaFfxPMIenQSkDBmHCNVU5SwNkNNaBL/oWu5zXhas6kD1At4Eqa1xze35N7C/8fc
         /6+KCAUaW68lRh3vFMqCe6aNAo/dYOGZTFzZ3gLzK4wRW5wcEqbnx0Yzp8UkS3b00aAg
         Fg01TN+sEgxa+Vfr7pGT1Fkib8d9unXXt75HdP6zh+HPK9GXZFg5l6MKOUQK3FpTa+cV
         8b2QMCgY9eU3u1sOLF15GD4sL8uRmIOXRnf5C+7zyxYX3PQHeesFW2lQWzyny3rET1RW
         afyw==
X-Gm-Message-State: AC+VfDxxwGFFQQU/gfm2+X/P0mh1lydhnr/QBcGu9SPdqDKf9YzYypTo
	VNkLK6kJoIuQ8qo+16g0BiRvpzkDJUGeOJQ1gCLB81+R+YGoXbfrAyepPDTY60eGo3qQKDwHhNz
	Iq66mXyla8zsoYtddrcKWGd49rT01uZvIGT7l6a87Wrc8kur3KomeO9D3
X-Received: by 2002:aca:2301:0:b0:398:19e6:56a9 with SMTP id e1-20020aca2301000000b0039819e656a9mr9458914oie.2.1686721039179;
        Tue, 13 Jun 2023 22:37:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ZCvNJFhBXY5DTwt5hF4ORUgqFO+d5WsQ0PVogShHgfbbdYyTneKVBelaRsDRX0hSU0EGW4U4/NdJvc7kGFqw=
X-Received: by 2002:aca:2301:0:b0:398:19e6:56a9 with SMTP id
 e1-20020aca2301000000b0039819e656a9mr9458892oie.2.1686721038957; Tue, 13 Jun
 2023 22:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2d1fdf6d-682c-a18d-2260-5c5ee7097f7d@gmail.com>
 <5513e29d-955a-f795-21d6-ec02a2e2e128@gmail.com> <ZIQ6bkau3j6qGef8@duo.ucw.cz>
 <07d6e2e7-a50a-8cf4-5c5d-200551bd6687@gmail.com> <02e4f87a-80e8-dc5d-0d6e-46939f2c74ac@acm.org>
 <b2cf6d96-a55a-d444-d22e-e9b3945ba43f@jmbreuer.net> <84f1c51c-86f9-04b3-0cd1-f685ebee7592@kernel.org>
In-Reply-To: <84f1c51c-86f9-04b3-0cd1-f685ebee7592@kernel.org>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 14 Jun 2023 13:37:07 +0800
Message-ID: <CAAd53p665S+dfOvWZt2UwTs=VrxE=FtpqjzUrSuLKR5tBpAa9Q@mail.gmail.com>
Subject: Re: Fwd: Waking up from resume locks up on sr device
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Joe Breuer <linux-kernel@jmbreuer.net>, Bart Van Assche <bvanassche@acm.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Linux Power Management <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Hardening <linux-hardening@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux SCSI <linux-scsi@vger.kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Dan Williams <dan.j.williams@intel.com>, 
	Hannes Reinecke <hare@suse.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 12:49=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org=
> wrote:
>
> On 6/11/23 18:05, Joe Breuer wrote:
> > I'm the reporter of this issue.
> >
> > I just tried this patch against 6.3.4, and it completely fixes my
> > suspend/resume issue.
> >
> > The optical drive stays usable after resume, even suspending/resuming
> > during playback of CDDA content works flawlessly and playback resumes
> > seamlessly after system resume.
> >
> > So, from my perspective: Good one!
>
> In place of Bart's fix, could you please try this patch ?

Issue still persists at my end, when /sys/power/pm_async is 0.
device_pm_wait_for_dev() in its current form is only usable for async case.

Kai-Heng

>
> diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
> index b80e68000dd3..a81eb4f882ab 100644
> --- a/drivers/ata/libata-eh.c
> +++ b/drivers/ata/libata-eh.c
> @@ -4006,9 +4006,32 @@ static void ata_eh_handle_port_resume(struct
> ata_port *ap)
>         /* tell ACPI that we're resuming */
>         ata_acpi_on_resume(ap);
>
> -       /* update the flags */
>         spin_lock_irqsave(ap->lock, flags);
> +
> +       /* Update the flags */
>         ap->pflags &=3D ~(ATA_PFLAG_PM_PENDING | ATA_PFLAG_SUSPENDED);
> +
> +       /*
> +        * Resuming the port will trigger a rescan of the ATA device(s)
> +        * connected to it. Before scheduling the rescan, make sure that
> +        * the associated scsi device(s) are fully resumed as well.
> +        */
> +       ata_for_each_link(link, ap, HOST_FIRST) {
> +               ata_for_each_dev(dev, link, ENABLED) {
> +                       struct scsi_device *sdev =3D dev->sdev;
> +
> +                       if (!sdev)
> +                               continue;
> +                       if (scsi_device_get(sdev))
> +                               continue;
> +
> +                       spin_unlock_irqrestore(ap->lock, flags);
> +                       device_pm_wait_for_dev(&ap->tdev,
> +                                              &sdev->sdev_gendev);
> +                       scsi_device_put(sdev);
> +                       spin_lock_irqsave(ap->lock, flags);
> +               }
> +       }
>         spin_unlock_irqrestore(ap->lock, flags);
>  }
>  #endif /* CONFIG_PM */
>
> Thanks !
>
> --
> Damien Le Moal
> Western Digital Research
>
