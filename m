Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012023.outbound.protection.outlook.com [52.103.10.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDB37755C
	for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739239; cv=fail; b=gb6BNJ3GMRQfSaxXeBSMC5CSwjtZ7cyEyr0iOizs0ar8aCGrYk472Vi0vNq/yj7PjqhU1NHAk32sZejmykPRPsnL2IqmhFn5tq54FBebUF9wp3YDYJIfuOaA5ubko7AjtYVhO+hj3g5DBYPTy3y+JBcclDciu+NCuhHwEIae8jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739239; c=relaxed/simple;
	bh=wLB3j9hmPvvMssBjh2BbE77y9cwXU2/CIvb2n7/zpHU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PCRHnzC4jAvTBH405kDGJ0h/Gwz20Ivl7WB6hKto2rjV+qvvtVjWZ1+q7PxQLnIjist2k2VJMAalu7vI7XHGIyAD9P6jbc0Btc6BU7VEAdtnHYRH3/BsUdPOQGr3cH4G1TSq6yuX/ARYXpc5cjA1x4UpwLKQABpmec+KqAhegvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=CPRn3BVh; arc=fail smtp.client-ip=52.103.10.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="CPRn3BVh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCYvXq87cHgXe/z6m6Y6iFVGHMWQycsER5doppuZBUT3+c0hU+J/Ae++2+fWu5WIqECJxN0UmN2B2ewClCBMPviwwVF3gZKai5HzSNnKSFXWjJ4Y5g1a/NIj7SyyMXRUjMdeYO2YlxIfjuy/qbwXt5NGOHP+q6pV1SnAXUmsHRfnp19k8ObrcJTnTY1D5XK7L8j8acdcEnD+Zmohxv1Sc1+DDmCcB8koqPkNTVKLbnPJftoJD7XmfL+fn6TYNf67q9yqu6Qz6tO5kheLltgRTnBNwmbOnM1fRDHuo1w5vrg+cta5p6ZNTltN3ZjyezJfsfQJP8Uc1iEcDonIncb6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzgWvXMHJQUBgyY/Mns6T7ejGoV81AoIQpE5EfvfwoU=;
 b=vbN/ZuID03zbQJVqoMgduwOm0VnKPRx70a6qvg8yKEdT/wtGWUuAiS6DnKpAqbd1W49kw8EYEmaqoeT8qh8gNHt7oyg3JYtIghA/4kLLfzALOLQvoSy7pAGGvkfdorbKaXgATZi20DSfwintuogj0yOMSdmQ4WC/YRXEm/Z3z8JJW119eW2B9stzMF8m6paTPCCKo9JgrCinEq1+kWaPnN6jvu4Z5kaBIPM4N+nLtAgqWe6fbND1MJPA/Lv20acyxvSxtqeK1wzd34hPOTOQLGKnS/rrveQBnQfr7iu66wWwyUVVA3mnQGhOXHYQXAVl5H1g8o88N8tKrGuG4/tadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzgWvXMHJQUBgyY/Mns6T7ejGoV81AoIQpE5EfvfwoU=;
 b=CPRn3BVhwVaaygh9uUU+pbjVXIcTEQTInz279fvRcVmY7zcLKJSVPo6bNIbnrgyaY7y2DNkSK6XTiZrT33ujQgTyiR5As+oeJr/rnaQaqLbUwprBts7VgbeAkgwkGKtzJH008ZhYm3vGI5wOmkcNpB73c1GX87APLsXPLCMylcqiu1TzMjBGYd153h4qLtKEHmp9S3MovXLCuadsriveFkEAf4FGdHUKKhqPVW+TlF9p5Mj/s7l38J9dGeueW68ECxA5T/xA9LKYcdZVl2Pv4Y3JE1BTY8Dq63I2Zcob4j8tl/ZnaKJn+6h+wNAdWtSxTdtwqQvJBrY11vQvNyXqPw==
Received: from DM6PR02MB5433.namprd02.prod.outlook.com (2603:10b6:5:79::32) by
 LV6PR02MB12148.namprd02.prod.outlook.com (2603:10b6:408:425::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 03:33:54 +0000
Received: from DM6PR02MB5433.namprd02.prod.outlook.com
 ([fe80::8766:b6fe:2e51:d829]) by DM6PR02MB5433.namprd02.prod.outlook.com
 ([fe80::8766:b6fe:2e51:d829%3]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 03:33:54 +0000
Message-ID:
 <DM6PR02MB5433A42E81FEFAC400DD1905EA8B2@DM6PR02MB5433.namprd02.prod.outlook.com>
Date: Tue, 29 Sep 2026 23:33:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 6.14 -> 7.0] ALSA snd-ctxfi: no PCM playback on
 Creative X-Fi Titanium HD (EMU20k2 / SB1270)
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev, me@harin.net,
 linux-sound@vger.kernel.org
References: <DM6PR02MB5433F3C2A156335B6ED47756EA8E2@DM6PR02MB5433.namprd02.prod.outlook.com>
 <87eced5zi5.wl-tiwai@suse.de>
Content-Language: fr
From: Dany Patoine <dany_patoine@hotmail.com>
In-Reply-To: <87eced5zi5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0106.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::18) To DM6PR02MB5433.namprd02.prod.outlook.com
 (2603:10b6:5:79::32)
X-Microsoft-Original-Message-ID:
 <81124dfc-b4ba-4e38-a4bb-4134b87a23ab@hotmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR02MB5433:EE_|LV6PR02MB12148:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef7754b-d944-4fd9-132b-08df1ea3a61d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|23021999003|15080799012|12121999013|37011999003|25010399006|4140399003|6090799003|5072599009|8060799015|19110799012|52005399003|40105399003|12091999003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1F5V0hjTDZNUEorb0d3Q09xaGphRVhlT3Y4WU9YdzhqMVpBL2oySzRkYWJL?=
 =?utf-8?B?akI0QlRnbFlpNFNacnhrTU5haTZPRVQrU2FjRHVWUGtYRG5jWHRSQ0lWVUhh?=
 =?utf-8?B?YmZqYzdlMG1pR0J6OFZmMmhXZVNiTmFVRmoxVTJ2Sk1jaE1PeDh3Q1BBVkNl?=
 =?utf-8?B?TUhUVStVeU90WGs5ZHZ3TWxMM0hDcHJtZlZWd05LMzBSOHgvSXdYRWJWWi9H?=
 =?utf-8?B?cFhkSXBPYVc0ZW5LU1RMbFJkQVFlZVRhZDNRM3IvSXJhVitEcHdVTjdrSzMr?=
 =?utf-8?B?MFRkSkl5NWlneUFoTXg5NEdRdy9KY1RhbWRYSUoySU5TQXVyaFJiSGRMQm1U?=
 =?utf-8?B?cTEyK2pCaWxJU3h5bWgxSWRnNlZjTlF6M1N2Vk1Nc0ptSHhXNnR6OFEzTVFI?=
 =?utf-8?B?YzhCZ2ttWlJ0MkVOam5KWlZHTXg0R3dqWm9WQmdsUlNKci9nblJEY3dGWVlj?=
 =?utf-8?B?Q0NGWGJGYkNucnl3eWZ2VmtnaDByWkdZMDY3eW9ITzVoZVRMOHE4dHZnVnpq?=
 =?utf-8?B?QmRKT0laVlRmdDlmd0ZVajIzYktjZElFNWQrQTh4VW53akVXYUVVVnVQbnk5?=
 =?utf-8?B?WWZiYTZPOG15U1IxNlFXVWk0VFd4N2ZBbkdySEdMTUkyOWhNTVYrVm54Nkwx?=
 =?utf-8?B?ODFEOFpWVGI5NGNOK3ZaN0NwalA2cGUxd1NNeGQ1NmZ2NWFiRWcyd0hzWVJN?=
 =?utf-8?B?Z0lUREt4Vmw3ZmJFUXJ6bXNqdTNZczJPL3Q2YndURjZBTnNZdjFYNVd0ckI1?=
 =?utf-8?B?SHdWL2JMR2NRQkQrUXk0NFY3ckNvOWU0VUtlMUxJYzdDcDM3OURRMGNlR1NG?=
 =?utf-8?B?NDMwL3lYazNwTXFvNjNMN3pjNFNSOGFTUk5xYk84OXROekxRd3JLZzdpWmJl?=
 =?utf-8?B?M0tLRk4rNnNjU3Y1aE5BcW1wZXdCS29ib2ZBZWllM3FUd2RJWmpnbUsrb3U4?=
 =?utf-8?B?UHZveTkzUU5sa0hrdFo4ZmYyQlFESWQva2RoMlhkS0dtcklNWFpLMG9WNFRx?=
 =?utf-8?B?a1IzTHZwYzNTZjFoeU9FakhsRXhuMlhWOHVvM3dEZEJ4a2JkR1J3YUNQNnhC?=
 =?utf-8?B?NFY2NzY5OGEvRFl2eHNleU9YcDFEMUwvNVJsS3cxTjYxanplMy8yRzd1ZXM4?=
 =?utf-8?B?Y01VTXUxZGVvY3N1VTNXTTYwSklKUjZRNXhQYmZZVTNZd1U5UUlNWDNRcXBk?=
 =?utf-8?B?NnoxTTNUdW5ZZHBhTzFNSU5ianJ3aUd0cVhjdVM5cnozaXk4eDkvYS9KbHFn?=
 =?utf-8?B?UkF2QWtRdjdVc2V6SDJRNXhINlIrRmNJK294Nlg1eFV2YjF3TlJoZXFYa2dG?=
 =?utf-8?B?K1htRnpOOGxqRXFWUmxKK2U4QWp1OTZLSG0waVZNRk1zOGJVVmxlMzBRb2cx?=
 =?utf-8?B?b29lMkxEUy9IaytmVkZya2dINlpGejZLNEdST1F3VzRTZEpzcytaZHYzbncx?=
 =?utf-8?Q?rgokm+L4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHVYR0R2MzdCQjVUb05tSXcyemJwZlFqQUloM1h1dG52QlBOcmNncEpKbU5S?=
 =?utf-8?B?UXdEY3RHcjZzR3QvZitvQ01KVW16dnNYM1ZHck9WdThhOTZ3eGRWYktDUlRK?=
 =?utf-8?B?aTEwVHpDbmRzU3FjRTZSWXlUWGd5NEdQK0ZGU0lFS3U5OFJNdkdxM09Cd2t1?=
 =?utf-8?B?ZHA3TlpOdWZpZTJQdE9WRHRROHJtSStOODhreGh1SWk0Q2ZJYk5pQ3JIem5h?=
 =?utf-8?B?UzFtbDZtYmp0ckZWNFNJelc2M0pLcmVncWlYUmk1WktCTzVrUnN1bnBZdEdt?=
 =?utf-8?B?ZkpoOXBpYkZIZG9yVW9FUVlmRVI1Q01ULzVheERTYmdGVlE1bFV3ZVFLL0di?=
 =?utf-8?B?d0UzSFJsdHAxVkw1U29jY3RjeTdWcWZlQUNNYWhwNFZEbk5weWdqY0tYVWRF?=
 =?utf-8?B?WUJVdXVHSXJlSUhNM0R0WnJpeTIrZGYxbjdYb1A3VDhrREdxZ2pxSll2M1pU?=
 =?utf-8?B?bVIrQ0NIc0N0bEQ5QzIxRTNhQ2Q5Z0hzTTIvdFBEZ2VYUFRRU0VPUExiRTRG?=
 =?utf-8?B?M1FyS0RGNW9VRldOamdVcjZVbnBpYUp2QUpJM3hyZHVJM1psVVhReWl1OUpU?=
 =?utf-8?B?V01BczczREE4bU52ckovZUxYN3Q4Z2NxeVlVOHBpWVF1clkyeHVxNEh0bDQr?=
 =?utf-8?B?UVUvV0F2VFZjRWlWRW1wWXpoTmtzNmw2allHWXlLcVNVMXlZcENkemxuMHo5?=
 =?utf-8?B?dTZJVUk0T2lXL3JjMTJCVUxQY0NBVXBuK2s5RHVHVjd0b1pLZHJNUFp1OGlh?=
 =?utf-8?B?KzYzTFUvNXhwYnE2V3NWY05yN2NaUzNHS1A1cGQzZ1ozdVA5MzFLVlFsMUhn?=
 =?utf-8?B?NE5NbVhVVSs5L29IMEtxWTBORFhzY2N6cUVGRWNRK0dRN2VseFl0bEZPTFgw?=
 =?utf-8?B?bE1UQkNhTWZqSWJnTkRVM09GWlUzUUU3T0FnaTdBTW5KMVBtRmhaZEZlWk9y?=
 =?utf-8?B?NllGdEMxRTVMQUxLZlNnczRoRGowQTNUS0gxUExSbFQ1aEU3cDFSbnZzQklL?=
 =?utf-8?B?cG5wV0tIUDdkUVJ0K2NKQTRwa01UMGpSRE9PREZEaXVWMXVRNWpSWktZeWhP?=
 =?utf-8?B?bEJWVDg3c3NSUFhWTkI2Q00xcnFabEtPZ1VYbmViWlhtSmhKaXIrb1lxQnFV?=
 =?utf-8?B?VU5pbG1uUTI5Y3psRCtVUzgzck5kZERLZUM2MmhFeUhiWGFJemZvcm9nSnM3?=
 =?utf-8?B?NTRwTkJDaHp3M1VDUmpxQVoyZ2wvSnppYU5IN1F2eUdsOXUvR2Fac1NxeTZC?=
 =?utf-8?B?eEZEVHh1eVdRS2FWbzlma3dKSmtndDA1SVhxOUo3aUdYR0ZQcHMxNVcxY0kv?=
 =?utf-8?B?eUVGbnpJQmZmYXA3WldmVE1WeDBkeXNtRDZhTEdaaERLenIvVWFGZDJvUFpj?=
 =?utf-8?B?VUpwNmlQQnRBYTRQeGZJQjNHQzNsVEEzNmlEYUpRYVhxbGJVOTlVbEZpL2xo?=
 =?utf-8?B?Y1R5KzZ3T3IwMlFXTXZtakh6ZytkMXIrWlplRHJ1UC8zK05oRWZmaVJDUzhv?=
 =?utf-8?B?YjJkNUM3N3RtNkw3OUhLeHVobk13dmNlSlNLakJKQXVwN0pHQk5hOW15VmRJ?=
 =?utf-8?B?Z1c3UEhDbkdDOWtUd3FjcFA5dklGd1NjcHJqUk1EeGlQT0ZhdlJtbkRXeVR6?=
 =?utf-8?B?NTFHS2lvaUcxV2cxTlprUVQrTUNrWER1UmNWSFB0UFVicGVCZTAzU3lDYVh2?=
 =?utf-8?B?amRWRHFyMlZKREl2RW1tYnZubjdmSm44QXBhUGJGRVRkMTRLMHNwcS80Z1VZ?=
 =?utf-8?B?Y3AvcnF2UnRLamFyU3hXS2RDUXFwVGRUZGhFbmNaSHA3U25HVHlCVWE4N0R4?=
 =?utf-8?B?VVMvQ3p5THhQU3IwNVFicDZ4SmRvMW1WRWh6UlQ5aTBkYXoxcFROcjh4dlh1?=
 =?utf-8?Q?kwFyjI0EUl7wC?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-cd312.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef7754b-d944-4fd9-132b-08df1ea3a61d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5433.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 03:33:54.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV6PR02MB12148

On Mon, 28 Sep 2026, Takashi Iwai wrote:
> Could you verify the latest 7.3-rc5 kernel to see whether the
> regression is still present at first?  If the bug is still there,
> please go bisection.

The bisection is done. The first bad commit is:

  4b490e0d103c ("ALSA: ctxfi: Add ADC helper functions for GPIO")

and a one-line fix on top of v7.3-rc5 restores the sound on my
Titanium HD (SB1270). Details below.

Bisection
---------
As announced, I bisected over the commits touching sound/pci/ctxfi.
All kernels were built from the mainline tree with the same config
method, and use_system_timer=1:

  git bisect start 'v7.3-rc5' 'v6.14' '--' 'sound/pci/ctxfi'
  git bisect skip 86f17f37a1fb4121229a76e6b9888072aadc334a
  git bisect bad 75dc1980cf48826287e43dc7a49e310c6691f97e
  git bisect bad 9bb003a1f98b11b80238d522778115ad07355149
  git bisect good 5ebd054272718334c543998a6d0b77a9846c16d9
  git bisect bad 4b490e0d103cbd353bb136d67a6cdb0e94558a85
  # first bad commit: [4b490e0d103c] ALSA: ctxfi: Add ADC helper
  #                   functions for GPIO

Vanilla v6.14 built the same way works, so the good end of the range
is not an Ubuntu-specific effect.

The skip: on 86f17f37a1fb the card does not probe at all (UBSAN
array-index-out-of-bounds in cthw20k2.c:955, daio_mgr_enb_dai(),
index 4294967274, then a crash in set_field()), so the playback
problem could not be evaluated there. I assume this was fixed later
by 277c6960d4dd or b045ab3dff97, but I have not verified it.

5ebd05427271 is the direct parent of 4b490e0d103c in the full tree,
so the good/bad pair differs only by that commit. (Their configs
differed by two netfilter options, CONFIG_NETFILTER_XTABLES and
CONFIG_NETFILTER_XTABLES_COMPAT, because of localmodconfig; I don't
think it matters.)

Root cause
----------
In hw_adc_init(), the GPIO_DATA read that preceded the Titanium HD
setup was moved into hw_adc_stop(), but the SB1270 block still uses
the local variable:

	/*  Set ADC reset bit as output */
	data = hw_read_20kx(hw, GPIO_CTRL);
	...
	hw_adc_stop(hw);

	if (hw->model == CTSB1270) {
		/* Set up the PCM4220 ADC on Titanium HD */
		data &= ~0x0C;
		...
		hw_write_20kx(hw, GPIO_DATA, data);
	}

So "data" still holds the GPIO_CTRL value (0x9E5F on SB1270, set in
hw_card_init()), and that value is written to GPIO_DATA. This sets
bits 11-12, which hw_output_switch_put() uses to mute the line and
headphone outputs, and also overwrites the DAC speed mode bits 9-10
set by hw_dac_init(). hw_output_switch_put() is the only place that
clears the mute bits, and it returns early when the position does not
change, so the outputs stay muted: playback runs without any error,
but is silent.

Consistent with this, on the bad kernels (9bb003a1f98b and
4b490e0d103c), switching "Analog Output" from Speakers to Headphones
and back to Speakers makes the sound come back, clean.

Fix
---
Re-read GPIO_DATA in the SB1270 block, as the code did before:

diff --git a/sound/pci/ctxfi/cthw20k2.c b/sound/pci/ctxfi/cthw20k2.c
index 36066ffe8784..9716e16ebbab 100644
--- a/sound/pci/ctxfi/cthw20k2.c
+++ b/sound/pci/ctxfi/cthw20k2.c
@@ -1895,6 +1895,7 @@ static int hw_adc_init(struct hw *hw, const struct adc_conf *info)
 
 	if (hw->model == CTSB1270) {
 		/* Set up the PCM4220 ADC on Titanium HD */
+		data = hw_read_20kx(hw, GPIO_DATA);
 		data &= ~0x0C;
 		if (1 == info->msr)
 			data |= 0x00; /* Single Speed Mode 32-50kHz */

Tested on top of v7.3-rc5, with exactly the same config as the silent
v7.3-rc5 build: the sound works right after boot (desktop login sound
and speaker-test), without touching the "Analog Output" control. The
file builds without warnings with W=1.

Not tested:
  - capture (line-in / mic): the fix is in the ADC init path, but I
    only tested playback;
  - sample rates other than 48 kHz;
  - since 4b490e0d103c, hw_adc_stop() waits 10 ms before the SB1270
    mode bits are written instead of after, so with the fix they are
    written right before hw_adc_start(). I don't know whether the
    PCM4220 cares about that timing; I leave that to you.

Correction to my previous mail: the short pop at desktop session start
also seems to happen with working kernels, so it is probably
unrelated.

About the tools used
--------------------
I am a user, not a kernel developer. I did this bisection with the
help of an AI assistant (Claude Opus 5.5, in Claude Code), which
automated the kernel builds and installs over SSH; I did the
listening tests on the hardware. The root cause was found by the
assistant reading the code of the suspect commits: it predicted the
remaining bisection results before they were tested, and suggested
the "Analog Output" check. The assistant also wrote the one-line fix
and helped me draft this mail. If you use the fix as is, please add:

  Assisted-by: Claude:claude-opus-5-5

Feel free to add:

  Reported-by: Dany Patoine <dany_patoine@hotmail.com>
  Tested-by: Dany Patoine <dany_patoine@hotmail.com>

I'm happy to test any patch, or to resend this as a formal patch if
you prefer. I can also send the full dmesg and alsa-info output of
the good and bad kernels.

Thanks,
Dany
