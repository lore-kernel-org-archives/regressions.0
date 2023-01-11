Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2620FF
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 10:42:36 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 20so5674172pfu.13
        for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 02:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VG2hK4fXuI9MZy3cYzeA1FQsWjHkS+jwa0Q9cf7Fwy8=;
        b=PIHVcOJHPAng3Q2u9gu70zvnVU5Db0HPLzRiARdD97Y9o8tLgosZ2KW8XDU1M1WqUQ
         nY5TDa7qMYPusmKojKCRujE133PRxRmesjtT9rlIsyRlmVF7S0ceA2vY9MQvamMpbBmK
         KKxJ3iJsHSxI82AQFqNuETayI8J20YHV0Na436KjQw3TbnH2l7J5ZilUMj8bz2hSABds
         iTvWRr2qczLEQY+02tF9cFN6kt0hVaF5gRnw3ZH208s3D36SkIKbSak8Br/AZOp3FrdR
         Lv0mwlBwzwY+g8V4++NS3Qu6dFhm86rUz1HSA4ybW3BDZOBF/G9Xfy2s9RQjFwoPXuLp
         mFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG2hK4fXuI9MZy3cYzeA1FQsWjHkS+jwa0Q9cf7Fwy8=;
        b=1UHw3l9McsOA09EBvcOyOhqQPXtPx0kzaU//fMlxThddh0tk5yJsCE7y4rV4Tnys/u
         cn2+aWDSVN91vuLuJSLi4ctlEPYeq8vI7VgAcEkPUitKHKHc7uYx/e9yalfgA036hLQq
         nCO2gro6jOGF+xF7AyikCBO03vvA1nvi5Nhkj1ZXXP/wdlHQlYPFL6R5bZhXhcgYgRxc
         v/Ki+O5macOsVOaEnzUAl0t21Uvy3G0sZOCXbnDcP8KheS05YCSE7QdBV+lopM1/VRj8
         QwGHZF5WI1bUuGU/I3P1h9iL52vIce4FVeknNuC8fcjHj+42UOpDAhYETqFfn7FUnNZh
         zABQ==
X-Gm-Message-State: AFqh2kqkqXbHVUK4sV13DwALSyRcUIwdQaH23PMdWSTVsfvFwinKqIzG
	xPdoVOeahHH5fTCspN6kkw0IrLtG3LSpgaRXrTQ=
X-Google-Smtp-Source: AMrXdXtkwJhGyb9OD9oTaZuYObMjbwYmO3VnjjAOKmo0Hr8o9zAd35TXqj31YAkDAUDIdZgqo0S9anSF1tU0JD8jVlo=
X-Received: by 2002:a63:571d:0:b0:478:c48d:9321 with SMTP id
 l29-20020a63571d000000b00478c48d9321mr4256527pgb.617.1673433755011; Wed, 11
 Jan 2023 02:42:35 -0800 (PST)
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
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny> <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
In-Reply-To: <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
From: Youssef Aly <youssefaswad@gmail.com>
Date: Wed, 11 Jan 2023 12:42:23 +0200
Message-ID: <CAKsK3Ak7sXf2CFoJDA_fV=jPrzqmA5dn3C-CK9o__KNN+rwpYg@mail.gmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Dadap <ddadap@nvidia.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hello,

Testing with no "acpi_backlight" in the kernel commandline. Hybrid
mode works, "nvidia_wmi_ec_backlight" is used. Discrete mode also
works with the range issue mentioned earlier, "nvidia_0" is used.

The output of "lspci -nn":

00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne Root Complex [1022:1630]
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne IOMMU [1022:1631]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe Dummy Host Bridge [1022:1632]
00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe GPP Bridge [1022:1633]
00:01.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:01.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe Dummy Host Bridge [1022:1632]
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:02.4 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne PCIe GPP Bridge [1022:1634]
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Renoir
PCIe Dummy Host Bridge [1022:1632]
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
Internal PCIe GPP Bridge to Bus [1022:1635]
00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Renoir
Internal PCIe GPP Bridge to Bus [1022:1635]
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus
Controller [1022:790b] (rev 51)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC
Bridge [1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 0 [1022:166a]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 1 [1022:166b]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 2 [1022:166c]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 3 [1022:166d]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 4 [1022:166e]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 5 [1022:166f]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 6 [1022:1670]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Cezanne
Data Fabric; Function 7 [1022:1671]
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106M
[GeForce RTX 3060 Mobile / Max-Q] [10de:2560] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GA106 High Definition
Audio Controller [10de:228e] (rev a1)
02:00.0 Non-Volatile memory controller [0108]: SK hynix Gold P31/PC711
NVMe Solid State Drive [1c5c:174a]
03:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd.
RTL8125 2.5GbE Controller [10ec:8125] (rev 05)
04:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX200
[8086:2723] (rev 1a)
05:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co
Ltd NVMe SSD Controller 980 [144d:a809]
- Hybrid: 06:00.0 VGA compatible controller [0300]: Advanced Micro
Devices, Inc. [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega
Mobile Series] [1002:1638] (rev c5)
- Discrete: 06:00.0 Non-Essential Instrumentation [1300]: Advanced
Micro Devices, Inc. [AMD] Zeppelin/Raven/Raven2 PCIe Dummy Function
[1022:145a] (rev c5)
06:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc.
[AMD] Family 17h (Models 10h-1fh) Platform Security Processor
[1022:15df]
06:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne USB 3.1 [1022:1639]
06:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Renoir/Cezanne USB 3.1 [1022:1639]
06:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc.
[AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 01)
06:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family
17h/19h HD Audio Controller [1022:15e3]
07:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH
SATA Controller [AHCI mode] [1022:7901] (rev 81)
07:00.1 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] FCH
SATA Controller [AHCI mode] [1022:7901] (rev 81)

Regards,

Youssef





On Wed, 11 Jan 2023 at 11:52, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/11/23 01:40, Daniel Dadap wrote:
> > On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 1/10/23 16:19, Youssef Aly wrote:
> >>> Hi Hans,
> >>>
> >>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> >>> the kernel commandline for the patched kernel, it doesn't work without it.
> >>>
> >>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> >>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> >>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> >>>
> >>> Hybrid:
> >>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> >>> amdgpu_bl1.
> >>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> >>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> >>>
> >>> Discrete:
> >>> "acpi_backlight=native": Works but when brightness from 0-10 is the
> >>> same as 0-100, for example 10 is full brightness like 100, 8 is the
> >>> same as 80, etc... ,
> >>> /sys/class/backlight contains nvidia_0.
> >>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> >>> contains nvidia_wmi_ec_backlight.
> >>
> >> Thank you for testing!
> >>
> >> Ok so it seems there are 2 issues at play here:
> >>
> >> 1. Depending on the BIOS setting we need to use either native (discrete mode)
> >>    or nvidia_wmi_ec (hybrid mode)
> >>
> >> 2. There is a bug in the nvidia binary drivers backlight control in native
> >>    mode on this system causing the range to be wrong
> >>
> >> Daniel, we really need help from NVidia with fixing 1. can you see if
> >> there is a way to check the BIOS setting/mode from inside the kernel ?
> >
> > Yes, the ACPI MXDM method should be able to do this. However, querying
> > WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> > determine whether the backlight is supposed to be EC-driven, since there
> > are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> > be orthogonal to whether or not the EC driver should be used. It sounds
> > like the BIOS is possibly reporting a wrong value for that query.
> >
> > I guess we could wire up a quirk that checks MXDM and overrides the
> > WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> > mux operation mode. Then that quirk could be applied to this system.
> > I can put together a patch for that.
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
>
> Maybe the Windows Nvidia drivers only even try to use the WMI EC
> interface with certain generations of GPUs ?
>
> Daniel might that be what is going on here ?
>
>
> Youssef, can you try/test 2 things for us please? :
>
> 1. Provide the output of running "lspci -nn"
>
> 2. Try a kernel with the attached patch (can be applied on top
>    of the previous patch). This removes the quirk, so that we
>    can let the nvidia_wmi_ec auto-detect code do its thing,
>    because maybe it does work on your model G15 5515.
>    When testing this you should *not* have any acpi_backlight=xxx
>    argument on your kernel commandline.
>
> > As for the native range bug, that does sound like a scaling issue. I'll
> > take a look at how the NVIDIA driver determines the range of possible
> > backlight values and see if Ican find an obvious way that might fail on
> > a particular system.
>
> Ok.
>
> Regards,
>
> Hans
>
>
>
> >>> On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 1/10/23 02:07, Youssef Aly wrote:
> >>>>> Hello,
> >>>>>
> >>>>> Just reporting back, building with the patch fixed the issue.
> >>>>
> >>>> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
> >>>> the kernel commandline for the patched kernel, right ?
> >>>>
> >>>> If you have time, can you please also check the other BIOS
> >>>> (hybrid / discrete / ...) modes in the BIOS?
> >>>>
> >>>> Based on the previous bug report, I would expect you to need
> >>>> to pass "acpi_backlight=native" in at least some of the other
> >>>> modes ...
> >>>>
> >>>> Regards,
> >>>>
> >>>> Hans
> >>>>
> >>>>
> >>>>
> >>>>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
> >>>>>>
> >>>>>> Hello Hans,
> >>>>>>
> >>>>>> Ok, I'll try building with the patch you provided, and report back.
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>> Youssef
> >>>>>>
> >>>>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>>>
> >>>>>>> Hi Youssef,
> >>>>>>>
> >>>>>>> On 1/9/23 17:18, Youssef Aly wrote:
> >>>>>>>> Hello,
> >>>>>>>>
> >>>>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
> >>>>>>>> is always at full brightness, this is only the case in hybrid (mux)
> >>>>>>>> graphics mode.
> >>>>>>>>
> >>>>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> >>>>>>>> nvidia_wmi_ec_backlight    16384  0
> >>>>>>>> video                  61440  5
> >>>>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> >>>>>>>> wmi                    36864  7
> >>>>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> >>>>>>>>
> >>>>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> >>>>>>>> present which is not functional
> >>>>>>>> contents of /sys/class/backlight
> >>>>>>>> total 0
> >>>>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> >>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>>>>
> >>>>>>>> this is the content on 6.0.12
> >>>>>>>> total 0
> >>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> >>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> >>>>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> >>>>>>>>
> >>>>>>>> Distro: Endeavour OS
> >>>>>>>> Kernel: 6.1.4-arch1-1
> >>>>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> >>>>>>>>
> >>>>>>>> #regzbot introduced v6.1..v6.1.4
> >>>>>>>
> >>>>>>> Hmm, this is likely caused by:
> >>>>>>>
> >>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
> >>>>>>>
> >>>>>>> Which was added because according to the reporter on their G15 5515
> >>>>>>> backlight control only works in native mode ...
> >>>>>>>
> >>>>>>> I'm getting the feeling that we need to detect the BIOS setting
> >>>>>>> and use a different backlight device depending on the setting...
> >>>>>>>
> >>>>>>> Daniel, any ideas?
> >>>>>>>
> >>>>>>> For now can you try building a kernel with the attached patch
> >>>>>>> (which I've also just submitted upstream) and with:
> >>>>>>>
> >>>>>>> acpi_backlight=nvidia_wmi_ec
> >>>>>>>
> >>>>>>> added to your kernel commandline. That should work around this
> >>>>>>> for now...
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>>
> >>>>>>> Hans
> >>>>>
> >>>>
> >>>
> >>
> >
