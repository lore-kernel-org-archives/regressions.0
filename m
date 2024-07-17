Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11020081.outbound.protection.outlook.com [40.93.198.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEBB1CF90
	for <regressions@lists.linux.dev>; Wed, 17 Jul 2024 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721246614; cv=fail; b=EOjs169oX31t9824G6FyGQWIpZ5qHNPoB9iCzJZVhj6x0OVC12MTIL7RE55gKwSGE489GfRZueTgTXCyZJvKhjGV64JzPm9+J2Rd2lnKYG2GfpToSEBpuezspZ/pREV7afJVrXN/il3unxkyfTJAD0v/ru89jX9DlVljE3GFc0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721246614; c=relaxed/simple;
	bh=zbz32zn31BX9WYb/xJnFvsx1nEskMFAJega7aThhKKo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tJFqExNL6M9wuqUwu5m6VyxFsgiG86qGG5bsiX8qScem/eSJh9XAuK9gUbotBK/jhA1RUNGpN4cWCzuoDQj56VtAPl6vHOlDfRkzJpCzSJYn4Wg8a94o8RuL2VXes3bC485sTViyqlhiUkODySf2698NWobCM+7wHcDWqhubZ94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=talpey.com; spf=pass smtp.mailfrom=talpey.com; arc=fail smtp.client-ip=40.93.198.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=talpey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=talpey.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/P3KV5UyF7400q0XXePokUkp1qlyPkrEElGIar65Clr0NHBBS6K0aew7oJvWmHYlvmaQzMxHNbGb4cy6tiQS7xP8fvDzxk5uLcq14/XlKUQ8W7u8c1l8kml9XpM1imTN9pJuFRJGFmgYgH+jMEYrqafORZY6PHYvmNOJHeLewkhcRxUTsSnAclDG0a5132iazjJ1yAtIH2IZdHBZez0v2RW/+OQQLV4jwYbah3uUuAzyVq4/FgHp5lfsH/oEuxjorOVqWjxDpJAiPj+xpJQDzfoHvqD5HVg1DUc2SbSafLaDVkSCW22XEbMJlhy8HV/NHW+ZHcijPWes4dbz1Tivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z/xz0L0d5pRscXlQq7tsd0pEeb0oaE6s7dPYF/73yI=;
 b=dRaFBvzjG0IzUoHJFJPFwGsWpOL2GlPpwrh5cuMeR3M3hPf1hWV9vIFACdZwoh8s8VdrpjFYZiNXg7je/hvQINnnfY09UDRTnYKimu3KVzVW4atG0oB8Z4/yFoTVvu7ZZWNCAQvf631VnXVedpFhU2iQDagmmtpU52y/3Wm5CvpeN2xhIkfxsCKLbksqtPIg+BfK84+H9Nqvb6eko3OpBh1KAj7BcMZKVr+lKMrLvqTrb8UzrZMVjrQLQqxRhcFPsB++Q3CKc3G+LktUjVGatRDev4BiUQQzT/Bzxiu/vuYDRa9mUOGABgz4AQiH0glbLLezMvEKEERMRx1PNJBsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from CH0PR01MB7170.prod.exchangelabs.com (2603:10b6:610:f8::12) by
 CYYPR01MB8264.prod.exchangelabs.com (2603:10b6:930:c2::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Wed, 17 Jul 2024 20:03:29 +0000
Received: from CH0PR01MB7170.prod.exchangelabs.com
 ([fe80::97c:561d:465f:8511]) by CH0PR01MB7170.prod.exchangelabs.com
 ([fe80::97c:561d:465f:8511%7]) with mapi id 15.20.7784.015; Wed, 17 Jul 2024
 20:03:29 +0000
Message-ID: <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
Date: Wed, 17 Jul 2024 16:03:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
To: Paulo Alcantara <pc@manguebit.com>,
 =?UTF-8?Q?Steinbei=C3=9Fer=2C_Sebastian?= <Sebastian.Steinbeisser@lrz.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Steve French <smfrench@gmail.com>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
Content-Language: en-US
From: Tom Talpey <tom@talpey.com>
In-Reply-To: <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0399.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::14) To CH0PR01MB7170.prod.exchangelabs.com
 (2603:10b6:610:f8::12)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7170:EE_|CYYPR01MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a0a38a-e2da-45ff-1bff-08dca69b8697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmYrNDdDMi8xT1Ztb1FVaVlWY2t0b3VOMFd4cFZPRUhoYlp3RVV1ckZLT3lJ?=
 =?utf-8?B?N1k0NTQ1RHdTejZpdkJZOCtKcnhHUzZ1RGFmNTJYUEszaWYwOGx1SHBJTWZi?=
 =?utf-8?B?ZTNRenZNQXErU3VpVVpxSEtKLy9ReU4zZU43MHVYMEg3MXlTRDNYYW40S1h2?=
 =?utf-8?B?UWhDQ3NiS0UvbURPeGJDd0haUDZLZ1Z2L2hkTGppdmtYZmdGelZzUkNMcjBs?=
 =?utf-8?B?OHBIcXd5SW9BNXdMQlgvaHBXVzJDcHZyb2M1Q1M3bWIxWFMwQ3JFamcrbkhU?=
 =?utf-8?B?aDBhSTRSWG5lRy9zdEhBek5ETWJ6SHo5b1ZYSE4rVGNZbjNKSUtlUUU0ODc1?=
 =?utf-8?B?UTkzU2xUT3hoYWp4eEMzM3ByZmIrOUZlT2hHVzZKZDFPQ1ZSLzFxZ21KNnRL?=
 =?utf-8?B?bzh2NGRtQklnRk1GZVQ2YnRtMWRFT1ZGaWhSZ01FR1lyWlFBT25WaGFONHF4?=
 =?utf-8?B?NXI2eElWNkl0SHFWcFNUMTYrZWNHcXd6RXRwNnZhalM0SGh5ZFpWTHhmbGhy?=
 =?utf-8?B?dGY3ZTFYVmpLQ0RPS241VmtpaUh4d3AzZFY3ekhjYjFKaHNiYzRlR1IvVWU0?=
 =?utf-8?B?VHErR25jSjhNdTRobG0ycnRVdFhKSFFoRi9acGs4NHdONWx3WEYxand1dlRz?=
 =?utf-8?B?UnF4UkVEQkMrQnFlUWNZdnRrMVpuN29uWm5wVytFS1QwUWNxbnFvbE51aTBk?=
 =?utf-8?B?eEpqRmFBdHc3UHJBcmlvbjVRL0RrdXV2RTRjQzhLM2w1dVhVODRud1BzR0RC?=
 =?utf-8?B?ZGlCV3dNcEFyNkRSd2FzT0ZGQ2Z2bEM2bXBmVVloRWVFTkhWRFlvbGVlSlU5?=
 =?utf-8?B?S1JaYityV2tpSDlWOVQzZ2tpZHFzVHdEWHVsajEzNUZBMWtGU2I2cDNpcklX?=
 =?utf-8?B?MitIQm1vWnNkME1KZkx2a0NxZmdQaUIwUS9WMHRzWWY1bStLMHo5V0xPdVR0?=
 =?utf-8?B?eGdRT0RqaHFaa2NHV3YrNzlISTc5Z2dkTER1Nml1WGRPNlArM21UY2lrQkRs?=
 =?utf-8?B?MEduOWRpL0lOMncxSEFDM0ZrdzIvR21kbkdRYlJhbTdSVzl0UVV3ams2dlNi?=
 =?utf-8?B?YUJWcU93b25UUk5EMCtUa3FET2RiWGN1TmlwQnZ0T1Z4ZmZFemVDS2x0Qnpv?=
 =?utf-8?B?bVVFL0FrU1BpeVhEaGJDRFNGVjBmd1dqZjhsVUhYWGtneGZVK05VcDFRM29E?=
 =?utf-8?B?KytTdXd6MzNydGJBNHpsejcwdE15b2FFQ1pHd0pKRm1PbkU1VWpNcEhFbTNE?=
 =?utf-8?B?MjBwb3RUbE5oM1NURkM3WmFCd3YzcmtlckZ3Q2NvbmZoR2thUkJjVkxscWY2?=
 =?utf-8?B?MXRDWllaRDRkNWhFbGxMVUJ5ZTdIR2FTeE1QWk5HakduajIrYVYvK3F3VUVx?=
 =?utf-8?B?Q0c0c3h4NUM0ME5BTjBLdUkzSWJCaXROWWpUeVprdVdBdW1tMzNnai92Q0hL?=
 =?utf-8?B?Sk5nMXlXNVBKaDAyazVIVlI1REZrY2dqaERUL25pRGtuL2xsZG14c0duUGVi?=
 =?utf-8?B?ZHVRTkh6TlVTV3RZOUt4SDN1b0RQeWNkeUxYQ09kL2NPY3dBRWlWVzcwRU5n?=
 =?utf-8?B?Q0t4UGQ2ZjIvUFhDYkdXbFdFcDVnOVE0clM3MElGNHNnNW56K1g5elhzYlJ1?=
 =?utf-8?B?S3ArMURyMVVBODdHNml0VEhzei9nMC9QUW4wSllqZ3F4QnFHajErU1lwSWo3?=
 =?utf-8?B?T3Njc29KeWU4emMzL1hib2JUZmVyN002RVRHd2ZyU2l1Rms3ZmY4bGkyUzFJ?=
 =?utf-8?Q?GFju8WnREiT/J+/Fho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB7170.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGNBU2ZxRmhLTnp4MHZ3ZS9iQ1YxT05ucllwRU1kR251MWpqWVAyUWM3OFlH?=
 =?utf-8?B?em5TRW1LMkJwLzBkakRrQlROYnp6Mkt0azlEM0wwbGkrclhicEhzVHV5OG9R?=
 =?utf-8?B?dW5ZNTBKcjJoQUZwckZiL1QvZmpUVm9IbDJ2bmw2dGowMTFyV2F0YmpONmZw?=
 =?utf-8?B?K3laU3ViYVhlRWxxRnkxNSt6ZjNpOXRXYytiMDFGMkxFTklSUkplUFN1QTVx?=
 =?utf-8?B?NGpRZjYwMlpvWThwY2dRQ3phTnJLdEoyT0pGU0hHMG1VRmd4cllMM2grR2c5?=
 =?utf-8?B?Tzk5OUplcGFNTGR0Q1owRmRBNDErN3lWakdqeGNpTmlXL1JCcHhBeEl4ZUJZ?=
 =?utf-8?B?dW9HM1lKVVRxWDhvaUp4dnEvdVZ5UlZSTnhCZFhRRVkxTUxhUmp0K0VkUVJF?=
 =?utf-8?B?ZytLdk9qT2x1N05nNzA0VUcwZW16cjFHNVBSbnF0MG44cXNNbzh6eFgxVVJG?=
 =?utf-8?B?V0plVFBJSWs3alpQK1p5dUN4ZlV5UmFRNEV5bnNYTllVUzlncjBSWEZZOXlG?=
 =?utf-8?B?SitGMG9walc0MU8vN0RadEF4MXVSYWpVUUkyck4zUVJjcWtONjMwKzNBNkZU?=
 =?utf-8?B?THpFdnBCaEczalJVMERwWDYrbk9uZm5jZCthQzhPdE9XNlhiamxxc1ZkYnRQ?=
 =?utf-8?B?QUlZcUh3M04wOXdDYzRVeVBLRmhCWmsrYlcza05lQjlYdWtQU01XcVJLbjBL?=
 =?utf-8?B?bjBnUlFXUmtLdjVYY0dpdTdpVFhlYlNaWGZyMzZTN1dwcE55RkljWUg2S0Zi?=
 =?utf-8?B?SzQ0Z2xqSlkzU0JtSlpYUHdDQjY0ZTRkUU5xSmFaTHBiSmtTRkdCL3BnanNv?=
 =?utf-8?B?Rmo1RDg0MWNmUWVISTNoK3hlaCtPV05WMHJpbjF5ZjV3RlpmQjFJTUtHeHVw?=
 =?utf-8?B?RHdkdlpkVEV1YTBGaG5XeWhzYk4ydmNmaEpWYVZ3QUVlc2Z4cWRtZWhuS2dI?=
 =?utf-8?B?TDA2OUx4MnZOZm5QaW85b29jVGpHbUZOOGNXMDBHTVV3TjcvZ1BkTm01ZnRJ?=
 =?utf-8?B?QVlVdWZQRDhRMnVndEZsQ0oreW10WkM5dTNhUzJpa2w1dnYxR0NZVE9tZU5O?=
 =?utf-8?B?Zno4bzJrQk1NeWJtaVZEc2NBNUZtSUlkalBLYmtseXc5RVc0c0xENkxhaG94?=
 =?utf-8?B?UzFoQlQyZ21YbnBoSnBmMzg1ekZYQnBYbi9sTnk5eDZCZktyb2tCL1VuWElH?=
 =?utf-8?B?ZHdrNWN3aEFqTlpaSGw4d0JnYkNtY1A4S3Z6Tnh1WFp1VUNWM3NZbWliN251?=
 =?utf-8?B?eDZMbGs0cloranlQWmh0QXQ5L1pHMWNYZStURjBld25EdU9maXMyRVBiQmEv?=
 =?utf-8?B?VXRYcDZsc0lVTXArcDFUOVJ6NncydjYrYllQYTVsT09kTngrMmJMR3JqSnph?=
 =?utf-8?B?Umd5YnByV240TmZkQ0NLN0lUdXhUVGdtUFNSWVBySEt6Mi9xWVZvMjdWMmZC?=
 =?utf-8?B?UWU1MjRxU1VaVkpMdnJQZ2NYNzZQWjZrQmt1aXo0a1djbWdJbmdadkpvdHBl?=
 =?utf-8?B?elY0Tmx0NjRYL3RpengxRElwUjNLVDBySFlSTXBrVEdGK3U4YnVBbjRISVhP?=
 =?utf-8?B?VVFVSlg5cTJMUGhndDIzczRNb21MYStreXBUUXpYeUJiOHoxeTRGVFVPYVVP?=
 =?utf-8?B?Mk40c05lUDRhY3FJZnVpQVhYZi9HblFCTDB0K3MwQytEU09CdzJvYVVOcUZn?=
 =?utf-8?B?K0ppYXNLbTVnY3NrZjZyUFJwNTBrclNNWm5HUXR4d0RiYU5MUTNtSG03ZHRF?=
 =?utf-8?B?UGhpV2pTVmV3ZVFIMGhKSUdXMEV6bEFRS2dHVkNwWFBZZVZQWjZEVnVvTmRB?=
 =?utf-8?B?WVplRG5KZzFqT1hENk5yUGxTSVlIVEZEYjNQZHU2OTkzejhzV3A4TU04RHpL?=
 =?utf-8?B?aFFrRWJuazJOVU1sWWF1Ri9lZDdiM3JDeUZjZjAvYkc1UlpFR3hCdXFJcHZ5?=
 =?utf-8?B?UXY2eSs1NXBnbnFjeGJIMHlQcVJVWGxMUmRkNFBGZFlTTHVrbGh0bG5jdzIr?=
 =?utf-8?B?MHNWbFRCQVJUTEpYUW53L3dJLzZLWFJ3cHpiaUZhek04ZDdUN1lDUGpwS2JV?=
 =?utf-8?B?dnArU0VUTmZwT1MxUWFBN3JqeTQ3MEd0Sjc4R3NXR1FjVjFLR2RVQmNxQTVz?=
 =?utf-8?Q?W7FA=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a0a38a-e2da-45ff-1bff-08dca69b8697
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7170.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 20:03:29.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7S96jxldWAwl0Fkk50AccEEQGA7NBrnAaqvDtDDMr0uIL1VANRKeBiCSZvoWkhUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR01MB8264

Thanks for cc'ing me, I don't think I saw the original message.

On 7/17/2024 2:24 PM, Paulo Alcantara wrote:
> Hi Sebastian,
> 
> Sorry for the delay as I've been quite busy with other stuff lately.
> [Cc Steve, Tom]
> 
> Steinbeißer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:
> 
>> we have set up a share without signing & encryption and I reran the
>> commands.
>>
>> Find the output attached.
> 
> Thanks!
> 
> By looking at the trace_fail.pcap file, the problem seems related to
> NetApp server not allowing the client to query the reparse point data
> buffer from volume0{2,3} files by failing the SMB2_IOCTL
> FSCTL_GET_REPARSE_POINT requests with STATUS_INVALID_DEVICE_REQUEST:
> 
> ...
> SMB2 546 Create Request File: volume02;GetInfo Request FILE_INFO/SMB2_FILE_ALL_INFO;Ioctl Request FSCTL_GET_REPARSE_POINT;Close Request
> SMB2 678 Create Response File: volume02;GetInfo Response;Ioctl Response,Error: STATUS_INVALID_DEVICE_REQUEST;Close Response
> ...
> SMB2 546 Create Request File: volume03;GetInfo Request FILE_INFO/SMB2_FILE_ALL_INFO;Ioctl Request FSCTL_GET_REPARSE_POINT;Close Request
> SMB2 678 Create Response File: volume03;GetInfo Response;Ioctl Response, Error: STATUS_INVALID_DEVICE_REQUEST;Close Response
> 
> The client knows that volume0{2,3} files both contain reparse points by
> parsing the SMB2_CREATE responses in packets #545 and #551 (as specified
> in MS-SMB2 2.2.14), so in order to figure out what kind of reparse
> points they have, the client then sends SMB2_IOCTL
> FSCTL_GET_REPARSE_POINT requests which the server fails with
> STATUS_INVALID_DEVICE_REQUEST.

I don't have the original trace, so I can't see packets #545 and #551.

On the face of it, failing the FSCTL_GET_REPARSE_POINT with this error
would be quite unexpected. MS-FSA says:

-- Support for this operation is optional. If the object store does not
-- implement this functionality, the operation MUST be failed with
-- STATUS_INVALID_DEVICE_REQUEST

So it appears the server reported the file as a reparse point, but does
not support FSCTL_GET_REPARSE_POINT. On the other hand, it did not
return STATUS_REPARSE to the SMB2_CREATE? Seems like an incomplete
implementation.

> The old behavior was simply accessing those volumes as regular
> directories which became problematic due to users reporting duplicated
> inode numbers when accessing them from within SMB shares, which could
> potentially lead to data corruptions.  Newer kernels set those files as
> automounts with 'noserverino' set to avoid inode number collisions.

I guess the older clients saw the directory bit, ignored the reparse,
and just sent the next op as if it were simply a directory. The server
in turn fixed up the reparse and followed it, operating on the target
directory. Duplicate inode numbers seems like the tip of that iceberg.
The new behavior is much more correct from an SMB2 protocol standpoint.
Clients are supposed to know they've been reparsed/redirected.

> Please find attached a similar network trace when accessing a directory
> with same reparse point (IO_REPARSE_TAG_MOUNT_POINT) against Windows
> Server 2022.

Yes, this confirms the behavior (packet #43), and indicates the Windows
client is doing the same thing, and probably never succeeded. It would
surprise me a lot if NetApp never heard this.

> What does NetApp say about failing those FSCTL_GET_REPARSE_POINT IOCTL
> requests?

I'd love to hear their response too. It's technically optional, but
doesn't make much sense.

Tom.

> Do you think that any of these server-side options [1] would help?
> 
>          [-is-use-junctions-as-reparse-points-enabled {true|false}]
>          [-widelink-as-reparse-point-versions <CIFS Dialects>,…​]
> 
> Tom & Steve, any thoughts on this?  Are we missing something in the
> client to handle such case?
> 
> [1] https://docs.netapp.com/us-en/ontap-cli-98/vserver-cifs-options-modify.html
> 
