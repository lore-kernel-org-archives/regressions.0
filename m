Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABAB3FFB
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693409847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYwaBfh6sscVjiErhjaJgNSKOVZZxtHF3M2zAzhYOOw=;
	b=bk7z8t6In56+bGuFVkLeT2zMm2+cvywUg+rkU1sw/Ej4zpHJO3Agjy8OWr8qkcBWGcrQ94
	lA+MNDEs6c1M+u4x2PqbbZmJWbU1q1J/Nl+c2Xg0ukJ+z4AaGSkOq8gVTzdwQnF6/vGu7f
	pQV7YzVl9xiQBU5U6NSs7tHMU+z7Ttg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-EMrJ4MZ7PVyqKPJrhcJB-A-1; Wed, 30 Aug 2023 11:37:25 -0400
X-MC-Unique: EMrJ4MZ7PVyqKPJrhcJB-A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99df23d6926so417045766b.0
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 08:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693409844; x=1694014644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYwaBfh6sscVjiErhjaJgNSKOVZZxtHF3M2zAzhYOOw=;
        b=jXZ/Zu6igw1zbVCF7qfxMIWUVhrMYx6STbFY3crxgBJJfAVAaTb7ufG5KT7XbTC4dr
         c9Tpv7DSj+NfbPCRayfQzEV/MSA1dXUkHdv6H8XideH/OEN4PoMVx3jbB+NbB5d9siNa
         zVxaRTGGQi69qgKrh37YsUgg8wlADIKCt05GCaZ15nwEl+5ELga1SQAsZO1XrN758Akw
         AQTWyYpMKqLTDtB/62+Iwf/yue3qByK6LE0cRJ/JF3q02mWUHEOzITgwUMIHL8IRhuh4
         OIzXZxxugK6lbv+HsIK+cKCT1CbGBEDlxCOPqXvlrjW3AS4LxBpVJSq47AekWodB+gdY
         sOXg==
X-Gm-Message-State: AOJu0YxgyQu8L67UghVn16/ClMNhQrsVFrU3+qLWQjImw2fL2RqM/yy1
	ofMjvWH+pfb5lZPJGcnKh7mD3rjOSMLTzz3xr4n2pxbxfKq18JvaLBivvYnIBok6lsoys3uL/48
	yjpHr3s5sjaFvtl4dsxjDWQs=
X-Received: by 2002:a17:906:3015:b0:9a2:256a:65cd with SMTP id 21-20020a170906301500b009a2256a65cdmr1927899ejz.4.1693409843784;
        Wed, 30 Aug 2023 08:37:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9cnAwvraUnaJMwV3BLLN/i+/KDdw+7I7E1kIl3M59eUSFKr9WPGS1l2wZxe7D1GJv4GZ/Bg==
X-Received: by 2002:a17:906:3015:b0:9a2:256a:65cd with SMTP id 21-20020a170906301500b009a2256a65cdmr1927884ejz.4.1693409843446;
        Wed, 30 Aug 2023 08:37:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm7275283ejv.118.2023.08.30.08.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 08:37:22 -0700 (PDT)
Message-ID: <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
Date: Wed, 30 Aug 2023 17:37:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To: Mario Limonciello <mario.limonciello@amd.com>, linus.walleij@linaro.org
Cc: Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, lucapgl2001@gmail.com
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com>
 <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/29/23 23:37, Mario Limonciello wrote:
> On 8/29/2023 14:54, Hans de Goede wrote:
>> Hi Mario,
>>
>> On 8/29/23 18:56, Mario Limonciello wrote:
>>> Lenovo ideapad 5 doesn't use interrupts for GPIO 0, and so internally
>>> debouncing with WinBlue debounce behavior means that the GPIO doesn't
>>> clear until a separate GPIO is used (such as touchpad).
>>>
>>> Prefer to use legacy debouncing to avoid problems.
>>>
>>> Reported-by: Luca Pigliacampo <lucapgl2001@gmail.com>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217833
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> I'm not happy to see yet another DMI quirk solution here.
>>
>> and I guess you're not happy with this either...
> 
> Yeah I was really hoping the first patch was enough for the issue.
> 
> If we can't come up with anything else we can potentially drop patches 2 and 3. Even patch 1 alone will "significantly" improve the situation.
> 
> The other option I considered is to hardcode WinBlue debounce behavior "off" in Linux.
> 
> I don't think this is a good idea though though because we will likely trade bugs because the debounce values in the AML for systems using _AEI aren't actually used in Windows and might not have good values.

What if we turn off the WinBlue debounce behavior for GPIO0 and then just hardcode some sane debounce values for it, overriding whatever the DSDT _AEI entries contain ?

>> Are we sure there is no other way? Did you check an acpidump
>> for the laptop and specifically for its ACPI powerbutton handling?
> 
> I'm not sure there is another way or not, but yes there is an acpidump attached to the bug in case you or anyone else has some ideas.
> 
>>
>> I would expect the ACPI powerbutton handler to somehow clear
>> the bit, like how patch 1/3 clears it from the GPIO chip's
>> own IRQ handler.
>>
>> I see that drivers/acpi/button.c does:
>>
>> static u32 acpi_button_event(void *data)
>> {
>>          acpi_os_execute(OSL_NOTIFY_HANDLER, acpi_button_notify_run, data);
>>          return ACPI_INTERRUPT_HANDLED;
>> }
>>
>> So unless I'm misreading something here, there is some AML being
>> executed on power-button events. So maybe there is something wrong
>> with how Linux interprets that AML ?
>>
> The relevant ACPI spec section is here:
> 
> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/04_ACPI_Hardware_Specification/ACPI_Hardware_Specification.html#control-method-power-button
> 
> I did look at the acpidump.  GPE 08 notifies \_SB.PWRB (a PNP0C0C device) with 0x2.  According to the spec this is specifically for letting the system know the power button is waking up the system from G1.

Sorry, the acpi_os_execute() function name gave me the impression that this would actually call some ACPI defined function, since normally in acpi speak execute refers to an ACPI table defined method.

But that is not the case here it is just a wrapper to deferred-exec the passed in function pointer.

To be clear I was hoping that there was an ACPI defined (AML code) function which would maybe clear the GPIO for us and that that was maybe not working due to e.g. some opregion not being implemented by Linux. But no AML code is being executed at all, so this is all a red herring.

Regards,

Hans


