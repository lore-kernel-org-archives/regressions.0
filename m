Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D8B1FDD
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 07:05:04 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7BC113F205
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 06:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683269828;
	bh=8Ffn34QdIPteAhuo1D55q6Psg3jmIbfrccXTKRJ40S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NfU3WA7eujrzWkerGNvcJDIU6KMltE1nGL52dRJy2EaaNhhBGEopPNMsJbYDnAQaQ
	 Rl5AeShfZbxEjWlUD3Rn4J5kuoczccJ26D5QWzvucWus4lH41p6AdSqtAmihDmkHcy
	 Cr2GM9QFInxdHk6mgU8Y1T7ya6CI0arZS8RaYyCT+ed6Zc0eeoYJXIHWT70k4JKD7z
	 kOO/7u2yyBNv5Mv7R1XQAr/Pz/z/XGI8HOZY0lm9h/i2Cq0Pno+m/4ijo/S308MvX0
	 z+ExvgsVOQTJEmGpN6FRMsAqsbN84QqPuMKNfR/Xhe3WrLc+IiYWqNBoFQAQUEkSAs
	 e8Xq8tTmuKARw==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-24e43240e9fso676847a91.3
        for <regressions@lists.linux.dev>; Thu, 04 May 2023 23:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683269827; x=1685861827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ffn34QdIPteAhuo1D55q6Psg3jmIbfrccXTKRJ40S0=;
        b=iKKpxDVlvKBqI7Pnr3PkXu2iBO2v+a6ec8EAAZ7AyHDyxpkvp4m+FKokdl6XmIFQQk
         xQmhynMUYJDNLSSGEKXfeXy7qDZoXSqKexigy1Vv1HbD820GgLQs2XNoXK+swwfo8O1I
         dL1vMxXVljXErOwsS/UTUj0f4qilv5ADwDzZESScJUxNAr6T++YjSE6VGSyx0sJiH7Ka
         TztoxZffo2emqHqTUHLHIB8kJlmqWAwIxqtVNlzqfyF6KhLTWrujxTgMsIRlUWYWMgyE
         e0g+tgmp0LIBEdJfFPYyRv4bKpT2Ef02+Xl3eAQov5cNLPGoqfEKzXBeM97Xw/oMhAYW
         Kw8w==
X-Gm-Message-State: AC+VfDyvxpV8tqSmrqSzUWygLBICoJ8W/tlnLd6VeKzkFT6VGOezuJRs
	2UPFSXCLtOOCKzvunLHlYB+2aRkUo2LNv4vig8GrWSCTz48KnCgUDIoP7vMZ+8NeqXic3pN+bEL
	ANeRy1b+eg7Dcqf9jd8rUcxrlCFyDthsl48bAJEghjRUk0t/JxG7pOltD
X-Received: by 2002:a17:90b:b15:b0:246:bb61:4a56 with SMTP id bf21-20020a17090b0b1500b00246bb614a56mr484462pjb.27.1683269826877;
        Thu, 04 May 2023 23:57:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53iTMBSNhcrnIPyTfvwZ8N19AD181tDNAR5buVj0cJloI3cWhtExnX2UdH5CGdk2teqlzLhTHDhq/f/wafQfw=
X-Received: by 2002:a17:90b:b15:b0:246:bb61:4a56 with SMTP id
 bf21-20020a17090b0b1500b00246bb614a56mr484451pjb.27.1683269826445; Thu, 04
 May 2023 23:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230411204229.GA4168208@bhelgaas> <20230504152344.GA857680@bhelgaas>
In-Reply-To: <20230504152344.GA857680@bhelgaas>
From: Koba Ko <koba.ko@canonical.com>
Date: Fri, 5 May 2023 08:56:54 +0200
Message-ID: <CAJB-X+Vu8HJSNza896ELGrUKk64gPH=MjbYQMSxW6Xiw4MSiJw@mail.gmail.com>
Subject: Re: [Bug 217321] New: Intel platforms can't sleep deeper than PC3
 during long idle
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, 
	Ajay Agarwal <ajayagarwal@google.com>, Tasev Nikola <tasev.stefanoska@skynet.be>, 
	Mark Enriquez <enriquezmark36@gmail.com>, Thomas Witt <kernel@witt.link>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 5:23=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> [+cc Koba, Ajay, Tasev, Mark, Thomas, regressions list]
>
> On Tue, Apr 11, 2023 at 03:42:29PM -0500, Bjorn Helgaas wrote:
> > On Tue, Apr 11, 2023 at 08:32:04AM +0000, bugzilla-daemon@kernel.org wr=
ote:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D217321
> > > ...
> > >         Regression: No
> > >
> > > [Symptom]
> > > Intel cpu can't sleep deeper than pc=CB=87 during long idle
> > > ~~~
> > > Pkg%pc2 Pkg%pc3 Pkg%pc6 Pkg%pc7 Pkg%pc8 Pkg%pc9 Pk%pc10
> > > 15.08   75.02   0.00    0.00    0.00    0.00    0.00
> > > 15.09   75.02   0.00    0.00    0.00    0.00    0.00
> > > ^CPkg%pc2       Pkg%pc3 Pkg%pc6 Pkg%pc7 Pkg%pc8 Pkg%pc9 Pk%pc10
> > > 15.38   68.97   0.00    0.00    0.00    0.00    0.00
> > > 15.38   68.96   0.00    0.00    0.00    0.00    0.00
> > > ~~~
> > > [How to Reproduce]
> > > 1. run turbostat to monitor
> > > 2. leave machine idle
> > > 3. turbostat show cpu only go into pc2~pc3.
> > >
> > > [Misc]
> > > The culprit are this
> > > a7152be79b62) Revert "PCI/ASPM: Save L1 PM Substates Capability for
> > > suspend/resume=E2=80=9D
> > >
> > > if revert a7152be79b62, the issue is gone
> >
> > Relevant commits:
> >
> >   4ff116d0d5fd ("PCI/ASPM: Save L1 PM Substates Capability for suspend/=
resume")
> >   a7152be79b62 ("Revert "PCI/ASPM: Save L1 PM Substates Capability for =
suspend/resume"")
> >
> > 4ff116d0d5fd appeared in v6.1-rc1.  Prior to 4ff116d0d5fd, ASPM L1 PM
> > Substates configuration was not preserved across suspend/resume, so
> > the system *worked* after resume, but used more power than expected.
> >
> > But 4ff116d0d5fd caused resume to fail completely on some systems, so
> > a7152be79b62 reverted it.  With a7152be79b62 reverted, ASPM L1 PM
> > Substates configuration is likely not preserved across suspend/resume.
> > a7152be79b62 appeared in v6.2-rc8 and was backported to the v6.1
> > stable series starting with v6.1.12.
> >
> > KobaKo, you don't mention any suspend/resume in this bug report, but
> > neither patch should make any difference unless suspend/resume is
> > involved.  Does the platform sleep as expected *before* suspend, but
> > fail to sleep after resume?
> >
> > Or maybe some individual device was suspended via runtime power
> > management, and that device lost its L1 PM Substates config?  I don't
> > know if there's a way to disable runtime PM easily.
>
> Koba, per your bugzilla update, the issue happens even without
> suspend/resume.  And we don't know whether some particular device is
> responsible.
>
> But if we save/restore L1SS state, we can sleep deeper than PC3.  If
> we don't preserve L1SS state, we can't.
>
> We definitely want to preserve the L1SS state, but we can't simply
> apply 4ff116d0d5fd ("PCI/ASPM: Save L1 PM Substates Capability for
> suspend/resume") again because it caused its own regressions [1,2,3]
>
> So somebody needs to figure out what was wrong with 4ff116d0d5fd, fix
> it, verify that it doesn't cause the issues reported by Tasev, Thomas,
> and Mark, and then we can apply it.
>
> Bjorn

Good days, discussed with Kai-Heng and he mentioned  the GPU may not
be pulled off the power.
then the GPU needs L1ss to get into power saving.

I will investigate further on this way.

>
> [1] https://git.kernel.org/linus/a7152be79b62
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D216782
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=3D216877
