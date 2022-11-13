Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60108.outbound.protection.outlook.com [40.107.6.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2B46B2
	for <regressions@lists.linux.dev>; Sun, 13 Nov 2022 16:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeneEnNog6ChXweb7vA2oOkiK/u+N4o8rRKIWlwyQdKbUr6z709ZyfdIIfPQR0VthJrrMUv5DDHtRe96vmQz30KIdhuIDD+LJgjxI6Vtul8s9X7qfcmrtJ4JAiREn1+LUWuoYkZymn2JBALL1O2+tyiUMM/mpGhozSBBw29THRXTtZjDJSUxtaDazapERwYWYV1dldBCsegAKq1GqynrY7cQzi2wTGYmqPCWpA8fIvYzEOljV65Pyhfn9WKpTsajo3jTVzAGPn9kV5GtIdK+YAqd9Scauu9ZOjicRDl1bpYSmpR0dzdiOXRXsvpFK+ORhnndRzk1T71Be1IK6f2GMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnRIY+2Hwk/Bzfjqxn5BB5Wv4ck/dvH4OaghIqv+TrQ=;
 b=STp4Y/uj1moHHma3pDDADtPvg4Qc4a5sjLgrhAlcp1+sYToWBJROMeTdUzBj5Z8axDlZZncjfJ6EvwraWQgTeQ/iJSqmU8UvbWGLVAwpr3KJbcQYazD8eCXfEdu5t4g8FwyGY9UYJU8yk1VGKcR4YrUpPkS7YYKhu4ggA7kEYYTkbC7CW3143tWg3r618mi0/XqI0B4Ak87fbdxluSXomrgmE4kWT9Q4bVSLtgJglDHztipC/RIZdAyjgIYyYqniLC8WfQLHoiRD3Vr+7z6J7MH3JdyidV00vEjRtZ9pKyBIfkTkPgMxnAZs1/MUxUntz3LJ1+sjNliqw9tnuLd07A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnRIY+2Hwk/Bzfjqxn5BB5Wv4ck/dvH4OaghIqv+TrQ=;
 b=YX+tqQZ2rVKlwadJRe/hzyWvdBQ9375Hzbo0qmaJ5CiqJuVZBUcDEBGap449XfYmif2ZV5Lxf/Iwu+C51c9NDuOSRtgOhS/m5BirNKyIki3ulcUSSjvDo2UDFjvS3+Gt0P0Ktwcp66U5tVlz3z2eRnrnJQI3Agb3wf0HY3xAthg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by GV2PR02MB9566.eurprd02.prod.outlook.com (2603:10a6:150:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Sun, 13 Nov
 2022 16:59:46 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::a30:dce8:eaa4:7687%6]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 16:59:46 +0000
Message-ID: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
Date: Sun, 13 Nov 2022 17:59:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Chanwoo Choi <cw00.choi@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>,
 regressions@lists.linux.dev
From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::31) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|GV2PR02MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: addcc707-76dc-45cb-f595-08dac598779d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EA5cLslGR4OctKMMImGESGs03OXlgcHEGrB0ZhUy8KwwZqKOXlXXJ6ajuSigdEaeM8D+5FdsTvVi/8NHtXChrM0PxNrBx9ZjSFDmqd8BD821D/lZ2t0ZNJFEvkkyB1BQ/YorInvOFM5TBJO58QVqjD1+piICqV3TBZWXPvTYZVSiEh+p/jXi3dvJgs83q4OL4f7dC6I/t5yZ4PTsl764eoRxdNaX2XSgZCOwbew/xW3fZF0QePAA/AqWdyrCoioyKV4MU4E8VzEVOEKAJ258i4jfnhLqYWA0pbYxNp2fcwpBypQ+P27QM/TjEO54ikllimURsOhENGFw/3VYjFXzXXQn6UEvKw8i7ZC2vncbSWGRIRROOXeZ72bUtnMo1EAlfqEI+h7+TamgS5d6igymg7V1o3Teae3wCZa7QolB9NXSVi/Bucnsd2M7NZ2TugOBGJewcnKHUrNTGqXgnoMt3lJwQ9Uk4+NS2EoL7c6Ee06mCy2QByIVin9LiqDLMVGUbGNMc3mfHlbxa+KsBH7OHYzg2Xe1ivny302CKjDSjba+VixWI56mJUcGSbX5v94uYXqkdf4OA8TASzwNTmKEWG0QtcigCW2x7iATgG+/z1YPM7kJt7X9mCFDkqW8sYpZofztI4RyLhaKvPmiwLcVs46F7WBGSwfIyYi9FkeHviyGt8yAX0bOWbfG3V7mfDfUd2oDq7H/8eb5eLMVnmELbpqpAdkaTh6JnXiS21y58bFmO+Xi3ZITCd7PclBepw9KvsAD9fDT9zXmZ1keG1N1oU2vfaPP7Z7u83WUWmGcMug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(366004)(39830400003)(136003)(451199015)(54906003)(86362001)(31696002)(8676002)(4326008)(8936002)(66476007)(41300700001)(5660300002)(36756003)(66556008)(316002)(6916009)(66946007)(2616005)(38100700002)(478600001)(6486002)(6506007)(6512007)(186003)(26005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGJtaVFjZml2N3RKbno5Q3l3YjErVFZDSktESm54d05Tek9LT0wxbU8vc0Ji?=
 =?utf-8?B?QzBPbXJhNEdUcG1PQlpGeHpKSkJRaCtzUTU3elc1VlNIN3JJcEttTTN0emRH?=
 =?utf-8?B?VnJSZHk1QVVZcGNjMEJnMGVOLzBEZ05Jcm1Oei9yRHBYbG1UaVFCQTNxN0Vv?=
 =?utf-8?B?TDQwNnI5Z0lFVDRHcGl5ays3VmhhSStmeXkyVGlsM2pxc3VXV1dLMGZoR0l3?=
 =?utf-8?B?NWRQbUtvUTZKUnVRcU00RlBrWm1kREZOUDUrS0ZWcjczYm5oZmVKcFBtSkdD?=
 =?utf-8?B?bWw4OTZtU1IwamR4LytzZUczMktySnRNdlRPcXUrNitzSWw3bWFFaXEwNXBZ?=
 =?utf-8?B?djdBU2RwMCt4MFNOV3RFZXhTeEo4MTNxTVcxMFhmVmxkZWRybWtQQmZMLzdv?=
 =?utf-8?B?V3dtTlFUS2MvaTVrWXFrRHltRVN0SzVQclhNT2hBSlRwU2NOekNkeGlEVU9o?=
 =?utf-8?B?cGduVFF5dmVwd2s1alJYSXVnNUo0SWhrRzhPYVNGcFVLV1Y2SmJZdTYwMHhq?=
 =?utf-8?B?QlZyWEYraXpSNFFmV2E0UW9hbk1zUlNDQmxZempYVGt0RG0vTnExZ3pvM3ds?=
 =?utf-8?B?U2dYK3FDRlE1VkFFbW5vb2EyeFBVV05lQVVHZWdIUVk1WjhXcHVOUDY0WjdI?=
 =?utf-8?B?LzNwRGFVbTZqZDNsbE5URzd3ejkxNVpJSk5hSTY0V0ovSU9RLzZ3U0JhMGVK?=
 =?utf-8?B?SDlJSnB1WkpGdkEyODNuRlNpL1huWHRNMG5MVWY2Y3d1VzFjK3pLMlVaMGVa?=
 =?utf-8?B?WHR6Z3YxbVJ5b0tISGxlT0J0ZThkdzBZMTF6YjRkM0VoWEJXdXg3ajVFWkkv?=
 =?utf-8?B?NnpPVERMaStma2VhMWwxc3hvMk5lY1JhZTdZTnMrNlQvQ1Y4bjF1Sk1qREZn?=
 =?utf-8?B?cHZPUzJINlFubEpiOHRQbmtpNUhLTGNuZ1V6QUJqeE9JTWlWNERPSG5zRS9r?=
 =?utf-8?B?M2F0aGNRaTNaRU52NTk0WTBWa3NNZjFyK1ZRZFBKMm5LZ1F3bDJLUnIvNmZ6?=
 =?utf-8?B?c21oQWJ3MlcvRmpoMEdqSkt2RFpJajl2YUFNZVNHaXpDZGp2SDdZaHlodWVw?=
 =?utf-8?B?UzFKYUhid3BvcjlwazM4WjVRQlRtRmpnSHM2cFlYSHJTMWVzVkw2Z0JGOWhN?=
 =?utf-8?B?aUlqQXRqYkRqN1JpSHF5NXJEMUdtM2ZoT0hZenhqTTZjVDNNREpWRVRoQkp3?=
 =?utf-8?B?Nk1iYTVRazNRMTI1L0diSk40Sm5QY0FyS1dSdVBpSnAyMTdGYkhiMFZBOE01?=
 =?utf-8?B?SnJlK0lMWDY0VW0zRHoxeDJNdXUzUjNFZlkxSkVyWTB5L05FRkU1RERHN2JW?=
 =?utf-8?B?ZG10QjBYSXlENHdFaG5uMno3Q3ZaVm5lWjA0WXY0UkhsYnB5Uml1VzU0UmYw?=
 =?utf-8?B?ZkZxdDVnNlpJRHp0SXFuQko5aG1mbkpMb0hJRmpDWElHOUNobGJwQXlYVEE0?=
 =?utf-8?B?d2NOSGYxM0lWbzAvYStscWtVTmpjY2JJbG5jYlNUWHFRWWcvbHdndGdnenAw?=
 =?utf-8?B?N0ljTWVDS3FUdjFkZFB6ZmNIdXlsa2tiZWcxOGdYRWN2SmNGajB1Z0xZNk4z?=
 =?utf-8?B?emFRL3oyYjhERCsrb3BzOEdDeU1oY3dKajNoRnQzZXI4cjdML0hnSW43dXBS?=
 =?utf-8?B?WU9tK09OeHB2VFZjVDQzMnRvR2Q3c0NTSlpRNVJNcGRqbTdNMXZaYlA4T2sx?=
 =?utf-8?B?SEFqUkU1WTN3aDFWcXNKQW4zZzJwcWJKcFJ3TGpPTWo3Nk45anJ3bXlKczBw?=
 =?utf-8?B?NWFrWUpzTng5ZFJDUEp0YTBTS2pMMDYxT0JZUXhHVUgrOVZuRDBQSG03dTJH?=
 =?utf-8?B?ZmVhTEgzNnpDOUU0WDAxU2JXVGtUMXFHM3lyUnlWalZaSnJZOHl6VDJERFpU?=
 =?utf-8?B?N0lCZWFwckRUaWsvemF6a202c3pBcVZFdU8xNUhPNU5PYmhwWjU5M1JoYnFJ?=
 =?utf-8?B?QkJwYnRGbndIUWhvbUxnM3BQazFaVURERnlRcjVDTFl5NCtsejZOVHJiLzln?=
 =?utf-8?B?YmYvMG1tdjJQeFphWTA0VlliNWhYeDRUbVZGMTJ3U1lQK3FVN2V2SExBU1ZP?=
 =?utf-8?B?QjI0cENHTkFsU0M3dy9GOWNETHgrcVNNL1o2NTB1MlBkeVZIU2pjTVhvWDdR?=
 =?utf-8?Q?vfILWczCJLlP/j8+8kawsA/Ft?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: addcc707-76dc-45cb-f595-08dac598779d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2022 16:59:46.0450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +co2xFidCsEQvS9sX0hpWhN99FY1fn0+y1OFA17gr6pkk9cYuzmAYtsUiCfVaLG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9566

On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
> which can expose details collected by the TUSB320 in a far more
> precise way than extcon. Since there are existing users in the
> kernel and in DT which depend on the extcon interface, keep it
> for now.
> 
> Add TYPE-C interface and expose the supported supply current,
> direction and connector polarity via the TYPE-C interface.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Hi!

I'm very sad to report that this patch has caused a severe
regression for our devices. They can no longer be powered by simply
sticking a USB cable into their USB ports (they keep resetting
when the tusb320 driver probes), and they reset (and keep resetting)
if a USB cable is connected while the device is powered by other
means.

We have no connector node nor any typec-power-opmode property
in the device tree, so the mere touching of the new registers
happening in this patch is enough to cause the resets.

The devices were fine before this patch, and reverting on top
of a recent linus master (4bbf3422df78, from 11/11) makes the
problem go away.

Any suggestions?

Cheers,
Peter

regzbot: introduced bf7571c00dca
