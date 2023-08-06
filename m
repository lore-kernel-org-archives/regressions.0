Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060535696
	for <regressions@lists.linux.dev>; Sun,  6 Aug 2023 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691346020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSC0nhQYh4CfeL29OqIqZRL9s5DPSTmoy4ZpT/cMCmk=;
	b=KVHXxzxXF47Nc+RhhOKOV7MUHhr/x9/ubNejblyq5r1eq3C5fFi4U37J3USoi3+fzq6V4j
	Whv9hX3/YAEKCGoS6MjhyMRguA6HFG1fmm5kt4Toh9JxZ/8fW4VNdsKbLAWYykF63abDPK
	1jgi1WkLfPkfR0y+Ex4ylNGU6dHem4E=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-NXLMB-wlNRG0HXtfvnjHkA-1; Sun, 06 Aug 2023 14:20:19 -0400
X-MC-Unique: NXLMB-wlNRG0HXtfvnjHkA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b9bf493456so36229291fa.0
        for <regressions@lists.linux.dev>; Sun, 06 Aug 2023 11:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691346017; x=1691950817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSC0nhQYh4CfeL29OqIqZRL9s5DPSTmoy4ZpT/cMCmk=;
        b=QgDsgOS1PSlotlyHwaMukf0mwui2Ufl+BmYmiRqy7w0Jc9Tv4SrSbjWPlQsfqfsO2c
         WbFxVRz8c07VkJ6LH91xjfp9ozBW6V6FIO8EeuMT5IS9lIOhmTUQ9MdiYTyyjaMLCq+7
         2UyH+2DblqNC1umMM5hwqlJfuSJLEazlTyasD/S97+RLqMjrFe3F8xin/pQoj5UZk6Hf
         A2Z1Mvqy3d+6z5xdgcfSbYS7erY6rBkkgfVIYA8ahoAh0GEgRZjXbxex/w57Ly8lyaIj
         ewHjt9HbyQQKFVc53FDgsAXS7jYu7gniXx3goIbZBkULOnD6ZpsC8AWjcc1CdNS2I6ds
         tuVg==
X-Gm-Message-State: AOJu0YyVZfoUl8vEV47nXqaQuwg5aJnnKJ+W0ScaBdhnftxkEji6iR89
	Y3wm3m8hmj1FqqAnircUYvKbvgt0Bjpbz5w1KYzVfhkWpELESa2sTMdHvZZuiCQQIPLAtxyYl2p
	S9Y0BWZZS248ZD4q1SqGR0kc=
X-Received: by 2002:a2e:7c15:0:b0:2b6:e105:6174 with SMTP id x21-20020a2e7c15000000b002b6e1056174mr4763482ljc.47.1691346017602;
        Sun, 06 Aug 2023 11:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUhi1wLAOGbe2I1gYd6DBRCyk8IJP/ndGdF6V2OiTaVkoXJdMKcLANQ5F7d4mWZPABueNuKg==
X-Received: by 2002:a2e:7c15:0:b0:2b6:e105:6174 with SMTP id x21-20020a2e7c15000000b002b6e1056174mr4763472ljc.47.1691346017174;
        Sun, 06 Aug 2023 11:20:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906058400b00992c92af6f4sm4214310ejn.144.2023.08.06.11.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 11:20:16 -0700 (PDT)
Message-ID: <b37098da-4437-ef5b-53ae-a536f550df08@redhat.com>
Date: Sun, 6 Aug 2023 20:20:15 +0200
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
To: Mario Limonciello <mario.limonciello@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <20230806151453.10690-1-hdegoede@redhat.com>
 <130cb2e0-90b4-7d7b-1633-3469c859b30f@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <130cb2e0-90b4-7d7b-1633-3469c859b30f@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mario,

On 8/6/23 19:13, Mario Limonciello wrote:
> On 8/6/23 10:14, Hans de Goede wrote:
>> Commit a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and
>> quirks") is causing keyboard problems for quite a log of AMD based
>> laptop users, leading to many bug reports.
>>
>> Revert this change for now, until we can come up with
>> a better fix for the PS/2 IRQ trigger-type/polarity problems
>> on some x86 laptops.
> 
> Reverting it is going to help a bunch of machines but cause regressions for others.  How do you prioritize which to fix when it comes to a regression?

I understand where you are coming from. But we are dealing with a lot of bug reports from users of recent kernel versions (so not on LTS distros) where things used to work fine. Which is pretty much the definition of a regression.

OTOH the do not override IRQ on Zen behavior has been with us for a while now, so things which are broken by it have been broken for a while and have only started working since 6.4.7.

So to me it is clear that we first need to revert to the old state, so that users for which everything was working fine get back to a working system.

I realize this will unfix some very recently fixed systems, but notice the very recently bit here most users are no in 6.4.7 or .8 yet, so most users will not even have gotten the fixing effect OTOH many users are seeing breakage now.

So IMHO we should first get back to the known bad state, instead of introducing a new unknown bad state like a9c4a912b7dc did.

If there are known systems which will need an override with a9c4a912b7dc reverted, then we should probably add those to the override table right away.

And I think what we also need is a way to specify an IRQ trigger-type override for IRQ 1 on the kernel commandline, so that we can easily ask users to try a different trigger-type without them needing to build a kernel with an updated quirk table.

As Linus mentioned already, we really need to find a proper fix for this, but for now my main priority is to stop the influx of new Fedora bugzilla and bugzilla.kernel.org bugs caused by a9c4a912b7dc, counting the extra bug links added in this thread it seems we are up to 6 known bug reports for this and that likely is just the tip of the iceberg.

Regards,

Hans



> 
>>
>> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229165
>> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229317
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217726
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/acpi/resource.c | 60 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
>> index 1dd8d5aebf67..0800a9d77558 100644
>> --- a/drivers/acpi/resource.c
>> +++ b/drivers/acpi/resource.c
>> @@ -470,6 +470,52 @@ static const struct dmi_system_id asus_laptop[] = {
>>       { }
>>   };
>>   +static const struct dmi_system_id lenovo_laptop[] = {
>> +    {
>> +        .ident = "LENOVO IdeaPad Flex 5 14ALC7",
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "82R9"),
>> +        },
>> +    },
>> +    {
>> +        .ident = "LENOVO IdeaPad Flex 5 16ALC7",
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "82RA"),
>> +        },
>> +    },
>> +    { }
>> +};
>> +
>> +static const struct dmi_system_id tongfang_gm_rg[] = {
>> +    {
>> +        .ident = "TongFang GMxRGxx/XMG CORE 15 (M22)/TUXEDO Stellaris 15 Gen4 AMD",
>> +        .matches = {
>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>> +        },
>> +    },
>> +    { }
>> +};
>> +
>> +static const struct dmi_system_id maingear_laptop[] = {
>> +    {
>> +        .ident = "MAINGEAR Vector Pro 2 15",
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "Micro Electronics Inc"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "MG-VCP2-15A3070T"),
>> +        }
>> +    },
>> +    {
>> +        .ident = "MAINGEAR Vector Pro 2 17",
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "Micro Electronics Inc"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "MG-VCP2-17A3070T"),
>> +        },
>> +    },
>> +    { }
>> +};
>> +
>>   static const struct dmi_system_id lg_laptop[] = {
>>       {
>>           .ident = "LG Electronics 17U70P",
>> @@ -493,6 +539,10 @@ struct irq_override_cmp {
>>   static const struct irq_override_cmp override_table[] = {
>>       { medion_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
>>       { asus_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
>> +    { lenovo_laptop, 6, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, true },
>> +    { lenovo_laptop, 10, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, true },
>> +    { tongfang_gm_rg, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
>> +    { maingear_laptop, 1, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW, 1, true },
>>       { lg_laptop, 1, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_LOW, 0, false },
>>   };
>>   @@ -512,6 +562,16 @@ static bool acpi_dev_irq_override(u32 gsi, u8 triggering, u8 polarity,
>>               return entry->override;
>>       }
>>   +#ifdef CONFIG_X86
>> +    /*
>> +     * IRQ override isn't needed on modern AMD Zen systems and
>> +     * this override breaks active low IRQs on AMD Ryzen 6000 and
>> +     * newer systems. Skip it.
>> +     */
>> +    if (boot_cpu_has(X86_FEATURE_ZEN))
>> +        return false;
>> +#endif
>> +
>>       return true;
>>   }
>>   
> 

