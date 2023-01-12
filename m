Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1082CA4
	for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673526435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5m9Ode+dtDFjV6HuefAO/zl+Pw931Wna5W2Bc2ubrf4=;
	b=fv/ZP1Fm726ESUge5s/wpMWj6MQMxP9N537/rfiBvdWbE6lGasNEJnj9LBq8UK4IX+A3OQ
	8HqiCauadUO/2oSTieh67g6jjQrcMjcbLj6MPhaBREfPnkObtxRuX5AG8rBFKj5wpJWtgh
	BqPxCvykfwD5xE2vBJRgF6KbBFPBw6Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-lnBhYh3gOXCaL_2R5hwnDA-1; Thu, 12 Jan 2023 07:27:14 -0500
X-MC-Unique: lnBhYh3gOXCaL_2R5hwnDA-1
Received: by mail-ej1-f71.google.com with SMTP id hs18-20020a1709073e9200b007c0f9ac75f9so12471351ejc.9
        for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 04:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5m9Ode+dtDFjV6HuefAO/zl+Pw931Wna5W2Bc2ubrf4=;
        b=a2l/Abh8rmocRHbEw3K/X4fFcy56yVpe4FqDwmtfZ5RJd1qWIk0pm9+YUKzfUx6nbo
         F3UnE5mmAnAYnJw7XXeF1de8u12BACWtcGUI6q0xMaQKqZBALSkV4SEjtJ5E3fAeAF1m
         US76P+NmIDrqOgYnQkkzaoXJYnKWmACGtxTW2YjHlz5aGLt8AwahztnOk70HpQVykZzB
         KfeODWnese0hdopKLtusoSa8JK/HPOTO3EB21p+Fjp3W/4S0XqmH02bon/szyFVd+viK
         SYb/ntJSBBOYhg7SPXh9uKeFYFUB/ivuldZHAgmlFOwUILd8VKD6HmnEYqBzqaHcJUKh
         r1vQ==
X-Gm-Message-State: AFqh2krTaFPR3vTKjUSszEAi7ZQ1iuFI1wPer+wnvvGHqzinjvAjMdOQ
	iUzzTG9NK83DfVxl9hkzoUfeLGPuQLAsb3I2/hL+566ddOzc6E9m1cWFMioIP3/INjDMiy1+X2G
	8d7peKWAd5+SuNIoGmDf3Lqk=
X-Received: by 2002:a17:907:9a85:b0:81b:fc79:be51 with SMTP id km5-20020a1709079a8500b0081bfc79be51mr69509689ejc.50.1673526433320;
        Thu, 12 Jan 2023 04:27:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCcD+9fT7mdSez8Ax6b6cWDBGyqlePaE57YDZauXdwmuZzfTqWDaLcFZ7FMZlTGEnqoLJ8QQ==
X-Received: by 2002:a17:907:9a85:b0:81b:fc79:be51 with SMTP id km5-20020a1709079a8500b0081bfc79be51mr69509675ejc.50.1673526432976;
        Thu, 12 Jan 2023 04:27:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k2-20020a170906970200b0073dbaeb50f6sm7261580ejx.169.2023.01.12.04.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:27:12 -0800 (PST)
Message-ID: <fa250619-8a15-2798-b8c6-d0a292326c10@redhat.com>
Date: Thu, 12 Jan 2023 13:27:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <CAKsK3Ak7sXf2CFoJDA_fV=jPrzqmA5dn3C-CK9o__KNN+rwpYg@mail.gmail.com>
 <2bdc1039-0e5c-f0a9-c247-748b03e0cb74@redhat.com> <Y785lBG/AIdHBB0C@lenny>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y785lBG/AIdHBB0C@lenny>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/23 23:35, Daniel Dadap wrote:
> On Wed, Jan 11, 2023 at 01:45:53PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/11/23 11:42, Youssef Aly wrote:
>>> Hello,
>>>
>>> Testing with no "acpi_backlight" in the kernel commandline. Hybrid
>>> mode works, "nvidia_wmi_ec_backlight" is used. Discrete mode also
>>> works with the range issue mentioned earlier, "nvidia_0" is used.
>>
>> Great so without the quirk for you everything works, and from
>> your lspci output I see you have a GTX 3060:
>>
>>> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106M
>>> [GeForce RTX 3060 Mobile / Max-Q] [10de:2560] (rev a1)
>>
>> I suspect that the reporter for who the quirk was added has a 3050
>> and that to fix this we need to ignore nvidia-wmi-ec support
>> on laptops with a 3050.
>>
>> I'm waiting for the report for who the quirk was added to provide
>> lspci output on their laptop. I'll report the results of that
>> once I have them.
>>
>> Daniel, 2 questions:
>>
>> 1. Can you confirm that nvidia-wmi-ec should not be used with
>> the 3050 (mobile) GPU generation ?
> 
> 3050 and 3060 are both from the same GPU generation.

Ok, so invalidates my theory.

> From what I recall
> about the original reason this quirk was added, there was an apparent
> system firmware bug where the ACPI interface for querying the backlight
> source was reporting that the backlight was EC-controlled even though it
> was actually GPU-controlled.

Correct, iGPU controlled by the AMD APU builtin GPU to be specific.

> AFAIK either the 3050 or the 3060 could be
> configured for either GPU or EC backlight control, so I am not certain
> whether checking to see which particular GPU is present would help.

Ok.

>> 2. Any nice and clean ideas for checking for the presence
>> of a 3050 for the drivers/acpi/video_detect.c code ?
>> Note I think it is probably better to check for a 3050 (variant)
>> then for the newer models since the newer models is going to
>> be an ever growing list of models.
> 
> I'm hoping that the difference between the system that this quirk was
> added for (let's call it quirk-fix) and the system that is broken by
> this quirk (quirk-break) that leads to the quirk being needed on the
> quirk-fix system and anti-needed on the quirk-break system is that the
> two systems are operating in different mux modes. On a dynamic mux
> system, there are up to four possible modes:
> 
> * dGPU-only (iGPU is disabled; mux is fixed on dGPU)
> * iGPU-only (dGPU is disabled; mux is fixed on iGPU)
> * Hybrid (Both iGPU and dGPU are enabled; mux is fixed on iGPU)
> * Dynamic (Both iGPU and dGPU are enabled; mux can be switched)
> 
> IIUC OEMs can choose which of these modes is available on a particular
> system, and whether it can be switched by the user. My hypothesis is
> that the quirk-fix system is operating in either iGPU-only or Hybrid
> mode, either of which is most likely to have iGPU-driven native
> backlight, but is incorrectly reporting that the backlight is under EC
> control. On the quirk-break system, I suspect that the ACPI method is
> correctly reporting EC vs native backlight control when switching
> between the various mux modes, but gets forced by the quirk to native
> backlight control, even though it should be EC-controlled in dynamic
> mode.

It is indeed possible that this is still related to the mux mode.

The reporter of the quirk-fix system did mention that on their
system the mux-mode does not appear to be controllable from
the BIOS. I guess Dell might not have implemented a mux at all
on versions with the lower tier GPU (to save money) which would
explain not having this option in the BIOS.  I wonder if
the BIOS call to detect the mux mode will work correctly then
though ...


> If my hypothesis is correct, then I think to make the quirk work
> properly, we should check the mux mode and only force backlight control
> to native if the system is not runnin in dynamic mode. I think in theory
> it should be technically possible to design a system which is always
> EC-controlled even when the mux is not in dynamic mode, but I in
> practice it is highly unlikely that anybody does that. So it's probably
> best to only apply this check in the quirk for now, rather than
> asserting that EC backlight is supported IFF the mux is in dynamic mode.
> The opposite situation, namely that the brightness is not EC-controlled
> when the mux is in dynamic mode, should be more common: in particular my
> understanding is that EC brightness control doesn't make sense with HDR
> panels, so systems with an HDR panel would need to have brightness
> controlled by the relevant GPU driver's native backlight handler or via
> DP AUX from the relevant GPU.
> 
> Anyway, I guess in addition to a patch to make the quirk more reliable,
> it would be good to have a simple kernel module that can be used to
> query the current mux mode, which would help for troubleshooting. I'll
> get the patch and the module written up and cleared for public release.

Having a little helper module to query the mux mode (or maybe have
video_detect.c log this when the WMI interface is present?) sounds like
it would be good to have, thank you for working on this.

Regards,

Hans



>>> On Wed, 11 Jan 2023 at 11:52, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 1/11/23 01:40, Daniel Dadap wrote:
>>>>> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 1/10/23 16:19, Youssef Aly wrote:
>>>>>>> Hi Hans,
>>>>>>>
>>>>>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
>>>>>>> the kernel commandline for the patched kernel, it doesn't work without it.
>>>>>>>
>>>>>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
>>>>>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
>>>>>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
>>>>>>>
>>>>>>> Hybrid:
>>>>>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
>>>>>>> amdgpu_bl1.
>>>>>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
>>>>>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
>>>>>>>
>>>>>>> Discrete:
>>>>>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
>>>>>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
>>>>>>> same as 80, etc... ,
>>>>>>> /sys/class/backlight contains nvidia_0.
>>>>>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
>>>>>>> contains nvidia_wmi_ec_backlight.
>>>>>>
>>>>>> Thank you for testing!
>>>>>>
>>>>>> Ok so it seems there are 2 issues at play here:
>>>>>>
>>>>>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
>>>>>>    or nvidia_wmi_ec (hybrid mode)
>>>>>>
>>>>>> 2. There is a bug in the nvidia binary drivers backlight control in native
>>>>>>    mode on this system causing the range to be wrong
>>>>>>
>>>>>> Daniel, we really need help from NVidia with fixing 1. can you see if
>>>>>> there is a way to check the BIOS setting/mode from inside the kernel ?
>>>>>
>>>>> Yes, the ACPI MXDM method should be able to do this. However, querying
>>>>> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
>>>>> determine whether the backlight is supposed to be EC-driven, since there
>>>>> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
>>>>> be orthogonal to whether or not the EC driver should be used. It sounds
>>>>> like the BIOS is possibly reporting a wrong value for that query.
>>>>>
>>>>> I guess we could wire up a quirk that checks MXDM and overrides the
>>>>> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
>>>>> mux operation mode. Then that quirk could be applied to this system.
>>>>> I can put together a patch for that.
>>>>
>>>> If you can write a patch for this that would be great, thank you,
>>>> but I think we first need to root-cause this better:
>>>>
>>>> Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
>>>> to always use the native backlight. So I've gone back to the original email
>>>> thread which lead to me adding that quirk.
>>>>
>>>> We (I forwarded a mail from you to the reporter this was not on the list)
>>>> did ask to test with different BIOS settings their to and the reporter's
>>>> reply was:
>>>>
>>>> "Daniel wanted me to check different GPU modes, but my BIOS has no options
>>>> for GPU. It's always in hybrid mode with PRIME render offload."
>>>>
>>>> And perhaps even more interesting in their case with acpi_backlight=native
>>>> to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
>>>> in Youssef's case when running in discrete mode there is an nvidia backlight
>>>> device and in Youssef's case the amdgpu_bl# device never works.
>>>>
>>>> The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
>>>>
>>>> While the dGPU can be one of:
>>>> NVIDIA GeForce RTX 3060
>>>> NVIDIA GeForce GTX 3050 Ti
>>>> NVIDIA GeForce GTX 3050
>>>>
>>>> I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
>>>> be relevant to the model with the 3060 and that nvidia-wmi-ec should
>>>> maybe not load at all on the model with the 3050 versions.
>>>>
>>>> Maybe the Windows Nvidia drivers only even try to use the WMI EC
>>>> interface with certain generations of GPUs ?
>>>>
>>>> Daniel might that be what is going on here ?
>>>>
>>>>
>>>> Youssef, can you try/test 2 things for us please? :
>>>>
>>>> 1. Provide the output of running "lspci -nn"
>>>>
>>>> 2. Try a kernel with the attached patch (can be applied on top
>>>>    of the previous patch). This removes the quirk, so that we
>>>>    can let the nvidia_wmi_ec auto-detect code do its thing,
>>>>    because maybe it does work on your model G15 5515.
>>>>    When testing this you should *not* have any acpi_backlight=xxx
>>>>    argument on your kernel commandline.
>>>>
>>>>> As for the native range bug, that does sound like a scaling issue. I'll
>>>>> take a look at how the NVIDIA driver determines the range of possible
>>>>> backlight values and see if Ican find an obvious way that might fail on
>>>>> a particular system.
>>>>
>>>> Ok.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>>>> On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 1/10/23 02:07, Youssef Aly wrote:
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> Just reporting back, building with the patch fixed the issue.
>>>>>>>>
>>>>>>>> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
>>>>>>>> the kernel commandline for the patched kernel, right ?
>>>>>>>>
>>>>>>>> If you have time, can you please also check the other BIOS
>>>>>>>> (hybrid / discrete / ...) modes in the BIOS?
>>>>>>>>
>>>>>>>> Based on the previous bug report, I would expect you to need
>>>>>>>> to pass "acpi_backlight=native" in at least some of the other
>>>>>>>> modes ...
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>> Hans
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Hello Hans,
>>>>>>>>>>
>>>>>>>>>> Ok, I'll try building with the patch you provided, and report back.
>>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>>
>>>>>>>>>> Youssef
>>>>>>>>>>
>>>>>>>>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> Hi Youssef,
>>>>>>>>>>>
>>>>>>>>>>> On 1/9/23 17:18, Youssef Aly wrote:
>>>>>>>>>>>> Hello,
>>>>>>>>>>>>
>>>>>>>>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
>>>>>>>>>>>> is always at full brightness, this is only the case in hybrid (mux)
>>>>>>>>>>>> graphics mode.
>>>>>>>>>>>>
>>>>>>>>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
>>>>>>>>>>>> nvidia_wmi_ec_backlight    16384  0
>>>>>>>>>>>> video                  61440  5
>>>>>>>>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
>>>>>>>>>>>> wmi                    36864  7
>>>>>>>>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
>>>>>>>>>>>>
>>>>>>>>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
>>>>>>>>>>>> present which is not functional
>>>>>>>>>>>> contents of /sys/class/backlight
>>>>>>>>>>>> total 0
>>>>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
>>>>>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>>>>>>>
>>>>>>>>>>>> this is the content on 6.0.12
>>>>>>>>>>>> total 0
>>>>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
>>>>>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
>>>>>>>>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
>>>>>>>>>>>>
>>>>>>>>>>>> Distro: Endeavour OS
>>>>>>>>>>>> Kernel: 6.1.4-arch1-1
>>>>>>>>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
>>>>>>>>>>>>
>>>>>>>>>>>> #regzbot introduced v6.1..v6.1.4
>>>>>>>>>>>
>>>>>>>>>>> Hmm, this is likely caused by:
>>>>>>>>>>>
>>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
>>>>>>>>>>>
>>>>>>>>>>> Which was added because according to the reporter on their G15 5515
>>>>>>>>>>> backlight control only works in native mode ...
>>>>>>>>>>>
>>>>>>>>>>> I'm getting the feeling that we need to detect the BIOS setting
>>>>>>>>>>> and use a different backlight device depending on the setting...
>>>>>>>>>>>
>>>>>>>>>>> Daniel, any ideas?
>>>>>>>>>>>
>>>>>>>>>>> For now can you try building a kernel with the attached patch
>>>>>>>>>>> (which I've also just submitted upstream) and with:
>>>>>>>>>>>
>>>>>>>>>>> acpi_backlight=nvidia_wmi_ec
>>>>>>>>>>>
>>>>>>>>>>> added to your kernel commandline. That should work around this
>>>>>>>>>>> for now...
>>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>>
>>>>>>>>>>> Hans
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>
>>
> 

