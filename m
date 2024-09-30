Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70AA18E36E
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698809; cv=none; b=pM+0+nmqgcESCaoZHpak2N67w1fG3eYCBlRj81u7LR8vj5qjoqTntsmM49zwrxzlaz/SrwtLMGcVsLr7f2Jjc1HhEB3eRDJLypjPnXQNjr67IBJv/tcYp6l9QR5yB45xHjFCj+skRACgLlXHtenzDmSgFWZPigfSoGaqX2poHbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698809; c=relaxed/simple;
	bh=upziftDjOtjXCBeAhaL5D4joMGVDcSN71me9Unpd7/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tw48BwDb9pIVbR56vmCNWDbVSXGPD2jLKmyxWISHdT4Y7XmVWh6l5cPNWhVfgJ/A3oncxerLX/R3H8MX5hFXPhpzLzFnM/qS3lOovARIDP8CUbCjT1PJeqfyiThKnj6TlgspQZnN08V64ImuoDF4aCCflnxKBrJEh6hqNHYIH30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OrJgl5QK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OrJgl5QK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727698806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lV21n5TptWSBXsW0gI1flFcpJS2ZQipun79Pi6sYOpE=;
	b=OrJgl5QKB3IHpj8wtcfzjNtPQFOnVyadH7M9E/aUdl8ZsBZcamCKN+NHbpyhNHMuydZv1S
	rQQDP8Zs2AqEZKrftYF/LOhpNhEzKqjkvW5PJXHZxl94DyHvw3A8l20n1l2WxADzZERSjl
	YgBB4tfdv/4xY5b2kZ6Pgs3cAdeh1P4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-rjj-W4ESMxOKhWsa_ro0ZQ-1; Mon, 30 Sep 2024 08:20:05 -0400
X-MC-Unique: rjj-W4ESMxOKhWsa_ro0ZQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8a8ee13b44so52462266b.2
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 05:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727698804; x=1728303604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lV21n5TptWSBXsW0gI1flFcpJS2ZQipun79Pi6sYOpE=;
        b=FZQG9tGDvtgef7r5AaOhiVqVl/O2MkcjAPE7UOYqzLoqGhgmKdHtky1OPdDB+1h23u
         Fkvc3NiGw+BvlZi7RMh1jWlyaYt/Pw4a5SaM+GWBQJ50CsZYsXfkpjFrxRxHCUP/C/ky
         LLRUeG+q7s7pZfIGbZaJUXrOdDH5jHMd6/TDyiee3l+YJkSCmkzqwmvCzpNPONwVGLrc
         t6Uea4gvuB6oIUxdS0uCu3n951Mu9LlDwuLDwlFl8ULAOUJgBfA7S2pSX5h58OD29zXp
         BUlAG/PMjOIiaw5s6ZvxMIkirjg14P7R6FZ1o9NaZVcc1Cj9UCafy5he2d5tfRI9kews
         D8fw==
X-Forwarded-Encrypted: i=1; AJvYcCUw3AhvlSoRc6KV5bi6K9Am5ykJ/IMsZvZNLdyAg7ozO5raFReJ+huS0XZHaiLjAMP4fmWeF9GxbZwxtA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1/fl+ySghnl4vHvq57qC3Kz9YJLRHeJkot53QDO8IvtByKbG
	kXSmIBdaTk3gsOnEBLMjqFOeiGkv+q//OW/BGOt642TQBPwTn5zvrzNMOwQcKgQHBEKQs86SoUG
	+tR4DVXuWqyVHHzSJTbVWXiX90US3psoMU2zJKrjNWEhrp+pN71PkuAthNOYZ
X-Received: by 2002:a17:907:1c0d:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a93c47e0f3emr1236164866b.0.1727698804134;
        Mon, 30 Sep 2024 05:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5r6xV30A0KWFiIupqSWHeAt3c63zQaRuFOMhJBFaAC8u4Gm0Qu/Co+ZdZTbvMsABRPM9dgg==
X-Received: by 2002:a17:907:1c0d:b0:a80:f81c:fd75 with SMTP id a640c23a62f3a-a93c47e0f3emr1236161866b.0.1727698803700;
        Mon, 30 Sep 2024 05:20:03 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2948013sm522911366b.130.2024.09.30.05.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 05:20:03 -0700 (PDT)
Message-ID: <50273312-f158-4afe-b03e-bc6239a549aa@redhat.com>
Date: Mon, 30 Sep 2024 14:20:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ACPI: resource: Loosen the Asus E1404GAB DMI match to
 also cover the E1404GA
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Ben Mayo <benny1091@gmail.com>,
 Tamim Khan <tamim@fusetak.com>, linux-acpi@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
References: <20240927141606.66826-1-hdegoede@redhat.com>
 <20240927141606.66826-2-hdegoede@redhat.com>
 <2f45a6ac-5bb7-4954-adb5-3bf706363062@molgen.mpg.de>
 <d69af7ad-244d-45e8-ad7e-4a3ebf30d04d@redhat.com>
 <CAJZ5v0gxSz-aeoDqhp1dS5g6aoDXSn8ZwYB0TuN7SU2Sbar8ow@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gxSz-aeoDqhp1dS5g6aoDXSn8ZwYB0TuN7SU2Sbar8ow@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 30-Sep-24 2:18 PM, Rafael J. Wysocki wrote:
> On Mon, Sep 30, 2024 at 12:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 30-Sep-24 12:42 PM, Paul Menzel wrote:
>>> Dear Hans,
>>>
>>>
>>> Thank you for your patch.
>>>
>>> Am 27.09.24 um 16:16 schrieb Hans de Goede:
>>>> Like other Asus Vivobooks, the Asus Vivobook Go E1404GA has a DSDT
>>>> describing IRQ 1 as ActiveLow, while the kernel overrides to Edge_High.
>>>>
>>>>      $ sudo dmesg | grep DMI:.*BIOS
>>>>      [    0.000000] DMI: ASUSTeK COMPUTER INC. Vivobook Go E1404GA_E1404GA/E1404GA, BIOS E1404GA.302 08/23/2023
>>>>      $ sudo cp /sys/firmware/acpi/tables/DSDT dsdt.dat
>>>>      $ iasl -d dsdt.dat
>>>>      $ grep -A 30 PS2K dsdt.dsl | grep IRQ -A 1
>>>>                  IRQ (Level, ActiveLow, Exclusive, )
>>>>                      {1}
>>>>
>>>> There already is an entry in the irq1_level_low_skip_override[] DMI match
>>>> table for the "E1404GAB", change this to match on "E1404GA" to cover
>>>> the E1404GA model as well (DMI_MATCH() does a substring match).
>>>
>>> Ah, good to know. Thank you for fixing it.
>>>
>>>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219224
>>>> Cc: Tamim Khan <tamim@fusetak.com>
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Note this patch replaces Paul Menzel's patch which added a new entry
>>>> for the "E1404GA", instead of loosening the "E1404GAB" match:
>>>> https://lore.kernel.org/linux-acpi/20240911081612.3931-1-pmenzel@molgen.mpg.de/
>>>> ---
>>>>   drivers/acpi/resource.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
>>>> index 1ff251fd1901..dfe108e2ccde 100644
>>>> --- a/drivers/acpi/resource.c
>>>> +++ b/drivers/acpi/resource.c
>>>> @@ -504,10 +504,10 @@ static const struct dmi_system_id irq1_level_low_skip_override[] = {
>>>>           },
>>>>       },
>>>>       {
>>>> -        /* Asus Vivobook Go E1404GAB */
>>>> +        /* Asus Vivobook Go E1404GA* */
>>>
>>> I guess people are going to grep for the model, if something does not work, so maybe the known ones should listed. I know it’s not optimal, as the comments are very likely be incomplete, but it’s better than than not having it listed, in my opinion.
>>
>> That is a valid point, OTOH I don't think we want to take patches later just to update
>> the comment if more models show up.
>>
>> I guess we could change the comment to:
>>
>>                 /* Asus Vivobook Go E1404GA / E1404GAB */
>>
>> Rafael any preference from you here ?   (1)
> 
> Not really.

Ok, then my vote goes to keeping this as is. So if you're happy
with this series please merge it as is.

Regards,

Hans


