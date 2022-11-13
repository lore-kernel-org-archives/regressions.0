Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60126.outbound.protection.outlook.com [40.107.6.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96D6FC5
	for <regressions@lists.linux.dev>; Sun, 13 Nov 2022 19:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivegI4CeIx9rvgt9V6A3lkTJfMRq1y4K8QqhbBicsaSpoKsnc35VKp2pgXxhY27hAiy+mPtB7rpZh4i6rhR4oWUMyb/su/loJcyO8G8IpWz/Ogqy1+8nd78ILwlxOivD05SOHoIbZPTH+Cgv3bP5hQlo7eMinbBdbOz1/pNI+StWbqzs0trQRNGELcg687wsnYJ1QvGne895rlvDdyW7YXVh2SX30o5l9pdHi6l7NA0tIi031kqaVtXKNIBCGcrfpAxXzwwzikjiGMW7KHkA0UtmO09JlqzDEQXGYxKvDRLJy6ntbtvsMLTqOejwEtT19DMS4opPVU/8RDOivLIbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNZZJQ7M7lcaVFcxOJR7XRG4PIuxif4+Z/PuPqX6cXs=;
 b=n8zsRijyrzooz2Lqo1riQaZxGmtgNZT8qoE9HujQJ+eHJfdZ01+mAkBLILAeJgl0scqAE1bldQVzghYxDoGA3cNLjFIoeLfodELjP2iEMw7pdwfZUWyGZVXzab+n8w8fJSSoqKt133IIcZcZud+QV3UQhKS7FYPZH4WriM3KG8PyN7ShgJe3YA47tlueFHv4evcd+j/Q5P6ZKwXnFhQuhOqUUaYzKvcXZFrDzggpdEEHY0S7E5YcR9cjRvMh+iQeCcknG5zrXd4oElpg/QwSxtF5ZSuJGzDA36AAIsi+0k70TrB9YfoQmsLZXdO5UpVoMOLbe6FxNrRzn6BQJiXEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNZZJQ7M7lcaVFcxOJR7XRG4PIuxif4+Z/PuPqX6cXs=;
 b=M74+dn2ILf5EQeG54fiU4I/nXNqxRNYRysVKKUi1CF56u7qiwapCPg4M0J+hcVVsyOFWtVqBOy6RdarqiE18/WDZA//YjeaKnY+CGSIc2o2ZgKNTVJFeLRMQgfUZ9je7vxTiYX816rD1KkL8vs9Hs3sQBhP5POaIS6eO0NS0Sqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAWPR02MB9830.eurprd02.prod.outlook.com (2603:10a6:102:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Sun, 13 Nov
 2022 19:41:51 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%6]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 19:41:51 +0000
Message-ID: <db6f1bb6-d681-345f-f0fa-c652c44c8e52@axentia.se>
Date: Sun, 13 Nov 2022 20:41:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-usb@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>,
 regressions@lists.linux.dev
References: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
 <576b2fe7-4753-73c3-f2f1-0387da175ad9@denx.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <576b2fe7-4753-73c3-f2f1-0387da175ad9@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013DB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::14) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAWPR02MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ea8f79-d97f-44a8-8fa6-08dac5af1c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QmUOHcfz9SfIt0b6GHIB5lq4gWl4K6GhqLTJR8l5XNDaPVmzToFAX2CiyEqIWVnRaePd+EXAR5oEabf7SJ4yKfB1d79NlZlIBp76eFXpR+gk5p3ij/3DT0MrcSty+8rC2ql3g2s1lPMIwQS4qfuFLmnXFcpJ1DR6IUz1Mol2Bu6tYBT2VNT7Aa/DBjc57rriP3NWxcASsqXWPsVnT0Hy2se9AbihcmUTl+j2ir6haHZictAmzHQPrKRl98iKfYWFNSdo27kiav0EUNlPiJUIcEgej3ECOdQK2N8X1PVxV/Fasz69qxqU8bPYpFH+mlPc5SUqrW9MuDRAbNPI2mL3mSMdjmdl22mUyrkE8fVF4drZHOVBc8HhCLqR5H/QFHtJjJiz4glP7cSxVl3X5RFgOCr1xQPquxHEE1OuQGMRSMIyntDO8kzfP5a3uwuRJZhnC1dk7J/l/EdJDRxnWWZzrlSK01fVgFwGytYEZaHh8sm2unCvyYZR46ul4wQwASC9xdEi0yWbfPZ/Hlo24NbtTchM7usS0y/BzN16JhiZJaGO3fJjRPKuzle6AXzGt/NCZ/7Y+svBjNZejG0/lvD2Jl82QpWIKzw+DURDuQ4zdx0fzdhGYYU/M7SovlYWj8osGTtSS7N2LcaS3T13WzndB78GjFtGGCb96+lzHRiLNP9cEVXJVp9BjvKNfUd7gbM05bRJ7jsb9XYdfZUAoW24yk0hJcMxmyzPvc30uPIsUXYHsg2B1uf6ZKvrHuNLV6PCkaqXgKC7ae8q/aj2toBV3ocWPIBT+qd4lA8h5q/+tY9mvXRG0/lBDO+5VGBrVq6b
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(136003)(376002)(39830400003)(451199015)(54906003)(53546011)(6506007)(316002)(41300700001)(4001150100001)(2906002)(36756003)(186003)(8936002)(66556008)(8676002)(4326008)(66946007)(66476007)(6512007)(26005)(31686004)(5660300002)(2616005)(478600001)(966005)(6486002)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q015N0tzcmFBSTBwaDJ1WVlDZzZLSXppS3RiaXFyOXpUZXlCeUxSTzlUSWtv?=
 =?utf-8?B?MHBHc0s2K2h0TUdLemxHbU5zSnlVWUdUSkhWMWdqK3IwNDh0c24xZHhCVzU1?=
 =?utf-8?B?WitobzAwK29aNjB5bDRYdjVIVGo3N1N3Y0dNQVp1K3FVd2V1TXVSUjQyd1Qz?=
 =?utf-8?B?Qk5RNEE0UFZoOVpwUVVEc0dKSW9pcy9rNFlrYUcwTHdmMXdaTHVOSEl4dkR1?=
 =?utf-8?B?R1dwY2F0MmVnSzJURlRsdndBRTVyNmtEc1Yva1pKYVV1NDEyaGxCNUZOM3U3?=
 =?utf-8?B?VXFsc01PTjNsUjNIR2Y2eWVwTmVMR0c0c0tzTjF2TTNpeW9aTTA2eHd6NWU4?=
 =?utf-8?B?NzlqTXEycVAydjNyM05IVVhSTWNpdmNXalZTRHhOSXgyNUxrWVJjS21WQ1lx?=
 =?utf-8?B?NmZLVWUvaC80SGlNdHgvdlc3S2RGakhYL2svRkg2Y0wycG90aklTS1VpK3Jn?=
 =?utf-8?B?d3hTbWxNdE5tc3JSZC9QN0diZlNiS0pTUVNXU20xN3hFUkRoN0prcjcvaGxy?=
 =?utf-8?B?UHdDeFJSZDBEODBFOTRRc1FwMkdFSE5LQ21DL3dsSHJJaEQ2SGJleUUrSmF2?=
 =?utf-8?B?V080WG9kWDJ4TmRMMFkyVkcrUjBWZVVQMllqN3dqWWRDWmdxNUkrN3BZUkJw?=
 =?utf-8?B?WG5JYzd1c2dnV0pjNE9zQzgySWhHbUZWUzR5OVdhd0s4dTl2MmFnSEE4cDhx?=
 =?utf-8?B?UkVVbm1LTWZBVVhYK01GUjRQOHltWEEyYkNsZ1J1aHorb0dQUDZBb2ZMMGdK?=
 =?utf-8?B?cmxMd01zUUJCL2ZtVC9ZVmhBTlk3bXhkU2FNdWpjcmg1SmNVYzc0K3IwV2oz?=
 =?utf-8?B?WEh0L3B0REdvaEtNOE83dUF2czFEVlBnSDlSanN5WlRSVktwazZhVmIxUnps?=
 =?utf-8?B?OHRYZlg1b2JNcGtEWFZYNkx1RjczbVk4MFJOME9nYVhmUkN6dlBPc0JkTjNJ?=
 =?utf-8?B?RzcrN0UrSUw3Ym9JUjJLZk5aUTBmZjN3T2FrRSthM1hBbSt5NCthalBNVGFm?=
 =?utf-8?B?RFdBOWZnZytSUjFpWVN3cjRaRHBPU3NBMjFNUUp4MlFBaXM2andDQzdtZVZI?=
 =?utf-8?B?eXROZXRUWE90RElKem5PSkxCTzZTS2lkMHdLb3RhcE1BN01GZzJpQTVka3dp?=
 =?utf-8?B?emtkWjN5VEZMaHNlbFZDSUVxNEh4Vyswa2RNa1VzUE9xTXhhOWtBUnZ6MVdo?=
 =?utf-8?B?YkNqVHl4YmNCYmFRTExocStaY3BaczFGdTdlYUhkWTZjOW1ZYm52NXZFMG9O?=
 =?utf-8?B?RkhPL3FaM3VZdnJrTEptM0NJaFhGRzVIcStKcXkxaFozTzVqWVhUaEdrbDNq?=
 =?utf-8?B?ZStSNHN6OHRlR1VvcHBWZm8wdXdOb2t2aUVMckVrQTYxVUVldmF5WnArY0pR?=
 =?utf-8?B?a2hQUjVzZ09ta2VqdHpkR05ud2NzQlovT2NOd1hnUmdINWI0b3R6VlJGRGVY?=
 =?utf-8?B?U2gvdjRBajllcUJNWVJ5NkR1c3hLYlBaL3JPdmtXR3pDeUlrWUNzQWkxTTEx?=
 =?utf-8?B?Z3crTk0yRkNRNWJsMnhtT0ZLaUtXZE9MWFJCS1Q5dVljQVJHVllZVHp4ejZp?=
 =?utf-8?B?NWF6VVVlbFZ1Sm9oL1dBb0NQUnJBbFVQQUFTVS9QR0UyclBpcWc4RldsL0w2?=
 =?utf-8?B?OXArN0pEWXdEOEpqOTNMYks1d29VMENjbGpNUWxNQ25SRTJSU0hSK25kSkxj?=
 =?utf-8?B?d1dMTmw4NEt1QkxOazRsQVpQY3hxTE5OT203TjFDL0hiU1gvdFB5dVhDcHJs?=
 =?utf-8?B?UmFRTmhSYThKK2dJZkUzTGlsSzg3a29raFl5Rk41RjFObjF6MUhtZGN6RTRs?=
 =?utf-8?B?cklGU29GMUlxcTdzd3JwQ0p5SUdhcWlER2E2eHBaK3BBdi9VTkR2Z1FJSnVm?=
 =?utf-8?B?QlAya1VGbDN5TjhJeVhJNXA1aDdvak8veE5zdUVHaE42YUxLdjFCTk5EdkFL?=
 =?utf-8?B?eXNmMzFCNHVXRmsyMWlBRDJPZFNiUjFWTzk4YnpiS2ZPbTJTNnJad2JFZytm?=
 =?utf-8?B?SVV4ckF4U1BMNVBLTjhqZzhtS3JOZk5TdDNQL01DVVVOb1kwUlFKRmlCdXBM?=
 =?utf-8?B?R2F2b2RsMVRaOWVERXJpZGhjKzdqNlFXbXlMVWNlNGFNc2srV2d1TlU1Q0Ji?=
 =?utf-8?Q?pSw0KcsDPDBiRziFjPSi+l44q?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ea8f79-d97f-44a8-8fa6-08dac5af1c7e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2022 19:41:51.5757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8M+oQnjrdvN+uhaXPOPAfmxmvwlZMgkfOpKRB7zXj79ZDPlNL+m4+SR1+QHaQas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9830

Hi!

2022-11-13 at 19:48, Marek Vasut wrote:
> On 11/13/22 17:59, Peter Rosin wrote:
>> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>>> which can expose details collected by the TUSB320 in a far more
>>> precise way than extcon. Since there are existing users in the
>>> kernel and in DT which depend on the extcon interface, keep it
>>> for now.
>>>
>>> Add TYPE-C interface and expose the supported supply current,
>>> direction and connector polarity via the TYPE-C interface.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>
>> Hi!
>>
>> I'm very sad to report that this patch has caused a severe
>> regression for our devices. They can no longer be powered by simply
>> sticking a USB cable into their USB ports (they keep resetting
>> when the tusb320 driver probes), and they reset (and keep resetting)
>> if a USB cable is connected while the device is powered by other
>> means.
>>
>> We have no connector node nor any typec-power-opmode property
>> in the device tree, so the mere touching of the new registers
>> happening in this patch is enough to cause the resets.
>>
>> The devices were fine before this patch, and reverting on top
>> of a recent linus master (4bbf3422df78, from 11/11) makes the
>> problem go away.
>>
>> Any suggestions?
> 
> Can you test:
> 
> 341fd15e2e18c ("extcon: usbc-tusb320: Call the Type-C IRQ handler only if a port is registered")
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=341fd15e2e18c24d5c738496cfc3d7a272241201
> 
> ?

Yup, that solves it. Thanks!

Cheers,
Peter
