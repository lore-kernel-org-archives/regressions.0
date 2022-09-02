Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A30EDB
	for <regressions@lists.linux.dev>; Fri,  2 Sep 2022 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662121925; x=1693657925;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dsfTc/ms2jLMG5DbAydsJmtBCyrtuoq7WpdGH0X3WSE=;
  b=k2XQ3M2Xql1QWWjQXUJI2BjxlRsgDpeXSXQITVX1xlgn+IInqXYD71KK
   vusvJhE5x91LZiZTZ1JzOZbl9aJpLCPiSwZMhj2QMQm1Nqda4EUFK/Rzn
   nrx7wKglRtYDkluSqK+23i3TVkdbkRildmn6dS9C6lNwQ85gFHQwHDhPZ
   oUfNh/BRkwFO82OlP1fKHgcUbw5zLxljDyLspeSBD5BTQaYeiVsrGam7b
   Oo9L6yVl/EvAAinnxbpcLBH+FezidyvwQoYURQPSTV6sGlpBLMdi+JkiQ
   6Yf83eNuiuUzbD6i5MjjUKSVE7+MwJygtfLa3utbgceDCdU3WGzstssFm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="322129136"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="322129136"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 05:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="755247707"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2022 05:32:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 05:32:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 05:32:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 05:32:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 05:32:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WM3qa2sCJGTgmDFoa3yWCAPCrbDU9hJTcdnBFq6qYCVtQ5/99Iuk/jKvraWpDTt0Mao/+bjUZoFBC0L4/8metslVVP8aIOr+fA+ThjjHpDSyzDVhbuO7MLTo2aL4N8IovHMQYw5lT9iFXgDhznj43f/LGHHPFGQzkm8cwutlZRfOy99YvAktJ5R11Q8URUkXP+4GfLMJybs5DOGh3+k/t4dy7uvj+NU0hnixtDx7dWbgLxIHRan9Ba0yI2BwsnC4uLRFwXxIkGQBCBmAEeZnm6ii0LbELc0ma0OYF0YN4Dw9iozxLgzZr6kt9d5XXci6N2H9hTNbAwKLUVZwoxoeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yTicJlm4zMX0hsaYLNXIcJzLlXJz5fEdQ4Nw1OKevc=;
 b=HIxGPgdFO/0QugsZZ7nRQ4FcEH/ldNTqhyrxXVPMO5wPEYZAV275+D103Abpth6uUykGjJr4yUrE7rYHaosSblQf6DIwK9e6NwDderM2hkzrNK6IBkuDi1dZTkAtek2Y1c+EY627xltNdd1N0xSVoKKl/EJ79WCmC7Gj1gzGhmyPAklFF9Y4sZCe79fS3R2SKFGBOw+7sQfigZg4eZuGJjYp0v6mZB6dgaCzBHdPSEe8AlYjGex4qXk8IFOzhSnoGA7q7mWePgH9eN7gzovfacTAzi13bhLJNbYTlvQJjHj15LhJ6t6jXvzA7dRpk9yZoXn6IrUzXE8WlEQa8hEFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by BN6PR11MB1636.namprd11.prod.outlook.com (2603:10b6:405:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Fri, 2 Sep
 2022 12:32:02 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 12:32:02 +0000
Date: Fri, 2 Sep 2022 20:31:51 +0800
From: Philip Li <philip.li@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
CC: "Si, Beibei" <Beibei.Si@intel.com>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, "Sang, Oliver" <oliver.sang@intel.com>,
	<lkp@intel.com>
Subject: Re: [loop] efcfec579f: mdadm-selftests.12imsm-r0_2d-grow-r0_3d.fail
 #forregzbot
Message-ID: <YxH3tyWPm3iqCFGg@rli9-MOBL1.ccr.corp.intel.com>
References: <BN6PR11MB1729F27147FBD06FDED3F355FB659@BN6PR11MB1729.namprd11.prod.outlook.com>
 <384393c2-6155-9a07-ebd4-c2c410cbe947@leemhuis.info>
 <YxC5PJJlAG7VycLP@rli9-MOBL1.ccr.corp.intel.com>
 <6134ee07-a6c4-18e8-d54e-def4896821db@leemhuis.info>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6134ee07-a6c4-18e8-d54e-def4896821db@leemhuis.info>
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ae9925-f430-4a6d-5c6e-08da8cdf2339
X-MS-TrafficTypeDiagnostic: BN6PR11MB1636:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXuhvC7OnpDBN1YGAPmjGEYQd3He/CwgL9C/+QU/++brJPCCCCEL8MNNIe1WYbBy0+MpHXWLPr8cPs/f2o2HRA1rZd/mdYzMjt32VZuBcGqscqTwzv4qB3FCAHlFLguv+2MtP37TNdndNTrQP9wKiFHTxiDkpJSTNtExASlHCnwE+WSikAybk5Wpf8DRc9yJTjzPjAJvsXZ1q9h+YO7LhMC9WcMPS8f2uqIEKI8fPQQI4sWupyUuxUwHO6UIXxkGVlwnLWeSlRImupCZHdyFGvf0Ya2bPzMZXpDcOD1jW9XdHGJ/IM0RSVLPR1a0TnKFsfxGzoTnbQNRoiQlICIlW5A97SH+tGvaJTw+QBxR/Q2lnAAVXnzCo42wVAVtpcNGRdA77EwHgxIcSLlmo1o07kuT8TJa9PrIQzFxpl603UwTsuPuivjfvYflXSIeXDPT+jmqABY39vEvESAKe35XboJZfukckbItJYb8+KgIyTYskrIJvYcQnx3hIBa2v29lgBzyZmNn5d9uLUwiGqsbuOsStKx7mjlXMIZzcLo8V/Fxb6oeW05SrlO484muTpftJ5yelqjmc6Q1XjQdiP7cNKh05qcDN/5APBwrmseHDoU4zD8jZhZGZPD+7iA0h0QBgY1yBBsNTTc3DNBv7PaLMrRRWk/IqsK7zh3LOCxgYeQahbSTSNbvyr5cd75q4ydw06SzUi96jRyuMqOR6PN12A8eaxO3yzSpy8wANK6EhwRpABdlrc481w87uHOEfWdh5vh98CBf7hnNkw6mjNzybA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(366004)(346002)(396003)(26005)(186003)(316002)(6916009)(6506007)(53546011)(6666004)(83380400001)(6512007)(2906002)(44832011)(107886003)(6486002)(82960400001)(66476007)(8936002)(66556008)(478600001)(38100700002)(41300700001)(86362001)(54906003)(966005)(66946007)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9M9bRcmnxCeL7P+VLW9GLGeRr0Rhn7nrfIbHn29vcOJIaHyy9BvVK1VwMIH8?=
 =?us-ascii?Q?DrUqThxPDHxrZE7ftD8orUVsd+XtpwMSHR6FiQLNdILX/1fNunWX0awg4NjP?=
 =?us-ascii?Q?gHvMmj4AFHe+snChOT6TONneEptIoqVsQ4PSJkjMlPsQXKjHqdMMs7s+pHiH?=
 =?us-ascii?Q?4VF1MmBTPZO9gmEo4kgghoxLIQuUtd6to7SPydnitONyMbF3wvYkJzBHGHIK?=
 =?us-ascii?Q?oqHzsG5iMsGf1PKshMYhN8YF1hO0FFCRHXdFhzYlmR5xAfqj6WzednqO4cD7?=
 =?us-ascii?Q?xO5+zjYT3vrA5kgnKLPmqlE+AuQgyBNzZ/yj1uqmVuwAxfG6HWAHujH5+o1N?=
 =?us-ascii?Q?JAm+2zv8Jr2vhJAI8OnAwEmMmzyA/JaR/eWm22x2qfee3K3nVJ2Q2hJzLT6Z?=
 =?us-ascii?Q?m/VZ10BkxBjOOwY0/3kHRlt2VjgN4TrIqrxrnwN9Vx+3vXzEotuQrKMIoHTd?=
 =?us-ascii?Q?8FqQWFYK18jXB7yt692aw5hzKkNbPNGPig7MjL+E74KFW2b6K2/J/BP0GZik?=
 =?us-ascii?Q?vn+h/vpkRLChwBbbIOi6BgFxsJ/0WHHuc6BNR59ABshXfAXUQTysm3dD530J?=
 =?us-ascii?Q?uFV/GSm/46x89BkBeFzIZEMu0QttA8WTK8sN2o1R+DJJCY4cclP4v99QMsrg?=
 =?us-ascii?Q?nqFE1SGgaMZjlcYsKk2jfO58ZKaqOGTAI3roCAg13DzZfgVW7M+GkeaFpHv2?=
 =?us-ascii?Q?umNrrRXrT8+nkElriuOhzP+jbLZRD1f/jQydZWujl1EhKMWtix9V77gNunlq?=
 =?us-ascii?Q?S85VmHuvSed+p9KHRiizeaSYfU24V2tsrA8K2Xw9NnwNaL6IaGAGduFtWZH3?=
 =?us-ascii?Q?LuiCAqH1ppTc4XIpOCPqOW/NRM8ta68JIDg+oT7zCiAXegWeIHnhE1Ku6N8V?=
 =?us-ascii?Q?2ZPi7FmHa39e3fPeSBIzcLqPXK5W3mu0h0IY6RD8ceRm0DNrE/lWxS/SRe9V?=
 =?us-ascii?Q?N5tJeLVynfBzDlYS0kR1GqJs6tnhJMkdDRhV5DtszWH7A2ZbDc2Dwxpkdjct?=
 =?us-ascii?Q?ltWPfi23vIEouD2df8knLMWizLjX9E6gX07pa/klGj7ZngnCq19sfIYVqLW0?=
 =?us-ascii?Q?XN5dqGo0KpWBw6qb2p7HvlIYiZILoH/Wg3uMMZQZtiepHm//5zUUtbF870Dr?=
 =?us-ascii?Q?3dMRnZrSUYndUiYkHIuW6Lj/DKT1mgOQoDBSaGTVCXUX2ctWeHS8vm4CgyCa?=
 =?us-ascii?Q?5kASvVnyP00ib1MlvjiWrjIFtxMpBk0kT1s5Hc/1v6NgZcqfyNpiwdikdIuL?=
 =?us-ascii?Q?+30QL/a781JfnZrMVhfS/2YKZEJmJUp2QTIKsWrej/EE0i3Y/7D/JkGe2V6+?=
 =?us-ascii?Q?hdMPxwDYzMdUKxuVGUO2xqlFnyn+WUiJqM15uGLax1iPXXsFGOg/yGeJ7gZq?=
 =?us-ascii?Q?NwmnTv26qLhdDST8vF3/4pM+yCxMZzKuM7O/NQAAXQzTGpGk1TgGSNqvb/hQ?=
 =?us-ascii?Q?8tz2LP55QEQW+jNDkuqJKhpEZmVYcWgb9akU3CqoI/CAfj/5iPHXyy/RJmmz?=
 =?us-ascii?Q?T4j2GHdYst3caeWgRPNkgaUmiTPgmhJ9cZF4MqOghJI2N+gZVFfg4jdPtwK6?=
 =?us-ascii?Q?riu4eX7pKgqfkCY8NuC3+YGPE8MQ/5o47ddpaUC0Qa0B9jWt6QXlagnVguxp?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ae9925-f430-4a6d-5c6e-08da8cdf2339
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 12:32:02.6028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvJexXBYIVSmxaHnfOrqqgBVZEpJk7+Fa60G6sKl5RX03e0PzOfReSugAHNAlSR7B1UNW9bKqKsqFPFRAbSZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1636
X-OriginatorOrg: intel.com

On Fri, Sep 02, 2022 at 01:23:55PM +0200, Thorsten Leemhuis wrote:
> TWIMC for those that might not be aware of it: there is a parallel
> discussion about the interaction about 0day and regzbot ongoing here:
> https://lore.kernel.org/regressions/57c596f7-014f-1833-3173-af3bad2ca45d@leemhuis.info/
> 
> On 01.09.22 15:53, Philip Li wrote:
> > On Mon, Aug 15, 2022 at 09:19:30PM +0800, Thorsten Leemhuis wrote:
> >> On 10.08.22 07:44, Si, Beibei wrote:
> > [...]
> >> Would be really really great if these mails could also directly tell
> >> users to add links tags that point to the report, e.g. in this case the
> >> mail from Oliver that started this thread:
> >>
> >> ```
> >>  If you fix the issue, kindly add following tag
> >>  Reported-by: kernel test robot <oliver.sang@intel.com>
> >>  Link: https://lore.kernel.org/lkml/YvEgyQM%2FWi0E2J3J@xsang-OptiPlex-9020/
> >> ```
> >>
> >> Obviously you need the msgid of the mail before you sent it in this
> >> case, but I assume you generate those mails semi-automatically anyway,
> >> so it hopefully won't be too hard to add this.
> > 
> > Thanks, this is really great suggestion for us, we will be able to add
> > this Link tag in future.
> 
> Great, thx.
> 
> > [...]
> >> I care deeply in the case of 0-bot when the reports contains lines like
> >> this:
> >>
> >>>> #regzbot introduced: efcfec579f
> >> That's because regzbot uses the URL in Link: tags to associate patch
> >> postings and commits with reports -- and even automatically closes
> >> regression tracking entries in case a fix linking to a tracked report is
> >> committed to the appropriate tree. A proper "Link:" tag thus saves me a
> >> lot of trouble, as I otherwise have to tell regzbot manually about each
> >> fix for tracked issues, which quickly becomes a PITA. :-/
> >>
> >> BTW: I noticed this was not the only recent reports from the kernel test
> >> robot that directly got regzbot involved, but not all do. Is some bot
> >> decising this or a human?
> > 
> > this is controlled by human, we try to connect with regzbot for the regression
> > we found on mainline. So we add #regzbot after we confirm the issue is valid
> > on mainline.
> 
> Okay, good to know. As maybe visible between the lines in the other mail
> I linked above already: I guess it's fine that way and we should
> continue with this and just see how it goes.

Got it, as replied in https://lore.kernel.org/regressions/57c596f7-014f-1833-3173-af3bad2ca45d@leemhuis.info/,
we will get ready for what you suggested, and send selected reports on mainline
to regzbot.

> 
> > BTW: 0day does testing on nearly all repos from developer to maintainers
> > to next and mainline, thus part of them are bisected down to mainline.
> 
> Yeah, I know. Regzbot in principle is handling next as well, but I guess
> we should ignore that for now with 0day, as keeping an eye on the
> reports against mainline keeps me quite busy already.

Got it, we will focus on mainline to track valuable ones.

> 
> >> Because the thing is: the time I can spend on tracking regressions is
> >> limited, hence I (at least for now) want to avoid spending any time on
> >> regressions that likely only ever show up in CI testing. But if the
> > 
> > got it, probably we need consider a few test suites (and kernel configruations)
> > that is more "standard", such as kselftests. But this is hard, for example,
> > we detects performance issue on micro benchmark, and it only shows one perspective
> > to developer as it may not reflect the use scenario of developer (thus sometimes
> > it is not reasonable/necessary to fix).
> 
> Yeah, it's hard. :-/
> 
> >> problem is something that is likely to be seen in the wild it's totally
> >> okay for me if you get regzbot involved. FWIWI, it remains to be seen if
> >> that's a good idea in general (and is likely something I will bring up
> >> for discussion on this years kernel summit), but let's just give it a
> >> try. :-D
> > 
> > Thanks, we will stop this default behavior to send them directly regzbot. 
> 
> See above, as I said, it's fine for me if you just continue to get
> regzbot involved for now and I'll get in contact if it becomes a problem
> for me.

Got it, thanks a lot

> 
> > [...]
> > BTW: i want to consult that anyone (or CI) else send report to regzbot directly so far?
> > 
> > [1] https://lore.kernel.org/lkml/6b12a0b4-2f6d-1c35-f2e2-a28022583c47@leemhuis.info/
> 
> A few developers and users get regzbot directly involved when reporting
> regressions, but I add most of the issues to the tracking. But no CI is
> doing it currently. How to handle reports from CI is actually something
> I hope to discuss on kernel and/or maintainers summit in ~10 days, if
> time permits.

We will be very glad to follow the decision if any is made there, and share
our thinking along the way to see how 0-day can be useful in this regression
tracking process.

> 
> Ciao, Thorsten
