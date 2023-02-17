Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B6323E
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 18:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiQodfdRLS84RKp2UG5aEkgye+fW+uh3+cjzp73AKvdMIvXoyZrJh977Hw1L7Pnro3LJJzo/mYffxHYRVJv+GedVVkfKSgWrwPUz3CRVODmKGy/3tK+RymAVsXP+soT4ZiovN8qQFBrw5WhZADIiW7N3v6K3Q1YILGyjTK18zsNmf1VT65U81w6Dc6PzpK+1vs0yhLdGi3o8rkcYw59c4LQdHuLgQil4B2tlmIz90EnsPbLlVVQQ0ikMj3ekR5P+ErZTU95jcgmQcWmkJQn+21ZGV9YhUykqKB5P3HqSwOjiGM5uBcyM01szh3Rte+myEsqdiboSC2u1E0ikMsYKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoTvf/5tvKBWNLvWUrta2hyRfwNKbMnlzd0I26ITic4=;
 b=TNgixPgaRa11CJfYn1Ft/C2iHmuD/Ej9VU7lsUJ0R8Dw/tjLJTvNX/h5hjZOMReI7WsBXHcwJWW/PqUMHIVF+hfic7obM5z0Zysd/PERz93EzkdjazYRTEG4z1A+FEKovJ/JHoORkviZFt1OkNeIcnv7UzXSq7d6g2GXG74CCwC4A1g0q4NXjoK6j0YT2KQaP+NInDauCnHIqe2SX8AlL29f06uXIQTVJq4vV52dc1cz0u8IibsFS7Locqy4fXIx+l+ZVqh4ULVwQ+hq3OrNR6seDD+J1UZEgA8fte0EPz+QSWZbStX/lVCsxt5Vw4kf+u3WPyVK2/e6L48o9XDe/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoTvf/5tvKBWNLvWUrta2hyRfwNKbMnlzd0I26ITic4=;
 b=rG1kF8dUjjjOIp0hCdkmaz4IBhESoJNGLOmU8y1OEgK6an6q6Z1HqbFPEV39GCrDSnia1c8bAKmZcfxlwBPT4k1j2L7xC/ZwnGy02MqdcZ7gpF4SICxErAb/6EYPh5WOdnEYaudSBg4Qp25nMZAA5NvgrFw5Bur1b9zfd3aX8gmbdnSe+xNtSiz7STCwr82uBdI2Ic+xvqli7tDJIabS/Vnc8lm5NtS2Y0cnSImCIRhaE4AqKRVbqvJnI86rJ1XHUZMLx5s83FIPhGavbVnn6orUVawiPLwqsQQ91FgaIkDkjiLjwVul+sHVdAKSN8CVcer24bKIM+GkLYl76oJNPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MW4PR12MB6826.namprd12.prod.outlook.com (2603:10b6:303:20c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Fri, 17 Feb 2023 18:56:16 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%6]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 18:56:16 +0000
Date: Fri, 17 Feb 2023 12:56:13 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Youssef Aly <youssefaswad@gmail.com>
Cc: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Hans de Goede <hdegoede@redhat.com>, Iris <pawel.js@protonmail.com>,
	regressions <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y+/NzXqrgapfi/PY@ddadap-lakeline.nvidia.com>
References: <Y8cSInQoeNcQMi03@lenny>
 <CAKsK3A=_cctYWN8yZENKinXpbLN044=6bwxgc4vGVWO6gQS6fA@mail.gmail.com>
 <Y8c7ZN6PZhYcUYUk@lenny>
 <puKRccbkfHoaOq-TeL9mDuGsOgNonrrNtgJrSeu6JbBeze4eLbSuEdyFxxIRzRTtNeVUQrrXZW9r2IsDMj5mHypSW_ZWz5ieQ2HmW8dDDZs=@protonmail.com>
 <Y8hZglIA/R3w62Qn@ddadap-lakeline.nvidia.com>
 <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com>
 <CAKsK3AnyP-ZXBhRzUsCa0+AVbd3hGxqfvoeQEvpihGqFEzM61A@mail.gmail.com>
 <Y8hue7X63tHpDBZR@lenny>
 <cf34615b-a23c-4e3c-5180-f285be514f34@leemhuis.info>
 <CAKsK3AndZCBGaiJbQMMo9i9Gg5BHuLpvVY2tTAJWrbJ-RETZAQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKsK3AndZCBGaiJbQMMo9i9Gg5BHuLpvVY2tTAJWrbJ-RETZAQ@mail.gmail.com>
X-ClientProxiedBy: SA1P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::8) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|MW4PR12MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 55be36a3-f65f-4eb0-c32f-08db1118a5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+mL7rGnRNl+x8BVm9jxBdm1FgvDJuqlwH4nAK428xaE6QLM3VYJb9jAYoPcDcE+BVJ8Cigd1Xnd8bN1ocp0gcLLu26/mtg1wRd1bEQz0LiUZimzgTvMBBm9lgFEZ6plBhDgyDwPsPxlhj67MPQbMFHLn6DQAfWk/dSjh05WD9zkcvv+yST7mbzn5S7ajJQdmry4Ba8DhNdHTsUFuJkoOflY1qJjVpG5HoFC47n24YhvlBybm4DYitnLkaQinVd0pSc0962zXYKot+kIrsptzHGaS4SPxp8gSid07E/ecxJ8YzQxMNHQVhRKVRIAxTLO4LCJUodyGfAgGpvGlcMddQEJz4UojBVe470WRWQJ8ue+j/x5PvOJLE/KPEyk6+6NWPb1oQLqLkAFeCgvuZwKGbpqEDl1jyOS+BMgV8d+sE+6fVDKY1vhUuqIQDUx7PQCOFQ8DoRYMlQ1475SdHavqZw84RrrMvVYKxQPzZtcblV+F/dwKcjyPiA2B6UgdH1DDg01sLx0fz9kkPfq+72gtOX/yR2gJ0B25IKwN2Qtg8duEKB4VICQUV5nlx1WwUSFVcNQCB5g9sJb2j6D6hzyvcf0Vq6Uquf0uddfNcCdQ5ilfZ2PCTWZErrb+ZWPpdDHD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(53546011)(316002)(2906002)(6666004)(478600001)(38100700002)(30864003)(6512007)(8936002)(4326008)(8676002)(86362001)(41300700001)(6916009)(66476007)(66556008)(5660300002)(6506007)(26005)(66946007)(186003)(966005)(83380400001)(6486002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9UdwPAcjHJ+zHZjPkLbCvAORPbd4KnlQbieMLKEAN5KkjWldXn0+J1WwXdCK?=
 =?us-ascii?Q?PTjByq31HeVwNacRNcA0oyjapEbyIccBbLmbJDaB1UyxzTyO0Oqj1oUvxKfj?=
 =?us-ascii?Q?KysnKTGiDb2/nZfRvzIrsbtSrn8xZb/Xmd/i44/YMjF1IUO1xHKukkfAhRGM?=
 =?us-ascii?Q?5FN+1ga8R6uTwF0nFmsXssZNiN0WEzGH1s+fAjEtpChR2Wqx8StDpQ+zxB7C?=
 =?us-ascii?Q?Eb1jQ0dCVnQYCBetWi/PTNZWcK+W6Ore0rSGfqgsKK9uMWb0hTE27JfB03WE?=
 =?us-ascii?Q?lfPh50MGi60/Hz/gN8ksOZ5Q0eGv9A3ZPw8P4I2l6+2z4g+K78B7Ngfwc5Nt?=
 =?us-ascii?Q?tihS/aq5GJz2+5SlL76P8x3luwKDGhjzg+D4w+/UE0VHYDb/Ld8i9Dkvey8y?=
 =?us-ascii?Q?7O4dAB9wxk/jFmxNJTNMz4DjDh2vxVtkCmZD08WLt4+kR4tW6JSxHJeYI/vn?=
 =?us-ascii?Q?fh3YN0yAkv9Si6/aYBoGdMnrOqUVzhzNk8SnH3tT2dXJFYln31Aq2ylKRTZj?=
 =?us-ascii?Q?9vPao8OSJbmLktJqiKILWPCwRX4XvONdvepWROFO4vk719qONmpZAOYFQ9tW?=
 =?us-ascii?Q?N7VzsSgjG53JmaDKa//HMzHXyMO7mtqoBHyjiHe2PTL55iEE+1vOUsZcIcyI?=
 =?us-ascii?Q?tg8klnfJ9Sa4NT77lL67eoqjTY+QEutvufGzznfq337QmXmyDOpKpMdCG3oU?=
 =?us-ascii?Q?BS36LGc3G3PHlmMOKbnVL9qERqhQJdKo0NTBQzB9+owIGVWuNdyuM/VKrvRy?=
 =?us-ascii?Q?Qnyaib17ZLadVw1krEONku5ww4xGfk4UPK0N7yYnSVxcKE0BIo3swb+bbvIY?=
 =?us-ascii?Q?HNa3d+Qa7FHxdvjLJhWKyk3hM4Vi0hmdMyE7cGDwfkrrJKD5fWL+5DfMbAKH?=
 =?us-ascii?Q?/q7IGT66vscY5ajY4JYVbHrtveLUz169Rnnwt7z9lotbm7hvmNBkk+l164px?=
 =?us-ascii?Q?z1uPA3weslXnC1G16kC8Buc0r64ROScUUyEY1LdSIVDzFnPSYMQ5oBF6Opdo?=
 =?us-ascii?Q?vY2ZvnYtpylgCbff6FlDRUp041ZlGYob2gPcU4jF0IaMxG8W8AMXm8SZGYBS?=
 =?us-ascii?Q?mxMBa9HDEnstQJSpg4rWh5e9ScgPgyqp5ZXQCZkGREQpP/thBCRlMpD6dt1k?=
 =?us-ascii?Q?4fTKtW2rqzmIJg28LwxkZh8YocOfNd1iQ4bcYMv/F2deRrI0FKArOIn4NXJq?=
 =?us-ascii?Q?OJovSn7fr2fk8aElKMgSHoVfG6QKOmhes6l0AWfA1ChLbw4j/gxmvtFoTOMa?=
 =?us-ascii?Q?rpgOColW+/yVIJ5ORCduq1cCjS3bwAmdFeDaNPR8BWz4VWyV9hibcK6CBB1E?=
 =?us-ascii?Q?WTjxUP8xAwQV2RQefk/lraaI9Tc8BY6PAMmGY5anhu7n+GWSMTNa9xiOYGiv?=
 =?us-ascii?Q?1taVqVNXzRxYghIiV8QpML34NszQNGwUOMa+vdO61yH4378tn/qwbedQoznm?=
 =?us-ascii?Q?o+ma8tbnTwgRAHHzuWtcPFQDT1RzZ+Kr8WjUnCxJUJLOOxsJA/eXkAkEgR6k?=
 =?us-ascii?Q?aD54gmOX11evFYl6P+Iu/9yvTfnJiUOilk7Z7lgmTvDfKO0PVFrebg8R5Het?=
 =?us-ascii?Q?kh0ZvF31ClcH+upeoQMWbqN+O+eCmKqNm3qRCiOK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55be36a3-f65f-4eb0-c32f-08db1118a5a7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 18:56:16.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVa4QmRSUbjB4rf8sp72nplWq+9Q1gvz1KvdDBjfktfgTpRWImRNlUwlZJ44X3fWfxi+Ryqm+rqoaC6aeIMZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6826

On Fri, Feb 17, 2023 at 05:04:52PM +0200, Youssef Aly wrote:
> Yes, I sent the data to daniel. I am currently just using an older kernel
> (6.0) before the regression.

Thanks, Youssef. I am also only seeing the test kernel module results as
the most recent message I have from you. If you sent the ACPI table dumps
as an attachment, there is a chance they got filtered out - this happened
with another ACPI dump that somebody tried to send me. Perhaps posting the
files to a file sharing site might work better - it would be interesting
to compare your ACPI table dump to another from a different 5515 model.

> On Fri, Feb 17, 2023, 2:36 PM Linux regression tracking (Thorsten Leemhuis)
> <regressions@leemhuis.info> wrote:
> 
> > On 18.01.23 23:11, Daniel Dadap wrote:
> > > On Thu, Jan 19, 2023 at 12:02:50AM +0200, Youssef Aly wrote:
> > >> I loaded the updated module and /sys/kernel/debug/acpi/mxds_mu
> > >> x_state contained "integrated".
> > >>
> > >> I ran
> > >> echo "discrete" > /sys/kernel/debug/acpi/mxds_mux_state
> > >> now it contained ''discrete' and the screen turned off.
> > >> then I return it to its initial state.
> > >>
> > >> Tried echo '0' > /sys/kernel/debug/dri/1/eDP-1/trigger_hotplug then '1'
> > >> but it didn't work, had to reboot, I am running gnome on wayland.
> > >
> > > Your system does allow you to switch the mux mode in the UEFI setup
> > > screen, correct? If you could share your ACPI tables as well (see the
> > > instructions in a fork of this thread) that would be helpful.
> >
> > I might be missing something, but it looks like this discussion stalled
> > here.
> >
> > Youssef Aly, did you ever share the data Daniel asked for? Or did you
> > stop caring? Maybe because it works / you found a workaround?
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >
> > #regzbot poke
> >
> > > It sounds like your system has a functional dynamic mux, which would be
> > > consistent with being able to choose different mux modes in UEFI setup.
> > > The screen not coming back up isn't a big concern: triggering the
> > > hotplug is something that's *supposed* to work (and it worked on the
> > > AMD+NVIDIA system I tried it on), but I am not surprised if it doesn't
> > > work everywhere.
> > >
> > >>
> > >> On Wed, 18 Jan 2023 at 23:20, Iris <pawel.js@protonmail.com> wrote:
> > >>>
> > >>> After loading the updated module,
> > /sys/kernel/debug/acpi/mxds_mux_state reports "integrated".
> > >>>
> > >>> Now, i ran the command
> > >>> sudo sh -c "echo discrete > /sys/kernel/debug/acpi/mxds_mux_state"
> > >>>
> > >>> /sys/kernel/debug/acpi/mxds_mux_state now reads "discrete", but my
> > screen didn't turn off... I changed it back to integrated, then to discrete
> > again, it seems like nothing happened, or did i do something wrong?
> > >>>
> > >>>
> > >>> ------- Original Message -------
> > >>> On Wednesday, January 18th, 2023 at 21:41, Daniel Dadap <
> > ddadap@nvidia.com> wrote:
> > >>>
> > >>>
> > >>>> Thanks, Iris:
> > >>>>
> > >>>
> > >>>> On Wed, Jan 18, 2023 at 09:33:19AM +0000, Iris wrote:
> > >>>>
> > >>>
> > >>>>> I have followed Youssef's instructions to build the module, and
> > after loading it, /sys/kernel/debug/acpi/mxdm_mux_mode reports "dynamic"
> > >>>>
> > >>>
> > >>>>
> > >>>
> > >>>> That is unfortunate. I was hoping it would report a non-dynamic mode,
> > which
> > >>>> would make it easier to disambiguate between G15 5515 models which
> > require
> > >>>> EC backlight control and G15 5515 models which require native
> > GPU-driven
> > >>>> backlight control.
> > >>>>
> > >>>
> > >>>> I have attached an updated version of the test module which will
> > allow you
> > >>>> to test if your system does have a dynamic mux. Build and load it the
> > same
> > >>>> way as the previous one (unload the previous one first if you haven't
> > done
> > >>>> so or rebooted already). This adds
> > /sys/kernel/debug/acpi/mxds_mux_state: if
> > >>>> you see this file, read out its contents. I expect that on your
> > system it
> > >>>> should report "integrated", since IIUC the amdgpu_bl backlight device
> > is the
> > >>>> one that works on your system. If you do not see this file, and the
> > message
> > >>>> "MXDS not found" appears in your kernel log, then your ACPI table
> > doesn't
> > >>>> expose the MXDS method, which could be a useful disambiguation test.
> > >>>>
> > >>>
> > >>>> Another experiment to try would be to flip the state of the mux.
> > Before
> > >>>> attempting this experiment, make sure to save any work and log in
> > remotely
> > >>>> from another machine, since it is possible that your screen will go
> > blank
> > >>>> and will need a reboot in order to come back up. To change the mux
> > state,
> > >>>> write the target mux state to the mxds_mux_state file. Use whatever
> > the
> > >>>> opposite of the current value is, i.e., if it reads out as
> > "integrated",
> > >>>> then write "discrete", and vice versa. If the mux switch worked, your
> > >>>> screen should go blank and reading the mxds_mux_state file again
> > should
> > >>>> reflect the new state. You can then flip the mux back to its original
> > >>>> position, and you should be able to get the display back by forcing
> > >>>> DPMS off and then on again. If you're not running X, writing a '0'
> > then
> > >>>> writing a '1' to /sys/kernel/debug/dri/0/eDP-1/trigger_hotplug seems
> > to
> > >>>> work on my AMD+NVIDIA system. (The DRI device and eDP connector ID
> > might
> > >>>> be enumerated differently on your system.) If neither of those work to
> > >>>> bring your display back up, then reboot the computer.
> > >>>>
> > >>>
> > >>>> The most interesting data would be to check whether MXDS is available
> > in
> > >>>> your system's ACPI tables, and if so, whether it is actually
> > functional.
> > >>>>
> > >>>
> > >>>>> As mentioned before, this RTX 3050 system does not have configurable
> > GPU mode.
> > >>>>>
> > >>>
> > >>>>> ------- Original Message -------
> > >>>>> On Wednesday, January 18th, 2023 at 01:20, Daniel Dadap
> > ddadap@nvidia.com wrote:
> > >>>>>
> > >>>
> > >>>>>> On Wed, Jan 18, 2023 at 01:13:54AM +0200, Youssef Aly wrote:
> > >>>>>
> > >>>
> > >>>>>>> Hello Daniel,
> > >>>>>
> > >>>
> > >>>>>>> I tried building the module using the instructions you provided,
> > but
> > >>>>>>> ran into some problems as I didn't have the /lib/modules/$(uname
> > >>>>>>> -r)/source directory on my end.
> > >>>>>>> I created a Makefile in a directory containing mxdm-debugfs.c file
> > and
> > >>>>>>> added the following to it:
> > >>>>>
> > >>>
> > >>>>>>> obj-m += mxdm-debugfs.o
> > >>>>>
> > >>>
> > >>>>>>> all:
> > >>>>>>> make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
> > >>>>>
> > >>>
> > >>>>>>> clean:
> > >>>>>>> make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
> > >>>>>
> > >>>
> > >>>>>>> I then ran "make" and loaded the module.
> > >>>>>
> > >>>
> > >>>>>> Ah, yes, I should have mentioned specifically that the instructions
> > >>>>>> assumed either a split Kbuild configuration with separate source and
> > >>>>>> output directories, or a single combined source and output
> > directory but
> > >>>>>> with "source" and "build" both being symlinks to the same
> > directory. I
> > >>>>>> forget which distros do what exactly, but some ship a combined
> > >>>>>> source/output directory but only have one of either "source" or
> > "build";
> > >>>>>> yours appears to be the latter configuration. I'm glad you were
> > able to
> > >>>>>> get it building anyway.
> > >>>>>
> > >>>
> > >>>>>>> 1) Hybrid mode set to "Enabled" from the bios settings,
> > >>>>>>> /sys/kernel/debug/acpi/mxdm_mux_mode contained dynamic.
> > >>>>>>> 2) Hybrid mode set to "Disabled" from the bios settings,
> > >>>>>>> /sys/kernel/debug/acpi/mxdm_mux_mode contained discrete.
> > >>>>>
> > >>>
> > >>>>>> Okay. This is consistent with my expectations. If we also find that
> > the
> > >>>>>> systems which require the quirk report either "discrete", "hybrid",
> > or
> > >>>>>> "integrated" (IIUC those systems do not have the mode configurable
> > in the
> > >>>>>> UEFI settings), then I think we can fix the quirk by checking the
> > mux
> > >>>>>> mode and only forcing to native if the system is not in hybrid mode.
> > >>>>>
> > >>>
> > >>>>>> Or perhaps we should just get rid of the quirk, and unconditionally
> > test
> > >>>>>> the mux mode, and avoid using nvidia-wmi-ec-backlight on systems
> > which
> > >>>>>> are not in "dynamic" mode, regardless of whether they expose the
> > WMI EC
> > >>>>>> backlight interface and regardless of whether that interface reports
> > >>>>>> that the EC backlight driver should be used. (On the systems that
> > need
> > >>>>>> the quirk, that interface is reporting that the backlight should be
> > >>>>>> EC-controlled even when it shouldn't be.) I think that in theory, it
> > >>>>>> should be possible for a system design to require EC backlight
> > control
> > >>>>>> even when the mux is in a non-dynamic mode, but in practice I don't
> > know
> > >>>>>> why anybody would do that, and am not aware of any systems which do
> > so
> > >>>>>> (although until the report of the broken backlight on the 3050
> > version
> > >>>>>> of the Dell G15 5515, I wasn't aware of any systems that reported EC
> > >>>>>> backlight control when it was supposed to be native.)
> > >>>>>
> > >>>
> > >>>>>> Hans, I think the most reasonable options are:
> > >>>>>
> > >>>
> > >>>>>> 1) Remove the quirk, and check for MXDM when deciding whether a
> > system
> > >>>>>> should use the EC backlight driver. This has the disadvantage of
> > adding
> > >>>>>> a check where one isn't actually needed on some (most?) systems,
> > and the
> > >>>>>> advantage of most likely avoiding the need to add quirks for other
> > >>>>>> systems where the system reports EC backlight control when native
> > should
> > >>>>>> be used. It also has the possibility of being wrong on a
> > theoretically
> > >>>>>> possible configuration, although if we ever encounter such a
> > >>>>>> configuration we could handle it with a quirk or find some other
> > way to
> > >>>>>> distinguish between systems that do or do not require the EC
> > backlight
> > >>>>>> driver.
> > >>>>>
> > >>>
> > >>>>>> 2) Keep the existing quirk, and only force to native if MXDM is
> > missing
> > >>>>>> or if MXDM reports that the system is in a non-dynamic mode.
> > >>>>>
> > >>>
> > >>>>>> I'm inclined to go with (2), because it seems "safer", but am happy
> > to
> > >>>>>> implement (1) if you think that's the better option. For the MXDM
> > check
> > >>>>>> I think the first thing to do is to check whether the MXDM method is
> > >>>>>> present at all: as observed on at least one system, there is no MXDM
> > >>>>>> method when the system is in non-dynamic mode. Then if MXDM is
> > present,
> > >>>>>> check whether it reports that the mux is in dynamic mode. For (1),
> > only
> > >>>>>> query the WMI-wrapped API to determine the backlight control source
> > if
> > >>>>>> the mux is in dynamic mode. For (2), only force the backlight to
> > native
> > >>>>>> if the mux is not in dynamic mode.
> > >>>>>
> > >>>
> > >>>>>> This, again, assumes that none of the systems which require the
> > quirk
> > >>>>>> report that the mux is in dynamic mode. If any of them do, we will
> > need
> > >>>>>> to find a different way to determine which systems are lying about
> > how
> > >>>>>> the backlight is supposed to be controlled.
> > >>>>>
> > >>>
> > >>>>>>> Regards,
> > >>>>>
> > >>>
> > >>>>>>> Youssef
> > >>>>>
> > >>>
> > >>>>>>> On Tue, 17 Jan 2023 at 23:24, Daniel Dadap ddadap@nvidia.com
> > wrote:
> > >>>>>
> > >>>
> > >>>>>>>> Hans pointed out a crucial omission in the build instructions in a
> > >>>>>>>> different thread where I also shared this test module:
> > >>>>>
> > >>>
> > >>>>>>>> On Tue, Jan 17, 2023 at 02:56:46PM -0600, Daniel Dadap wrote:
> > >>>>>
> > >>>
> > >>>>>>>>> Thanks, Hans.
> > >>>>>
> > >>>
> > >>>>>>>>> On Mon, Jan 16, 2023 at 05:46:46PM +0100, Hans de Goede wrote:
> > >>>>>
> > >>>
> > >>>>>>>>>> Hi All,
> > >>>>>
> > >>>
> > >>>>>>>>>> On 1/11/23 10:51, Hans de Goede wrote:
> > >>>>>
> > >>>
> > >>>>>>>>>>> Hi,
> > >>>>>
> > >>>
> > >>>>>>>>>>> On 1/11/23 01:40, Daniel Dadap wrote:
> > >>>>>
> > >>>
> > >>>>>>>>>>>> On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> Hi,
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> On 1/10/23 16:19, Youssef Aly wrote:
> > >>>>>
> > >>>
> > >>>>>>>>>>>>>> Hi Hans,
> > >>>>>
> > >>>
> > >>>>>>>>>>>>>> Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > >>>>>>>>>>>>>> the kernel commandline for the patched kernel, it doesn't
> > work without it.
> > >>>>>
> > >>>
> > >>>>>>>>>>>>>> I have 2 modes in the bios Hybrid on/off (hybrid /
> > discrete). I tried
> > >>>>>>>>>>>>>> the modes with "acpi_backlight=nvidia_wmi_ec" and
> > >>>>>>>>>>>>>> "acpi_backlight=native" using the patched kernel (v6.1.4):
> > >>>>>
> > >>>
> > >>>>>>>>>>>>>> Hybrid:
> > >>>>>>>>>>>>>> "acpi_backlight=native": Does not work,
> > /sys/class/backlight contains
> > >>>>>>>>>>>>>> amdgpu_bl1.
> > >>>>>>>>>>>>>> "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > >>>>>>>>>>>>>> /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > >>>>>
> > >>>
> > >>>>>>>>>>>>>> Discrete:
> > >>>>>>>>>>>>>> "acpi_backlight=native": Works but when brightness from
> > 0-10 is the
> > >>>>>>>>>>>>>> same as 0-100, for example 10 is full brightness like 100,
> > 8 is the
> > >>>>>>>>>>>>>> same as 80, etc... ,
> > >>>>>>>>>>>>>> /sys/class/backlight contains nvidia_0.
> > >>>>>>>>>>>>>> "acpi_backlight=nvidia_wmi_ec": Does not work,
> > /sys/class/backlight
> > >>>>>>>>>>>>>> contains nvidia_wmi_ec_backlight.
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> Thank you for testing!
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> Ok so it seems there are 2 issues at play here:
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> 1. Depending on the BIOS setting we need to use either
> > native (discrete mode)
> > >>>>>>>>>>>>> or nvidia_wmi_ec (hybrid mode)
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> 2. There is a bug in the nvidia binary drivers backlight
> > control in native
> > >>>>>>>>>>>>> mode on this system causing the range to be wrong
> > >>>>>
> > >>>
> > >>>>>>>>>>>>> Daniel, we really need help from NVidia with fixing 1. can
> > you see if
> > >>>>>>>>>>>>> there is a way to check the BIOS setting/mode from inside
> > the kernel ?
> > >>>>>
> > >>>
> > >>>>>>>>>>>> Yes, the ACPI MXDM method should be able to do this. However,
> > querying
> > >>>>>>>>>>>> WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical
> > way to
> > >>>>>>>>>>>> determine whether the backlight is supposed to be EC-driven,
> > since there
> > >>>>>>>>>>>> are EC-driven and non-EC-driven designs, so the BIOS mode is
> > supposed to
> > >>>>>>>>>>>> be orthogonal to whether or not the EC driver should be used.
> > It sounds
> > >>>>>>>>>>>> like the BIOS is possibly reporting a wrong value for that
> > query.
> > >>>>>
> > >>>
> > >>>>>>>>>>>> I guess we could wire up a quirk that checks MXDM and
> > overrides the
> > >>>>>>>>>>>> WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from
> > the current
> > >>>>>>>>>>>> mux operation mode. Then that quirk could be applied to this
> > system.
> > >>>>>>>>>>>> I can put together a patch for that.
> > >>>>>
> > >>>
> > >>>>>>>>>>> If you can write a patch for this that would be great, thank
> > you,
> > >>>>>>>>>>> but I think we first need to root-cause this better:
> > >>>>>
> > >>>
> > >>>>>>>>>>> Currently the Dell G15 5515 is DMI quirked inside:
> > drivers/apci/video_detect.c
> > >>>>>>>>>>> to always use the native backlight. So I've gone back to the
> > original email
> > >>>>>>>>>>> thread which lead to me adding that quirk.
> > >>>>>
> > >>>
> > >>>>>>>>>>> We (I forwarded a mail from you to the reporter this was not
> > on the list)
> > >>>>>>>>>>> did ask to test with different BIOS settings their to and the
> > reporter's
> > >>>>>>>>>>> reply was:
> > >>>>>
> > >>>
> > >>>>>>>>>>> "Daniel wanted me to check different GPU modes, but my BIOS
> > has no options
> > >>>>>>>>>>> for GPU. It's always in hybrid mode with PRIME render offload."
> > >>>>>
> > >>>
> > >>>>>>>>>>> And perhaps even more interesting in their case with
> > acpi_backlight=native
> > >>>>>>>>>>> to disable nvidia-wmi-ec they have a working amdgpu_bl#
> > device. Where as
> > >>>>>>>>>>> in Youssef's case when running in discrete mode there is an
> > nvidia backlight
> > >>>>>>>>>>> device and in Youssef's case the amdgpu_bl# device never works.
> > >>>>>
> > >>>
> > >>>>>>>>>>> The Dell G15 5515 always uses an AMD Ryzen 5 5600H or 5800H
> > CPU (with iGPU)
> > >>>>>
> > >>>
> > >>>>>>>>>>> While the dGPU can be one of:
> > >>>>>>>>>>> NVIDIA GeForce RTX 3060
> > >>>>>>>>>>> NVIDIA GeForce GTX 3050 Ti
> > >>>>>>>>>>> NVIDIA GeForce GTX 3050
> > >>>>>
> > >>>
> > >>>>>>>>>>> I'm guessing that the dynamic-mux mode / nvidia-wmi-ec code
> > may only
> > >>>>>>>>>>> be relevant to the model with the 3060 and that nvidia-wmi-ec
> > should
> > >>>>>>>>>>> maybe not load at all on the model with the 3050 versions.
> > >>>>>
> > >>>
> > >>>>>>>>>> A quick status update on this.
> > >>>>>
> > >>>
> > >>>>>>>>>> Iris (added to the Cc), the reporter with the Dell G15 5515
> > which lead me
> > >>>>>>>>>> to add the acpi_backlight=native DMI quirk for the Dell G15
> > 5515 has
> > >>>>>>>>>> gotten back to me with lspci output on their G15 and it indeed
> > has
> > >>>>>>>>>> a GTX 3050.
> > >>>>>
> > >>>
> > >>>>>>>>>> So atm we have the following models which are affected one way
> > >>>>>>>>>> or the other:
> > >>>>>
> > >>>
> > >>>>>>>>>> -Acer Predator PH315-55: needs acpi_backlight=native
> > >>>>>>>>>> -Dell G15 5515 with RTX 3050: needs acpi_backlight=native
> > >>>>>>>>>> -Dell G15 5515 with RTX 3060: breaks with acpi_backlight=native
> > :(
> > >>>>>
> > >>>
> > >>>>>>>>>> With the models which need acpi_backlight=native being broken
> > >>>>>>>>>> by (false positive) detection of the laptop needing
> > nvidia-wmi-ec
> > >>>>>>>>>> for backlight control while they actually should not be using
> > that.
> > >>>>>
> > >>>
> > >>>>>>>>>> and with the Dell G15 5515 with RTX 3060 atm being broken
> > because
> > >>>>>>>>>> of the DMI quirk added to fix the Dell G15 5515 with RTX 3050.
> > >>>>>
> > >>>
> > >>>>>>>>> I've attached a simple kernel module which adds a debugfs file
> > that
> > >>>>>>>>> reports the current mux mode. As mentioned elsewhere, I suspect
> > that the
> > >>>>>>>>> systems which need the quirk may be in one of the non-dynamic
> > modes, and
> > >>>>>>>>> the systems which are broken by the quirk may be in dynamic mux
> > mode. It
> > >>>>>>>>> should be pretty straightforward to compile this as an
> > out-of-tree
> > >>>>>>>>> module using the Kbuild extmod infrastructure, as follows:
> > >>>>>
> > >>>
> > >>>>>>>>> 1) Change to the directory containing the mxdm-debugfs.c file
> > (you may
> > >>>>>>>>> wish to create an empty directory to put it in) and create a
> > file in
> > >>>>>>>>> that directory containing the following line:
> > >>>>>
> > >>>
> > >>>>>>>> The name of this file should be 'Kbuild'. Sorry for the noise.
> > >>>>>
> > >>>
> > >>>>>>>>> obj-m += mxdm-debugfs.o
> > >>>>>
> > >>>
> > >>>>>>>>> 2) Build the kernel module:
> > >>>>>
> > >>>
> > >>>>>>>>> make -C /lib/modules/$(uname -r)/source O=/lib/modules/$(uname
> > -r)/build M=$(pwd)
> > >>>>>
> > >>>
> > >>>>>>>>> (The "source" and "build" paths under /lib/modules/`uname -r`
> > should
> > >>>>>>>>> be the correct paths in almost all cases; if your system uses
> > >>>>>>>>> different paths, substitute those. You will need the development
> > >>>>>>>>> headers for external kernel modules, and the relevant toolchain
> > bits,
> > >>>>>>>>> but if you're already using the NVIDIA proprietary driver you
> > almost
> > >>>>>>>>> certainly already have all of that.)
> > >>>>>
> > >>>
> > >>>>>>>>> 3) Load the kernel module:
> > >>>>>
> > >>>
> > >>>>>>>>> insmod ./mxdm-debugfs.ko
> > >>>>>
> > >>>
> > >>>>>>>>> This should create a file at
> > /sys/kernel/debug/acpi/mxdm_mux_mode.
> > >>>>>>>>> Reading this file should report the current mux operation mode.
> > >>>>>
> > >>>
> > >>>>>>>>> While switching mux modes on a dynamic mux system to test this
> > kernel
> > >>>>>>>>> module, I noticed that the ACPI tables no longer exposed the
> > MXDM method
> > >>>>>>>>> when the mux mode was set to discrete only on that particular
> > system.
> > >>>>>>>>> This contradicted the behavior I had previously observed on other
> > >>>>>>>>> systems; i.e., that MXDM is always available regardless of the
> > currently
> > >>>>>>>>> set mux mode, so I tried it on another dynamic mux system and
> > observed
> > >>>>>>>>> that the other system does always expose MXDM regardless of the
> > mux
> > >>>>>>>>> mode, and the contents of the debugfs file matched the selected
> > mode.
> > >>>>>
> > >>>
> > >>>>>>>>> So if the module fails to load with ENODEV and prints the "MXDM
> > not
> > >>>>>>>>> found" message to the kernel log, the system is most likely
> > configured
> > >>>>>>>>> to a non-dynamic mux mode. My usual expectation is that it
> > should load
> > >>>>>>>>> and create the file on most dynamic mux systems. I do not have
> > direct
> > >>>>>>>>> access to any of the above listed systems at the moment, so I do
> > not
> > >>>>>>>>> know whether MXDM will be exposed when the system is not in
> > dynamic mux
> > >>>>>>>>> mode.
> > >>>>>
> > >>>
> > >>>>>>>>>> Regards,
> > >>>>>
> > >>>
> > >>>>>>>>>> Hans
> > >>>>>
> > >>>
> > >>>>>>>>> // SPDX-License-Identifier: GPL-2.0-only
> > >>>>>>>>> /*
> > >>>>>>>>> * Copyright (C) 2020 NVIDIA Corporation
> > >>>>>>>>> *
> > >>>>>>>>> */
> > >>>>>
> > >>>
> > >>>>>>>>> #include <linux/acpi.h>
> > >>>>>>>>> #include <acpi/acoutput.h>
> > >>>>>>>>> #include <linux/module.h>
> > >>>>>>>>> #include <linux/pci.h>
> > >>>>>>>>> #include <linux/debugfs.h>
> > >>>>>
> > >>>
> > >>>>>>>>> extern struct dentry *acpi_debugfs_dir;
> > >>>>>
> > >>>
> > >>>>>>>>> enum mux_mode {
> > >>>>>>>>> MUX_MODE_UNKNOWN = 0,
> > >>>>>>>>> MUX_MODE_INTEGRATED = 1, /* iGPU only /
> > >>>>>>>>> MUX_MODE_DISCRETE = 2, / dGPU only /
> > >>>>>>>>> MUX_MODE_HYBRID = 3, / Dual GPU, mux switched to iGPU /
> > >>>>>>>>> MUX_MODE_DYNAMIC = 4, / Dual GPU, dynamic mux switching */
> > >>>>>>>>> MUX_MODE_MAX
> > >>>>>>>>> };
> > >>>>>
> > >>>
> > >>>>>>>>> static char * mode_names[] = {
> > >>>>>>>>> [MUX_MODE_UNKNOWN] = "unknown\n",
> > >>>>>>>>> [MUX_MODE_INTEGRATED] = "integrated\n",
> > >>>>>>>>> [MUX_MODE_DISCRETE] = "discrete\n",
> > >>>>>>>>> [MUX_MODE_HYBRID] = "hybrid\n",
> > >>>>>>>>> [MUX_MODE_DYNAMIC] = "dynamic\n",
> > >>>>>>>>> };
> > >>>>>
> > >>>
> > >>>>>>>>> static struct debugfs_blob_wrapper muxmode_blob;
> > >>>>>
> > >>>
> > >>>>>>>>> static void store_mux_mode(acpi_handle handle)
> > >>>>>>>>> {
> > >>>>>>>>> union acpi_object arg = { .integer = { .type =
> > ACPI_TYPE_INTEGER, .value = 0 } };
> > >>>>>>>>> struct acpi_object_list in = { .count = 1, .pointer = &arg };
> > >>>>>
> > >>>
> > >>>>>>>>> acpi_integer ret;
> > >>>>>>>>> acpi_status status;
> > >>>>>
> > >>>
> > >>>>>>>>> status = acpi_evaluate_integer(handle, "MXDM", &in, &ret);
> > >>>>>
> > >>>
> > >>>>>>>>> if (ACPI_FAILURE(status)) {
> > >>>>>>>>> acpi_handle_err(handle, "ACPI MXDM failed: %s\n",
> > acpi_format_exception(status));
> > >>>>>>>>> muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > >>>>>>>>> } else if (ret < MUX_MODE_UNKNOWN || ret >= MUX_MODE_MAX) {
> > >>>>>>>>> acpi_handle_err(handle, "Mux mode value out of range");
> > >>>>>>>>> muxmode_blob.data = mode_names[MUX_MODE_UNKNOWN];
> > >>>>>>>>> } else {
> > >>>>>>>>> muxmode_blob.data = mode_names[ret];
> > >>>>>>>>> }
> > >>>>>
> > >>>
> > >>>>>>>>> muxmode_blob.size = strlen(muxmode_blob.data);
> > >>>>>>>>> }
> > >>>>>
> > >>>
> > >>>>>>>>> static acpi_status find_mxdm(acpi_handle obj, u32 level, void
> > *ctx, void **ret)
> > >>>>>>>>> {
> > >>>>>>>>> acpi_handle search;
> > >>>>>
> > >>>
> > >>>>>>>>> if (acpi_get_handle(obj, "MXDM", &search) == 0) {
> > >>>>>>>>> /* Found the parent object of the MXDM method; pass it back
> > >>>>>>>>> * to the caller and stop searching. */
> > >>>>>>>>> *ret = obj;
> > >>>>>
> > >>>
> > >>>>>>>>> return AE_CTRL_TERMINATE;
> > >>>>>>>>> }
> > >>>>>
> > >>>
> > >>>>>>>>> /* No MXDM; keep looking */
> > >>>>>>>>> return AE_OK;
> > >>>>>>>>> }
> > >>>>>
> > >>>
> > >>>>>>>>> static struct dentry *muxmode_file_dentry;
> > >>>>>
> > >>>
> > >>>>>>>>> static int __init mxdm_debugfs_init(void)
> > >>>>>>>>> {
> > >>>>>>>>> acpi_handle mxdm_handle = NULL;
> > >>>>>>>>> acpi_status ret;
> > >>>>>
> > >>>
> > >>>>>>>>> ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 5,
> > >>>>>>>>> find_mxdm, NULL, NULL, &mxdm_handle);
> > >>>>>
> > >>>
> > >>>>>>>>> if (ACPI_FAILURE(ret) || !mxdm_handle) {
> > >>>>>>>>> pr_err("MXDM not found.\n");
> > >>>>>>>>> return -ENODEV;
> > >>>>>>>>> }
> > >>>>>
> > >>>
> > >>>>>>>>> /* Populate the blob wrapper: the mux mode cannot change without
> > rebooting
> > >>>>>>>>> * so this only needs to be done once. */
> > >>>>>>>>> store_mux_mode(mxdm_handle);
> > >>>>>
> > >>>
> > >>>>>>>>> muxmode_file_dentry = debugfs_create_blob("mxdm_mux_mode", 0444,
> > >>>>>>>>> acpi_debugfs_dir,
> > >>>>>>>>> &muxmode_blob);
> > >>>>>
> > >>>
> > >>>>>>>>> return muxmode_file_dentry ? 0 : -EIO;
> > >>>>>>>>> }
> > >>>>>>>>> module_init(mxdm_debugfs_init);
> > >>>>>
> > >>>
> > >>>>>>>>> static void __exit mxdm_debugfs_exit(void)
> > >>>>>>>>> {
> > >>>>>>>>> if (muxmode_file_dentry) {
> > >>>>>>>>> debugfs_remove(muxmode_file_dentry);
> > >>>>>>>>> muxmode_file_dentry = NULL;
> > >>>>>>>>> }
> > >>>>>>>>> }
> > >>>>>>>>> module_exit(mxdm_debugfs_exit);
> > >>>>>
> > >>>
> > >>>>>>>>> MODULE_LICENSE("GPL v2");
> > >>>>>>>>> MODULE_DESCRIPTION("MXDM mux mode test module");
> > >>>>>>>>> MODULE_AUTHOR("Daniel Dadap ddadap@nvidia.com");
> > >>>>>
> > >>>
> > >>>>>>>>> /*
> > >>>>>>>>> * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so
> > key off of
> > >>>>>>>>> * the WMI wrapper for the related WMAA method for backlight
> > control.
> > >>>>>>>>> */
> > >>>>>>>>> MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
> > >>>>
> > >>>
> > >>>>
> > >>>
> > >>>>
> > >
> > >
> >
