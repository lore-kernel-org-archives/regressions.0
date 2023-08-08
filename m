Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16D1097B
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 13:37:45 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-56d0deeca09so867829eaf.0
        for <regressions@lists.linux.dev>; Tue, 08 Aug 2023 06:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691501864; x=1692106664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIz8xHvDX016h5cw1rUukWudmsNBq0m1nrGbkhWaLZU=;
        b=BA6mPemaNoMFjRNqO5M4vcAi3Zvus1EiO+SXaxrz7upEBQKytJYGD6b8O60ESRtel2
         +meq8xlZWyGEh8X5XvVo1xLAIAvQKLkOnVHIDrwGnTaC3kl2JHPDoqoenl0PWBfH/qON
         KkFuj4UTnHFFE2ogInqDr0t85vodnT4AiH131UYSnVHTroHsYXhBCy4vLj8dnZ7w1BAG
         VUuuC1XdhXuJIFiwsEUwc0ue3p7g5CP1+3YdJ0BL5vODUVxTYCxZmHMBsPJb3nbIKZr6
         GxTAvDj/0hcYkbnLHwdisRebD7EVZClVnd953B5eaL5zYC0OmXLId9meSEmOCBKCwGpb
         53IQ==
X-Gm-Message-State: ABy/qLYLpGDpOZynM6ALX2io0DMKnJOjOg2syTx2cmQfyp1XDRFO71S/
	GwjH2ehCG77aU6pbU5tQRU7MhDZbtT9H0J54OP0=
X-Google-Smtp-Source: APBJJlGvkRYzTrsgUPkJtu2i243z1/N0LawwcBumLHZaL7SYVSklHjWf5yhoeVk+BUWOtJPtewuSHxufV6ZqhdMKOck=
X-Received: by 2002:a4a:cf14:0:b0:569:a08a:d9c5 with SMTP id
 l20-20020a4acf14000000b00569a08ad9c5mr23082881oos.0.1691501864362; Tue, 08
 Aug 2023 06:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230806151453.10690-1-hdegoede@redhat.com> <3cdde518-1c0c-24dc-1ffb-90ae34c23296@redhat.com>
 <de2864f9-1b70-0e35-b22a-875eb857d274@redhat.com> <CAJZ5v0ijaemfrMemeowYQ9kGcsRVtD0vVoJfuf8YdgsmXe9=VQ@mail.gmail.com>
 <c2213c75-192b-1fbf-d2dc-5c098c880e17@redhat.com>
In-Reply-To: <c2213c75-192b-1fbf-d2dc-5c098c880e17@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Aug 2023 15:37:33 +0200
Message-ID: <CAJZ5v0i9Uaw16k2q+7yzFMG+3t40gcK06Xi5Ea6c+RyvV5ePyw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: resource: revert "Remove "Zen" specific match and quirks"
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, 
	Mario Limonciello <mario.limonciello@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 8, 2023 at 3:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> On 8/8/23 13:18, Rafael J. Wysocki wrote:
> > On Tue, Aug 8, 2023 at 10:36=E2=80=AFAM Hans de Goede <hdegoede@redhat.=
com> wrote:
> >>
> >> Hi,
> >>
> >> On 8/7/23 17:19, Hans de Goede wrote:
> >>> Hi All,
> >>>
> >>> On 8/6/23 17:14, Hans de Goede wrote:
> >>>> Commit a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match an=
d
> >>>> quirks") is causing keyboard problems for quite a log of AMD based
> >>>> laptop users, leading to many bug reports.
> >>>>
> >>>> Revert this change for now, until we can come up with
> >>>> a better fix for the PS/2 IRQ trigger-type/polarity problems
> >>>> on some x86 laptops.
> >>>>
> >>>> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match an=
d quirks")
> >>>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2229165
> >>>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2229317
> >>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217726
> >>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
> >>>> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>
> >>> I've spend most of today analysing the situation / this problem :
> >>>
> >>> 213031 - MEDION notebook internal keyboard not recognized / not worki=
ng correctly
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=3D213031
> >>>
> >>> This is the bug that started it all, the issue here was overriding
> >>> a level low DSDT entry:
> >>>
> >>>                 IRQ (Level, ActiveLow, Exclusive, )
> >>>                     {1}
> >>>
> >>> With an edge high entry from the MADT, note that edge high is the def=
ault
> >>> mp_irqs[idx].irqflags value for legacy/ISA IRQs. The dmesg for the Ic=
e Lake
> >>> Medion M15T this bug is about shows no INT_SRC_OVR entry for IRQ 1
> >>> in the MADT, it does show INT_SRC_OVR entries for IRQ 0 and 9.
> >>>
> >>> At first a fix was attempted to not use the MADT override unless
> >>> the DSDT entry was edge high. But that caused regressions, so a switc=
h
> >>> to a DMI based approach was used instead. Noteworthy is that some of
> >>> the regressions benefitted from a MADT override to high edge for
> >>> IRQ 3 and 4 (UART IRQs) even though there are no INT_SRC_OVR messages
> >>> in the dmesg of the machine with the regression.
> >>>
> >>> *** fast forward to today ***
> >>>
> >>> The DMI quirk based approach seems to have worked well for the Ice La=
ke
> >>> era problems from approx. 3 years ago. But on AMD Zen based systems
> >>> the situation seems to be more complex. Not using the MADT override
> >>> is a problem for quite a few models. But using the MADT override
> >>> is a problem on quite a few other models ...
> >>>
> >>> Looking at the status quo for v6.4 where MADT overriding by default
> >>> is not used, 3 bugs have been filed where the override is actually
> >>> necessary (note dmesg snippets with patched kernel to enable
> >>> MADT override):
> >>>
> >>> 217394 - IRQ override skipping breaks the Aya Neo Air Plus 6800U keyb=
oard buttons
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=3D217394
> >>>
> >>> Aya Neo Air Plus - AMD Ryzen 7 6800U
> >>>
> >>> [    0.003333] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl df=
l)
> >>> [    0.003333] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low ed=
ge)
> >>> [    0.003333] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low le=
vel)
> >>> [    0.410670] ACPI: IRQ 1 override to edge, low(!)
> >>>
> >>> 217406 - very slow keyboard typing without IRQ override with new AMD =
Ryzen CPUs
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=3D217406
> >>>
> >>> HP Pavilion Aero 13 - AMD Ryzen 7735U
> >>>
> >>> [    0.026135] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low ed=
ge)
> >>> [    0.026136] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl df=
l)
> >>> [    0.026137] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low le=
vel)
> >>>
> >>> [    0.361640] ACPI: IRQ 1 override to edge, low(!)
> >>>
> >>> 217336 - keyboard not working Asus TUF FA617NS
> >>> https://bugzilla.kernel.org/show_bug.cgi?id=3D217336
> >>>
> >>> Asus TUF FA617NS - AMD Ryzen 7 7735HS
> >>>
> >>> Noteworthy DSTD keyboard resource:
> >>>
> >>>                 IRQNoFlags ()
> >>>                     {1}
> >>>
> >>> ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> >>> ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
> >>> ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> >>> ACPI: IRQ 1 override to edge, low(!)
> >>>
> >>> So for all 3 do use MADT override on Zen bugs we have an INT_SRC_OVR =
dmesg entry
> >>> for IRQ 1.
> >>>
> >>> Unfortunately the "MAINGEAR Vector Pro 2 17" / "MG-VCP2-17A3070T" for
> >>> which a quirk was added in commit 9946e39fe8d0 to force the override
> >>> even though it it Zen based breaks this pattern:
> >>>
> >>> [    0.073733] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl df=
l)
> >>> [    0.073734] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low le=
vel)
> >>> [    0.341347] ACPI: IRQ 1 override to edge, high(!)
> >>>
> >>> Still the presence of an INT_SRC_OVR for a specific legacy IRQ seems
> >>> to be a strong indicator that MADT overriding should be used in that
> >>> case and can be used to at least reduce the amount of DMI quirks.
> >>>
> >>> Another interesting data point is that all the devices for which
> >>> DMI quirks are present for which MADT overriding should not be used
> >>> for IRQ 1 all have a DSDT entry with the IRQ configured as level low
> >>> and exclusive.
> >>>
> >>> I think that the best thing to do might be to go back to
> >>> the original approach from:
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/c=
ommit/?id=3D0ec4e55e9f571f08970ed115ec0addc691eda613
> >>>
> >>> and then limit this to IRQ1. Also maybe inverting the check to:
> >>>
> >>> static bool irq_is_legacy(struct acpi_resource_irq *irq)
> >>> {
> >>>       return !(irq->triggering =3D=3D ACPI_LEVEL_SENSITIVE &&
> >>>                irq->polarity =3D=3D ACPI_ACTIVE_LOW &&
> >>>                irq->shareable =3D=3D ACPI_EXCLUSIVE);
> >>> }
> >>>
> >>> But I need to check if this will work for all the new Zen models
> >>> for which we got bug reports after the recent dropping of
> >>> 9946e39fe8d0 ("ACPI: resource: skip IRQ override on AMD Zen platforms=
")
> >>
> >> So today I have started with continueing the investigation looking
> >> at laptop models where we used to not override because of:
> >>
> >>         if (boot_cpu_has(X86_FEATURE_ZEN))
> >>                 return false;
> >>
> >> And where removing this and thus using the override has led to a
> >> regression.
> >>
> >> Looking at the acpidump-s from the following bugs:
> >>
> >> https://bugzilla.redhat.com/show_bug.cgi?id=3D2229165
> >> https://bugzilla.redhat.com/show_bug.cgi?id=3D2229317
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D217726
> >>
> >> All of these use the following settings for the kbd in the DSDT:
> >>
> >>          IRQ (Edge, ActiveLow, Shared, )
> >>              {1}
> >>
> >> So we know these are at least 3 models with "Edge, ActiveLow, Shared" =
IRQ 1 settings which must not use the override. But the existing quirks bef=
ore a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")=
 contain:
> >>
> >>         { tongfang_gm_rg, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, =
true },
> >>         { maingear_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1,=
 true },
> >>
> >> IOW models with "Edge, ActiveLow, Shared" IRQ 1 settings which OTOH mu=
st use the override, so as I was already afraid there is no easy for these =
DSDT IRQ 1 settings skip the override solution :|
> >>
> >> So I have 2 plans to move forward with this:
> >>
> >> Plan 1. Short them for 6.5 and backporting to 6.4.y (and other stable =
series):
> >>
> >> 1. Revert a9c4a912b7dc
> >> 2. Limit the acpi_dev_irq_override() check to only ever skip the IRQ o=
verride
> >>    (return false) for GSI 1.
> >> 3. Add a check if there is a INT_SRC_OVR MADT entry for GSI 1 and in t=
hat case
> >>    use the override even on ZEN, fixing:
> >>
> >> 217394 - IRQ override skipping breaks the Aya Neo Air Plus 6800U keybo=
ard buttons
> >>  https://bugzilla.kernel.org/show_bug.cgi?id=3D217394
> >> 217406 - very slow keyboard typing without IRQ override with new AMD R=
yzen CPUs
> >>  https://bugzilla.kernel.org/show_bug.cgi?id=3D217406
> >> 217336 - keyboard not working Asus TUF FA617NS
> >>  https://bugzilla.kernel.org/show_bug.cgi?id=3D217336
> >>
> >> Which are known AMD ZEN based laptops which do need the override for I=
RQ 1.
> >>
> >> This short term plan is not ideal, but it does fix all currently known=
 issues / models and does so in a way which will hopefully not cause regres=
sions on any other models.
> >>
> >>
> >> Plan 2. Long term, see if I can come up with a way to read back the ac=
tual trigger type set in the IOAPIC for IRQ 1 at boot (in drivers/acpi/reso=
urce.c) and use that.
> >
> > Sounds reasonable to me.
> >
> > It looks like using the IRQ 1 configuration left by the BIOS as is
> > would be the best choice unless that is not viable for some reason.
>
> Agreed, do you have a suggestion how to do that ? I've been looking at th=
is but I've gotten a bit lost in all the layers of ioapic code.
>
> It looks like we need to add a flag to acpi_register_gsi() for it to regi=
ster a gsi while keeping the IOAPIC settings as is (or a new function) but =
it is not clear to me how to implement this.
>
> An alternative method would be to call irq_get_trigger_type() for IRQ 1 a=
nd use that for the IRQ trigger info when calling acpi_register_gsi(), but =
I think we need to have the IRQ registered / added to the IRQ domain first =
?

I need to take a deeper look into this, which I guess is going to take
some time.

If you figure this out in the meantime, please let me know.
