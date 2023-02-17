Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2BB5692
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 20:47:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bg22-20020a05600c3c9600b003dff4480a17so1286064wmb.1
        for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 12:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nbi+HMSjCt96Zoh/bafWZubX0kC6u99agYGMFVRiUyQ=;
        b=Wldd3C6LBgb0lGKBTi+XmtunpCS25ugYAArFQYp1NxZrtLbejL43+pamP2QrexKHxz
         ac0bLx1yXPN+X9wfncllXAjqtu2WegnLKxVOEcQCfG112KYwymCJbbVCA14cO82V4Xvd
         tczTCPdrzcIJm7zKvPJK/I5KzNXcB9d0iIdr6WtD0FdX2QVAB7PvVRUUm14kW8oD9EaE
         vSBveWLq7s8vZ6MyHcxfeUxttmAjFbIQirUj1Rz4OIUTB1oPPIstg1sX1AkAl8KhW7hY
         Lg3aRNvYOydcdmJoLFdnMVlv5I56YFUbBlqco8WBZUJKiIxrZhYAFsvI0Ox9R46IazAs
         d7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbi+HMSjCt96Zoh/bafWZubX0kC6u99agYGMFVRiUyQ=;
        b=cGJ6GD/ejSQbYTTmqZfnu8kPtw3XTiYAwtarB3qKo7+4HfWJd9RmhIwV/hPGzL91mZ
         jcS/pIp3GyRswtx4buKJ30xl6JGt5zaDvAbm1vbKoSej5MTSVmdzvVQPV3sLseeXq3mT
         NJLkThJhovNUZ6o8K+ODj9IK9xidiSJOVIeaHayeoP/q4phGeDK8akgU5BSl4KQpbE0s
         9fhLsgzOc4p8JwxmwBhsFB7BZAW9jZMxSzExRQJe3SHCtU/VXW/7h5xRAlWDIkesykKG
         BOqlITfgdgs7+y84iYMFiYaRGIm2AN3iSZPrFKGaM1jmf8p75pfmQSdA5TPBRPo1KsI5
         vkzA==
X-Gm-Message-State: AO0yUKWbGzPY+2mTpBQxYWU6xBuLNqLCqjLzIPU6N0Xqw6QYPgk0FLQB
	9WHmPbZDZpIRPgA95asLhpU=
X-Google-Smtp-Source: AK7set+ud2f5MMi+/PeDa0ZxEWCI/oMvlY01OJ1unDjvjoQxN4w1qaLddifh6hU8qSe+Bpd8jcpnaA==
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id bd6-20020a05600c1f0600b003dc3b2907a4mr5576621wmb.0.1676666848368;
        Fri, 17 Feb 2023 12:47:28 -0800 (PST)
Received: from [127.0.0.1] ([196.153.107.60])
        by smtp.gmail.com with ESMTPSA id c22-20020a05600c0ad600b003e21f01c426sm3762623wmr.9.2023.02.17.12.47.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2023 12:47:27 -0800 (PST)
Date: Fri, 17 Feb 2023 22:47:22 +0200
From: Youssef Ahmed <youssefaswad@gmail.com>
To: Daniel Dadap <ddadap@nvidia.com>
CC: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Hans de Goede <hdegoede@redhat.com>, Iris <pawel.js@protonmail.com>,
 regressions <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
User-Agent: K-9 Mail for Android
In-Reply-To: <Y+/NzXqrgapfi/PY@ddadap-lakeline.nvidia.com>
References: <Y8cSInQoeNcQMi03@lenny> <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com> <Y8c7ZN6PZhYcUYUk@lenny> <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com> <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com> <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com> <CAKsK3AnyP-ZXBhRzUsCa0+AVbd3hGxqfvoeQEvpihGqFEzM61A@mail.gmail.com> <Y8hue7X63tHpDBZR@lenny> <cf34615b-a23c-4e3c-5180-f285be514f34@leemhuis.info> <CAKsK3AndZCBGaiJbQMMo9i9Gg5BHuLpvVY2tTAJWrbJ-RETZAQ@mail.gmail.com> <Y+/NzXqrgapfi/PY@ddadap-lakeline.nvidia.com>
Message-ID: <FF98666D-72C9-47D5-85CE-9E679CABC01F@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

I added the file to gdrive, and here is the link
https://drive=2Egoogle=2Ecom/file/d/14JUpD78jJkXwjgJz5bY3nUzp-LFlZ6dC/view=
?usp=3Ddrivesdk

Let me know if you have any problem accessing the file=2E

Regards,

Youssef

On February 17, 2023 8:56:13 PM GMT+02:00, Daniel Dadap <ddadap@nvidia=2Ec=
om> wrote:
>On Fri, Feb 17, 2023 at 05:04:52PM +0200, Youssef Aly wrote:
>> Yes, I sent the data to daniel=2E I am currently just using an older ke=
rnel
>> (6=2E0) before the regression=2E
>
>Thanks, Youssef=2E I am also only seeing the test kernel module results a=
s
>the most recent message I have from you=2E If you sent the ACPI table dum=
ps
>as an attachment, there is a chance they got filtered out - this happened
>with another ACPI dump that somebody tried to send me=2E Perhaps posting =
the
>files to a file sharing site might work better - it would be interesting
>to compare your ACPI table dump to another from a different 5515 model=2E
>
>> On Fri, Feb 17, 2023, 2:36 PM Linux regression tracking (Thorsten Leemh=
uis)
>> <regressions@leemhuis=2Einfo> wrote:
>>=20
>> > On 18=2E01=2E23 23:11, Daniel Dadap wrote:
>> > > On Thu, Jan 19, 2023 at 12:02:50AM +0200, Youssef Aly wrote:
>> > >> I loaded the updated module and /sys/kernel/debug/acpi/mxds_mu
>> > >> x_state contained "integrated"=2E
>> > >>
>> > >> I ran
>> > >> echo "discrete" > /sys/kernel/debug/acpi/mxds_mux_state
>> > >> now it contained ''discrete' and the screen turned off=2E
>> > >> then I return it to its initial state=2E
>> > >>
>> > >> Tried echo '0' > /sys/kernel/debug/dri/1/eDP-1/trigger_hotplug the=
n '1'
>> > >> but it didn't work, had to reboot, I am running gnome on wayland=
=2E
>> > >
>> > > Your system does allow you to switch the mux mode in the UEFI setup
>> > > screen, correct? If you could share your ACPI tables as well (see t=
he
>> > > instructions in a fork of this thread) that would be helpful=2E
>> >
>> > I might be missing something, but it looks like this discussion stall=
ed
>> > here=2E
>> >
>> > Youssef Aly, did you ever share the data Daniel asked for? Or did you
>> > stop caring? Maybe because it works / you found a workaround?
>> >
>> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' h=
at)
>> > --
>> > Everything you wanna know about Linux kernel regression tracking:
>> > https://linux-regtracking=2Eleemhuis=2Einfo/about/#tldr
>> > If I did something stupid, please tell me, as explained on that page=
=2E
>> >
>> > #regzbot poke
>> >
>> > > It sounds like your system has a functional dynamic mux, which woul=
d be
>> > > consistent with being able to choose different mux modes in UEFI se=
tup=2E
>> > > The screen not coming back up isn't a big concern: triggering the
>> > > hotplug is something that's *supposed* to work (and it worked on th=
e
>> > > AMD+NVIDIA system I tried it on), but I am not surprised if it does=
n't
>> > > work everywhere=2E
>> > >
>> > >>
>> > >> On Wed, 18 Jan 2023 at 23:20, Iris <pawel=2Ejs@protonmail=2Ecom> w=
rote:
>> > >>>
>> > >>> After loading the updated module,
>> > /sys/kernel/debug/acpi/mxds_mux_state reports "integrated"=2E
>> > >>>
>> > >>> Now, i ran the command
>> > >>> sudo sh -c "echo discrete > /sys/kernel/debug/acpi/mxds_mux_state=
"
>> > >>>
>> > >>> /sys/kernel/debug/acpi/mxds_mux_state now reads "discrete", but m=
y
>> > screen didn't turn off=2E=2E=2E I changed it back to integrated, then=
 to discrete
>> > again, it seems like nothing happened, or did i do something wrong?
>> > >>>
>> > >>>
>> > >>> ------- Original Message -------
>> > >>> On Wednesday, January 18th, 2023 at 21:41, Daniel Dadap <
>> > ddadap@nvidia=2Ecom> wrote:
>> > >>>
>> > >>>
>> > >>>> Thanks, Iris:
>> > >>>>
>> > >>>
>> > >>>> On Wed, Jan 18, 2023 at 09:33:19AM +0000, Iris wrote:
>> > >>>>
>> > >>>
>> > >>>>> I have followed Youssef's instructions to build the module, and
>> > after loading it, /sys/kernel/debug/acpi/mxdm_mux_mode reports "dynam=
ic"
>> > >>>>
>> > >>>
>> > >>>>
>> > >>>
>> > >>>> That is unfortunate=2E I was hoping it would report a non-dynami=
c mode,
>> > which
>> > >>>> would make it easier to disambiguate between G15 5515 models whi=
ch
>> > require
>> > >>>> EC backlight control and G15 5515 models which require native
>> > GPU-driven
>> > >>>> backlight control=2E
>> > >>>>
>> > >>>
>> > >>>> I have attached an updated version of the test module which will
>> > allow you
>> > >>>> to test if your system does have a dynamic mux=2E Build and load=
 it the
>> > same
>> > >>>> way as the previous one (unload the previous one first if you ha=
ven't
>> > done
>> > >>>> so or rebooted already)=2E This adds
>> > /sys/kernel/debug/acpi/mxds_mux_state: if
>> > >>>> you see this file, read out its contents=2E I expect that on you=
r
>> > system it
>> > >>>> should report "integrated", since IIUC the amdgpu_bl backlight d=
evice
>> > is the
>> > >>>> one that works on your system=2E If you do not see this file, an=
d the
>> > message
>> > >>>> "MXDS not found" appears in your kernel log, then your ACPI tabl=
e
>> > doesn't
>> > >>>> expose the MXDS method, which could be a useful disambiguation t=
est=2E
>> > >>>>
>> > >>>
>> > >>>> Another experiment to try would be to flip the state of the mux=
=2E
>> > Before
>> > >>>> attempting this experiment, make sure to save any work and log i=
n
>> > remotely
>> > >>>> from another machine, since it is possible that your screen will=
 go
>> > blank
>> > >>>> and will need a reboot in order to come back up=2E To change the=
 mux
>> > state,
>> > >>>> write the target mux state to the mxds_mux_state file=2E Use wha=
tever
>> > the
>> > >>>> opposite of the current value is, i=2Ee=2E, if it reads out as
>> > "integrated",
>> > >>>> then write "discrete", and vice versa=2E If the mux switch worke=
d, your
>> > >>>> screen should go blank and reading the mxds_mux_state file again
>> > should
>> > >>>> reflect the new state=2E You can then flip the mux back to its o=
riginal
>> > >>>> position, and you should be able to get the display back by forc=
ing
>> > >>>> DPMS off and then on again=2E If you're not running X, writing a=
 '0'
>> > then
>> > >>>> writing a '1' to /sys/kernel/debug/dri/0/eDP-1/trigger_hotplug s=
eems
>> > to
>> > >>>> work on my AMD+NVIDIA system=2E (The DRI device and eDP connecto=
r ID
>> > might
>> > >>>> be enumerated differently on your system=2E) If neither of those=
 work to
>> > >>>> bring your display back up, then reboot the computer=2E
>> > >>>>
>> > >>>
>> > >>>> The most interesting data would be to check whether MXDS is avai=
lable
>> > in
>> > >>>> your system's ACPI tables, and if so, whether it is actually
>> > functional=2E
>> > >>>>
>> > >>>
>> > >>>>> As mentioned before, this RTX 3050 system does not have configu=
rable
>> > GPU mode=2E
>> > >>>>>
>> > >>>
>> > >>>>> ------- Original Message -------
>> > >>>>> On Wednesday, January 18th, 2023 at 01:20, Daniel Dadap
>> > ddadap@nvidia=2Ecom wrote:
>> > >>>>>
>> > >>>
>> > >>>>>> On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
>> > >>>>>
>> > >>>
>> > >>>>>>> Hello Daniel,
>> > >>>>>
>> > >>>
>> > >>>>>>> I tried building the module using the instructions you provid=
ed,
>> > but
>> > >>>>>>> ran into some problems as I didn't have the /lib/modules/$(un=
ame
>> > >>>>>>> -r)/source directory on my end=2E
>> > >>>>>>> I created a Makefile in a directory containing mxdm-debugfs=
=2Ec file
>> > and
>> > >>>>>>> added the following to it:
>> > >>>>>
>> > >>>
>> > >>>>>>> obj-m +=3D mxdm-debugfs=2Eo
>> > >>>>>
>> > >>>
>> > >>>>>>> all:
>> > >>>>>>> make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) modul=
es
>> > >>>>>
>> > >>>
>> > >>>>>>> clean:
>> > >>>>>>> make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) clean
>> > >>>>>
>> > >>>
>> > >>>>>>> I then ran "make" and loaded the module=2E
>> > >>>>>
>> > >>>
>> > >>>>>> Ah, yes, I should have mentioned specifically that the instruc=
tions
>> > >>>>>> assumed either a split Kbuild configuration with separate sour=
ce and
>> > >>>>>> output directories, or a single combined source and output
>> > directory but
>> > >>>>>> with "source" and "build" both being symlinks to the same
>> > directory=2E I
>> > >>>>>> forget which distros do what exactly, but some ship a combined
>> > >>>>>> source/output directory but only have one of either "source" o=
r
>> > "build";
>> > >>>>>> yours appears to be the latter configuration=2E I'm glad you w=
ere
>> > able to
>> > >>>>>> get it building anyway=2E
>> > >>>>>
>> > >>>
>> > >>>>>>> 1) Hybrid mode set to "Enabled" from the bios settings,
>> > >>>>>>> /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic=2E
>> > >>>>>>> 2) Hybrid mode set to "Disabled" from the bios settings,
>> > >>>>>>> /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete=2E
>> > >>>>>
>> > >>>
>> > >>>>>> Okay=2E This is consistent with my expectations=2E If we also =
find that
>> > the
>> > >>>>>> systems which require the quirk report either "discrete", "hyb=
rid",
>> > or
>> > >>>>>> "integrated" (IIUC those systems do not have the mode configur=
able
>> > in the
>> > >>>>>> UEFI settings), then I think we can fix the quirk by checking =
the
>> > mux
>> > >>>>>> mode and only forcing to native if the system is not in hybrid=
 mode=2E
>> > >>>>>
>> > >>>
>> > >>>>>> Or perhaps we should just get rid of the quirk, and unconditio=
nally
>> > test
>> > >>>>>> the mux mode, and avoid using nvidia-wmi-ec-backlight on syste=
ms
>> > which
>> > >>>>>> are not in "dynamic" mode, regardless of whether they expose t=
he
>> > WMI EC
>> > >>>>>> backlight interface and regardless of whether that interface r=
eports
>> > >>>>>> that the EC backlight driver should be used=2E (On the systems=
 that
>> > need
>> > >>>>>> the quirk, that interface is reporting that the backlight shou=
ld be
>> > >>>>>> EC-controlled even when it shouldn't be=2E) I think that in th=
eory, it
>> > >>>>>> should be possible for a system design to require EC backlight
>> > control
>> > >>>>>> even when the mux is in a non-dynamic mode, but in practice I =
don't
>> > know
>> > >>>>>> why anybody would do that, and am not aware of any systems whi=
ch do
>> > so
>> > >>>>>> (although until the report of the broken backlight on the 3050
>> > version
>> > >>>>>> of the Dell G15 5515, I wasn't aware of any systems that repor=
ted EC
>> > >>>>>> backlight control when it was supposed to be native=2E)
>> > >>>>>
>> > >>>
>> > >>>>>> Hans, I think the most reasonable options are:
>> > >>>>>
>> > >>>
>> > >>>>>> 1) Remove the quirk, and check for MXDM when deciding whether =
a
>> > system
>> > >>>>>> should use the EC backlight driver=2E This has the disadvantag=
e of
>> > adding
>> > >>>>>> a check where one isn't actually needed on some (most?) system=
s,
>> > and the
>> > >>>>>> advantage of most likely avoiding the need to add quirks for o=
ther
>> > >>>>>> systems where the system reports EC backlight control when nat=
ive
>> > should
>> > >>>>>> be used=2E It also has the possibility of being wrong on a
>> > theoretically
>> > >>>>>> possible configuration, although if we ever encounter such a
>> > >>>>>> configuration we could handle it with a quirk or find some oth=
er
>> > way to
>> > >>>>>> distinguish between systems that do or do not require the EC
>> > backlight
>> > >>>>>> driver=2E
>> > >>>>>
>> > >>>
>> > >>>>>> 2) Keep the existing quirk, and only force to native if MXDM i=
s
>> > missing
>> > >>>>>> or if MXDM reports that the system is in a non-dynamic mode=2E
>> > >>>>>
>> > >>>
>> > >>>>>> I'm inclined to go with (2), because it seems "safer", but am =
happy
>> > to
>> > >>>>>> implement (1) if you think that's the better option=2E For the=
 MXDM
>> > check
>> > >>>>>> I think the first thing to do is to check whether the MXDM met=
hod is
>> > >>>>>> present at all: as observed on at least one system, there is n=
o MXDM
>> > >>>>>> method when the system is in non-dynamic mode=2E Then if MXDM =
is
>> > present,
>> > >>>>>> check whether it reports that the mux is in dynamic mode=2E Fo=
r (1),
>> > only
>> > >>>>>> query the WMI-wrapped API to determine the backlight control s=
ource
>> > if
>> > >>>>>> the mux is in dynamic mode=2E For (2), only force the backligh=
t to
>> > native
>> > >>>>>> if the mux is not in dynamic mode=2E
>> > >>>>>
>> > >>>
>> > >>>>>> This, again, assumes that none of the systems which require th=
e
>> > quirk
>> > >>>>>> report that the mux is in dynamic mode=2E If any of them do, w=
e will
>> > need
>> > >>>>>> to find a different way to determine which systems are lying a=
bout
>> > how
>> > >>>>>> the backlight is supposed to be controlled=2E
>> > >>>>>
>> > >>>
>> > >>>>>>> Regards,
>> > >>>>>
>> > >>>
>> > >>>>>>> Youssef
>> > >>>>>
>> > >>>
>> > >>>>>>> On Tue, 17 Jan 2023 at 23:24, Daniel Dadap ddadap@nvidia=2Eco=
m
>> > wrote:
>> > >>>>>
>> > >>>
>> > >>>>>>>> Hans pointed out a crucial omission in the build instruction=
s in a
>> > >>>>>>>> different thread where I also shared this test module:
>> > >>>>>
>> > >>>
>> > >>>>>>>> On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote=
:
>> > >>>>>
>> > >>>
>> > >>>>>>>>> Thanks, Hans=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>> On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wro=
te:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> Hi All,
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> On 1/11/23 10:51, Hans de Goede wrote:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> Hi,
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> On 1/11/23 01:40, Daniel Dadap wrote:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede =
wrote:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> Hi,
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> On 1/10/23 16:19, Youssef Aly wrote:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>>> Hi Hans,
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>>> Yes, I added "acpi_backlight=3Dnvidia_wmi_ec" to
>> > >>>>>>>>>>>>>> the kernel commandline for the patched kernel, it does=
n't
>> > work without it=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>>> I have 2 modes in the bios Hybrid on/off (hybrid /
>> > discrete)=2E I tried
>> > >>>>>>>>>>>>>> the modes with "acpi_backlight=3Dnvidia_wmi_ec" and
>> > >>>>>>>>>>>>>> "acpi_backlight=3Dnative" using the patched kernel (v6=
=2E1=2E4):
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>>> Hybrid:
>> > >>>>>>>>>>>>>> "acpi_backlight=3Dnative": Does not work,
>> > /sys/class/backlight contains
>> > >>>>>>>>>>>>>> amdgpu_bl1=2E
>> > >>>>>>>>>>>>>> "acpi_backlight=3Dnvidia_wmi_ec": Works as expected,
>> > >>>>>>>>>>>>>> /sys/class/backlight contains nvidia_wmi_ec_backlight=
=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>>> Discrete:
>> > >>>>>>>>>>>>>> "acpi_backlight=3Dnative": Works but when brightness f=
rom
>> > 0-10 is the
>> > >>>>>>>>>>>>>> same as 0-100, for example 10 is full brightness like =
100,
>> > 8 is the
>> > >>>>>>>>>>>>>> same as 80, etc=2E=2E=2E ,
>> > >>>>>>>>>>>>>> /sys/class/backlight contains nvidia_0=2E
>> > >>>>>>>>>>>>>> "acpi_backlight=3Dnvidia_wmi_ec": Does not work,
>> > /sys/class/backlight
>> > >>>>>>>>>>>>>> contains nvidia_wmi_ec_backlight=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> Thank you for testing!
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> Ok so it seems there are 2 issues at play here:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> 1=2E Depending on the BIOS setting we need to use eithe=
r
>> > native (discrete mode)
>> > >>>>>>>>>>>>> or nvidia_wmi_ec (hybrid mode)
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> 2=2E There is a bug in the nvidia binary drivers backli=
ght
>> > control in native
>> > >>>>>>>>>>>>> mode on this system causing the range to be wrong
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>>> Daniel, we really need help from NVidia with fixing 1=
=2E can
>> > you see if
>> > >>>>>>>>>>>>> there is a way to check the BIOS setting/mode from insi=
de
>> > the kernel ?
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>> Yes, the ACPI MXDM method should be able to do this=2E H=
owever,
>> > querying
>> > >>>>>>>>>>>> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canon=
ical
>> > way to
>> > >>>>>>>>>>>> determine whether the backlight is supposed to be EC-dri=
ven,
>> > since there
>> > >>>>>>>>>>>> are EC-driven and non-EC-driven designs, so the BIOS mod=
e is
>> > supposed to
>> > >>>>>>>>>>>> be orthogonal to whether or not the EC driver should be =
used=2E
>> > It sounds
>> > >>>>>>>>>>>> like the BIOS is possibly reporting a wrong value for th=
at
>> > query=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>>> I guess we could wire up a quirk that checks MXDM and
>> > overrides the
>> > >>>>>>>>>>>> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived =
from
>> > the current
>> > >>>>>>>>>>>> mux operation mode=2E Then that quirk could be applied t=
o this
>> > system=2E
>> > >>>>>>>>>>>> I can put together a patch for that=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> If you can write a patch for this that would be great, th=
ank
>> > you,
>> > >>>>>>>>>>> but I think we first need to root-cause this better:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> Currently the Dell G15 5515 is DMI quirked inside:
>> > drivers/apci/video_detect=2Ec
>> > >>>>>>>>>>> to always use the native backlight=2E So I've gone back t=
o the
>> > original email
>> > >>>>>>>>>>> thread which lead to me adding that quirk=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> We (I forwarded a mail from you to the reporter this was =
not
>> > on the list)
>> > >>>>>>>>>>> did ask to test with different BIOS settings their to and=
 the
>> > reporter's
>> > >>>>>>>>>>> reply was:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> "Daniel wanted me to check different GPU modes, but my BI=
OS
>> > has no options
>> > >>>>>>>>>>> for GPU=2E It's always in hybrid mode with PRIME render o=
ffload=2E"
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> And perhaps even more interesting in their case with
>> > acpi_backlight=3Dnative
>> > >>>>>>>>>>> to disable nvidia-wmi-ec they have a working amdgpu_bl#
>> > device=2E Where as
>> > >>>>>>>>>>> in Youssef's case when running in discrete mode there is =
an
>> > nvidia backlight
>> > >>>>>>>>>>> device and in Youssef's case the amdgpu_bl# device never =
works=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 580=
0H
>> > CPU (with iGPU)
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> While the dGPU can be one of:
>> > >>>>>>>>>>> NVIDIA GeForce RTX 3060
>> > >>>>>>>>>>> NVIDIA GeForce GTX 3050 Ti
>> > >>>>>>>>>>> NVIDIA GeForce GTX 3050
>> > >>>>>
>> > >>>
>> > >>>>>>>>>>> I'm guessing that the dynamic-mux mode / nvidia-wmi-ec co=
de
>> > may only
>> > >>>>>>>>>>> be relevant to the model with the 3060 and that nvidia-wm=
i-ec
>> > should
>> > >>>>>>>>>>> maybe not load at all on the model with the 3050 versions=
=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> A quick status update on this=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> Iris (added to the Cc), the reporter with the Dell G15 551=
5
>> > which lead me
>> > >>>>>>>>>> to add the acpi_backlight=3Dnative DMI quirk for the Dell =
G15
>> > 5515 has
>> > >>>>>>>>>> gotten back to me with lspci output on their G15 and it in=
deed
>> > has
>> > >>>>>>>>>> a GTX 3050=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> So atm we have the following models which are affected one=
 way
>> > >>>>>>>>>> or the other:
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> -Acer Predator PH315-55: needs acpi_backlight=3Dnative
>> > >>>>>>>>>> -Dell G15 5515 with RTX 3050: needs acpi_backlight=3Dnativ=
e
>> > >>>>>>>>>> -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=
=3Dnative
>> > :(
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> With the models which need acpi_backlight=3Dnative being b=
roken
>> > >>>>>>>>>> by (false positive) detection of the laptop needing
>> > nvidia-wmi-ec
>> > >>>>>>>>>> for backlight control while they actually should not be us=
ing
>> > that=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> and with the Dell G15 5515 with RTX 3060 atm being broken
>> > because
>> > >>>>>>>>>> of the DMI quirk added to fix the Dell G15 5515 with RTX 3=
050=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>> I've attached a simple kernel module which adds a debugfs f=
ile
>> > that
>> > >>>>>>>>> reports the current mux mode=2E As mentioned elsewhere, I s=
uspect
>> > that the
>> > >>>>>>>>> systems which need the quirk may be in one of the non-dynam=
ic
>> > modes, and
>> > >>>>>>>>> the systems which are broken by the quirk may be in dynamic=
 mux
>> > mode=2E It
>> > >>>>>>>>> should be pretty straightforward to compile this as an
>> > out-of-tree
>> > >>>>>>>>> module using the Kbuild extmod infrastructure, as follows:
>> > >>>>>
>> > >>>
>> > >>>>>>>>> 1) Change to the directory containing the mxdm-debugfs=2Ec =
file
>> > (you may
>> > >>>>>>>>> wish to create an empty directory to put it in) and create =
a
>> > file in
>> > >>>>>>>>> that directory containing the following line:
>> > >>>>>
>> > >>>
>> > >>>>>>>> The name of this file should be 'Kbuild'=2E Sorry for the no=
ise=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>> obj-m +=3D mxdm-debugfs=2Eo
>> > >>>>>
>> > >>>
>> > >>>>>>>>> 2) Build the kernel module:
>> > >>>>>
>> > >>>
>> > >>>>>>>>> make -C /lib/modules/$(uname -r)/source O=3D/lib/modules/$(=
uname
>> > -r)/build M=3D$(pwd)
>> > >>>>>
>> > >>>
>> > >>>>>>>>> (The "source" and "build" paths under /lib/modules/`uname -=
r`
>> > should
>> > >>>>>>>>> be the correct paths in almost all cases; if your system us=
es
>> > >>>>>>>>> different paths, substitute those=2E You will need the deve=
lopment
>> > >>>>>>>>> headers for external kernel modules, and the relevant toolc=
hain
>> > bits,
>> > >>>>>>>>> but if you're already using the NVIDIA proprietary driver y=
ou
>> > almost
>> > >>>>>>>>> certainly already have all of that=2E)
>> > >>>>>
>> > >>>
>> > >>>>>>>>> 3) Load the kernel module:
>> > >>>>>
>> > >>>
>> > >>>>>>>>> insmod =2E/mxdm-debugfs=2Eko
>> > >>>>>
>> > >>>
>> > >>>>>>>>> This should create a file at
>> > /sys/kernel/debug/acpi/mxdm_mux_mode=2E
>> > >>>>>>>>> Reading this file should report the current mux operation m=
ode=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>> While switching mux modes on a dynamic mux system to test t=
his
>> > kernel
>> > >>>>>>>>> module, I noticed that the ACPI tables no longer exposed th=
e
>> > MXDM method
>> > >>>>>>>>> when the mux mode was set to discrete only on that particul=
ar
>> > system=2E
>> > >>>>>>>>> This contradicted the behavior I had previously observed on=
 other
>> > >>>>>>>>> systems; i=2Ee=2E, that MXDM is always available regardless=
 of the
>> > currently
>> > >>>>>>>>> set mux mode, so I tried it on another dynamic mux system a=
nd
>> > observed
>> > >>>>>>>>> that the other system does always expose MXDM regardless of=
 the
>> > mux
>> > >>>>>>>>> mode, and the contents of the debugfs file matched the sele=
cted
>> > mode=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>> So if the module fails to load with ENODEV and prints the "=
MXDM
>> > not
>> > >>>>>>>>> found" message to the kernel log, the system is most likely
>> > configured
>> > >>>>>>>>> to a non-dynamic mux mode=2E My usual expectation is that i=
t
>> > should load
>> > >>>>>>>>> and create the file on most dynamic mux systems=2E I do not=
 have
>> > direct
>> > >>>>>>>>> access to any of the above listed systems at the moment, so=
 I do
>> > not
>> > >>>>>>>>> know whether MXDM will be exposed when the system is not in
>> > dynamic mux
>> > >>>>>>>>> mode=2E
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> Regards,
>> > >>>>>
>> > >>>
>> > >>>>>>>>>> Hans
>> > >>>>>
>> > >>>
>> > >>>>>>>>> // SPDX-License-Identifier: GPL-2=2E0-only
>> > >>>>>>>>> /*
>> > >>>>>>>>> * Copyright (C) 2020 NVIDIA Corporation
>> > >>>>>>>>> *
>> > >>>>>>>>> */
>> > >>>>>
>> > >>>
>> > >>>>>>>>> #include <linux/acpi=2Eh>
>> > >>>>>>>>> #include <acpi/acoutput=2Eh>
>> > >>>>>>>>> #include <linux/module=2Eh>
>> > >>>>>>>>> #include <linux/pci=2Eh>
>> > >>>>>>>>> #include <linux/debugfs=2Eh>
>> > >>>>>
>> > >>>
>> > >>>>>>>>> extern struct dentry *acpi_debugfs_dir;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> enum mux_mode {
>> > >>>>>>>>> MUX_MODE_UNKNOWN =3D 0,
>> > >>>>>>>>> MUX_MODE_INTEGRATED =3D 1, /* iGPU only /
>> > >>>>>>>>> MUX_MODE_DISCRETE =3D 2, / dGPU only /
>> > >>>>>>>>> MUX_MODE_HYBRID =3D 3, / Dual GPU, mux switched to iGPU /
>> > >>>>>>>>> MUX_MODE_DYNAMIC =3D 4, / Dual GPU, dynamic mux switching *=
/
>> > >>>>>>>>> MUX_MODE_MAX
>> > >>>>>>>>> };
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static char * mode_names[] =3D {
>> > >>>>>>>>> [MUX_MODE_UNKNOWN] =3D "unknown\n",
>> > >>>>>>>>> [MUX_MODE_INTEGRATED] =3D "integrated\n",
>> > >>>>>>>>> [MUX_MODE_DISCRETE] =3D "discrete\n",
>> > >>>>>>>>> [MUX_MODE_HYBRID] =3D "hybrid\n",
>> > >>>>>>>>> [MUX_MODE_DYNAMIC] =3D "dynamic\n",
>> > >>>>>>>>> };
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static struct debugfs_blob_wrapper muxmode_blob;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static void store_mux_mode(acpi_handle handle)
>> > >>>>>>>>> {
>> > >>>>>>>>> union acpi_object arg =3D { =2Einteger =3D { =2Etype =3D
>> > ACPI_TYPE_INTEGER, =2Evalue =3D 0 } };
>> > >>>>>>>>> struct acpi_object_list in =3D { =2Ecount =3D 1, =2Epointer=
 =3D &arg };
>> > >>>>>
>> > >>>
>> > >>>>>>>>> acpi_integer ret;
>> > >>>>>>>>> acpi_status status;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> status =3D acpi_evaluate_integer(handle, "MXDM", &in, &ret)=
;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> if (ACPI_FAILURE(status)) {
>> > >>>>>>>>> acpi_handle_err(handle, "ACPI MXDM failed: %s\n",
>> > acpi_format_exception(status));
>> > >>>>>>>>> muxmode_blob=2Edata =3D mode_names[MUX_MODE_UNKNOWN];
>> > >>>>>>>>> } else if (ret < MUX_MODE_UNKNOWN || ret >=3D MUX_MODE_MAX)=
 {
>> > >>>>>>>>> acpi_handle_err(handle, "Mux mode value out of range");
>> > >>>>>>>>> muxmode_blob=2Edata =3D mode_names[MUX_MODE_UNKNOWN];
>> > >>>>>>>>> } else {
>> > >>>>>>>>> muxmode_blob=2Edata =3D mode_names[ret];
>> > >>>>>>>>> }
>> > >>>>>
>> > >>>
>> > >>>>>>>>> muxmode_blob=2Esize =3D strlen(muxmode_blob=2Edata);
>> > >>>>>>>>> }
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static acpi_status find_mxdm(acpi_handle obj, u32 level, vo=
id
>> > *ctx, void **ret)
>> > >>>>>>>>> {
>> > >>>>>>>>> acpi_handle search;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> if (acpi_get_handle(obj, "MXDM", &search) =3D=3D 0) {
>> > >>>>>>>>> /* Found the parent object of the MXDM method; pass it back
>> > >>>>>>>>> * to the caller and stop searching=2E */
>> > >>>>>>>>> *ret =3D obj;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> return AE_CTRL_TERMINATE;
>> > >>>>>>>>> }
>> > >>>>>
>> > >>>
>> > >>>>>>>>> /* No MXDM; keep looking */
>> > >>>>>>>>> return AE_OK;
>> > >>>>>>>>> }
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static struct dentry *muxmode_file_dentry;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static int __init mxdm_debugfs_init(void)
>> > >>>>>>>>> {
>> > >>>>>>>>> acpi_handle mxdm_handle =3D NULL;
>> > >>>>>>>>> acpi_status ret;
>> > >>>>>
>> > >>>
>> > >>>>>>>>> ret =3D acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJ=
ECT, 5,
>> > >>>>>>>>> find_mxdm, NULL, NULL, &mxdm_handle);
>> > >>>>>
>> > >>>
>> > >>>>>>>>> if (ACPI_FAILURE(ret) || !mxdm_handle) {
>> > >>>>>>>>> pr_err("MXDM not found=2E\n");
>> > >>>>>>>>> return -ENODEV;
>> > >>>>>>>>> }
>> > >>>>>
>> > >>>
>> > >>>>>>>>> /* Populate the blob wrapper: the mux mode cannot change wi=
thout
>> > rebooting
>> > >>>>>>>>> * so this only needs to be done once=2E */
>> > >>>>>>>>> store_mux_mode(mxdm_handle);
>> > >>>>>
>> > >>>
>> > >>>>>>>>> muxmode_file_dentry =3D debugfs_create_blob("mxdm_mux_mode"=
, 0444,
>> > >>>>>>>>> acpi_debugfs_dir,
>> > >>>>>>>>> &muxmode_blob);
>> > >>>>>
>> > >>>
>> > >>>>>>>>> return muxmode_file_dentry ? 0 : -EIO;
>> > >>>>>>>>> }
>> > >>>>>>>>> module_init(mxdm_debugfs_init);
>> > >>>>>
>> > >>>
>> > >>>>>>>>> static void __exit mxdm_debugfs_exit(void)
>> > >>>>>>>>> {
>> > >>>>>>>>> if (muxmode_file_dentry) {
>> > >>>>>>>>> debugfs_remove(muxmode_file_dentry);
>> > >>>>>>>>> muxmode_file_dentry =3D NULL;
>> > >>>>>>>>> }
>> > >>>>>>>>> }
>> > >>>>>>>>> module_exit(mxdm_debugfs_exit);
>> > >>>>>
>> > >>>
>> > >>>>>>>>> MODULE_LICENSE("GPL v2");
>> > >>>>>>>>> MODULE_DESCRIPTION("MXDM mux mode test module");
>> > >>>>>>>>> MODULE_AUTHOR("Daniel Dadap ddadap@nvidia=2Ecom");
>> > >>>>>
>> > >>>
>> > >>>>>>>>> /*
>> > >>>>>>>>> * The mux doesn't have its own ACPI HID/CID, or WMI wrapper=
, so
>> > key off of
>> > >>>>>>>>> * the WMI wrapper for the related WMAA method for backlight
>> > control=2E
>> > >>>>>>>>> */
>> > >>>>>>>>> MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
>> > >>>>
>> > >>>
>> > >>>>
>> > >>>
>> > >>>>
>> > >
>> > >
>> >
