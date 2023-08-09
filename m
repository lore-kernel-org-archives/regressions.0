Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09DC613F
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 09:20:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so1481019a12.0
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 02:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691572825; x=1692177625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQaLc2nrPpBthIHL1xHv2ULZnA/x9m4F2lf1Bl4ddVk=;
        b=UHKz0+Gt15/L1vzBWFqblZDIIdJ9COz+CZFJT+ZKJsd+uu1A/1N6wBDdMANb8XAzKf
         kbZf6oH/05VPZ4Y+3wjEhgJzrKROEhM2TKNUgYdlj2Ko0TQoUNh+BppBLFTe/mSiIDK5
         PUnbiJM08b/ycZCAab4t0pDGE4G/gFAbpI9UF22oo2Gb4TUhE5NUfJ9SQ83/dif66sbe
         9ZjXzQtdiG+yIlgtbj86wKAKKJ9T9C9aStWUAcRbYamU2hjPBG7fMHFbdCKOWkZj0pR2
         Wy2nJgzmq38a7c/Cl0zT0NjD1Q3qEo3xAdkMgLzQkdcpGdFn7+Ay8AvBIh2PjluaWQsi
         Y7vw==
X-Gm-Message-State: AOJu0YwHXfIilXXnzviWLuFSt5xRbgXKIKfIT1U09N32eher0g+SVd13
	p1LSpmrkytDyC1xDbaYDro8=
X-Google-Smtp-Source: AGHT+IHQymkVmf03FNeB5DWxGpGXvjqZuIUhesQ/SgWXPwpMAiEFq1X/yV4zd/M3vybssHCsoJw0Bw==
X-Received: by 2002:aa7:df09:0:b0:523:2e23:a0bf with SMTP id c9-20020aa7df09000000b005232e23a0bfmr2599976edy.11.1691572824686;
        Wed, 09 Aug 2023 02:20:24 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id e23-20020a056402089700b00521d2f7459fsm7681092edy.49.2023.08.09.02.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 02:20:24 -0700 (PDT)
Message-ID: <f133d401-1975-6c85-47c5-f9464d5ef06f@kernel.org>
Date: Wed, 9 Aug 2023 11:20:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 3/3] ACPI: resource: Honor MADT INT_SRC_OVR settings
 for IRQ1 on AMD Zen
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 August Wikerfors <git@augustwikerfors.se>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org, linux-acpi@vger.kernel.org, x86@kernel.org
References: <20230809085526.84913-1-hdegoede@redhat.com>
 <20230809085526.84913-4-hdegoede@redhat.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230809085526.84913-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09. 08. 23, 10:55, Hans de Goede wrote:
> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
> settings over the MADT settings.
> 
> This causes the keyboard to malfunction on some laptop models
> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
> for IRQ 1.
...
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
...
> diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
> index 21b542a6866c..b88e5e0135ab 100644
> --- a/arch/x86/kernel/acpi/boot.c
> +++ b/arch/x86/kernel/acpi/boot.c
> @@ -52,6 +52,7 @@ int acpi_lapic;
>   int acpi_ioapic;
>   int acpi_strict;
>   int acpi_disable_cmcff;
> +int acpi_int_src_ovr[NR_IRQS_LEGACY];

So why not to use bool to make it clear this is not an irq number, but a 
state?

>   
>   /* ACPI SCI override configuration */
>   u8 acpi_sci_flags __initdata;
> @@ -588,6 +589,9 @@ acpi_parse_int_src_ovr(union acpi_subtable_headers * header,
>   
>   	acpi_table_print_madt_entry(&header->common);
>   
> +	if (intsrc->source_irq < NR_IRQS_LEGACY)
> +		acpi_int_src_ovr[intsrc->source_irq] = 1;

And "true" here.

thanks,
-- 
js
suse labs

