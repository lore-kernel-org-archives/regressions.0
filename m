Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C57481
	for <regressions@lists.linux.dev>; Tue, 10 Jan 2023 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673364480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tz1ODqtO/pyjNIGyJ5IXgKVn1n2OvObUhEhg2Owq9aQ=;
	b=Rq3F80Ff54kc8IbQu6ajET1A39wJYjZN4N0Qhp/DesgiSSXsaa+dMJ51JieNLhKh4xks5B
	+KKcHZYCz4bRZu1PJdl/PRRFIS5ie67ABJOp9wVpXTxzUGFUWwKW4A3XTFec1k6ogUVDrz
	QlE57cMu3HvEYUI8hQbgN/aB7FtDSWQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-184-lQJ8lV4KMu2Z6fITPm4zoQ-1; Tue, 10 Jan 2023 10:27:59 -0500
X-MC-Unique: lQJ8lV4KMu2Z6fITPm4zoQ-1
Received: by mail-ej1-f71.google.com with SMTP id qw20-20020a1709066a1400b007c1727f7c55so7941447ejc.2
        for <regressions@lists.linux.dev>; Tue, 10 Jan 2023 07:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz1ODqtO/pyjNIGyJ5IXgKVn1n2OvObUhEhg2Owq9aQ=;
        b=5YmX8kMZAB03ZYBkUcX3eOj2xZzfQI+x/gq7ce1G6rgp7K1BXHx8lAnNHc4leHJaZq
         V5Qa38sMVizDwhKFxdh3JdXblbGNpqaFam1xHpA9ezyL7F/rgI53GB4EF8R4dCpa6mYA
         oKpYTjJIJXKYUtskyt6T4kwqJMrkFmWz0YQb91FHKFFDYQ3vodDGgGSi6wn15R/imrnQ
         iSefNc9DV5gb0JDjyIqIDW6673kaIvpUm5LN9aHL8u5g3ZzXorNO/99TvHNQwRWwT7fo
         ujC7ARc6tpPsNnjPQT5DKpCJ/I8SE1sGK1rhlE7ryHshJyj0pBiTwM2ILBqtPPYwih6H
         rEnQ==
X-Gm-Message-State: AFqh2kocQeFy08T8ubz7617dkeel6dzWr6w02IplBaUwV2v9yo40FU+M
	KMnH7Fz0CTLdklRH2AkPowu3H1mITcKuOQ5eUOQbb/Dz5PHUot8RB1CUdQVRK1uZ/v8tceLs31a
	oqB/PBuu3tu4omLb2uimrGKU=
X-Received: by 2002:a17:907:ca1d:b0:84d:4e77:6453 with SMTP id uk29-20020a170907ca1d00b0084d4e776453mr5408252ejc.38.1673364477834;
        Tue, 10 Jan 2023 07:27:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt72/ydNP6DCYNYO7EuwnIDJpPk85PbAF5KFRNl8asL/zAzchlVIYgLr/XScyEZWtNCnRerYw==
X-Received: by 2002:a17:907:ca1d:b0:84d:4e77:6453 with SMTP id uk29-20020a170907ca1d00b0084d4e776453mr5408239ejc.38.1673364477590;
        Tue, 10 Jan 2023 07:27:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g9-20020a17090604c900b0085ca279966esm83546eja.119.2023.01.10.07.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 07:27:57 -0800 (PST)
Message-ID: <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
Date: Tue, 10 Jan 2023 16:27:56 +0100
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
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/10/23 16:19, Youssef Aly wrote:
> Hi Hans,
> 
> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> the kernel commandline for the patched kernel, it doesn't work without it.
> 
> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> the modes with "acpi_backlight=nvidia_wmi_ec" and
> "acpi_backlight=native" using the patched kernel (v6.1.4):
> 
> Hybrid:
> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> amdgpu_bl1.
> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> 
> Discrete:
> "acpi_backlight=native": Works but when brightness from 0-10 is the
> same as 0-100, for example 10 is full brightness like 100, 8 is the
> same as 80, etc... ,
> /sys/class/backlight contains nvidia_0.
> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> contains nvidia_wmi_ec_backlight.

Thank you for testing!

Ok so it seems there are 2 issues at play here:

1. Depending on the BIOS setting we need to use either native (discrete mode)
   or nvidia_wmi_ec (hybrid mode)

2. There is a bug in the nvidia binary drivers backlight control in native
   mode on this system causing the range to be wrong

Daniel, we really need help from NVidia with fixing 1. can you see if
there is a way to check the BIOS setting/mode from inside the kernel ?

Regards,

Hans

p.s.

Youssef, for your next email please use reply to all. You keep dropping
Daniel and the regressions-list from the To/Cc, using reply-to-all should
keep these in the To/Cc.




> On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/10/23 02:07, Youssef Aly wrote:
>>> Hello,
>>>
>>> Just reporting back, building with the patch fixed the issue.
>>
>> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
>> the kernel commandline for the patched kernel, right ?
>>
>> If you have time, can you please also check the other BIOS
>> (hybrid / discrete / ...) modes in the BIOS?
>>
>> Based on the previous bug report, I would expect you to need
>> to pass "acpi_backlight=native" in at least some of the other
>> modes ...
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
>>>>
>>>> Hello Hans,
>>>>
>>>> Ok, I'll try building with the patch you provided, and report back.
>>>>
>>>> Thanks,
>>>>
>>>> Youssef
>>>>
>>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Hi Youssef,
>>>>>
>>>>> On 1/9/23 17:18, Youssef Aly wrote:
>>>>>> Hello,
>>>>>>
>>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
>>>>>> is always at full brightness, this is only the case in hybrid (mux)
>>>>>> graphics mode.
>>>>>>
>>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
>>>>>> nvidia_wmi_ec_backlight    16384  0
>>>>>> video                  61440  5
>>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
>>>>>> wmi                    36864  7
>>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
>>>>>>
>>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
>>>>>> present which is not functional
>>>>>> contents of /sys/class/backlight
>>>>>> total 0
>>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>
>>>>>> this is the content on 6.0.12
>>>>>> total 0
>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
>>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
>>>>>>
>>>>>> Distro: Endeavour OS
>>>>>> Kernel: 6.1.4-arch1-1
>>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
>>>>>>
>>>>>> #regzbot introduced v6.1..v6.1.4
>>>>>
>>>>> Hmm, this is likely caused by:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
>>>>>
>>>>> Which was added because according to the reporter on their G15 5515
>>>>> backlight control only works in native mode ...
>>>>>
>>>>> I'm getting the feeling that we need to detect the BIOS setting
>>>>> and use a different backlight device depending on the setting...
>>>>>
>>>>> Daniel, any ideas?
>>>>>
>>>>> For now can you try building a kernel with the attached patch
>>>>> (which I've also just submitted upstream) and with:
>>>>>
>>>>> acpi_backlight=nvidia_wmi_ec
>>>>>
>>>>> added to your kernel commandline. That should work around this
>>>>> for now...
>>>>>
>>>>> Regards,
>>>>>
>>>>> Hans
>>>
>>
> 

