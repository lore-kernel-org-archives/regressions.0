Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B710957
	for <regressions@lists.linux.dev>; Mon,  7 Aug 2023 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691421604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wFqv/cLru+C9EdiPmmulE3UaUKd0oAuNQ0J088mMQ+8=;
	b=YqCHmH0f5QszbRq6puciWjHhl8TVNKZAV1Pij2IznaxyFJGgVFyk/bI+8ZJg7a3Xis/H7k
	YWjdFtMV0lZ/CsMt861Xpzep+Bw3XoHMw7nK6/VfxxQv+KB7YywPE1I8pDDwqy6lNLDtlp
	X5o27O96K+3da+XhsJLuqpwG2M8G7Jw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-0b89j57NNS-WrJyvu00R4A-1; Mon, 07 Aug 2023 11:20:02 -0400
X-MC-Unique: 0b89j57NNS-WrJyvu00R4A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bc8f1290eso314694766b.3
        for <regressions@lists.linux.dev>; Mon, 07 Aug 2023 08:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691421601; x=1692026401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFqv/cLru+C9EdiPmmulE3UaUKd0oAuNQ0J088mMQ+8=;
        b=S28g2NaMJ0H0UrJGj0+ylWgo3vS+1Xkm9ivuRylHpq5wfGdEiKmcolmSusyKKys9vU
         KpBE8xQLPzv4x2eim2q5yZBRDj19EGw3NIm5p1J/CsaqyheBqYP+EY9+c88iStcH2AUD
         33xyBIiXTXD7gnKA7I9OoCjlALf8g3+kDKSCNetGZtTKGnYSUWfSgbmhYWp+RUWct4Fc
         b9N6pW4r4s8WMrqIvOgjEJH13jjsR/dLoSwNb45WLE5Qk88Xshh9gouvDDr2i0R+UmeZ
         YUa+vXO0uYjnYvOlwqqOKF7E7ulbO5sXQqSJcxDaTweDzuQL9wqSlRxFjFrjbpMVY3c1
         oGGw==
X-Gm-Message-State: AOJu0Yze934cTLmtZQdDYa3v+m9hK/JD/NzxT2ovya9RXJ+o9ZpbkSQP
	qoRiTs2N13HsXSUqF8BOmLRHr4kELIldnz3VUU5HOB+9P890Zdbq+pzNdj22Cyc0q4PRswgCMLy
	JP7leAABm2PvVSxHJfJPhPfc=
X-Received: by 2002:a17:906:ef90:b0:99c:4c94:1a9a with SMTP id ze16-20020a170906ef9000b0099c4c941a9amr6771622ejb.42.1691421601502;
        Mon, 07 Aug 2023 08:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj2BYdB5sgBFDcOsXFzpQIRJr3pnZIUQAYATthoLkJCHhAJUC+aVdZHM4mDbl/rkxKP6+Zig==
X-Received: by 2002:a17:906:ef90:b0:99c:4c94:1a9a with SMTP id ze16-20020a170906ef9000b0099c4c941a9amr6771610ejb.42.1691421601194;
        Mon, 07 Aug 2023 08:20:01 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y8-20020a1709063a8800b0099316c56db9sm5241702ejd.127.2023.08.07.08.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 08:20:00 -0700 (PDT)
Message-ID: <3cdde518-1c0c-24dc-1ffb-90ae34c23296@redhat.com>
Date: Mon, 7 Aug 2023 17:19:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ACPI: resource: revert "Remove "Zen" specific match and
 quirks"
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org, Mario Limonciello
 <mario.limonciello@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <20230806151453.10690-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230806151453.10690-1-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 8/6/23 17:14, Hans de Goede wrote:
> Commit a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and
> quirks") is causing keyboard problems for quite a log of AMD based
> laptop users, leading to many bug reports.
> 
> Revert this change for now, until we can come up with
> a better fix for the PS/2 IRQ trigger-type/polarity problems
> on some x86 laptops.
> 
> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229165
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229317
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217726
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've spend most of today analysing the situation / this problem :

213031 - MEDION notebook internal keyboard not recognized / not working correctly
https://bugzilla.kernel.org/show_bug.cgi?id=213031

This is the bug that started it all, the issue here was overriding
a level low DSDT entry:

                IRQ (Level, ActiveLow, Exclusive, )
                    {1}

With an edge high entry from the MADT, note that edge high is the default
mp_irqs[idx].irqflags value for legacy/ISA IRQs. The dmesg for the Ice Lake
Medion M15T this bug is about shows no INT_SRC_OVR entry for IRQ 1
in the MADT, it does show INT_SRC_OVR entries for IRQ 0 and 9.

At first a fix was attempted to not use the MADT override unless
the DSDT entry was edge high. But that caused regressions, so a switch
to a DMI based approach was used instead. Noteworthy is that some of
the regressions benefitted from a MADT override to high edge for
IRQ 3 and 4 (UART IRQs) even though there are no INT_SRC_OVR messages
in the dmesg of the machine with the regression.

*** fast forward to today ***

The DMI quirk based approach seems to have worked well for the Ice Lake
era problems from approx. 3 years ago. But on AMD Zen based systems
the situation seems to be more complex. Not using the MADT override
is a problem for quite a few models. But using the MADT override
is a problem on quite a few other models ...

Looking at the status quo for v6.4 where MADT overriding by default
is not used, 3 bugs have been filed where the override is actually
necessary (note dmesg snippets with patched kernel to enable
MADT override):

217394 - IRQ override skipping breaks the Aya Neo Air Plus 6800U keyboard buttons 
https://bugzilla.kernel.org/show_bug.cgi?id=217394

Aya Neo Air Plus - AMD Ryzen 7 6800U

[    0.003333] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.003333] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    0.003333] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.410670] ACPI: IRQ 1 override to edge, low(!)

217406 - very slow keyboard typing without IRQ override with new AMD Ryzen CPUs
https://bugzilla.kernel.org/show_bug.cgi?id=217406

HP Pavilion Aero 13 - AMD Ryzen 7735U 

[    0.026135] ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    0.026136] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.026137] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)

[    0.361640] ACPI: IRQ 1 override to edge, low(!)

217336 - keyboard not working Asus TUF FA617NS 
https://bugzilla.kernel.org/show_bug.cgi?id=217336

Asus TUF FA617NS - AMD Ryzen 7 7735HS

Noteworthy DSTD keyboard resource:

                IRQNoFlags ()
                    {1}

ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
ACPI: IRQ 1 override to edge, low(!)

So for all 3 do use MADT override on Zen bugs we have an INT_SRC_OVR dmesg entry
for IRQ 1.

Unfortunately the "MAINGEAR Vector Pro 2 17" / "MG-VCP2-17A3070T" for
which a quirk was added in commit 9946e39fe8d0 to force the override
even though it it Zen based breaks this pattern:

[    0.073733] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.073734] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.341347] ACPI: IRQ 1 override to edge, high(!)

Still the presence of an INT_SRC_OVR for a specific legacy IRQ seems
to be a strong indicator that MADT overriding should be used in that
case and can be used to at least reduce the amount of DMI quirks.

Another interesting data point is that all the devices for which
DMI quirks are present for which MADT overriding should not be used
for IRQ 1 all have a DSDT entry with the IRQ configured as level low
and exclusive.

I think that the best thing to do might be to go back to
the original approach from:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?id=0ec4e55e9f571f08970ed115ec0addc691eda613

and then limit this to IRQ1. Also maybe inverting the check to:

static bool irq_is_legacy(struct acpi_resource_irq *irq)
{
	return !(irq->triggering == ACPI_LEVEL_SENSITIVE &&
		 irq->polarity == ACPI_ACTIVE_LOW &&
		 irq->shareable == ACPI_EXCLUSIVE);
}

But I need to check if this will work for all the new Zen models
for which we got bug reports after the recent dropping of
9946e39fe8d0 ("ACPI: resource: skip IRQ override on AMD Zen platforms")

Regards,

Hans





> ---
>  drivers/acpi/resource.c | 60 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
> index 1dd8d5aebf67..0800a9d77558 100644
> --- a/drivers/acpi/resource.c
> +++ b/drivers/acpi/resource.c
> @@ -470,6 +470,52 @@ static const struct dmi_system_id asus_laptop[] = {
>  	{ }
>  };
>  
> +static const struct dmi_system_id lenovo_laptop[] = {
> +	{
> +		.ident = "LENOVO IdeaPad Flex 5 14ALC7",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82R9"),
> +		},
> +	},
> +	{
> +		.ident = "LENOVO IdeaPad Flex 5 16ALC7",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82RA"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static const struct dmi_system_id tongfang_gm_rg[] = {
> +	{
> +		.ident = "TongFang GMxRGxx/XMG CORE 15 (M22)/TUXEDO Stellaris 15 Gen4 AMD",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static const struct dmi_system_id maingear_laptop[] = {
> +	{
> +		.ident = "MAINGEAR Vector Pro 2 15",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro Electronics Inc"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "MG-VCP2-15A3070T"),
> +		}
> +	},
> +	{
> +		.ident = "MAINGEAR Vector Pro 2 17",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Micro Electronics Inc"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "MG-VCP2-17A3070T"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static const struct dmi_system_id lg_laptop[] = {
>  	{
>  		.ident = "LG Electronics 17U70P",
> @@ -493,6 +539,10 @@ struct irq_override_cmp {
>  static const struct irq_override_cmp override_table[] = {
>  	{ medion_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
>  	{ asus_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
> +	{ lenovo_laptop, 6, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, true },
> +	{ lenovo_laptop, 10, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, true },
> +	{ tongfang_gm_rg, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
> +	{ maingear_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
>  	{ lg_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
>  };
>  
> @@ -512,6 +562,16 @@ static bool acpi_dev_irq_override(u32 gsi, u8 triggering, u8 polarity,
>  			return entry->override;
>  	}
>  
> +#ifdef CONFIG_X86
> +	/*
> +	 * IRQ override isn't needed on modern AMD Zen systems and
> +	 * this override breaks active low IRQs on AMD Ryzen 6000 and
> +	 * newer systems. Skip it.
> +	 */
> +	if (boot_cpu_has(X86_FEATURE_ZEN))
> +		return false;
> +#endif
> +
>  	return true;
>  }
>  

