Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E8256E
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673441157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WjjFZkzVLd0Ut/5LL58df9JImYtQ7HDPQt8ivxrfN1I=;
	b=K7eI5GFVWnaiSCHPq8yNwMZyqRKi4jNXm+paPpHGRf80iwHEbgacaK6Co9Le0xGIT8L9US
	moXava2zZitX5tsMHC2+3z8pxY2XB4o319Fy5+2Tgr63cdXe+QE2gZ6cHazLKXHXA4EEIB
	4CFy4n84TrIB0mrHB1FJE7ffSgZQFhQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-474DIZRPOfS4SJSYiZx1HA-1; Wed, 11 Jan 2023 07:45:55 -0500
X-MC-Unique: 474DIZRPOfS4SJSYiZx1HA-1
Received: by mail-ej1-f72.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso10134967ejb.5
        for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 04:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjjFZkzVLd0Ut/5LL58df9JImYtQ7HDPQt8ivxrfN1I=;
        b=1efFAqJ3vMjm+30By9iDkO3s0NYyXBTATBQo2TcPRGzSENKLIwh5nkkgzqpLHHwsfU
         oFWn1D474n/IvL+fzZz5LPgnw+sq7oKFIKBkhSdYJHdOVdiKOopZYqcnYsrn8XuNm3+d
         f4dwQ+Supg2biCKGz/Ws70FKrJQPq/SDIjc0eYUoXDhprlj//aaS8zm1EI5QRt+6lPxx
         OIEkIpxQ+CaNLyW8f1fzredt/hxEWDEKi16PO7Zf+11azbQN31gbdYlJ7mt0laQ7LuK7
         pGPWf6QCouZUPtAZAgjTG+Zl4ECVL5y86rwhf5rSo+sysvBGLmR+7tQA9rw8Y4+4KAJ9
         f9gQ==
X-Gm-Message-State: AFqh2krP1Z6LuNEa84lK3raI4FKQJVmIvU53fnturro6vfLmwwqT9j0E
	U9W/U6SEVGexH+sin0T0adPKa1tCFA51PYjW27ZB7D+J8oe6sa3py9cZOmJGMb54QzlfYG8ORHT
	vF7G3VfTLMN+EiMGKvNQVwfA=
X-Received: by 2002:a17:906:1601:b0:85c:d016:7145 with SMTP id m1-20020a170906160100b0085cd0167145mr3097046ejd.62.1673441154511;
        Wed, 11 Jan 2023 04:45:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1TxTjf2ubIz/pCpRx0SGFdI1tcl+I35ILqoSOGMT3F2/jwjG3NwUm30Dybg7387aqR7mI2w==
X-Received: by 2002:a17:906:1601:b0:85c:d016:7145 with SMTP id m1-20020a170906160100b0085cd0167145mr3097031ejd.62.1673441154210;
        Wed, 11 Jan 2023 04:45:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0085bfa1b8daesm1263706eja.83.2023.01.11.04.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 04:45:53 -0800 (PST)
Message-ID: <2bdc1039-0e5c-f0a9-c247-748b03e0cb74@redhat.com>
Date: Wed, 11 Jan 2023 13:45:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Youssef Aly <youssefaswad@gmail.com>
Cc: Daniel Dadap <ddadap@nvidia.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <CAKsK3Ak7sXf2CFoJDA_fV=jPrzqmA5dn3C-CK9o__KNN+rwpYg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKsK3Ak7sXf2CFoJDA_fV=jPrzqmA5dn3C-CK9o__KNN+rwpYg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/23 11:42, Youssef Aly wrote:
> Hello,
> 
> Testing with no "acpi_backlight" in the kernel commandline. Hybrid
> mode works, "nvidia_wmi_ec_backlight" is used. Discrete mode also
> works with the range issue mentioned earlier, "nvidia_0" is used.

Great so without the quirk for you everything works, and from
your lspci output I see you have a GTX 3060:

> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106M
> [GeForce RTX 3060 Mobile / Max-Q] [10de:2560] (rev a1)

I suspect that the reporter for who the quirk was added has a 3050
and that to fix this we need to ignore nvidia-wmi-ec support
on laptops with a 3050.

I'm waiting for the report for who the quirk was added to provide
lspci output on their laptop. I'll report the results of that
once I have them.

Daniel, 2 questions:

1. Can you confirm that nvidia-wmi-ec should not be used with
the 3050 (mobile) GPU generation ?

2. Any nice and clean ideas for checking for the presence
of a 3050 for the drivers/acpi/video_detect.c code ?
Note I think it is probably better to check for a 3050 (variant)
then for the newer models since the newer models is going to
be an ever growing list of models.

Regards,

Hans







> On Wed, 11 Jan 2023 at 11:52, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 1/11/23 01:40, Daniel Dadap wrote:
>>> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 1/10/23 16:19, Youssef Aly wrote:
>>>>> Hi Hans,
>>>>>
>>>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
>>>>> the kernel commandline for the patched kernel, it doesn't work without it.
>>>>>
>>>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
>>>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
>>>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
>>>>>
>>>>> Hybrid:
>>>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
>>>>> amdgpu_bl1.
>>>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
>>>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
>>>>>
>>>>> Discrete:
>>>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
>>>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
>>>>> same as 80, etc... ,
>>>>> /sys/class/backlight contains nvidia_0.
>>>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
>>>>> contains nvidia_wmi_ec_backlight.
>>>>
>>>> Thank you for testing!
>>>>
>>>> Ok so it seems there are 2 issues at play here:
>>>>
>>>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
>>>>    or nvidia_wmi_ec (hybrid mode)
>>>>
>>>> 2. There is a bug in the nvidia binary drivers backlight control in native
>>>>    mode on this system causing the range to be wrong
>>>>
>>>> Daniel, we really need help from NVidia with fixing 1. can you see if
>>>> there is a way to check the BIOS setting/mode from inside the kernel ?
>>>
>>> Yes, the ACPI MXDM method should be able to do this. However, querying
>>> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
>>> determine whether the backlight is supposed to be EC-driven, since there
>>> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
>>> be orthogonal to whether or not the EC driver should be used. It sounds
>>> like the BIOS is possibly reporting a wrong value for that query.
>>>
>>> I guess we could wire up a quirk that checks MXDM and overrides the
>>> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
>>> mux operation mode. Then that quirk could be applied to this system.
>>> I can put together a patch for that.
>>
>> If you can write a patch for this that would be great, thank you,
>> but I think we first need to root-cause this better:
>>
>> Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
>> to always use the native backlight. So I've gone back to the original email
>> thread which lead to me adding that quirk.
>>
>> We (I forwarded a mail from you to the reporter this was not on the list)
>> did ask to test with different BIOS settings their to and the reporter's
>> reply was:
>>
>> "Daniel wanted me to check different GPU modes, but my BIOS has no options
>> for GPU. It's always in hybrid mode with PRIME render offload."
>>
>> And perhaps even more interesting in their case with acpi_backlight=native
>> to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
>> in Youssef's case when running in discrete mode there is an nvidia backlight
>> device and in Youssef's case the amdgpu_bl# device never works.
>>
>> The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
>>
>> While the dGPU can be one of:
>> NVIDIA GeForce RTX 3060
>> NVIDIA GeForce GTX 3050 Ti
>> NVIDIA GeForce GTX 3050
>>
>> I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
>> be relevant to the model with the 3060 and that nvidia-wmi-ec should
>> maybe not load at all on the model with the 3050 versions.
>>
>> Maybe the Windows Nvidia drivers only even try to use the WMI EC
>> interface with certain generations of GPUs ?
>>
>> Daniel might that be what is going on here ?
>>
>>
>> Youssef, can you try/test 2 things for us please? :
>>
>> 1. Provide the output of running "lspci -nn"
>>
>> 2. Try a kernel with the attached patch (can be applied on top
>>    of the previous patch). This removes the quirk, so that we
>>    can let the nvidia_wmi_ec auto-detect code do its thing,
>>    because maybe it does work on your model G15 5515.
>>    When testing this you should *not* have any acpi_backlight=xxx
>>    argument on your kernel commandline.
>>
>>> As for the native range bug, that does sound like a scaling issue. I'll
>>> take a look at how the NVIDIA driver determines the range of possible
>>> backlight values and see if Ican find an obvious way that might fail on
>>> a particular system.
>>
>> Ok.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>>> On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 1/10/23 02:07, Youssef Aly wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> Just reporting back, building with the patch fixed the issue.
>>>>>>
>>>>>> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
>>>>>> the kernel commandline for the patched kernel, right ?
>>>>>>
>>>>>> If you have time, can you please also check the other BIOS
>>>>>> (hybrid / discrete / ...) modes in the BIOS?
>>>>>>
>>>>>> Based on the previous bug report, I would expect you to need
>>>>>> to pass "acpi_backlight=native" in at least some of the other
>>>>>> modes ...
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Hans
>>>>>>
>>>>>>
>>>>>>
>>>>>>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
>>>>>>>>
>>>>>>>> Hello Hans,
>>>>>>>>
>>>>>>>> Ok, I'll try building with the patch you provided, and report back.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Youssef
>>>>>>>>
>>>>>>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Youssef,
>>>>>>>>>
>>>>>>>>> On 1/9/23 17:18, Youssef Aly wrote:
>>>>>>>>>> Hello,
>>>>>>>>>>
>>>>>>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
>>>>>>>>>> is always at full brightness, this is only the case in hybrid (mux)
>>>>>>>>>> graphics mode.
>>>>>>>>>>
>>>>>>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
>>>>>>>>>> nvidia_wmi_ec_backlight    16384  0
>>>>>>>>>> video                  61440  5
>>>>>>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
>>>>>>>>>> wmi                    36864  7
>>>>>>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
>>>>>>>>>>
>>>>>>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
>>>>>>>>>> present which is not functional
>>>>>>>>>> contents of /sys/class/backlight
>>>>>>>>>> total 0
>>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
>>>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>>>>>
>>>>>>>>>> this is the content on 6.0.12
>>>>>>>>>> total 0
>>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
>>>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
>>>>>>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
>>>>>>>>>>
>>>>>>>>>> Distro: Endeavour OS
>>>>>>>>>> Kernel: 6.1.4-arch1-1
>>>>>>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
>>>>>>>>>>
>>>>>>>>>> #regzbot introduced v6.1..v6.1.4
>>>>>>>>>
>>>>>>>>> Hmm, this is likely caused by:
>>>>>>>>>
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
>>>>>>>>>
>>>>>>>>> Which was added because according to the reporter on their G15 5515
>>>>>>>>> backlight control only works in native mode ...
>>>>>>>>>
>>>>>>>>> I'm getting the feeling that we need to detect the BIOS setting
>>>>>>>>> and use a different backlight device depending on the setting...
>>>>>>>>>
>>>>>>>>> Daniel, any ideas?
>>>>>>>>>
>>>>>>>>> For now can you try building a kernel with the attached patch
>>>>>>>>> (which I've also just submitted upstream) and with:
>>>>>>>>>
>>>>>>>>> acpi_backlight=nvidia_wmi_ec
>>>>>>>>>
>>>>>>>>> added to your kernel commandline. That should work around this
>>>>>>>>> for now...
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>>
>>>>>>>>> Hans
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
> 

