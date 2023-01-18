Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C372163
	for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 00:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKIPa/zOtOuBCwexmXRaClQ28XN23Y5JHYMFH5JR7ZmRKqHbW9msaVmY5x0IsKfE4A/GX/Tv1EYbuwRGjpNOqKbZgSalWPOYZsiX6so9rM1RQhRaa5y7MoqZ+r0yOeT0yMu7wJxNLDr4KoAftgeH2HCIgyZAg8ooGk4AHbp7Iwg4QQeVoC70ts8H4fe/cRG/9+Ce+yyIJ+66KAws3EJ7Cbz5/noK59x6oINmPczyT8g8abAf0+GPEp4m70uAwKNk7fKeVeV36de/SaetPpnj9JLUxkcdKDt4o9cyn2Ha6iAMtOdiFi65cYxE4nteWtVrerAoQ/RzMTHwC1mcxGjHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ynk7axNwPVX6R1NIM/uwBqHdXelIXp1y8QyLgDApCU=;
 b=dRmrOAMPTxWo/P+iB4YzpQPvXx+w8H/x8yE6f0bcJSu6jdo/m2hEPlQi9KBrlAj40/EnTAr2pJ6F0SGvT5OAWfprk2FcRJLrKK7RQk+jgjT9fKzDreHBQSLieIzpmmx5V+olAcuxgAyTLoKwL+vGtfsT+w6p2qdHR7EQsO2jc4ehZABiXD1/x1/Fgm8QlkD4R2EaCeU4IjjXuVATQiME+42MkJa/iym6/sUcmCtQIrUGj3bGPYp0lvZf0kgabLmP7TLLtK6czmf0O/lHL5UI725vLpVNClPYO+JTrwNJM0G18AoR416XJrsAJ7DkaZbqzO1/wqKaej4MGOEv8Pwh8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ynk7axNwPVX6R1NIM/uwBqHdXelIXp1y8QyLgDApCU=;
 b=DnkpiaKo+or4eiaEgZwIo/wLP5pd2eQRP2KFdaQsyBaN0LmAOWk3gA8LhDIEQG47QRcIB+M/QQ8JRIoBGEepNbdT505B9cPb4XKEZNZDJLdL6+pqKLj51kiQodA7f4JuEtagcD/9aSWKUYrFNrIHWCV1QEuWGlWS4orgLf+vpSBcFVUQFbmFnOr7D63oKW2F2Frk3EPVolh+NmAilVy8vSseq0o+UBQhOrkwyclkgvtDyYtXkNqFhkwk0V6KzlRPFlKO43c62XOTE27iH67NbmClKkRqLl6MihjuvwtMUe9QxdBRIPCNk9Xw7iMdqJg7o5m8rBXSodvdBFfNzg8haQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 00:20:56 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4%4]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 00:20:56 +0000
Date: Tue, 17 Jan 2023 18:20:52 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Youssef Aly <youssefaswad@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Iris <pawel.js@protonmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y8c7ZN6PZhYcUYUk@lenny>
References: <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
 <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
 <Y8cLiz93syAiiNhb@lenny>
 <Y8cSInQoeNcQMi03@lenny>
 <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com>
X-ClientProxiedBy: SA9PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:806:24::13) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 9195318c-acbe-484c-3e3a-08daf8e9ddc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cgmWNitfPJImzq7L3G1N467VLKLWXWIUZ3wmWEyQG4xJ2dGWY8QhKfrUXYwtNmDF9GN4SwxWq6J1nSODhy68BQI4EgN5Wa56AyyEeBa94X+dawqlcFRGyaN5de1PDVSOzIVt9m82ARgeOByOCWuRIpBSvZnbk2baZitjdoZMt2/MrfaxpUbXIBaAdOocErf4TQ4KWvy6g4d1xuWVSqS0B8nqz1LHz8XY0cTUaaZOI/Iow4Oia4sS15vQ4nfaK2rTCCRxQBCSSvy45SbyjjrCWy3o08MRWYapd5ZYUWrK+0XYjDlYsj2nnsYH506h7InvBMGSlTcpfQACr5g1zLJoUlwQRPwMhCI6nT1I/+3JHOC5MUnuKEcK/piikxG4sQhgJzGo5/sikv/9tvx7MRwW+qhxUwA6Sn9QVizxs02ikMbkYDxXgOq1WC3L01SDLB17UjQ3lqQqMoAYf9udndLhFAW86/dSRco4SSFXaA5qNncbItNTWjssPmEV2UAy99uNFfmOKIgVX/B4lfyQtUGZnRgB6Ra02eiC4TN0hUTRdOMf6imqNbzw7Q0rrLtb9RYOMD6TrBBvKB8C9osgGBqJ3N/w5+WTC4IaRuj4iLSE0/S9f70bYzr111PlYH7fCc32io8SjgS1/RKUB1Nj8cFbCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(54906003)(186003)(6916009)(4326008)(26005)(8676002)(66476007)(66556008)(316002)(66946007)(478600001)(6506007)(41300700001)(8936002)(5660300002)(6666004)(30864003)(83380400001)(2906002)(53546011)(6512007)(9686003)(38100700002)(6486002)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3e/u/baLRMsaWa7nBJj14K95m9/tIT3wxsZe2kf0gdDY09FUK3oCbPJNUlmP?=
 =?us-ascii?Q?tr2vglPGQo1XEZq9/lZUEslnZ0FFrTOPWpDvxanDKk5uANOEI7gEelD0PZQj?=
 =?us-ascii?Q?q4Rei8zKEn4SvhAACdt6Jnt086mBp73LhreWessv2Xu8X1zEoHz7loyU7tDr?=
 =?us-ascii?Q?srdhhhGlsZ9DVTTbHROrlvRTyRuxvw28nYOJLuFLRkC7C+53UgyNHkLlMZLx?=
 =?us-ascii?Q?CyvIlO13mUE/lKof1yKuy7cRONc5iiCegudPpKGN4Y3unpfgfSgW6sy8oNDS?=
 =?us-ascii?Q?jlYmhq6aVhQl7V3fBNzm8B3hw5KUdVXDYG4GKGbFDHjCe/3DBnanNzQEu4c3?=
 =?us-ascii?Q?BWVGnHQTjdTnf5tq2+lqv2ge+3zEc5Fy4CBdvVw3Bhg1KO2keRe2sn1WTvrf?=
 =?us-ascii?Q?JiR4De8sO5tVVXYrUWXolxf1BNXB3Y2V0+UeObYnj/EYhsjG/4tyTPlKyl28?=
 =?us-ascii?Q?D47eTpNBqKnRI26HhRLT/7nu51hDq3TkfeWRHIXp/L73+0i04Sr1RuAegh5z?=
 =?us-ascii?Q?ShKkg19botpjCM5CLXZC3iufKg6ki/onpseX54VLjYxckAY+jx1P8VZovpvX?=
 =?us-ascii?Q?qiMyYNAvrywcT8to7P41OcZrGqzKxO7kaUAJoY6p8QS88bViVnH/ntG0X6/k?=
 =?us-ascii?Q?ZZ16bfpfRHZscFmpSjz6DOCvwh6qDJ6FJU0ywXE4oszXiYnODG3fQxbI2/y5?=
 =?us-ascii?Q?AZ05/juGQzqnjrXMbIXWwDki6TtzgCRa7UlcdbXT0ZvFySY+MrugSirEvbYD?=
 =?us-ascii?Q?zJt0IWsH0vvvGcnq/pjmtFQg8D9GLS7Q601PTM3uInp4UETBuwl+pEEMJaR1?=
 =?us-ascii?Q?mJNxT5KTTXwDees34rePoahFfxXsd2TAvvuHHF1NAmYfMhi0FPOPq7rikb2l?=
 =?us-ascii?Q?cgpkbVqKY8jMwMyZ056qE3Z8qzpki7MIahO1q2ciqTcpIUpQKPMjjyGj5Kws?=
 =?us-ascii?Q?RVBUxPDXrVD/tI9PE1hafVeRODGLXw4QYbu8C63zRxXiLMhpxFDyxzNPLsRy?=
 =?us-ascii?Q?ybttPjEnLVuhF/21oVqeLh0g9ipWI3c+B1fzS/Uqa85M717KR7Ijx7F+Unhp?=
 =?us-ascii?Q?3F+7ZgtD1ZgScFneowx/Yjff823KObfleuvFt8BjMs6wga9s/eHCVzxIC45K?=
 =?us-ascii?Q?z5dA9BnpCh8AxhIwQgzSvl/SXTAzsY7L9UXsiBUuhWy45NVNXYuZoWyRKCrU?=
 =?us-ascii?Q?HXfQopeK3H5LmlbVjqxu+0kbl5qSPvhG+bJDnPAnmLrwGDbu55My+BjKN5cw?=
 =?us-ascii?Q?sax6EKtVnG0MWC/LaMKOFNTCyJgROv7Jw7qUfOMgvmF0NCUGAuRxnGX5EOsS?=
 =?us-ascii?Q?q25AwsmXY5Z/RsWzfRAXpbrwL+z5r/uLyM36pQZTrDqgsqiTsVfpNEALFtmy?=
 =?us-ascii?Q?XVwFQDU1EMzTLfiTaPq7DA9QVN4MvBHy+kFzXSp5fWbyQ9oY2TbNVrRAS2jV?=
 =?us-ascii?Q?22vD4Tdi05O2RgQDvgOxBzqVXbIkBYLqqipU3UMZfnKN5pTSu+RR4IRNAQmF?=
 =?us-ascii?Q?MpIWialHr0ph7TTsUYUCVNBc0izrBA3WHMg5QTUg7SEdzulR9lMR+86rx0Pf?=
 =?us-ascii?Q?+F0fa/WFiNIm9XhuFHLadmZgajvf6udHQARr4h0/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9195318c-acbe-484c-3e3a-08daf8e9ddc8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 00:20:56.0958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6u+ikYnxAQlpcqWWzZBCyXD5Y8nD3tTnYbnMqCMKSOSx7NqkcUWmoWiND+GiAeJP3HiD4Bg4p0pO3FFkkTedQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202

On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
>  Hello Daniel,
> 
> I tried building the module using the instructions you provided, but
> ran into some problems as I didn't have the /lib/modules/$(uname
> -r)/source directory on my end.
> I created a Makefile in a directory containing mxdm-debugfs.c file and
> added the following to it:
> 
> obj-m += mxdm-debugfs.o
> 
> all:
>     make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
> 
> clean:
>     make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> 
> I then ran "make" and loaded the module.

Ah, yes, I should have mentioned specifically that the instructions
assumed either a split Kbuild configuration with separate source and
output directories, or a single combined source and output directory but
with "source" and "build" both being symlinks to the same directory. I
forget which distros do what exactly, but some ship a combined
source/output directory but only have one of either "source" or "build";
yours appears to be the latter configuration. I'm glad you were able to
get it building anyway.
 
> 1) Hybrid mode set to "Enabled" from the bios settings,
> /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
> 2) Hybrid mode set to "Disabled" from the bios settings,
> /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.

Okay. This is consistent with my expectations. If we also find that the
systems which require the quirk report either "discrete", "hybrid", or
"integrated" (IIUC those systems do not have the mode configurable in the
UEFI settings), then I think we can fix the quirk by checking the mux
mode and only forcing to native if the system is not in hybrid mode.

Or perhaps we should just get rid of the quirk, and unconditionally test
the mux mode, and avoid using nvidia-wmi-ec-backlight on systems which
are not in "dynamic" mode, regardless of whether they expose the WMI EC
backlight interface and regardless of whether that interface reports
that the EC backlight driver should be used. (On the systems that need
the quirk, that interface is reporting that the backlight should be
EC-controlled even when it shouldn't be.) I *think* that in theory, it
should be possible for a system design to require EC backlight control
even when the mux is in a non-dynamic mode, but in practice I don't know
why anybody would do that, and am not aware of any systems which do so
(although until the report of the broken backlight on the 3050 version
of the Dell G15 5515, I wasn't aware of any systems that reported EC
backlight control when it was supposed to be native.)

Hans, I think the most reasonable options are:

1) Remove the quirk, and check for MXDM when deciding whether a system
should use the EC backlight driver. This has the disadvantage of adding
a check where one isn't actually needed on some (most?) systems, and the
advantage of most likely avoiding the need to add quirks for other
systems where the system reports EC backlight control when native should
be used. It also has the possibility of being wrong on a theoretically
possible configuration, although if we ever encounter such a
configuration we could handle it with a quirk or find some other way to
distinguish between systems that do or do not require the EC backlight
driver.

2) Keep the existing quirk, and only force to native if MXDM is missing
or if MXDM reports that the system is in a non-dynamic mode.

I'm inclined to go with (2), because it seems "safer", but am happy to
implement (1) if you think that's the better option. For the MXDM check
I think the first thing to do is to check whether the MXDM method is
present at all: as observed on at least one system, there is no MXDM
method when the system is in non-dynamic mode. Then if MXDM is present,
check whether it reports that the mux is in dynamic mode. For (1), only
query the WMI-wrapped API to determine the backlight control source if
the mux is in dynamic mode. For (2), only force the backlight to native
if the mux is not in dynamic mode.

This, again, assumes that none of the systems which require the quirk
report that the mux is in dynamic mode. If any of them do, we will need
to find a different way to determine which systems are lying about how
the backlight is supposed to be controlled.

> Regards,
> 
> Youssef
> 
> 
> On Tue, 17 Jan 2023 at 23:24, Daniel Dadap <ddadap@nvidia.com> wrote:
> >
> > Hans pointed out a crucial omission in the build instructions in a
> > different thread where I also shared this test module:
> >
> > On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > > Thanks, Hans.
> > >
> > > On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > > > Hi All,
> > > >
> > > > On 1/11/23 10:51, Hans de Goede wrote:
> > > > > Hi,
> > > > >
> > > > > On 1/11/23 01:40, Daniel Dadap wrote:
> > > > >> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> > > > >>> Hi,
> > > > >>>
> > > > >>> On 1/10/23 16:19, Youssef Aly wrote:
> > > > >>>> Hi Hans,
> > > > >>>>
> > > > >>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > > > >>>> the kernel commandline for the patched kernel, it doesn't work without it.
> > > > >>>>
> > > > >>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > > > >>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> > > > >>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> > > > >>>>
> > > > >>>> Hybrid:
> > > > >>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > > > >>>> amdgpu_bl1.
> > > > >>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > > > >>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > > > >>>>
> > > > >>>> Discrete:
> > > > >>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
> > > > >>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
> > > > >>>> same as 80, etc... ,
> > > > >>>> /sys/class/backlight contains nvidia_0.
> > > > >>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > > > >>>> contains nvidia_wmi_ec_backlight.
> > > > >>>
> > > > >>> Thank you for testing!
> > > > >>>
> > > > >>> Ok so it seems there are 2 issues at play here:
> > > > >>>
> > > > >>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
> > > > >>>    or nvidia_wmi_ec (hybrid mode)
> > > > >>>
> > > > >>> 2. There is a bug in the nvidia binary drivers backlight control in native
> > > > >>>    mode on this system causing the range to be wrong
> > > > >>>
> > > > >>> Daniel, we really need help from NVidia with fixing 1. can you see if
> > > > >>> there is a way to check the BIOS setting/mode from inside the kernel ?
> > > > >>
> > > > >> Yes, the ACPI MXDM method should be able to do this. However, querying
> > > > >> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> > > > >> determine whether the backlight is supposed to be EC-driven, since there
> > > > >> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> > > > >> be orthogonal to whether or not the EC driver should be used. It sounds
> > > > >> like the BIOS is possibly reporting a wrong value for that query.
> > > > >>
> > > > >> I guess we could wire up a quirk that checks MXDM and overrides the
> > > > >> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> > > > >> mux operation mode. Then that quirk could be applied to this system.
> > > > >> I can put together a patch for that.
> > > > >
> > > > > If you can write a patch for this that would be great, thank you,
> > > > > but I think we first need to root-cause this better:
> > > > >
> > > > > Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> > > > > to always use the native backlight. So I've gone back to the original email
> > > > > thread which lead to me adding that quirk.
> > > > >
> > > > > We (I forwarded a mail from you to the reporter this was not on the list)
> > > > > did ask to test with different BIOS settings their to and the reporter's
> > > > > reply was:
> > > > >
> > > > > "Daniel wanted me to check different GPU modes, but my BIOS has no options
> > > > > for GPU. It's always in hybrid mode with PRIME render offload."
> > > > >
> > > > > And perhaps even more interesting in their case with acpi_backlight=native
> > > > > to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> > > > > in Youssef's case when running in discrete mode there is an nvidia backlight
> > > > > device and in Youssef's case the amdgpu_bl# device never works.
> > > > >
> > > > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> > > > >
> > > > > While the dGPU can be one of:
> > > > > NVIDIA GeForce RTX 3060
> > > > > NVIDIA GeForce GTX 3050 Ti
> > > > > NVIDIA GeForce GTX 3050
> > > > >
> > > > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> > > > > be relevant to the model with the 3060 and that nvidia-wmi-ec should
> > > > > maybe not load at all on the model with the 3050 versions.
> > > >
> > > > A quick status update on this.
> > > >
> > > > Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
> > > > to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has
> > > > gotten back to me with lspci output on their G15 and it indeed has
> > > > a GTX 3050.
> > > >
> > > > So atm we have the following models which are affected one way
> > > > or the other:
> > > >
> > > >   -Acer Predator PH315-55: needs acpi_backlight=native
> > > >   -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
> > > >   -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(
> > > >
> > > > With the models which need acpi_backlight=native being broken
> > > > by (false positive) detection of the laptop needing nvidia-wmi-ec
> > > > for backlight control while they actually should not be using that.
> > > >
> > > > and with the Dell G15 5515 with RTX 3060 atm being broken because
> > > > of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> > >
> > > I've attached a simple kernel module which adds a debugfs file that
> > > reports the current mux mode. As mentioned elsewhere, I suspect that the
> > > systems which need the quirk may be in one of the non-dynamic modes, and
> > > the systems which are broken by the quirk may be in dynamic mux mode. It
> > > should be pretty straightforward to compile this as an out-of-tree
> > > module using the Kbuild extmod infrastructure, as follows:
> > >
> > > 1) Change to the directory containing the mxdm-debugfs.c file (you may
> > >    wish to create an empty directory to put it in) and create a file in
> > >    that directory containing the following line:
> >
> > The name of this file should be 'Kbuild'. Sorry for the noise.
> >
> > >    obj-m += mxdm-debugfs.o
> > >
> > > 2) Build the kernel module:
> > >
> > >    make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname -r)/build M=$(pwd)
> > >
> > >    (The "source" and "build" paths under /lib/modules/`uname -r` should
> > >    be the correct paths in almost all cases; if your system uses
> > >    different paths, substitute those. You will need the development
> > >    headers for external kernel modules, and the relevant toolchain bits,
> > >    but if you're already using the NVIDIA proprietary driver you almost
> > >    certainly already have all of that.)
> > >
> > > 3) Load the kernel module:
> > >
> > >    insmod ./mxdm-debugfs.ko
> > >
> > > This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
> > > Reading this file should report the current mux operation mode.
> > >
> > > While switching mux modes on a dynamic mux system to test this kernel
> > > module, I noticed that the ACPI tables no longer exposed the MXDM method
> > > when the mux mode was set to discrete only on that particular system.
> > > This contradicted the behavior I had previously observed on other
> > > systems; i.e., that MXDM is always available regardless of the currently
> > > set mux mode, so I tried it on another dynamic mux system and observed
> > > that the other system does always expose MXDM regardless of the mux
> > > mode, and the contents of the debugfs file matched the selected mode.
> > >
> > > So if the module fails to load with ENODEV and prints the "MXDM not
> > > found" message to the kernel log, the system is most likely configured
> > > to a non-dynamic mux mode. My usual expectation is that it should load
> > > and create the file on most dynamic mux systems. I do not have direct
> > > access to any of the above listed systems at the moment, so I do not
> > > know whether MXDM will be exposed when the system is not in dynamic mux
> > > mode.
> > >
> > > > Regards,
> > > >
> > > > Hans
> > > >
> >
> > > // SPDX-License-Identifier: GPL-2.0-only
> > > /*
> > >  * Copyright (C) 2020 NVIDIA Corporation
> > >  *
> > >  */
> > >
> > > #include <linux/acpi.h>
> > > #include <acpi/acoutput.h>
> > > #include <linux/module.h>
> > > #include <linux/pci.h>
> > > #include <linux/debugfs.h>
> > >
> > > extern struct dentry *acpi_debugfs_dir;
> > >
> > > enum mux_mode {
> > >       MUX_MODE_UNKNOWN = 0,
> > >       MUX_MODE_INTEGRATED = 1, /* iGPU only */
> > >       MUX_MODE_DISCRETE = 2,   /* dGPU only */
> > >       MUX_MODE_HYBRID = 3,     /* Dual GPU, mux switched to iGPU */
> > >       MUX_MODE_DYNAMIC = 4,    /* Dual GPU, dynamic mux switching */
> > >       MUX_MODE_MAX
> > > };
> > >
> > > static char * mode_names[] = {
> > >       [MUX_MODE_UNKNOWN] = "unknown\n",
> > >       [MUX_MODE_INTEGRATED] = "integrated\n",
> > >       [MUX_MODE_DISCRETE] = "discrete\n",
> > >       [MUX_MODE_HYBRID] = "hybrid\n",
> > >       [MUX_MODE_DYNAMIC] = "dynamic\n",
> > > };
> > >
> > > static struct debugfs_blob_wrapper muxmode_blob;
> > >
> > > static void store_mux_mode(acpi_handle handle)
> > > {
> > >       union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER, .value = 0 } };
> > >       struct acpi_object_list in = { .count = 1, .pointer = &arg };
> > >
> > >       acpi_integer ret;
> > >       acpi_status status;
> > >
> > >       status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> > >
> > >       if (ACPI_FAILURE(status)) {
> > >               acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exception(status));
> > >               muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > >       } else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
> > >               acpi_handle_err(handle, "Mux mode value out of range");
> > >               muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > >       } else {
> > >               muxmode_blob.data = mode_names[ret];
> > >       }
> > >
> > >       muxmode_blob.size = strlen(muxmode_blob.data);
> > > }
> > >
> > > static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx, void **ret)
> > > {
> > >       acpi_handle search;
> > >
> > >       if (acpi_get_handle(obj, "MXDM", &search) == 0) {
> > >               /* Found the parent object of the MXDM method; pass it back
> > >                * to the caller and stop searching. */
> > >               *ret = obj;
> > >
> > >               return AE_CTRL_TERMINATE;
> > >       }
> > >
> > >       /* No MXDM; keep looking */
> > >       return AE_OK;
> > > }
> > >
> > > static struct dentry *muxmode_file_dentry;
> > >
> > > static int __init mxdm_debugfs_init(void)
> > > {
> > >       acpi_handle mxdm_handle = NULL;
> > >       acpi_status ret;
> > >
> > >       ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> > >                                         find_mxdm, NULL, NULL, &mxdm_handle);
> > >
> > >       if (ACPI_FAILURE(ret) || !mxdm_handle) {
> > >               pr_err("MXDM not found.\n");
> > >               return -ENODEV;
> > >       }
> > >
> > >     /* Populate the blob wrapper: the mux mode cannot change without rebooting
> > >      * so this only needs to be done once. */
> > >       store_mux_mode(mxdm_handle);
> > >
> > >       muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
> > >                                                 acpi_debugfs_dir,
> > >                                                 &muxmode_blob);
> > >
> > >       return muxmode_file_dentry ? 0 : -EIO;
> > > }
> > > module_init(mxdm_debugfs_init);
> > >
> > > static void __exit mxdm_debugfs_exit(void)
> > > {
> > >       if (muxmode_file_dentry) {
> > >               debugfs_remove(muxmode_file_dentry);
> > >               muxmode_file_dentry = NULL;
> > >       }
> > > }
> > > module_exit(mxdm_debugfs_exit);
> > >
> > > MODULE_LICENSE("GPL v2");
> > > MODULE_DESCRIPTION("MXDM mux mode test module");
> > > MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> > >
> > > /*
> > >  * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
> > >  * the WMI wrapper for the related WMAA method for backlight control.
> > >  */
> > > MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
> >
