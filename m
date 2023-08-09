Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF017752
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 14:58:04 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-56d26137095so1011827eaf.1
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 07:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691593084; x=1692197884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guzu/+wE2xbeIQCNFGsUh3J9zEJsNU71gsPXh1jGfuo=;
        b=i/4YscBv+UA1XOKsliYPem809SMn02BQ2AhCNxukWI/SP5+LaaSrWPoUYZLZ9bWy7N
         JstbQ+8fF5GziO8vbo9OYTgwClhfqJhwpHotcDs3iGU2iHHb/kbg1mFpQbxox7fdzRws
         NIJFUTrGhc0rAVWSwXq1aJaLoffXceZk/TOoZJDIV1Sx45fRKtBT+wEbmqS8hW2WRp5n
         CA1FT0TtQeZ/m8GiKQ88MCjSE7P+/4S833ClF91MnN50DzNhT+HZqWxsMn07OXV804lg
         67Ibrp9QupWDYuqzV4PmMYs+cM7wk+dOHbs4i1qALd1r5+vJMgY/lx43TnC9lXpotu69
         l37g==
X-Gm-Message-State: AOJu0Yw20EH9Mdo3iwkvhyMpTxrqjwu9TN2AvoPrUAVy9Sv0s6Gy5VQN
	1XolLVkO7t7NFKH4/O2JlwXTUxnMeDBq7w6U/5Q=
X-Google-Smtp-Source: AGHT+IF/p/GEZe/16sVQWpg2UzPaOiKB7HX/MaLebIpIA3z/PKH4Zd/5EhPlCpND4aoMBTPmF3+nbZVYe6CwaKIR368=
X-Received: by 2002:a4a:c816:0:b0:56d:72dc:5410 with SMTP id
 s22-20020a4ac816000000b0056d72dc5410mr2262417ooq.1.1691593082993; Wed, 09 Aug
 2023 07:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230809085526.84913-1-hdegoede@redhat.com> <20230809085526.84913-4-hdegoede@redhat.com>
 <f133d401-1975-6c85-47c5-f9464d5ef06f@kernel.org> <3fe197da-c26e-e826-4ea2-c13d2880046d@redhat.com>
In-Reply-To: <3fe197da-c26e-e826-4ea2-c13d2880046d@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Aug 2023 16:57:51 +0200
Message-ID: <CAJZ5v0garg=icaM5f0JNvY+ip7PX1omMRWDS-UvF1_1f82SYZg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ACPI: resource: Honor MADT INT_SRC_OVR settings
 for IRQ1 on AMD Zen
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, August Wikerfors <git@augustwikerfors.se>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-acpi@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 4:40=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> On 8/9/23 11:20, Jiri Slaby wrote:
> > On 09. 08. 23, 10:55, Hans de Goede wrote:
> >> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
> >> settings over the MADT settings.
> >>
> >> This causes the keyboard to malfunction on some laptop models
> >> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
> >> for IRQ 1.
> > ...
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ...
> >> diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
> >> index 21b542a6866c..b88e5e0135ab 100644
> >> --- a/arch/x86/kernel/acpi/boot.c
> >> +++ b/arch/x86/kernel/acpi/boot.c
> >> @@ -52,6 +52,7 @@ int acpi_lapic;
> >>   int acpi_ioapic;
> >>   int acpi_strict;
> >>   int acpi_disable_cmcff;
> >> +int acpi_int_src_ovr[NR_IRQS_LEGACY];
> >
> > So why not to use bool to make it clear this is not an irq number, but =
a state?
> >
> >>     /* ACPI SCI override configuration */
> >>   u8 acpi_sci_flags __initdata;
> >> @@ -588,6 +589,9 @@ acpi_parse_int_src_ovr(union acpi_subtable_headers=
 * header,
> >>         acpi_table_print_madt_entry(&header->common);
> >>   +    if (intsrc->source_irq < NR_IRQS_LEGACY)
> >> +        acpi_int_src_ovr[intsrc->source_irq] =3D 1;
> >
> > And "true" here.
>
> Ack that would indeed be better.
>
> Rafael, can you fix this up while merging or do you want a v4 series ?

I think I can do that.
