Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6AC313E31;
	Thu, 28 May 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995388; cv=fail; b=JnpOjoNXB0ZbIuYsCCN/uDFae5n0gPEiRUZ9DHTSc1LFpdLceD3dUmWvbevf5ySdI7sjcw89eS+mT+qcc3tTMr72QVEvKgCTQFsiaiRUtnscuThzLmMaPp1iC+w8WNKMawiA9e5M2HmTQ7ETVY75HUuQ2MbPPnGc5wowjcR4m4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995388; c=relaxed/simple;
	bh=uNFlH7zxhpD3U2Jf6XTAtXofAirCxZUPf0Y9UHUUv7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dJnbPY3a0Q9r4o59e/Nhg/KrBdz9MOe5TSIFyzlxOW1t1n537WJqSKJM2KGG38U0xnN0kLsfdcyDAtaarJeCJIKsb88kl6VPDA82m+e2J+Xh/673XqQ9++2V/Dn/6vYIVoUPQpLEX6JGaUqB3tseYQXU2wbp+xBEFWZB56VK3mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nSR5AK0b; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nSR5AK0b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd4p5Rs+1cqfZe6O7OU7THUl9AZST2OeW4wY6PKO/wzlL4PM7ynsn9p1r6/wxAA+rxT76+C4o+369aCqDYRfuS1pP7GlGFgvhT7cg1O3heFnZ0vthE4pehxDABd7DAF19SzQBxVSurgKhTybbV2yyx4Lgb6OSpkOY8pSrJ/PCsnomEsYGPsROfLxDSkduTLfLFDHWVJuRlt82+/w0rNToN6bVQeJhn0MzSlumeHdmW1FsHPAWpKjgNKPCxT0n7mtI9cF8gcbzUNvQUWwzOwULJ7AIwOBOPKVFtpmz2F31h+XP0Q6gZRBBQOSUXcw8c+YB5Y/scZKOUuVcabL1GN62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8980CRW+gtXkIey8A7SUzHGS67o5JUfgg8OpWnRZ5o8=;
 b=ThjgFK4C1oIY3QWQuac/MgCMmSFcmnGWYnrXOHLNpECSKuPexYJoUEk0Ojg0Vbt3GxjPoArh7O7Trv33JItyCoxya0cxImFins/srXjEvj6NIe9Wm6OGmWx3dwdQsmskNhe/Sg+9krqINdtHihRSeoyzjFYpoVmfh4lKlcnHHVZGEi6h8GnOrWydnrFyItJmDYaLuvpnjn4kWdnbfph2g1zJPdkcfrL8IDTpjkHaGDUJpo94xMl1Hh0v3v5owL93cmFac4Jli8QdkNn4yn6/IJZBPpi2Faui0iQnwhgE41BU1kyHBoz0dY9UbMHSytSC80htN3awZbC2iUjCObwztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8980CRW+gtXkIey8A7SUzHGS67o5JUfgg8OpWnRZ5o8=;
 b=nSR5AK0bl7xgALFRThM6IesvRTVy1X9jI1/toHiVYbZVeZqB/Axb/89dwSFo8k0Qi1gQGnKLPn6EtxuW2xAC79hwVmHWQwtmsRJMHepvY/m5YUTui0gBNIkv7T+8EMWX1cpj9hSV2d7/Xxo6WVGHEnPBHXRMNGSinAlXB55BFai53xcQ5PYGekZ3rpa8y+wypZziSVjMJqWM5XU5NjhwU1d5QaNqUw3HfMOuPYjmJUrIpYpYAw2yZoHc1U8iEdu6FZfvUfTvBa6tiucZ67kAOIapORWn+7EKeCU373E4TTQttsNuJT+dzCZkpy1/bPj7buFtkxJ7GqjX1eQMq5bfVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 28 May
 2026 19:09:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 19:09:42 +0000
Date: Thu, 28 May 2026 15:09:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
Message-ID: <ahiS8B2j51ztTaBn@lizhi-Precision-Tower-5810>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
 <177816879666.299775.3947960528231798400.b4-ty@nxp.com>
 <3cc57464-a10f-4b8c-9080-8d6f65a0d42f@leemhuis.info>
 <ahhxtz94pX9ujv25@lizhi-Precision-Tower-5810>
 <021fb6d9-fb2a-42ac-9e50-06471fa76383@leemhuis.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <021fb6d9-fb2a-42ac-9e50-06471fa76383@leemhuis.info>
X-ClientProxiedBy: SN7PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:806:121::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e82655b-e471-4780-063d-08debcecac88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|11063799006|38350700014|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	tTJjoxpBJjyWE3PVBDzzNsGIW30m/zz/k75YgrPCXlP0ZWyFogZJqUN8Pwul9xG6XceLK+iLkiQnOCkKkhmOy/PjzwcBa7odm/pYfyG5K98F2bLeZmyWrqzdFU0Qn1fxR8j43433b0PuQxy43GFoTWXuH1ly7k8ILKhKmU5oXHOGrS+oeef/ak8W37ZYNBibwW5NB4vOLCnOeSZnPcCcwwhd0NYv0XpW1p+VO4WE7eLU0WRVzwX49mWwFO49aGOnqwu97Ckz1+XOopicB0yPDy478aUwETxQ9HjPhSgN7WmEoVXwGy2/oylCcoeBcNtsTkjHig59yGVpbYnkYkKyAHil6ZKpLuonlXgH3Q+61nq0OS4yVuVLqHEvTpj1yPNoDDj/cZ/7XkXyMKu/j3spFFv8FPsrjTdk3N/U6gxBXgqfIKmcul1j/z/pE7oUfvan/UrgnLzBjTZFbT+oGNPkYQyj4C2MrLd8t4z2+62++EpfKnoP5JHpqjFNt7SJ55eMZfPmrpSXrlbYVHfbopHIFdQq+szTOc2grNBbqNlfW5F5hOAo7CJCyfZ3rjn0RyBv1IkHKunoI+nvEXVsxDlBYvz87tpr6PxNe6nciohYHp+Fv3+SRi5cUauEJL2iYcvLZjp4ma8UlBPKQ8cPjWY8iz4qxwqKO6l1AmqM5Rzd5i1/u/bBKQO8mQRBCQ7058efOXhitDtiFZ1a9979lEiZ3qcFPd783ydwSLoI2P2LMbxH7Ic/duYVhvlXgHS38/E+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(11063799006)(38350700014)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ykzgUxlFDvaJZrjVKvi1mxcWpBTQOtMFFXSLenYYKYnK5yTx8yWn+jLssENf?=
 =?us-ascii?Q?m0gqHFViWi22jWEFbp9tBEeDK43KjpKfqhKbACdP2+Wh972TwgxvAdNmERMs?=
 =?us-ascii?Q?cqHFTNLkAdF67QPeZ9NyTQ0oz+09H7LFcWiMKPEi+gc4V5oqwUYNez6eqq+5?=
 =?us-ascii?Q?LuRIHByI5Dj3RmX6YBLWOMVlggSrVpUjrAMyXDQkAuv0OI+BliM9bIrawiUM?=
 =?us-ascii?Q?sbNYUTxRxtREnNbTB/EAcKSaQY5obWXVVrLkfTYSy7yBC2tNmQrzMbx0CL2Y?=
 =?us-ascii?Q?rNCXsDqWGjn5cUMPAqgN5+xoJqlQvlyOJcJ9Yz5H7i4RXm6OtuOtM4Sf6ahg?=
 =?us-ascii?Q?/B32fs/GY2ow0DbXdk+g1UQUpuVhnBwNMMfGfJzaPPPfb90WQRxnKaDPVkXe?=
 =?us-ascii?Q?mbtzDLaQb61h3mnZ62hAkp3xqMZl0SOwxlF/B0R01oikLtQj1xDDSX0I93Si?=
 =?us-ascii?Q?2r3X4H1nRBCl5sdZkkigpI8owhNkcONzKyd0UFCpuhHkgFxLr979HWA9q8SM?=
 =?us-ascii?Q?pA2QUJ44ALFqaPa0Se0vfKZbfYwNoJROqyBgJ56yXy5bzYSxYX2Lh5loMQMR?=
 =?us-ascii?Q?KFAu7Gr8+8HUNP1KiJQuhHH7/DMmqJYZDbwGVrurvGK3jY0/j59w739VqgI4?=
 =?us-ascii?Q?eOSlzomWg+fADx4jtMiX7Jz7DQxD3M6qghOignwHLbakoZm3tBwZJPeF9+0F?=
 =?us-ascii?Q?HA3S3fnFH9Is6Y5vdMBXHqgxZWcbf27am8+z3YRd1D78oj/mJRzmmF+clT2s?=
 =?us-ascii?Q?OqgwqmhdgMLkecajFvr4qSsCm+yQm+PDc3HHJMUbo/LSaEiBUeiNBScZfr+w?=
 =?us-ascii?Q?EQELhBlCbmd5aNypR7epzg5RnorXjnP06aznLMIUQHBYxsVt/Wcthi64V4rC?=
 =?us-ascii?Q?bm+ux2iGMpxBHsT1vAlzm1xeA7U2jMx0EfAf7j8r9gPU7FbenAxa7N6N7J5s?=
 =?us-ascii?Q?u5Qvq8FVjka75FWD+5SNiB1xl8SCGsth/h7OJVdHW5I/MbNKsfoW++gScymR?=
 =?us-ascii?Q?yIIgoL07DtRLBftEbRngc1TkiND/ZWiUMdSqbhK/svohOVvKrUIGDmNc6NyY?=
 =?us-ascii?Q?6ulwU/LZ1ZTyntEHohOgSqY6s0YbSlUiCpdCv7hqExhngAdVUaW5ME2+DQdq?=
 =?us-ascii?Q?1XeDP6fzjn4iy20bSjBEBo+sIgKJcHtfZ8sPc2hUIq/6sPEs2UoKzkg9GmUY?=
 =?us-ascii?Q?oj2Wm59E7Ro0FckEvWvrR/gMnk7rk9AVIa5LlgF9R1fuZXFddOTM0ekctKy5?=
 =?us-ascii?Q?0A133vnkD7B8twssqZWykbPRwfdZ1Fjnjn8yYIuqfCOi//BmErpoGbrC2j7d?=
 =?us-ascii?Q?HQYFfoaxkEzxeHF4NEniSrRk25I5ETe1TTcPdBCPuAgFH7XP3B56pey/P/+y?=
 =?us-ascii?Q?z99HRDmCkOfdP4iCBdro5yv7vj5SBTQaxClp6lMZ9a3AM6vWOING8RmJ4Z4X?=
 =?us-ascii?Q?FBpJspl/3nms+WFevaiNK4wD935soa36UI3LXbMIVY6ZlgCWp4TydaSO9LyD?=
 =?us-ascii?Q?f9ExiFqrKzcz+1FHW33qiHPSgGpUHbrxod+4bV5lSv0ReVrPFZoyef2Uvem0?=
 =?us-ascii?Q?p1+bp7wpPHVgjMjRyZ/Mc6C5C9skOeot1cOZJ+laOsYXLbRvyEgbg+qKWjqN?=
 =?us-ascii?Q?Y4BuQtlZ4kZ+EkkvDHhMcjAK5SBq5/HkeWQS+z1psrDlvxm05GiV9lmnNKD2?=
 =?us-ascii?Q?lKNUKKZs/FbJdPtuhzCE9PPa9WtMuunxMwb3IWopSDucT09R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e82655b-e471-4780-063d-08debcecac88
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 19:09:42.7500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6niROkxSHn0myvyC/NaQJUiRSWOL1qxQFTvl/dItlDzZ1tM2cxng0WCtBoCZyiamxt8IC4hqvpDsff2njvFJ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007

On Thu, May 28, 2026 at 08:16:44PM +0200, Thorsten Leemhuis wrote:
> [+Alexander +Francesco]
>
> On 5/28/26 18:47, Frank Li wrote:
> > On Thu, May 28, 2026 at 12:55:34PM +0200, Thorsten Leemhuis wrote:
> >> On 5/7/26 17:46, Frank Li wrote:
> >>>
> >>> On Mon, 27 Apr 2026 09:01:48 +0800, Peng Fan (OSS) wrote:
> >>>> The i.MX8M soc device is registered via platform_device_register_simple(),
> >>>> so it is not associated with a Device Tree node and the imx8m_soc_driver
> >>>> has no of_match_table.
> >>>>
> >>>> As a result, device_get_match_data() always returns NULL when probing
> >>>> the soc device.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/1] soc: imx8m: Fix match data lookup for soc device
> >>>       commit: 2c6821657ce3b3c85f92719ea81ec9f9ff27df11
> >>
> >> Just wondering: are you planning to sent this towards mainline this
> >> cycle? The regression this fixes was introduced this cycle, so I guess
> >> it's something that should be merged before -rc6, as that's when Linus
> >> wants all known regression ideally fixed. But from the name of the
> >> branch it sounds more like this is scheduled to be merged in the next
> >> merge window (but I might easily mistaken there -- if I am: sorry!)
> >
> > Thanks reminders. I intent to send for 7.1. But second look, not sure any
> > big impact although it is regression.
> >
> > commmit message have not show what impact.
>
> Yup, there ideally should have been Link: tags to the problem reports,
> as explained by our docs. At least if that patch fixes the problems
> linked to below (looks like it, but I'm not totally sure):
>
> > I checked code, look like only
> > missed some soc informaiton. Let me know if I am wrong.
>
> Alexander reported problems here:
> https://lore.kernel.org/lkml/6593091.DvuYhMxLoT@steina-w/
> That mentions a warning and problems with soc_id and serial_number
>
> Francesco jumped in a little later:
> https://lore.kernel.org/lkml/20260427064704.GA17710@francesco-nb/
> This mentions "CAAM is not working"

Thank you point it. I just sent fixes pull-request to soc maintainer.

Frank

>
> Not sure what the impact is, but from the outside it looks a bit like
> "better fix this now to ensure those problems never enter a proper release"
>
> Ciao, Thorsten
