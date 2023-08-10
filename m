Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0699E1E1A2
	for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 14:49:44 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56dd9ae2a5fso65172eaf.0
        for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 07:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678984; x=1692283784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMzgW+3jzEv/ecQrQa5Qs5BoMZYlUEy0gREGzAbobF4=;
        b=OjfgMkTE1Wl8CMERqqGpx8yyaon8rYjVqjhBml1yvH+guJsMwWJoR4jJIyN2ifmTbr
         a2LI3dxpD49CXphiz9s9EMK16z182dtmIDBRnL3elPXAVnZosEVejenY1k4CFr5UZw+J
         D4p02jWkasXogRqOthO2gMFxU40zJZViKb/bIqP85HLs+a7TK+kM0uRr4eWLs/kvs16R
         7mRAPviYjXOW0ebG4osb/jwhwRcz95daaj9DvGL1v5XFBN/bzKeaDORFROAAl/172EIx
         FzlFz5danGz+IaCE/VJFQRl+tmzqqPi3jT7FRoXQ4EsCJROyJOVoBNNLTS6Bf+tC3THo
         ab5g==
X-Gm-Message-State: AOJu0YzYW+Wft3KL/3340qYBySzCZ8U7uEU7ciooLi1bRKNIz1NSf4Ol
	L/ert0yJ371iTU2BC4/YGGy3dV9PXO+ffHpXpf0=
X-Google-Smtp-Source: AGHT+IHV+Te+ZF4lEDRo0HwOLd5Evjv0bTsSv5sNdWTyzooon9iztBBVQu0huihwds5RKBsy7qk8LjI+k7gEH/lG0ZM=
X-Received: by 2002:a05:6820:210a:b0:56d:6bd4:4db5 with SMTP id
 cd10-20020a056820210a00b0056d6bd44db5mr2065984oob.0.1691678983854; Thu, 10
 Aug 2023 07:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230810090011.104770-1-hdegoede@redhat.com>
In-Reply-To: <20230810090011.104770-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 10 Aug 2023 16:49:32 +0200
Message-ID: <CAJZ5v0h=gPsKVHJYN0PjVgqNp4BWND8Psi1y-cu3R-WYrK=45g@mail.gmail.com>
Subject: Re: [PATCH] ACPI: resource: Add IRQ override quirk for PCSpecialist
 Elimina Pro 16 M
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	August Wikerfors <git@augustwikerfors.se>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 11:00=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> The PCSpecialist Elimina Pro 16 M laptop model is a Zen laptop which
> needs to use the MADT IRQ settings override and which does not have
> an INT_SRC_OVR entry for IRQ 1 in its MADT.
>
> So this model needs a DMI quirk to enable the MADT IRQ settings override
> to fix its keyboard not working.
>
> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and qui=
rks")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217394#c18
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Cc: All applicable <stable@vger.kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/resource.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
> index 8e32dd5776f5..a4d9f149b48d 100644
> --- a/drivers/acpi/resource.c
> +++ b/drivers/acpi/resource.c
> @@ -498,6 +498,17 @@ static const struct dmi_system_id maingear_laptop[] =
=3D {
>         { }
>  };
>
> +static const struct dmi_system_id pcspecialist_laptop[] =3D {
> +       {
> +               .ident =3D "PCSpecialist Elimina Pro 16 M",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Elimina Pro 16 M"),
> +               },
> +       },
> +       { }
> +};
> +
>  static const struct dmi_system_id lg_laptop[] =3D {
>         {
>                 .ident =3D "LG Electronics 17U70P",
> @@ -523,6 +534,7 @@ static const struct irq_override_cmp override_table[]=
 =3D {
>         { asus_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false=
 },
>         { tongfang_gm_rg, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, tru=
e },
>         { maingear_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, tr=
ue },
> +       { pcspecialist_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1=
, true },
>         { lg_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false }=
,
>  };
>
> --

Applied and added to the linux-next branch in linux-pm.git, thanks!
