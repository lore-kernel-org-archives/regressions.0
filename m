Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C858B15A7
	for <regressions@lists.linux.dev>; Wed, 11 Jan 2023 00:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+xREn1mXhCcZll/hTdxFyA9jrdLYxOLX930OnDjKD50fJaLrgoZ35w9j0CkSlD4sUzCR3cdZXJXyJwQ0R0LyDSy9ykb72WkJyiuUZMKKazDeyz88LW3YrmSuY/aB7a66msF22QK2NksSQE3gxmuNNs5BwyN0UsQXprKqcq6DU/+SIkguIeGfOKTxzxrN1J8eH4RP+Ki6g5b77ajREJl+41bvMoZczpz/iw8ATS/71iZZhvvbPdji1HXqlRaIhRzYETIle0PWDxjNaJprMHWfGuVxV1zjP3AGAToE/uFf63CKz9wBRXArj4XgL8CgM02vP54o31AUVzcQP4yXHMQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1vdl7wxDoHk0QxvpQ/cWghlcXX3pRRZaKMPDVlQSyQ=;
 b=Qt7sL8CO1TA7YwGKCdq8BDDBhWYpQVBVjHEsw29SI9xdr2HHNAioYV1+nB17YyEgAzDRp3tmL5XlKVJUUj1pPeNMdZPBnqkmEOHAOgx74x4h77ZYV1NUeQAsUSQ8Nylx51XN6tWg789iWpu4PENVaavjL/6CJe0lyecTJMu9r2ALqe2EmIgynuYVzZ+urFBzIkItu+4ZU8Oia9p4hpNj9Iz3tuZBZRnXdO8u1r/jIM4fC0vlYAY40Ydi4jFj5T9fPoqvzPaPSVfQAHCe5NUsIqrJCKOwbxpCzMJMSrXcvmo4N8erX2t3XTWPW7WtUMRDx97lQo8LhnzBjM9fjLeTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1vdl7wxDoHk0QxvpQ/cWghlcXX3pRRZaKMPDVlQSyQ=;
 b=Fs88kLTweimy0vUM8KV+v9+g29cijObCeDn5NhSYoGnFr5fw0jRWc+yzXYzKXXDAhxmhvPV6GVPX7B7Qr9WsEdLGMyKWLr4xvGAvPUtb6VCZdl9LzhiQaab+YbBxgPh6OpGJPLpNt13JDsP6fdasu2z3hT0KcUW9FHBbmUyw2zg8BIGrvOI3BqrAdeIKLe4dui8cRjEZ7NsoZlaYZ1+1d8GFxvHMPrW6LEZpmWuEEuDkN/5E1zUio7Q8xOuoE9X1t8NgQMMzLIJ09c82JP2x8w2eGxQGF+LSghlzsVeSeKSNCkAaXedG8ZpNv888T8XRk3CvBT+NR3S9USgjkJdZhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 00:40:33 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 00:40:33 +0000
Date: Tue, 10 Jan 2023 18:40:29 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Youssef Aly <youssefaswad@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <Y74FfQmjN8WJcCIG@lenny>
References: <CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com>
 <166f50f5-6034-d644-86ed-c41a8636263a@redhat.com>
 <CAKsK3Ak8bKF5RM+5Xtp2doE4N8BwEKVQG_qbujD526SjGqzmYQ@mail.gmail.com>
 <CAKsK3A=3QbFfO4mmetD+CUJdJDawmfzazi_w9+fi-mX9tLaHGA@mail.gmail.com>
 <2d7c08c8-8f95-9591-d7bd-87b9f1a9b657@redhat.com>
 <CAKsK3An_b_FAZxJzTk9GZZ41-9+_Ym2icWVaN41WV6qEySWx4A@mail.gmail.com>
 <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16fde015-73d7-8169-3fc5-7a4915508c05@redhat.com>
X-ClientProxiedBy: SA1P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::31) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c983ec7-bd08-4946-6422-08daf36c726a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b6/wWOOcqwB3qHsnnWnXycUHVrb96EgmpleHdMK6erEKLdGuRuoF/p+Ju+KEJJ6VcvMopBrpf/leGDST4Nmlj8BHHs3xLH9UoEDMv2sv/UJe7A5CHn11nMi2kxPgy6R1ShkUKxlSA+QPFj27BZdxCLIk6nvWHX37Ls7ZC0ii1dHFg0ggYeY/2IybrEtYQO9B1O9dA/d2HbhoICFiiL0VUC8c0hlG4n2q7g6H95BY7QM2L527e7EYcBDS3eZV4qis7e0xqXbbtc5sMonl0pnZG8Y8sPwYJYIXMA/ik8FF4whjhFbf8Jxl7Z/Uo8HN7waF8O/gQMun5Y58DZJUlTcbhTtzC6DNyGgf/nqiTs0ffjkzGeA3ZuKcrHSStFNb2FAi1DKHc7/4bwNz4DHsu836bc8JZgK7907pB8Sy+JNai00rZ0nc4jaNyWV5h46r6YOtnx7D1lcS0Nla1TOL1O1izvWaNvwp0TmYPVqz994xAQmdPbmDlOKT7ASs03gfZFPk/A5gGTCbYEsageDfDG0GspiDrLSACU1UyXD3E2rgg+aGLMbi3yKOiDaIwEHpdIB/owRvPb9LzZFapvLVKrbmB4OnYiJfeaSmuXdtpKdt828kG3BBWzEC3HJ9i5LjCD8pIH1nMcxSYfVfXeIzObZnQrQ+Lonjql/kb8MVWWdyeTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(9686003)(6512007)(33716001)(186003)(5660300002)(26005)(6486002)(966005)(6916009)(4326008)(66476007)(66556008)(54906003)(8676002)(66946007)(316002)(83380400001)(8936002)(86362001)(53546011)(38100700002)(478600001)(41300700001)(6666004)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rTZIMlHgyG1dqGpwotJGVc3faCt0uxlLtedjN4kWa+Ce5XnwdrYS+Gl1ITF5?=
 =?us-ascii?Q?n2CyFGsnUJ3zWNns4WlPbbo+05K3WxJJN/w8XZO5DIKsBmA+H21IYLtdI94u?=
 =?us-ascii?Q?k1O9sCcxhT53ksroQ3M1peQo79Lfe8tWxADpeIykG0ucHRXb0M1xm+zCwTpb?=
 =?us-ascii?Q?GZjg5CWH6yGndf/8Uzn1Po0D6uRBc8aVZ0XSO0Hj4U7rXqfi0OvGol2Q7Ksb?=
 =?us-ascii?Q?RwSFm97Q3ura7O0FsL+WxqhwJ7sWHvyn2vrTh5jhK/klXG3uJAnKRDeFE5/4?=
 =?us-ascii?Q?w1RmejxaQiybSoeBZ683WTEOte0bQHoxoA7DiLGVhPa80v+l9Qbaq07f+Fzw?=
 =?us-ascii?Q?7DzgvGtuH09cT74Sg1XACAK75Q3abcPA30psWERwIXX4Njr3mswIYeN4ORGI?=
 =?us-ascii?Q?OyAhNmLVudr853vvrAC8Wbjnn2ML4R3034K0k+7/KSTy6mV62WrnvA7DkY+1?=
 =?us-ascii?Q?l42T6qc5m7cBV7lTOQJIKd3+r+t1cQ5B3TIMYbviMpn1jtHFzV0a1W560rRe?=
 =?us-ascii?Q?VuzuGtCxOAIrw/QH6K2gXtsvH8QbHzlxs3s8TI9NtEz/RXB0VzacX1tAGdiY?=
 =?us-ascii?Q?CuzreWpIr/93f+Fu62xpdEBi5NAqBe0ukswzqizd4RqRA8NEEfa1vfUtUsmt?=
 =?us-ascii?Q?+xzSEd4NshtkSmp1WvsAKiZs6TcqFAcMPos1/qV4WwSdlEoBjPQO85mTLrvw?=
 =?us-ascii?Q?7vdRb7h0eeVIU1tL8p88+/ROZodlGZMbrWVJtCntEEZ7LG0LDtU1a7umvbIT?=
 =?us-ascii?Q?blL2QBg9l5e++kx8FFqScZC0Ss1+BSV+g87yNPmOsMziGlyqQTz9jMC0zMKl?=
 =?us-ascii?Q?yn3I+d1Bh+hftGEENqipE2yNt0JHuG9DXGZZwCCzEsa+1Ylxpsmwo3LXvpyb?=
 =?us-ascii?Q?+OVQqzenrWQic671HF8ivzY8/UgER2KpwGrF1LTpVeIOjq85Gf1iO67n8O/t?=
 =?us-ascii?Q?0am5bbl7UATFa+KUrJwRAXiavvyVZlmUwCrSfDudnC6/iNNF/P0px26uRUJY?=
 =?us-ascii?Q?H0XhZK1wKU7qU9zc6/WYPvUPlBmuTmSMZ74DlcItnkSYve34Sw/6oC2ZGttV?=
 =?us-ascii?Q?1PknBtGb/W6NuhaMcJpFsJuTRNHDiZN2GAGo6iqESXK2p1FcnHjrQa1e4FzP?=
 =?us-ascii?Q?AiAy9VhDMhljx5A7ASIdJoW8eLqZTPGcXoaDh6DT7u45VWKuC5oie+wJJpw9?=
 =?us-ascii?Q?7VBqNBqQ3i7vg2WN61EqGXOGxCiG1qOnr8qZ6Q4oXcq+J4A/OuijmSbTLxHf?=
 =?us-ascii?Q?Vg1tQ4nYeZRiMUmktFB0HJVchVXhny/RiBNLFNyzBE4lLlXHy7NEsbyhqs7x?=
 =?us-ascii?Q?xvYGOFLN2OMxC+Rn5MZiJanN1GGYWZmNI7YUh3Zn4ulilZ95UAahn6ZIOhbS?=
 =?us-ascii?Q?5zkTf3cOXjlP4NFF/b4F9BQ/4nbZNwx6jReUCynElnVNaTv9dE9msFGBWCt/?=
 =?us-ascii?Q?ox6RhvLmO5XMTh4/Ao2TCzSwcnhT0SLjGcLC3dCjplWxom6QelaQpa/Y4dHz?=
 =?us-ascii?Q?6eK1RTWrhyhXEikhHH2Ttp7nfIS9no0VuK4+aj9l8MMNKXNqVA1u54G7HB/k?=
 =?us-ascii?Q?DNamsifaYnSViIrGxYxUejqUWnIZPtnQJOegM1ug?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c983ec7-bd08-4946-6422-08daf36c726a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 00:40:33.0907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vl//TFn29Bt5yewihGY3bgY+vbavBXLPYvQKM8V1qjh8QFExLV0+NtU1hBT9bRoq2NXBw7+d1lB9uCceqxHHZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119

On Tue, Jan 10, 2023 at 04:27:56PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/10/23 16:19, Youssef Aly wrote:
> > Hi Hans,
> > 
> > Yes, I added "acpi_backlight=nvidia_wmi_ec" to
> > the kernel commandline for the patched kernel, it doesn't work without it.
> > 
> > I have 2 modes in the bios Hybrid on/off (hybrid / discrete). I tried
> > the modes with "acpi_backlight=nvidia_wmi_ec" and
> > "acpi_backlight=native" using the patched kernel (v6.1.4):
> > 
> > Hybrid:
> > "acpi_backlight=native": Does not work, /sys/class/backlight contains
> > amdgpu_bl1.
> > "acpi_backlight=nvidia_wmi_ec": Works as expected,
> > /sys/class/backlight contains nvidia_wmi_ec_backlight.
> > 
> > Discrete:
> > "acpi_backlight=native": Works but when brightness from 0-10 is the
> > same as 0-100, for example 10 is full brightness like 100, 8 is the
> > same as 80, etc... ,
> > /sys/class/backlight contains nvidia_0.
> > "acpi_backlight=nvidia_wmi_ec": Does not work, /sys/class/backlight
> > contains nvidia_wmi_ec_backlight.
> 
> Thank you for testing!
> 
> Ok so it seems there are 2 issues at play here:
> 
> 1. Depending on the BIOS setting we need to use either native (discrete mode)
>    or nvidia_wmi_ec (hybrid mode)
> 
> 2. There is a bug in the nvidia binary drivers backlight control in native
>    mode on this system causing the range to be wrong
> 
> Daniel, we really need help from NVidia with fixing 1. can you see if
> there is a way to check the BIOS setting/mode from inside the kernel ?

Yes, the ACPI MXDM method should be able to do this. However, querying
WMI_BRIGHTNESS_METHOD_SOURCE is supposed to be the canonical way to
determine whether the backlight is supposed to be EC-driven, since there
are EC-driven and non-EC-driven designs, so the BIOS mode is supposed to
be orthogonal to whether or not the EC driver should be used. It sounds
like the BIOS is possibly reporting a wrong value for that query.

I guess we could wire up a quirk that checks MXDM and overrides the
WMI_BRIGHTNESS_METHOD_SOURCE query with a value derived from the current
mux operation mode. Then that quirk could be applied to this system.
I can put together a patch for that.

As for the native range bug, that does sound like a scaling issue. I'll
take a look at how the NVIDIA driver determines the range of possible
backlight values and see if Ican find an obvious way that might fail on
a particular system.
 
> Regards,
> 
> Hans
> 
> p.s.
> 
> Youssef, for your next email please use reply to all. You keep dropping
> Daniel and the regressions-list from the To/Cc, using reply-to-all should
> keep these in the To/Cc.
> 
> 
> 
> 
> > On Tue, 10 Jan 2023 at 10:39, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 1/10/23 02:07, Youssef Aly wrote:
> >>> Hello,
> >>>
> >>> Just reporting back, building with the patch fixed the issue.
> >>
> >> I assume that you also added "acpi_backlight=nvidia_wmi_ec" to
> >> the kernel commandline for the patched kernel, right ?
> >>
> >> If you have time, can you please also check the other BIOS
> >> (hybrid / discrete / ...) modes in the BIOS?
> >>
> >> Based on the previous bug report, I would expect you to need
> >> to pass "acpi_backlight=native" in at least some of the other
> >> modes ...
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>> On Mon, 9 Jan 2023 at 22:23, Youssef Aly <youssefaswad@gmail.com> wrote:
> >>>>
> >>>> Hello Hans,
> >>>>
> >>>> Ok, I'll try building with the patch you provided, and report back.
> >>>>
> >>>> Thanks,
> >>>>
> >>>> Youssef
> >>>>
> >>>> On Mon, 9 Jan 2023 at 21:19, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>>
> >>>>> Hi Youssef,
> >>>>>
> >>>>> On 1/9/23 17:18, Youssef Aly wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> The backlight control has been broken on Dell G15 5515 since 6.1, it
> >>>>>> is always at full brightness, this is only the case in hybrid (mux)
> >>>>>> graphics mode.
> >>>>>>
> >>>>>> As per the output of lsmod the nvidia_wmi_ec_backlight is loaded:
> >>>>>> nvidia_wmi_ec_backlight    16384  0
> >>>>>> video                  61440  5
> >>>>>> nvidia_wmi_ec_backlight,dell_wmi,amdgpu,dell_laptop,nvidia_modeset
> >>>>>> wmi                    36864  7
> >>>>>> video,nvidia_wmi_ec_backlight,alienware_wmi,dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
> >>>>>>
> >>>>>> but it is not present in /sys/class/backlight, only amdgpu_bl1 is
> >>>>>> present which is not functional
> >>>>>> contents of /sys/class/backlight
> >>>>>> total 0
> >>>>>> lrwxrwxrwx 1 root root 0 Jan  9 00:49 amdgpu_bl1 ->
> >>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>>
> >>>>>> this is the content on 6.0.12
> >>>>>> total 0
> >>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 amdgpu_bl1 ->
> >>>>>> ../../devices/pci0000:00/0000:00:08.1/0000:06:00.0/backlight/amdgpu_bl1/
> >>>>>> lrwxrwxrwx 1 root root 0 Jan  8 20:59 nvidia_wmi_ec_backlight ->
> >>>>>> ../../devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/603E9613-EF25-4338-A3D0-C46177516DB7/backlight/nvidia_wmi_ec_backlight/
> >>>>>>
> >>>>>> Distro: Endeavour OS
> >>>>>> Kernel: 6.1.4-arch1-1
> >>>>>> GPU: RTX 3060 Using nvidia proprietary drivers version 525.78.01
> >>>>>>
> >>>>>> #regzbot introduced v6.1..v6.1.4
> >>>>>
> >>>>> Hmm, this is likely caused by:
> >>>>>
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f46acc1efd4b5846de9fa05f966e504f328f34a6
> >>>>>
> >>>>> Which was added because according to the reporter on their G15 5515
> >>>>> backlight control only works in native mode ...
> >>>>>
> >>>>> I'm getting the feeling that we need to detect the BIOS setting
> >>>>> and use a different backlight device depending on the setting...
> >>>>>
> >>>>> Daniel, any ideas?
> >>>>>
> >>>>> For now can you try building a kernel with the attached patch
> >>>>> (which I've also just submitted upstream) and with:
> >>>>>
> >>>>> acpi_backlight=nvidia_wmi_ec
> >>>>>
> >>>>> added to your kernel commandline. That should work around this
> >>>>> for now...
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>> Hans
> >>>
> >>
> > 
> 
