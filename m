Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEFA290A
	for <regressions@lists.linux.dev>; Tue, 10 Jan 2023 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673339990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHSPs1cSPAFbWqCcr2ybPKTdxXZvdSwNJFvev212ndg=;
	b=PCYcghGNJa4orzyEjNioBiqVtf61kGJDhNypK9o8xGi51pwOVzJ90qYR7vF4CiD4PnVVaY
	QtThbowX/4oVLYW+rsSnybrRGEdhmbvfUmPvIWULSn/jwYABBZYWhVA0QJRjmSPz6RUvZ4
	x0LUMvdOoArecx8SffvsQpLqYTw5+88=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-AZ_hBQdENw6f9y2VcflGAA-1; Tue, 10 Jan 2023 03:39:49 -0500
X-MC-Unique: AZ_hBQdENw6f9y2VcflGAA-1
Received: by mail-ej1-f70.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso7232191ejb.14
        for <regressions@lists.linux.dev>; Tue, 10 Jan 2023 00:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHSPs1cSPAFbWqCcr2ybPKTdxXZvdSwNJFvev212ndg=;
        b=2EcG5n5a40JYX+5C6KTXhihiqNarcEfp1ZwrVZr4xy727ByYHMug+ILJtRuxtPs9YG
         PK/t/WNSD/muULZ6Dpb3lXLy9ModRe9eqsSe9ybMubIlcfg5d8uX3ybspIwTTQiwoknS
         wZXXsquP7VzDlY60TyQ0x0hti1BRHLnU9CAOQPeEZW1pOJZibo+OsepRq4FM+VYLINqw
         UnxtersLdLVXlHw7WkzqtvTy4kckeI+W5BQhkQ3G0oBIXSv3qmaSzm7orNEok46HsfKk
         DNdxBgFmVgdmfKEaCFAbKaHIqeMfKzwr1+SrY6kPah4V8u66hRysr3A0E0VX/LDepWv/
         bzAA==
X-Gm-Message-State: AFqh2kpz6EpJtE/Kp2dMNImnpdfF263oMV3KYKkNWtTk3xusxGkAN4cv
	23RLZUzFX73mVZgHCypuI7kq62lrSbBdhZXTr3erRm/nPl+llci8N+avP54AWjaJlXAJjRReZ+G
	pE7exK91vaLccxAkmPM+6Mro=
X-Received: by 2002:a17:907:d389:b0:7c1:5a37:825 with SMTP id vh9-20020a170907d38900b007c15a370825mr74185169ejc.34.1673339988279;
        Tue, 10 Jan 2023 00:39:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvD+5IMlO7ICzAR7pEhbs8Hp9gut5Ih9Gco155pmvT7xobV905DqgJ7QI5KEN1Gf5CKH91o5g==
X-Received: by 2002:a17:907:d389:b0:7c1:5a37:825 with SMTP id vh9-20020a170907d38900b007c15a370825mr74185157ejc.34.1673339988031;
        Tue, 10 Jan 2023 00:39:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709061f1600b0081bfc79beaesm4663218ejj.75.2023.01.10.00.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:39:47 -0800 (PST)
Message-ID: <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
Date: Tue, 10 Jan 2023 09:39:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Youssef Aly <youssefaswad@gmail.com>, Daniel Dadap <ddadap@nvidia.com>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/10/23 02:07, Youssef Aly wrote:
> Hello,
> 
> Just reporting back, building with the patch fixed the issue.

I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
the kernel commandline for the patched kernel, right ?

If you have time, can you please also check the other BIOS
(hybrid / discrete / ...) modes in the BIOS?

Based on the previous bug report, I would expect you to need
to pass "acpi_backlight=native" in at least some of the other
modes ...

Regards,

Hans



> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
>>
>> Hello Hans,
>>
>> Ok, I'll try building with the patch you provided, and report back.
>>
>> Thanks,
>>
>> Youssef
>>
>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi Youssef,
>>>
>>> On 1/9/23 17:18, Youssef Aly wrote:
>>>> Hello,
>>>>
>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
>>>> is always at full brightness, this is only the case in hybrid (mux)
>>>> graphics mode.
>>>>
>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
>>>> nvidia_wmi_ec_backlight    16384  0
>>>> video                  61440  5
>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
>>>> wmi                    36864  7
>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
>>>>
>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
>>>> present which is not functional
>>>> contents of /sys/class/backlight
>>>> total 0
>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>
>>>> this is the content on 6.0.12
>>>> total 0
>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
>>>>
>>>> Distro: Endeavour OS
>>>> Kernel: 6.1.4-arch1-1
>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
>>>>
>>>> #regzbot introduced v6.1..v6.1.4
>>>
>>> Hmm, this is likely caused by:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
>>>
>>> Which was added because according to the reporter on their G15 5515
>>> backlight control only works in native mode ...
>>>
>>> I'm getting the feeling that we need to detect the BIOS setting
>>> and use a different backlight device depending on the setting...
>>>
>>> Daniel, any ideas?
>>>
>>> For now can you try building a kernel with the attached patch
>>> (which I've also just submitted upstream) and with:
>>>
>>> acpi_backlight=nvidia_wmi_ec
>>>
>>> added to your kernel commandline. That should work around this
>>> for now...
>>>
>>> Regards,
>>>
>>> Hans
> 

