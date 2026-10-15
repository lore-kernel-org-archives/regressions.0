Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF23E7BCA
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053515; cv=fail; b=cj4Cinasb9UY1cwYsF5NHzBPcMdYhS44vGdCwG6shO/oNCl+C9WrfVTVxIpXqUPc2u6/jrFmfkSomAwDkDYalOgAAOsbQtVTE9iYvfS3B9RbofQxQa+SglQJC3Qqzeb9FIq0HcabBoLcKsKW64bOXgrjaPi8Ll+kAs6Mr3wY0+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053515; c=relaxed/simple;
	bh=BUKRm2pD9/xkLiXpXXePgEvicgzkUeYsy8WOXm0v3E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O+9/imv97ToIHpBcQrSSg5WUkrhiItckCW9jJjIP7JE+axnUlP/muzIVySEFaHQwJmbBNQjI7fOGcYKpzhyDzmkbDMTwtQpjGv0T4PL39CaatejXVNwo0kLP6IpEVeB6d90AaRfJlczUmbtr7DdEG+kPvhL72dSYH2UmPz1UxVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B8ubllqM; arc=fail smtp.client-ip=52.101.83.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B8ubllqM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOUxeWJt1uv8yINDIktQk253ukZAEvuLy2fIEnxNkROqO0ACvxvt+TMcmpBi2PJ2Jwh/wzZzkLymH7L/X8Oe5PAIYNKmtAWTHyMm9QV+QNxqZwfgBuR93Bf8lIuHvH7arugf1Mgf0CQiyYh9z46lpwFTipTvc/17s4mrxi89fZbXZsJvZefWubBWQIhLr9ZZBPsXwQ257mx00o4tZvd0FItXRdyOM9lcTr+mh0ku5J9T8QjyVoXdy2R/gRdgcFFtlQTYnTAq4ZnV4gfyFrhNQND1WagE60AnDrowcfgOVgw7aC/yYKtKenj+yNq/NzG8HAaV9dzYj/fmtdaPsruU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaXjoPgtvewhBJB9kwdrzTCQBs/RlTkJFcLplIS8s8k=;
 b=AbF/nUyc5UFxThSskMWCM/p+iyXLR2vTuNk1MbvPYKJ6Lb7xq9k2gdyPYPPF1vLy73e/sW18PR31hYHxGC16fwpYzbhDqDNMCHaAQgL6iz4fzsPA067//4gs0M0+w2DaLuG76Jm6aS/f3hFwx9cjfI7qHW843IGn0cLRnhyqJaPJsyig/F2khdo3DtMnkLqgZkhxDzohKy7nT5n+BrJ8gmBHKuExNQlinNMGnOPaQ0SGwMKpzwmUcIFx7BbEfx2Zm693hVwpdvVj6vUpMVkVDUaxwfPkRME0oJS9wYtjMkhEHcIg80QJ/HBDxCFyp6yftg64hBQqCfZD8+iS5Iiw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaXjoPgtvewhBJB9kwdrzTCQBs/RlTkJFcLplIS8s8k=;
 b=B8ubllqMrofxQZtg/dLm9qBq3VwimgWx8wIVCjXBTTmfuUebPb1w0OmMD9Kh9jVSB1q0OmMoBWdUQm9SNE9+qFLFxhxdmfjy4V5dzy7uP35rU0xLg8BOQJg8cXpM4s8fI/jpFo6I/OsjGNrR1hp5g/pXRFyPUOj6XD2mOdjMtacEQPO39BCcpmkLITQjFXVkvErcRLIYWpHv57DPhQ/RxpO3+rc7pVtm4M7XpKGdZ4o+Z48lQ6J1h8ujuZ8TQQcdbyvkZhm+FLqaEEIb+97IUmqUPMj+rtqpY8TYlPkcCGVXfVWUHMHxB2uXrLmgFEfspqL3Spvcm7JW3MVPfaQ5Uw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by WA4PR04MB308399.eurprd04.prod.outlook.com (2603:10a6:1d0:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 08:38:31 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 08:38:31 +0000
Date: Thu, 15 Oct 2026 16:35:43 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Xu Yang <xu.yang_2@nxp.com>, Rudraksha Gupta <guptarud@gmail.com>, 
	Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] qcom/qcom-msm8960-samsung-expressatt: SSH over USB
 no longer works
Message-ID: <t5l5ekyofwaiqkggzo6y7iihcx43g6ixbsypbv424vr7xqfwmg@7t4sf72am724>
References: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
 <bd839c03-5cd7-48bf-91a7-c8dc51e5f6e5@gmail.com>
 <5261c571-ffff-4a32-87af-ceeef22b6e49@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5261c571-ffff-4a32-87af-ceeef22b6e49@leemhuis.info>
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|WA4PR04MB308399:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a92f81-3701-43af-0aaa-08df2a97b145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6T+sHmlPGnhK3Q15JAYcetN5TGol25b1ovC933FpZawBHtAZamZ83qsM85oZ9nQuEV2/6ZFrhsVveAkw34A/0dGRpfWkfdNE0o2uS1FEeBVZEHaDG1cX25fsP0LysKoDmAnfimdTvnuNrmGcaL5TIq2WO3VtosEpd6z3OYo4890c5MJArumlHnwVhMtX6e7KQ/qVWS7ElPxK1TbN5U7/mejGy9AS6/T9VKJuRf2SStkam294afOWdPf3dxSIcPV5oR06be18Vm4Z5Ng8jrA2sH1Jbv8bVNV5CknD+cnJbTViHjXTN/omC6UFdWcxa6Pp9R7E3H2dQ7/jZfkvw6lKY8+btdo/iOk2f94LAxSZOqzvSr2F1o4wn6VsEwuNpDg1w+ZuadEHz6r/P716NV8Y3jU5ogX/if3p5KExpXoP9FRyHhDYgTHccnvhVVJoxUHOjvcIJm2asTNAPkK9C8mJKPfqpgENekEG6VssKCSzQ65pFMpenaAU+Z5kMDdk/wlbE2btCY4MKpVjM+KBm1dXDVpLkCMFAUtZ+6VCsMruJTQ6nbCgF8OkVo7nkeFq+c1NmaGFjhMLPx+thINvgev2TFkDkyV+LEFrxpJF37BfPJAeMzktsHnWPtCiPpys/a9f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTY3L1RSekFXMlF2L1dZd0N6K2lGeTlLTDFnR1pzNGVkY2VqUDExcjIrWmVV?=
 =?utf-8?B?YWFSektaMlBZSGVkQnozZzh5aTlQTUU3dlNUTmVpbFlRRDI0a1VvWnljWThx?=
 =?utf-8?B?ZE1JdVlFV3I3RStjYUs3Zkp1c01kdVp2L00xeldpZ3lVdHMyb09wVm9GYXQ3?=
 =?utf-8?B?eUxHVE5FU0FJZm5TMUQxNEdHbmpNVnNZRVY4eG5yY2Z6WnhUbkVhR0ZmaDJr?=
 =?utf-8?B?WFZFTEhueXB1d1Y0UFhZZGpGS2s5bzMrN1NobkNSbnRja0xkbUhTQ0hER2pK?=
 =?utf-8?B?UWZpWFJ3c3M1SkZpSWF0NFFUSXJHUkVSTC81bU96enlIU0VDRSs2WGJmN1ZG?=
 =?utf-8?B?bHI3M05QQm9uR29sMU9xMjdmTjZrS2NXVkYwWHlkd1RuRTVkelo5ZkdsUkRR?=
 =?utf-8?B?QTc3Qlk1SXVWanpKamIraTNLbnVDNHV5ODB4c0pnbkpUUzZjdEVFMndJa004?=
 =?utf-8?B?V3gzSVVGUzgxRGJINGhjKzhpMXhhVE90OUgzRDFaZXRQMmhHYUw0TmN2VVNW?=
 =?utf-8?B?R1k3Tk5PZVdoL3djVGUwQS9tY2NNUjYrMi9zZVJoeEloc0lYOVBnUFJhYlAy?=
 =?utf-8?B?MXl1b3BkM3BteUZYd0tZcm5YcVdaN0kxdUtUcURPOTROd1Y0VDdySmgwMng2?=
 =?utf-8?B?amx5aFhZVHUwOGJ6V0lJSkVLRzMrZG03anlPTzA5WTkvdVVtOStjait0WXFK?=
 =?utf-8?B?dUMzcjVXSWxZckJCYjhOaWg4a1FETll2Uk5ZYkZQdytVQ3JoLzhkeFZBaHZj?=
 =?utf-8?B?L1dOelVzdjBVSjkva3BuMGRXbDNOU0treWV6TE52dE90NnFBNWN1b0pabE5a?=
 =?utf-8?B?Z3ZadCtRS01WVDJuS2tCMm14aFpRbVJMVEtzWmw5d2p1R29jLzB6YVNRVkhr?=
 =?utf-8?B?eG1UNjRpTW0wNWFFMDFJUXRlWUUrdVliSy9DYXg5eDlIRTVGSjZDVDcrSkhX?=
 =?utf-8?B?OE5CWmx4SGRNTjdQQk5tWmtSZjhlOStTY3FhSFlnY3hGM2k3RGdSMmgveXAw?=
 =?utf-8?B?VHpHVjM4aXpVcjU4VTBsdzRJSFM3Y1BtSHQvbjkyVm5ZeXI1d2Y4WGZTeklk?=
 =?utf-8?B?MzNZYjFXendsZzJORnFGT3JpcktLY0lMOC9YNzQzUnJ0bCt5VTFmeTZEcm5r?=
 =?utf-8?B?WFFnRTM0QXRMTXZPUERxaVFJR0haSFBPaXJqazh6SUVIejZrRzMzK2NJME9z?=
 =?utf-8?B?cStrZDZ3KzEydkR1OUw4NnRaUVVLYnZ5YUFTQlVKTCtlK21OekhBbHlaanFt?=
 =?utf-8?B?NjRvWU80Y2J4NzZEZU5MNUQ4WUY1ZDJOcjJCKy9DcmpwWXY2N25Rcm14bmpE?=
 =?utf-8?B?cUdRRTZTYnIvbGk1dTVTWENxYlB3ZUJWQjJEZ2VZK0VXdUdOOTVHcDh6eDFP?=
 =?utf-8?B?UVVoRFFLcnBoUmF5eUtHUmNocVBoOTRKOTFQZ1JJQWJZVUR3NDN0RHBHZFI0?=
 =?utf-8?B?cHUxa3cwTDV4K0FQQUVvWWxWbHBSdFVhVVI3SmhtaEcxSStFRWtnMHBOOVc2?=
 =?utf-8?B?UUdlUjR2V1ZjMllIakdpeTlTVHVYZDk2UVozUUFDbmdmYmQxS29XbER5L0xy?=
 =?utf-8?B?VFN5OEZyTVNaQzlqNDM1QUxPUWk4Z29XOEorVzdHM05CaStwdGRUY041cDhp?=
 =?utf-8?B?ejVUNzJzanpUSTkxNWdzZHNhd3QyV1BBVmJhRVFDWjhjZmkyNXpnV2dSSVJw?=
 =?utf-8?B?T3ZRQ0ZOUG1ZR1BzdHVwYUtMNWU4T2tTVys0MzJGNGFCUGczSUNSZVhjbXg5?=
 =?utf-8?B?SzM5cEhlRnpROW1ia3RHWksvODV4dEhkT1dMbE5JTGptaTJBQndKeFJqWnQ3?=
 =?utf-8?B?MkJycjFYZk5BUDZjUGc3VStONjM0QnYwdUUwMUVKYkV5Zmw5eXdocFJRVmtw?=
 =?utf-8?B?d2Zyc21WY3hJMFlPZjQzSWZTb2VPZ01YQ2tzKytMNDBVUWtZa1JLUGsxYmoy?=
 =?utf-8?B?OWk0b3I2blVVZERMRkQ4VTEyMS9MTXNuT1l0aEh4UXpwelZ6QTl0UkNyejdk?=
 =?utf-8?B?RUo2ZUE5OVZOeWtBa0VodUcwNEFRc3BUVjJySlF6ODdBNHZaYUViWVJBNDlk?=
 =?utf-8?B?Mmp5bHZ1azZtY0ZrME9yMWNOSzJ3TW5Xdjc3aGQ1WXovTlVoZm8xMW90ZEt6?=
 =?utf-8?B?NWtmdTBRd1VpREdBc0srZ21kaFFRVHRKWGdaSEdhVWQ0NDI1NWpuTTRVbVJT?=
 =?utf-8?B?b3M0dGhST25lSGRiVGdIYjIyUkw1SXQ4WVE1c3RiQUZ0RVpGTUpSbG5GQi9k?=
 =?utf-8?B?SERXRzZNSlJBQ3pTQXZxQk1yRkhLeDJVYlFIY1B3VHRPQURSOEwyeFBRRndG?=
 =?utf-8?B?dEd3NkNsaVNLRTJ5ZWpiMWZlMFAzbVhxUzFIWko0cFpTSTUra29yQ0hOQStX?=
 =?utf-8?Q?SOZG/fZrA6ks9lVNEaj7NuUmHu1NM/on0GxHJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a92f81-3701-43af-0aaa-08df2a97b145
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 08:38:31.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgZd1ewjPIdUV/H2vmzjuBMMk9azCRD9RcOfaW/hyYU4vSXwsh0fXpdCmH+kA7UinoARGqLyh8mZAqY3V0REgj2L6haC7xJA/efJRmESMLqCqPVVWGuccKrL8HW7xJkE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB308399

Hi Rudraksha and Thorsten,

Sorry for late reply. 
Thank you for reporting the issue! I just have time to debug the issue.

On Tue, Oct 13, 2026 at 12:58:13PM +0200, Thorsten Leemhuis wrote:
> On 10/1/26 04:39, Rudraksha Gupta wrote:
> > On 9/29/26 03:43, Rudraksha Gupta wrote:
> >
> >> I can no longer SSH in via USB. Reverting
> >> dd0c03d685225cb8fc60c477417d1b9c3b05ba9d fixes the issue.
> 
> FWIW, that is dd0c03d685225c ("usb: chipidea: udc: support dynamic
> gadget add/remove") [v7.2-rc1] from Xu Yang, committed by Greg.
> 
> >> Please see below on logs that I captured over UART (v7.3.0-rc5) and
> >> USB (v7.3.0-rc5 + revert).
> >>
> >> Distro is Nura (formerly postmarketOS). Using head of pmbootstrap/
> >> pmaports. Instructions for this device:
> >> https://wiki.nura.eco/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-
> >> expressatt)
> > 
> > I have identified the culprit:
> > 
> >> CONFIG_USB_OTG_FSM=y
> > 
> > If (v7.3.0-rc5 + revert), then regardless of CONFIG_USB_OTG_FSM, SSH
> > over USB works.
> > 
> > If (v7.3.0-rc5), then CONFIG_USB_OTG_FSM cannot be set to y. It must be
> > not set.
> Well, that is good to know, but shouldn't happen.
> 
> @Xu Yang: do you might have any idea what might be wrong here? Is this
> something we should revert to "regroup and rethink" the approach and
> reapply it later in improved form?

So my previous patch break otg fsm mode switch function.
I have reproduced the issue on my hand, and send a fix patch (cc you).

Please give a tag if it works for you.

Thanks，
Xu Yang
