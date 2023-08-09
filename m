Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534519BAB
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691592002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QE78PQ7iVBej15oB5yPppMhS2FGb0gwiYPKV6kLIcTg=;
	b=Lst/9E26VHKP7VdSGH1/6tMkjKXsdxaJ5O0sLVEyLTS3SYixLDMwmin7GAun6Qp0nvb5nl
	NjRhF6/CrfMNai6camsQmFNKDND8kRfHIycyWVc0cpEok21I3WITBItMMThNoTb8P1cUOr
	92RJozs6WEvqFDqu5av17iH13ziiq5U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-hVOT1gocP-imrJpp6vPt-g-1; Wed, 09 Aug 2023 10:40:01 -0400
X-MC-Unique: hVOT1gocP-imrJpp6vPt-g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34e35f57so463750166b.3
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691592000; x=1692196800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QE78PQ7iVBej15oB5yPppMhS2FGb0gwiYPKV6kLIcTg=;
        b=PyLV5IfYtAqwGMRc+gPCwLx9gWsV4C9QEY81NNETKYN3VKpmPfzCdFwWayT2xogUuy
         zloOXHS/NYDCiMeiSNYctntJejjnmz0/wGETXu89w9Ok/o7QuwLKT7vEZNa64v3313Ql
         VL6DPUGk+A/R+nzBrJXf9NrEYK2THrk7naHQ4a5ViO1YiHurNy9pAlot7aHL/vispQ5o
         38nK6UI+AZ5JdDzltJ6nfCgcgRmBMDTToFr4npGTB7cxSz0LeCveZR4cA/hqTyQTuMSL
         hwVMHS+YMDwzRdSm4bGwJbxg8ZDfZoolfNVGBtNOtSa5OFwzHQDpW0QmSAtR1KXyMjJX
         xlsg==
X-Gm-Message-State: AOJu0YyoDNLROuNnG01SLDOX47javJatOPr9FMRpCGzPqnXJcvhru2KH
	yVEFQJXNlc2KRuNTs3Pig3/1vct1sg7xUg2+92UKgEXlkProHlue3Bzx84wdf4aYb+2jaoOZOOd
	wWuNonmQjq+0MkfNPchGDvsF55Zfm/U4=
X-Received: by 2002:a17:906:19b:b0:992:a90a:5d1f with SMTP id 27-20020a170906019b00b00992a90a5d1fmr2538419ejb.68.1691591999924;
        Wed, 09 Aug 2023 07:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxOAkAnR+lsG01THkgi5DLnNo2B4fwxuzOvrIqPnpF+a2p0A5CIujpmCmKQg1GWF9uB6lJCA==
X-Received: by 2002:a17:906:19b:b0:992:a90a:5d1f with SMTP id 27-20020a170906019b00b00992a90a5d1fmr2538402ejb.68.1691591999648;
        Wed, 09 Aug 2023 07:39:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j15-20020a170906430f00b0099b76c3041csm8181983ejm.7.2023.08.09.07.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:39:59 -0700 (PDT)
Message-ID: <3fe197da-c26e-e826-4ea2-c13d2880046d@redhat.com>
Date: Wed, 9 Aug 2023 16:39:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] ACPI: resource: Honor MADT INT_SRC_OVR settings
 for IRQ1 on AMD Zen
To: Jiri Slaby <jirislaby@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>,
 August Wikerfors <git@augustwikerfors.se>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org, linux-acpi@vger.kernel.org, x86@kernel.org
References: <20230809085526.84913-1-hdegoede@redhat.com>
 <20230809085526.84913-4-hdegoede@redhat.com>
 <f133d401-1975-6c85-47c5-f9464d5ef06f@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f133d401-1975-6c85-47c5-f9464d5ef06f@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/9/23 11:20, Jiri Slaby wrote:
> On 09. 08. 23, 10:55, Hans de Goede wrote:
>> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
>> settings over the MADT settings.
>>
>> This causes the keyboard to malfunction on some laptop models
>> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
>> for IRQ 1.
> ...
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ...
>> diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
>> index 21b542a6866c..b88e5e0135ab 100644
>> --- a/arch/x86/kernel/acpi/boot.c
>> +++ b/arch/x86/kernel/acpi/boot.c
>> @@ -52,6 +52,7 @@ int acpi_lapic;
>>   int acpi_ioapic;
>>   int acpi_strict;
>>   int acpi_disable_cmcff;
>> +int acpi_int_src_ovr[NR_IRQS_LEGACY];
> 
> So why not to use bool to make it clear this is not an irq number, but a state?
> 
>>     /* ACPI SCI override configuration */
>>   u8 acpi_sci_flags __initdata;
>> @@ -588,6 +589,9 @@ acpi_parse_int_src_ovr(union acpi_subtable_headers * header,
>>         acpi_table_print_madt_entry(&header->common);
>>   +    if (intsrc->source_irq < NR_IRQS_LEGACY)
>> +        acpi_int_src_ovr[intsrc->source_irq] = 1;
> 
> And "true" here.

Ack that would indeed be better.

Rafael, can you fix this up while merging or do you want a v4 series ?

Regards,

Hans



