Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB624513
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691610072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ldcQW9LZSQnCOkarDxdnYKtVsXTHlqQEYP12HWE3Go=;
	b=Rjk6/zkWlwHd0i3G7jD0EXv96tzUyZwy8akUmuxgYx1kgssSmi1+8imPXvdcAoJly0zfSP
	AKIAYjmzTrMWCGkWfVMt1bF8OcgmpvEsuJydcMaxhv+Uk5o9dxUz8DOF+3n1fqJgs7urL3
	hL190Nd90QsEGGGyRPTq/j0u/UDC81g=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-V_m8CIFsOfayDXzv7bLa6Q-1; Wed, 09 Aug 2023 15:41:10 -0400
X-MC-Unique: V_m8CIFsOfayDXzv7bLa6Q-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b9e8abe539so1927741fa.3
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 12:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691610069; x=1692214869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ldcQW9LZSQnCOkarDxdnYKtVsXTHlqQEYP12HWE3Go=;
        b=XwMEjALj5DccDPO6SFiEJNNfEG1TR8xSNh8vX649JeTZ0VeckZpovDekcXzAyQlz0G
         Lxac2fvLgWK+nluVF0zJsDuwt8Pus1sJN75RmBYN8sVygNlhnxSOY/0DxkmRs0izF+RD
         erNdfsMGLZL/w2ZEN46plh9/QesuYsRmnlXn+Jedkv08TdHvIiyHolzluDRKe4/Vpwvz
         5/Qs+g+moGDJiWa2dqGa/U2ATxMM+4H/OUNtnWTsLVfI+lUGI2OxVZ+AXxkL1jUYFMmi
         3/KNeO12riQn8SADX1TDiCUQgE89LRZF05yOLcvKZzaZGPmeC+kT1H6Bktzy1r6vE57Y
         WKHQ==
X-Gm-Message-State: AOJu0YzvAoUtb5l7KxpE7mcRwTlVBJpbM7iDX0TqIBRJab8pPoRpPuno
	Kf85xM3o5ZBN4eDI0NcGDvF9bUQvWRSnQdfcXXZ+kEsCj6S6W6L9mb/Ne/NKC7oEgmnCcW5H2Cz
	wrouXuTPow16eytwOaAYMYnQ=
X-Received: by 2002:a2e:84d6:0:b0:2b9:a6a1:f20 with SMTP id q22-20020a2e84d6000000b002b9a6a10f20mr116790ljh.42.1691610068978;
        Wed, 09 Aug 2023 12:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKhGcVNXI/xOj0RQWT12121DSgH3gup/E/JQgK5hG1TahqXQggy6jTPzFlInE6TkM8pUzBhQ==
X-Received: by 2002:a2e:84d6:0:b0:2b9:a6a1:f20 with SMTP id q22-20020a2e84d6000000b002b9a6a10f20mr116778ljh.42.1691610068686;
        Wed, 09 Aug 2023 12:41:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j26-20020a170906475a00b009930c80b87csm8507289ejs.142.2023.08.09.12.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:41:08 -0700 (PDT)
Message-ID: <e0dd9065-6dd8-af33-29a0-ae21f82063a2@redhat.com>
Date: Wed, 9 Aug 2023 21:41:07 +0200
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gx_vu_Pip3rkUo_78mNnUbp++hpRfpa-iDaZP9r6_4sw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/9/23 21:25, Rafael J. Wysocki wrote:
> On Wed, Aug 9, 2023 at 9:20 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 8/9/23 17:58, August Wikerfors wrote:
>>> On 2023-08-09 10:55, Hans de Goede wrote:
>>>> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
>>>> settings over the MADT settings.
>>>>
>>>> This causes the keyboard to malfunction on some laptop models
>>>> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
>>>> for IRQ 1.
>>>>
>>>> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217394
>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217406
>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> One of the laptops fixed by a9c4a912b7dc, PCSpecialist Elimina Pro 16 M [1], seems to have no INT_SRC_OVR entry for IRQ 1 [2]:
>>>
>>>> [    0.084265] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
>>>> [    0.084266] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
>>>
>>> I'm not sure if it was IRQ 1 that needed to be overridden for that model though, so it may work anyway with patch 2 of this series.
>>>
>>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=217394#c18
>>> [2] https://bugzilla.kernel.org/attachment.cgi?id=304338
>>
>> Good catch, thanks. So it looks like this one needs a DMI quirk (until we have a better generic solution.
>>
>> I'll reach out to the reporter and ask for dmidecode output and prepare a follow-up patch. Still I think
>> that we should move forward with this series to fix the 6 bugs which are linked to from PAtch 1's
>> commitmsg and those are likely just the top of the iceberg.
> 
> You are probably right, but it would be good to get a fix for this
> ASAP, as I would prefer it to go in along with the series, if
> possible.

Agreed I've asked in the bugzilla for dmidecode output for the laptop model in question (I checked  https://linux-hardware.org/ and it does not have this model).

As soon as I've dmidecode info I'll prepare the follow-up patch as well as a Fedora kernel with the entire series + qurik patch for the reporter to test.

Regards,

Hans


