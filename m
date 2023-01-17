Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8433F1
	for <regressions@lists.linux.dev>; Tue, 17 Jan 2023 20:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDw8SMtBrLe7eWkCZ3zrUbShQJ5CbM4n7/LAhajOSgFb8jhjBweSXataJMwMvwHLxUpJKVWL6q1C4MmyoHYsfGJUEj2tn2ag7G86NTrZqOH9FfZ2aDMX9ZlG0KMcuFQS/eFTZNEuaNiehmR7Bu54emR6H78WBcC4cFPYjHi0l0eDEHqd3gNE5u0FeeV6V1mjnICW2gCg31zoQdcofRzbOro5pa6+b10AdXVh8SWdTykTJZcKYnYmkRjpLk+3YZqppipBqqT5ps1ekGxD5+qn45J1JHUi2eyXHNKEf5xwkHNb7qVO/7iPNlOlrnb6OzLCYZPFojI8cYnDK10rwsjdvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bFoAQfn28Une4Z/A2qVXAUO5OzDSsoCXXriAz0aRXA=;
 b=eRafl3bO6SvbkG4Qmo0i6BTmCEPdH3ZgJGPXrhiTCJ806V1KFIs3tldxx4vuZgxWVUJYG8nVVLi8HAoDosfRKVBDYIZUCWeRgHbYL3VhLER9PFUw0FyugcSrdvBm/SBhZ7TNMQTnVwLjttL4RCGJikU2RpdMiZXt9gkoUnR4j652lwURCB7wV2EuHK4kYgyRI9DitOlOLpfWtItVTZ4d1yhjMbKhlePy6SDF6ajMTSdGvcJGqWsX/xiVXbOEYguDOBFfiLEZQQ1CfWASwF5g/ic7BhVbsaG/KoPh5NK7d7yj1PSq6STiwTJFgfr5LyKJYbAFSjrR2JBj8DPW+XJrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bFoAQfn28Une4Z/A2qVXAUO5OzDSsoCXXriAz0aRXA=;
 b=XZSHMSi47tsKeJ9PyM+leHZkEVkGtsmk5iGgTBQ/k35mBmC3zK8+en3GLTTXMwNz7osf5eCENLNtZuymYOt+TZUbLg8F3LPfcS+YhExnXEaPyMEf8XAa/LVN7ywmJDYZWPVnXyH9++5Liy3V1kg6ciVpx9bk2IA4qZx49dsqetgAdZp9+U9V0/pzvfjG0+ivFwAawklZnjDPRBG1OPzah7UGRuPposOaSpbk03uwIy9ZN27BLKC+CaKj0/RvFHqixR7gB4y7bgV0GMIntGrvjOCNG5CdsvMqwnWL5j0CJ7fQzUN1qcER7l+Yvdk6jpYdIBIrtRIpK7FqFL74pIsbdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Tue, 17 Jan 2023 20:56:46 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4%4]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 20:56:46 +0000
Date: Tue, 17 Jan 2023 14:56:43 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Iris <pawel.js@protonmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y8cLiz93syAiiNhb@lenny>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
 <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
Content-Type: multipart/mixed; boundary="5z5v6FXjYJfuags4"
Content-Disposition: inline
In-Reply-To: <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
X-ClientProxiedBy: DS7PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::31) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: f97c96dd-07ba-446d-beb4-08daf8cd585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gWzqVx8tYo3zcfxWNURYBFGxqPimU7wje0adtLf+4LeADkJwoCvWrWgzLeQ5Pvhy6pwXAh+xfFBCzC6sZBasoctaLiQtG/+rsrqr7yZ4FQ1avD2mDDHS153W9C/X7a/pmA2k5tUczONY8cdktuTQhsosqYLmJZ4tmiZekKZT271bJX3te71eWA066QutWw5yMJGJSqIy2EeuBnpgRgV7V1pcQ3SlM71sWAAFN7B+LF7sCqv9bJdSpjpOV476W2gl/iihyth+s4tlUUZmdmJluC5dYuKjKLsIEMUO2E8LTR70cWcCJiZWcB7QoOxlLAGuFOaypDTF3iKGYeBXwmworM5RSFSeePVMD3R0BcVqs4f1Ovqr1Gyow0r/5PKqfErG8xXpQ+siSz1Xf2loI1EYuG2QGQwkZaO39N+g3zYTw5clolp7OUSmZ6ele+krHyTfqE6jQW9gJGFYF718yMk5uo/W9phJCssop7PKxAJosow1GXw5akjJW3K9UQT5TbVH964uPmqT0kT5vXMxJUsgAlfLd7HpZ751LnOubJFjz1nEhOUM57VNRPL5BU/tbTvjKfLFZzplIEB2mw6S1tnLDa1/2EtYuQAHxMwz1aQk3v0FjbDgME98V35ROMwjCXtX+eU0MKafvXiX/B1WlRwFeSRw8yeW1ppjVRU6C/VHB5ZmGK3O2LMoZXPRsGlEEjEliQxJIS49dARvv9Tr5bG3xQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(33716001)(44144004)(26005)(66476007)(41300700001)(66556008)(66946007)(9686003)(8676002)(6512007)(186003)(53546011)(6916009)(4326008)(86362001)(5660300002)(83380400001)(8936002)(235185007)(6666004)(54906003)(478600001)(38100700002)(2906002)(316002)(6506007)(6486002)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2WAtF/dbtZ08gVcvor7bECglY1EX1oRZi72K7ZXJai4PgyWbREmiWlxXNxOT?=
 =?us-ascii?Q?EpSdRPs/VHY4Fq4MwZ8wKqIrTYEBiRWqhOVpnhfzA92k5xm57auvwDG0ryhr?=
 =?us-ascii?Q?Tbw5iYboQPvxiuL5tpKoDhezvsxE+6/wonMYKZbjO18eZth7lV/gm4J5gpnj?=
 =?us-ascii?Q?/clEekdsGOU2Ptkry7B+I/h+8h6SRhJ4tEytWZkCuNj/RdyFFh1AmVb1KLIz?=
 =?us-ascii?Q?a0TWmTmSt+el2/QBsliEqUXiIqZ3Ru/UupNhiio2pyEciDyOlczzjqzPPAsn?=
 =?us-ascii?Q?SF4lCbjgks3sX6HVuf8rwSrQZ2X+zk2/CX8I+ZObP88Kz8F5z5Gap8BA0/zf?=
 =?us-ascii?Q?XCbtgGL5FcHPr1PlNyXHCXeKfSmgABGKbnwQhL801iTSBqsb/fjAazuy+8FK?=
 =?us-ascii?Q?mUnQZQX5wAgtgQCVbJf6sfL9kXXrgQKgmfx9k5DeSMeQ55kW6GOeUdMDo/xy?=
 =?us-ascii?Q?+GtCdLTh3utpsSCQ+DnTZOBe8N0gwGVUXVqETpKE0z2xKbnKfEc6H7ZLWaOs?=
 =?us-ascii?Q?b962VOcDvGaOfIf91ageZYIHyhKbST2pdwXuskDNQIjiVMrIaxu+icSZtb8N?=
 =?us-ascii?Q?KVT8j60oFP95K8K45QLkgFGPhOUh66u0iEPMZ2XzsX1pgjykgCjXsjfKbiD8?=
 =?us-ascii?Q?+NFL/KwBwnXfiPJMmpNuz1gSPnNjgK3dCf0a2WE/J7hP2HN0Yjg+8E3KGt+G?=
 =?us-ascii?Q?44Jp3BrWICf8ggt1cBqKk5HQhtUMEXAduEQg3JL0oVTyVTKU9dDzElnr3KkT?=
 =?us-ascii?Q?eyQf8Mv/ikN4G3kZ5IAPlJ4SkUD+y1abY/TH4oNNgFg6ONElviYuGmLNYypm?=
 =?us-ascii?Q?SqOV1lfsBHqTjYB03jPr54h/Brsz2AwhMXNxoO/Sl44pCbWs7fn+lMn5Usop?=
 =?us-ascii?Q?2xmh/jsWmIJzPe3tXry3sZGGnJN9sopXJI+LbOXTLJCcQ9Tyzrwdb6JD57sg?=
 =?us-ascii?Q?JgunWSCfOuTUTPjXBoePL5DVC91qNe3yiy89pMMabNgH+8SLhOovT0gnRY6U?=
 =?us-ascii?Q?ufpcF8wT3Qgp/sL4xMBsrnG+tajz8FZhWCbuwpEyemFF/x3+7kPngYJSCfnl?=
 =?us-ascii?Q?QrMyCxjCUyKIKOqnFmwR2H6wG8b7w+bnaz3zw90+wty+kakAak6DJp2QoUNe?=
 =?us-ascii?Q?D9P9IFBWY3Bs2eXwsbkkOJvT9m48ru98wrcFgNdZLr3j7kkTfFGJPcMEPia0?=
 =?us-ascii?Q?mVBa0A++gshLK+yNkkBKG4Mx2n4dDdn/+dO4ve9ZqgnfRByEneuiakuCFV4c?=
 =?us-ascii?Q?f7ibsExj5RZIkTVeKg6ibVF6bjMwdr0k5Q8fass90bHeTw6AcrBHWhsj6mjg?=
 =?us-ascii?Q?5pCnGgbwNw9IX1dTqOkTfMOMKvnYhGjirAdjmE+dO6Qk6wxaXkVVtn4T2zW9?=
 =?us-ascii?Q?0Q0p09vaDAn/r6yUACUUsf7qeoJgrz8s8+3elhytYAW+nd1WL3RCqlfYRUE/?=
 =?us-ascii?Q?bzvCEcf9ajO9xKwJCZ+0uMWoSZP3uGBKMUh1+19vVc7348CWwffqdx+Qj/lZ?=
 =?us-ascii?Q?jEPOlkwsNp0fIctDrQtiYQS9dOQjSO48GhMkattBcneJ4SjSF2GsJBE1UXB6?=
 =?us-ascii?Q?qiCl4UrLG6maEl1pwBcPDYnR8xLKriHfpJLMQAjU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97c96dd-07ba-446d-beb4-08daf8cd585b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 20:56:46.2925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kdU6AQDu7x6BQ10lUCCdEiAg5OfcZoVPRzJQ7XfFYbGWHo4Iu3g5QmEN5DDkUDTkUpm3E5MDk9DFDcJtb5C9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

--5z5v6FXjYJfuags4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks, Hans.

On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> Hi All,
> 
> On 1/11/23 10:51, Hans de Goede wrote:
> > Hi,
> > 
> > On 1/11/23 01:40, Daniel Dadap wrote:
> >> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> >>> Hi,
> >>>
> >>> On 1/10/23 16:19, Youssef Aly wrote:
> >>>> Hi Hans,
> >>>>
> >>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> >>>> the kernel commandline for the patched kernel, it doesn't work without it.
> >>>>
> >>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> >>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> >>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> >>>>
> >>>> Hybrid:
> >>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> >>>> amdgpu_bl1.
> >>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> >>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> >>>>
> >>>> Discrete:
> >>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
> >>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
> >>>> same as 80, etc... ,
> >>>> /sys/class/backlight contains nvidia_0.
> >>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> >>>> contains nvidia_wmi_ec_backlight.
> >>>
> >>> Thank you for testing!
> >>>
> >>> Ok so it seems there are 2 issues at play here:
> >>>
> >>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
> >>>    or nvidia_wmi_ec (hybrid mode)
> >>>
> >>> 2. There is a bug in the nvidia binary drivers backlight control in native
> >>>    mode on this system causing the range to be wrong
> >>>
> >>> Daniel, we really need help from NVidia with fixing 1. can you see if
> >>> there is a way to check the BIOS setting/mode from inside the kernel ?
> >>
> >> Yes, the ACPI MXDM method should be able to do this. However, querying
> >> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> >> determine whether the backlight is supposed to be EC-driven, since there
> >> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> >> be orthogonal to whether or not the EC driver should be used. It sounds
> >> like the BIOS is possibly reporting a wrong value for that query.
> >>
> >> I guess we could wire up a quirk that checks MXDM and overrides the
> >> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> >> mux operation mode. Then that quirk could be applied to this system.
> >> I can put together a patch for that.
> > 
> > If you can write a patch for this that would be great, thank you,
> > but I think we first need to root-cause this better:
> > 
> > Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> > to always use the native backlight. So I've gone back to the original email
> > thread which lead to me adding that quirk.
> > 
> > We (I forwarded a mail from you to the reporter this was not on the list)
> > did ask to test with different BIOS settings their to and the reporter's
> > reply was:
> > 
> > "Daniel wanted me to check different GPU modes, but my BIOS has no options
> > for GPU. It's always in hybrid mode with PRIME render offload."
> > 
> > And perhaps even more interesting in their case with acpi_backlight=native
> > to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> > in Youssef's case when running in discrete mode there is an nvidia backlight
> > device and in Youssef's case the amdgpu_bl# device never works.
> > 
> > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> > 
> > While the dGPU can be one of:
> > NVIDIA GeForce RTX 3060
> > NVIDIA GeForce GTX 3050 Ti
> > NVIDIA GeForce GTX 3050
> > 
> > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> > be relevant to the model with the 3060 and that nvidia-wmi-ec should
> > maybe not load at all on the model with the 3050 versions.
> 
> A quick status update on this.
> 
> Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
> to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has 
> gotten back to me with lspci output on their G15 and it indeed has
> a GTX 3050.
> 
> So atm we have the following models which are affected one way
> or the other:
> 
>   -Acer Predator PH315-55: needs acpi_backlight=native
>   -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
>   -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(
> 
> With the models which need acpi_backlight=native being broken
> by (false positive) detection of the laptop needing nvidia-wmi-ec
> for backlight control while they actually should not be using that.
> 
> and with the Dell G15 5515 with RTX 3060 atm being broken because
> of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.

I've attached a simple kernel module which adds a debugfs file that
reports the current mux mode. As mentioned elsewhere, I suspect that the
systems which need the quirk may be in one of the non-dynamic modes, and
the systems which are broken by the quirk may be in dynamic mux mode. It
should be pretty straightforward to compile this as an out-of-tree
module using the Kbuild extmod infrastructure, as follows:

1) Change to the directory containing the mxdm-debugfs.c file (you may
   wish to create an empty directory to put it in) and create a file in
   that directory containing the following line:

   obj-m += mxdm-debugfs.o

2) Build the kernel module:

   make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname -r)/build M=$(pwd)

   (The "source" and "build" paths under /lib/modules/`uname -r` should
   be the correct paths in almost all cases; if your system uses
   different paths, substitute those. You will need the development
   headers for external kernel modules, and the relevant toolchain bits,
   but if you're already using the NVIDIA proprietary driver you almost
   certainly already have all of that.)

3) Load the kernel module:

   insmod ./mxdm-debugfs.ko

This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
Reading this file should report the current mux operation mode.

While switching mux modes on a dynamic mux system to test this kernel
module, I noticed that the ACPI tables no longer exposed the MXDM method
when the mux mode was set to discrete only on that particular system.
This contradicted the behavior I had previously observed on other
systems; i.e., that MXDM is always available regardless of the currently
set mux mode, so I tried it on another dynamic mux system and observed
that the other system does always expose MXDM regardless of the mux
mode, and the contents of the debugfs file matched the selected mode.

So if the module fails to load with ENODEV and prints the "MXDM not
found" message to the kernel log, the system is most likely configured
to a non-dynamic mux mode. My usual expectation is that it should load
and create the file on most dynamic mux systems. I do not have direct
access to any of the above listed systems at the moment, so I do not
know whether MXDM will be exposed when the system is not in dynamic mux
mode.
 
> Regards,
> 
> Hans
> 

--5z5v6FXjYJfuags4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mxdm-debugfs.c"

// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright (C) 2020 NVIDIA Corporation
 *
 */

#include <linux/acpi.h>
#include <acpi/acoutput.h>
#include <linux/module.h>
#include <linux/pci.h>
#include <linux/debugfs.h>

extern struct dentry *acpi_debugfs_dir;

enum mux_mode {
	MUX_MODE_UNKNOWN = 0,
	MUX_MODE_INTEGRATED = 1, /* iGPU only */
	MUX_MODE_DISCRETE = 2,   /* dGPU only */
	MUX_MODE_HYBRID = 3,     /* Dual GPU, mux switched to iGPU */
	MUX_MODE_DYNAMIC = 4,    /* Dual GPU, dynamic mux switching */
	MUX_MODE_MAX
};

static char * mode_names[] = {
	[MUX_MODE_UNKNOWN] = "unknown\n",
	[MUX_MODE_INTEGRATED] = "integrated\n",
	[MUX_MODE_DISCRETE] = "discrete\n",
	[MUX_MODE_HYBRID] = "hybrid\n",
	[MUX_MODE_DYNAMIC] = "dynamic\n",
};

static struct debugfs_blob_wrapper muxmode_blob;

static void store_mux_mode(acpi_handle handle)
{
	union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER, .value = 0 } };
	struct acpi_object_list in = { .count = 1, .pointer = &arg };

	acpi_integer ret;
	acpi_status status;

	status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);

	if (ACPI_FAILURE(status)) {
		acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exception(status));
		muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
	} else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
		acpi_handle_err(handle, "Mux mode value out of range");
		muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
	} else {
		muxmode_blob.data = mode_names[ret];
	}

	muxmode_blob.size = strlen(muxmode_blob.data);
}

static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx, void **ret)
{
	acpi_handle search;

	if (acpi_get_handle(obj, "MXDM", &search) == 0) {
		/* Found the parent object of the MXDM method; pass it back
		 * to the caller and stop searching. */
		*ret = obj;

		return AE_CTRL_TERMINATE;
	}

	/* No MXDM; keep looking */
	return AE_OK;
}

static struct dentry *muxmode_file_dentry;

static int __init mxdm_debugfs_init(void)
{
	acpi_handle mxdm_handle = NULL;
	acpi_status ret;

	ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
					  find_mxdm, NULL, NULL, &mxdm_handle);

	if (ACPI_FAILURE(ret) || !mxdm_handle) {
		pr_err("MXDM not found.\n");
		return -ENODEV;
	}

    /* Populate the blob wrapper: the mux mode cannot change without rebooting
     * so this only needs to be done once. */
	store_mux_mode(mxdm_handle);

	muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
						  acpi_debugfs_dir,
						  &muxmode_blob);

	return muxmode_file_dentry ? 0 : -EIO;
}
module_init(mxdm_debugfs_init);

static void __exit mxdm_debugfs_exit(void)
{
	if (muxmode_file_dentry) {
		debugfs_remove(muxmode_file_dentry);
		muxmode_file_dentry = NULL;
	}
}
module_exit(mxdm_debugfs_exit);

MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("MXDM mux mode test module");
MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");

/*
 * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
 * the WMI wrapper for the related WMAA method for backlight control.
 */
MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");

--5z5v6FXjYJfuags4--
