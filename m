Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F117DB
	for <regressions@lists.linux.dev>; Tue, 10 Jan 2023 17:03:14 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id b9-20020a17090a7ac900b00226ef160dcaso12408231pjl.2
        for <regressions@lists.linux.dev>; Tue, 10 Jan 2023 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uH78KA1NrpwOxMtgJGErHwLeO9CaKCUb2oFbm2PapLY=;
        b=aIdZE93f151lIQziSJk8llO57YaVdx9CPrpnaSu7kCAYK4RlXt6R3ttwwrm3aliN77
         sfGoRMRrIgIDo+TFf4wCJyBIrwX5vir8uzjp7S2dywj4j8U9o1cQ7TOqq601mZYaNSfC
         0c3psSGMousx8zKUzvwOsO1IUVLzgi7Mh50cxz+Pm4DsIBxivQPmL16P0VfQF2JQSdP9
         z3AWchHu6W1NA84ofEv0jTlKrZZRfK3XbR8VY2kZDVAP/sBVqEPsAiS02bWRPWA9bQPM
         YMdYweMdd4onza3tk8YosjZQ0mdnaKXE0t03nDF2SqEgzUlF64Ta8Q1WBLEn0l6hfvWu
         SK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uH78KA1NrpwOxMtgJGErHwLeO9CaKCUb2oFbm2PapLY=;
        b=5dHa5VbU5gKczpID8/aiivgcnhFay46kUK86mtvOB6F+Z9jc6huZfnUUr3p/eU3LuL
         0YZKe5pY47eYSS0Cj3EaNrKm7uKrMTSIoITTJ7oMWwjS5LyQ4A2TMic1u4yw5/i5fFIZ
         KglLZMhqwYAtKhIWXzMzMm4SbrVVlWrQzeNQ4Xz8hB2OHheNvqUVsUlwJi8y6zrgVJSU
         SB15pOvJJYbQpEhtu2d+ovrci7fWxWGpyUtcqV9IoB+J2+Dqw8wr9gnLMcM3t90Eb6wZ
         HHdndksu/pfjHdptdNtyBqbU5w0Wh0jO6fU8BQyme7A5yRuUg/9gZzUC+IusJGHNrKfP
         Q5mQ==
X-Gm-Message-State: AFqh2krMHnupe39OOepUNolyiIwwBZBKkwGNz+KZaDQKFnICu9yBbfJH
	3zOGMNmLWyfl9wQvUGGKGiOnge7XSfvXr6xAMcY=
X-Google-Smtp-Source: AMrXdXuUs3qajh31z+TQWT6N90ZwiYt1Y4leEU/O6YLfrP1Zn4hZz/YL9CTTISHHjU8hEuUWDuFQ/gAOc+Ioo2HHT58=
X-Received: by 2002:a17:902:ab85:b0:188:b8cf:85b with SMTP id
 f5-20020a170902ab8500b00188b8cf085bmr3092023plr.126.1673370193957; Tue, 10
 Jan 2023 09:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com> <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com> <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
In-Reply-To: <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
From: Youssef Aly <youssefaswad@gmail.com>
Date: Tue, 10 Jan 2023 19:03:02 +0200
Message-ID: <CAKsK3A=ndHtfWHtWF_bAjaLFuy3xjCB_RbDdOn+fe4eSqpC8Rg@mail.gmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Dadap <ddadap@nvidia.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,

Happy to test anytime, thanks for the p.s.

I would like to mention something probably unrelated, but thought I
would mention it just in case. The backlight control has been broken
on windows 10/11 on hybrid mode since Nvidia driver 526.47, this issue
only affects the 3060 models (They have a mux switch). This is a link
to the forum discussing the issue
https://www.dell.com/community/Inspiron/G15-5515-Ryzen-Edition-Display-Brightness-Slider-not-Working/m-p/8301504#M154120
.

Hope that is of some help.

Thanks,

Youssef



On Tue, 10 Jan 2023 at 17:28, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/10/23 16:19, Youssef Aly wrote:
> > Hi Hans,
> >
> > Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > the kernel commandline for the patched kernel, it doesn't work without it.
> >
> > I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > the modes with "acpi_backlight=nvidia_wmi_ec" and
> > "acpi_backlight=native" using the patched kernel (v6.1.4):
> >
> > Hybrid:
> > "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > amdgpu_bl1.
> > "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > /sys/class/backlight contains nvidia_wmi_ec_backlight.
> >
> > Discrete:
> > "acpi_backlight=native": Works but when brightness from 0-10 is the
> > same as 0-100, for example 10 is full brightness like 100, 8 is the
> > same as 80, etc... ,
> > /sys/class/backlight contains nvidia_0.
> > "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > contains nvidia_wmi_ec_backlight.
>
> Thank you for testing!
>
> Ok so it seems there are 2 issues at play here:
>
> 1. Depending on the BIOS setting we need to use either native (discrete mode)
>    or nvidia_wmi_ec (hybrid mode)
>
> 2. There is a bug in the nvidia binary drivers backlight control in native
>    mode on this system causing the range to be wrong
>
> Daniel, we really need help from NVidia with fixing 1. can you see if
> there is a way to check the BIOS setting/mode from inside the kernel ?
>
> Regards,
>
> Hans
>
> p.s.
>
> Youssef, for your next email please use reply to all. You keep dropping
> Daniel and the regressions-list from the To/Cc, using reply-to-all should
> keep these in the To/Cc.
>
>
>
>
> > On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 1/10/23 02:07, Youssef Aly wrote:
> >>> Hello,
> >>>
> >>> Just reporting back, building with the patch fixed the issue.
> >>
> >> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
> >> the kernel commandline for the patched kernel, right ?
> >>
> >> If you have time, can you please also check the other BIOS
> >> (hybrid / discrete / ...) modes in the BIOS?
> >>
> >> Based on the previous bug report, I would expect you to need
> >> to pass "acpi_backlight=native" in at least some of the other
> >> modes ...
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
> >>>>
> >>>> Hello Hans,
> >>>>
> >>>> Ok, I'll try building with the patch you provided, and report back.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Youssef
> >>>>
> >>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>
> >>>>> Hi Youssef,
> >>>>>
> >>>>> On 1/9/23 17:18, Youssef Aly wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
> >>>>>> is always at full brightness, this is only the case in hybrid (mux)
> >>>>>> graphics mode.
> >>>>>>
> >>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> >>>>>> nvidia_wmi_ec_backlight    16384  0
> >>>>>> video                  61440  5
> >>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> >>>>>> wmi                    36864  7
> >>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> >>>>>>
> >>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> >>>>>> present which is not functional
> >>>>>> contents of /sys/class/backlight
> >>>>>> total 0
> >>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> >>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>>
> >>>>>> this is the content on 6.0.12
> >>>>>> total 0
> >>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> >>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> >>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> >>>>>>
> >>>>>> Distro: Endeavour OS
> >>>>>> Kernel: 6.1.4-arch1-1
> >>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> >>>>>>
> >>>>>> #regzbot introduced v6.1..v6.1.4
> >>>>>
> >>>>> Hmm, this is likely caused by:
> >>>>>
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
> >>>>>
> >>>>> Which was added because according to the reporter on their G15 5515
> >>>>> backlight control only works in native mode ...
> >>>>>
> >>>>> I'm getting the feeling that we need to detect the BIOS setting
> >>>>> and use a different backlight device depending on the setting...
> >>>>>
> >>>>> Daniel, any ideas?
> >>>>>
> >>>>> For now can you try building a kernel with the attached patch
> >>>>> (which I've also just submitted upstream) and with:
> >>>>>
> >>>>> acpi_backlight=nvidia_wmi_ec
> >>>>>
> >>>>> added to your kernel commandline. That should work around this
> >>>>> for now...
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>> Hans
> >>>
> >>
> >
>
