Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022110.outbound.protection.outlook.com [40.107.193.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92543A783E
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776966445; cv=fail; b=FzXWNARy25z/KnRrN8zopWumNdzzJZepsRc4gUfPv0bN7MEf1btqUbGQESq5a54nOETFWHlWusg5/wMr/ApmvUdUevQ2iCuFLoSuATU4C5wOgqsn1iz6hKhuOvRWFaShamd9IQyEWFogwiUUawtFUoTcn6sAahWzGdMPx5eKivY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776966445; c=relaxed/simple;
	bh=kwqi/B90odmi4MmlwT5H9zrXJSB2f9XfdKF34sQ0wzA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dB3zbNUoNd7DTX42zbcoUYP3xHwei/wn4pNOrtb5nifmXFBL11tcu2rtuVgjp4ZiTIWOrCXSMQwS6vxI2uEFW9qKTJgP8gNG4ZJyjyjKiSg68ocXzsJpGF3p2NcTjewwavNcc2EumHtvDw4O9Dn8AtyKNhZ5ebj8yKM+9MOCX+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=Z0vibOU4; arc=fail smtp.client-ip=40.107.193.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="Z0vibOU4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkCf39ARcsGo8WkBFtn/wprqAXlJgjDwWVxsqSo976NgxgNB+QPhFY6kCA4xM6cGrWWNFvNSvRC6omgAyvpMDF7kNzPimEV+5j2Vim6NFpMKl1P69GmQfk1wq5A5KSsxj/yESQ0bUQ10bWgRn2sBjYZRM5g/5BQUlI+zLwMxoDQosGpoA9bTFZioVZaOAgKCyEARwWMGqG4n9vlBfz2mezUXlip1Hat9ksumR2/v1lWRmN/xsYbp1Fb5GsXwtd7xLtX5WmDHagaTv0qdbrTjjnGf2FWvPJ0S0uE+FOEkEDsWZCPz+4kaBnmj/as/6PPN1H4rclmIrXQomRPdTevDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSe47lgEl2M56wnTWLyZKSiWMXRMSHjHJ3fGsRqkyys=;
 b=vsQoEMy78/ogiVHenJFtz3ZhpfADRxWU3r6wW+bAesjJO31+jIAY+p/rQhP371IXfmnWDS2MFkpdKPC6UKDGTCvmbI6YA49rFQxuiqTsIFkkUefdwGsNf5VEacslnbYS8OirVCwCGyurTk3nPopcq054/UALNEb7P6t2IMJ49Vdmdh65p31fvueO3VLeTzS4iKv1Ts/ZWPosMnPRuUue4Gw0NenJuitDwYczmyDfQpsB0RTPCvk9GpZqZTQHk9AJ53Q4K5v32m0UFAQugRoaCUhUVjhLTK2gMk3J7pVPeO41Tsmih4cGOsCKMado1hBrIVHplTUTqZQy0u1nmFth/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSe47lgEl2M56wnTWLyZKSiWMXRMSHjHJ3fGsRqkyys=;
 b=Z0vibOU4OMiY4976lWNeIPnhxDAhzlH9SY7thH/4e5HiKrVJSWK63dhIE5rpK6TeVhji5UmENXv6ikVtmRLQaP4BJhttO2o00OpNg7A1lNCfyn8pvZJW+VYDtb5TmuprAMg5GyJOqisD3/7VE8GfJP+43q5mNbmHh33+nw7+FVcigCxDZ90ojERssZulx4c61cW+f06pDNriq6AQ7Ufp8TWruwv/u5P6zce1Nz+29Qpc7lsEJNl6QqNEzAJDbXDiin7grQ9VcpPDvlyJUH0/XoiMVIaZkNhLmiheekYBMzMAadzRNJrgpHmThMjY5EQZhMSsXNyXTLJ1gd1s352jHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB8225.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Thu, 23 Apr
 2026 17:47:17 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 17:47:17 +0000
Message-ID: <c259ea67-4f69-4e6b-b5d5-00e6626067b6@efficios.com>
Date: Thu, 23 Apr 2026 13:47:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Chris Kennelly <ckennelly@google.com>, Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::19) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc7e23d-7745-42d2-c086-08dea1605c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h8nD/i+4wlqUnOld0sIvuk610HQUmzLqH0Fyps6QDrWJ3X3tVfDV2m8GtAepsonJR4xIaJmcuU65HXTKzGB1iVy4Z20atrTgGafzA7sVHTHySvyKLlnl0toaY8hZZLV8iO4vLJqH++SpT5/UUNe+JhuvFFTdMlUlCkAUxzEhlii5rZ42xdpVJjLFdvotk99FdhgwH6SvOiC9gsbv44h4FJXTII4D9Z1QZRc1kz20PZMCX202MZXTlEMsDB875kjhafgkRfVFcsQDH/rhhtKLLOKwb5dEwo8JaLrgYJ4kvqOw8Nyxn315w9vL/XqDCgxQohO3avfveTwvUf929Pt7qv0gxiCbi1mPyXz0vyOy/iVvErJIJH4TpP6iMPLRwKuDtiNP29+hcrRB/ahuZOS0D1262Pe+lXs4f53ZE3lKFId1Jfg006yH+weNXtXlaq8atI/jTEujmiOf+RyuI4b+MBCNxrnwd3h4cnp9UlFejeD6MEUiOIDRt/fLnpGvSJ2Kf4s5+ElgvO0G15ry3FAdLyHXIoqr5uHIIjiFgzqeFG/n2bOY4OSkyIqikw8lFK0iT7EO8cfXn3aEuIl7xJlzMz0yNKuXfePzmMwOZlc60cRHWIQqoNzsKS/aBcH4ivDM5IXdnjBTags0Krieb/vPceHlRKquGWTgP0znUmvVtMv1oDFJgqB6TqaQWxvnOBgv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0FSSWo4bGVkWGlFZDA5M0V3bG1TOVBmeUM3UThaUnZoTHhVT2wreWVZT01I?=
 =?utf-8?B?SjR3Z3dZMCtmdWM3cVh5Y1l3SnpJcG5DaTRVcFBzVktsNUpiM0F4RnJaNFdx?=
 =?utf-8?B?RTBoMVAwdy9PUHZ5Wmg5SG9MR1lIU1VCMWtKRmV4K0VvYW1BUFhpaUowNVZN?=
 =?utf-8?B?MFRBYTl0Qk5aVlRtZ3k4bnpLbFhwVWRvcFIzWWw1bERJMGQ0OUsxZXBDMTVm?=
 =?utf-8?B?UXVBWjFUM2h1bCs3ejdnbENESEFlQ09OOW1RRFIxYnFFYU5xblRtVU13aVl4?=
 =?utf-8?B?RlV2ODBBMldCY2t0STFIaElDL2RkS1hRYm05RCttVGZTbEVVZTY3VXd0dTBi?=
 =?utf-8?B?R3dqQ0pCaVA0N0MyUXFWNUxBUCtQNVBmOFdlUVdKYnFyQjc4Y09yYjBKYnZz?=
 =?utf-8?B?bFBCeTA3OVI1dzhtY0V3a0VCMHVBb1VTTmF3d3o0Qi9FZjJ5Q3FlbGpJcHpS?=
 =?utf-8?B?SVJIY1hRekNVODJqQWlOZWMzbUZRSzNWdmNMUE4xOERZampwL0V4OUJPWW0x?=
 =?utf-8?B?NGUyVzlGSVF3RTlFRWEveHBnTkQzUVQ1YWhBSENmYWc4bGp1NXZESlFkUmFB?=
 =?utf-8?B?MUVBWlRwSHozTGE1NEZiS2dFeTFVL2ZhMFptL3UyUHJyWU8wc2w1a1RpUERK?=
 =?utf-8?B?dzBCOE9VYmNHakU2T0NSaEYwc05id3YrYlNwTTY3MXZQMDR2N0FDbU9GOXl1?=
 =?utf-8?B?dVJwWXRKanlDazJvRUVwVythZlMyODFCcDIxdGhBRnN5MDlUcE5Za2lKUkJ0?=
 =?utf-8?B?MjVrUmxWQ3NKaHB1ZGtUWnM4WEZrMGdCZ1BoNDhGL2JRMkcvdDZsbml4aGFp?=
 =?utf-8?B?VkpGZytGQXNQWnl3VXFaSVNCRHcxSTNEeHdYb2lVZHkrNlp5YkxXMlBOVytC?=
 =?utf-8?B?RmZETlFJamJzU2VTR3Rjdk5vcUJrOE9wbDNyYSthRCtwWHk1alRiQk5SZjVF?=
 =?utf-8?B?aXN5QXh3SlArSDkzRDZQTVZZQkdJbFdPZTIveTdRUkE4c2orNUtqdVNPdjhN?=
 =?utf-8?B?TjY2OGZCb2lZcjQzSHFBTjRVUHA4M0laSTlJVEs0R2N4SnFZdUJLajYzVlpj?=
 =?utf-8?B?VC9pT2pHM3VHaFZTZ2xnQUlIY0ZVaGRLeFZ5emI3dEFPVnFmWlFzZmYrc3RT?=
 =?utf-8?B?bEMxQjBaSmx0QVVITkFINDg0cmdGZ0NVSWhDdEp0bEE5US90UUtnNGRDdVFG?=
 =?utf-8?B?KzIzS0UyNVdOZ1RSTVNDVUpEa21MZnY0UVBNaVpGUVRaREVUZERVditsTWJV?=
 =?utf-8?B?Qk5zRGpYUXpZNXZBZmpaUkJSaWxVaG5QLzM5N0ZoaVlCeGR2eTRObExZeUwr?=
 =?utf-8?B?MEw4cHhzNUZzQitaUVZIc1BKVGF1ZFJYSGhLQ2tSRzBNQmRZWHgzejFpZmRo?=
 =?utf-8?B?Z2dYV0pwVlBjN04yTkhURHYwM3BRREtMcklDdTN2eEhhbXIvaDJlM3BvNEJn?=
 =?utf-8?B?Zjc3Y3ZiUkxvN2hzQkxJczdjazlYdEZGbzZoSllsV0ZEN3ZlNW9tdTU5RmpJ?=
 =?utf-8?B?T0NDWEU4SGQycHBySEtVMy96bDVPdGVhaHlCVURGbVpDUXZaZmhta1FJK1hY?=
 =?utf-8?B?Z3c1NmJEOXBoWFpwbkQrVlpFdkt2U1JtcXFhNlR1YXR4UXVncWE3RmhUZFVP?=
 =?utf-8?B?S09uTFgwZUloU29Yd0s0dTF6SzRpOHo2S3BINVBEd29sdjV5NU15SXJJWDBo?=
 =?utf-8?B?eGxHZUtBNmlJUWVYNjdlUmlrUC9FcXk5WnN3K2pqZmtHNjhNQUFlTjUvSTJP?=
 =?utf-8?B?eTFRUDBrR1A1RlVpSkdjTS8rU21RZ1UyYkNUSldjOVpKNmVHZTJBVVdZenJY?=
 =?utf-8?B?cHphRkR3Vm80N25ibSt2NlFmWDVzcXJ5TEs4cjVhbjFacDE2bnk0T1ZoUi9S?=
 =?utf-8?B?bERZNGdmUWpxYmIwakhrZ3BqMnRUQkg3eXRYb2FvSXJ5NXhTa3J3T2NFVVNk?=
 =?utf-8?B?MHROQ0ZxblN4Nm84OXhrcWNzaEx3RHlEVXZZK3NESWZhU002REpWNE55eUtB?=
 =?utf-8?B?ZlhvN3JTa1cwN1JwVHNXaVBMQzlYVUlQanVYeG1XY3NmdUIwbmZyNjdDTFFS?=
 =?utf-8?B?Yk02Q0k5RlFnV3FwV0ZBNFVsNHlsZGRSRXFscmtmb1dkc0VWSnAxK0pkQ3Zu?=
 =?utf-8?B?dDNUVnZSWSsrTURjcFhWMnJPdXNKcUFnd2tIeGx6V2FyRXgySkVSOWVmTFFO?=
 =?utf-8?B?M2xIREZsTnFDR254UTVhZU1rTTZhRitNNGxUdTlYZmNTRlZQa0lzVlhpOHlV?=
 =?utf-8?B?Z01sMG14aHo5aXdxNTFUeVg2WlNNTGFGQWN2U2pLQlYxWlJURXJYTmxSWnBE?=
 =?utf-8?B?RzEyNlVLOUJCa0dzNXBjYTFNU2E4UTJPajRoU2hLTEN0VUtCSEI0OW44b3RG?=
 =?utf-8?Q?YRpOpRDz4iMVzN/7qVtA6k/7ccVK5dRmiuq+h?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc7e23d-7745-42d2-c086-08dea1605c37
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 17:47:17.1627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6o3ABBdUMBo5jdD3uqZPT0sFYdKIJv9rxSLNOR8jXvg4WL9TNllNoZ7exKR1i3Lg4pDRaDZVkNp/ONOw7INGAGaSyKfx/IjmR3DCbI4ABc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8225

On 2026-04-23 13:38, Chris Kennelly wrote:
> On Thu, Apr 23, 2026 at 1:19 PM Thomas Gleixner <tglx@kernel.org> wrote:

[...]

>>
>>    3) The RO for userspace property has been enforced by RSEQ debugging
>>       mode since day one. If such a debug enabled kernel detects user
>>       space changing the field it kills the task/application.
> 
> The optimization in TCMalloc that you're describing has been available
> since September 2023:
> https://github.com/google/tcmalloc/commit/aaa4fbf6fcdce1b7f86fcadd659874645c75ddb9
> 
> I thought the RSEQ debug checks were added in December 2024:
> https://github.com/torvalds/linux/commit/7d5265ffcd8b41da5e09066360540d6e0716e9cd,
> but perhaps I misidentified the ones in question.

You are correct, I added the RSEQ field corruption validation under
debug config in Nov. 2024 when I noticed the world of pain we were
heading towards with incompatible tcmalloc vs glibc (and general) use
due to tcmalloc not respecting the ABI contract. RSEQ has been
upstreamed in 2018. So that's not exactly a day one enforcement.
The ABI contract was clear about this being an invalid use from
day one though.

[...]

>>    7) tcmalloc violates the ABI from day one and has since refused to
>>       address the problem despite being offered a kernel side rseq
>>       extension to solve it many years ago.
> 
> I know there was some discussion around a preemption notification
> scheme, rseq_sched_state; but I thought the discussion moved in favor
> of the timeslice extension interface that recently landed. Timeslice
> extension solves some use cases, but I'm not sure it addresses this
> one.

I have actively engaged with the tcmalloc developers to
understand their needs and figure out a proper solution for the
past ~3-4 years, without success.

I have done a POC branch extending rseq with a "reset a linked list of
userspace areas on preemption" back in 2024 which would have solved
tcmalloc's issues cleanly. I never posted it publicly because the
tcmalloc devs told me they could not justify spending time even trying
this out to their managers.

I still have that feature branch gathering dust somewhere.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
