Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CC6BE7F
	for <regressions@lists.linux.dev>; Sun,  8 Oct 2023 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c61dd1c229so960927a34.0
        for <regressions@lists.linux.dev>; Sun, 08 Oct 2023 05:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696767423; x=1697372223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odxjl/aijwDjkxzS8boDazUlR5StFzwCzOin2WOA178=;
        b=JRJpC6I/D5s5ECr0WQ/OafzJxE5gCHyYIAZ/yLOFV+s+N7J6nJ6kVHI5M7Ps0dPUVL
         xwhA9sDTtrNvB/m7nQXsChxqO87gXU7h1PWTZ4XYpYFy2pLxHtHXYTYpEhUKMokjWHXl
         Sdz325FoJWeS6FxedAx3J95I1OHTNFyHighMgPsCGlpx+q5mqn0mTpThOfcMI2qXw4He
         T/yQuaRx4hegAjijf8UOKbZCS9WgvlqGdUryxP8G72ZH4yDKcdta1Gkb+9zMPXZu7PiG
         XX2eg6evvasj5au2lD1T8RF+kk9ln6a1GL+RdSKZHTCIaOhO7FIsplCajihpMYAJcdgx
         4A8w==
X-Gm-Message-State: AOJu0YxOGoBuFM9Ayqngp8HLuio5DK2ywPq1d9OaNZq7hvz95rlZJlLP
	pZl9UmviVpqJjclQV/X1t7CTFsx5x7oA6rYQP8c=
X-Google-Smtp-Source: AGHT+IFnafo6ttT4xaY95LXuiwRwhcCXlBCWIwkqA3FgFK+AvY0orBJ/viALcLXMs8MhHXO8IyBzdUgPlHpDMur0O1A=
X-Received: by 2002:a4a:de08:0:b0:56e:94ed:c098 with SMTP id
 y8-20020a4ade08000000b0056e94edc098mr11355483oot.0.1696767422823; Sun, 08 Oct
 2023 05:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231006123304.32686-1-hdegoede@redhat.com> <ed4672a7-439c-4240-aadc-7a36858c36b2@augustwikerfors.se>
 <9a905931-6210-8f6b-92f5-3c863d4a2e86@redhat.com> <CAJZ5v0gK1Q54sMRJJJBTf+gY5jd-_57jYKvN5ELNSpmaeVVjAw@mail.gmail.com>
 <026f8034-0b0e-9c77-f547-7f883b9b8bc1@redhat.com>
In-Reply-To: <026f8034-0b0e-9c77-f547-7f883b9b8bc1@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 8 Oct 2023 14:16:49 +0200
Message-ID: <CAJZ5v0gYc7OePFzLLA2NTEzRy1DU+L86gE80vtBT6Jz4DBO1nA@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: resource: Add TongFang GM6BGEQ, GM6BG5Q and
 GM6BG0Q to irq1_edge_low_force_override[]
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, August Wikerfors <git@augustwikerfors.se>, 
	Mario Limonciello <Mario.Limonciello@amd.com>, linux-acpi@vger.kernel.org, 
	Francesco <f.littarru@outlook.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 7, 2023 at 10:51=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Rafael,
>
> On 10/6/23 21:20, Rafael J. Wysocki wrote:
> > On Fri, Oct 6, 2023 at 5:17=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
> >>
> >> Hi August,
> >>
> >> On 10/6/23 16:18, August Wikerfors wrote:
> >>> Hi Hans,
> >>>
> >>> On 2023-10-06 14:33, Hans de Goede wrote:
> >>>> The TongFang GM6BGEQ, GM6BG5Q and GM6BG0Q are 3 GPU variants of a To=
ngFang
> >>>> barebone design which is sold under various brand names.
> >>>>
> >>>> The ACPI IRQ override for the keyboard IRQ must be used on these AMD=
 Zen
> >>>> laptops in order for the IRQ to work.
> >>>>
> >>>> Adjust the irq1_edge_low_force_override[] DMI match table for this:
> >>>>
> >>>> 1. Drop the sys-vendor match from the existing PCSpecialist Elimina =
Pro 16
> >>>>     entry for the GM6BGEQ (RTX3050 GPU) model so that it will also m=
atch
> >>>>     the laptop when sold by other vendors such as hyperbook.pl.
> >>>>
> >>>> 2. Add board-name matches for the GM6BG5Q (RTX4050) and GM6B0Q (RTX4=
060)
> >>>>     models.
> >>>>
> >>>> Suggested-by: August Wikerfors <git@augustwikerfors.se>
> >>>> Reported-by: Francesco <f.littarru@outlook.com>
> >>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217394
> >>>> Link: https://laptopparts4less.frl/index.php?route=3Dproduct/search&=
filter_name=3DGM6BG
> >>>> Link: https://hyperbook.pl/en/content/14-hyperbook-drivers
> >>>> Link: https://linux-hardware.org/?probe=3Dbfa70344e3
> >>>> Link: https://bbs.archlinuxcn.org/viewtopic.php?id=3D13313
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>> Since this is a regression fix for 453b014e2c29 ("ACPI: resource: Fix=
 IRQ override quirk for PCSpecialist Elimina Pro 16 M") (for PCSpecialist s=
ystems like Francesco's with product name "Elimina Pro 16 M" but not board =
name "GM6BGEQ") and 2d331a6ac481 ("ACPI: resource: revert "Remove "Zen" spe=
cific match and quirks"") (for other vendors using the same TongFang design=
), it should have a "Fixes:" tag for at least one of those.
> >>>
> >>> Both of those commits are in 6.5 (and 6.6-rc) so this should go into =
6.6-rc and be backported to 6.5, but the patch seems to depend on 424009ab2=
030 ("ACPI: resource: Drop .ident values from dmi_system_id tables") and ma=
ybe also d37273af0e42 ("ACPI: resource: Consolidate IRQ trigger-type overri=
de DMI tables") to apply cleanly, which seem to only be queued for linux-ne=
xt/6.7? I'm not familiar with what the correct process is for such cases.
> >>
> >> You are right:
> >>
> >> Fixes: 453b014e2c29 ("ACPI: resource: Fix IRQ override quirk for PCSpe=
cialist Elimina Pro 16 M")
> >
> > OK
> >
> >> Note likewise this commit should really also be send as a fix
> >> for 6.6 and backported to the stable kernels:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/co=
mmit/drivers/acpi/resource.c?h=3Dbleeding-edge&id=3Dc1ed72171ed580fbf159e70=
3b77685aa4b0d0df5
> >
> > That's harder, because it does depend on commit 424009ab2030 ("ACPI:
> > resource: Drop .ident values from dmi_system_id tables") which is not
> > 6.6-rc material IMV.
> >
> > So I'm going to queue this up with the Fixes tag above and Cc: stable
> > pointing to commit 424009ab2030 as a dependency, but for 6.7.
>
> I realize that I'm the architect of this whole mess, but delaying
> these new quirks to 6.7 does not seem like a good idea to me.
>
> This fixes a serious problem (kbd not working pretty much makes
> the whole laptop unusable under Linux at least on the road). With
> a very small chance of regressions since this is DMI match base.
>
> Maybe we can just take all the resource.c DMI quirk changes
> as fixes to 6.6 ?  I admit the:
>
> "ACPI: resource: Consolidate IRQ trigger-type override DMI tables"
> "ACPI: resource: Drop .ident values from dmi_system_id tables"
>
> patches are not really bugfixes. But they too have a very low
> chance of causing regressions.
>
> Regards,
>
> Hans
>
>
> p.s.
>
> Note that "ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA"
> should probably go as a fix to 6.6 regardless of the discussion since
> that is a pure bugfix which applies cleanly on top of 6.6

That can be done.

> And the same goes for this (unrelated) drivers/acpi/ec.c patch:
>
> "ACPI: EC: Add quirk for the HP Pavilion Gaming 15-dk1xxx"

That can be done too.

> That too is a pure bugfix which IMHO should go to 6.6 as such.

But if you want the $subject patch to go into 6.6-rc, please rebase it
on top of the latest 6.6-rc and resubmit.  It will not apply cleanly
on top of the current linux-next, but I can handle the merge conflict.
