Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021212B74
	for <regressions@lists.linux.dev>; Wed, 10 May 2023 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683728330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuOUa9KYh5PmE79OUIXU+YKRUs/vGY8xczPXTJ10Qec=;
	b=E19pOdlW4Cp9bAy062FVyzXnNRQdhaaKtCwcKV6+1FkY1C8vEvGZ+bAtQgLYBYCybGRe0W
	QDBiB0wz9dYlgozuN5n9fZdKFY0/iaWj+8O+TXlKnJJoEVvv0B/2lV3lfobYM3PXj9D+ed
	WTxFnZz2AqBauBucc83phPbPzKBv5ZY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-7-3B7LQdMA-d94mhsF7NdQ-1; Wed, 10 May 2023 10:18:49 -0400
X-MC-Unique: 7-3B7LQdMA-d94mhsF7NdQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a34e35f57so708484166b.3
        for <regressions@lists.linux.dev>; Wed, 10 May 2023 07:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683728328; x=1686320328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuOUa9KYh5PmE79OUIXU+YKRUs/vGY8xczPXTJ10Qec=;
        b=ddnpK1YDOnmJIML6frhmH6zO2Dr1mlt8OfDrgd6WIk0UKZnetl6OZfpqgPtoT0Pbd2
         UC2SxA1z3Qlh8RaUg5OMQOra113wEXvMsy/06b7FBahxltABukUyWJNqlSZJUWTS8eef
         vzC8p77wxLASvSH7dSzu/GTKVf9UlXhuDXup9egfRLut5nvFFe3lzrrczqtQLw25svIH
         enajy4l4cJupeGa7MPqtxKQhizfcrpNvdkhYIwVaH+Da3PAiQN82fNaZr40YId94o4Sg
         OxntAbEaLGFsc/hi4X3xF5ZjF8Momx0UHIIYNGIPzbnER5d8Oa8MM3t9kOIgiQ9+jAaA
         86lg==
X-Gm-Message-State: AC+VfDydQy9ZQ72u5WGT7VYf7KqxV9+SoTJO2ig7FBcRSdVQgzcc9JQ0
	nufVaOvjZ+DPUj6mDvg3mX2bEevKq2ckCm6X73e6cJHcU86+qMEZoIKhbvSqKuI7FfctMFSUcjE
	to/WoZMv69SgjLMKxI9XgO60=
X-Received: by 2002:a17:906:7304:b0:921:da99:f39c with SMTP id di4-20020a170906730400b00921da99f39cmr19213514ejc.12.1683728328724;
        Wed, 10 May 2023 07:18:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vHpbiTR7GNjFCfIEAqh1zlSEJZmji3BktutSVamw7Oiyr+82YNobx9E3OjNmbuwL6OHbHVQ==
X-Received: by 2002:a17:906:7304:b0:921:da99:f39c with SMTP id di4-20020a170906730400b00921da99f39cmr19213485ejc.12.1683728328430;
        Wed, 10 May 2023 07:18:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t27-20020a170906269b00b0096616aef7e5sm2804404ejc.149.2023.05.10.07.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 07:18:47 -0700 (PDT)
Message-ID: <ed5b02e3-ded8-1edd-c903-d7a439065c3a@redhat.com>
Date: Wed, 10 May 2023 16:18:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] wifi: brcmfmac: Check for probe() id argument being NULL
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, regressions@lists.linux.dev,
 Felix <nimrod4garoa@gmail.com>, stable@vger.kernel.org
References: <20230510100050.27099-1-hdegoede@redhat.com>
 <7f563b21-4c06-134e-f30d-02ed61521c1f@broadcom.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7f563b21-4c06-134e-f30d-02ed61521c1f@broadcom.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arend,

On 5/10/23 14:12, Arend van Spriel wrote:
> On 5/10/2023 12:00 PM, Hans de Goede wrote:
>> The probe() id argument may be NULL in 2 scenarios:
>>
>> 1. brcmf_pcie_pm_leave_D3() calling brcmf_pcie_probe() to reprobe
>>     the device.
>>
>> 2. If a user tries to manually bind the driver from sysfs then the sdio /
>>     pcie / usb probe() function gets called with NULL as id argument.
>>
>> 1. Is being hit by users causing the following oops on resume and causing
>> wifi to stop working:
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000018
>> <snip>
>> Hardware name: Dell Inc. XPS 13 9350/0PWNCR, BIDS 1.13.0 02/10/2020
>> Workgueue: events_unbound async_run_entry_fn
>> RIP: 0010:brcmf_pcie_probe+Ox16b/0x7a0 [brcmfmac]
>> <snip>
>> Call Trace:
>>   <TASK>
>>   brcmf_pcie_pm_leave_D3+0xc5/8x1a0 [brcmfmac be3b4cefca451e190fa35be8f00db1bbec293887]
>>   ? pci_pm_resume+0x5b/0xf0
>>   ? pci_legacy_resume+0x80/0x80
>>   dpm_run_callback+0x47/0x150
>>   device_resume+0xa2/0x1f0
>>   async_resume+0x1d/0x30
>> <snip>
>>
>> Fix this by checking for id being NULL.
>>
>> In the case of brcmf_pcie_probe() also add a manual lookup of the id
>> when it is NULL so that fwvid will still get set correctly on reprobe
>> on resume.
> 
> Hi Hans,
> 
> Thanks for looking into this and coming up with a fix. Does it make sense to proceed with 
> BRCMF_FWVENDOR_INVALID though. I think it will end up in probe failure in brcmf_fwvid_attach() 
> because of it so why not bail out right away.

You are right since the vendor stuff is in separate modules I thought
the driver would just continue without, but that indeed does not work.

I have just prepared a version 2 which immediately bails from probe()
if id is still null after doing a pci_match_id() / usb_match_id()
to try and lookup the id. Note for the SDIO case v2 will immediately
bail on a NULL id since there is no sdio_match_id() helper.

I'll send out v2 right away.

Regards,

Hans



>> Fixes: da6d9c8ecd00 ("wifi: brcmfmac: add firmware vendor info in driver info")
>> Reported-by: Felix <nimrod4garoa@gmail.com>
>> Link: https://lore.kernel.org/regressions/4ef3f252ff530cbfa336f5a0d80710020fc5cb1e.camel@gmail.com/
>> Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 2 +-
>>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c   | 8 +++++++-
>>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c    | 2 +-
>>   3 files changed, 9 insertions(+), 3 deletions(-)

