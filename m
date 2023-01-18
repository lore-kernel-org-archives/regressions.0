Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904652CAB
	for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 20:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRM/UvXiEkOQOrGivgd1KSRkluXHnfRCRyNEl2iMkGKpowjahm22lRifCEoDGZUjMSrxC1qETCeKCh2sp/TK3kP0GRDMSo0eJ82aA7AVXPB22mbcHOrGwz50tvxSIupEYiWIz6IAOS60jFRhIaHh1DkPiZ2khWEQ4UKdYvkV5gG5eecF3Kvm6vsrqUpXpdaw/ginABGPilZHPA2qCmIH7PGuBgxaOPEroWKIUE6ChkcUhP0ii6LRWpKV6+3cR1rlw4QFFGBsqVO6ic3uEndpqSKAKAlmanuXin0tbw/fRlXtcvOf/3udKD4u0rZ5Shi4Ll7q/KWj5WpwvBlbqlmnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcIGBT53QjTmoX6euF/yOLHKbkpz/T8iSBQlEjb2uy4=;
 b=DJK4wNtWimmZOvFtJXurgjF+pDC4Fvk3eaYjd+5waS7i9FA19woG10U0MViesKoEbn1GXpzmx6Z374hpXfXuas1oBtYOeVC/fScrpB0ZpdMMJciDqwsn81I3JsDVXXdzw6T2/riCbgZTA3bxgvOqOcjZ5BlSV/U1pnawgbvYVK0ArHtHTGdES5aor0DimOYMzrjMwubwfqCVb7F/WrjWcmNqH1iEqYxBiSRRbS6uM6r7FDpOHQyQE79cpV+TCgpct5+sKHlJwrWYbFknE9O5HL+dF4BzOk7mJRwRtth96FPyw49fD6rYKGrliaICRvvUV0Lb7JmjwozKv5R30D28Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcIGBT53QjTmoX6euF/yOLHKbkpz/T8iSBQlEjb2uy4=;
 b=o3RbKrPFWAMXX89Qb3kW21FIKUSuxGHxNVCJ0dzDKMysi3XOzSBDnjNGy3TmUSy6Nr5aGQdf1y95sXORlOrYtyZEehOOAdIvAHoU15o4j5bJW8raa7UZcYi+Qvo98iAOq12nOIeBsHXGksP5rEVEv2aG6gqINsTbm94hYxsBnLmZ17jYjXSOfzMkrYzuGvNBPdSk4JTQDDilzK9efIjfgZ6Y0QDRuRkft4r7d4pMaZzFO/AkF/F8mm+89TdryD0O84BfaekuUeZBmQ9ySX6rdU07CEs9yXUcods8x6kGZR0gpRW0MqAPqvNyY8w5G6qQ63QVQ9oZcxG+1bLyjsuHPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BL1PR12MB5127.namprd12.prod.outlook.com (2603:10b6:208:31b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 18 Jan
 2023 20:41:43 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4%4]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 20:41:41 +0000
Date: Wed, 18 Jan 2023 14:41:38 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Iris <pawel.js@protonmail.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com>
References: <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
 <Y74FfQmjN8WJcCIG@lenny>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
 <Y8cLiz93syAiiNhb@lenny>
 <Y8cSInQoeNcQMi03@lenny>
 <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com>
 <Y8c7ZN6PZhYcUYUk@lenny>
 <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com>
Content-Type: multipart/mixed; boundary="GOuuyT5hErPoTUi2"
Content-Disposition: inline
In-Reply-To: <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com>
X-ClientProxiedBy: SA9PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:806:24::7) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|BL1PR12MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 728791c6-5458-474e-1e2b-08daf9946761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JIISMQniXyLoLfmnSJ754rB+otR7ljv/kUZXM2Tc6lLkxagw1ex1m1CJ4kkLvavMTDMIlpPayZv6e7AQvgqUpDyP6JdAgxenHaAPTrgy2jlUovs/EdLMFMDlqEHQpuPwJnsGbrscP0+G7vCIMwqxozWHVsybWQwbsMmrnClBHUvk0/xKsf20FYTDYgMAZVyuPhIh5nSiVwvsknQCp8/j/xsdq4BgnsVTZiV3WEzFzBMFNK8XbkDDo4FhxrLaRAvPbElMeYsk8AWPMQySU0uzKfVPHfQ/2uJZ9YVTTBrJlvMOV9vtDyqHAC1ea+iaEpji2D64hCe6Yes7v7sb7i+z3ELa86vLtUZjki3kxjUQ2weFoSoR6GizYeB1Iy282Jzw5rBTl3su/h82DvSbsTbO2Z3+pX2iv2ftqMZn+s3/i+Y6aZ5+Zr3djA35FpzZitHgVXoa3JfF8UjXDI6cUoONr03XFUHusdhgqqkCzNZtqmeRyomvFYLBGYIfC/gOze8tX8/z5ivsxmIskIiGyOrWdikiD/2cCZ439OnvxhiW56xaf7NvYR1CMLi17YHNg7Ww8YmleonNghTsQe8K6v9cpf3hjilSQYbsI+x9T4ucM8NvV9/OINTJyxIk6srW5iKFeDhO0x5ONhv3ztFAoo+GGHSlpB+KnMTc8zCE8Jn2txtzP28Ctk/X/IcmMBB5rf9TNsM5lhcxnaxs2q0eGzfPRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199015)(8676002)(83380400001)(41300700001)(8936002)(2906002)(66476007)(235185007)(6916009)(54906003)(4326008)(316002)(53546011)(5660300002)(38100700002)(86362001)(30864003)(66556008)(186003)(6486002)(6512007)(478600001)(26005)(66946007)(6666004)(6506007)(44144004)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8SHPBgZv/OYMOzg79J8NYegSJQeUB8/y2dlr5RoN13GDNLmY8zHPcE9EBLWr?=
 =?us-ascii?Q?Yo8kErwG4NSxJJsdsbUNlOFbGo7AzN95xvgJ2r3tUJEI8DtRz6+hHBfhRdwX?=
 =?us-ascii?Q?qDv6+8NHlgqrcaLQLSP//y4EbaHQYm2ko6qOCtww1p9swoFWZDzaUzO7sdQV?=
 =?us-ascii?Q?W1aCYOXAoJFWPfVftaw8TXPZWSXIMQPaE0+RYg831rQHc3aZFGRejmhDf3MY?=
 =?us-ascii?Q?pSKqsTqrNpNhGE3V2Z1oSRjwUHLuGOoGOwl8Xrm5GDjc5U62PGAW11vA7xa6?=
 =?us-ascii?Q?jrbMX6OpX4z8917gMHYLA/ol8mMQvnopCUwTifW8THpsOYI5z1VFgq/YESGj?=
 =?us-ascii?Q?/IFayd1UF01Q3natQcEKrioMm3kyqxhzVvEd8tcf1NGJWNOB9/nZDbuDwYD/?=
 =?us-ascii?Q?eBrX3HbgmI2RELCopRPqAyY8mQB/Bp7CIiWqnlJpPZHL9HNyABWMmGsVPVxK?=
 =?us-ascii?Q?uOhh2W83pSezqayA9XwtpK9f3MTq0+w93xYAE93uC0w7R6IlZNoxOoYpKcxD?=
 =?us-ascii?Q?3worQzm9F1QiUGBeObmDvdReh1HmyG4M/RTCyiT7oaULXIdwphEwNgSM6kFQ?=
 =?us-ascii?Q?gKWWTtq+3RKY/I7uKrPLOSZBXWEwKZ1it/pEbYbxqdXEQ3O41kSJIaEUwMMY?=
 =?us-ascii?Q?YHpxfLqfYPg/uj1vQdKp8AEuz2L5mZtbHCAkXGDav2+Psw3dEV/7+zL9bqlW?=
 =?us-ascii?Q?8dK/yAToYDVONxHr349jjF7B0kx/HL1p1t3E64JNQE5RSX3ZfWj9YSAkXEdW?=
 =?us-ascii?Q?UaGi//BsMOihSMZaN6wpPt+c3pZtstwovl30NtMhowtG1VegVcSV3jrtM7nB?=
 =?us-ascii?Q?cypvZSQo2idIYX2+oPpcqd518Bje8tqz3TYt1VEmEZd3JGRN8EmZ/ZPhmKgD?=
 =?us-ascii?Q?8kOj9abfuSZDlRyyWd48ti3ZuFfDJcgMQwjpBSltUZiVyk/Vn9PmnCRR4qjM?=
 =?us-ascii?Q?ui80o24xuU0aU7rtKPqBROQ26kNVEys/LCGJitN2c/K9JXWSPA0959CmLpfG?=
 =?us-ascii?Q?4qLOZ+TJG+aqwPDJHBc9nIUETdcCMKvCKgWTxq71oHPMNmhc3Hsy563D0Sx5?=
 =?us-ascii?Q?uJWJY3wy/uvYVoG1yGMINWRf6SlXcMmDTxCJks8+yeYVB+FVH+Bj3zdpwP0U?=
 =?us-ascii?Q?0SVKx3rRtQsPSk87jBmYTK1gEUfaJGucWGTMMyd4MyJTD+aVch1OTy+H8fzg?=
 =?us-ascii?Q?9VmYaL5KuHQ9XZMwmOt6VbNOTwelEqOKZkRNkG65P392ZYyAMwAIRdG3/HoP?=
 =?us-ascii?Q?0nyX+3HGzjcumkYSfpJ26WsWftc8NDsQmhufTO7bsYJMUH7C7/4c9gQYEKKk?=
 =?us-ascii?Q?1EHXbgSII8rK36i74J1duYcF04pOdyyRe/XzpVkP931yXiN6vP46+fywkS1D?=
 =?us-ascii?Q?s9+dmQqD71cfY0KddC9WJO9XtsJiu8nO4rqmX1jruB3A7dT8VAX0lNclVSBU?=
 =?us-ascii?Q?do6R4pRlugG8QMVKLVxAbOf6A1LV5RBZWFNEYQY7SAPbSJCU31MUZP9VhUaz?=
 =?us-ascii?Q?QzgLNl1cNH1KlEN6DUxzhey6RS5sMvcI55ZE/BZr9uhJ2AejXrUnTKOLjUsm?=
 =?us-ascii?Q?j0D7lCen77V7nZ9OJ9vJeOIiONHVYD57VbTea6c9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728791c6-5458-474e-1e2b-08daf9946761
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 20:41:41.6240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0qu0IkkfId/jLycDbC3NMZRuUl7kbYI18LHCaM4lbMKjt+d7J/Au+9jJTX8AE3h2YSy8YCLCT4weHYm2BcHwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5127

--GOuuyT5hErPoTUi2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks, Iris:

On Wed, Jan 18, 2023 at 09:33:19AM +0000, Iris wrote:
> I have followed Youssef's instructions to build the module, and after loading it, /sys/kernel/debug/acpi/mxdm_mux_mode reports "dynamic"

That is unfortunate. I was hoping it would report a non-dynamic mode, which
would make it easier to disambiguate between G15 5515 models which require
EC backlight control and G15 5515 models which require native GPU-driven
backlight control.

I have attached an updated version of the test module which will allow you 
to test if your system does have a dynamic mux. Build and load it the same
way as the previous one (unload the previous one first if you haven't done
so or rebooted already). This adds /sys/kernel/debug/acpi/mxds_mux_state: if
you see this file, read out its contents. I expect that on your system it
should report "integrated", since IIUC the amdgpu_bl backlight device is the
one that works on your system. If you do not see this file, and the message
"MXDS not found" appears in your kernel log, then your ACPI table doesn't
expose the MXDS method, which could be a useful disambiguation test.

Another experiment to try would be to flip the state of the mux. Before
attempting this experiment, make sure to save any work and log in remotely
from another machine, since it is possible that your screen will go blank
and will need a reboot in order to come back up. To change the mux state,
write the target mux state to the mxds_mux_state file. Use whatever the
opposite of the current value is, i.e., if it reads out as "integrated",
then write "discrete", and vice versa. If the mux switch worked, your
screen should go blank and reading the mxds_mux_state file again should
reflect the new state. You can then flip the mux back to its original
position, and you *should* be able to get the display back by forcing
DPMS off and then on again. If you're not running X, writing a '0' then
writing a '1' to /sys/kernel/debug/dri/0/eDP-1/trigger_hotplug seems to
work on my AMD+NVIDIA system. (The DRI device and eDP connector ID might
be enumerated differently on your system.) If neither of those work to
bring your display back up, then reboot the computer.

The most interesting data would be to check whether MXDS is available in
your system's ACPI tables, and if so, whether it is actually functional.

> As mentioned before, this RTX 3050 system does not have configurable GPU mode.
> 
> ------- Original Message -------
> On Wednesday, January 18th, 2023 at 01:20, Daniel Dadap <ddadap@nvidia.com> wrote:
> 
> 
> > On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
> > 
> 
> > > Hello Daniel,
> > > 
> 
> > > I tried building the module using the instructions you provided, but
> > > ran into some problems as I didn't have the /lib/modules/$(uname
> > > -r)/source directory on my end.
> > > I created a Makefile in a directory containing mxdm-debugfs.c file and
> > > added the following to it:
> > > 
> 
> > > obj-m += mxdm-debugfs.o
> > > 
> 
> > > all:
> > > make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
> > > 
> 
> > > clean:
> > > make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> > > 
> 
> > > I then ran "make" and loaded the module.
> > 
> 
> > 
> 
> > Ah, yes, I should have mentioned specifically that the instructions
> > assumed either a split Kbuild configuration with separate source and
> > output directories, or a single combined source and output directory but
> > with "source" and "build" both being symlinks to the same directory. I
> > forget which distros do what exactly, but some ship a combined
> > source/output directory but only have one of either "source" or "build";
> > yours appears to be the latter configuration. I'm glad you were able to
> > get it building anyway.
> > 
> 
> > > 1) Hybrid mode set to "Enabled" from the bios settings,
> > > /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
> > > 2) Hybrid mode set to "Disabled" from the bios settings,
> > > /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.
> > 
> 
> > 
> 
> > Okay. This is consistent with my expectations. If we also find that the
> > systems which require the quirk report either "discrete", "hybrid", or
> > "integrated" (IIUC those systems do not have the mode configurable in the
> > UEFI settings), then I think we can fix the quirk by checking the mux
> > mode and only forcing to native if the system is not in hybrid mode.
> > 
> 
> > Or perhaps we should just get rid of the quirk, and unconditionally test
> > the mux mode, and avoid using nvidia-wmi-ec-backlight on systems which
> > are not in "dynamic" mode, regardless of whether they expose the WMI EC
> > backlight interface and regardless of whether that interface reports
> > that the EC backlight driver should be used. (On the systems that need
> > the quirk, that interface is reporting that the backlight should be
> > EC-controlled even when it shouldn't be.) I think that in theory, it
> > should be possible for a system design to require EC backlight control
> > even when the mux is in a non-dynamic mode, but in practice I don't know
> > why anybody would do that, and am not aware of any systems which do so
> > (although until the report of the broken backlight on the 3050 version
> > of the Dell G15 5515, I wasn't aware of any systems that reported EC
> > backlight control when it was supposed to be native.)
> > 
> 
> > Hans, I think the most reasonable options are:
> > 
> 
> > 1) Remove the quirk, and check for MXDM when deciding whether a system
> > should use the EC backlight driver. This has the disadvantage of adding
> > a check where one isn't actually needed on some (most?) systems, and the
> > advantage of most likely avoiding the need to add quirks for other
> > systems where the system reports EC backlight control when native should
> > be used. It also has the possibility of being wrong on a theoretically
> > possible configuration, although if we ever encounter such a
> > configuration we could handle it with a quirk or find some other way to
> > distinguish between systems that do or do not require the EC backlight
> > driver.
> > 
> 
> > 2) Keep the existing quirk, and only force to native if MXDM is missing
> > or if MXDM reports that the system is in a non-dynamic mode.
> > 
> 
> > I'm inclined to go with (2), because it seems "safer", but am happy to
> > implement (1) if you think that's the better option. For the MXDM check
> > I think the first thing to do is to check whether the MXDM method is
> > present at all: as observed on at least one system, there is no MXDM
> > method when the system is in non-dynamic mode. Then if MXDM is present,
> > check whether it reports that the mux is in dynamic mode. For (1), only
> > query the WMI-wrapped API to determine the backlight control source if
> > the mux is in dynamic mode. For (2), only force the backlight to native
> > if the mux is not in dynamic mode.
> > 
> 
> > This, again, assumes that none of the systems which require the quirk
> > report that the mux is in dynamic mode. If any of them do, we will need
> > to find a different way to determine which systems are lying about how
> > the backlight is supposed to be controlled.
> > 
> 
> > > Regards,
> > > 
> 
> > > Youssef
> > > 
> 
> > > On Tue, 17 Jan 2023 at 23:24, Daniel Dadap ddadap@nvidia.com wrote:
> > > 
> 
> > > > Hans pointed out a crucial omission in the build instructions in a
> > > > different thread where I also shared this test module:
> > > > 
> 
> > > > On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > > > 
> 
> > > > > Thanks, Hans.
> > > > > 
> 
> > > > > On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > > > > 
> 
> > > > > > Hi All,
> > > > > > 
> 
> > > > > > On 1/11/23 10:51, Hans de Goede wrote:
> > > > > > 
> 
> > > > > > > Hi,
> > > > > > > 
> 
> > > > > > > On 1/11/23 01:40, Daniel Dadap wrote:
> > > > > > > 
> 
> > > > > > > > On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> > > > > > > > 
> 
> > > > > > > > > Hi,
> > > > > > > > > 
> 
> > > > > > > > > On 1/10/23 16:19, Youssef Aly wrote:
> > > > > > > > > 
> 
> > > > > > > > > > Hi Hans,
> > > > > > > > > > 
> 
> > > > > > > > > > Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > > > > > > > > > the kernel commandline for the patched kernel, it doesn't work without it.
> > > > > > > > > > 
> 
> > > > > > > > > > I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > > > > > > > > > the modes with "acpi_backlight=nvidia_wmi_ec" and
> > > > > > > > > > "acpi_backlight=native" using the patched kernel (v6.1.4):
> > > > > > > > > > 
> 
> > > > > > > > > > Hybrid:
> > > > > > > > > > "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > > > > > > > > > amdgpu_bl1.
> > > > > > > > > > "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > > > > > > > > > /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > > > > > > > > > 
> 
> > > > > > > > > > Discrete:
> > > > > > > > > > "acpi_backlight=native": Works but when brightness from 0-10 is the
> > > > > > > > > > same as 0-100, for example 10 is full brightness like 100, 8 is the
> > > > > > > > > > same as 80, etc... ,
> > > > > > > > > > /sys/class/backlight contains nvidia_0.
> > > > > > > > > > "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > > > > > > > > > contains nvidia_wmi_ec_backlight.
> > > > > > > > > 
> 
> > > > > > > > > Thank you for testing!
> > > > > > > > > 
> 
> > > > > > > > > Ok so it seems there are 2 issues at play here:
> > > > > > > > > 
> 
> > > > > > > > > 1. Depending on the BIOS setting we need to use either native (discrete mode)
> > > > > > > > > or nvidia_wmi_ec (hybrid mode)
> > > > > > > > > 
> 
> > > > > > > > > 2. There is a bug in the nvidia binary drivers backlight control in native
> > > > > > > > > mode on this system causing the range to be wrong
> > > > > > > > > 
> 
> > > > > > > > > Daniel, we really need help from NVidia with fixing 1. can you see if
> > > > > > > > > there is a way to check the BIOS setting/mode from inside the kernel ?
> > > > > > > > 
> 
> > > > > > > > Yes, the ACPI MXDM method should be able to do this. However, querying
> > > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> > > > > > > > determine whether the backlight is supposed to be EC-driven, since there
> > > > > > > > are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> > > > > > > > be orthogonal to whether or not the EC driver should be used. It sounds
> > > > > > > > like the BIOS is possibly reporting a wrong value for that query.
> > > > > > > > 
> 
> > > > > > > > I guess we could wire up a quirk that checks MXDM and overrides the
> > > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> > > > > > > > mux operation mode. Then that quirk could be applied to this system.
> > > > > > > > I can put together a patch for that.
> > > > > > > 
> 
> > > > > > > If you can write a patch for this that would be great, thank you,
> > > > > > > but I think we first need to root-cause this better:
> > > > > > > 
> 
> > > > > > > Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> > > > > > > to always use the native backlight. So I've gone back to the original email
> > > > > > > thread which lead to me adding that quirk.
> > > > > > > 
> 
> > > > > > > We (I forwarded a mail from you to the reporter this was not on the list)
> > > > > > > did ask to test with different BIOS settings their to and the reporter's
> > > > > > > reply was:
> > > > > > > 
> 
> > > > > > > "Daniel wanted me to check different GPU modes, but my BIOS has no options
> > > > > > > for GPU. It's always in hybrid mode with PRIME render offload."
> > > > > > > 
> 
> > > > > > > And perhaps even more interesting in their case with acpi_backlight=native
> > > > > > > to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> > > > > > > in Youssef's case when running in discrete mode there is an nvidia backlight
> > > > > > > device and in Youssef's case the amdgpu_bl# device never works.
> > > > > > > 
> 
> > > > > > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> > > > > > > 
> 
> > > > > > > While the dGPU can be one of:
> > > > > > > NVIDIA GeForce RTX 3060
> > > > > > > NVIDIA GeForce GTX 3050 Ti
> > > > > > > NVIDIA GeForce GTX 3050
> > > > > > > 
> 
> > > > > > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> > > > > > > be relevant to the model with the 3060 and that nvidia-wmi-ec should
> > > > > > > maybe not load at all on the model with the 3050 versions.
> > > > > > 
> 
> > > > > > A quick status update on this.
> > > > > > 
> 
> > > > > > Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
> > > > > > to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has
> > > > > > gotten back to me with lspci output on their G15 and it indeed has
> > > > > > a GTX 3050.
> > > > > > 
> 
> > > > > > So atm we have the following models which are affected one way
> > > > > > or the other:
> > > > > > 
> 
> > > > > > -Acer Predator PH315-55: needs acpi_backlight=native
> > > > > > -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
> > > > > > -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(
> > > > > > 
> 
> > > > > > With the models which need acpi_backlight=native being broken
> > > > > > by (false positive) detection of the laptop needing nvidia-wmi-ec
> > > > > > for backlight control while they actually should not be using that.
> > > > > > 
> 
> > > > > > and with the Dell G15 5515 with RTX 3060 atm being broken because
> > > > > > of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> > > > > 
> 
> > > > > I've attached a simple kernel module which adds a debugfs file that
> > > > > reports the current mux mode. As mentioned elsewhere, I suspect that the
> > > > > systems which need the quirk may be in one of the non-dynamic modes, and
> > > > > the systems which are broken by the quirk may be in dynamic mux mode. It
> > > > > should be pretty straightforward to compile this as an out-of-tree
> > > > > module using the Kbuild extmod infrastructure, as follows:
> > > > > 
> 
> > > > > 1) Change to the directory containing the mxdm-debugfs.c file (you may
> > > > > wish to create an empty directory to put it in) and create a file in
> > > > > that directory containing the following line:
> > > > 
> 
> > > > The name of this file should be 'Kbuild'. Sorry for the noise.
> > > > 
> 
> > > > > obj-m += mxdm-debugfs.o
> > > > > 
> 
> > > > > 2) Build the kernel module:
> > > > > 
> 
> > > > > make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname -r)/build M=$(pwd)
> > > > > 
> 
> > > > > (The "source" and "build" paths under /lib/modules/`uname -r` should
> > > > > be the correct paths in almost all cases; if your system uses
> > > > > different paths, substitute those. You will need the development
> > > > > headers for external kernel modules, and the relevant toolchain bits,
> > > > > but if you're already using the NVIDIA proprietary driver you almost
> > > > > certainly already have all of that.)
> > > > > 
> 
> > > > > 3) Load the kernel module:
> > > > > 
> 
> > > > > insmod ./mxdm-debugfs.ko
> > > > > 
> 
> > > > > This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
> > > > > Reading this file should report the current mux operation mode.
> > > > > 
> 
> > > > > While switching mux modes on a dynamic mux system to test this kernel
> > > > > module, I noticed that the ACPI tables no longer exposed the MXDM method
> > > > > when the mux mode was set to discrete only on that particular system.
> > > > > This contradicted the behavior I had previously observed on other
> > > > > systems; i.e., that MXDM is always available regardless of the currently
> > > > > set mux mode, so I tried it on another dynamic mux system and observed
> > > > > that the other system does always expose MXDM regardless of the mux
> > > > > mode, and the contents of the debugfs file matched the selected mode.
> > > > > 
> 
> > > > > So if the module fails to load with ENODEV and prints the "MXDM not
> > > > > found" message to the kernel log, the system is most likely configured
> > > > > to a non-dynamic mux mode. My usual expectation is that it should load
> > > > > and create the file on most dynamic mux systems. I do not have direct
> > > > > access to any of the above listed systems at the moment, so I do not
> > > > > know whether MXDM will be exposed when the system is not in dynamic mux
> > > > > mode.
> > > > > 
> 
> > > > > > Regards,
> > > > > > 
> 
> > > > > > Hans
> > > > 
> 
> > > > > // SPDX-License-Identifier: GPL-2.0-only
> > > > > /*
> > > > > * Copyright (C) 2020 NVIDIA Corporation
> > > > > *
> > > > > */
> > > > > 
> 
> > > > > #include <linux/acpi.h>
> > > > > #include <acpi/acoutput.h>
> > > > > #include <linux/module.h>
> > > > > #include <linux/pci.h>
> > > > > #include <linux/debugfs.h>
> > > > > 
> 
> > > > > extern struct dentry *acpi_debugfs_dir;
> > > > > 
> 
> > > > > enum mux_mode {
> > > > > MUX_MODE_UNKNOWN = 0,
> > > > > MUX_MODE_INTEGRATED = 1, /* iGPU only /
> > > > > MUX_MODE_DISCRETE = 2, / dGPU only /
> > > > > MUX_MODE_HYBRID = 3, / Dual GPU, mux switched to iGPU /
> > > > > MUX_MODE_DYNAMIC = 4, / Dual GPU, dynamic mux switching */
> > > > > MUX_MODE_MAX
> > > > > };
> > > > > 
> 
> > > > > static char * mode_names[] = {
> > > > > [MUX_MODE_UNKNOWN] = "unknown\n",
> > > > > [MUX_MODE_INTEGRATED] = "integrated\n",
> > > > > [MUX_MODE_DISCRETE] = "discrete\n",
> > > > > [MUX_MODE_HYBRID] = "hybrid\n",
> > > > > [MUX_MODE_DYNAMIC] = "dynamic\n",
> > > > > };
> > > > > 
> 
> > > > > static struct debugfs_blob_wrapper muxmode_blob;
> > > > > 
> 
> > > > > static void store_mux_mode(acpi_handle handle)
> > > > > {
> > > > > union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER, .value = 0 } };
> > > > > struct acpi_object_list in = { .count = 1, .pointer = &arg };
> > > > > 
> 
> > > > > acpi_integer ret;
> > > > > acpi_status status;
> > > > > 
> 
> > > > > status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> > > > > 
> 
> > > > > if (ACPI_FAILURE(status)) {
> > > > > acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exception(status));
> > > > > muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > > > > } else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
> > > > > acpi_handle_err(handle, "Mux mode value out of range");
> > > > > muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > > > > } else {
> > > > > muxmode_blob.data = mode_names[ret];
> > > > > }
> > > > > 
> 
> > > > > muxmode_blob.size = strlen(muxmode_blob.data);
> > > > > }
> > > > > 
> 
> > > > > static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx, void **ret)
> > > > > {
> > > > > acpi_handle search;
> > > > > 
> 
> > > > > if (acpi_get_handle(obj, "MXDM", &search) == 0) {
> > > > > /* Found the parent object of the MXDM method; pass it back
> > > > > * to the caller and stop searching. */
> > > > > *ret = obj;
> > > > > 
> 
> > > > > return AE_CTRL_TERMINATE;
> > > > > }
> > > > > 
> 
> > > > > /* No MXDM; keep looking */
> > > > > return AE_OK;
> > > > > }
> > > > > 
> 
> > > > > static struct dentry *muxmode_file_dentry;
> > > > > 
> 
> > > > > static int __init mxdm_debugfs_init(void)
> > > > > {
> > > > > acpi_handle mxdm_handle = NULL;
> > > > > acpi_status ret;
> > > > > 
> 
> > > > > ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> > > > > find_mxdm, NULL, NULL, &mxdm_handle);
> > > > > 
> 
> > > > > if (ACPI_FAILURE(ret) || !mxdm_handle) {
> > > > > pr_err("MXDM not found.\n");
> > > > > return -ENODEV;
> > > > > }
> > > > > 
> 
> > > > > /* Populate the blob wrapper: the mux mode cannot change without rebooting
> > > > > * so this only needs to be done once. */
> > > > > store_mux_mode(mxdm_handle);
> > > > > 
> 
> > > > > muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
> > > > > acpi_debugfs_dir,
> > > > > &muxmode_blob);
> > > > > 
> 
> > > > > return muxmode_file_dentry ? 0 : -EIO;
> > > > > }
> > > > > module_init(mxdm_debugfs_init);
> > > > > 
> 
> > > > > static void __exit mxdm_debugfs_exit(void)
> > > > > {
> > > > > if (muxmode_file_dentry) {
> > > > > debugfs_remove(muxmode_file_dentry);
> > > > > muxmode_file_dentry = NULL;
> > > > > }
> > > > > }
> > > > > module_exit(mxdm_debugfs_exit);
> > > > > 
> 
> > > > > MODULE_LICENSE("GPL v2");
> > > > > MODULE_DESCRIPTION("MXDM mux mode test module");
> > > > > MODULE_AUTHOR("Daniel Dadap ddadap@nvidia.com");
> > > > > 
> 
> > > > > /*
> > > > > * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
> > > > > * the WMI wrapper for the related WMAA method for backlight control.
> > > > > */
> > > > > MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");




--GOuuyT5hErPoTUi2
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="mxdm-debugfs.c"

// SPDX-License-Identifier: GPL-2.0-only
/*
 * Copyright (C) 2023 NVIDIA Corporation
 */

#include <linux/acpi.h>
#include <linux/module.h>
#include <linux/debugfs.h>

extern struct dentry *acpi_debugfs_dir;

enum mux_val {
	MUX_VAL_UNKNOWN = 0,
	MUX_VAL_INTEGRATED = 1, /* iGPU only */
	MUX_VAL_DISCRETE = 2,   /* dGPU only */
	MUX_VAL_MAX_STATE,
	MUX_VAL_HYBRID = 3,     /* Dual GPU, mux switched to iGPU */
	MUX_VAL_DYNAMIC = 4,    /* Dual GPU, dynamic mux switching */
	MUX_VAL_MAX_MODE
};

static char * mux_val_names[] = {
	[MUX_VAL_UNKNOWN] = "unknown\n",
	[MUX_VAL_INTEGRATED] = "integrated\n",
	[MUX_VAL_DISCRETE] = "discrete\n",
	[MUX_VAL_HYBRID] = "hybrid\n",
	[MUX_VAL_DYNAMIC] = "dynamic\n",
};

/*
 * Call MXDM or MXDS with argument value 0 to read the current mode or state.
 * When reading, a return value of 1 means iGPU and 2 means dGPU.
 * Call MXDS with bit 0 set to change the current state.
 * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
 */

enum mux_command {
	MUX_COMMAND_GET = 0,
	MUX_COMMAND_SET = 1,
};

#define SET_MUX_STATE(state) (MUX_COMMAND_SET | ((state - 1) << 4))

static struct debugfs_blob_wrapper muxmode_blob;

static acpi_status mux_acpi_eval(acpi_handle handle, char *method,
				 acpi_integer argval, acpi_integer *ret)
{
	union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER,
					       .value = argval } };
	struct acpi_object_list in = { .count = 1, .pointer = &arg };

	return acpi_evaluate_integer(handle, method, &in, ret);
}

static void store_mux_mode(acpi_handle handle)
{
	acpi_integer ret;
	acpi_status status;

	status = mux_acpi_eval(handle, "MXDM", MUX_COMMAND_GET, &ret);

	if (ACPI_FAILURE(status)) {
		acpi_handle_err(handle, "%s\n", acpi_format_exception(status));
		muxmode_blob.data = mux_val_names[MUX_VAL_UNKNOWN];
	} else if (ret < MUX_VAL_UNKNOWN || ret >= MUX_VAL_MAX_MODE) {
		acpi_handle_err(handle, "Mux mode value out of range");
		muxmode_blob.data = mux_val_names[MUX_VAL_UNKNOWN];
	} else {
		muxmode_blob.data = mux_val_names[ret];
	}

	muxmode_blob.size = strlen(muxmode_blob.data);
}

static acpi_status find_method(acpi_handle obj, u32 level, void *ctx, void **ret)
{
	acpi_handle search;
	char *method = ctx;

	if (acpi_get_handle(obj, method, &search) == 0) {
		/* Found the parent object of the method; pass it back
		 * to the caller and stop searching. */
		*ret = obj;

		return AE_CTRL_TERMINATE;
	}

	/* Not found; keep looking */
	return AE_OK;
}

static ssize_t mxds_read (struct file *f, char __user *buf, size_t len, loff_t *off)
{
	acpi_handle *mxds_h = file_inode(f)->i_private;
	size_t name_len, to_copy, copied;
	acpi_integer state;
	acpi_status status;

	if (!mxds_h) {
		return 0;
	}

	status = mux_acpi_eval(mxds_h, "MXDS", MUX_COMMAND_GET, &state);

	if (ACPI_FAILURE(status)) {
		acpi_handle_err(mxds_h, "%s\n", acpi_format_exception(status));
		return 0;
	}

	switch (state) {
	case MUX_VAL_DISCRETE: case MUX_VAL_INTEGRATED:
		break;
	default:
		acpi_handle_warn(mxds_h, "Read invalid mux state: %lld\n", state);
		state = MUX_VAL_UNKNOWN;
		break;
	}

	name_len = strlen(mux_val_names[state]);

	if (*off < 0 || *off > name_len) return 0;

	to_copy = name_len - *off;
	if (len < to_copy)
		to_copy = len;

	copied = to_copy - copy_to_user(buf, mux_val_names[state] + *off, to_copy);
	*off += copied;

	return copied;
}

static ssize_t mxds_write (struct file *f, const char __user *buf, size_t len, loff_t *off)
{
	acpi_handle *mxds_h = file_inode(f)->i_private;
	acpi_integer state, ret;
	acpi_status status;
	char c;

	if (!len || *off) return 0;

	if (copy_from_user(&c, buf, 1)) {
		acpi_handle_warn(mxds_h, "Failed to read new mux state\n");
		return 0;
	}

	switch (c) {
	case 'D': case 'd': case '0' + MUX_VAL_DISCRETE:
		state = MUX_VAL_DISCRETE;
		break;
	case 'I': case 'i': case '0' + MUX_VAL_INTEGRATED:
		state = MUX_VAL_INTEGRATED;
		break;
	default:
		acpi_handle_warn(mxds_h, "Invalid mux target state supplied\n");
		return 0;
	}

	status = mux_acpi_eval(mxds_h, "MXDS", SET_MUX_STATE(state), &ret);

	if (ACPI_FAILURE(status)) {
		acpi_handle_err(mxds_h, "%s\n", acpi_format_exception(status));
		return 0;
	}

	return len;
}

static struct file_operations muxstate_fops = {
	.read = mxds_read,
	.write = mxds_write,
};

static struct dentry *muxmode_file_dentry;
static struct dentry *muxstate_file_dentry;

static int __init mxdm_debugfs_init(void)
{
	acpi_handle mxdm_handle = NULL, mxds_handle = NULL;
	acpi_status ret;

	ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
				  find_method, NULL, "MXDM",
				  &mxdm_handle);

	if (ACPI_FAILURE(ret) || !mxdm_handle) {
		pr_err("MXDM not found.\n");
		return -ENODEV;
	}

	/* Populate the blob wrapper for mux mode: the mux mode cannot change
	 * without rebooting, so we only need to do this once. */
	store_mux_mode(mxdm_handle);

	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
			    find_method, NULL, "MXDS", &mxds_handle);

	muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
						  acpi_debugfs_dir,
						  &muxmode_blob);

	if (mxds_handle) {
		muxstate_file_dentry = debugfs_create_file("mxds_mux_state",
							   0644,
							   acpi_debugfs_dir,
							   mxds_handle,
							   &muxstate_fops);
	} else {
		pr_info("MXDS not found.\n");
	}

	return muxmode_file_dentry ? 0 : -EIO;
}
module_init(mxdm_debugfs_init);

static void __exit mxdm_debugfs_exit(void)
{
	if (muxmode_file_dentry) {
		debugfs_remove(muxmode_file_dentry);
		muxmode_file_dentry = NULL;
	}

	if (muxstate_file_dentry) {
		debugfs_remove(muxstate_file_dentry);
		muxstate_file_dentry = NULL;
	}
}
module_exit(mxdm_debugfs_exit);

MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("MXDM/MXDS mux mode/state test module");
MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");

--GOuuyT5hErPoTUi2--
