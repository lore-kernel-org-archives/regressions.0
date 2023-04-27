Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20923D5
	for <regressions@lists.linux.dev>; Thu, 27 Apr 2023 16:47:04 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9594916df23so161075166b.1
        for <regressions@lists.linux.dev>; Thu, 27 Apr 2023 09:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682614023; x=1685206023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjsrLK++1Ok9mkPQh5RzlJPsuvae+2fAnwHy/bXuTZQ=;
        b=iGUz+yha5eyPi12tErNnmiFwYqrCebxrO6Pih0R3yQu/Zx7Kr0GSZabmgJzr5QboZ1
         I8I7RJR+mcI4QR6uAP5e0umLudXKTWzLYysMMleWLwOYcG4tAJFfYVbavPgPFBNh95Ix
         VT40EJ/izCzDBPYFtqKWlhjItFqUf0CSrnuEFxXKUFKVfaV+1QQ/f1fhEGDwFOwFwebj
         sqt2jnNQUTznZNmBDznVITtCuWgROPDGO4LBbYlLnomVC84ZjjwjP2oVzODb5mcP+ddz
         FVFJBOs1wGKRIqN424pyyf+JFfddfyAdd11yiC/1BKCZTqX6m6Wz4NadxO8lbNUu63Jn
         PsMg==
X-Gm-Message-State: AC+VfDzc+5xHOnuhJNYV/3eSECCwLXjgyywxBlynhEjbXfl40LID9/A4
	5Gt3zvMS0gK1ncSLte2dFvtcaMocGAiFapCwDgk=
X-Google-Smtp-Source: ACHHUZ7D1zPxvk3A3EfX41SNrGI4Oj+vvVgaiLJaFUX28cuiAeNQp++k07zyro+shIsRsSfHNs5lDdKbXwvh2ifcbAQ=
X-Received: by 2002:a17:906:64c4:b0:930:7f40:c1bb with SMTP id
 p4-20020a17090664c400b009307f40c1bbmr2189658ejn.4.1682614022494; Thu, 27 Apr
 2023 09:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230420110220.23168-1-hdegoede@redhat.com>
In-Reply-To: <20230420110220.23168-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Apr 2023 18:46:51 +0200
Message-ID: <CAJZ5v0jUC24BanTT_-RTm=5z0Hnpdvyse4VgFsV-VFsM1nbxHg@mail.gmail.com>
Subject: Re: [PATCH] ACPI: PM: Do not turn of unused power resources on the
 Toshiba Click Mini
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, regressions@lists.linux.dev, 
	linux-acpi@vger.kernel.org, =?UTF-8?B?R8OpIEtvZXJrYW1w?= <ge.koerkamp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 1:02=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The CPR3 power resource on the Toshiba Click Mini toggles a GPIO
> which is called SISP (for SIS touchscreen power?) on/off.
>
> This CPR3 power resource is not listed in any _PR? lists, let alone
> in a _PR0 list for the SIS0817 touchscreen ACPI device which needs it.
>
> Before commit a1224f34d72a ("ACPI: PM: Check states of power resources
> during initialization") this was not an issue because since nothing
> referenced the CPR3 power resource its state was always
> ACPI_POWER_RESOURCE_STATE_UNKNOWN and power resources with this state
> get ignored by acpi_turn_off_unused_power_resources().
>
> This clearly is a bug in the DSDT of this device. Add a DMI quirk
> to make acpi_turn_off_unused_power_resources() a no-op on this
> model to fix the touchscreen no longer working since kernel 5.16 .
>
> This quirk also causes 2 other power resources to not get turned
> off, but the _OFF method on these already was a no-op, so this makes
> no difference for the other 2 power resources.
>
> Fixes: a1224f34d72a ("ACPI: PM: Check states of power resources during in=
itialization")
> Reported-by: G=C3=A9 Koerkamp <ge.koerkamp@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216946
> Link: https://lore.kernel.org/regressions/32a14a8a-9795-4c8c-7e00-da9012f=
548f8@leemhuis.info/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/power.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
> index 292cec3691cc..5dc792961ab8 100644
> --- a/drivers/acpi/power.c
> +++ b/drivers/acpi/power.c
> @@ -23,6 +23,7 @@
>
>  #define pr_fmt(fmt) "ACPI: PM: " fmt
>
> +#include <linux/dmi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -1022,6 +1023,21 @@ void acpi_resume_power_resources(void)
>  }
>  #endif
>
> +static const struct dmi_system_id dmi_leave_unused_power_resources_on[] =
=3D {
> +       {
> +               /*
> +                * The Toshiba Click Mini has a CPR3 power-resource which=
 must
> +                * be on for the touchscreen to work, but which is not in=
 any
> +                * _PR? lists. The other 2 affected power-resources are n=
o-ops.
> +                */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SATELLITE Click Mini=
 L9W-B"),
> +               },
> +       },
> +       {}
> +};
> +
>  /**
>   * acpi_turn_off_unused_power_resources - Turn off power resources not i=
n use.
>   */
> @@ -1029,6 +1045,9 @@ void acpi_turn_off_unused_power_resources(void)
>  {
>         struct acpi_power_resource *resource;
>
> +       if (dmi_check_system(dmi_leave_unused_power_resources_on))
> +               return;
> +
>         mutex_lock(&power_resource_list_lock);
>
>         list_for_each_entry_reverse(resource, &acpi_power_resource_list, =
list_node) {
> --

Applied as 6.4-rc material, thanks!
