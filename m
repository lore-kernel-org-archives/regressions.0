Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB85D17EF
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673430723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FsFAXT9wt0T2C9d1LHQ+SOPrcAq0EnHdbD1f+XyOpFk=;
	b=BDg4i4sC2w5W3HPdWYL3KtPRmsazbncyin8MtRPVgFhNVI2ljmF4NRT7BYU0Vo9J5gDGL3
	OZn+pf4uKIYoowGI3froPUuPqmX0DPNG0+Ny7szvERKkaCmkAJ8BnWt0r0fIoJR3COpyQe
	maxSw1L/q/pR3wZqRr+RL0Qb5C563z4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-hHUsB9wCMO64-llZAfkzuQ-1; Wed, 11 Jan 2023 04:52:02 -0500
X-MC-Unique: hHUsB9wCMO64-llZAfkzuQ-1
Received: by mail-ej1-f70.google.com with SMTP id dr5-20020a170907720500b00808d17c4f27so9686237ejc.6
        for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 01:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H8r3d1s2gj9HtaMXa4R9Arfv1Mgd+/ffPu5AHVfjFd4=;
        b=eUhn0y4dM4H3lDjjUa+u6BQ85E2A6ya8PjmMQt2PCAr+5FROxRGT42P4vLgA1V6RVa
         GrJSgH9lTX/t12FFavFPWyeJv8cvgdRuCLwiRiKkvvHiw2UBlYJEYvWuIou3KymkfUB2
         rlAf3npaMHPIRz+MSam1OLsX1kOFprFmTTTAdX5gCBpHAGNenjWjf7v8/UYohHsfE0lh
         GmpiGSxd4jWFPxE+y4tknxdv6NNZABRehhwmOSW2JXpTCfPsPmW5G9ta5IkqjKhHwr0N
         Vp/WBeTrfsdJx5hOj8+o7IbJSt6IKlSf2EQ5Yw6Hu6Mc7TOGwtqZqbZ255FVhlyoyols
         08dw==
X-Gm-Message-State: AFqh2kqjw7gmK74c3YjHgRva+g3ZxSL14dd/GkrPsKHSbTeP0nv6Beyt
	werOfKbqUM37gU3wXvup+Z6WhSRFq99IAulX/OONPZj4Bcud4yBT3EJfSy1sCKDcbDANluaOfJB
	a/wYYvpNjNeUDcane2kGdgsc=
X-Received: by 2002:a17:906:3095:b0:809:c1f4:ea09 with SMTP id 21-20020a170906309500b00809c1f4ea09mr56303320ejv.69.1673430721288;
        Wed, 11 Jan 2023 01:52:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv/vM4Yap/fhLLxnnK0QxRifp2RKg9d73Q/C7vuS/isuSrewQ2hYpr7VpLWNHw0LWiXlRkqRg==
X-Received: by 2002:a17:906:3095:b0:809:c1f4:ea09 with SMTP id 21-20020a170906309500b00809c1f4ea09mr56303306ejv.69.1673430720952;
        Wed, 11 Jan 2023 01:52:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b007c16f120aacsm5937208ejn.121.2023.01.11.01.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:52:00 -0800 (PST)
Message-ID: <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
Date: Wed, 11 Jan 2023 10:51:59 +0100
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
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y74FfQmjN8WJcCIG@lenny>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------V979z0PPGV7Od9ogtIp2Nx82"
Content-Language: en-US, nl

This is a multi-part message in MIME format.
--------------V979z0PPGV7Od9ogtIp2Nx82
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/23 01:40, Daniel Dadap wrote:
> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/10/23 16:19, Youssef Aly wrote:
>>> Hi Hans,
>>>
>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
>>> the kernel commandline for the patched kernel, it doesn't work without it.
>>>
>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
>>>
>>> Hybrid:
>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
>>> amdgpu_bl1.
>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
>>>
>>> Discrete:
>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
>>> same as 80, etc... ,
>>> /sys/class/backlight contains nvidia_0.
>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
>>> contains nvidia_wmi_ec_backlight.
>>
>> Thank you for testing!
>>
>> Ok so it seems there are 2 issues at play here:
>>
>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
>>    or nvidia_wmi_ec (hybrid mode)
>>
>> 2. There is a bug in the nvidia binary drivers backlight control in native
>>    mode on this system causing the range to be wrong
>>
>> Daniel, we really need help from NVidia with fixing 1. can you see if
>> there is a way to check the BIOS setting/mode from inside the kernel ?
> 
> Yes, the ACPI MXDM method should be able to do this. However, querying
> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> determine whether the backlight is supposed to be EC-driven, since there
> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> be orthogonal to whether or not the EC driver should be used. It sounds
> like the BIOS is possibly reporting a wrong value for that query.
> 
> I guess we could wire up a quirk that checks MXDM and overrides the
> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> mux operation mode. Then that quirk could be applied to this system.
> I can put together a patch for that.

If you can write a patch for this that would be great, thank you,
but I think we first need to root-cause this better:

Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
to always use the native backlight. So I've gone back to the original email
thread which lead to me adding that quirk.

We (I forwarded a mail from you to the reporter this was not on the list)
did ask to test with different BIOS settings their to and the reporter's
reply was:

"Daniel wanted me to check different GPU modes, but my BIOS has no options
for GPU. It's always in hybrid mode with PRIME render offload."

And perhaps even more interesting in their case with acpi_backlight=native
to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
in Youssef's case when running in discrete mode there is an nvidia backlight
device and in Youssef's case the amdgpu_bl# device never works.

The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)

While the dGPU can be one of:
NVIDIA GeForce RTX 3060
NVIDIA GeForce GTX 3050 Ti
NVIDIA GeForce GTX 3050

I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
be relevant to the model with the 3060 and that nvidia-wmi-ec should
maybe not load at all on the model with the 3050 versions.

Maybe the Windows Nvidia drivers only even try to use the WMI EC
interface with certain generations of GPUs ?

Daniel might that be what is going on here ?


Youssef, can you try/test 2 things for us please? :

1. Provide the output of running "lspci -nn"

2. Try a kernel with the attached patch (can be applied on top
   of the previous patch). This removes the quirk, so that we
   can let the nvidia_wmi_ec auto-detect code do its thing,
   because maybe it does work on your model G15 5515.
   When testing this you should *not* have any acpi_backlight=xxx
   argument on your kernel commandline.

> As for the native range bug, that does sound like a scaling issue. I'll
> take a look at how the NVIDIA driver determines the range of possible
> backlight values and see if Ican find an obvious way that might fail on
> a particular system.

Ok.

Regards,

Hans



>>> On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 1/10/23 02:07, Youssef Aly wrote:
>>>>> Hello,
>>>>>
>>>>> Just reporting back, building with the patch fixed the issue.
>>>>
>>>> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
>>>> the kernel commandline for the patched kernel, right ?
>>>>
>>>> If you have time, can you please also check the other BIOS
>>>> (hybrid / discrete / ...) modes in the BIOS?
>>>>
>>>> Based on the previous bug report, I would expect you to need
>>>> to pass "acpi_backlight=native" in at least some of the other
>>>> modes ...
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>
>>>>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
>>>>>>
>>>>>> Hello Hans,
>>>>>>
>>>>>> Ok, I'll try building with the patch you provided, and report back.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Youssef
>>>>>>
>>>>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>
>>>>>>> Hi Youssef,
>>>>>>>
>>>>>>> On 1/9/23 17:18, Youssef Aly wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
>>>>>>>> is always at full brightness, this is only the case in hybrid (mux)
>>>>>>>> graphics mode.
>>>>>>>>
>>>>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
>>>>>>>> nvidia_wmi_ec_backlight    16384  0
>>>>>>>> video                  61440  5
>>>>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
>>>>>>>> wmi                    36864  7
>>>>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
>>>>>>>>
>>>>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
>>>>>>>> present which is not functional
>>>>>>>> contents of /sys/class/backlight
>>>>>>>> total 0
>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>>>
>>>>>>>> this is the content on 6.0.12
>>>>>>>> total 0
>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
>>>>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
>>>>>>>>
>>>>>>>> Distro: Endeavour OS
>>>>>>>> Kernel: 6.1.4-arch1-1
>>>>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
>>>>>>>>
>>>>>>>> #regzbot introduced v6.1..v6.1.4
>>>>>>>
>>>>>>> Hmm, this is likely caused by:
>>>>>>>
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
>>>>>>>
>>>>>>> Which was added because according to the reporter on their G15 5515
>>>>>>> backlight control only works in native mode ...
>>>>>>>
>>>>>>> I'm getting the feeling that we need to detect the BIOS setting
>>>>>>> and use a different backlight device depending on the setting...
>>>>>>>
>>>>>>> Daniel, any ideas?
>>>>>>>
>>>>>>> For now can you try building a kernel with the attached patch
>>>>>>> (which I've also just submitted upstream) and with:
>>>>>>>
>>>>>>> acpi_backlight=nvidia_wmi_ec
>>>>>>>
>>>>>>> added to your kernel commandline. That should work around this
>>>>>>> for now...
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Hans
>>>>>
>>>>
>>>
>>
> 

--------------V979z0PPGV7Od9ogtIp2Nx82
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ACPI-video-Drop-DMI-quirk-for-Dell-G15-5515.patch"
Content-Disposition: attachment;
 filename="0001-ACPI-video-Drop-DMI-quirk-for-Dell-G15-5515.patch"
Content-Transfer-Encoding: base64

RnJvbSA4MTRmNjYxMjRlNTI0YjUxMjhhZjdhMjQ4M2ViNjhmNjZjMTU4YjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBXZWQsIDExIEphbiAyMDIzIDEwOjQ4OjAwICswMTAwClN1YmplY3Q6IFtQQVRDSF0gQUNQ
STogdmlkZW86IERyb3AgRE1JIHF1aXJrIGZvciBEZWxsIEcxNSA1NTE1CgpGb3JjaW5nIHRoZSB1
c2Ugb2YgbmF0aXZlIGNhdXNlcyBpc3N1ZXMgb24gc29tZSB2YXJpYW50cwpvZiB0aGUgRGVsbCBH
MTUgNTUxNS4KCkZJWE1FOiB3ZSBmaXJzdCBuZWVkIGEgd2F5IHRvIGVuc3VyZSBuYXRpdmUgaXMg
dXNlZCBvbiBtb2RlbHMKd2hlcmUgd2UgZG8gbmVlZCBpdCBiZWZvcmUgZHJvcHBpbmcgdGhpcy4K
CkZJWE1FOiBBZGQgbW9yZSBkZXRhaWxzIG9uY2UgcHJvcGVyIGZpeCBpcyBhdmFpbGFibGUuCgpT
aWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRy
aXZlcnMvYWNwaS92aWRlb19kZXRlY3QuYyB8IDE0IC0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3ZpZGVvX2Rl
dGVjdC5jIGIvZHJpdmVycy9hY3BpL3ZpZGVvX2RldGVjdC5jCmluZGV4IDhhNTQxZWZjNTY3NS4u
ZDRlZGQ2NGRjYzJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMKKysr
IGIvZHJpdmVycy9hY3BpL3ZpZGVvX2RldGVjdC5jCkBAIC02OTAsMjAgKzY5MCw2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCB2aWRlb19kZXRlY3RfZG1pX3RhYmxlW10gPSB7
CiAJCX0sCiAJfSwKIAotCS8qCi0JICogTW9kZWxzIHdoaWNoIGhhdmUgbnZpZGlhLWVjLXdtaSBz
dXBwb3J0LCBidXQgc2hvdWxkIG5vdCB1c2UgaXQuCi0JICogTm90ZSB0aGlzIGluZGljYXRlcyBh
IGxpa2VseSBmaXJtd2FyZSBidWcgb24gdGhlc2UgbW9kZWxzIGFuZCBzaG91bGQKLQkgKiBiZSBy
ZXZpc2l0ZWQgaWYvd2hlbiBMaW51eCBnZXRzIHN1cHBvcnQgZm9yIGR5bmFtaWMgbXV4IG1vZGUu
Ci0JICovCi0JewotCSAuY2FsbGJhY2sgPSB2aWRlb19kZXRlY3RfZm9yY2VfbmF0aXZlLAotCSAv
KiBEZWxsIEcxNSA1NTE1ICovCi0JIC5tYXRjaGVzID0gewotCQlETUlfTUFUQ0goRE1JX1NZU19W
RU5ET1IsICJEZWxsIEluYy4iKSwKLQkJRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJEZWxs
IEcxNSA1NTE1IiksCi0JCX0sCi0JfSwKLQogCS8qCiAJICogRGVza3RvcHMgd2hpY2ggZmFsc2Vs
eSByZXBvcnQgYSBiYWNrbGlnaHQgYW5kIHdoaWNoIG91ciBoZXVyaXN0aWNzCiAJICogZm9yIHRo
aXMgZG8gbm90IGNhdGNoLgotLSAKMi4zOS4wCgo=
--------------V979z0PPGV7Od9ogtIp2Nx82--

