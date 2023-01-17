Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF2133F1
	for <regressions@lists.linux.dev>; Tue, 17 Jan 2023 21:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbXoG9xDTJsm8moPfcn+mTbw0ufKzHOqhmepd8F66pdG5t6jxRrhnj7nF2lAjPNHE2sfBGaCrObUWtFVzFC3XtYAEI2UsdBtqnHm7w93vMJIuBxV3unH+UyVR63thgCvTBtifBG/qblqzrO3GiNu1e3Be6g7P0xL8O/yN089SiL3+28m1xzYpR81rH0KKmajgGzghazFtD0Lg/KQN0I9XbE52ZzKPRevWwhKEhSu2kfCBWuayEJ6rdYPM7Mnifn0FInXbsVHEV8bJNGMapWkZNsKH+mwUxhsDKDfJkDSoVstb8R8pBXgXCcYU7StQ18yf+kPKTP5kJT5VUm4joi0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCQLhzVGSpmCkclaeaDEy+jPqSQy2UTYIVslbirxook=;
 b=DFt89JBR9QY2iSi629y2hQXj+T/ahp5MD3eFacjwRvKDDCcjLAZaqktOz8Cbdnoj50AkH+m54UjUN76fPoFMyyPO4iQrD5MBBTP1jNroXL8fOxAEBp4VSiRBUeJCh9Vpw/OV3MgvsLuR3hnXubW72CcdF5C0cg72GWDMoIDe0IXC/p7SkScpSKKCeSUwVU8spqsaMGAHs+72sBeM6Te+LY50ZClV1PTcob6ZZImv9Epic0lvUoOqRODy9QhJbCAsup5K94ZDSa1jXBecHWKod4MPmKxkUtA7T9PPBp6CBSdF8nQdyJA6pBJNg2yWMcW9dN9G8r/IdekQ+oy82QaWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCQLhzVGSpmCkclaeaDEy+jPqSQy2UTYIVslbirxook=;
 b=UgYv8ZqZxf7AW6vPwof8ThTZaphOq/io/9U5YyL779dQscarC7AFTWczkwXqiq1WGAm1821wR1PW37kL5OTiFPO7ioxex8dFjVlWM8sCeY9OAQd+XYyRZqP8Rd3TJLujs+v0QLY+glqLOF+7vhZ5nmt1V5zRCuL4gKvNj5zdt8GiK4c/j8cYykIM7FGjDgjOjpM0MYLhanNcisle1TpHeWGA05Ax2bmv7Gjg1RM4bZ+fwny04inOuOTu+bcv/G76Yx0q0LillhaO7YHfz9d80ZwJN74EYbB07ovBU0og9RYXsPrpkFU0IWLksIUT77MsPRX4GQk/za3aZ7FolCmM+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB4928.namprd12.prod.outlook.com (2603:10b6:5:1b8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Tue, 17 Jan 2023 21:24:53 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4%4]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 21:24:53 +0000
Date: Tue, 17 Jan 2023 15:24:50 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Iris <pawel.js@protonmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y8cSInQoeNcQMi03@lenny>
References: <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
 <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
 <Y8cLiz93syAiiNhb@lenny>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8cLiz93syAiiNhb@lenny>
X-ClientProxiedBy: DS7PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:5:3af::8) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|DM6PR12MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: 330b86c7-26be-468d-1eb3-08daf8d14624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NrKLxYZPdQTCv6KEncS4rCcDQbAT4Ebc+wlGGyqMp7+zmVJnQN39XaOoK4b3ndPK365wdMC7q2THsl3RjMkOusD7R27JTy2SOQ2AskX7Q1Q3gFRSO+HBpN4uPRrs33AVLjJkI0D+SIL7f/Co/psp1zYtxXF7S4C2vXMKIolvO+2hbrlTGZbbkgm2XxjIVrgrdAsojj5qYa+Kd/zQt7LclVbCEQr0OiWjwzIhwyjMqh6T8qY/Yf3l6VpY9Cu5hxgIpVbadNY2BxdO3e9M9vX7HnYiw143cgfD1e/fNKsGw09OilWHo2VoRoyxuJq6L53IpRWoFRWZtwtssVaW7/D7O00hP2YsXOvn+LPFj1OKcmu0QqHLXLc6YYK4mtTHqRfLK1t+uWFY5N4sRuFphix27oGbqdFU1Xtm9bWasKcUljYA1llfGuaj5k6eimN/sWAlldKmvbmwCGEZcNuDeniM3PYj5kA/3OHh/9mtt4tey9UY8k5oP+phd+UI03WecG0zBHKATgkRovi6qSJVAgHfaq0Gm4pxFisNozMsKs+FqHAvLp+coJpTpPoxE1esG+Et1Mf0AN6U3T419Gm9oD5fE+ZEVPMUJn1h22gXIjuF4ZPHguK99vzpzTWPZamdemaJ3bBnIMwoPiswe1kot7a7oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(451199015)(478600001)(6486002)(54906003)(9686003)(6512007)(6506007)(26005)(53546011)(30864003)(316002)(5660300002)(41300700001)(6916009)(66556008)(8936002)(8676002)(4326008)(66946007)(66476007)(2906002)(186003)(38100700002)(86362001)(33716001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jo7wcKtld9+mqgDVROi4POIfhjy8JjLsJ+ztxZVkLtiig84W+Gzu+qhRXZBE?=
 =?us-ascii?Q?pJLM1B/TQYhR1HG1mX/KAW6Eu5QPzzqIUFUkYp1Ne3pp/A3YjZjFqWy6t0tt?=
 =?us-ascii?Q?tVC6WTZ1RddnSzuNy+fgKr0kbzTbyStTT4RxbNQNLrNcwglqEmE8nrZ64TJE?=
 =?us-ascii?Q?zz2t48lMPdxFacPmAtup4aAIsmH4sWsW0X2rBGkZOf1G2jk5l++NORZJL6DR?=
 =?us-ascii?Q?Enlm3OrQ4PWyRC/XMy4xohiRlYejFHfCbiV6kv+6J61F0XywWMGd6qAe5MNI?=
 =?us-ascii?Q?sdvd3r2pwruAEqvG0CzdbB4neasBqp/UWN7IFSLIuLseDeDJCoBeTCRnsnHY?=
 =?us-ascii?Q?DnW/dtp+mOVyUSiMPUX7kdi1u3IqSXh+tiMu2v9oclOy2ZQ+BXI3bEG1AuZQ?=
 =?us-ascii?Q?bTgzOubQG4PRSoFQkqsSIWlyJvDfPQtBl+0JKFuu9aOPEYKZ1rPxX7askel4?=
 =?us-ascii?Q?Q9srtoFCOjR87AighMK8hfoKsDz8oWwJOWVTfAWDb2fPwevnxyLgBdcNL8W7?=
 =?us-ascii?Q?HpFXgVrP3wUWPb/DLf1FXg7j37bqDLwdGnJeJ1M9KAIUOPI8DwqcnCyYnLDx?=
 =?us-ascii?Q?QHsrMD5hKTzJo7tBq9LCVzC2iFlLMb6CCkRWzhntAzNxQjq6sPU6yVCb4uPf?=
 =?us-ascii?Q?wU9zrDlTRSo3u9SUasVww7Pj7am9kymx+exae7yjJbRhG5zGJsa39dVg8OkW?=
 =?us-ascii?Q?cqX5n1hOQ1ckYQ6ICKQ+UE9IiWQHiO7N0G1a+eCuFaP2q3Jpe4LHhr1MKvKt?=
 =?us-ascii?Q?msq5mcFbmVm9W6Hb5N5kqnYXevVr099ph58sMZZn7g81dEe5iJ8e7a1/uaD0?=
 =?us-ascii?Q?nQ0ikEW7oT0c43NE0ZPqdmDvpGNVckAfoy9v97k12YIRz9IrjNDCAUf4woql?=
 =?us-ascii?Q?pxFeH0xMFNqprGZinP0w1LMhmP0mKgDodelOu9mFxlrha8x82hphjnRn8D6W?=
 =?us-ascii?Q?B63vOIovJ4Yl0oQn44oCf+AWzrRWrSCOvqYiQcjC5Hv2ZdTWg1/AhBdoLSpO?=
 =?us-ascii?Q?xv9eBUyahUSUWMGFpVsjYx0vWEr3KBotyKFtOMRw9Gx8elsZXGFT43e4YBss?=
 =?us-ascii?Q?5i1Y0th7dIPyNsAoXoLAJBqx1sTV6LdbX6wV1Oa7NhyUGK507Bei7tQjCVbj?=
 =?us-ascii?Q?GaeBdCq6BaCjAPRqutfxbzcCj0XDRGTS6bktf8tTZkTy5Hxz1k1AeZyaOcFc?=
 =?us-ascii?Q?Dxi4S9r5k8gyCiZnJOTpvNGdT5mCbqkSDA2xhBwNdz5K2EnhpWy+MDfh25ln?=
 =?us-ascii?Q?FAarvWw3by5ACLQafbYTJ25AFZ4ODXkST8TOc9OSFfZ9DVQbdk92qSr7LzAN?=
 =?us-ascii?Q?7fSWSd2IoMV0gNtXv1+b9lzP8I4RqRHDKdgEGSDermAa/JFqMj5+h2ZxMQUx?=
 =?us-ascii?Q?Z3WnB9W95Rf1Wx87Ml45nQQ9/VZ34Tsgh7a8HiAMlYflc94O/CKpN3aD9Juz?=
 =?us-ascii?Q?cdnGy91yK1/LAGiABZ5dLGSDpmQMlm4dYxa2MiLklyHcFlum8Oeg+nwmTHGY?=
 =?us-ascii?Q?oojJfB60GGzN0fsq9UvMVwtFqMPHU0/nUhjL2Qlu+ILbB/NM/IPVK5DNDoMj?=
 =?us-ascii?Q?rD3Ad29895yZrPSqhQ1fSEu8jl5czHg9xNIPjDKk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330b86c7-26be-468d-1eb3-08daf8d14624
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 21:24:53.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhmXFTSBe45Koit9RARNgqKweg012Ek7v9xt20xarcMlHnTK7Ws4QPpCEqWQXn3ecTNMoRAQ70+wpuWuQ53H+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4928

Hans pointed out a crucial omission in the build instructions in a
different thread where I also shared this test module:

On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> Thanks, Hans.
> 
> On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > Hi All,
> > 
> > On 1/11/23 10:51, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 1/11/23 01:40, Daniel Dadap wrote:
> > >> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> > >>> Hi,
> > >>>
> > >>> On 1/10/23 16:19, Youssef Aly wrote:
> > >>>> Hi Hans,
> > >>>>
> > >>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > >>>> the kernel commandline for the patched kernel, it doesn't work without it.
> > >>>>
> > >>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > >>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> > >>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> > >>>>
> > >>>> Hybrid:
> > >>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > >>>> amdgpu_bl1.
> > >>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > >>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > >>>>
> > >>>> Discrete:
> > >>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
> > >>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
> > >>>> same as 80, etc... ,
> > >>>> /sys/class/backlight contains nvidia_0.
> > >>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > >>>> contains nvidia_wmi_ec_backlight.
> > >>>
> > >>> Thank you for testing!
> > >>>
> > >>> Ok so it seems there are 2 issues at play here:
> > >>>
> > >>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
> > >>>    or nvidia_wmi_ec (hybrid mode)
> > >>>
> > >>> 2. There is a bug in the nvidia binary drivers backlight control in native
> > >>>    mode on this system causing the range to be wrong
> > >>>
> > >>> Daniel, we really need help from NVidia with fixing 1. can you see if
> > >>> there is a way to check the BIOS setting/mode from inside the kernel ?
> > >>
> > >> Yes, the ACPI MXDM method should be able to do this. However, querying
> > >> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> > >> determine whether the backlight is supposed to be EC-driven, since there
> > >> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> > >> be orthogonal to whether or not the EC driver should be used. It sounds
> > >> like the BIOS is possibly reporting a wrong value for that query.
> > >>
> > >> I guess we could wire up a quirk that checks MXDM and overrides the
> > >> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> > >> mux operation mode. Then that quirk could be applied to this system.
> > >> I can put together a patch for that.
> > > 
> > > If you can write a patch for this that would be great, thank you,
> > > but I think we first need to root-cause this better:
> > > 
> > > Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> > > to always use the native backlight. So I've gone back to the original email
> > > thread which lead to me adding that quirk.
> > > 
> > > We (I forwarded a mail from you to the reporter this was not on the list)
> > > did ask to test with different BIOS settings their to and the reporter's
> > > reply was:
> > > 
> > > "Daniel wanted me to check different GPU modes, but my BIOS has no options
> > > for GPU. It's always in hybrid mode with PRIME render offload."
> > > 
> > > And perhaps even more interesting in their case with acpi_backlight=native
> > > to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> > > in Youssef's case when running in discrete mode there is an nvidia backlight
> > > device and in Youssef's case the amdgpu_bl# device never works.
> > > 
> > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> > > 
> > > While the dGPU can be one of:
> > > NVIDIA GeForce RTX 3060
> > > NVIDIA GeForce GTX 3050 Ti
> > > NVIDIA GeForce GTX 3050
> > > 
> > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> > > be relevant to the model with the 3060 and that nvidia-wmi-ec should
> > > maybe not load at all on the model with the 3050 versions.
> > 
> > A quick status update on this.
> > 
> > Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
> > to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has 
> > gotten back to me with lspci output on their G15 and it indeed has
> > a GTX 3050.
> > 
> > So atm we have the following models which are affected one way
> > or the other:
> > 
> >   -Acer Predator PH315-55: needs acpi_backlight=native
> >   -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
> >   -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(
> > 
> > With the models which need acpi_backlight=native being broken
> > by (false positive) detection of the laptop needing nvidia-wmi-ec
> > for backlight control while they actually should not be using that.
> > 
> > and with the Dell G15 5515 with RTX 3060 atm being broken because
> > of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> 
> I've attached a simple kernel module which adds a debugfs file that
> reports the current mux mode. As mentioned elsewhere, I suspect that the
> systems which need the quirk may be in one of the non-dynamic modes, and
> the systems which are broken by the quirk may be in dynamic mux mode. It
> should be pretty straightforward to compile this as an out-of-tree
> module using the Kbuild extmod infrastructure, as follows:
> 
> 1) Change to the directory containing the mxdm-debugfs.c file (you may
>    wish to create an empty directory to put it in) and create a file in
>    that directory containing the following line:

The name of this file should be 'Kbuild'. Sorry for the noise.

>    obj-m += mxdm-debugfs.o
> 
> 2) Build the kernel module:
> 
>    make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname -r)/build M=$(pwd)
> 
>    (The "source" and "build" paths under /lib/modules/`uname -r` should
>    be the correct paths in almost all cases; if your system uses
>    different paths, substitute those. You will need the development
>    headers for external kernel modules, and the relevant toolchain bits,
>    but if you're already using the NVIDIA proprietary driver you almost
>    certainly already have all of that.)
> 
> 3) Load the kernel module:
> 
>    insmod ./mxdm-debugfs.ko
> 
> This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
> Reading this file should report the current mux operation mode.
> 
> While switching mux modes on a dynamic mux system to test this kernel
> module, I noticed that the ACPI tables no longer exposed the MXDM method
> when the mux mode was set to discrete only on that particular system.
> This contradicted the behavior I had previously observed on other
> systems; i.e., that MXDM is always available regardless of the currently
> set mux mode, so I tried it on another dynamic mux system and observed
> that the other system does always expose MXDM regardless of the mux
> mode, and the contents of the debugfs file matched the selected mode.
> 
> So if the module fails to load with ENODEV and prints the "MXDM not
> found" message to the kernel log, the system is most likely configured
> to a non-dynamic mux mode. My usual expectation is that it should load
> and create the file on most dynamic mux systems. I do not have direct
> access to any of the above listed systems at the moment, so I do not
> know whether MXDM will be exposed when the system is not in dynamic mux
> mode.
>  
> > Regards,
> > 
> > Hans
> > 

> // SPDX-License-Identifier: GPL-2.0-only
> /*
>  * Copyright (C) 2020 NVIDIA Corporation
>  *
>  */
> 
> #include <linux/acpi.h>
> #include <acpi/acoutput.h>
> #include <linux/module.h>
> #include <linux/pci.h>
> #include <linux/debugfs.h>
> 
> extern struct dentry *acpi_debugfs_dir;
> 
> enum mux_mode {
> 	MUX_MODE_UNKNOWN = 0,
> 	MUX_MODE_INTEGRATED = 1, /* iGPU only */
> 	MUX_MODE_DISCRETE = 2,   /* dGPU only */
> 	MUX_MODE_HYBRID = 3,     /* Dual GPU, mux switched to iGPU */
> 	MUX_MODE_DYNAMIC = 4,    /* Dual GPU, dynamic mux switching */
> 	MUX_MODE_MAX
> };
> 
> static char * mode_names[] = {
> 	[MUX_MODE_UNKNOWN] = "unknown\n",
> 	[MUX_MODE_INTEGRATED] = "integrated\n",
> 	[MUX_MODE_DISCRETE] = "discrete\n",
> 	[MUX_MODE_HYBRID] = "hybrid\n",
> 	[MUX_MODE_DYNAMIC] = "dynamic\n",
> };
> 
> static struct debugfs_blob_wrapper muxmode_blob;
> 
> static void store_mux_mode(acpi_handle handle)
> {
> 	union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER, .value = 0 } };
> 	struct acpi_object_list in = { .count = 1, .pointer = &arg };
> 
> 	acpi_integer ret;
> 	acpi_status status;
> 
> 	status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> 
> 	if (ACPI_FAILURE(status)) {
> 		acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exception(status));
> 		muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> 	} else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
> 		acpi_handle_err(handle, "Mux mode value out of range");
> 		muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> 	} else {
> 		muxmode_blob.data = mode_names[ret];
> 	}
> 
> 	muxmode_blob.size = strlen(muxmode_blob.data);
> }
> 
> static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx, void **ret)
> {
> 	acpi_handle search;
> 
> 	if (acpi_get_handle(obj, "MXDM", &search) == 0) {
> 		/* Found the parent object of the MXDM method; pass it back
> 		 * to the caller and stop searching. */
> 		*ret = obj;
> 
> 		return AE_CTRL_TERMINATE;
> 	}
> 
> 	/* No MXDM; keep looking */
> 	return AE_OK;
> }
> 
> static struct dentry *muxmode_file_dentry;
> 
> static int __init mxdm_debugfs_init(void)
> {
> 	acpi_handle mxdm_handle = NULL;
> 	acpi_status ret;
> 
> 	ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> 					  find_mxdm, NULL, NULL, &mxdm_handle);
> 
> 	if (ACPI_FAILURE(ret) || !mxdm_handle) {
> 		pr_err("MXDM not found.\n");
> 		return -ENODEV;
> 	}
> 
>     /* Populate the blob wrapper: the mux mode cannot change without rebooting
>      * so this only needs to be done once. */
> 	store_mux_mode(mxdm_handle);
> 
> 	muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
> 						  acpi_debugfs_dir,
> 						  &muxmode_blob);
> 
> 	return muxmode_file_dentry ? 0 : -EIO;
> }
> module_init(mxdm_debugfs_init);
> 
> static void __exit mxdm_debugfs_exit(void)
> {
> 	if (muxmode_file_dentry) {
> 		debugfs_remove(muxmode_file_dentry);
> 		muxmode_file_dentry = NULL;
> 	}
> }
> module_exit(mxdm_debugfs_exit);
> 
> MODULE_LICENSE("GPL v2");
> MODULE_DESCRIPTION("MXDM mux mode test module");
> MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> 
> /*
>  * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
>  * the WMI wrapper for the related WMAA method for backlight control.
>  */
> MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");

