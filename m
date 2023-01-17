Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC6EB21
	for <regressions@lists.linux.dev>; Tue, 17 Jan 2023 23:14:07 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso419751pjo.3
        for <regressions@lists.linux.dev>; Tue, 17 Jan 2023 15:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K+jRBdCqwm5qoBKmlYHx8xy+M0MzttHAgiG9DyMI390=;
        b=OqJ5Rvk7f5ENAqNJUuD/KNhPKhJXGb60YV9KqQsdaSj9k0Pcho++FRx0OIqi6lCL13
         gS9buI3JvWENMD+5Ec4w2R4140fJJzw4zdCx9W4YPfwJvjmF7qF3Wp5GzWHJMe2581eQ
         eqBN78xyYOtESMVGghxrbLjIMXF2ba6VKVntOXYQFySkLsvL6eW3wQNXCWEwpPUr3CNX
         8Cphn4ZS2k6fXsEcc6M6ngv9bWM1Eunbdhr95MvkGin/dlfHO+YcRlHReK+SODS+Vxgs
         GADmOAzyltUygBS+6FdydCG/BopdCCSME8lsAUW30MRSkOPO1rK89lM7Iz4en44ruw0e
         Dk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+jRBdCqwm5qoBKmlYHx8xy+M0MzttHAgiG9DyMI390=;
        b=LiQzIsM6CspSKkNDdf3fG40eTxHCUD3Vt+NaxDxiJ7Zqqx2UMSlsTXlje/dnfR/jwO
         MHOevcGRX7Mjsfj6Viz/ZPehU3+EA+S55GrkdmkoPjD9NpmJQdfBv96NBnH5O1VY4iwH
         Hq+uImnWoAt2HwQG44Az8bg3PP9gkGq9ai9CrLmukBz4/AShsYKOsareKxBjaoX8SLuC
         0RHls0FbBQ9t1Mk4hcFg7mg3agjLsoxIgpxJjXovXM8ZX2Sh2iNn3g+5ncsJ+NqJXicX
         WeaDq+5Fc6bLxPoBSaucZ0IlVFsHJzc5G1gSSiRhZG9DZQ2ITn+owEXmawKnztOFSLl8
         Qo0w==
X-Gm-Message-State: AFqh2kpgYRK7M0+xBDpTPcX/eJkPrHGMwfQGsUycdJtbq0QrHxCFhkL0
	0biHsH0sgeUlMFh4Y/s6YMDJVMuJ+Iokl1NfJ58=
X-Google-Smtp-Source: AMrXdXssLqnPxZSIlQBtRZDeKQztPrfZjYwu8BaeDKulTCMyiWpmo4XFvCPGua5MjNYqwqXJ+H2mo/+8K2UK09V4oAA=
X-Received: by 2002:a17:90b:1bc1:b0:229:2df7:c452 with SMTP id
 oa1-20020a17090b1bc100b002292df7c452mr405147pjb.18.1673997246220; Tue, 17 Jan
 2023 15:14:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com> <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com> <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com> <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
 <Y8cLiz93syAiiNhb@lenny> <Y8cSInQoeNcQMi03@lenny>
In-Reply-To: <Y8cSInQoeNcQMi03@lenny>
From: Youssef Aly <youssefaswad@gmail.com>
Date: Wed, 18 Jan 2023 01:13:54 +0200
Message-ID: <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
To: Daniel Dadap <ddadap@nvidia.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Iris <pawel.js@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

 Hello Daniel,

I tried building the module using the instructions you provided, but
ran into some problems as I didn't have the /lib/modules/$(uname
-r)/source directory on my end.
I created a Makefile in a directory containing mxdm-debugfs.c file and
added the following to it:

obj-m += mxdm-debugfs.o

all:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

I then ran "make" and loaded the module.

1) Hybrid mode set to "Enabled" from the bios settings,
/sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
2) Hybrid mode set to "Disabled" from the bios settings,
/sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.

Regards,

Youssef


On Tue, 17 Jan 2023 at 23:24, Daniel Dadap <ddadap@nvidia.com> wrote:
>
> Hans pointed out a crucial omission in the build instructions in a
> different thread where I also shared this test module:
>
> On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > Thanks, Hans.
> >
> > On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > > Hi All,
> > >
> > > On 1/11/23 10:51, Hans de Goede wrote:
> > > > Hi,
> > > >
> > > > On 1/11/23 01:40, Daniel Dadap wrote:
> > > >> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> > > >>> Hi,
> > > >>>
> > > >>> On 1/10/23 16:19, Youssef Aly wrote:
> > > >>>> Hi Hans,
> > > >>>>
> > > >>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > > >>>> the kernel commandline for the patched kernel, it doesn't work without it.
> > > >>>>
> > > >>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > > >>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> > > >>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> > > >>>>
> > > >>>> Hybrid:
> > > >>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > > >>>> amdgpu_bl1.
> > > >>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > > >>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > > >>>>
> > > >>>> Discrete:
> > > >>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
> > > >>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
> > > >>>> same as 80, etc... ,
> > > >>>> /sys/class/backlight contains nvidia_0.
> > > >>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > > >>>> contains nvidia_wmi_ec_backlight.
> > > >>>
> > > >>> Thank you for testing!
> > > >>>
> > > >>> Ok so it seems there are 2 issues at play here:
> > > >>>
> > > >>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
> > > >>>    or nvidia_wmi_ec (hybrid mode)
> > > >>>
> > > >>> 2. There is a bug in the nvidia binary drivers backlight control in native
> > > >>>    mode on this system causing the range to be wrong
> > > >>>
> > > >>> Daniel, we really need help from NVidia with fixing 1. can you see if
> > > >>> there is a way to check the BIOS setting/mode from inside the kernel ?
> > > >>
> > > >> Yes, the ACPI MXDM method should be able to do this. However, querying
> > > >> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> > > >> determine whether the backlight is supposed to be EC-driven, since there
> > > >> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> > > >> be orthogonal to whether or not the EC driver should be used. It sounds
> > > >> like the BIOS is possibly reporting a wrong value for that query.
> > > >>
> > > >> I guess we could wire up a quirk that checks MXDM and overrides the
> > > >> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> > > >> mux operation mode. Then that quirk could be applied to this system.
> > > >> I can put together a patch for that.
> > > >
> > > > If you can write a patch for this that would be great, thank you,
> > > > but I think we first need to root-cause this better:
> > > >
> > > > Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> > > > to always use the native backlight. So I've gone back to the original email
> > > > thread which lead to me adding that quirk.
> > > >
> > > > We (I forwarded a mail from you to the reporter this was not on the list)
> > > > did ask to test with different BIOS settings their to and the reporter's
> > > > reply was:
> > > >
> > > > "Daniel wanted me to check different GPU modes, but my BIOS has no options
> > > > for GPU. It's always in hybrid mode with PRIME render offload."
> > > >
> > > > And perhaps even more interesting in their case with acpi_backlight=native
> > > > to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> > > > in Youssef's case when running in discrete mode there is an nvidia backlight
> > > > device and in Youssef's case the amdgpu_bl# device never works.
> > > >
> > > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> > > >
> > > > While the dGPU can be one of:
> > > > NVIDIA GeForce RTX 3060
> > > > NVIDIA GeForce GTX 3050 Ti
> > > > NVIDIA GeForce GTX 3050
> > > >
> > > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> > > > be relevant to the model with the 3060 and that nvidia-wmi-ec should
> > > > maybe not load at all on the model with the 3050 versions.
> > >
> > > A quick status update on this.
> > >
> > > Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
> > > to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has
> > > gotten back to me with lspci output on their G15 and it indeed has
> > > a GTX 3050.
> > >
> > > So atm we have the following models which are affected one way
> > > or the other:
> > >
> > >   -Acer Predator PH315-55: needs acpi_backlight=native
> > >   -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
> > >   -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(
> > >
> > > With the models which need acpi_backlight=native being broken
> > > by (false positive) detection of the laptop needing nvidia-wmi-ec
> > > for backlight control while they actually should not be using that.
> > >
> > > and with the Dell G15 5515 with RTX 3060 atm being broken because
> > > of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> >
> > I've attached a simple kernel module which adds a debugfs file that
> > reports the current mux mode. As mentioned elsewhere, I suspect that the
> > systems which need the quirk may be in one of the non-dynamic modes, and
> > the systems which are broken by the quirk may be in dynamic mux mode. It
> > should be pretty straightforward to compile this as an out-of-tree
> > module using the Kbuild extmod infrastructure, as follows:
> >
> > 1) Change to the directory containing the mxdm-debugfs.c file (you may
> >    wish to create an empty directory to put it in) and create a file in
> >    that directory containing the following line:
>
> The name of this file should be 'Kbuild'. Sorry for the noise.
>
> >    obj-m += mxdm-debugfs.o
> >
> > 2) Build the kernel module:
> >
> >    make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname -r)/build M=$(pwd)
> >
> >    (The "source" and "build" paths under /lib/modules/`uname -r` should
> >    be the correct paths in almost all cases; if your system uses
> >    different paths, substitute those. You will need the development
> >    headers for external kernel modules, and the relevant toolchain bits,
> >    but if you're already using the NVIDIA proprietary driver you almost
> >    certainly already have all of that.)
> >
> > 3) Load the kernel module:
> >
> >    insmod ./mxdm-debugfs.ko
> >
> > This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
> > Reading this file should report the current mux operation mode.
> >
> > While switching mux modes on a dynamic mux system to test this kernel
> > module, I noticed that the ACPI tables no longer exposed the MXDM method
> > when the mux mode was set to discrete only on that particular system.
> > This contradicted the behavior I had previously observed on other
> > systems; i.e., that MXDM is always available regardless of the currently
> > set mux mode, so I tried it on another dynamic mux system and observed
> > that the other system does always expose MXDM regardless of the mux
> > mode, and the contents of the debugfs file matched the selected mode.
> >
> > So if the module fails to load with ENODEV and prints the "MXDM not
> > found" message to the kernel log, the system is most likely configured
> > to a non-dynamic mux mode. My usual expectation is that it should load
> > and create the file on most dynamic mux systems. I do not have direct
> > access to any of the above listed systems at the moment, so I do not
> > know whether MXDM will be exposed when the system is not in dynamic mux
> > mode.
> >
> > > Regards,
> > >
> > > Hans
> > >
>
> > // SPDX-License-Identifier: GPL-2.0-only
> > /*
> >  * Copyright (C) 2020 NVIDIA Corporation
> >  *
> >  */
> >
> > #include <linux/acpi.h>
> > #include <acpi/acoutput.h>
> > #include <linux/module.h>
> > #include <linux/pci.h>
> > #include <linux/debugfs.h>
> >
> > extern struct dentry *acpi_debugfs_dir;
> >
> > enum mux_mode {
> >       MUX_MODE_UNKNOWN = 0,
> >       MUX_MODE_INTEGRATED = 1, /* iGPU only */
> >       MUX_MODE_DISCRETE = 2,   /* dGPU only */
> >       MUX_MODE_HYBRID = 3,     /* Dual GPU, mux switched to iGPU */
> >       MUX_MODE_DYNAMIC = 4,    /* Dual GPU, dynamic mux switching */
> >       MUX_MODE_MAX
> > };
> >
> > static char * mode_names[] = {
> >       [MUX_MODE_UNKNOWN] = "unknown\n",
> >       [MUX_MODE_INTEGRATED] = "integrated\n",
> >       [MUX_MODE_DISCRETE] = "discrete\n",
> >       [MUX_MODE_HYBRID] = "hybrid\n",
> >       [MUX_MODE_DYNAMIC] = "dynamic\n",
> > };
> >
> > static struct debugfs_blob_wrapper muxmode_blob;
> >
> > static void store_mux_mode(acpi_handle handle)
> > {
> >       union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER, .value = 0 } };
> >       struct acpi_object_list in = { .count = 1, .pointer = &arg };
> >
> >       acpi_integer ret;
> >       acpi_status status;
> >
> >       status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> >
> >       if (ACPI_FAILURE(status)) {
> >               acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exception(status));
> >               muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> >       } else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
> >               acpi_handle_err(handle, "Mux mode value out of range");
> >               muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> >       } else {
> >               muxmode_blob.data = mode_names[ret];
> >       }
> >
> >       muxmode_blob.size = strlen(muxmode_blob.data);
> > }
> >
> > static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx, void **ret)
> > {
> >       acpi_handle search;
> >
> >       if (acpi_get_handle(obj, "MXDM", &search) == 0) {
> >               /* Found the parent object of the MXDM method; pass it back
> >                * to the caller and stop searching. */
> >               *ret = obj;
> >
> >               return AE_CTRL_TERMINATE;
> >       }
> >
> >       /* No MXDM; keep looking */
> >       return AE_OK;
> > }
> >
> > static struct dentry *muxmode_file_dentry;
> >
> > static int __init mxdm_debugfs_init(void)
> > {
> >       acpi_handle mxdm_handle = NULL;
> >       acpi_status ret;
> >
> >       ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> >                                         find_mxdm, NULL, NULL, &mxdm_handle);
> >
> >       if (ACPI_FAILURE(ret) || !mxdm_handle) {
> >               pr_err("MXDM not found.\n");
> >               return -ENODEV;
> >       }
> >
> >     /* Populate the blob wrapper: the mux mode cannot change without rebooting
> >      * so this only needs to be done once. */
> >       store_mux_mode(mxdm_handle);
> >
> >       muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
> >                                                 acpi_debugfs_dir,
> >                                                 &muxmode_blob);
> >
> >       return muxmode_file_dentry ? 0 : -EIO;
> > }
> > module_init(mxdm_debugfs_init);
> >
> > static void __exit mxdm_debugfs_exit(void)
> > {
> >       if (muxmode_file_dentry) {
> >               debugfs_remove(muxmode_file_dentry);
> >               muxmode_file_dentry = NULL;
> >       }
> > }
> > module_exit(mxdm_debugfs_exit);
> >
> > MODULE_LICENSE("GPL v2");
> > MODULE_DESCRIPTION("MXDM mux mode test module");
> > MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> >
> > /*
> >  * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
> >  * the WMI wrapper for the related WMAA method for backlight control.
> >  */
> > MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
>
