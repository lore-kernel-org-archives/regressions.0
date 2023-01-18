Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2518F8C06
	for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 22:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXGSCk4H0sMND/u8Wi2NX2EB8ErJH9yW+SfY62LwZsQOMuKlq4p9UKMvZQ83pt97QmLg1j5auRLm8fKiVG6WpBOKOIJk53deXedsEp9ZMG964u6ak8OgXJ2dx1yn9sQlDyPyVBYiQXTAlp1YLfUhDKRNymmNrGcIuUgnN4eWRICYE7rxKZJW6Zf2+4WmNZsIPseh7pC1O9U1KXeNlj7OcW2rY6Wu3M/BpqRd3oFKkcC57OWPIfWMNwZPPeW6E7XC3MruhvleCYxQ6qahjz0w4+6R77LxYZywMIg9XEHqwsNUbwpPf0nIy2tyTJlKP8GR2bFm+nrzJ19vgO3stWafWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz/EJqNxtZwErFfPau8bE4CxTqIXEGY+hls0J+NPcCc=;
 b=FUulFZg96OedL5XsMo9CDNyOHLs8buTZhlIuirIqjtzSLDxq5OORaw8aBLfJ9oMbAghDjhEDfBKYXiLmG+vGdJgbivoC8N/NCQWGzB2tuB+RuEcFH239UDgFBkuNF6jiVQJbDoB6aq7HIx20RHoONIvdqkfk+z0Uhf19lU6Scn5BbEamdTKV719GCJTOsHY7dLlJUFtBZ96URLL554dic0AyYiLTzRheFeVG0a0B00kRAPa+cpqfsU5RslYN8nX9dkoup/n7MsRFyNbpB377pKlAq+fQoMLbRYOZ+CE1Z2E/YSZa2IbIxoNuFZ+yQ9/PRd2SFuWlnZ9d1Rqae/Mhew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz/EJqNxtZwErFfPau8bE4CxTqIXEGY+hls0J+NPcCc=;
 b=huZsIjOL6uSbosocXzAiRarzji0Mj0HT3gYBNjs7/UMhhfD0we7Nz0zCtSUDwcbV+KonotGfZ9F3GVGRq8siGj1/yj6kuD5gNKed9YeOdAWbCRz9lgGrItZFgU7O6f7uanJ4CF8ZIR3mMqxU8hizYMCAh0/onHspZ6MEEjOSH4r8NfZnsix2n66vwLZNwsLlFCqBzX1P1Xkw2bGv3hjhxK3VwKN2myt82APAKiGbIqBw7yCJjSeDCoc3Crl85Id6beZHuM/gi/EXPJnKTl12Pw8l8xu9UuniD3T3nhDgnPSryeRD9Ytszk/aZKtLU7cIhuWTlBkr627n3LnfNo/NNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Wed, 18 Jan 2023 22:03:44 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::686:6197:9466:62b4%4]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 22:03:44 +0000
Date: Wed, 18 Jan 2023 16:03:40 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Iris <pawel.js@protonmail.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y8hsvMJ4hkxLJcpQ@lenny>
References: <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <328548ff-e95e-9a19-25e1-248c5d7d841f@redhat.com>
 <c3d0d769-ee09-de8e-ce12-b99e30371420@redhat.com>
 <Y8cLiz93syAiiNhb@lenny>
 <Y8cSInQoeNcQMi03@lenny>
 <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com>
 <Y8c7ZN6PZhYcUYUk@lenny>
 <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com>
 <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com>
 <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com>
X-ClientProxiedBy: SA9PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:806:20::16) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ee7702-c04c-4fef-31d5-08daf99fddba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMWwfKdwXyqQaH+5r0n9230ios331XF0QF/jAOsSDoQLsCeJ8txt+e5KmeG8BgLp07rgs6awWmNpGRCmKja3aWodfpJe6gxMjIhnlnmUfiilHr7xoMsX0diOSgecMveVGdxpBE6vBxyEzQyv/Y1M6yNhuY2Aow/mW7CU7PNAXrlY6Ylq0UXC9je1HHf5w6zbgYk4NBLFknIMxMJ6rqAph0TW0h5dGraf4KIpyb3vPVlUZjAePj97Ynem6LoU0aYYuRnOm/Chp0S5MUIdLsIDrn+e0vJKgSsZBA0HWbQLWrBKlMGZFXJeBPU/VsRpHSFk1wryKibh9wCv8afky5x4HqkuELv7gGqTOlV5M4W7EbkoZ1fFMnIMmIh4XMTfnG6p94F3SP392ZtSM+Yv2zQrv+iZOCdUc2ejH+WGjuFvhP8FM3Vc79SQuQj2lTBkZvEhVKgrutaa8XDQXSH7RA6cJEooPhtauHWtYlSkYfz8SggetUyhiJh6y6OByYoEF1OoBuVPMkeRcCaliZvdHgtgk2hmCtP1D6jxbg6/USYgzQhCo9iEjV2U8tMNkyjyJDbTYkc47w9vzZ9HAqlkkpQ2fSna31xvEOGpG2DGk7fP6gHtNnhsfF4wAyMz0O5OnnVE8P+Jq83js0Ocg2BgWvHpHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199015)(41300700001)(30864003)(53546011)(6506007)(5660300002)(6666004)(8936002)(2906002)(83380400001)(66556008)(6916009)(38100700002)(8676002)(66946007)(66476007)(33716001)(316002)(54906003)(478600001)(4326008)(6486002)(86362001)(186003)(26005)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yFQ3CjBUx4YXz3vLXXgZCjTk9h9+1lG7dvzCMgDEMk25+KxpaADCj1IsMXuT?=
 =?us-ascii?Q?19MKfkByhsZitGYrqyJf9ixQNVZFWtfMqfP1pxNzD7hz8lN5H/EXmqUE19ws?=
 =?us-ascii?Q?c8dcjgipO9Swn7yJyUT66MSWm3YHOj3zom/I6mVOdQEDCcItg19pbdI2BzSc?=
 =?us-ascii?Q?sQXN3vpUtvF9x3YYw0tJjqVJxejUpYSabijx0U8UuvbIuyvfkbGavSJs8Utg?=
 =?us-ascii?Q?C5qP3ox1gJkOiZvo5Yz+r77mQlS4CkehNnHHkWHF/EteyxEosUZ8YYASIuG0?=
 =?us-ascii?Q?OIrFjb785pSC3/hZe7w9Juo0zV3rLt89fqwhTa5+dkJjQzxvnVBpsVrkIfHk?=
 =?us-ascii?Q?dpxLEdslKZSz0ayEHMx5WNwvcW0j9O7txT7z21uh5c1gFPBZisnypTrsPMEs?=
 =?us-ascii?Q?R8kmlVVnKTtxyq1qF9jY/UVsyKP5g++EqV6SKZL+IYdvtNmw92VlVKOVG2kO?=
 =?us-ascii?Q?lJNpzr+IxVHgSNshvO04F8jrgkW1/2afnrtiVlgkwy8i7ZUUmxBxbVIg70Nu?=
 =?us-ascii?Q?wFq3KDWKnn3e3EygVVypADNiDqQPWtRs8qcqnaZ0zdBOUkHm14AgpAehJla+?=
 =?us-ascii?Q?CCVcuD5SrGUP/ADBnCOedOqfv7VqS+mZU15fa3gGDf7jOcWDUSF0PG+bttYq?=
 =?us-ascii?Q?JBLUCTz2dDO1xviOjMZ9Z6U0ZKO6H9IAIo4oUVV5XwH8dVedaCUjnlIXhd+x?=
 =?us-ascii?Q?/zTOAeEw5xI0WXyX168BMNZycFX1zN3NLW1W2gFW+cmsVfLES9mmZWyTi9mM?=
 =?us-ascii?Q?i/YQyKML8AbquNBcejit9ZFQsgzP3KQUulhR4QhGRK1AeYf3kiK3an3n1waR?=
 =?us-ascii?Q?iEYCuG/gSuswfg2sQSv0ZAQqYuamnlX7JEmFzjRRyYp9M66Z1HoeXv+udRid?=
 =?us-ascii?Q?KbbjPG1j6iFKhQ12gLGd/Rx/26ZJ2iYTzIzGgftS7TurM+Wl5rGqxXNVlJbT?=
 =?us-ascii?Q?b2EXQIGyCNxH1j1pFl3uiFkFTcvtNKXYiTlrrZwwoRRwuD+VRpsFEmlZVRXa?=
 =?us-ascii?Q?2biB43a3hfFOQ9aE96+vBlm6WiUXkLqUOp7ABt3hkIJqFWTz0cbIW0SoiMu5?=
 =?us-ascii?Q?sVmxLrCzxW7FBdqKY2f7TIKrmvMUrWt1y4dWM+2yMyVh0JjpliypCnapCOxr?=
 =?us-ascii?Q?bI5y/9Anb3htywr02QfFavAbjAByaFxLeUCXEavy1esVRzvKgB3H0h5lhJY7?=
 =?us-ascii?Q?+r1dSmtPZpSXwPCSzgJfUgXq+Nio81yPQ0mpskFkHCNOdrSxU9+lZ447v9iv?=
 =?us-ascii?Q?JOF1aXdrVAlAQl9MS3ZqxLoCnOTWdVFNrzKDeNSBxRArk+zHfnpwB5CPsUKa?=
 =?us-ascii?Q?e5eGvH0JOgt5OxNa+yR3Xebb34AOQj6HDzy5TbUfaWtBVyp87JUdsWgJuK3w?=
 =?us-ascii?Q?NGJElUJ0x5AjumP0T1RK8u3GN6cda1ehRpzBBu5y5A5FLTIA1cdZLisLGbag?=
 =?us-ascii?Q?HUT44V7gTt3I7DnMdAeKgUKAKhumGJHmAhB3Jf31tZ+9YhXkQxQ5NY1mWayx?=
 =?us-ascii?Q?2x6p6qCZMAjbj/RjzV056shxbDrrvpLtzErk4S5IjrTkpOFfexqjsHybJbSA?=
 =?us-ascii?Q?IeLnvPgahKfF3+Kc+t4jAyRy+doRs0K9+UVQe5Hw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ee7702-c04c-4fef-31d5-08daf99fddba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 22:03:44.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1y0fgrUK4CXE5Lh6Y3cIepUL86bNZI6SqJBlZpoZ1b3hWhK6I8pdRDh4chYx8zAIsN+81OjUI6bUo3jwNcz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343

On Wed, Jan 18, 2023 at 09:20:15PM +0000, Iris wrote:
> After loading the updated module, /sys/kernel/debug/acpi/mxds_mux_state reports "integrated".
> 
> Now, i ran the command
> sudo sh -c "echo discrete > /sys/kernel/debug/acpi/mxds_mux_state"
> 
> /sys/kernel/debug/acpi/mxds_mux_state now reads "discrete", but my screen didn't turn off... I changed it back to integrated, then to discrete again, it seems like nothing happened, or did i do something wrong?

I don't think you did anything wrong: it sounds like your system exposes
all of the dynamic mux switch ACPI interfaces (including reporting that
the backlight should be under EC control), but none of them actually do
anything. My best guess is that Dell is using the same firmware for both
dynamic mux and non-dyanmic mux (I suspect that there's actually no mux
at all on your system), but leaves the dynamic mux controls enabled in
ACPI even when they're irrelevant. Unfortunately this will make it
difficult to distinguish the systems that actually do have a dynamic mux
(and therefore must use EC backlight control) from ones that do not (and
therefore must *not* use EC backlight control). Hopefully we will be
able to find a way to do so. I am conferring with some of my colleagues
who work on the NVIDIA driver for Windows to see if they have run into
similar issues.

Would you be willing to share a dump of your ACPI tables? If you run
`acpidump -b`, it will write out several *.dat files (you'll probably
want to do this in an empty directory). Then tar up the files and send
them to me, probably directly to avoid sending a large attachment to the
whole list. I'm hoping there will be something in there that can be used
to discern whether the mux interfaces actually work. Usually the mux
stuff is in the DSDT table, but I've seen it in other tables (e.g. SSDT)
on some systems, so it's probably best to include all the dumped tables.

An nvidia-bug-report.log could be helpful to: if you have the NVIDIA
proprietary driver installed, it should have included a script called
nvidia-bug-report.sh somewhere in your PATH. The script collects various
bits of system information and writes it to a file named
nvidia-bug-report.log.gz in the current directory. If you do not have
the NVIDIA proprietary driver installed, you can extract the contents of
a .run installer package by executing it with the "-x" option on the
command line. This will create a directory populated with the various
files that the installer installs, including nvidia-bug-report.sh at the
top level of the newly create directory.
 
> 
> ------- Original Message -------
> On Wednesday, January 18th, 2023 at 21:41, Daniel Dadap <ddadap@nvidia.com> wrote:
> 
> 
> > Thanks, Iris:
> > 
> 
> > On Wed, Jan 18, 2023 at 09:33:19AM +0000, Iris wrote:
> > 
> 
> > > I have followed Youssef's instructions to build the module, and after loading it, /sys/kernel/debug/acpi/mxdm_mux_mode reports "dynamic"
> > 
> 
> > 
> 
> > That is unfortunate. I was hoping it would report a non-dynamic mode, which
> > would make it easier to disambiguate between G15 5515 models which require
> > EC backlight control and G15 5515 models which require native GPU-driven
> > backlight control.
> > 
> 
> > I have attached an updated version of the test module which will allow you
> > to test if your system does have a dynamic mux. Build and load it the same
> > way as the previous one (unload the previous one first if you haven't done
> > so or rebooted already). This adds /sys/kernel/debug/acpi/mxds_mux_state: if
> > you see this file, read out its contents. I expect that on your system it
> > should report "integrated", since IIUC the amdgpu_bl backlight device is the
> > one that works on your system. If you do not see this file, and the message
> > "MXDS not found" appears in your kernel log, then your ACPI table doesn't
> > expose the MXDS method, which could be a useful disambiguation test.
> > 
> 
> > Another experiment to try would be to flip the state of the mux. Before
> > attempting this experiment, make sure to save any work and log in remotely
> > from another machine, since it is possible that your screen will go blank
> > and will need a reboot in order to come back up. To change the mux state,
> > write the target mux state to the mxds_mux_state file. Use whatever the
> > opposite of the current value is, i.e., if it reads out as "integrated",
> > then write "discrete", and vice versa. If the mux switch worked, your
> > screen should go blank and reading the mxds_mux_state file again should
> > reflect the new state. You can then flip the mux back to its original
> > position, and you should be able to get the display back by forcing
> > DPMS off and then on again. If you're not running X, writing a '0' then
> > writing a '1' to /sys/kernel/debug/dri/0/eDP-1/trigger_hotplug seems to
> > work on my AMD+NVIDIA system. (The DRI device and eDP connector ID might
> > be enumerated differently on your system.) If neither of those work to
> > bring your display back up, then reboot the computer.
> > 
> 
> > The most interesting data would be to check whether MXDS is available in
> > your system's ACPI tables, and if so, whether it is actually functional.
> > 
> 
> > > As mentioned before, this RTX 3050 system does not have configurable GPU mode.
> > > 
> 
> > > ------- Original Message -------
> > > On Wednesday, January 18th, 2023 at 01:20, Daniel Dadap ddadap@nvidia.com wrote:
> > > 
> 
> > > > On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
> > > 
> 
> > > > > Hello Daniel,
> > > 
> 
> > > > > I tried building the module using the instructions you provided, but
> > > > > ran into some problems as I didn't have the /lib/modules/$(uname
> > > > > -r)/source directory on my end.
> > > > > I created a Makefile in a directory containing mxdm-debugfs.c file and
> > > > > added the following to it:
> > > 
> 
> > > > > obj-m += mxdm-debugfs.o
> > > 
> 
> > > > > all:
> > > > > make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
> > > 
> 
> > > > > clean:
> > > > > make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> > > 
> 
> > > > > I then ran "make" and loaded the module.
> > > 
> 
> > > > Ah, yes, I should have mentioned specifically that the instructions
> > > > assumed either a split Kbuild configuration with separate source and
> > > > output directories, or a single combined source and output directory but
> > > > with "source" and "build" both being symlinks to the same directory. I
> > > > forget which distros do what exactly, but some ship a combined
> > > > source/output directory but only have one of either "source" or "build";
> > > > yours appears to be the latter configuration. I'm glad you were able to
> > > > get it building anyway.
> > > 
> 
> > > > > 1) Hybrid mode set to "Enabled" from the bios settings,
> > > > > /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
> > > > > 2) Hybrid mode set to "Disabled" from the bios settings,
> > > > > /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.
> > > 
> 
> > > > Okay. This is consistent with my expectations. If we also find that the
> > > > systems which require the quirk report either "discrete", "hybrid", or
> > > > "integrated" (IIUC those systems do not have the mode configurable in the
> > > > UEFI settings), then I think we can fix the quirk by checking the mux
> > > > mode and only forcing to native if the system is not in hybrid mode.
> > > 
> 
> > > > Or perhaps we should just get rid of the quirk, and unconditionally test
> > > > the mux mode, and avoid using nvidia-wmi-ec-backlight on systems which
> > > > are not in "dynamic" mode, regardless of whether they expose the WMI EC
> > > > backlight interface and regardless of whether that interface reports
> > > > that the EC backlight driver should be used. (On the systems that need
> > > > the quirk, that interface is reporting that the backlight should be
> > > > EC-controlled even when it shouldn't be.) I think that in theory, it
> > > > should be possible for a system design to require EC backlight control
> > > > even when the mux is in a non-dynamic mode, but in practice I don't know
> > > > why anybody would do that, and am not aware of any systems which do so
> > > > (although until the report of the broken backlight on the 3050 version
> > > > of the Dell G15 5515, I wasn't aware of any systems that reported EC
> > > > backlight control when it was supposed to be native.)
> > > 
> 
> > > > Hans, I think the most reasonable options are:
> > > 
> 
> > > > 1) Remove the quirk, and check for MXDM when deciding whether a system
> > > > should use the EC backlight driver. This has the disadvantage of adding
> > > > a check where one isn't actually needed on some (most?) systems, and the
> > > > advantage of most likely avoiding the need to add quirks for other
> > > > systems where the system reports EC backlight control when native should
> > > > be used. It also has the possibility of being wrong on a theoretically
> > > > possible configuration, although if we ever encounter such a
> > > > configuration we could handle it with a quirk or find some other way to
> > > > distinguish between systems that do or do not require the EC backlight
> > > > driver.
> > > 
> 
> > > > 2) Keep the existing quirk, and only force to native if MXDM is missing
> > > > or if MXDM reports that the system is in a non-dynamic mode.
> > > 
> 
> > > > I'm inclined to go with (2), because it seems "safer", but am happy to
> > > > implement (1) if you think that's the better option. For the MXDM check
> > > > I think the first thing to do is to check whether the MXDM method is
> > > > present at all: as observed on at least one system, there is no MXDM
> > > > method when the system is in non-dynamic mode. Then if MXDM is present,
> > > > check whether it reports that the mux is in dynamic mode. For (1), only
> > > > query the WMI-wrapped API to determine the backlight control source if
> > > > the mux is in dynamic mode. For (2), only force the backlight to native
> > > > if the mux is not in dynamic mode.
> > > 
> 
> > > > This, again, assumes that none of the systems which require the quirk
> > > > report that the mux is in dynamic mode. If any of them do, we will need
> > > > to find a different way to determine which systems are lying about how
> > > > the backlight is supposed to be controlled.
> > > 
> 
> > > > > Regards,
> > > 
> 
> > > > > Youssef
> > > 
> 
> > > > > On Tue, 17 Jan 2023 at 23:24, Daniel Dadap ddadap@nvidia.com wrote:
> > > 
> 
> > > > > > Hans pointed out a crucial omission in the build instructions in a
> > > > > > different thread where I also shared this test module:
> > > 
> 
> > > > > > On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > > 
> 
> > > > > > > Thanks, Hans.
> > > 
> 
> > > > > > > On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > > 
> 
> > > > > > > > Hi All,
> > > 
> 
> > > > > > > > On 1/11/23 10:51, Hans de Goede wrote:
> > > 
> 
> > > > > > > > > Hi,
> > > 
> 
> > > > > > > > > On 1/11/23 01:40, Daniel Dadap wrote:
> > > 
> 
> > > > > > > > > > On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> > > 
> 
> > > > > > > > > > > Hi,
> > > 
> 
> > > > > > > > > > > On 1/10/23 16:19, Youssef Aly wrote:
> > > 
> 
> > > > > > > > > > > > Hi Hans,
> > > 
> 
> > > > > > > > > > > > Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > > > > > > > > > > > the kernel commandline for the patched kernel, it doesn't work without it.
> > > 
> 
> > > > > > > > > > > > I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > > > > > > > > > > > the modes with "acpi_backlight=nvidia_wmi_ec" and
> > > > > > > > > > > > "acpi_backlight=native" using the patched kernel (v6.1.4):
> > > 
> 
> > > > > > > > > > > > Hybrid:
> > > > > > > > > > > > "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > > > > > > > > > > > amdgpu_bl1.
> > > > > > > > > > > > "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > > > > > > > > > > > /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > > 
> 
> > > > > > > > > > > > Discrete:
> > > > > > > > > > > > "acpi_backlight=native": Works but when brightness from 0-10 is the
> > > > > > > > > > > > same as 0-100, for example 10 is full brightness like 100, 8 is the
> > > > > > > > > > > > same as 80, etc... ,
> > > > > > > > > > > > /sys/class/backlight contains nvidia_0.
> > > > > > > > > > > > "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > > > > > > > > > > > contains nvidia_wmi_ec_backlight.
> > > 
> 
> > > > > > > > > > > Thank you for testing!
> > > 
> 
> > > > > > > > > > > Ok so it seems there are 2 issues at play here:
> > > 
> 
> > > > > > > > > > > 1. Depending on the BIOS setting we need to use either native (discrete mode)
> > > > > > > > > > > or nvidia_wmi_ec (hybrid mode)
> > > 
> 
> > > > > > > > > > > 2. There is a bug in the nvidia binary drivers backlight control in native
> > > > > > > > > > > mode on this system causing the range to be wrong
> > > 
> 
> > > > > > > > > > > Daniel, we really need help from NVidia with fixing 1. can you see if
> > > > > > > > > > > there is a way to check the BIOS setting/mode from inside the kernel ?
> > > 
> 
> > > > > > > > > > Yes, the ACPI MXDM method should be able to do this. However, querying
> > > > > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
> > > > > > > > > > determine whether the backlight is supposed to be EC-driven, since there
> > > > > > > > > > are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
> > > > > > > > > > be orthogonal to whether or not the EC driver should be used. It sounds
> > > > > > > > > > like the BIOS is possibly reporting a wrong value for that query.
> > > 
> 
> > > > > > > > > > I guess we could wire up a quirk that checks MXDM and overrides the
> > > > > > > > > > WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
> > > > > > > > > > mux operation mode. Then that quirk could be applied to this system.
> > > > > > > > > > I can put together a patch for that.
> > > 
> 
> > > > > > > > > If you can write a patch for this that would be great, thank you,
> > > > > > > > > but I think we first need to root-cause this better:
> > > 
> 
> > > > > > > > > Currently the Dell G15 5515 is DMI quirked inside: drivers/apci/video_detect.c
> > > > > > > > > to always use the native backlight. So I've gone back to the original email
> > > > > > > > > thread which lead to me adding that quirk.
> > > 
> 
> > > > > > > > > We (I forwarded a mail from you to the reporter this was not on the list)
> > > > > > > > > did ask to test with different BIOS settings their to and the reporter's
> > > > > > > > > reply was:
> > > 
> 
> > > > > > > > > "Daniel wanted me to check different GPU modes, but my BIOS has no options
> > > > > > > > > for GPU. It's always in hybrid mode with PRIME render offload."
> > > 
> 
> > > > > > > > > And perhaps even more interesting in their case with acpi_backlight=native
> > > > > > > > > to disable nvidia-wmi-ec they have a working amdgpu_bl# device. Where as
> > > > > > > > > in Youssef's case when running in discrete mode there is an nvidia backlight
> > > > > > > > > device and in Youssef's case the amdgpu_bl# device never works.
> > > 
> 
> > > > > > > > > The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H CPU (with iGPU)
> > > 
> 
> > > > > > > > > While the dGPU can be one of:
> > > > > > > > > NVIDIA GeForce RTX 3060
> > > > > > > > > NVIDIA GeForce GTX 3050 Ti
> > > > > > > > > NVIDIA GeForce GTX 3050
> > > 
> 
> > > > > > > > > I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code may only
> > > > > > > > > be relevant to the model with the 3060 and that nvidia-wmi-ec should
> > > > > > > > > maybe not load at all on the model with the 3050 versions.
> > > 
> 
> > > > > > > > A quick status update on this.
> > > 
> 
> > > > > > > > Iris (added to the Cc), the reporter with the Dell G15 5515 which lead me
> > > > > > > > to add the acpi_backlight=native DMI quirk for the Dell G15 5515 has
> > > > > > > > gotten back to me with lspci output on their G15 and it indeed has
> > > > > > > > a GTX 3050.
> > > 
> 
> > > > > > > > So atm we have the following models which are affected one way
> > > > > > > > or the other:
> > > 
> 
> > > > > > > > -Acer Predator PH315-55: needs acpi_backlight=native
> > > > > > > > -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
> > > > > > > > -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native :(
> > > 
> 
> > > > > > > > With the models which need acpi_backlight=native being broken
> > > > > > > > by (false positive) detection of the laptop needing nvidia-wmi-ec
> > > > > > > > for backlight control while they actually should not be using that.
> > > 
> 
> > > > > > > > and with the Dell G15 5515 with RTX 3060 atm being broken because
> > > > > > > > of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> > > 
> 
> > > > > > > I've attached a simple kernel module which adds a debugfs file that
> > > > > > > reports the current mux mode. As mentioned elsewhere, I suspect that the
> > > > > > > systems which need the quirk may be in one of the non-dynamic modes, and
> > > > > > > the systems which are broken by the quirk may be in dynamic mux mode. It
> > > > > > > should be pretty straightforward to compile this as an out-of-tree
> > > > > > > module using the Kbuild extmod infrastructure, as follows:
> > > 
> 
> > > > > > > 1) Change to the directory containing the mxdm-debugfs.c file (you may
> > > > > > > wish to create an empty directory to put it in) and create a file in
> > > > > > > that directory containing the following line:
> > > 
> 
> > > > > > The name of this file should be 'Kbuild'. Sorry for the noise.
> > > 
> 
> > > > > > > obj-m += mxdm-debugfs.o
> > > 
> 
> > > > > > > 2) Build the kernel module:
> > > 
> 
> > > > > > > make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname -r)/build M=$(pwd)
> > > 
> 
> > > > > > > (The "source" and "build" paths under /lib/modules/`uname -r` should
> > > > > > > be the correct paths in almost all cases; if your system uses
> > > > > > > different paths, substitute those. You will need the development
> > > > > > > headers for external kernel modules, and the relevant toolchain bits,
> > > > > > > but if you're already using the NVIDIA proprietary driver you almost
> > > > > > > certainly already have all of that.)
> > > 
> 
> > > > > > > 3) Load the kernel module:
> > > 
> 
> > > > > > > insmod ./mxdm-debugfs.ko
> > > 
> 
> > > > > > > This should create a file at /sys/kernel/debug/acpi/mxdm_mux_mode.
> > > > > > > Reading this file should report the current mux operation mode.
> > > 
> 
> > > > > > > While switching mux modes on a dynamic mux system to test this kernel
> > > > > > > module, I noticed that the ACPI tables no longer exposed the MXDM method
> > > > > > > when the mux mode was set to discrete only on that particular system.
> > > > > > > This contradicted the behavior I had previously observed on other
> > > > > > > systems; i.e., that MXDM is always available regardless of the currently
> > > > > > > set mux mode, so I tried it on another dynamic mux system and observed
> > > > > > > that the other system does always expose MXDM regardless of the mux
> > > > > > > mode, and the contents of the debugfs file matched the selected mode.
> > > 
> 
> > > > > > > So if the module fails to load with ENODEV and prints the "MXDM not
> > > > > > > found" message to the kernel log, the system is most likely configured
> > > > > > > to a non-dynamic mux mode. My usual expectation is that it should load
> > > > > > > and create the file on most dynamic mux systems. I do not have direct
> > > > > > > access to any of the above listed systems at the moment, so I do not
> > > > > > > know whether MXDM will be exposed when the system is not in dynamic mux
> > > > > > > mode.
> > > 
> 
> > > > > > > > Regards,
> > > 
> 
> > > > > > > > Hans
> > > 
> 
> > > > > > > // SPDX-License-Identifier: GPL-2.0-only
> > > > > > > /*
> > > > > > > * Copyright (C) 2020 NVIDIA Corporation
> > > > > > > *
> > > > > > > */
> > > 
> 
> > > > > > > #include <linux/acpi.h>
> > > > > > > #include <acpi/acoutput.h>
> > > > > > > #include <linux/module.h>
> > > > > > > #include <linux/pci.h>
> > > > > > > #include <linux/debugfs.h>
> > > 
> 
> > > > > > > extern struct dentry *acpi_debugfs_dir;
> > > 
> 
> > > > > > > enum mux_mode {
> > > > > > > MUX_MODE_UNKNOWN = 0,
> > > > > > > MUX_MODE_INTEGRATED = 1, /* iGPU only /
> > > > > > > MUX_MODE_DISCRETE = 2, / dGPU only /
> > > > > > > MUX_MODE_HYBRID = 3, / Dual GPU, mux switched to iGPU /
> > > > > > > MUX_MODE_DYNAMIC = 4, / Dual GPU, dynamic mux switching */
> > > > > > > MUX_MODE_MAX
> > > > > > > };
> > > 
> 
> > > > > > > static char * mode_names[] = {
> > > > > > > [MUX_MODE_UNKNOWN] = "unknown\n",
> > > > > > > [MUX_MODE_INTEGRATED] = "integrated\n",
> > > > > > > [MUX_MODE_DISCRETE] = "discrete\n",
> > > > > > > [MUX_MODE_HYBRID] = "hybrid\n",
> > > > > > > [MUX_MODE_DYNAMIC] = "dynamic\n",
> > > > > > > };
> > > 
> 
> > > > > > > static struct debugfs_blob_wrapper muxmode_blob;
> > > 
> 
> > > > > > > static void store_mux_mode(acpi_handle handle)
> > > > > > > {
> > > > > > > union acpi_object arg = { .integer = { .type = ACPI_TYPE_INTEGER, .value = 0 } };
> > > > > > > struct acpi_object_list in = { .count = 1, .pointer = &arg };
> > > 
> 
> > > > > > > acpi_integer ret;
> > > > > > > acpi_status status;
> > > 
> 
> > > > > > > status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> > > 
> 
> > > > > > > if (ACPI_FAILURE(status)) {
> > > > > > > acpi_handle_err(handle, "ACPI MXDM failed: %s\n", acpi_format_exception(status));
> > > > > > > muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > > > > > > } else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
> > > > > > > acpi_handle_err(handle, "Mux mode value out of range");
> > > > > > > muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > > > > > > } else {
> > > > > > > muxmode_blob.data = mode_names[ret];
> > > > > > > }
> > > 
> 
> > > > > > > muxmode_blob.size = strlen(muxmode_blob.data);
> > > > > > > }
> > > 
> 
> > > > > > > static acpi_status find_mxdm(acpi_handle obj, u32 level, void *ctx, void **ret)
> > > > > > > {
> > > > > > > acpi_handle search;
> > > 
> 
> > > > > > > if (acpi_get_handle(obj, "MXDM", &search) == 0) {
> > > > > > > /* Found the parent object of the MXDM method; pass it back
> > > > > > > * to the caller and stop searching. */
> > > > > > > *ret = obj;
> > > 
> 
> > > > > > > return AE_CTRL_TERMINATE;
> > > > > > > }
> > > 
> 
> > > > > > > /* No MXDM; keep looking */
> > > > > > > return AE_OK;
> > > > > > > }
> > > 
> 
> > > > > > > static struct dentry *muxmode_file_dentry;
> > > 
> 
> > > > > > > static int __init mxdm_debugfs_init(void)
> > > > > > > {
> > > > > > > acpi_handle mxdm_handle = NULL;
> > > > > > > acpi_status ret;
> > > 
> 
> > > > > > > ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> > > > > > > find_mxdm, NULL, NULL, &mxdm_handle);
> > > 
> 
> > > > > > > if (ACPI_FAILURE(ret) || !mxdm_handle) {
> > > > > > > pr_err("MXDM not found.\n");
> > > > > > > return -ENODEV;
> > > > > > > }
> > > 
> 
> > > > > > > /* Populate the blob wrapper: the mux mode cannot change without rebooting
> > > > > > > * so this only needs to be done once. */
> > > > > > > store_mux_mode(mxdm_handle);
> > > 
> 
> > > > > > > muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
> > > > > > > acpi_debugfs_dir,
> > > > > > > &muxmode_blob);
> > > 
> 
> > > > > > > return muxmode_file_dentry ? 0 : -EIO;
> > > > > > > }
> > > > > > > module_init(mxdm_debugfs_init);
> > > 
> 
> > > > > > > static void __exit mxdm_debugfs_exit(void)
> > > > > > > {
> > > > > > > if (muxmode_file_dentry) {
> > > > > > > debugfs_remove(muxmode_file_dentry);
> > > > > > > muxmode_file_dentry = NULL;
> > > > > > > }
> > > > > > > }
> > > > > > > module_exit(mxdm_debugfs_exit);
> > > 
> 
> > > > > > > MODULE_LICENSE("GPL v2");
> > > > > > > MODULE_DESCRIPTION("MXDM mux mode test module");
> > > > > > > MODULE_AUTHOR("Daniel Dadap ddadap@nvidia.com");
> > > 
> 
> > > > > > > /*
> > > > > > > * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
> > > > > > > * the WMI wrapper for the related WMAA method for backlight control.
> > > > > > > */
> > > > > > > MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
> > 
> 
> > 
> 
> > 



