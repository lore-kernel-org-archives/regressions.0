Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E536212F1B
	for <regressions@lists.linux.dev>; Wed, 16 Oct 2024 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729108112; cv=fail; b=lAAs1/cgL9L8uRcYlMK18w0zSbm2pPXky8PdSd63Kkql3IuQUYj+JtCujYjZi+OOicoSWCBtMpOxWxpB1/qFkCXU3PRFfE++2ycXArVsVjWlpQ41pdv8RhEjgt12zq7a3gI8eT3oShvAIQvrXw68M6Fkk03vFDRpABEHoruQmCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729108112; c=relaxed/simple;
	bh=hax3lSULx8Mvrn/0crtAQrHLiDVfwcQQ/Iy6mjtfZcs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uQ3gPMqKz052+2G5nVTOH6gjuKmAIN2M5daZBo0xZiiuq3Kjb9KRqErnf9kR9Vjq3INrWMmQTQcQFnlP6so5zT+MHjGMpXcAcp8IHMrAf7TDpdtg+c59PTzxp54s9HRzOvGG6TmhZKu0U3ZFhZLr8NukYV7Rgu6lwD1i30l4GOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tvw/oJom; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tvw/oJom"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKqqzhSnWYtEutnZccUJvUYfk2VMIyMxBfKzkgbtNuVDmiceO2ePNUlNMRart5mlFQ/I2UGJagAm9n8ceHPAzjudoZ+9nUzBiHPAKHwMS9UGnoO0YaBRz9RX8IKidVTTqGc7fnxV86A15e0NIGxb0ZTc/FNV7u9tvsSgItg4QuctKTx/JRh/OlWxGdi9cUG8m8+tnYBKNB/PMYBzv3rQZjpcCRzjJX+4WMQ4hZxKpYIo5bnjYNy2Fm77eJo83b6q50qji2b6wXL0l7yA6mjbJGxDUaHrPGFWVDfPtZcPvbV+0hJUgUynhU1jBvWSq2iWF5F2wJ/x+T9TEEBOJ1mEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmHMaS6/GgFSGNj3eqdZ+XS7Ki7bHMRyguxzGUf6tXA=;
 b=BRujdj4bQpIn7e9xAg1VT1FPN/5XhOO2ip/3RLlCxKq0uO1OzLSOjyXsxKTNP9bQaegvpk3e2j68rIlbdsjNwnF/B7xMUyQZ4L5HhkwHH2lXp4Nha8v7kIt+WT/+qiHaUOS7e4R/+zbtFdOTu/widyP94SxIIzhqkFKbcw2PE0GOjW9AQKqX37vK8I2+UxGcm2a5PxgXiTDNPtJjdUQSyPtYA4WgPS3cax4l+bcGZ9NvIdGZjzMVNkxXTdj257gxD1v+S+mnTo7cUGBSRokLJoY5QkZoChpsRv1J54DG6s/6zRBAcZxEpW0sZHJREvLyuAVL95WLSkkDTapd5D0xLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmHMaS6/GgFSGNj3eqdZ+XS7Ki7bHMRyguxzGUf6tXA=;
 b=Tvw/oJomRXhqtoEOHv51fCQQImvC2IHTt16EwLALp3rlBpyPiRoN6Dw0lu43JPKM9cyTANTCICXfVGcMxip0Je21tO6FxMuB0P86Hr7udVaap3CH1qodUnOye/LhtANLOgx85/r4NNi3G2YZW+8NraIIB0pomjsM8YDQEO90gfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 19:48:27 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%7]) with mapi id 15.20.8048.029; Wed, 16 Oct 2024
 19:48:27 +0000
Message-ID: <eecb9408-1c20-47ef-a8b9-56fcee1dc610@amd.com>
Date: Wed, 16 Oct 2024 15:48:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
 <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
 <20241003134743.GO275077@black.fi.intel.com>
 <cee28cb3-a157-4d26-a68a-7b5a99161d1a@linux.intel.com>
 <c5209c31-9263-4fe7-b387-319bbaac866d@amd.com>
 <dc9bcfa6-885f-4ae2-a6be-832a985bc80e@linux.intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <dc9bcfa6-885f-4ae2-a6be-832a985bc80e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::44) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f943ddb-8681-4149-1b55-08dcee1b8057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXNNbzV5RExndks1TkN4QVlrM0IxSGg3T0FYdmV1MzhkMVVOWklHblRRajMw?=
 =?utf-8?B?SXpCTmVRZmpuTy85eXl2YVJPTGlxak9RL2dJRnBaZEkzWVgyOVVzcVYvY242?=
 =?utf-8?B?WThLSlcvZ2dmWk5PeFYweEtwajk0ZjNUa3o4dVlmaXREb1NERVFjbW5MZVZq?=
 =?utf-8?B?L0ZQcmV6UkFrY08yUEVHVjZ3MEVseE1kQVh2aWZNYUxPM0V1cy9KWWFJLzQ4?=
 =?utf-8?B?QW92NU4ralkyQXk1cVZhQytmeFp4OVRjbVNYUGpYdjFoL0ZOY2hIN0VlWlYv?=
 =?utf-8?B?RGdMendBUXJMTUNXUVVBMndZLzlGSmVBQVJNVXIwbXg5elcwZVpwcmJnY1BY?=
 =?utf-8?B?dDgrNzdzdjUzdDdzTVpFQU95VkhTN1pDcmFGY2VqNDFQQUVMOEJPQ0hoV2Ex?=
 =?utf-8?B?d3YxeXhMSGhvODFETFJoQ0YwNGdFTi82am1NTS9LQWxYUzd1NkFUZEVJWE5P?=
 =?utf-8?B?OUxVRnVEVktLR2ZNbWJNelhGNlVyaWJYakFpTFJrQzNIRzd4SFJoclh2RURl?=
 =?utf-8?B?NThndkpZTTArM1JGRFI2N3RVWFFhdm5VRGZmbENSOFdiLy82djRYZWtwWTVE?=
 =?utf-8?B?RzZoUEdkeTNLZk15SW9WZDJmUmYxeVVRN3FWQUhBRFdjUG9XZnVRa3pkUjVB?=
 =?utf-8?B?UzJDbjRXd05jcGtNclBrNGJUNnVsWnEvbVUralVmMmxvaWIwd1RZK3VpY2xL?=
 =?utf-8?B?WkpDTG82NUZqUkVpVHk2UFo0c1hCVitrL0UyMWtlZEVpZ0R5VG1sdjVzYmRo?=
 =?utf-8?B?MHZZL2kvQ1lXVmFhSnRTeHM4ZUNjblh4S2tucUdXNndZSlhQcm1iNmxOdlhM?=
 =?utf-8?B?SXAzU3BHZ2ZwVkJPdFpWbmFIdUZMQWd2eGI1RVAvbFB0SjkyMkdSRjhhbUNs?=
 =?utf-8?B?a0lqS0NYQ0RlaGY5SzBJZXdjTjNQWjZTVWZvTjN6NWtuN2VxbVhBb0xsTCtG?=
 =?utf-8?B?aGVSNEdLeGREL1RMTk5vWWtjcksyTEFwWUhuU05hRU50dEkyUGdxMlRNSU4v?=
 =?utf-8?B?Tm5ucXp3UU5reXJxVytoNEdTem1KNWVHKzdWcU13aFVodGJQRXMyaisraUhH?=
 =?utf-8?B?QnVLZEdqVjNDdzZMZGQzcnRhUUZ3RTM5NmRQb3hndloyZE9mb1JlYUNDeTlR?=
 =?utf-8?B?NWFobHh4dmlhU2NHNlZta3Bra2tSNnJ4eGdoZ3RRZTZtSDRBYnNYb2VtTGxT?=
 =?utf-8?B?dlJNb0lsYWVTOTlEb0ZZRko3V3FaQ3p1M1R5ZGlwNFFSUGtXeE40VDIrZkQv?=
 =?utf-8?B?Ykl5MzY4Q2tDMHNLMGc3bzQ2cmY2cHp3TElBbXNpVzZIRkc0YnliZG1kTndV?=
 =?utf-8?B?bXdnbjhKemdEc3V1Y3kxRGE5WGptOWNIRXlITU1vYkNpTlIxMENSYnU1UHR3?=
 =?utf-8?B?L3dLVkJjK0p0aHh4NHBSVFZ1aGpsNTdEbWlYZmhtRVZFRWlsZTU5YVh4Mi82?=
 =?utf-8?B?aDJNZDNLV3FMOWR5ZE4wVnJCQXpCUTRvQlJ2TmdlTjRKUHAySEwwZmlWZ2Zk?=
 =?utf-8?B?N3J1cVdSUEh2VlkwVDNFaVBWVk5zQW1ibXo5eU92YzY2TnZ0OTg3dTV5VjhP?=
 =?utf-8?B?cXFVdGcySGxxeERlTmxreFJQM3FYeTdSVG5ONVBROTdha2Q5UElOUkJGVE5S?=
 =?utf-8?B?aG5YVWFjc25aVFJJU1p3M0dnMjIrSGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5438.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yjk1c0FBRTJvSkNlWEtzQUFQOVVteGtuM0dOYTYrOXVoc3pIM2x0cmZGV2dk?=
 =?utf-8?B?TGhzYm5TSzNCQm40cEVVWWZqODhFZk1JL3BEd3pDZDM1Q3VQazdkTnFoQ1gw?=
 =?utf-8?B?MnI0dlcwWXRQVS8vYlBmNTQ5MWp1Zmw0Z2JtWURQWmhUN1NweXZyWXpLNjhB?=
 =?utf-8?B?YmVKMGFGa0JCVVg5ZmZWdTYxS1NTbXp3bWI3cElvK3FGQ3hnNFEvQ2FJRU5E?=
 =?utf-8?B?U2tOZTJCK3ZHOU5sRTg4ZU5Ccm1PMzlWQUprR2RkaVFpVDRSTGxVbmVvTU5q?=
 =?utf-8?B?MS9FZ3Jhb2tkR21pM09wdHNyN0VabFdEVko5R0piZmhxYWQrRjVuQ0pQYkdv?=
 =?utf-8?B?RWFXYnZ6Nk9yQ1grMjM4NEY5aHo3ZklGbTFGT2kvWURlbDh6dWpyaDM4RVBq?=
 =?utf-8?B?azlqSUQ2VnVJRXV3Um8rVjdCdUlGYkVXZG9talpESDRtTmtaK1ZCSkFNWmNW?=
 =?utf-8?B?OE0xazJKeVdRZms5OElJS01FdnZHOHVibWRGWGVUV3luYlluQkt4ck5sUW5k?=
 =?utf-8?B?d2h3Z01SUU4xRUVJZ05uNFZDYlhDM2ROTTlrOXFxai9nRnZlSnRpUzF6alps?=
 =?utf-8?B?TStaWXl5aTdPVUJiR0N1QVYzMGNXQXd4UkdRcy94cEt1Y3lqblUxS2RDZm9D?=
 =?utf-8?B?SWwxQldvK0FSVlFuNGI0SThJamFpSUxjbXpNbTM3VjIraVFXY0VuYkUyMHJr?=
 =?utf-8?B?RlY5bWhNbjRLbXRZZ1FFUmwxcWRCa2ZJTWVXWVNCdkRpUmljdy9ySXR1RjRw?=
 =?utf-8?B?OC9SbzFRTFdBMHJ3SHVoQ3J6Wm5hRWV5aUpocnFvVkl6enh3OC9NdkpMWGNL?=
 =?utf-8?B?ZjFXWXZ3V1V0azZTZkZ6VWFvRXNyUC96Y3VJVUtlSHRObHVYeGNZQ3NyREkz?=
 =?utf-8?B?VDE1NmNwQis2YzgyRldMUHp1K2tUbS9ZRDIrcktaZytZWVcvcE1lblJmWHR3?=
 =?utf-8?B?bEg1c3pIQ3RKZFRQUTlGOEtQYzhCaUtuejRHalJZWVBKeExTdG0zVWdlMWdW?=
 =?utf-8?B?SmhrdHhiNk12bWx4V1hpdmxLNEg2S1pLM1hsdDd1dittY0xKRmlBbkxUY2Fk?=
 =?utf-8?B?ZU5KT2Y3emp3UmYzTldYL1crcEtrMFZXZUpQc050U24rc1dtWmt6N0JkRkd5?=
 =?utf-8?B?ZzZ0ZGRtSGtLTzFjb2k2NEFHS3JwTWNMblAyVEcvUGlCWFEyWXdzbDhtWXFQ?=
 =?utf-8?B?WUN0Z3pRWEJhZGNRQlZMWE9Dc201c3RVMWxFK0xZTEthUVhFb3R4aWdyYlFv?=
 =?utf-8?B?SkpRR2g2M3RTWVpSQ0RjYkR1RU9kU2t1ellMVzRpcUE0Snp6YWRqT3k0WEFT?=
 =?utf-8?B?VHM2YUVoRWI1ZFJJWmVPZWFqMTQ5TUVvRHJoMkdzcjNwbEpCbklrTHZjY0lR?=
 =?utf-8?B?aHFpdi9QNll5K3VDRkphTWpUOEtqZnY0Q29KNVdHZ3piTDJBbHVla3JEUTBW?=
 =?utf-8?B?cDJrS3Jmc2tuYmowajAxMXN2Q2RZeUlrT3N1Y2JCOTVQZUFmYzZWOVZNcWpK?=
 =?utf-8?B?SDFNU1NjTjJlelQxZmtiYWI0a2ZkMEh1MkFVRnJvV096dFFCbVowaitYNDhQ?=
 =?utf-8?B?MU5oWE51c1F6TVhxUUFZa1l2U2ZPNFFGTzhCZmNER3RsaEplMVNVMDFHbm5N?=
 =?utf-8?B?c3VGODh5V3FCYXdhSkUwc0NKV0pjVnZQekpsYkdjWURtdDc2MHlJaEtJRWZY?=
 =?utf-8?B?dWtPRGZQMTFpeFMvaEE5UVhnU3hzZFlia0lrMlFPTHZVS0w1dDZlTE4yQURI?=
 =?utf-8?B?c0JONzk3MC9Say9qbE5aZTdXdUR0OGJ6NUdEVVVaMUpYNXpDL2hIWXpwSU9z?=
 =?utf-8?B?b1Q5TDhETEZCcnRBbnl0Z3lFNlJtZmVVRUpNTUdjYTNqZWN4TlJYcjJxdFho?=
 =?utf-8?B?MWNYaW0yNC9TMHpHWVFrNmU3WnJMNU44Zkx3anRXZXBpVGhoZTFyNnBveVlK?=
 =?utf-8?B?RThHWEpGbG5aSWVYNC9QZUlqcGJmTDBTZXZ2OW9ZY1cxL0crbnBJdkFQdVNF?=
 =?utf-8?B?WGIyUGRNR3JocTQvUXJKaThaWUlQaEhPb0IwR3ZUWHNEYUl5SVRaZU5kWXNi?=
 =?utf-8?B?MlVxQXQ4Y3FpaWtCZExUUzd1cURzTzlsVkJpdUFBbkgvYmc4YVNSQmxUMi9I?=
 =?utf-8?Q?qIl48YzXxOQ8Mac4c+Xkvk1B+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f943ddb-8681-4149-1b55-08dcee1b8057
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 19:48:27.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aRwCA0wSSt25Pyj5E2OcchJRykt9Ka08byYQa1Xab5H1K7xPnr7PNxkELTW8QMij2PvUvU+ljINBsmPDQO1xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791



On 2024-10-10 08:01, Mathias Nyman wrote:
> On 10.10.2024 5.23, Mario Limonciello wrote:
>> On 10/9/2024 16:52, Mathias Nyman wrote:
>>> On 3.10.2024 16.47, Mika Westerberg wrote:
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
>>>>>>>>>        https://gist.github.com/ hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>>>> acpidump:
>>>>>>>>>        https://gist.github.com/ hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>>>
>>>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>>>>
>>>>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>>>>
>>>>>>>> Do you boot with any device connected?
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
>>>> There are couple of places there that may cause it to crash, I think.
>>>
>>> Its possible we end up trying to create a device link during usb3 device
>>> "consumer" enumeration before the "supplier" NHI device is properly bound to a driver.
>>>
>>> This is something driver-api/device_link.rst states can cause issues.
>>>
>>> This could happen if xhci isn't capable of detecting tunneled devices,
>>> but ACPI tables contain all info needed to assume device might be tunneled.
>>> i.e. udev->tunnel_mode == USB_LINK_UNKNOWN.
>>>
>>> Harry, could you test if the code below helps?
>>>
>>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>>> index 21585ed89ef8..94c335a7b933 100644
>>> --- a/drivers/usb/core/usb-acpi.c
>>> +++ b/drivers/usb/core/usb-acpi.c
>>> @@ -173,6 +173,13 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>          if (IS_ERR(nhi_fwnode))
>>>                  return 0;
>>>
>>> +       if (!nhi_fwnode->dev || !device_is_bound(nhi_fwnode->dev)) {
>>> +               dev_info(&port_dev->dev, "%s not tunneled as it probed before USB4 Host Interface\n",
>>
>> I'm aware this message is mostly to prove whether this is the actual issue but I do want to say if this patch indeed helps Harry's problem and you keep a message in what goes upstream I don't think this is accurate for all cases.
>>
>> If you have a Pre-OS CM, it might build tunnels and those could be active until the USB4 CM loads and resets them (by the default behavior).
>>
>> So I think a more accurate message would just be "%s probed before USB4 host interface".
> 
> Makes sense, I'll tune the message in the final patch if this works
> 

Apologies for the late response. I was traveling last week.

This patch does the trick, i.e., no more hangs on boot when
connected to the Lenovo USB dock.

Harry


> Thanks
> Mathias
> 

