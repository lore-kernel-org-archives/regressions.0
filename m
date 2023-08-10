Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58611E537
	for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691658467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvsQTU+s0yg5fJsIHyPTwlq37yneMxzeYu4hOdW9o58=;
	b=XZTa/JiW79FJ7u8IFVi6XBng/zRz/hqgh1xkkHb/FNqlObQSHwzhPwiTaM6xDurPcujuRC
	3kRnI1f0lxVtoAA6Qr26rpueOqB3JPWubsC+8XG7UTbnxxrlFlH8nRVw6Pubhb5uHGxIHa
	+5jK125noIRc9iUNK5gKB/+wG/MGMKw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-zLC_FJ6QN0aNs3JM4H8dvQ-1; Thu, 10 Aug 2023 05:07:46 -0400
X-MC-Unique: zLC_FJ6QN0aNs3JM4H8dvQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fe08e088d5so568496e87.2
        for <regressions@lists.linux.dev>; Thu, 10 Aug 2023 02:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691658464; x=1692263264;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvsQTU+s0yg5fJsIHyPTwlq37yneMxzeYu4hOdW9o58=;
        b=ZGHeVxyy+piuQnlEGvtMj4UYl4Bvg78mGUXZG8BbJIsIHKbMk6T8J8ZgjtWrDgUSt1
         Crp6n/9TGQgouFQyw52H/WBxbFl+5uw6HPJwoiyy3tesiwJZv1MmZ3KQs4WOk2d4xvcF
         yoFJ9VpNWNj3ZgwKLtcIzjisCCjzJGP1HLx6s/rzEB6umhcgAucpi3KI9o/A5wLPhvgC
         a9b4FZvsWNcM5coLcddsaRux6UXjtNh7fmmjLa0wKiMqkjavCmHywHsKzvDzNKP7O40A
         Yg8tWYR4EgTLRMmRlr5Lu9SK57OE0U08pQt5crNOCTAcXQB6EX6foMD6NDHlO0i43XvM
         0aMg==
X-Gm-Message-State: AOJu0YxHlUpUDFEO/eXN9EJw9wan1idvuHxlAyBzxePJP6t4DXKEeA/y
	ieJVs6meqN14o8tA0csoVkV/4kIdTYUUdz7xQP+LvvbfgSutbam58zKfPfs/vgToFnSOEW3f7cr
	x4WSlUMrzlOO9HZckVdnhEPazUDOellI=
X-Received: by 2002:a05:6512:224c:b0:4fe:167e:9f04 with SMTP id i12-20020a056512224c00b004fe167e9f04mr1495941lfu.61.1691658464351;
        Thu, 10 Aug 2023 02:07:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMz5tsMomC2dZDvww3SHQAA28ffSlWI+EH25V7an7RGKZkIiAxT7W0QM3DOYw3FQxvUfceCA==
X-Received: by 2002:a05:6512:224c:b0:4fe:167e:9f04 with SMTP id i12-20020a056512224c00b004fe167e9f04mr1495918lfu.61.1691658463972;
        Thu, 10 Aug 2023 02:07:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u25-20020ac243d9000000b004fb8a2b9485sm204964lfl.248.2023.08.10.02.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 02:07:43 -0700 (PDT)
Message-ID: <666f794b-89fe-6aff-463e-2a150fd0712e@redhat.com>
Date: Thu, 10 Aug 2023 11:07:42 +0200
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
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: August Wikerfors <git@augustwikerfors.se>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org, linux-acpi@vger.kernel.org, x86@kernel.org
References: <20230809085526.84913-1-hdegoede@redhat.com>
 <20230809085526.84913-4-hdegoede@redhat.com>
 <6a6fa2ba-c07d-45b2-96c5-b0f44f5f288b@augustwikerfors.se>
 <c3684f00-27bd-d4dd-93dd-18936c006de9@redhat.com>
 <CAJZ5v0gx_vu_Pip3rkUo_78mNnUbp++hpRfpa-iDaZP9r6_4sw@mail.gmail.com>
 <e0dd9065-6dd8-af33-29a0-ae21f82063a2@redhat.com>
In-Reply-To: <e0dd9065-6dd8-af33-29a0-ae21f82063a2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/9/23 21:41, Hans de Goede wrote:
> Hi,
> 
> On 8/9/23 21:25, Rafael J. Wysocki wrote:
>> On Wed, Aug 9, 2023 at 9:20 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 8/9/23 17:58, August Wikerfors wrote:
>>>> On 2023-08-09 10:55, Hans de Goede wrote:
>>>>> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
>>>>> settings over the MADT settings.
>>>>>
>>>>> This causes the keyboard to malfunction on some laptop models
>>>>> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
>>>>> for IRQ 1.
>>>>>
>>>>> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217394
>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217406
>>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> One of the laptops fixed by a9c4a912b7dc, PCSpecialist Elimina Pro 16 M [1], seems to have no INT_SRC_OVR entry for IRQ 1 [2]:
>>>>
>>>>> [    0.084265] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
>>>>> [    0.084266] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
>>>>
>>>> I'm not sure if it was IRQ 1 that needed to be overridden for that model though, so it may work anyway with patch 2 of this series.
>>>>
>>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=217394#c18
>>>> [2] https://bugzilla.kernel.org/attachment.cgi?id=304338
>>>
>>> Good catch, thanks. So it looks like this one needs a DMI quirk (until we have a better generic solution.
>>>
>>> I'll reach out to the reporter and ask for dmidecode output and prepare a follow-up patch. Still I think
>>> that we should move forward with this series to fix the 6 bugs which are linked to from PAtch 1's
>>> commitmsg and those are likely just the top of the iceberg.
>>
>> You are probably right, but it would be good to get a fix for this
>> ASAP, as I would prefer it to go in along with the series, if
>> possible.
> 
> Agreed I've asked in the bugzilla for dmidecode output for the laptop model in question (I checked  https://linux-hardware.org/ and it does not have this model).
> 
> As soon as I've dmidecode info I'll prepare the follow-up patch as well as a Fedora kernel with the entire series + qurik patch for the reporter to test.

I have just send out the follow up patch with the DMI quirk:

https://lore.kernel.org/linux-acpi/20230810090011.104770-1-hdegoede@redhat.com/

And I have started a Fedora kernel test build with this series + the quirk for the reporter to test:

https://bugzilla.kernel.org/show_bug.cgi?id=217394#c33

Regards,

Hans

