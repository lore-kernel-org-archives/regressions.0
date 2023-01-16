Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5246FA3
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673887610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ry1Mg9GhEkbw8nbEBF7YJv4FjO2qBXxRYufOdLbsJlA=;
	b=V9pLKr9xoDrwcbjl4Z9fZYRHdGwlvDdbkvu2IJhmuGXZ5Utpi+EGz9yYzThgcUpfepb8ef
	AMVsi26vQvNUd3Zz5O8/+G4t5PYt784SG5VrDVeKuEhXCC1GYKRMN2NiuE0wHPQV9LwtNk
	0qBeystE3dSUqPyxiyevpWy91qQHcCY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-a1_nOw1hOEadIHCUHABcRw-1; Mon, 16 Jan 2023 11:46:49 -0500
X-MC-Unique: a1_nOw1hOEadIHCUHABcRw-1
Received: by mail-ed1-f71.google.com with SMTP id w18-20020a05640234d200b0048cc3aa4993so19335482edc.7
        for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 08:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ry1Mg9GhEkbw8nbEBF7YJv4FjO2qBXxRYufOdLbsJlA=;
        b=NfI3NrvbkJxYPP0Qm5cXXYWBw6eXaHIJvzlbVFo2GguBDWIwEQSmNneWC7GUdQSQMu
         v2L4EtUsQP5MurBqdJ9sw8PKP3uMeYxwtm6cVpGAqU5mYHoAtWKD+1U1ELRp9U9sIr3h
         jMCbvcezU/iDioQwYB3EmX6/CrgcUtiAbSrv67Ib793mV0NpCzbAZVi1nSn+7dtX1EDI
         my9Scasob75DWoUgNrYrpJdw6HR7uIJRiu60pZP8IDELM6rkFCqkekWD5WYUuJ+PHBdo
         AU9V4QuXfDn8Yj0mHaF07+qPT191mgJxsSaBzMuJ5rJ29jKbuRvS5SwJohPiCZEK2tFI
         UkVQ==
X-Gm-Message-State: AFqh2kpH4o/dlzs9eyo9KnA2ySNHvHuDHAcXNCnAi5ApxkYjn+XC9kWs
	vl0c3i5CTRhY7s73Q1FTxY+h8Xn3J9wQofhW+QIdmEwYu/ZVzSGcXVzvpMDmP57sVOEoLkw/RLV
	Fw/THzJmQm0e8ZPiPpdK4/gI=
X-Received: by 2002:a05:6402:1381:b0:499:7cf3:a452 with SMTP id b1-20020a056402138100b004997cf3a452mr12002349edv.14.1673887607842;
        Mon, 16 Jan 2023 08:46:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvmUUpjs9QuMoTv7oassSfwkl7kUQDkIvPc6csgTI20xn9x0KzDKcL9ELQbIeawPjVPbli+aw==
X-Received: by 2002:a05:6402:1381:b0:499:7cf3:a452 with SMTP id b1-20020a056402138100b004997cf3a452mr12002325edv.14.1673887607575;
        Mon, 16 Jan 2023 08:46:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id eg49-20020a05640228b100b00488117821ffsm11778978edb.31.2023.01.16.08.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 08:46:46 -0800 (PST)
Message-ID: <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
Date: Mon, 16 Jan 2023 17:46:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Iris <pawel.js@protonmail.com>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
In-Reply-To: <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 1/11/23 10:51, Hans de Goede wrote:
> Hi,
> 
> On 1/11/23 01:40, Daniel Dadap wrote:
>> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 1/10/23 16:19, Youssef Aly wrote:
>>>> Hi Hans,
>>>>
>>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
>>>> the kernel commandline for the patched kernel, it doesn't work without it.
>>>>
>>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
>>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
>>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
>>>>
>>>> Hybrid:
>>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
>>>> amdgpu_bl1.
>>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
>>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
>>>>
>>>> Discrete:
>>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
>>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
>>>> same as 80, etc... ,
>>>> /sys/class/backlight contains nvidia_0.
>>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
>>>> contains nvidia_wmi_ec_backlight.
>>>
>>> Thank you for testing!
>>>
>>> Ok so it seems there are 2 issues at play here:
>>>
>>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
>>>    or nvidia_wmi_ec (hybrid mode)
>>>
>>> 2. There is a bug in the nvidia binary drivers backlight control in native
>>>    mode on this system causing the range to be wrong
>>>
>>> Daniel, we really need help from NVidia with fixing 1. can you see if
>>> there is a way to check the BIOS setting/mode from inside the kernel ?
>>
>> Yes, the ACPI MXDM method should be able to do this. However, querying
>> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
>> determine whether the backlight is supposed to be EC-driven, since there
>> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
>> be orthogonal to whether or not the EC driver should be used. It sounds
>> like the BIOS is possibly reporting a wrong value for that query.
>>
>> I guess we could wire up a quirk that checks MXDM and overrides the
>> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
>> mux operation mode. Then that quirk could be applied to this system.
>> I can put together a patch for that.
> 
> If you can write a patch for this that would be great, thank you,
> but I think we first need to root-cause this better:
> 
> Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> to always use the native backlight. So I've gone back to the original email
> thread which lead to me adding that quirk.
> 
> We (I forwarded a mail from you to the reporter this was not on the list)
> did ask to test with different BIOS settings their to and the reporter's
> reply was:
> 
> "Daniel wanted me to check different GPU modes, but my BIOS has no options
> for GPU. It's always in hybrid mode with PRIME render offload."
> 
> And perhaps even more interesting in their case with acpi_backlight=native
> to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> in Youssef's case when running in discrete mode there is an nvidia backlight
> device and in Youssef's case the amdgpu_bl# device never works.
> 
> The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> 
> While the dGPU can be one of:
> NVIDIA GeForce RTX 3060
> NVIDIA GeForce GTX 3050 Ti
> NVIDIA GeForce GTX 3050
> 
> I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> be relevant to the model with the 3060 and that nvidia-wmi-ec should
> maybe not load at all on the model with the 3050 versions.

A quick status update on this.

Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has 
gotten back to me with lspci output on their G15 and it indeed has
a GTX 3050.

So atm we have the following models which are affected one way
or the other:

  -Acer Predator PH315-55: needs acpi_backlight=native
  -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
  -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(

With the models which need acpi_backlight=native being broken
by (false positive) detection of the laptop needing nvidia-wmi-ec
for backlight control while they actually should not be using that.

and with the Dell G15 5515 with RTX 3060 atm being broken because
of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.

Regards,

Hans

