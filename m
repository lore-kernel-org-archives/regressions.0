Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78EC7B
	for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 09:33:31 +0000 (UTC)
Date: Wed, 18 Jan 2023 09:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1674034403; x=1674293603;
	bh=ZkSsFKrYE67+ZK47SnzVUbHZOeMeNnIpHPANt6YtETQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cy2rUY5/w+RdKFtwpEubGccdsi5Q0Bca0vSvM8ATaK1u/4M4JX7gQeHmcY5pd0rLK
	 nEcUO5xbtpdozNDx6fVDAqzDJ/VGmrIHIvidLm2C5iPHs7KjZax+C9QmagK1UJmzX3
	 4Ame1PqR9cm93CI1X+oU7UKmFiZNYCg2Akvgi0r+sEMuO390Xn0yF9n1lKA3znPs1E
	 CW5g1tUcsG3Doop7RUn9sFR1uEIM281kuxs5fsRTvVhNZz8Trr4tV3jnceM3XlEKSE
	 hPqESNEB2Mrn8aLYC3lXowhliaJ++ZXfbJYzVFiA+9a6SOrfu+YHIRRP66BCxD6ecc
	 SX50YypydS81w==
To: Daniel Dadap <ddadap@nvidia.com>
From: Iris <pawel.js@protonmail.com>
Cc: Youssef Aly <youssefaswad@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com>
In-Reply-To: <Y8c7ZN6PZhYcUYUk@lenny>
References: <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com> <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny> <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com> <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com> <Y8cLiz93syAiiNhb@lenny> <Y8cSInQoeNcQMi03@lenny> <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com> <Y8c7ZN6PZhYcUYUk@lenny>
Feedback-ID: 39518188:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------d0b3e81f920ef2d80ad907e7a45a78b32855fec861469d97da5d110caea9d561"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------d0b3e81f920ef2d80ad907e7a45a78b32855fec861469d97da5d110caea9d561
Content-Type: multipart/mixed;boundary=---------------------99c229783ca4aaa33530bf352791bdd5

-----------------------99c229783ca4aaa33530bf352791bdd5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

I have followed Youssef's instructions to build the module, and after load=
ing it, /sys/kernel/debug/acpi/mxdm_mux_mode reports "dynamic"

As mentioned before, this RTX 3050 system does not have configurable GPU m=
ode.

------- Original Message -------
On Wednesday, January 18th, 2023 at 01:20, Daniel Dadap <ddadap@nvidia.com=
> wrote:


> On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
> =


> > Hello Daniel,
> > =


> > I tried building the module using the instructions you provided, but
> > ran into some problems as I didn't have the /lib/modules/$(uname
> > -r)/source directory on my end.
> > I created a Makefile in a directory containing mxdm-debugfs.c file and
> > added the following to it:
> > =


> > obj-m +=3D mxdm-debugfs.o
> > =


> > all:
> > make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) modules
> > =


> > clean:
> > make -C /lib/modules/$(shell uname -r)/build M=3D$(PWD) clean
> > =


> > I then ran "make" and loaded the module.
> =


> =


> Ah, yes, I should have mentioned specifically that the instructions
> assumed either a split Kbuild configuration with separate source and
> output directories, or a single combined source and output directory but
> with "source" and "build" both being symlinks to the same directory. I
> forget which distros do what exactly, but some ship a combined
> source/output directory but only have one of either "source" or "build";
> yours appears to be the latter configuration. I'm glad you were able to
> get it building anyway.
> =


> > 1) Hybrid mode set to "Enabled" from the bios settings,
> > /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
> > 2) Hybrid mode set to "Disabled" from the bios settings,
> > /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.
> =


> =


> Okay. This is consistent with my expectations. If we also find that the
> systems which require the quirk report either "discrete", "hybrid", or
> "integrated" (IIUC those systems do not have the mode configurable in th=
e
> UEFI settings), then I think we can fix the quirk by checking the mux
> mode and only forcing to native if the system is not in hybrid mode.
> =


> Or perhaps we should just get rid of the quirk, and unconditionally test
> the mux mode, and avoid using nvidia-wmi-ec-backlight on systems which
> are not in "dynamic" mode, regardless of whether they expose the WMI EC
> backlight interface and regardless of whether that interface reports
> that the EC backlight driver should be used. (On the systems that need
> the quirk, that interface is reporting that the backlight should be
> EC-controlled even when it shouldn't be.) I think that in theory, it
> should be possible for a system design to require EC backlight control
> even when the mux is in a non-dynamic mode, but in practice I don't know
> why anybody would do that, and am not aware of any systems which do so
> (although until the report of the broken backlight on the 3050 version
> of the Dell G15 5515, I wasn't aware of any systems that reported EC
> backlight control when it was supposed to be native.)
> =


> Hans, I think the most reasonable options are:
> =


> 1) Remove the quirk, and check for MXDM when deciding whether a system
> should use the EC backlight driver. This has the disadvantage of adding
> a check where one isn't actually needed on some (most?) systems, and the
> advantage of most likely avoiding the need to add quirks for other
> systems where the system reports EC backlight control when native should
> be used. It also has the possibility of being wrong on a theoretically
> possible configuration, although if we ever encounter such a
> configuration we could handle it with a quirk or find some other way to
> distinguish between systems that do or do not require the EC backlight
> driver.
> =


> 2) Keep the existing quirk, and only force to native if MXDM is missing
> or if MXDM reports that the system is in a non-dynamic mode.
> =


> I'm inclined to go with (2), because it seems "safer", but am happy to
> implement (1) if you think that's the better option. For the MXDM check
> I think the first thing to do is to check whether the MXDM method is
> present at all: as observed on at least one system, there is no MXDM
> method when the system is in non-dynamic mode. Then if MXDM is present,
> check whether it reports that the mux is in dynamic mode. For (1), only
> query the WMI-wrapped API to determine the backlight control source if
> the mux is in dynamic mode. For (2), only force the backlight to native
> if the mux is not in dynamic mode.
> =


> This, again, assumes that none of the systems which require the quirk
> report that the mux is in dynamic mode. If any of them do, we will need
> to find a different way to determine which systems are lying about how
> the backlight is supposed to be controlled.
> =


> > Regards,
> > =


> > Youssef
> > =


> > On Tue, 17 Jan 2023 at 23:24, Daniel Dadap ddadap@nvidia.com wrote:
> > =


> > > Hans pointed out a crucial omission in the build instructions in a
> > > different thread where I also shared this test module:
> > > =


> > > On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > > =


> > > > Thanks, Hans.
> > > > =


> > > > On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > > > =


> > > > > Hi All,
> > > > > =


> > > > > On 1/11/23 10:51, Hans de Goede wrote:
> > > > > =


> > > > > > Hi,
> > > > > > =


> > > > > > On 1/11/23 01:40, Daniel Dadap wrote:
> > > > > > =


> > > > > > > On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrot=
e:
> > > > > > > =


> > > > > > > > Hi,
> > > > > > > > =


> > > > > > > > On 1/10/23 16:19, Youssef Aly wrote:
> > > > > > > > =


> > > > > > > > > Hi Hans,
> > > > > > > > > =


> > > > > > > > > Yes, I added "acpi_backlight=3Dnvidia_wmi_ec" to
> > > > > > > > > the kernel commandline for the patched kernel, it doesn'=
t work without it.
> > > > > > > > > =


> > > > > > > > > I have 2 modes in the bios Hybrid on/off (hybrid / discr=
ete). I tried
> > > > > > > > > the modes with "acpi_backlight=3Dnvidia_wmi_ec" and
> > > > > > > > > "acpi_backlight=3Dnative" using the patched kernel (v6.1=
.4):
> > > > > > > > > =


> > > > > > > > > Hybrid:
> > > > > > > > > "acpi_backlight=3Dnative": Does not work, /sys/class/bac=
klight contains
> > > > > > > > > amdgpu_bl1.
> > > > > > > > > "acpi_backlight=3Dnvidia_wmi_ec": Works as expected,
> > > > > > > > > /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > > > > > > > > =


> > > > > > > > > Discrete:
> > > > > > > > > "acpi_backlight=3Dnative": Works but when brightness fro=
m 0-10 is the
> > > > > > > > > same as 0-100, for example 10 is full brightness like 10=
0, 8 is the
> > > > > > > > > same as 80, etc... ,
> > > > > > > > > /sys/class/backlight contains nvidia_0.
> > > > > > > > > "acpi_backlight=3Dnvidia_wmi_ec": Does not work, /sys/cl=
ass/backlight
> > > > > > > > > contains nvidia_wmi_ec_backlight.
> > > > > > > > =


> > > > > > > > Thank you for testing!
> > > > > > > > =


> > > > > > > > Ok so it seems there are 2 issues at play here:
> > > > > > > > =


> > > > > > > > 1. Depending on the BIOS setting we need to use either nat=
ive (discrete mode)
> > > > > > > > or nvidia_wmi_ec (hybrid mode)
> > > > > > > > =


> > > > > > > > 2. There is a bug in the nvidia binary drivers backlight c=
ontrol in native
> > > > > > > > mode on this system causing the range to be wrong
> > > > > > > > =


> > > > > > > > Daniel, we really need help from NVidia with fixing 1. can=
 you see if
> > > > > > > > there is a way to check the BIOS setting/mode from inside =
the kernel ?
> > > > > > > =


> > > > > > > Yes, the ACPI MXDM method should be able to do this. However=
, querying
> > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical=
 way to
> > > > > > > determine whether the backlight is supposed to be EC-driven,=
 since there
> > > > > > > are EC-driven and non-EC-driven designs, so the BIOS mode is=
 supposed to
> > > > > > > be orthogonal to whether or not the EC driver should be used=
. It sounds
> > > > > > > like the BIOS is possibly reporting a wrong value for that q=
uery.
> > > > > > > =


> > > > > > > I guess we could wire up a quirk that checks MXDM and overri=
des the
> > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from=
 the current
> > > > > > > mux operation mode. Then that quirk could be applied to this=
 system.
> > > > > > > I can put together a patch for that.
> > > > > > =


> > > > > > If you can write a patch for this that would be great, thank y=
ou,
> > > > > > but I think we first need to root-cause this better:
> > > > > > =


> > > > > > Currently the Dell G15 5515 is DMI quirked inside: drivers/apc=
i/video_detect.c
> > > > > > to always use the native backlight. So I've gone back to the o=
riginal email
> > > > > > thread which lead to me adding that quirk.
> > > > > > =


> > > > > > We (I forwarded a mail from you to the reporter this was not o=
n the list)
> > > > > > did ask to test with different BIOS settings their to and the =
reporter's
> > > > > > reply was:
> > > > > > =


> > > > > > "Daniel wanted me to check different GPU modes, but my BIOS ha=
s no options
> > > > > > for GPU. It's always in hybrid mode with PRIME render offload.=
"
> > > > > > =


> > > > > > And perhaps even more interesting in their case with acpi_back=
light=3Dnative
> > > > > > to disable nvidia-wmi-ec they have a working amdgpu_bl# device=
. Where as
> > > > > > in Youssef's case when running in discrete mode there is an nv=
idia backlight
> > > > > > device and in Youssef's case the amdgpu_bl# device never works=
.
> > > > > > =


> > > > > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CP=
U (with iGPU)
> > > > > > =


> > > > > > While the dGPU can be one of:
> > > > > > NVIDIA GeForce RTX 3060
> > > > > > NVIDIA GeForce GTX 3050 Ti
> > > > > > NVIDIA GeForce GTX 3050
> > > > > > =


> > > > > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code ma=
y only
> > > > > > be relevant to the model with the 3060 and that nvidia-wmi-ec =
should
> > > > > > maybe not load at all on the model with the 3050 versions.
> > > > > =


> > > > > A quick status update on this.
> > > > > =


> > > > > Iris (added to the Cc), the reporter with the Dell G15 5515 whic=
h lead me
> > > > > to add the acpi_backlight=3Dnative DMI quirk for the Dell G15 55=
15 has
> > > > > gotten back to me with lspci output on their G15 and it indeed h=
as
> > > > > a GTX 3050.
> > > > > =


> > > > > So atm we have the following models which are affected one way
> > > > > or the other:
> > > > > =


> > > > > -Acer Predator PH315-55: needs acpi_backlight=3Dnative
> > > > > -Dell G15 5515 with RTX 3050: needs acpi_backlight=3Dnative
> > > > > -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=3Dnativ=
e :(
> > > > > =


> > > > > With the models which need acpi_backlight=3Dnative being broken
> > > > > by (false positive) detection of the laptop needing nvidia-wmi-e=
c
> > > > > for backlight control while they actually should not be using th=
at.
> > > > > =


> > > > > and with the Dell G15 5515 with RTX 3060 atm being broken becaus=
e
> > > > > of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> > > > =


> > > > I've attached a simple kernel module which adds a debugfs file tha=
t
> > > > reports the current mux mode. As mentioned elsewhere, I suspect th=
at the
> > > > systems which need the quirk may be in one of the non-dynamic mode=
s, and
> > > > the systems which are broken by the quirk may be in dynamic mux mo=
de. It
> > > > should be pretty straightforward to compile this as an out-of-tree
> > > > module using the Kbuild extmod infrastructure, as follows:
> > > > =


> > > > 1) Change to the directory containing the mxdm-debugfs.c file (you=
 may
> > > > wish to create an empty directory to put it in) and create a file =
in
> > > > that directory containing the following line:
> > > =


> > > The name of this file should be 'Kbuild'. Sorry for the noise.
> > > =


> > > > obj-m +=3D mxdm-debugfs.o
> > > > =


> > > > 2) Build the kernel module:
> > > > =


> > > > make -C /lib/modules/$(uname -r)/source O=3D/lib/modules/$(uname -=
r)/build M=3D$(pwd)
> > > > =


> > > > (The "source" and "build" paths under /lib/modules/`uname -r` shou=
ld
> > > > be the correct paths in almost all cases; if your system uses
> > > > different paths, substitute those. You will need the development
> > > > headers for external kernel modules, and the relevant toolchain bi=
ts,
> > > > but if you're already using the NVIDIA proprietary driver you almo=
st
> > > > certainly already have all of that.)
> > > > =


> > > > 3) Load the kernel module:
> > > > =


> > > > insmod ./mxdm-debugfs.ko
> > > > =


> > > > This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
> > > > Reading this file should report the current mux operation mode.
> > > > =


> > > > While switching mux modes on a dynamic mux system to test this ker=
nel
> > > > module, I noticed that the ACPI tables no longer exposed the MXDM =
method
> > > > when the mux mode was set to discrete only on that particular syst=
em.
> > > > This contradicted the behavior I had previously observed on other
> > > > systems; i.e., that MXDM is always available regardless of the cur=
rently
> > > > set mux mode, so I tried it on another dynamic mux system and obse=
rved
> > > > that the other system does always expose MXDM regardless of the mu=
x
> > > > mode, and the contents of the debugfs file matched the selected mo=
de.
> > > > =


> > > > So if the module fails to load with ENODEV and prints the "MXDM no=
t
> > > > found" message to the kernel log, the system is most likely config=
ured
> > > > to a non-dynamic mux mode. My usual expectation is that it should =
load
> > > > and create the file on most dynamic mux systems. I do not have dir=
ect
> > > > access to any of the above listed systems at the moment, so I do n=
ot
> > > > know whether MXDM will be exposed when the system is not in dynami=
c mux
> > > > mode.
> > > > =


> > > > > Regards,
> > > > > =


> > > > > Hans
> > > =


> > > > // SPDX-License-Identifier: GPL-2.0-only
> > > > /*
> > > > * Copyright (C) 2020 NVIDIA Corporation
> > > > *
> > > > */
> > > > =


> > > > #include <linux/acpi.h>
> > > > #include <acpi/acoutput.h>
> > > > #include <linux/module.h>
> > > > #include <linux/pci.h>
> > > > #include <linux/debugfs.h>
> > > > =


> > > > extern struct dentry *acpi_debugfs_dir;
> > > > =


> > > > enum mux_mode {
> > > > MUX_MODE_UNKNOWN =3D 0,
> > > > MUX_MODE_INTEGRATED =3D 1, /* iGPU only /
> > > > MUX_MODE_DISCRETE =3D 2, / dGPU only /
> > > > MUX_MODE_HYBRID =3D 3, / Dual GPU, mux switched to iGPU /
> > > > MUX_MODE_DYNAMIC =3D 4, / Dual GPU, dynamic mux switching */
> > > > MUX_MODE_MAX
> > > > };
> > > > =


> > > > static char * mode_names[] =3D {
> > > > [MUX_MODE_UNKNOWN] =3D "unknown\n",
> > > > [MUX_MODE_INTEGRATED] =3D "integrated\n",
> > > > [MUX_MODE_DISCRETE] =3D "discrete\n",
> > > > [MUX_MODE_HYBRID] =3D "hybrid\n",
> > > > [MUX_MODE_DYNAMIC] =3D "dynamic\n",
> > > > };
> > > > =


> > > > static struct debugfs_blob_wrapper muxmode_blob;
> > > > =


> > > > static void store_mux_mode(acpi_handle handle)
> > > > {
> > > > union acpi_object arg =3D { .integer =3D { .type =3D ACPI_TYPE_INT=
EGER, .value =3D 0 } };
> > > > struct acpi_object_list in =3D { .count =3D 1, .pointer =3D &arg }=
;
> > > > =


> > > > acpi_integer ret;
> > > > acpi_status status;
> > > > =


> > > > status =3D acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> > > > =


> > > > if (ACPI_FAILURE(status)) {
> > > > acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exce=
ption(status));
> > > > muxmode_blob.data =3D mode_names[MUX_MODE_UNKNOWN];
> > > > } else if (ret < MUX_MODE_UNKNOWN || ret >=3D MUX_MODE_MAX) {
> > > > acpi_handle_err(handle, "Mux mode value out of range");
> > > > muxmode_blob.data =3D mode_names[MUX_MODE_UNKNOWN];
> > > > } else {
> > > > muxmode_blob.data =3D mode_names[ret];
> > > > }
> > > > =


> > > > muxmode_blob.size =3D strlen(muxmode_blob.data);
> > > > }
> > > > =


> > > > static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx=
, void **ret)
> > > > {
> > > > acpi_handle search;
> > > > =


> > > > if (acpi_get_handle(obj, "MXDM", &search) =3D=3D 0) {
> > > > /* Found the parent object of the MXDM method; pass it back
> > > > * to the caller and stop searching. */
> > > > *ret =3D obj;
> > > > =


> > > > return AE_CTRL_TERMINATE;
> > > > }
> > > > =


> > > > /* No MXDM; keep looking */
> > > > return AE_OK;
> > > > }
> > > > =


> > > > static struct dentry *muxmode_file_dentry;
> > > > =


> > > > static int __init mxdm_debugfs_init(void)
> > > > {
> > > > acpi_handle mxdm_handle =3D NULL;
> > > > acpi_status ret;
> > > > =


> > > > ret =3D acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> > > > find_mxdm, NULL, NULL, &mxdm_handle);
> > > > =


> > > > if (ACPI_FAILURE(ret) || !mxdm_handle) {
> > > > pr_err("MXDM not found.\n");
> > > > return -ENODEV;
> > > > }
> > > > =


> > > > /* Populate the blob wrapper: the mux mode cannot change without r=
ebooting
> > > > * so this only needs to be done once. */
> > > > store_mux_mode(mxdm_handle);
> > > > =


> > > > muxmode_file_dentry =3D debugfs_create_blob("mxdm_mux_mode", 0444,
> > > > acpi_debugfs_dir,
> > > > &muxmode_blob);
> > > > =


> > > > return muxmode_file_dentry ? 0 : -EIO;
> > > > }
> > > > module_init(mxdm_debugfs_init);
> > > > =


> > > > static void __exit mxdm_debugfs_exit(void)
> > > > {
> > > > if (muxmode_file_dentry) {
> > > > debugfs_remove(muxmode_file_dentry);
> > > > muxmode_file_dentry =3D NULL;
> > > > }
> > > > }
> > > > module_exit(mxdm_debugfs_exit);
> > > > =


> > > > MODULE_LICENSE("GPL v2");
> > > > MODULE_DESCRIPTION("MXDM mux mode test module");
> > > > MODULE_AUTHOR("Daniel Dadap ddadap@nvidia.com");
> > > > =


> > > > /*
> > > > * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so ke=
y off of
> > > > * the WMI wrapper for the related WMAA method for backlight contro=
l.
> > > > */
> > > > MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
-----------------------99c229783ca4aaa33530bf352791bdd5--

--------d0b3e81f920ef2d80ad907e7a45a78b32855fec861469d97da5d110caea9d561
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmPHvMEAIQkQxyevYwr31oEWIQQNpfvc9SMjI7EUHp7HJ69j
CvfWgVogAQDXQs8YC1iLDrVHpJSP8a7o5UXFCVQUOLORjMnsRgnVVQD9EqTY
20xSCyhquh3hJMXW21oUt+H/60icV+DSNbsWugo=
=/gQc
-----END PGP SIGNATURE-----


--------d0b3e81f920ef2d80ad907e7a45a78b32855fec861469d97da5d110caea9d561--

