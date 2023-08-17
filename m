Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32614011
	for <regressions@lists.linux.dev>; Thu, 17 Aug 2023 16:24:35 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-56d0deeca09so6952eaf.0
        for <regressions@lists.linux.dev>; Thu, 17 Aug 2023 09:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692289475; x=1692894275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBBBHCM2okzA85vCsBAXaRkTASvm3O3EAAP4Nr5CObQ=;
        b=FR5G03McSe3ZtauQXteyXWnIps0NkqCbdgK1LNlTczU7UnJ48W/90AThKoAGvzRGGK
         S8sO+j8Dwng0skVVG2kyZkcdUyKmxKrqI6QlRFIox8s7JlK0Q6F8jwdvyb+2ELFkNgYd
         5L5zYxseN++X5Nv0VdKc2yjQNgJItad2B1Q8Ww5Frxk6R8z1iSHvqoT0e7S0c4/eRhoN
         4VLYDpE8biMYArUZ4HOoA7oA/n33zZR5ikDJYWA9iIL5X0P9QvHcK+pnncChgRWJopa9
         A9CYfpTdNWwOl5JxoKXOfzQnAw6Gi+PS0Qu8Z2UgP7MVPCHOX5ChkQen1S+FxG+nyH70
         anKQ==
X-Gm-Message-State: AOJu0Yxt1BjumI2Iiz8JUCxscpBl02sDTCXRhudq6MhI7c91UHT+LJbh
	0DOyw6ez7A87jvnqu9fgSyo4PR1UajzzzAyNqLPx9epa
X-Google-Smtp-Source: AGHT+IHmB8LvuyQMhT+BbqoPdh2FW8j6LBRbkY7adbl/KChJqESzuYS//cTk0uEV7J22TETXJodYBJVm2Hwhv7Gc3b8=
X-Received: by 2002:a4a:e0cd:0:b0:56e:72e0:9c5f with SMTP id
 e13-20020a4ae0cd000000b0056e72e09c5fmr209182oot.1.1692289474487; Thu, 17 Aug
 2023 09:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230728183921.17230-1-mario.limonciello@amd.com>
In-Reply-To: <20230728183921.17230-1-mario.limonciello@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 17 Aug 2023 18:24:22 +0200
Message-ID: <CAJZ5v0iDJtTjZXB3HLZgLX2tLF5DW8Da2-S77zDLsBvH1A1kpA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: resource: Add a quirk for Lenovo Yoga 7 14ARB7
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, regressions@lists.linux.dev, 
	August Wikerfors <git@augustwikerfors.se>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 8:58=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Lenovo Yoga 7 needs to have keyboard interrupt signaling polarity
> is incorrect in the MADT and the value from the DSDT should be used.
>
> Reported-by: August Wikerfors <git@augustwikerfors.se>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D217718
> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and qui=
rks")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Is this still needed after the recent changes from Hans?

> ---
>  drivers/acpi/resource.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
> index 1dd8d5aebf678..1a826419d5837 100644
> --- a/drivers/acpi/resource.c
> +++ b/drivers/acpi/resource.c
> @@ -481,6 +481,17 @@ static const struct dmi_system_id lg_laptop[] =3D {
>         { }
>  };
>
> +static const struct dmi_system_id lenovo_laptop[] =3D {
> +       {
> +               .ident =3D "Lenovo Yoga 7 14ARB7",
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +               },
> +       },
> +       { }
> +};
> +
>  struct irq_override_cmp {
>         const struct dmi_system_id *system;
>         unsigned char irq;
> @@ -494,6 +505,7 @@ static const struct irq_override_cmp override_table[]=
 =3D {
>         { medion_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, fal=
se },
>         { asus_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false=
 },
>         { lg_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false }=
,
> +       { lenovo_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 1, fal=
se}
>  };
>
>  static bool acpi_dev_irq_override(u32 gsi, u8 triggering, u8 polarity,
> --
> 2.34.1
>
