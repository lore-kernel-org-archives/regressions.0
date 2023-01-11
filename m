Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3C23A6
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 22:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDFojJC9x1TrBIFBgVVFeXhNoy69FyGjgxsddT2GSaCqZSA7vV8JL6TVe2/hfGT8fK+UtgA44J3GjX0EfEsIA+oBdhOavV5GJntGHo6oZ8CsWotfoDuq2fzRp2AX06SQxfidfxiodzLP585MeHmKvbxN6BGrJjqhY5LsngqtqA1hozBf20TmfHTq7WkgESFMLE53Rc/gPYKMWPur5q2rJxOM/X0YAjcuCBNY575lEzVMVASysgyhNt7wwAA6LtrDcMo3NRxbRufmzBaa0sPfILXit+ooWOsyyAEEFWp8pwLDAYXDjD5Kq7SDr2JDVWiUef/Fm1KKs6ajO/IcrHXkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HN4+fQ1Az2tHq1zNKNKavjHuXKTvzMT3RxSToe77ToU=;
 b=PfehAGsxcBZs8LfSlSKI4WsbgHl4M1/w17lobkPobTBT0Av7nnudEWoxEKVOV6NBz6viHCrCJmGKcNg0X03UGfxZY1fsEaRsvGvunIe8dYsu4x5dQMi0m4SR+x7+X0gu6mr91B90YmxN9McPUGbw8IABhxJ/uACBNXr+gA578S9yx3sSFthH9tgjY5R8MITB81/Vx4Fm7ky702QhA3qmaA+KL6ZpbWJL9yAw+GJ7Uc+ltf3bHLEmasyYOxfQp26AldPtb7HmrSq8QelD1r/dCiuU9LLZBRHfNnOLpSk3zGfK3vzIUPT1SlOPsu0+5DZ3CU7OnREoBaARftnMiayaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HN4+fQ1Az2tHq1zNKNKavjHuXKTvzMT3RxSToe77ToU=;
 b=M92ur3CPncDd+A5lR1w1XBcUYz1b936kppcvGmVGT9cBfzFm3jwSB76Hdy2eaRGTKTX8CpJcYQgyX+geTOy7tYXyVUSOEE2dAsAwo85hIHITf5CghnETU9tQOWawQabuWTOVArQc31eYpsN7pfAr7VUp0RlRJDPPJlsDwPn9s9I4kcaCIPpVQJtW1a7E83xTgofJO5NTdxteAjbthbsXuS/s1FmdvyAtu2nwkF1s3miSWBtRth6/vuNZMrnE3KWRKcU742mAh1Mqs/ltV91Qter6v+F/NdK4QW81iEB8rKvPBY6flwAMUD6bGtW3/Exegcd82fhIFEZslSJSK4vT7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 22:35:03 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 22:35:03 +0000
Date: Wed, 11 Jan 2023 16:35:00 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y785lBG/AIdHBB0C@lenny>
References: <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
 <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <CAKsK3Ak7sXf2CFoJDA_fV=jPrzqmA5dn3C-CK9o__KNN+rwpYg@mail.gmail.com>
 <2bdc1039-0e5c-f0a9-c247-748b03e0cb74@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bdc1039-0e5c-f0a9-c247-748b03e0cb74@redhat.com>
X-ClientProxiedBy: SA0PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:806:d0::31) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: cbec3183-6973-4a33-6662-08daf4241506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qOhb4GQV9QjGybLhkthk+1PpZUKxdBxC2oGP1S9y+y92mnFVus0OjIwBvbu+cTwGcrhqcltendZmEnKkY4ZiGZyxX3raJY5WTGyoimTfzguI68Bc3Ffyuqf9rMnipiKOmyk05Jk1pem8qJCVGiEd2Y+NqgLnA5tFZT/gRYLEHcTmqzUWaoBA8AAg7Bl+nERUABiQ7YobwSsV2yiELIOGZK8ahXBGzFYmdN1sIfIYyGVnwhpJ3FysvSk9am1z3IACGlwq7J2O+lACUG1UmbLgzBgdbVe6/AhUT+DGFWts7lmB1vIOjPi7dLnlI8gfq6BKun2ohx/aJnVZq90KhIc/zs1iFPyaN76MR4toT8AvPoAlrJ3+NjqgJbGW+U82yjgtlG0CZeYwWb2AnAncao6pdx3w7KqtguCBQV7sE/V14e+CvDLLvaf5ASyE1G8FGGLhIZTWrZM1zV3RnCWPpmSkjLilZvbNOutlH7tbNjSJdMEL4K9eRQkaOZOIMCb0PQUYBa6quvj+Jaa4fcvrNrT1yQJT4SsWuvrqgRIskK6D6yjBOT1kSO0+vgkuN05UmhmXGpTx0CrLnDLdFE2lXuOCYMvjDSQ+78YdUoGVVZ3ZqPCUMBb0P7h9pFjy4k1olHnafzJD4cxs4F0N89lBnnOPj8rac+Af87vhsiHyskMo4Si/Fc02CDdIf8XM0E6XEq4lxhQTZCpymrY+pP6hgJl0kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(53546011)(2906002)(6506007)(9686003)(6512007)(966005)(26005)(478600001)(186003)(6486002)(54906003)(6916009)(316002)(66946007)(66556008)(8676002)(66476007)(4326008)(41300700001)(30864003)(33716001)(8936002)(38100700002)(83380400001)(86362001)(5660300002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hvJVRaXDyD6lXZ6VkdKdPphyn3vIupaMYCZ9DXFHBniSL29H/vN/aCsF4X7V?=
 =?us-ascii?Q?mRi16hF5jga6i7YWlAuKutPLMfmmytMV0sXZIj7z4EnxiJEC/svq6y/53TeK?=
 =?us-ascii?Q?Ho36WZoD89/Th5o6Fo77cdE5T731aNa59ej7ahOL50JwyuYNj+OHKn0R7dSv?=
 =?us-ascii?Q?wzRXZb1C9BSwBiL9t8kbqkx415rmuO7kZViFMLqQhHgsY8fehLbqM4EOzeR9?=
 =?us-ascii?Q?mSMuffYIbdh6j8Dbya7WnYYCOgmwlLAlO+aFhgfrHkC0Rm7h153YsF/iOiXN?=
 =?us-ascii?Q?jIlWVgR7tZ1SEtoA+Y+BtaiR0p2DB6yKTNyh2bhRbOJfKBm8iXAxZNoxgEan?=
 =?us-ascii?Q?4I5W8drRlpe81sE6VHtJPNYrvEyUAA/6ABKVRczeL1hK41sJrRPGhCx654qK?=
 =?us-ascii?Q?i3xOXyicsGC3fHc0HTDtrQX7mVUQv+rcMR8Qxl4fwUV0AzS6S/2cb2BUKlr0?=
 =?us-ascii?Q?DbpA2DuyR7CAg9JQGsygdGMoorE8OW01lBAjfo+FC8BUReGHU4tOJj/zhZDO?=
 =?us-ascii?Q?+bL+SVRqinHRKrBnWSIA58cKXpaw3iluP6KDaQ0kSbH+8YYWjOrSr4eD5KCC?=
 =?us-ascii?Q?9aOT5MxKbQfIqLWX1gtel1WwfUK1k+/u4uWPLlMMNyHBZ+4IgVS/KpQi03c5?=
 =?us-ascii?Q?hlVCtYkr6+dljiahplkXTg2P/ANnl6tO4HzFL9gwkVfoxrEtqc49cHmerqgN?=
 =?us-ascii?Q?gsz4TYCBaAvyquD6GUG12H0CGb+wWvzApzEq2JqXzo+wGqmNTomMJSpFRGTZ?=
 =?us-ascii?Q?M93aZ3UiUiElhSJAuvhA6WnxjY6B8CXqjxbaarJens7Ve/tC09e+7WeqoJRl?=
 =?us-ascii?Q?9fchushihVcmKY7xXG1IktcoEj/aaeIGVvNz5HeuevCmmUsvWeHI/jteCp9A?=
 =?us-ascii?Q?YtGC4RxIKLscZvYz/yOmdyiR78h0Y2TjBNC+BMV9iod3wdyn8PFmb0BpUWVU?=
 =?us-ascii?Q?A79jbxk8EO3ILrXIEcv78xZDmpVchTIZaSn2VBancBw7x2gjGETAx7ddx2Sp?=
 =?us-ascii?Q?8xqPGCCnAo2vTTeKtohrZUXVVlvIbmjDw0elYDaTIlHiew3x5X/Bq/sR34qj?=
 =?us-ascii?Q?4BJYsr/l+6tMI4uyFQQzMAcI7l0K/b9RC2fXoIvvHaniqkz0wWG9ovw7AWVE?=
 =?us-ascii?Q?gMo6kCAJBJDO7cPwqz0ELmcKyCJGDrrFXubZDxJfGkNCv6OFnIRDN3ECM9ch?=
 =?us-ascii?Q?gu9Cu3ObXNQ6kcrhnc18CRJrOfT9Y2scKCciqlFtxlfuy0M1VkyiViuCyUuP?=
 =?us-ascii?Q?GaLLkdd1ehrrMJTsffwdWuPtM2L7E31CYsRtksKduOBPhpn8dCbWUWfayjXm?=
 =?us-ascii?Q?/p08sLbcWj4YfpNSkcr+72GbZAE47oFi+vNrDICX6V4FP6FalcUTitoQmjHT?=
 =?us-ascii?Q?PLRhgg+qIiw2lUKceEGSApgsUzYgR90eMXWnjVUS+/EBcFEPB8wjQyzZwg5a?=
 =?us-ascii?Q?9nDfOi747DktgOOdppqoBxh3M613LTqwjGmUffaHJ4wNoi9fMGWqEnZEKNOx?=
 =?us-ascii?Q?FhNUb/8K6SbFe8yrdVfcKQZdzivKyX7O4qOhrs5pcuTrphHrvePrptmrPX7x?=
 =?us-ascii?Q?Zk77ABDA2G3jtUhFncMOgG1yablvhJ6E+q11jPjS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbec3183-6973-4a33-6662-08daf4241506
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 22:35:03.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqtDWj5pmJ4nSdYF7H9TtKAT8S6i2OPNsbnmnSXpyaWtx72kOpxTAcKNe728alT8wEW+dS5/VzrHW8CkZSTBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874

On Wed, Jan 11, 2023 at 01:45:53PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/11/23 11:42, Youssef Aly wrote:
> > Hello,
> > 
> > Testing with no "acpi_backlight" in the kernel commandline. Hybrid
> > mode works, "nvidia_wmi_ec_backlight" is used. Discrete mode also
> > works with the range issue mentioned earlier, "nvidia_0" is used.
> 
> Great so without the quirk for you everything works, and from
> your lspci output I see you have a GTX 3060:
> 
> > 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106M
> > [GeForce RTX 3060 Mobile / Max-Q] [10de:2560] (rev a1)
> 
> I suspect that the reporter for who the quirk was added has a 3050
> and that to fix this we need to ignore nvidia-wmi-ec support
> on laptops with a 3050.
> 
> I'm waiting for the report for who the quirk was added to provide
> lspci output on their laptop. I'll report the results of that
> once I have them.
> 
> Daniel, 2 questions:
> 
> 1. Can you confirm that nvidia-wmi-ec should not be used with
> the 3050 (mobile) GPU generation ?

3050 and 3060 are both from the same GPU generation. From what I recall
about the original reason this quirk was added, there was an apparent
system firmware bug where the ACPI interface for querying the backlight
source was reporting that the backlight was EC-controlled even though it
was actually GPU-controlled. AFAIK either the 3050 or the 3060 could be
configured for either GPU or EC backlight control, so I am not certain
whether checking to see which particular GPU is present would help.
 
> 2. Any nice and clean ideas for checking for the presence
> of a 3050 for the drivers/acpi/video_detect.c code ?
> Note I think it is probably better to check for a 3050 (variant)
> then for the newer models since the newer models is going to
> be an ever growing list of models.

I'm hoping that the difference between the system that this quirk was
added for (let's call it quirk-fix) and the system that is broken by
this quirk (quirk-break) that leads to the quirk being needed on the
quirk-fix system and anti-needed on the quirk-break system is that the
two systems are operating in different mux modes. On a dynamic mux
system, there are up to four possible modes:

* dGPU-only (iGPU is disabled; mux is fixed on dGPU)
* iGPU-only (dGPU is disabled; mux is fixed on iGPU)
* Hybrid (Both iGPU and dGPU are enabled; mux is fixed on iGPU)
* Dynamic (Both iGPU and dGPU are enabled; mux can be switched)

IIUC OEMs can choose which of these modes is available on a particular
system, and whether it can be switched by the user. My hypothesis is
that the quirk-fix system is operating in either iGPU-only or Hybrid
mode, either of which is most likely to have iGPU-driven native
backlight, but is incorrectly reporting that the backlight is under EC
control. On the quirk-break system, I suspect that the ACPI method is
correctly reporting EC vs native backlight control when switching
between the various mux modes, but gets forced by the quirk to native
backlight control, even though it should be EC-controlled in dynamic
mode.

If my hypothesis is correct, then I think to make the quirk work
properly, we should check the mux mode and only force backlight control
to native if the system is not runnin in dynamic mode. I think in theory
it should be technically possible to design a system which is always
EC-controlled even when the mux is not in dynamic mode, but I in
practice it is highly unlikely that anybody does that. So it's probably
best to only apply this check in the quirk for now, rather than
asserting that EC backlight is supported IFF the mux is in dynamic mode.
The opposite situation, namely that the brightness is not EC-controlled
when the mux is in dynamic mode, should be more common: in particular my
understanding is that EC brightness control doesn't make sense with HDR
panels, so systems with an HDR panel would need to have brightness
controlled by the relevant GPU driver's native backlight handler or via
DP AUX from the relevant GPU.

Anyway, I guess in addition to a patch to make the quirk more reliable,
it would be good to have a simple kernel module that can be used to
query the current mux mode, which would help for troubleshooting. I'll
get the patch and the module written up and cleared for public release.

> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> 
> > On Wed, 11 Jan 2023 at 11:52, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 1/11/23 01:40, Daniel Dadap wrote:
> >>> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 1/10/23 16:19, Youssef Aly wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> >>>>> the kernel commandline for the patched kernel, it doesn't work without it.
> >>>>>
> >>>>> I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> >>>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> >>>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> >>>>>
> >>>>> Hybrid:
> >>>>> "acpi_backlight=native": Does not work, /sys/class/backlight contains
> >>>>> amdgpu_bl1.
> >>>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> >>>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> >>>>>
> >>>>> Discrete:
> >>>>> "acpi_backlight=native": Works but when brightness from 0-10 is the
> >>>>> same as 0-100, for example 10 is full brightness like 100, 8 is the
> >>>>> same as 80, etc... ,
> >>>>> /sys/class/backlight contains nvidia_0.
> >>>>> "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> >>>>> contains nvidia_wmi_ec_backlight.
> >>>>
> >>>> Thank you for testing!
> >>>>
> >>>> Ok so it seems there are 2 issues at play here:
> >>>>
> >>>> 1. Depending on the BIOS setting we need to use either native (discrete mode)
> >>>>    or nvidia_wmi_ec (hybrid mode)
> >>>>
> >>>> 2. There is a bug in the nvidia binary drivers backlight control in native
> >>>>    mode on this system causing the range to be wrong
> >>>>
> >>>> Daniel, we really need help from NVidia with fixing 1. can you see if
> >>>> there is a way to check the BIOS setting/mode from inside the kernel ?
> >>>
> >>> Yes, the ACPI MXDM method should be able to do this. However, querying
> >>> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> >>> determine whether the backlight is supposed to be EC-driven, since there
> >>> are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> >>> be orthogonal to whether or not the EC driver should be used. It sounds
> >>> like the BIOS is possibly reporting a wrong value for that query.
> >>>
> >>> I guess we could wire up a quirk that checks MXDM and overrides the
> >>> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> >>> mux operation mode. Then that quirk could be applied to this system.
> >>> I can put together a patch for that.
> >>
> >> If you can write a patch for this that would be great, thank you,
> >> but I think we first need to root-cause this better:
> >>
> >> Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> >> to always use the native backlight. So I've gone back to the original email
> >> thread which lead to me adding that quirk.
> >>
> >> We (I forwarded a mail from you to the reporter this was not on the list)
> >> did ask to test with different BIOS settings their to and the reporter's
> >> reply was:
> >>
> >> "Daniel wanted me to check different GPU modes, but my BIOS has no options
> >> for GPU. It's always in hybrid mode with PRIME render offload."
> >>
> >> And perhaps even more interesting in their case with acpi_backlight=native
> >> to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> >> in Youssef's case when running in discrete mode there is an nvidia backlight
> >> device and in Youssef's case the amdgpu_bl# device never works.
> >>
> >> The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> >>
> >> While the dGPU can be one of:
> >> NVIDIA GeForce RTX 3060
> >> NVIDIA GeForce GTX 3050 Ti
> >> NVIDIA GeForce GTX 3050
> >>
> >> I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> >> be relevant to the model with the 3060 and that nvidia-wmi-ec should
> >> maybe not load at all on the model with the 3050 versions.
> >>
> >> Maybe the Windows Nvidia drivers only even try to use the WMI EC
> >> interface with certain generations of GPUs ?
> >>
> >> Daniel might that be what is going on here ?
> >>
> >>
> >> Youssef, can you try/test 2 things for us please? :
> >>
> >> 1. Provide the output of running "lspci -nn"
> >>
> >> 2. Try a kernel with the attached patch (can be applied on top
> >>    of the previous patch). This removes the quirk, so that we
> >>    can let the nvidia_wmi_ec auto-detect code do its thing,
> >>    because maybe it does work on your model G15 5515.
> >>    When testing this you should *not* have any acpi_backlight=xxx
> >>    argument on your kernel commandline.
> >>
> >>> As for the native range bug, that does sound like a scaling issue. I'll
> >>> take a look at how the NVIDIA driver determines the range of possible
> >>> backlight values and see if Ican find an obvious way that might fail on
> >>> a particular system.
> >>
> >> Ok.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>>>> On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 1/10/23 02:07, Youssef Aly wrote:
> >>>>>>> Hello,
> >>>>>>>
> >>>>>>> Just reporting back, building with the patch fixed the issue.
> >>>>>>
> >>>>>> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
> >>>>>> the kernel commandline for the patched kernel, right ?
> >>>>>>
> >>>>>> If you have time, can you please also check the other BIOS
> >>>>>> (hybrid / discrete / ...) modes in the BIOS?
> >>>>>>
> >>>>>> Based on the previous bug report, I would expect you to need
> >>>>>> to pass "acpi_backlight=native" in at least some of the other
> >>>>>> modes ...
> >>>>>>
> >>>>>> Regards,
> >>>>>>
> >>>>>> Hans
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
> >>>>>>>>
> >>>>>>>> Hello Hans,
> >>>>>>>>
> >>>>>>>> Ok, I'll try building with the patch you provided, and report back.
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>>
> >>>>>>>> Youssef
> >>>>>>>>
> >>>>>>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Youssef,
> >>>>>>>>>
> >>>>>>>>> On 1/9/23 17:18, Youssef Aly wrote:
> >>>>>>>>>> Hello,
> >>>>>>>>>>
> >>>>>>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
> >>>>>>>>>> is always at full brightness, this is only the case in hybrid (mux)
> >>>>>>>>>> graphics mode.
> >>>>>>>>>>
> >>>>>>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> >>>>>>>>>> nvidia_wmi_ec_backlight    16384  0
> >>>>>>>>>> video                  61440  5
> >>>>>>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> >>>>>>>>>> wmi                    36864  7
> >>>>>>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> >>>>>>>>>>
> >>>>>>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> >>>>>>>>>> present which is not functional
> >>>>>>>>>> contents of /sys/class/backlight
> >>>>>>>>>> total 0
> >>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> >>>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>>>>>>
> >>>>>>>>>> this is the content on 6.0.12
> >>>>>>>>>> total 0
> >>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> >>>>>>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> >>>>>>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> >>>>>>>>>>
> >>>>>>>>>> Distro: Endeavour OS
> >>>>>>>>>> Kernel: 6.1.4-arch1-1
> >>>>>>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> >>>>>>>>>>
> >>>>>>>>>> #regzbot introduced v6.1..v6.1.4
> >>>>>>>>>
> >>>>>>>>> Hmm, this is likely caused by:
> >>>>>>>>>
> >>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
> >>>>>>>>>
> >>>>>>>>> Which was added because according to the reporter on their G15 5515
> >>>>>>>>> backlight control only works in native mode ...
> >>>>>>>>>
> >>>>>>>>> I'm getting the feeling that we need to detect the BIOS setting
> >>>>>>>>> and use a different backlight device depending on the setting...
> >>>>>>>>>
> >>>>>>>>> Daniel, any ideas?
> >>>>>>>>>
> >>>>>>>>> For now can you try building a kernel with the attached patch
> >>>>>>>>> (which I've also just submitted upstream) and with:
> >>>>>>>>>
> >>>>>>>>> acpi_backlight=nvidia_wmi_ec
> >>>>>>>>>
> >>>>>>>>> added to your kernel commandline. That should work around this
> >>>>>>>>> for now...
> >>>>>>>>>
> >>>>>>>>> Regards,
> >>>>>>>>>
> >>>>>>>>> Hans
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> > 
> 
