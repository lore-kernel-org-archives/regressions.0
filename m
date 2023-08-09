Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039224503
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 19:26:02 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-56db9f7eb52so30676eaf.1
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 12:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691609162; x=1692213962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV5Wpjam6CMkVYlxjsN/MHAlgODzju590XBq5bff4X4=;
        b=biVeeQA26aD/VV9CMRwXMvzhMJmm/sw68Y+oJ+GmCxaTY5AzdGRtPV2S1MTXB+be+A
         7zyIiigkZpzmt8uVhZIc7fqbjbTVvmeM5hUMQtU3tvOpCIFkqOkOaY66VW1k76jTVVrO
         QOpRSu2NKJD7B0/q9zYsukHJeBQR+n0q1/OhdR0rrSMXDe3DrDcH5e3Hm+7YD3OijyPR
         1I8Fknt8xPyKcexyO8FoNSmyrgImxVJLbBM8JYw5/EWrfmOkMkvcezlNDIw4ip2y6KeB
         90t4lX3O/iqSJN4XB25IJfhK/JZt+DOfZxOTIbgVhve5grlbC40KN/34WF5CPbEOdjRj
         PD3w==
X-Gm-Message-State: AOJu0YxZ7J3ppb4Kj3qBBG/HNnkkotlLE6KOIxT1lYMpd8HjTMW7ew5v
	zytSyJA3Q+mbC/KyMkqmi4cCEvEIKToHGOQNhTA=
X-Google-Smtp-Source: AGHT+IEZ4QpU4CaYGsNeWctCX7/OICx+wHmjYw0hnpQ0Yg8DkB3QkVcd8RjePvFpfu7RXFRfykEnAIJfusNd/VM50vo=
X-Received: by 2002:a4a:de86:0:b0:560:b01a:653d with SMTP id
 v6-20020a4ade86000000b00560b01a653dmr264884oou.0.1691609161835; Wed, 09 Aug
 2023 12:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809085526.84913-1-hdegoede@redhat.com> <20230809085526.84913-4-hdegoede@redhat.com>
 <6a6fa2ba-c07d-45b2-96c5-b0f44f5f288b@augustwikerfors.se> <c3684f00-27bd-d4dd-93dd-18936c006de9@redhat.com>
In-Reply-To: <c3684f00-27bd-d4dd-93dd-18936c006de9@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Aug 2023 21:25:50 +0200
Message-ID: <CAJZ5v0gx_vu_Pip3rkUo_78mNnUbp++hpRfpa-iDaZP9r6_4sw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ACPI: resource: Honor MADT INT_SRC_OVR settings
 for IRQ1 on AMD Zen
To: Hans de Goede <hdegoede@redhat.com>
Cc: August Wikerfors <git@augustwikerfors.se>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-acpi@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 9:20=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> On 8/9/23 17:58, August Wikerfors wrote:
> > On 2023-08-09 10:55, Hans de Goede wrote:
> >> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
> >> settings over the MADT settings.
> >>
> >> This causes the keyboard to malfunction on some laptop models
> >> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
> >> for IRQ 1.
> >>
> >> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and =
quirks")
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217336
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217394
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217406
> >> Cc: Mario Limonciello <mario.limonciello@amd.com>
> >> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > One of the laptops fixed by a9c4a912b7dc, PCSpecialist Elimina Pro 16 M=
 [1], seems to have no INT_SRC_OVR entry for IRQ 1 [2]:
> >
> >> [    0.084265] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl=
)
> >> [    0.084266] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low lev=
el)
> >
> > I'm not sure if it was IRQ 1 that needed to be overridden for that mode=
l though, so it may work anyway with patch 2 of this series.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217394#c18
> > [2] https://bugzilla.kernel.org/attachment.cgi?id=3D304338
>
> Good catch, thanks. So it looks like this one needs a DMI quirk (until we=
 have a better generic solution.
>
> I'll reach out to the reporter and ask for dmidecode output and prepare a=
 follow-up patch. Still I think
> that we should move forward with this series to fix the 6 bugs which are =
linked to from PAtch 1's
> commitmsg and those are likely just the top of the iceberg.

You are probably right, but it would be good to get a fix for this
ASAP, as I would prefer it to go in along with the series, if
possible.
