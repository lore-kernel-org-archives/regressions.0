Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DAF33D6
	for <regressions@lists.linux.dev>; Thu,  1 Sep 2022 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662040393; x=1693576393;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=heUeoODatWMwIGffkIEWMiCvx4/fH00Hp0rwRwLln8w=;
  b=Tsjgkry0KO1btUqlu8q5nBBkOSXnQlfdMFy0I/yvlZYyimK2Z+1FJogL
   RvzO/3tB+vxGURB2WFL++OOTMSMS0dzlHZMvPPMl20LEfPMq5iX4gudNv
   RCv4mEbQT4eok+2k+L66emPFeSBOIT/oEPd8ADb8I7JJsMA6WrhvRT8/9
   U/xYOo0i5alPNBTKr8Y2wjGD1xg6Qn95VCF6/r8ZPFQvopCW69Ec0+TjU
   rMHGCTkgQe4Q6velKty4+CLE1AoyiugiGZiQp1RZwq8fhL+JWFYWUAG3D
   WK1U2tODFB+cef8RayVhiF5zvd3Th6qc3b6p4Fy0iwTnCDFc964onjAQw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="382014517"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="382014517"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 06:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="645660814"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 01 Sep 2022 06:53:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 06:53:11 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 06:53:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 06:53:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 06:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnO1uKmtUMO/md9nPqrTup1N/qRvIkv9+jqHdsH23jsF8VqqgwbeYBaD4fxHgR9pxzA+yDbRgwzCbPc0wV1vbg1prOWIJEUqw8R2La5COsda3rMk3yXhrcrjY+eOm/WSPoBYPQ9DLnVZOUcUJjpUdY1GJt+qVwSBF7dnWVAyQf47jSNrZyWt6l6E0Nab/XzPvOn05vvOwsRDiaCxM/iBsMV8rvj1pdo/g2m3sqXLPDBoveWroGXblBsN+Zk91HVVPrDyhZk7UCithQcazCxkI4ZlCDqubj/zO4/V6p7ZugCK7J5TGnfBlK6uA5hTnP44fES35pnIqOctOlVJQjcfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdpnsjs/6hvwJr+bMSnaT31EnNVfcurvDdN8jCVrqgU=;
 b=KYV4ENF4D+Ih8VdXhVzBCvvwd6LcjRwOeQsoEEhlc3C0C2phv3pudmMo5vKr396jVB8RhQUzQBoHHykZBSXwnIlnkaEf96PKdEjq6kGnaZiMi0at1ricoFYBWZsYJv7dCBPakTkT3vFNyYrB6zuWIX7e+VaQnTe0M8joiBJIy+0T87vuAXeKwtnZ63IDmUAC9WNGH9ZOH2q0Z+Hwdaf5V78r/owv7ic2+kjZ1b4MTtAoOilGikEK6RhfUSr0KzEOp5k4oYGphu4m3ua2fO7lE6n4gRVANU2UY/vjiogI9YnbETnf5BLOqm/hWDwLhqveuy+9e9FkvEVdfHDiC19tpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by BL0PR11MB2980.namprd11.prod.outlook.com (2603:10b6:208:32::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 13:53:09 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be%4]) with mapi id 15.20.5588.012; Thu, 1 Sep 2022
 13:53:09 +0000
Date: Thu, 1 Sep 2022 21:53:00 +0800
From: Philip Li <philip.li@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
CC: "Si, Beibei" <Beibei.Si@intel.com>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, "Sang, Oliver" <oliver.sang@intel.com>,
	<lkp@intel.com>
Subject: Re: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
 #forregzbot
Message-ID: <YxC5PJJlAG7VycLP@rli9-MOBL1.ccr.corp.intel.com>
References: <BN6PR11MB1729F27147FBD06FDED3F355FB659@BN6PR11MB1729.namprd11.prod.outlook.com>
 <384393c2-6155-9a07-ebd4-c2c410cbe947@leemhuis.info>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <384393c2-6155-9a07-ebd4-c2c410cbe947@leemhuis.info>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dfd7d50-9cfc-4635-aba5-08da8c214d99
X-MS-TrafficTypeDiagnostic: BL0PR11MB2980:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boKkZ9+XOLTFE9V+Cd/rwoimXOvN3stxjpvu7GQOJ65V5nJDi+TlFv8/6Sd2DteP1cOxAXNot982Mctj0GLdc+iw6eg9vtZ+4Z+O0ISwrpA+A17NsWD660t8Q0uaOMQoSO0XKv/OyZFWoIbwQ3OH/9Re3N04FXdg3homNn8oq6ur0/zET3rpafmyh9t5A6BnjbqBjXtxGee5MFOOoxdzAqY1ke55ikuJAfC8NmBUD5iH2n+Zadtg0brosJJh1B/vzgRiLRDdDiU106ofKKNkWlalCy4anb1H1nUnEYkX60mxRT89ZdeBnVIioegHCGaoIWU47DGJg6TdCGS5NY6YBji/9o/Zgdpep931sFgT+Q1MCuUgQE+0GGTpA2Ipwgbuaxqy5uuUv/XC6wUb2o/66Ox7NaCds6RGVMnGQ7bEVwWuf6D53sEd65rsiUrjsiSq+K7CsdD9WwRA0cEaruB/S3rKVFRtkchDOw7+Lv6/4xrYKQbn0/Mvj+imw/dw+9+1sPrCvX+44A9j0oaFq/sEUmGlX/Pbrx1Rh8bYlbK/4Ubka6+4HVmZsiIHlSNLVt12Zf2bvXLvnLoX4WcbNIpSahZuWQxYfsqCU1bp7eqIEijknhSO3s4/R+4IrSXAms/y08VfOuzhBx2GWwfOsmin5wFtH2+caMMJ8BNqifueFp3DpQWu39/CzYbccHvF+6YPKhyOANG3WElpkSp9kWYZTITtBP5atX2F0SRS43B8l6UXDsSrfdZwSccy4Rj/qxSPg8D4SxuWrqf1KpGXLH3Eyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(366004)(346002)(136003)(66476007)(478600001)(8676002)(2906002)(44832011)(5660300002)(86362001)(4326008)(66946007)(316002)(6916009)(54906003)(6486002)(66556008)(966005)(82960400001)(41300700001)(6506007)(6512007)(26005)(53546011)(83380400001)(107886003)(38100700002)(186003)(6666004)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7YlI3RtKPMtx/+3RIdIulfey7nEXi5iFrU1NIzkyr06/5EfG/8tbou1jCQHM?=
 =?us-ascii?Q?zm8+49w5l7dhayvKo4qqNsBAUJnVg3TwnUfsFH2yPqMyplAQRx2NbwlC/exT?=
 =?us-ascii?Q?rMSNMPM7gc66Wo/cB15EnqRVp9BrPC7PPXoiEKXAYjWSc5OlFu3WIQ8QqxbC?=
 =?us-ascii?Q?YuJyIe1IO1I0VMvWnV5Fl4//1I1kOAJ1XofU8u01M5sbGx6fXaj7NZfzxWgZ?=
 =?us-ascii?Q?zTJH+a0RNM5KeNYtPDqEc+OC6r7TI6pghzNjYeHtgSvLr6iYBGXH4nlrvfsf?=
 =?us-ascii?Q?kRI0WcDq1IJZdq23KhxoMJmKTus3Gdcs4huVcoUoYhGLYr6fThdwH51F9cqp?=
 =?us-ascii?Q?1MhkzVTTK4qrh/Fb6/KwjYPsMtuO7ErrYo3ZlV0wRTMDs8YogNQOSEyYnicy?=
 =?us-ascii?Q?AyqCOICUBFhZ3baI0o118ULRknZLaWNncLEkpcSAS1Tl9qT6ocMq5drdJtln?=
 =?us-ascii?Q?YIxuTfYevMMRTXfCRTi8Ct6C/Mr6u61Z3m9ZP2tNCj497VgYHsS9AXUrdJhf?=
 =?us-ascii?Q?AUB//1ceLyGvTPo93zM9HhpISY2HZTg4iYyQZ9wsrrI2hEbs8uY5yybmFDIc?=
 =?us-ascii?Q?pt9uztoc7rnDQwMBsJaDiG06QWARJpNWfSmsI+m1PpqmmdUIx5xkj+P7516s?=
 =?us-ascii?Q?s6BZZD6OP3GXoKt+fpH6re6ET8dCu5eeJ8Q5ILQa61w2qzcfvaxrAssKCleP?=
 =?us-ascii?Q?ozSt75vHGI4ZkiRQ2EmiJp0jueQMF+XF2zhnREkJYWONBbTle/5Ija3RQ9iR?=
 =?us-ascii?Q?UNE9B+syGcgCLm49frLJeRipiRutcu5+7hb+bKudK/e7FwNMuDUd9mAi4lKF?=
 =?us-ascii?Q?xoCtbHxC+aPkB4WArCIJZnP9PHwzGvfdmfoJwvroIbDoHCRY/evBifd0Z8/t?=
 =?us-ascii?Q?4Q9xS0cqNfZDmLCz7dKUhv+JtXlsGsICqd5mtz/3xdshXYYUoD89IFL0nbI0?=
 =?us-ascii?Q?SJi5c/vmqt7DO9Lp/NGsC4Dlc/di9jOjT+9RFtPtjSbyPDS1Yc6w4lQUYb8u?=
 =?us-ascii?Q?lHojmJsdzYHHOEHb0uh4X4C8nfpCBueJCSFQNNM4GF2ZMz/Iv3DkATKEz9m1?=
 =?us-ascii?Q?78ZPOlU6BIUB/Lf7Blw1sKf0Q5fK2PYhRYKAbqTSP/cOKFrJlK/TizYdxhzK?=
 =?us-ascii?Q?/U3JjKyk9R3VfPOEW7paD0r71XsKy/yHBY22bFm49TXrraEyQo+OxwfKAfVQ?=
 =?us-ascii?Q?J0MmUOqP6F2bdeb+6SsXU13Kjdc4wail+dEJXeFLoNsZc5bNn51GeOF9NXGT?=
 =?us-ascii?Q?KsdgYLX+uA8CTYhY2q2an/A4JzBmK1NXsEBYKqfrkOfWlzG/ST9PT4uIN3G3?=
 =?us-ascii?Q?ptC67F/SnCLAwbuRQCNQQXsnjb5vBAnKSs/b939o3hSLHPZpmzIkX9rRvsP1?=
 =?us-ascii?Q?OcsVUeLp27wyqEWnumRktxVCXBVzJSx34OiBpYu8tgnjNvCHRArzBwfMAumc?=
 =?us-ascii?Q?R5aUzkYWLGPiJnXcVxwHJ77RWjjjYeexFpRPjoKlPusCgKV8vPg63Ub0kQpP?=
 =?us-ascii?Q?0zwKCLdLIGo05RrvAkO0iGvduP4n0x68AswmD5fB4jaFkn298r8qW7mcSwYm?=
 =?us-ascii?Q?rpWw2IBwlBoSESZqRRJHV0WBmI/9VPb32WEhNsr6qpj/mqGnRhb6tCfnqJWY?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfd7d50-9cfc-4635-aba5-08da8c214d99
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 13:53:09.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sryj4Z15kcImeKgsqSmPC7jbCAwUBtPLZLibbebZ1mE2OzaL6z9X66gbQ9YFfy6gR9C4rjUn51H0owNBxjzILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2980
X-OriginatorOrg: intel.com

On Mon, Aug 15, 2022 at 09:19:30PM +0800, Thorsten Leemhuis wrote:
> On 10.08.22 07:44, Si, Beibei wrote:
> > #regzbot ^introduced efcfec579f
> > #regzbot title [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
> 
> Thx for trying to get regzbot involved, but FWIW, the original mail from
> Oliver already did so. :-D Hence let me mark this entry as a duplicate:
> 
> #regzbot dup-of:
> https://lore.kernel.org/lkml/YvEgyQM%2FWi0E2J3J@xsang-OptiPlex-9020/
> 
> While at it something else:
> 
> >> -----Original Message-----
> >> From: Sang, Oliver <oliver.sang@intel.com>
> >> Sent: Monday, August 8, 2022 10:42 PM
> >> To: Darrick J. Wong <darrick.wong@oracle.com>
> >> Cc: Jens Axboe <axboe@kernel.dk>; Christoph Hellwig <hch@lst.de>; LKML
> >> <linux-kernel@vger.kernel.org>; linux-block@vger.kernel.org; lkp@lists.01.org;
> >> lkp <lkp@intel.com>; regressions@lists.linux.dev
> >> Subject: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
> 
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kernel test robot <oliver.sang@intel.com>
> >>
> 
> Would be really really great if these mails could also directly tell
> users to add links tags that point to the report, e.g. in this case the
> mail from Oliver that started this thread:
> 
> ```
>  If you fix the issue, kindly add following tag
>  Reported-by: kernel test robot <oliver.sang@intel.com>
>  Link: https://lore.kernel.org/lkml/YvEgyQM%2FWi0E2J3J@xsang-OptiPlex-9020/
> ```
> 
> Obviously you need the msgid of the mail before you sent it in this
> case, but I assume you generate those mails semi-automatically anyway,
> so it hopefully won't be too hard to add this.

Thanks, this is really great suggestion for us, we will be able to add
this Link tag in future.

> 
> These tags are considered important by Linus and others, as they allow
> anyone to look into the backstory weeks or years later. That is why they
> should be placed in cases like this, as
> Documentation/process/submitting-patches.rst and
> Documentation/process/5.Posting.rst explain in more detail.

Got it, we will learn this again carefully.

> 
> I care deeply in the case of 0-bot when the reports contains lines like
> this:
> 
> >> #regzbot introduced: efcfec579f
> That's because regzbot uses the URL in Link: tags to associate patch
> postings and commits with reports -- and even automatically closes
> regression tracking entries in case a fix linking to a tracked report is
> committed to the appropriate tree. A proper "Link:" tag thus saves me a
> lot of trouble, as I otherwise have to tell regzbot manually about each
> fix for tracked issues, which quickly becomes a PITA. :-/
> 
> 
> BTW: I noticed this was not the only recent reports from the kernel test
> robot that directly got regzbot involved, but not all do. Is some bot
> decising this or a human?

this is controlled by human, we try to connect with regzbot for the regression
we found on mainline. So we add #regzbot after we confirm the issue is valid
on mainline. BTW: 0day does testing on nearly all repos from developer to maintainers
to next and mainline, thus part of them are bisected down to mainline.

> 
> Because the thing is: the time I can spend on tracking regressions is
> limited, hence I (at least for now) want to avoid spending any time on
> regressions that likely only ever show up in CI testing. But if the

got it, probably we need consider a few test suites (and kernel configruations)
that is more "standard", such as kselftests. But this is hard, for example,
we detects performance issue on micro benchmark, and it only shows one perspective
to developer as it may not reflect the use scenario of developer (thus sometimes
it is not reasonable/necessary to fix).

> problem is something that is likely to be seen in the wild it's totally
> okay for me if you get regzbot involved. FWIWI, it remains to be seen if
> that's a good idea in general (and is likely something I will bring up
> for discussion on this years kernel summit), but let's just give it a
> try. :-D

Thanks, we will stop this default behavior to send them directly regzbot. 

I saw one case that you tracked a report from kernel test robot (0day) [1], can i understand
that for now, you will monitor some mailing list and track them when it worths?

BTW: i want to consult that anyone (or CI) else send report to regzbot directly so far?

[1] https://lore.kernel.org/lkml/6b12a0b4-2f6d-1c35-f2e2-a28022583c47@leemhuis.info/

> 
> Ciao, Thorsten
