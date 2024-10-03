Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30D47F5F
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727984509; cv=fail; b=P+1M3xhC8kaJ8TyR453UFvcWlS51oqIA7bQUye5i89ss1HGj/o8JAuFgwAfsi9ImEvaDX57hBzEDCNVj5NprvnVc7Qd41jQOdnQmT09Pq8cpcwdkQ1Z9B2bqSGDWMVbFodnHnDsDlPH1u8eiY0WOfSHVuiFVtDExf90Avsrzow8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727984509; c=relaxed/simple;
	bh=Spn/6yAzdDMwLINbFPKo3BXJKSB1r8vagTCFw+N5/wE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ner/HB+MMyWlUkm2Bn2hrvQ9yz2slkGp/fosx5zcFoMI+18F/gXlS3/KWwU8t22+4BqdCDC3NdM/nIqDPO5hH5zackM8SQlcqVUJWFnzlC/vgPACtKxM4OUU9UuB10ekgBcfithLSH0HyH5szE0kh+NRpgYSvGSkuYi7Omqq6ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ssF1Cjco; arc=fail smtp.client-ip=40.107.102.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ssF1Cjco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my7gS83hV1pzWKU1R7ZXpOoJTbussX3PsmhTtXtLCrQDs2qIOisthqx/SROLuTym/ZufjeFBGroswkyDJ56RJRr8GbCAaT93gT7CqMKOSXBYCmqZBxaEFy8qbxoHop+fGZEptpntJjjW0jEGcSOGhbjbNRlhcQDKgQ8YNKnuuuPkQYdS3LCYDwm2dQAQGZjZ8WSSYDm0LeLL+0iCkpGHesZFxuiFjWxqu6mAM/3WVIvcit+swdc0EKJjjEf+R1uQF4u6EhPEgxxQJnTlCkshsUIG0KZzgiBnVNxmEd0OQ39jU0k9bk4rZbM9JPiQ1npxErLYs93tk9HNWEPgg1N3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdEbjfZ4qZbbu06k0rGv5hn9u5WgdaR9aVR/8t2toe4=;
 b=e6Pwn2A1zgJ1nQf8iA0jL9sqXDwoqrvBqccg61pIQzKcqDODyUFbBZ6h5/lDhtS58wbBSrCnDg03gAav44Or1H+huo3T5Zw1HrMgdtfK+N4ii/IIxkMe29LjvFiRVZjRsV+FFfvO6aWUSYDPrzGMFiXJU+C9nq1JTDi1qAvo4aM0meQqsOEinCpRychPuXdhlKsUgv26aCs7qRm213hCkvG0h03OXMEiv/FGs5UWWc3qyx5/ARzV1Uh43XUdjBUCPDXj8zpphLHxL0Q79/e5dk7v2hZLed7BDgpKQHAPSR9zq8AKlTmIfA15eN9HNY3V+qXv7Thsa/WvXp9OyK3hCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdEbjfZ4qZbbu06k0rGv5hn9u5WgdaR9aVR/8t2toe4=;
 b=ssF1CjcoF0FFaiiULQ2Kqwz7abEwhtTBCj8RTeyptH88JiT0nqccyAzXQjmXqY2D7JCdXvT0tsVYH7ebfySd5KLqsRMH/Gqa15VRnOK8hq/TzipDH23ZXzkyL0spba/3As7NE6Sgt8IjTkH0Ftj7qXMjkaqiAgWKtex8mRCBvfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 19:41:44 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 19:41:44 +0000
Message-ID: <18a0c8ec-0200-4a89-8a7c-fa585801def8@amd.com>
Date: Thu, 3 Oct 2024 15:41:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 regressions@lists.linux.dev, Raju.Rangoju@amd.com, Sanath.S@amd.com,
 Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <afb91d66-55b2-466d-87c6-5de196b326d8@amd.com>
 <467722db-188f-4487-a837-01e65e194d3b@amd.com>
 <9edf23d2-d5f7-4646-bde0-4af1e01abfd2@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <9edf23d2-d5f7-4646-bde0-4af1e01abfd2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0157.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::26) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DS7PR12MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be285fa-8846-4dc1-e1a6-08dce3e3695a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGprakRHZ0FEZThYOHNQdjF3WHUwOFp1MktGOTJCNHJ5dGN1bE1QK2h2Z3o2?=
 =?utf-8?B?SVNscUFVUVhya0o1c3FFQlNPTjR6aFdudFFDejFOK3RFU3NEbXVQL3FqbVVx?=
 =?utf-8?B?SjdwZjNtS0ZPSXlMVXdXZytTZGoycDVTdmN6b1h5cE4vaGdOSVgzNXltZjE4?=
 =?utf-8?B?OEVzdlM4RGd5cHF6RWJrbTBYbFpWYm9URDR0YUpxNjFuREMzdU1OTVhEcXBB?=
 =?utf-8?B?L0NBS01zOUQ0MWdncFd1alFLMEhHV0lvL08wamVkTzd5K09PSDVlVjR4SGsx?=
 =?utf-8?B?eGRvNXA4NVJHUjlzSnQ4WTYwU2FwK1BZT1lhdjRVMkc3bFREWDgzdExjUGRo?=
 =?utf-8?B?Qmw5a2pXS2xBd21OTXB6VG1XUXEvNUVlT0YwbTRhS0VmN1RxQmM3WWEzR1hE?=
 =?utf-8?B?OS9WM250MEJEQWthSGNSejVXd3JKbFdPQnc0d0dQUmZMcU5ESHZWVlVXYWhx?=
 =?utf-8?B?TmgvZzJuWU1DaDFvMzB0bmd3R0RoRFVyYTI4VXFNMkczTi9yVHJuK3ZXdko2?=
 =?utf-8?B?Y1hYZS9tWUZ6UHZ3cTFhZ1V5MmkvVXM0NTNRcC8rVGJOV1ZvOTUvYkI3Wm5t?=
 =?utf-8?B?RE5oYTBka1BFUmM3WnRpUEJKRE9rOGE5c3VWSk5vV3BURE1HMVZDb1FjRzNa?=
 =?utf-8?B?L2tZRmZXWjRHTDUza2xqWkQydUpLcmxYQUJub2NTT1p6dThSczFSMTdaVG9u?=
 =?utf-8?B?NU5abGFPU0FvMlJzMjNURUhhdkt2R1dvNTQ2RDVoRnVTK0NLby8ycHFpMDg3?=
 =?utf-8?B?c3U1Z1BLRzlMT2FsazJ4MEN0dElLLzVuWGs3Mm9RRUl2MjlubmExbE14QlJY?=
 =?utf-8?B?anNqYjRoSFZHM251QzFaVXJ0S1lrVkFrdHY4bWJQdkJHekc3VjM3ZEtOZU42?=
 =?utf-8?B?Uk1jWWplaW8yeDJZSHhjbmZ3OEpjdXFWWi9Ob0Q2dTh3TCsxdHA3alNLQ3d6?=
 =?utf-8?B?a3FuNVBwWGJSR2UydFVwQ1lXckZVU2NXNWxQZHJkWUt2TGNaa2ZNUEpMdEFp?=
 =?utf-8?B?c0ZoTC9jZi9ieUt3dFlRV0tzaVk5eWhHRUswcm1meFRLcDVGTWl1cjJpcnlo?=
 =?utf-8?B?MzN1aUpTUndFTnRqT0lkeEFBMy83M0V2cVRvL0N3VE8vYStUYkw3RXRnSTZ6?=
 =?utf-8?B?Ty9ndmpMOTY3WlowaVY5aXlpdkVFVXVmNS81MFYrTTYwckdBMTBxN1QzSWFs?=
 =?utf-8?B?R0RoZEJBbExTNzdLaWdMUjJWU0Y1bjBwQm8vRmluM1IrQmNTclZ5R3Byc3E3?=
 =?utf-8?B?ZHFSQmt2RUd6cXJmNWhQcjNxZGJybVo5aVBlSldTTk9lOENXT2R5eDFuT09u?=
 =?utf-8?B?aWNCYSt5QlhGMm90b1owVVJPUFduY3RlaU9IMmtTWVFvendGa2hIOUNRSzRT?=
 =?utf-8?B?blVrckpZNFdueGtIZHBhU0N3b3Q5N1FYVVVHOUdBdGMwT2E2ZEdRb055eVZB?=
 =?utf-8?B?c2FDVktXbWltVDNpa1pPL0VPQmZMN1dreVQ2SVVsYXI4RmxEUjZDS3IxOVI4?=
 =?utf-8?B?T2t6cnBWZDdZZ2phai81TkFZU2RZYm5JTlFyYjVEZkpLQkhWS2RVenFlQU9N?=
 =?utf-8?B?UDY0WUNqNWVCQm9qOHpLeHVzcWs5SjZyaUEzYUVBNTdGVEVCQU16VmE3OWg1?=
 =?utf-8?Q?1l4s6lX4hQKiVfVas4tbyFiaDZ/LYnP8Y+STJdNepO5U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXQrZDAzTU0vQ1VDYWVhT0tEam9hT3YrVHkrYTdZUFR3YXZvdkxweWF1U3h1?=
 =?utf-8?B?S3V5SkJDN1VEcFl6U3grM09Qck0va3NWM1lQZmloRmdsYmhpUzdHR1dTTGM4?=
 =?utf-8?B?NlVqOWtqQm5xOU5aYTZXcXhYaVVITFJIemF1bWd2ZDh5L1k4Y3FQK2x2V050?=
 =?utf-8?B?dUF1aFE3aEdKSHc5UlFPUlA1amFwSEdmb01lNDJOSENjR3A0bXZsM3lrRWw4?=
 =?utf-8?B?cmV3YzRXK2Vhclc3SWZrdUJGcDZGeEFCb2Fia2F5SUw2N3lHSEsyaEw5UUhr?=
 =?utf-8?B?UWNna3M5dlA1QlJ0ZGorUThHWWt4Nm9FT3U4aDAwNmtlTkxBT25JQTRlanNx?=
 =?utf-8?B?YkJFdUl3QXptcThLcWFzOEtsSjdPQ1lkbEMvckJnYW9GcFZ1aGxFcjA4Nkwy?=
 =?utf-8?B?NTRkUUJlYTdoUDU5bXl5a3pBQWYxSVZOeWwrY2R3eXloNzh5bHpsMS92RnRx?=
 =?utf-8?B?L3dWWm9wcmF2cDF2c0trcXlZdTVrK29BZS9HSkRIc0hqdVFwY0c2eHlSWnBL?=
 =?utf-8?B?T1owYktqUW8yUmZxMURwSDRNZ2VhSGgvUFk2QXA4Um1pVXRVcmNtQW9ZN1dy?=
 =?utf-8?B?TTY3clBCTHRKVkluTVB4VUZFNzFLMDlLOE1zZS9yY3lUR0MvRkNCdW5WL3B5?=
 =?utf-8?B?YVRYY0I4Ym13aElCeU1VWks0RDl6bVlGZlQwb0FvL214RGZwZEZ5WGlVc0Zs?=
 =?utf-8?B?M1dVNGVhd3h4c0lnelV6THpqRzZLZ0E4bFhCb21WZ21iQzRoN2lHMmQ4K1ZG?=
 =?utf-8?B?TytjOSt3MVF3Yml2UW45WFd6SnZuRlpHb0RSKytjMkZKV2IwTXIwS0N6dnZn?=
 =?utf-8?B?Q0I1U0hldlBtZUozYjRYYjNqMnQ5V2tibE1aWWx5dHJ3bjJNc1ZReUJBL1JE?=
 =?utf-8?B?U0FCVUNtMFp4NjFRZWNIa1Y3QlpYMzBJa25QRnBTbE1MS3lFc2ZYb2JNdmpv?=
 =?utf-8?B?Wm93RkFYOE91M2ZiWUpoc0xybXRGLzJocTJoOHJxS21NaEwxQWNoYUs5UkFS?=
 =?utf-8?B?QzNrSVFRK00vemp4MjNDaDFhTjdpWjdsRE5vKzQ3WFd1cGJRdlR6U3BWdnRU?=
 =?utf-8?B?cHltOENvcTg4bDd1WWIwUy90OGF4eklYb0pNUzY5M0V2cTM5Q0cxT2czNlJ4?=
 =?utf-8?B?WEZwVHdqUC82Mmd6T3FyZnl6ZnFlTTBTcExKaEFGUGdwL2YyUlBqcmpWMnlx?=
 =?utf-8?B?R0FqZGNNZDVHazFDbWRtYmhDUUJORTZFUmxyUXh2b3ZRK29hMER5bmc4RmNF?=
 =?utf-8?B?ai9QTnlST3JMLzQzQ1B4TFF4RW82bFB4S0xxUGRTNSthNXdnNk43dGQyc05q?=
 =?utf-8?B?M0FFT1RCLzJONEtGbUpTWkNuWERkVFJiR3hFWVZJM0pSaDdqQk5sWkd5d20z?=
 =?utf-8?B?Tm5icFpjWjdWMThzenZ1bGg2NERMY3hUVWNvYUQ1MlFHTmtFSWRsSmRuZGN3?=
 =?utf-8?B?eFVRRG5FR3FEV3doRmtyRXJYVTVkcS9vS3RXU282MUNBYlRZL0hCcjc1KzZX?=
 =?utf-8?B?UnlZU0JwNWlVUDkyMFlzandKOThQN2dzVEY1MU93MVlmWXhzaEh4djNwRWlV?=
 =?utf-8?B?N2Z5b2J5eVRWWXBHOUNsZFg1NnZyTWJtSHVFM2JhNGtLeWh4QU02TFdKNFk0?=
 =?utf-8?B?VWtvRjFSWFFVTE1TT1ZhM240MzBBVTNGYUtrdWZnemN0QTF5M0w4OHJ3dVpP?=
 =?utf-8?B?RXJOdWRmYmFILzZqN1J2bTZpQ005bVBHNDdldHlQS0RVVWp6dStVRktFNFpO?=
 =?utf-8?B?Q3IvR05oK3pGRFc0VUJqNE9xNUdRaS9SWkRRcUs1Mjl2R2x2R3pISlpVcUVU?=
 =?utf-8?B?Ym0vYlNhK2V5REVpQjArSEU0b25iQVpycXc3VGpzZVpNT2VHQm9nVTFGMlAv?=
 =?utf-8?B?UURTWE9IZUZ0SVB0cS82R2dZWkFZRHVXSGZSZDc5TWEvSGRDUkZPOW9lTWFp?=
 =?utf-8?B?UmJiS200blJsK2lhejJtejVYekpPYm9yWEdsWkhPOFlzem5pa2VlZ3pUdUFB?=
 =?utf-8?B?WWhpTmRDMWIrT2lrSCtTVTVWYkZONEI2QkdhekxoK05IRXFQTEFzTzRKVGJj?=
 =?utf-8?B?VTlwTXFhaDlQaWJ2T21HZlBCRHVRWUpCOFZqZWVGeWVSVVVnNEJOQmRHYlU5?=
 =?utf-8?Q?wK+8UIk8bTVLnXhHcxzwDEdm8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be285fa-8846-4dc1-e1a6-08dce3e3695a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 19:41:44.6224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRWbStAYV48oIX4Sr+UrXRRFydBtAJN+HNa4+nVZp1pXAUZfdIC+fCqb6usAypYwnuMYPnTZyRTvgVrP4tWfzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024



On 2024-10-03 15:09, Mario Limonciello wrote:
> On 10/3/2024 13:51, Harry Wentland wrote:
>>
>>
>> On 2024-10-03 14:23, Harry Wentland wrote:
>>>
>>>
>>> On 2024-10-03 09:47, Mika Westerberg wrote:
>>>> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>>>>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>>>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>>>>> Hi Harry,
>>>>>>>>
>>>>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>>>>> boot screen.
>>>>>>>>>
>>>>>>>>> A bisect revealed the culprit to be
>>>>>>>>>
>>>>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>>>>
>>>>>>>>>        usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>>>>
>>>>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>>>>
>>>>>>>>> lspci output:
>>>>>>>>>        https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>>>> acpidump:
>>>>>>>>>        https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>>>
>>>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>>>>
>>>>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>>>>
>>>>>>>> Do you boot with any device connected?
>>>
>>> Great question. A Thinkpad USB-C dock. When I unplug the dock at boot it
>>> boots fine and when I plug it in later the laptop charges from it and the
>>> dock's audio output work fine.
>>>
>>> In the midst of my experiments I also noticed at one point the dock
>>> wasn't charging my laptop and hard-resetting the laptop didn't fix that.
>>> I had to unplug the dock from the wall and plug it back. So there is
>>> likely some interaction going on with this particular dock that must've
>>> sent the dock's FW into a bad state.
>>>
>>> The dmesg with the revert and thunderbolt.dyndbg=+p is here
>>> https://gist.github.com/hwentland/7e25dedd3e707fdae1185d65224d4d66
>>>
>>
>> Apologies, that dmesg was from a build with a bad .config and has some
>> FW loading errors. They seem to be unrelated though. This is a dmesg
>> from a good build. It still has a wlan FW error but that shouldn't have
>> anything to do with the problem at hand.
>>
>> https://gist.github.com/hwentland/867f7afbf3df20547a877e794a8d8e6b
>>
>>> I don't see any PCIe tunneling option in my BIOS.
>>>
>>>>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>>>>> somehow?
>>>>>>>
>>>>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>>>>> tunneling, and I agree that looks like the most common cause.
>>>>>>>
>>>>>>> This is what you would see on a system that has tunnels (I checked on my
>>>>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>>>>
>>>>>>>              +-03.0
>>>>>>>              +-03.1-[03-32]--
>>>>>>>              +-04.0
>>>>>>>              +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>>>>              |                               \-04.0-[36-62]--
>>>>>>>
>>>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>>
>>>>>> Okay this is more like what I expected, although probably not the
>>>>>> reason here.
>>>>>>
>>>>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>>>>> the BIOS on your reference system? (Probably not but just in case).
>>>>>
>>>>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>>>>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>>>>> but the system still boots up just fine for me on 6.12-rc1.
>>>>
>>>> Okay thanks for checking!
>>>>
>>>>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>>>>> after some messages?
>>>>>>>
>>>
>>> It hangs after some messages.
>>>
>>>>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>>>>> finds the given node?
>>>>>>
>>>>>> Looking at the code, I don't see where it could get stuck. If for some
>>>>>> reason there is no such reference (there is based on the ACPI dump) then
>>>>>> it should not affect the boot. It only matters when power management is
>>>>>> involved.
>>>>>
>>>>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>>>>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>>>>> enlighten what's going on (assuming the console output is "working" when
>>>>> this happened).
>>>>
>>
>> I sprinkled printks but don't see any on the console.
>>
> 
> You said it can work properly without the revert if you don't boot with the dock plugged in?
> 

It can work properly without the revert if I boot without the dock plugged in.

> How about if you unplug it, does unhang and you get everything flushed to the console?
> 

Nothing happens.

> Or maybe magic sysrq with a backtrace (l) can help see where something is spinning.

Nothing happens. CONFIG_MAGIC_SYSRQ is enabled in my kernel.

Harry

> 
>> Harry
>>
>>>> There are couple of places there that may cause it to crash, I think.
>>>> And the __free() magic is something I cannot wrap my head around :(
>>>>
>>>> Anyways, Harry can you try the below patch and see if it makes any
>>>> difference? Also if it does please provide dmesg.
>>>>
>>>
>>> The patch doesn't seem to make a difference. Same hang on boot.
>>>
>>> Harry
>>>
>>>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>>>> index 21585ed89ef8..90360f7ca905 100644
>>>> --- a/drivers/usb/core/usb-acpi.c
>>>> +++ b/drivers/usb/core/usb-acpi.c
>>>> @@ -157,6 +157,7 @@ EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
>>>>    */
>>>>   static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>>   {
>>>> +    struct fwnode_handle *nhi_fwnode;
>>>>       const struct device_link *link;
>>>>       struct usb_port *port_dev;
>>>>       struct usb_hub *hub;
>>>> @@ -165,11 +166,12 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>>           return 0;
>>>>         hub = usb_hub_to_struct_hub(udev->parent);
>>>> -    port_dev = hub->ports[udev->portnum - 1];
>>>> +    if (WARN_ON(!hub))
>>>> +        return 0;
>>>>   -    struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
>>>> -        fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>>>> +    port_dev = hub->ports[udev->portnum - 1];
>>>>   +    nhi_fwnode = fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>>>>       if (IS_ERR(nhi_fwnode))
>>>>           return 0;
>>>>   @@ -180,12 +182,14 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>>       if (!link) {
>>>>           dev_err(&port_dev->dev, "Failed to created device link from %s to %s\n",
>>>>               dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>>> +        fwnode_handle_put(nhi_fwnode);
>>>>           return -EINVAL;
>>>>       }
>>>>   -    dev_dbg(&port_dev->dev, "Created device link from %s to %s\n",
>>>> -        dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>>> +    dev_info(&port_dev->dev, "Created device link from %s to %s\n",
>>>> +         dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>>>   +    fwnode_handle_put(nhi_fwnode);
>>>>       return 0;
>>>>   }
>>>>  
>>>
>>
> 

