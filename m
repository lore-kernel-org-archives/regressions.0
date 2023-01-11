Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F615A7
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 00:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVlAveeZMKsKuLi/XKFmBCCQRfj3ZlYeoEB3jmjv9+SI2+RCR1HCz34n7seOa0wnofZ0HgQzUQERc4YEmFqC4oAEqsp/r9O3Fqy6kvVNNqdB+uhNXdDu8/kBLjPnqnllq94x1hhYf/2de8TyCB75a4lr/gidF7z56XeakhnCfQUIh1ZNgv06eWMYlZwB2sFfy+bZu3LUeGCjLAb5Bvr1CTblylKxYsRIjLfKG7uo2TluqFygwMEbO0bI5C3UC7NalPXLneryzLlvVNKCmbcG4PLvjsjmoezaoJC3kAh30HC4EMJiX/7/S4b0utawv2MZi58YouFqSt4cKZipnXmzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJ+YNn2pnLEa5VNTt+xmRi6gGrT0jKkz67VCCZDZhNQ=;
 b=eUly98O+ylUqq8tTrt7P16uKDw9QvgEyFYarJX9p1u6DxGrVr4MdhsjT1oZtOly+W9RW2ONM5LxAPqV7UV5qGmoEZPRZfZv98GMWhluhzaV40G3t19PW7pg4dnw+BGTBsLYkq1p4jZtS3M0Yf7C1XIbtOoKM3ik0zVu8y1YCek0bFWlLofiMN/DkU7KucwL0/Gt8KfSY4CsAdn5INpMeKUL/75c/6dtv0+SohpIfyWSeTXUzsCCCjiPHVZJJax1NS2nOcMsX3RZf4OPZ54oRvfT10pSpIPF93b0T9YXJr2KwyVF0hOLZWN/0b6Pa4V/LyNCN1YPYwx2OPrFyJfYO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJ+YNn2pnLEa5VNTt+xmRi6gGrT0jKkz67VCCZDZhNQ=;
 b=TOBi/ivlUDjJ0aTZ4OKl7b6TA7+1Ne2yWVZE+rXO8K7E8ug45j89KpS79EFx/vhhB4lOH0EO8QXMolc8Xg5jqWpewbLxVd4q3NUYcmsBP9w+dOkigr4E4E5Jh6Dbt4eOQNM2Oq9T1SyrV/x733I3UL8fmCsWeaIImaeOjfrEYTQlxyeg6zZJOl38q/MLYIdMmAqaGC6rIQ42L+E42XUXLmgym7Id0NTBTvAJHxHwCn0KC75GxFKBf+woM9g+0NH6MWRTLBdaJYtvkIkmInY6/O8OzePbQBMfxKQ2V880cglIw0n397ZVAO1atoStBlTFwb1j+n5z4yKr64vq3jV2Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 CH0PR12MB5234.namprd12.prod.outlook.com (2603:10b6:610:d1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Wed, 11 Jan 2023 00:43:02 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 00:43:02 +0000
Date: Tue, 10 Jan 2023 18:42:59 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Youssef Aly <youssefaswad@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y74GE6FZhtp17kTy@lenny>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
 <CAKsK3A=ndHtfWHtWF_bAjaLFuy3xjCB_RbDdOn+fe4eSqpC8Rg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKsK3A=ndHtfWHtWF_bAjaLFuy3xjCB_RbDdOn+fe4eSqpC8Rg@mail.gmail.com>
X-ClientProxiedBy: SA9PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:806:22::16) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|CH0PR12MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b85425-09fb-4326-09de-08daf36ccb80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vgQdHpA4nFXAf111itv/ObZF1uABkKyqF7Z9iUmuUwnea3CAixNH/SCQb2s1v6hwTGzaRKbpud2H0pwE/w9d0wz3T82T5hNws1lj56UJ0/uXIrQXqiiwXy72xoiQmBAg4iqhy3Z3+KsNTamStdfNaWYRBDWvpJY1sMk1o4efarxTD+BuzBJiSe611RVf4YSNjruaZQVZDHsp6+r6VdAl8LYzdRwvC7oQA62C4aKgjU/AWquaRkONHbkm1Sp6kW4YVNqMYzAVr2UOrnQ/+suqq/D4e5CiL6+Bb0lK5TkQpLw0NGOp5nFVTcIDorhNvkZgb+HqZzpIt4I0WCf3a1TiYCyVHQZkHHnqQe0X5AuweHekBK50YkbSAMeEeCnHHSbkiThyV+gAPWTTGLRDNLjvL/7wg5+YJ7/hSVsZT6NopDV/mTczHmtS9GwHERN3CeMrTEO77DOKLAoUlGpPVkjLrJ0X1OH9Y+kwNSRE4W0rGciooKfaN6VCma0pQaX94cHsIy6nSf3DI1qlQOt4u8OKHEDITEkcYYIpPBAii3htGB/m9JpYPYIh3LRgV+LBGj/9nKvSXzq270wduo5oaxZicvCkpuGRJfEkCFo9RzIgh5zz+GPsRKsCYoWPYkZxCEPXuAVclX3NTn/ViEKBVycpYCsPArSj/niPP8bGEUgDds8MPgDF04//oSHZmce4lNzNt+Wr+iD9XyyNajKw4hBpXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(6506007)(38100700002)(6666004)(53546011)(2906002)(478600001)(6486002)(966005)(33716001)(9686003)(26005)(186003)(6512007)(5660300002)(316002)(83380400001)(8936002)(86362001)(45080400002)(41300700001)(8676002)(4326008)(54906003)(66946007)(6916009)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jJtsOfiC4sRZL0AGQKO05va8XvC1TwuKFCzx2xb2kqjEmtf0LzwucZ991aww?=
 =?us-ascii?Q?PavUXtoSZB+uZM7Ix15PpqZItQN9vdWWU2Rscs1lVG9okUtfgbT5QZgSx1m8?=
 =?us-ascii?Q?0/LUdOuq6XFJfKoPtJBSny1yz+//8M0NiQwWTzVswoGDG9glEAeaaMtdKocT?=
 =?us-ascii?Q?4JSPr4wFHrKB5fG7kIDTr49H37pHiWLHMd376Yri6qsv5+kA+aUIImXgtAit?=
 =?us-ascii?Q?+Pk5wceRNxP6GknVc8ayCaeK/EydLaxUe9QSEiPSPMRWKrcSIyw1QbSse2OC?=
 =?us-ascii?Q?t7+saz5VTwGELVBtmrDeLIhmWajXXcWE32B1p+N4C9FCRuCJyiyh7f4yv567?=
 =?us-ascii?Q?//AIYhy2pG3ijzXJdqoTgvDhc2lmPKutxuEfVX0jxGwGhS6CeCRUKjOrEgqB?=
 =?us-ascii?Q?BFRuUZulfKATiWAQQTFQXi4a45YIRVL+sh1ViBja7a7qg8Ro7eF3KmyJiM7O?=
 =?us-ascii?Q?yVQGwhy/tFGMwt1ABHfkNffbIW3qvjwWnlLhH0G1Isyvs+lxNikUx3kINY28?=
 =?us-ascii?Q?GOEebx1xLzDx/r5LWZt+7b210q+LIFjklLZTsnoUcLwDK9xAyAQp0bB2rW9o?=
 =?us-ascii?Q?M88ll54OCBpIGSomWmBYhO7UnDCN5QBOsLRS2xxm93bWb3DdXrqGV/xU+9x+?=
 =?us-ascii?Q?CS3eoqBxXCEWAj/gLQ+Qe0JALDKwGHVU0TmrmC1aEoThOD8z25XKR5nVxXFM?=
 =?us-ascii?Q?g74kIxifzk91QQUZyMSWsrBtyL7hKtJmdWHIdJ5O5PCaoJXmdTEq4LBmECxQ?=
 =?us-ascii?Q?bPO/avHqKwVzAlIaHNRaSos8vbE/D975ioJ+N8mdQ3OMMDXmJjrturtj6iAL?=
 =?us-ascii?Q?+E62p7yCNfQIzwi8ZKHxIKErpQpTbKw1b926ilNdco9wmDyyzeE36rbetqh1?=
 =?us-ascii?Q?yH/q8jElC/2OeiLeqyWRObghjBazd2YbD4Rc16Bm4UmjKPmQTOVcAOL430Yr?=
 =?us-ascii?Q?aYU8pCwH+wbXf/hx3seKTuCXtcxibeT1NL1edR8ncleQTwXn0LupLwR4Sl/u?=
 =?us-ascii?Q?DDACfYZpb4GyKRfl59sGwnmM661/uV4+sMX+xR97GRHi8c9/1jJyRIbTzSXj?=
 =?us-ascii?Q?zXzdHJLQJ8Q4CzZWAOWDU8kC4xjg4v+GDNDt4KdNua3VsI9qptkuhT+uCulP?=
 =?us-ascii?Q?jQ+GiMBswUy/DnDtiGU8u09qvH14SPZTmeMtllZBKFjqkp6goJ+G5qetI6aG?=
 =?us-ascii?Q?A3bEsy9AVozlLWrzPIb+fj9APUJOEDq958XLhgAquv+3y+HkG67eGso2rPbL?=
 =?us-ascii?Q?yShx3oSxjGMGOizk+XtpSQ+AfhiQhR9IXRyg0V5OvGy3Tl5diMU83HpZiYsr?=
 =?us-ascii?Q?0eCP8P/98BigskclPnVXwRogcNTkEHsPnS9LvuAM5kkchNEcPFzzCZAd7UuJ?=
 =?us-ascii?Q?jJk3ElVnVavFwuaEitgj1OLPXToo19E1thezeKo7J+k5Bavnmle0/yBFw8MC?=
 =?us-ascii?Q?4zDoMhXaHMFIJehBQ8tC4dSUij+Ex/Y4GXM+ZZAmVK+ukBYXvB3jUCSI79HA?=
 =?us-ascii?Q?N9tFDSRasvM9dWpqpBzEoWVluUpLYUONCLTnS1bhjJ7KDS2aA/u6J/XFgB+G?=
 =?us-ascii?Q?iO8oQi1/+6c+RwQxvXlcgQa8r3/myZY9MoPlbTgI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b85425-09fb-4326-09de-08daf36ccb80
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 00:43:02.3779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2xJqX9embM86j9RCD5c0bL5XUXVitZGtZct2FScK25Wv3LtGnkvMrZNjfZaQjFb0uBSEaDmRGC3PhAi6NcmIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5234

On Tue, Jan 10, 2023 at 07:03:02PM +0200, Youssef Aly wrote:
> Hi,
> 
> Happy to test anytime, thanks for the p.s.
> 
> I would like to mention something probably unrelated, but thought I
> would mention it just in case. The backlight control has been broken
> on windows 10/11 on hybrid mode since Nvidia driver 526.47, this issue
> only affects the 3060 models (They have a mux switch). This is a link
> to the forum discussing the issue
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.dell.com%2Fcommunity%2FInspiron%2FG15-5515-Ryzen-Edition-Display-Brightness-Slider-not-Working%2Fm-p%2F8301504%23M154120&data=05%7C01%7Cddadap%40nvidia.com%7Cc5ba4337bec048cc9ec908daf32c9029%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638089669973715824%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=A7zkgMfX1Vbucho27pQSrW6dgIULEbIsFeEpekA9IfQ%3D&reserved=0
> .
> 
> Hope that is of some help.


Thanks, Youssef. Knowing that this is also broken on Windows will help.
 
> Thanks,
> 
> Youssef
> 
> 
> 
> On Tue, 10 Jan 2023 at 17:28, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 1/10/23 16:19, Youssef Aly wrote:
> > > Hi Hans,
> > >
> > > Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > > the kernel commandline for the patched kernel, it doesn't work without it.
> > >
> > > I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > > the modes with "acpi_backlight=nvidia_wmi_ec" and
> > > "acpi_backlight=native" using the patched kernel (v6.1.4):
> > >
> > > Hybrid:
> > > "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > > amdgpu_bl1.
> > > "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > > /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > >
> > > Discrete:
> > > "acpi_backlight=native": Works but when brightness from 0-10 is the
> > > same as 0-100, for example 10 is full brightness like 100, 8 is the
> > > same as 80, etc... ,
> > > /sys/class/backlight contains nvidia_0.
> > > "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > > contains nvidia_wmi_ec_backlight.
> >
> > Thank you for testing!
> >
> > Ok so it seems there are 2 issues at play here:
> >
> > 1. Depending on the BIOS setting we need to use either native (discrete mode)
> >    or nvidia_wmi_ec (hybrid mode)
> >
> > 2. There is a bug in the nvidia binary drivers backlight control in native
> >    mode on this system causing the range to be wrong
> >
> > Daniel, we really need help from NVidia with fixing 1. can you see if
> > there is a way to check the BIOS setting/mode from inside the kernel ?
> >
> > Regards,
> >
> > Hans
> >
> > p.s.
> >
> > Youssef, for your next email please use reply to all. You keep dropping
> > Daniel and the regressions-list from the To/Cc, using reply-to-all should
> > keep these in the To/Cc.
> >
> >
> >
> >
> > > On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
> > >>
> > >> Hi,
> > >>
> > >> On 1/10/23 02:07, Youssef Aly wrote:
> > >>> Hello,
> > >>>
> > >>> Just reporting back, building with the patch fixed the issue.
> > >>
> > >> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
> > >> the kernel commandline for the patched kernel, right ?
> > >>
> > >> If you have time, can you please also check the other BIOS
> > >> (hybrid / discrete / ...) modes in the BIOS?
> > >>
> > >> Based on the previous bug report, I would expect you to need
> > >> to pass "acpi_backlight=native" in at least some of the other
> > >> modes ...
> > >>
> > >> Regards,
> > >>
> > >> Hans
> > >>
> > >>
> > >>
> > >>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
> > >>>>
> > >>>> Hello Hans,
> > >>>>
> > >>>> Ok, I'll try building with the patch you provided, and report back.
> > >>>>
> > >>>> Thanks,
> > >>>>
> > >>>> Youssef
> > >>>>
> > >>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
> > >>>>>
> > >>>>> Hi Youssef,
> > >>>>>
> > >>>>> On 1/9/23 17:18, Youssef Aly wrote:
> > >>>>>> Hello,
> > >>>>>>
> > >>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
> > >>>>>> is always at full brightness, this is only the case in hybrid (mux)
> > >>>>>> graphics mode.
> > >>>>>>
> > >>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> > >>>>>> nvidia_wmi_ec_backlight    16384  0
> > >>>>>> video                  61440  5
> > >>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> > >>>>>> wmi                    36864  7
> > >>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> > >>>>>>
> > >>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> > >>>>>> present which is not functional
> > >>>>>> contents of /sys/class/backlight
> > >>>>>> total 0
> > >>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> > >>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> > >>>>>>
> > >>>>>> this is the content on 6.0.12
> > >>>>>> total 0
> > >>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> > >>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> > >>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> > >>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> > >>>>>>
> > >>>>>> Distro: Endeavour OS
> > >>>>>> Kernel: 6.1.4-arch1-1
> > >>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> > >>>>>>
> > >>>>>> #regzbot introduced v6.1..v6.1.4
> > >>>>>
> > >>>>> Hmm, this is likely caused by:
> > >>>>>
> > >>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3Df46acc1efd4b5846de9fa05f966e504f328f34a6&data=05%7C01%7Cddadap%40nvidia.com%7Cc5ba4337bec048cc9ec908daf32c9029%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638089669973715824%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=uWiblfqPL%2BrX9MmIGbzTyFTAkcdD1KXT2SSFxWKJ01M%3D&reserved=0
> > >>>>>
> > >>>>> Which was added because according to the reporter on their G15 5515
> > >>>>> backlight control only works in native mode ...
> > >>>>>
> > >>>>> I'm getting the feeling that we need to detect the BIOS setting
> > >>>>> and use a different backlight device depending on the setting...
> > >>>>>
> > >>>>> Daniel, any ideas?
> > >>>>>
> > >>>>> For now can you try building a kernel with the attached patch
> > >>>>> (which I've also just submitted upstream) and with:
> > >>>>>
> > >>>>> acpi_backlight=nvidia_wmi_ec
> > >>>>>
> > >>>>> added to your kernel commandline. That should work around this
> > >>>>> for now...
> > >>>>>
> > >>>>> Regards,
> > >>>>>
> > >>>>> Hans
> > >>>
> > >>
> > >
> >
