Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2093.outbound.protection.outlook.com [40.107.101.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D51313C832
	for <regressions@lists.linux.dev>; Thu,  1 Aug 2024 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722538963; cv=fail; b=Z5YASmEtA/F9XXMNzDuAhetATigzXFXk1EaafE0P7JH1XzU8OLKhuvsWdBoOdurf4dw+UwuBKP2JEQap7Mc41OUfzwAlxk7jlbnb8PT/XATHMB8td7020RrFxb6CYJe7+puJqbTTjiN6wcpQpQkQ5WA4Rsgw8JrebuwCYv/IEwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722538963; c=relaxed/simple;
	bh=PCOUKZCyBLD2rS/kZ+/FvYxeSF0na3PNYYpoRsWb5cg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ug62txBDGw2ybDaWnRE8Vls3YL0ZwLpvtgsK3+9C5S4+7dFKAe00tsUNz65tbCuWqhMY9VVIfV/3wGsLVWfRfdfEIlPJ7zKOpNOagLAXlYWexm+6jwQoXULBbVEp94Xji8QO/RbP0AVeYR3G2xl4hF+lJdaRLVpQ5qxkAH5wlc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=talpey.com; spf=pass smtp.mailfrom=talpey.com; arc=fail smtp.client-ip=40.107.101.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=talpey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=talpey.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjvFd0tGnpns5rDtFZp+ybwBAVTz1EZ/L7DrpyqFAp525XSCsOW3YO6D4qhPKiYmmKGpugtVGwqkAQPbICslGmYUk89UFpVmfz5lrmc9H/wKe94SbtmWvAZOtKDIq0awCx/GcV3JKKE3XOlL7lOKQSDnzzjUi35V7rw4w3h3EWNrdF1yFiCYtakMESJTKEWe/GsLbQKBVlBGBqQD8v6XTXM8IHIyDOYyqX2G+qDhgfMWp7nT7tvR7ecQtOOmiUSvm5ndSlOuV3d2EiI2bMdOJj5TQePxUKn4YGSo6e2LmQ8t8SB0wsyGFNP5jRdmig8WOa6d+bR3Ypja7NfHxDweDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdKSDKg+466S2J3Y6Vfp1mdYerpVEdmFF9O5oavecoQ=;
 b=YLQSBlnQLrRcO7UpVuciF5hqVhorztMmMQ5ScH8/PzD3QJp3k52h3pGfJe5saq5ouLMt7KKKelCiIOqmQXqJRcsqFK63ljqm1AAG0FmChUx5z8wMmA1d/ro7c0iNfo+And90YAqPR/AljNMXBEwE69j3ZHI5aQB+HH5DOQXdqKb4QRlhs1qZkudpCGcngCa+gzrp8dbhRXWiZe6HrFJ0JrMMTJ6FoT15dQ6pwNIP3et83dfrLbKTr5nCWs1+ONqwuPqi5zrOFR/eGJfnrps1uHgABDJjHZ/xROou9EEQ+/k5Bmy5/TCRfv4hudqpd4s1PqiMn8t0NSwg7Cce2mP2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from CH0PR01MB7170.prod.exchangelabs.com (2603:10b6:610:f8::12) by
 CH3PR01MB8316.prod.exchangelabs.com (2603:10b6:610:171::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 19:02:36 +0000
Received: from CH0PR01MB7170.prod.exchangelabs.com
 ([fe80::97c:561d:465f:8511]) by CH0PR01MB7170.prod.exchangelabs.com
 ([fe80::97c:561d:465f:8511%7]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 19:02:36 +0000
Message-ID: <45ad2b9f-5a32-48f1-9855-1a822fc0b0ea@talpey.com>
Date: Thu, 1 Aug 2024 15:02:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
To: Paulo Alcantara <pc@manguebit.com>,
 =?UTF-8?Q?Steinbei=C3=9Fer=2C_Sebastian?= <Sebastian.Steinbeisser@lrz.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
 <8bf2462eb9aa4d30b866da57720a36c90c0a43df.camel@lrz.de>
 <d208a9307b32ccf4d3fd7b08c6b95445@manguebit.com>
 <aed542086314197bcec6a50c7d6ee76cb6e65f96.camel@lrz.de>
 <ac58f36e10af65cd672fba66e99faa2c@manguebit.com>
 <1359665240338585cfbc4eac58339ab1d0423788.camel@lrz.de>
 <ff47edb26e0cd9e591cfb3ece2407971202dfc09.camel@lrz.de>
 <ff56ae33c66856c0cf21b4049dc84bcb@manguebit.com>
 <7be5122d65dabd96a28a71678ca0efb93cbe749f.camel@lrz.de>
 <c095559def052b738f040ffb52400e75@manguebit.com>
Content-Language: en-US
From: Tom Talpey <tom@talpey.com>
In-Reply-To: <c095559def052b738f040ffb52400e75@manguebit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0034.namprd19.prod.outlook.com
 (2603:10b6:208:178::47) To CH0PR01MB7170.prod.exchangelabs.com
 (2603:10b6:610:f8::12)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7170:EE_|CH3PR01MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a7240e-add5-4e42-5c85-08dcb25c8175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3E5V2JQUWlvc3FlUURsQjZxSGlQOU9xSzdxWnRpNGlxSEpWb1R1aVVBRWFM?=
 =?utf-8?B?NVJsV2IzaG5NQUY0bUE5VFJBR21iTHZIR0xEUjluQm4zUnBSVE9uMVd2Szds?=
 =?utf-8?B?Vzg3ai9qbkJseUVtb2NQOVM4UFFHYXZNK3JCUmhMMS9qTXhKZG15ajh6d0ph?=
 =?utf-8?B?T3VoNW1ST3BSb3czTlc4cGtReTdrV2xsamlnOFFqbHRaS3BtOWVHNG9YR1Vr?=
 =?utf-8?B?VUZ6M0Vza3Z5SVpjc2pjMG1UQWNudTEyaTVLQ3FuMHpvTnNzaklGNGxFU1Jz?=
 =?utf-8?B?L2x5c1BYbzRQK1Fia3RqczBjOHFsTjZ3UndDNTNqcFdaTlQ1Q3hNNXEwU1lX?=
 =?utf-8?B?ckNHd3FrZjZwMDNoZ1NUcFBWdGo5Y3RLTWxWazJqbTJtcEVRbUlMYk1Db2VL?=
 =?utf-8?B?ZzhzZjRVVXhxbzduKytHa3dtbFFZU2lZS0c4UWlvcEtDUmxiQzQ0ai9hT2Q2?=
 =?utf-8?B?c0R4NTUrU0lOM2czRXBYQ2NSMDdpM2d6aVJxM2dWWkl3SmRjT25tY3RyS1c4?=
 =?utf-8?B?WHlqc2t0WjlaQUI5Yk0ydEFROG5kK0s1ZjlVTjhiank5eUpuUDQvY05TWk5l?=
 =?utf-8?B?NTA3S3dvRXNiWk5zZkZoOUxMWlByOW11WFZhUUVSOFBNbFBoa0VLcHlJSDM2?=
 =?utf-8?B?amVWVGRlTGx5bDlDRVpKSG4xd3EycDFqRkZtVE5SaEpxK1AzdXQwQ1hXT2t3?=
 =?utf-8?B?bjFMaDByakZ1VHZHOUwrMjl3WEJZWmlGWStGTU5aOUJEMDFWUndNb2hmeGt0?=
 =?utf-8?B?bUJia3U4aDFaZlhIaWZrbWpnQVRVNzF1dXQ0dkM1eVZkT1MxQlNrSGRtdDhY?=
 =?utf-8?B?dTV2MUUveCt0cnl0bkxsN2cwRm1XUkM5b1pmb1FmTHZ6Z2xjUm9VaWpuT1Bz?=
 =?utf-8?B?WEVYZ01YM2ltTjQ4bzZmWEdjTWc4MTJDZ3BDaUVjSFovUEdtaGcySWgvbFp3?=
 =?utf-8?B?bklGT3VCdVJUUk43dnZXa2piNnpTelRya0JxTXUza29YZmtoUVR5eGNudUcv?=
 =?utf-8?B?azJnYytqVEdOcklzL3g1bGxSUEFpcWh5ZkRlNTFpSUtRbDIzOHpjZ1dkbmt5?=
 =?utf-8?B?bW5PckpmV0RpandIRDNLSzB0YkRSQ1o4c29MRWwvOCtLVVRzUms4N3FiNTBJ?=
 =?utf-8?B?WU1IVW8wR2k2NUJZK293aWNpWjEybU55dU1odzN6dzNpVmYwcDFCNXJvZ2JP?=
 =?utf-8?B?RTVwWXlFbzBkVGt1YVpIcHlmKytaZUhMMy9ISzkyZm8rQzFnMTlzdE5CanVv?=
 =?utf-8?B?TjB1YXJqa0tVZmZQdXZCQkNiS1k1cFZ0TVYvYlFDUGsvU1FOY1Q5LzIwT0Ni?=
 =?utf-8?B?TnlEUUYzMjdZb2VzS0kwU3Z0bGN6QVN0bDM0OHYrNmhRNHJFNWxadzJjSUlq?=
 =?utf-8?B?VUVySFNSZFZ3WWpnYmNqNnhWWVBYa2FZVHM3K2FrZUdvK1JuQUZ6OVlMU1No?=
 =?utf-8?B?eWUrdUgrL2pYU1VQNERSa0VoN2xkVmNCRWR5Wi9EbzRiZHZWbHk4ejNDQ1V2?=
 =?utf-8?B?Sk1Pc2NuUlQxeUNRZ3MrRlBWQ3pYQ1o0UldtSlVFdnFiMjBJVHVzRTFacWJk?=
 =?utf-8?B?WkQxRy9wSkd1cGk1RlhxN3lWMENHZituY0RrSXhSbTdBeFlibURmUStlK0VF?=
 =?utf-8?B?bUltOWhqV2FkTDFXRGdJbHZ4NHlYWDFLSU9MbUcyVTBIWDVHN2JKSFpaSzYv?=
 =?utf-8?B?UVQycjdPNm1tRE9rbjBFMnRTQVlRYWhmV2w3VlQ4bkovZWp5N2pTWG5KRW1P?=
 =?utf-8?B?WEZSUTRGSm1OSmZmcVlMMytTM3I1SjRtd29oR3BWUXByUXlqMmlVR3VvRFpH?=
 =?utf-8?B?VmFtUkIreFFHK0RHKzA2dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7170.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGx5Yi9Dei9RNFh2bmFWOHFDbk5EWXRGWm1oNzAwQVlpVU01QkI3aklxclk4?=
 =?utf-8?B?alNiT0lXQ3NuR25PcVZjL3RWaWdEZ1QrRTA4N2pUYU5NSVVncDAydU5OaDEy?=
 =?utf-8?B?U0ZRYmtaaW9Mb1FQNlZhQTgwTWJqY3krei9JUW51SWFZUTlIT0x2NHM1ZVRR?=
 =?utf-8?B?UjczbTFwcEZDWWQ3V2kySmRqV25sNlZKNVZ5Uk1lRCthMXhlUVVMYVhoQTN0?=
 =?utf-8?B?R3ppZkxQRHBKTzZ4WkI5bUNNVCtzeGh0c3BscXlac2VjenNRSUlGTllCTlln?=
 =?utf-8?B?SUZzUDk3b2hBeGwydGV2OHdUK2xUaGNGaGlteDM0Zll5blZSWEk3OU96bG90?=
 =?utf-8?B?R3pDM1VPQ21TL000OGNxQ3BXTXVobWxYL09vM0FXU1JwancvRi9BUEt3d2lW?=
 =?utf-8?B?SUl4blJ3eDhQUVJ1OWFhVHIvM0xVQ2ZISnFBVmJVQkNySTZGSGhtaU5qcHk2?=
 =?utf-8?B?TzBuUDhlS2cxWTRGdUsvRnhpZmcwVDVWY21tYUJCR2J5OG9Jc2ROdkFDTXFU?=
 =?utf-8?B?ckJnbXJsNTdaMFJZUU00S1VhY2E2STBIR3dJZi9QeFpSdm1WM3FTaTd4VkxP?=
 =?utf-8?B?Q0dOeHFPZ08wYWZ4dDMxdU5HMFZUR3hRZHBXNkpRam1EUnJ5WjIzQWU1cWpH?=
 =?utf-8?B?aEZRcTV2cGt2R2dXT0U5NkU4a1h0dm9ZaGxmSDIxVGdtM3RJQzJLNVpMRXRF?=
 =?utf-8?B?SCsrYWhpK0xoeXBrcWlaUTBWay9jbktzc1VmVWpUeFY0TDBVTmt6YTAwalBq?=
 =?utf-8?B?V3Y2a2Y3djkzL3dYdEEyZ1Y3Nk1SMGdyNVV6TFBGd0N1MHpqT09Od1drUHJu?=
 =?utf-8?B?VUVoQUVudVlSL2o2U0p2TUlBeUZ2YmF1SkdqM2tyV3NSRGRlOUdHU1BlWkcz?=
 =?utf-8?B?MHA5RTRocEp5MUY0eTFyNS8vbFgzQ00yZzJ5QVRqVHdTREUxdXVVdXAxWFRQ?=
 =?utf-8?B?dUNPNXFlcXFiQ2UzS0hCbUtSUm1OYmg0ZmpjZzg0NjJRbTdNZE5hV3lSUU0w?=
 =?utf-8?B?ZXFpUXliN3J3alk1Qnc3SDlCUVZIU1dPVEdxRDNFZTBmNW81OGJwM0pzRHpw?=
 =?utf-8?B?RW50cDE1MHlVb21QblFJVTA5aEhnamhVVFQ1Q1YvMjNwYzJmM3FBemdhWWFh?=
 =?utf-8?B?aVI5am1pTnFGajY5U0I1TGppOFljdlB4TTkyTDZQVjhYV1BXNlNDQkNQb3JY?=
 =?utf-8?B?YnhjUlNPUXdyb3ZtTGp4OFV1Y3Z5NVJpZFVGc0dqbnlkREl6aWZrcHZvREJR?=
 =?utf-8?B?UHdneWlBWHgwTHdncW16T1duVk9qalJCWlhLYWJVUU1vSmM4SGc0RkMzbGVq?=
 =?utf-8?B?ZTRHTkxaTzBYTFBSdmFaVHBuT2VQelFwaWdlQndtN0VhRHVzRDRrdXdPbmNE?=
 =?utf-8?B?SlBTYUczV3R6N3VmdU52a0RkaDNYQUZ6aFBxV3BEekVHVVowVzIyR3FjYldl?=
 =?utf-8?B?a0VEUUlQNjBLNCtrRHRRa1RWWWQvaXRvMHNSa0NvTnFnZDg5UWZpWHlsNmtj?=
 =?utf-8?B?TkVqMXlDaWNyN1oxZ0FGeEh6YitNajh5UWRoK2ZwY3lLYzY4TlgyNnZhRGdm?=
 =?utf-8?B?YnltOGYvWW1PUUtUU1ZLNm9POFpSNmlwOE15TjN6M2xWL3lSYllzR1dySmNz?=
 =?utf-8?B?RHh3UkJDTkxqSEhOVWdhTXYxV3pWVVdObTZ4bkd0OEVEblBEOVNzTE1iYjZP?=
 =?utf-8?B?bWdMeUZYdmZpZTY5LzNzaDFHVU1iTGcwODBRdUVOQjFjSU1vMWJHNm5nWUp0?=
 =?utf-8?B?b2o2UDltZ0duRkR2LzdZODduTTZGMnFKZzdPTytQZnhLbzhWRWI5WHRJRFhq?=
 =?utf-8?B?YVJaYnd1RWcxVUF6RWlyd2pIZHlKeHZZdHhsS0tJWGhOZUpQcXM3QitmcXFP?=
 =?utf-8?B?Z1JhUjdUdEN6d3ZJVU5US3Q4NFJKbEUwbkVkR0NKL2lxenR4aFN4RloyTi9m?=
 =?utf-8?B?ZEJZaUtvNVRiRVBGRDlhNVh5V2s4OWJDdjRqeWdkY0svSnNXR1lnRjRkVUIv?=
 =?utf-8?B?TTZBV2lMT1U5MjFPTWRKa0ZJaGRUZjYrQmNrWVBZbWUzbktGTFZmYy9YczJr?=
 =?utf-8?B?NzB5cFpXRldIWEtjaElRdnp4YVdEUzBIUlh3V3ZweWNrUkJhb3NoS0VZa3h0?=
 =?utf-8?Q?c96Y=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a7240e-add5-4e42-5c85-08dcb25c8175
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7170.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 19:02:35.9721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBKsNZp0hcFuVy6YlaPjShTUTm04n1HpO9MvUxmWsXwTYW58sgjqWVbu8L0m0RBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8316

On 8/1/2024 12:25 PM, Paulo Alcantara wrote:
> Hi Sebastian,
> 
> Steinbeißer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:
> 
>> thank you! I've poked our NetApp rep. again hoping to get some
>> technical answers out of them finally ;)
> 
> No worries.  I've been there :-)
> 
>> With the additional patch applied I can access signed & encrypted
>> shares as well as the test share from which the logs are attached.
> 
> Thanks!  This just confirms that FSCTL_GET_REPARSE_POINT against NetApp
> indeed requires the FILE_READ_EA bit being set and it has never worked
> since then.
> 
> I'll send an additional fix shortly to make FSCTL_GET_REPARSE_POINT work
> against NetApp.  I've tested it against Windows Server 2022 and it works
> with FILE_READ_EA bit set as well.

... and

> diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
> index 062b86a4936f..e241a966997e 100644
> --- a/fs/smb/client/smb2inode.c
> +++ b/fs/smb/client/smb2inode.c
> @@ -1258,7 +1258,8 @@ int smb2_query_reparse_point(const unsigned int xid,
>  	cifs_dbg(FYI, "%s: path: %s\n", __func__, full_path);
>  
>  	cifs_get_readable_path(tcon, full_path, &cfile);
> -	oparms = CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_READ_ATTRIBUTES,
> +	oparms = CIFS_OPARMS(cifs_sb, tcon, full_path,
> +			     FILE_READ_EA | FILE_READ_ATTRIBUTES | SYNCHRONIZE,
>  			     FILE_OPEN, OPEN_REPARSE_POINT, ACL_NO_MODE);
>  	rc = smb2_compound_op(xid, tcon, cifs_sb,
>  			      full_path, &oparms, &in_iov,

I guess my basic comment is that because FILE_READ_EA is included in
plain-old GENERIC_READ, this is a safe and good approach.

But there's nothing in the protocol that justifies the NetApp response.
The MS-FSA document has no requirement that FILE_READ_EA be set on the
handle, and it specifies STATUS_INVALID_DEVICE_REQUEST only when reparse
points are unsupported, which is clearly not the case. So this feels
like a gratuitous workaround for another's bug.

That said,
Acked-by: Tom Talpey <tom@talpey.com>

and thanks Paulo.

Tom.
