Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C868C06
	for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 21:20:41 +0000 (UTC)
Date: Wed, 18 Jan 2023 21:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1674076831; x=1674336031;
	bh=nXOJ9RnfkHeQIooa3IyfU3aprwEira92l5meKENIv20=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YGY9TQ5iuzbgGVOGK4GvGAFhM3ReyrpI0SKIYCR8jEbwqqs6ZS7S+FTqF+kNXWwDy
	 pfycV9toP++A69mtaI86j9oJnEEyI14KXhD9TyULJiEyDmwf/+IkS9dn4IOZbKkpm4
	 2c4ehbwq1zMvypq1Mt/3YAByau3SHbOdSH7aqzKva8XvPUTHn23uE6ZRKFdbxBm3ui
	 dWLmFjp2U/FtcoCJvx+CbCB1nknTkOScOPSxJnRq2qFQBwD9aCP5sjZgs2asscVY+5
	 2ndPGu6V4LMq2hlR9F2NcFPIbdp2TdmE4L2RrlwaCAtalri8AAYDf9b8JWo2MDzsr6
	 J3xpMO5L6pG3Q==
To: Daniel Dadap <ddadap@nvidia.com>
From: Iris <pawel.js@protonmail.com>
Cc: Youssef Aly <youssefaswad@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com>
In-Reply-To: <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com>
References: <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com> <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com> <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com> <Y8cLiz93syAiiNhb@lenny> <Y8cSInQoeNcQMi03@lenny> <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com> <Y8c7ZN6PZhYcUYUk@lenny> <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com> <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com>
Feedback-ID: 39518188:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------00ac0427712937270185673b5ae3baa41c6d0ab2bd9ad43910042e298530e99d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------00ac0427712937270185673b5ae3baa41c6d0ab2bd9ad43910042e298530e99d
Content-Type: multipart/mixed;boundary=---------------------1bc10c94b1b35aca43874c461c0c25aa

-----------------------1bc10c94b1b35aca43874c461c0c25aa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

After loading the updated module, /sys/kernel/debug/acpi/mxds_mux_state re=
ports "integrated".

Now, i ran the command
sudo sh -c "echo discrete > /sys/kernel/debug/acpi/mxds_mux_state"

/sys/kernel/debug/acpi/mxds_mux_state now reads "discrete", but my screen =
didn't turn off... I changed it back to integrated, then to discrete again=
, it seems like nothing happened, or did i do something wrong?


------- Original Message -------
On Wednesday, January 18th, 2023 at 21:41, Daniel Dadap <ddadap@nvidia.com=
> wrote:


> Thanks, Iris:
> =


> On Wed, Jan 18, 2023 at 09:33:19AM +0000, Iris wrote:
> =


> > I have followed Youssef's instructions to build the module, and after =
loading it, /sys/kernel/debug/acpi/mxdm_mux_mode reports "dynamic"
> =


> =


> That is unfortunate. I was hoping it would report a non-dynamic mode, wh=
ich
> would make it easier to disambiguate between G15 5515 models which requi=
re
> EC backlight control and G15 5515 models which require native GPU-driven
> backlight control.
> =


> I have attached an updated version of the test module which will allow y=
ou
> to test if your system does have a dynamic mux. Build and load it the sa=
me
> way as the previous one (unload the previous one first if you haven't do=
ne
> so or rebooted already). This adds /sys/kernel/debug/acpi/mxds_mux_state=
: if
> you see this file, read out its contents. I expect that on your system i=
t
> should report "integrated", since IIUC the amdgpu_bl backlight device is=
 the
> one that works on your system. If you do not see this file, and the mess=
age
> "MXDS not found" appears in your kernel log, then your ACPI table doesn'=
t
> expose the MXDS method, which could be a useful disambiguation test.
> =


> Another experiment to try would be to flip the state of the mux. Before
> attempting this experiment, make sure to save any work and log in remote=
ly
> from another machine, since it is possible that your screen will go blan=
k
> and will need a reboot in order to come back up. To change the mux state=
,
> write the target mux state to the mxds_mux_state file. Use whatever the
> opposite of the current value is, i.e., if it reads out as "integrated",
> then write "discrete", and vice versa. If the mux switch worked, your
> screen should go blank and reading the mxds_mux_state file again should
> reflect the new state. You can then flip the mux back to its original
> position, and you should be able to get the display back by forcing
> DPMS off and then on again. If you're not running X, writing a '0' then
> writing a '1' to /sys/kernel/debug/dri/0/eDP-1/trigger_hotplug seems to
> work on my AMD+NVIDIA system. (The DRI device and eDP connector ID might
> be enumerated differently on your system.) If neither of those work to
> bring your display back up, then reboot the computer.
> =


> The most interesting data would be to check whether MXDS is available in
> your system's ACPI tables, and if so, whether it is actually functional.
> =


> > As mentioned before, this RTX 3050 system does not have configurable G=
PU mode.
> > =


> > ------- Original Message -------
> > On Wednesday, January 18th, 2023 at 01:20, Daniel Dadap ddadap@nvidia.=
com wrote:
> > =


> > > On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
> > =


> > > > Hello Daniel,
> > =


> > > > I tried building the module using the instructions you provided, b=
ut
> > > > ran into some problems as I didn't have the /lib/modules/$(uname
> > > > -r)/source directory on my end.
> > > > I created a Makefile in a directory containing mxdm-debugfs.c file=
 and
> > > > added the following to it:
> > =


> > > > obj-m +=3D mxdm-debugfs.o
> > =


> > > > all:
> > > > make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) modules
> > =


> > > > clean:
> > > > make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) clean
> > =


> > > > I then ran "make" and loaded the module.
> > =


> > > Ah, yes, I should have mentioned specifically that the instructions
> > > assumed either a split Kbuild configuration with separate source and
> > > output directories, or a single combined source and output directory=
 but
> > > with "source" and "build" both being symlinks to the same directory.=
 I
> > > forget which distros do what exactly, but some ship a combined
> > > source/output directory but only have one of either "source" or "bui=
ld";
> > > yours appears to be the latter configuration. I'm glad you were able=
 to
> > > get it building anyway.
> > =


> > > > 1) Hybrid mode set to "Enabled" from the bios settings,
> > > > /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
> > > > 2) Hybrid mode set to "Disabled" from the bios settings,
> > > > /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.
> > =


> > > Okay. This is consistent with my expectations. If we also find that =
the
> > > systems which require the quirk report either "discrete", "hybrid", =
or
> > > "integrated" (IIUC those systems do not have the mode configurable i=
n the
> > > UEFI settings), then I think we can fix the quirk by checking the mu=
x
> > > mode and only forcing to native if the system is not in hybrid mode.
> > =


> > > Or perhaps we should just get rid of the quirk, and unconditionally =
test
> > > the mux mode, and avoid using nvidia-wmi-ec-backlight on systems whi=
ch
> > > are not in "dynamic" mode, regardless of whether they expose the WMI=
 EC
> > > backlight interface and regardless of whether that interface reports
> > > that the EC backlight driver should be used. (On the systems that ne=
ed
> > > the quirk, that interface is reporting that the backlight should be
> > > EC-controlled even when it shouldn't be.) I think that in theory, it
> > > should be possible for a system design to require EC backlight contr=
ol
> > > even when the mux is in a non-dynamic mode, but in practice I don't =
know
> > > why anybody would do that, and am not aware of any systems which do =
so
> > > (although until the report of the broken backlight on the 3050 versi=
on
> > > of the Dell G15 5515, I wasn't aware of any systems that reported EC
> > > backlight control when it was supposed to be native.)
> > =


> > > Hans, I think the most reasonable options are:
> > =


> > > 1) Remove the quirk, and check for MXDM when deciding whether a syst=
em
> > > should use the EC backlight driver. This has the disadvantage of add=
ing
> > > a check where one isn't actually needed on some (most?) systems, and=
 the
> > > advantage of most likely avoiding the need to add quirks for other
> > > systems where the system reports EC backlight control when native sh=
ould
> > > be used. It also has the possibility of being wrong on a theoretical=
ly
> > > possible configuration, although if we ever encounter such a
> > > configuration we could handle it with a quirk or find some other way=
 to
> > > distinguish between systems that do or do not require the EC backlig=
ht
> > > driver.
> > =


> > > 2) Keep the existing quirk, and only force to native if MXDM is miss=
ing
> > > or if MXDM reports that the system is in a non-dynamic mode.
> > =


> > > I'm inclined to go with (2), because it seems "safer", but am happy =
to
> > > implement (1) if you think that's the better option. For the MXDM ch=
eck
> > > I think the first thing to do is to check whether the MXDM method is
> > > present at all: as observed on at least one system, there is no MXDM
> > > method when the system is in non-dynamic mode. Then if MXDM is prese=
nt,
> > > check whether it reports that the mux is in dynamic mode. For (1), o=
nly
> > > query the WMI-wrapped API to determine the backlight control source =
if
> > > the mux is in dynamic mode. For (2), only force the backlight to nat=
ive
> > > if the mux is not in dynamic mode.
> > =


> > > This, again, assumes that none of the systems which require the quir=
k
> > > report that the mux is in dynamic mode. If any of them do, we will n=
eed
> > > to find a different way to determine which systems are lying about h=
ow
> > > the backlight is supposed to be controlled.
> > =


> > > > Regards,
> > =


> > > > Youssef
> > =


> > > > On Tue, 17 Jan 2023 at 23:24, Daniel Dadap ddadap@nvidia.com wrote=
:
> > =


> > > > > Hans pointed out a crucial omission in the build instructions in=
 a
> > > > > different thread where I also shared this test module:
> > =


> > > > > On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > =


> > > > > > Thanks, Hans.
> > =


> > > > > > On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > =


> > > > > > > Hi All,
> > =


> > > > > > > On 1/11/23 10:51, Hans de Goede wrote:
> > =


> > > > > > > > Hi,
> > =


> > > > > > > > On 1/11/23 01:40, Daniel Dadap wrote:
> > =


> > > > > > > > > On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede =
wrote:
> > =


> > > > > > > > > > Hi,
> > =


> > > > > > > > > > On 1/10/23 16:19, Youssef Aly wrote:
> > =


> > > > > > > > > > > Hi Hans,
> > =


> > > > > > > > > > > Yes, I added "acpi_backlight=3Dnvidia_wmi_ec" to
> > > > > > > > > > > the kernel commandline for the patched kernel, it do=
esn't work without it.
> > =


> > > > > > > > > > > I have 2 modes in the bios Hybrid on/off (hybrid / d=
iscrete). I tried
> > > > > > > > > > > the modes with "acpi_backlight=3Dnvidia_wmi_ec" and
> > > > > > > > > > > "acpi_backlight=3Dnative" using the patched kernel (=
v6.1.4):
> > =


> > > > > > > > > > > Hybrid:
> > > > > > > > > > > "acpi_backlight=3Dnative": Does not work, /sys/class=
/backlight contains
> > > > > > > > > > > amdgpu_bl1.
> > > > > > > > > > > "acpi_backlight=3Dnvidia_wmi_ec": Works as expected,
> > > > > > > > > > > /sys/class/backlight contains nvidia_wmi_ec_backligh=
t.
> > =


> > > > > > > > > > > Discrete:
> > > > > > > > > > > "acpi_backlight=3Dnative": Works but when brightness=
 from 0-10 is the
> > > > > > > > > > > same as 0-100, for example 10 is full brightness lik=
e 100, 8 is the
> > > > > > > > > > > same as 80, etc... ,
> > > > > > > > > > > /sys/class/backlight contains nvidia_0.
> > > > > > > > > > > "acpi_backlight=3Dnvidia_wmi_ec": Does not work, /sy=
s/class/backlight
> > > > > > > > > > > contains nvidia_wmi_ec_backlight.
> > =


> > > > > > > > > > Thank you for testing!
> > =


> > > > > > > > > > Ok so it seems there are 2 issues at play here:
> > =


> > > > > > > > > > 1. Depending on the BIOS setting we need to use either=
 native (discrete mode)
> > > > > > > > > > or nvidia_wmi_ec (hybrid mode)
> > =


> > > > > > > > > > 2. There is a bug in the nvidia binary drivers backlig=
ht control in native
> > > > > > > > > > mode on this system causing the range to be wrong
> > =


> > > > > > > > > > Daniel, we really need help from NVidia with fixing 1.=
 can you see if
> > > > > > > > > > there is a way to check the BIOS setting/mode from ins=
ide the kernel ?
> > =


> > > > > > > > > Yes, the ACPI MXDM method should be able to do this. How=
ever, querying
> > > > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canon=
ical way to
> > > > > > > > > determine whether the backlight is supposed to be EC-dri=
ven, since there
> > > > > > > > > are EC-driven and non-EC-driven designs, so the BIOS mod=
e is supposed to
> > > > > > > > > be orthogonal to whether or not the EC driver should be =
used. It sounds
> > > > > > > > > like the BIOS is possibly reporting a wrong value for th=
at query.
> > =


> > > > > > > > > I guess we could wire up a quirk that checks MXDM and ov=
errides the
> > > > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived =
from the current
> > > > > > > > > mux operation mode. Then that quirk could be applied to =
this system.
> > > > > > > > > I can put together a patch for that.
> > =


> > > > > > > > If you can write a patch for this that would be great, tha=
nk you,
> > > > > > > > but I think we first need to root-cause this better:
> > =


> > > > > > > > Currently the Dell G15 5515 is DMI quirked inside: drivers=
/apci/video_detect.c
> > > > > > > > to always use the native backlight. So I've gone back to t=
he original email
> > > > > > > > thread which lead to me adding that quirk.
> > =


> > > > > > > > We (I forwarded a mail from you to the reporter this was n=
ot on the list)
> > > > > > > > did ask to test with different BIOS settings their to and =
the reporter's
> > > > > > > > reply was:
> > =


> > > > > > > > "Daniel wanted me to check different GPU modes, but my BIO=
S has no options
> > > > > > > > for GPU. It's always in hybrid mode with PRIME render offl=
oad."
> > =


> > > > > > > > And perhaps even more interesting in their case with acpi_=
backlight=3Dnative
> > > > > > > > to disable nvidia-wmi-ec they have a working amdgpu_bl# de=
vice. Where as
> > > > > > > > in Youssef's case when running in discrete mode there is a=
n nvidia backlight
> > > > > > > > device and in Youssef's case the amdgpu_bl# device never w=
orks.
> > =


> > > > > > > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800=
H CPU (with iGPU)
> > =


> > > > > > > > While the dGPU can be one of:
> > > > > > > > NVIDIA GeForce RTX 3060
> > > > > > > > NVIDIA GeForce GTX 3050 Ti
> > > > > > > > NVIDIA GeForce GTX 3050
> > =


> > > > > > > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec cod=
e may only
> > > > > > > > be relevant to the model with the 3060 and that nvidia-wmi=
-ec should
> > > > > > > > maybe not load at all on the model with the 3050 versions.
> > =


> > > > > > > A quick status update on this.
> > =


> > > > > > > Iris (added to the Cc), the reporter with the Dell G15 5515 =
which lead me
> > > > > > > to add the acpi_backlight=3Dnative DMI quirk for the Dell G1=
5 5515 has
> > > > > > > gotten back to me with lspci output on their G15 and it inde=
ed has
> > > > > > > a GTX 3050.
> > =


> > > > > > > So atm we have the following models which are affected one w=
ay
> > > > > > > or the other:
> > =


> > > > > > > -Acer Predator PH315-55: needs acpi_backlight=3Dnative
> > > > > > > -Dell G15 5515 with RTX 3050: needs acpi_backlight=3Dnative
> > > > > > > -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=3Dn=
ative :(
> > =


> > > > > > > With the models which need acpi_backlight=3Dnative being bro=
ken
> > > > > > > by (false positive) detection of the laptop needing nvidia-w=
mi-ec
> > > > > > > for backlight control while they actually should not be usin=
g that.
> > =


> > > > > > > and with the Dell G15 5515 with RTX 3060 atm being broken be=
cause
> > > > > > > of the DMI quirk added to fix the Dell G15 5515 with RTX 305=
0.
> > =


> > > > > > I've attached a simple kernel module which adds a debugfs file=
 that
> > > > > > reports the current mux mode. As mentioned elsewhere, I suspec=
t that the
> > > > > > systems which need the quirk may be in one of the non-dynamic =
modes, and
> > > > > > the systems which are broken by the quirk may be in dynamic mu=
x mode. It
> > > > > > should be pretty straightforward to compile this as an out-of-=
tree
> > > > > > module using the Kbuild extmod infrastructure, as follows:
> > =


> > > > > > 1) Change to the directory containing the mxdm-debugfs.c file =
(you may
> > > > > > wish to create an empty directory to put it in) and create a f=
ile in
> > > > > > that directory containing the following line:
> > =


> > > > > The name of this file should be 'Kbuild'. Sorry for the noise.
> > =


> > > > > > obj-m +=3D mxdm-debugfs.o
> > =


> > > > > > 2) Build the kernel module:
> > =


> > > > > > make -C /lib/modules/$(uname -r)/source O=3D/lib/modules/$(una=
me -r)/build M=3D$(pwd)
> > =


> > > > > > (The "source" and "build" paths under /lib/modules/`uname -r` =
should
> > > > > > be the correct paths in almost all cases; if your system uses
> > > > > > different paths, substitute those. You will need the developme=
nt
> > > > > > headers for external kernel modules, and the relevant toolchai=
n bits,
> > > > > > but if you're already using the NVIDIA proprietary driver you =
almost
> > > > > > certainly already have all of that.)
> > =


> > > > > > 3) Load the kernel module:
> > =


> > > > > > insmod ./mxdm-debugfs.ko
> > =


> > > > > > This should create a file at /sys/kernel/debug/acpi/mxdm_mux_m=
ode.
> > > > > > Reading this file should report the current mux operation mode=
.
> > =


> > > > > > While switching mux modes on a dynamic mux system to test this=
 kernel
> > > > > > module, I noticed that the ACPI tables no longer exposed the M=
XDM method
> > > > > > when the mux mode was set to discrete only on that particular =
system.
> > > > > > This contradicted the behavior I had previously observed on ot=
her
> > > > > > systems; i.e., that MXDM is always available regardless of the=
 currently
> > > > > > set mux mode, so I tried it on another dynamic mux system and =
observed
> > > > > > that the other system does always expose MXDM regardless of th=
e mux
> > > > > > mode, and the contents of the debugfs file matched the selecte=
d mode.
> > =


> > > > > > So if the module fails to load with ENODEV and prints the "MXD=
M not
> > > > > > found" message to the kernel log, the system is most likely co=
nfigured
> > > > > > to a non-dynamic mux mode. My usual expectation is that it sho=
uld load
> > > > > > and create the file on most dynamic mux systems. I do not have=
 direct
> > > > > > access to any of the above listed systems at the moment, so I =
do not
> > > > > > know whether MXDM will be exposed when the system is not in dy=
namic mux
> > > > > > mode.
> > =


> > > > > > > Regards,
> > =


> > > > > > > Hans
> > =


> > > > > > // SPDX-License-Identifier: GPL-2.0-only
> > > > > > /*
> > > > > > * Copyright (C) 2020 NVIDIA Corporation
> > > > > > *
> > > > > > */
> > =


> > > > > > #include <linux/acpi.h>
> > > > > > #include <acpi/acoutput.h>
> > > > > > #include <linux/module.h>
> > > > > > #include <linux/pci.h>
> > > > > > #include <linux/debugfs.h>
> > =


> > > > > > extern struct dentry *acpi_debugfs_dir;
> > =


> > > > > > enum mux_mode {
> > > > > > MUX_MODE_UNKNOWN =3D 0,
> > > > > > MUX_MODE_INTEGRATED =3D 1, /* iGPU only /
> > > > > > MUX_MODE_DISCRETE =3D 2, / dGPU only /
> > > > > > MUX_MODE_HYBRID =3D 3, / Dual GPU, mux switched to iGPU /
> > > > > > MUX_MODE_DYNAMIC =3D 4, / Dual GPU, dynamic mux switching */
> > > > > > MUX_MODE_MAX
> > > > > > };
> > =


> > > > > > static char * mode_names[] =3D {
> > > > > > [MUX_MODE_UNKNOWN] =3D "unknown\n",
> > > > > > [MUX_MODE_INTEGRATED] =3D "integrated\n",
> > > > > > [MUX_MODE_DISCRETE] =3D "discrete\n",
> > > > > > [MUX_MODE_HYBRID] =3D "hybrid\n",
> > > > > > [MUX_MODE_DYNAMIC] =3D "dynamic\n",
> > > > > > };
> > =


> > > > > > static struct debugfs_blob_wrapper muxmode_blob;
> > =


> > > > > > static void store_mux_mode(acpi_handle handle)
> > > > > > {
> > > > > > union acpi_object arg =3D { .integer =3D { .type =3D ACPI_TYPE=
_INTEGER, .value =3D 0 } };
> > > > > > struct acpi_object_list in =3D { .count =3D 1, .pointer =3D &a=
rg };
> > =


> > > > > > acpi_integer ret;
> > > > > > acpi_status status;
> > =


> > > > > > status =3D acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> > =


> > > > > > if (ACPI_FAILURE(status)) {
> > > > > > acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_=
exception(status));
> > > > > > muxmode_blob.data =3D mode_names[MUX_MODE_UNKNOWN];
> > > > > > } else if (ret < MUX_MODE_UNKNOWN || ret >=3D MUX_MODE_MAX) {
> > > > > > acpi_handle_err(handle, "Mux mode value out of range");
> > > > > > muxmode_blob.data =3D mode_names[MUX_MODE_UNKNOWN];
> > > > > > } else {
> > > > > > muxmode_blob.data =3D mode_names[ret];
> > > > > > }
> > =


> > > > > > muxmode_blob.size =3D strlen(muxmode_blob.data);
> > > > > > }
> > =


> > > > > > static acpi_status find_mxdm(acpi_handle obj, u32 level, void =
*ctx, void **ret)
> > > > > > {
> > > > > > acpi_handle search;
> > =


> > > > > > if (acpi_get_handle(obj, "MXDM", &search) =3D=3D 0) {
> > > > > > /* Found the parent object of the MXDM method; pass it back
> > > > > > * to the caller and stop searching. */
> > > > > > *ret =3D obj;
> > =


> > > > > > return AE_CTRL_TERMINATE;
> > > > > > }
> > =


> > > > > > /* No MXDM; keep looking */
> > > > > > return AE_OK;
> > > > > > }
> > =


> > > > > > static struct dentry *muxmode_file_dentry;
> > =


> > > > > > static int __init mxdm_debugfs_init(void)
> > > > > > {
> > > > > > acpi_handle mxdm_handle =3D NULL;
> > > > > > acpi_status ret;
> > =


> > > > > > ret =3D acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT=
, 5,
> > > > > > find_mxdm, NULL, NULL, &mxdm_handle);
> > =


> > > > > > if (ACPI_FAILURE(ret) || !mxdm_handle) {
> > > > > > pr_err("MXDM not found.\n");
> > > > > > return -ENODEV;
> > > > > > }
> > =


> > > > > > /* Populate the blob wrapper: the mux mode cannot change witho=
ut rebooting
> > > > > > * so this only needs to be done once. */
> > > > > > store_mux_mode(mxdm_handle);
> > =


> > > > > > muxmode_file_dentry =3D debugfs_create_blob("mxdm_mux_mode", 0=
444,
> > > > > > acpi_debugfs_dir,
> > > > > > &muxmode_blob);
> > =


> > > > > > return muxmode_file_dentry ? 0 : -EIO;
> > > > > > }
> > > > > > module_init(mxdm_debugfs_init);
> > =


> > > > > > static void __exit mxdm_debugfs_exit(void)
> > > > > > {
> > > > > > if (muxmode_file_dentry) {
> > > > > > debugfs_remove(muxmode_file_dentry);
> > > > > > muxmode_file_dentry =3D NULL;
> > > > > > }
> > > > > > }
> > > > > > module_exit(mxdm_debugfs_exit);
> > =


> > > > > > MODULE_LICENSE("GPL v2");
> > > > > > MODULE_DESCRIPTION("MXDM mux mode test module");
> > > > > > MODULE_AUTHOR("Daniel Dadap ddadap@nvidia.com");
> > =


> > > > > > /*
> > > > > > * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, s=
o key off of
> > > > > > * the WMI wrapper for the related WMAA method for backlight co=
ntrol.
> > > > > > */
> > > > > > MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
> =


> =


> =


-----------------------1bc10c94b1b35aca43874c461c0c25aa--

--------00ac0427712937270185673b5ae3baa41c6d0ab2bd9ad43910042e298530e99d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmPIYnAAIQkQxyevYwr31oEWIQQNpfvc9SMjI7EUHp7HJ69j
CvfWgQAnAP9xRX+Ckq9n69zwSHKajn94uwdLXRhSr3oEaqgVkx6YjwEA0Rhz
KNV9HBfGWJ/GZbjEPW7sxjOKzMO4QpHw6vDVLw8=
=rOt0
-----END PGP SIGNATURE-----


--------00ac0427712937270185673b5ae3baa41c6d0ab2bd9ad43910042e298530e99d--

