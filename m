Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC61AB6CE
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727982585; cv=fail; b=g8UO1dG3EMSLPZFeC1JLaGKNbcfMKhCM5Wd5cjsPccX0Q2N5XliXueCzzjn+cJ4NMK8z9YBb2jBjExU3VAbjPHl0pAZyfEd/T3M4cQlY91xgiZHs3F57IBHO8IZTGNOZ4dxUrOGJKZawsMORJ3lW1pxqoSTVrDJsELrWRfr5U1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727982585; c=relaxed/simple;
	bh=qFfFY42BpVRn4pI89EBXy6lzzvYk6kAiLu1J7Llonvo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RafpwZMsdQISCsvE2y44wSsOM3Jk2PB4Ser52Gb4cohFNkasDs16SSruXd7Pwxih1s2vJ7Eki3b+UyWgnkKpcpXVMsaQGisxDXRhCfJZI+iybY8zC9oElQge5jjNUKgkx4PXFFaNrlY4J6kyRnhJvQdEdCMRVLMzpGo3vlw5DOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ClJt5/TS; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ClJt5/TS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjxYs4Np+oh20+qTF0jMJEDOAmi28353Rh0o6H6VANAA1ISf/LSUcyirPiVk2jA5RUP1ZvzZqdJ79gbS5syTY2UYSoJ4KckNVT6HaQtO+J4HF9Vci44Z8Su89/LCXgKEHqMJajNVrw+O5H+GC95Wltvpi41mYdQ3gxlzZck+zBQ3CV3duQafgiV7pQ3I+KCTv1O/87HM05KwnN8a9UFf6eYO9/28m1wTLPie9riOJOVHpiZ20uAkhAVaechOIBetKBP2Gnl8c2p4RP1LdwZE/yrvLwSik2725QjNNzkapKqK543GFEox/psQtplX3T/FgfI6YuIu/j7su5K/YUj9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TP9/HZAnXQROqKWD4yh2EJl9vnmkYbtHBCSuth8ryJ0=;
 b=xAHiyDvkLGV4sjeizEHLDjnHNEwpOLsPETvvpWQSCnnf7VbHfpyXimiPqiXlaXf9aSbSDE0+FChiiBM9Xnf0YKUlVCXM/TrMiaAt1yfIw/V9D+b2+FLPJBfrwBF9Etfz6gP9ktdJ5nMv/fTVVlnn9D3VvPTaB+Y/pcUHRmEbIlh5AhM0m8f032iSgfAwfTErDSRYDIUoy901EuUdYLJ9TwTzPwFFbEwJVcBvIc1lWYVC88Do/cTRpt13wBLenLtVtpUg9rfKCDLY58YrRlU1LZxN4HXw5DJbPt8wwJxDDQsl0k/EaPPlyGt3hdFOi8N+dTLgnxi9et+XHcyvXNs92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TP9/HZAnXQROqKWD4yh2EJl9vnmkYbtHBCSuth8ryJ0=;
 b=ClJt5/TSlsU/0JK8hLoItENJNlYhkcV49M2sI7OjIZjCj8+xXXsUCB4kHH0lxVDMOSYsIMCvS+wITqHhwv1uGB7Em4ord7b4B1lWw9hxxkTkMMD4zjZB0CSQ60Gf5RcHR1xa7egiWtF6AI85MOwHxc4xKyxDS2rm4NksIIM67HI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 19:09:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 19:09:40 +0000
Message-ID: <9edf23d2-d5f7-4646-bde0-4af1e01abfd2@amd.com>
Date: Thu, 3 Oct 2024 14:09:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Harry Wentland <harry.wentland@amd.com>,
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
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <467722db-188f-4487-a837-01e65e194d3b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::22) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf4d01c-973e-4205-2cd2-08dce3deee3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZhdFVHQ1p0cUlJTDNRUG9yTmp4UnRQWDFiOW80L1IvTncrOHZKeTZ1MFFX?=
 =?utf-8?B?azdDVlJnRTMwYkE1c1l5REdCb2taYlhXK0NpZW03Sjg2VXVOaTF1bEpVZVZx?=
 =?utf-8?B?bmtuU2lmU0Q5RmkydFAvMWR0Y3RBbGVyb1JQVXVyeldRTlBiZU5zTDViQzNF?=
 =?utf-8?B?OEp4WGk4SzZyaWJHOVhVZ2txUFdjT2gxMGRocFdwYjI5akw2c2JsanZOUDNp?=
 =?utf-8?B?S2syMlpqZDNhVjhxMWhPMUJrRjNCNm00SmtnZE01YnAyamxWZGtsK1V4MmZG?=
 =?utf-8?B?dklUK3BpaW03VzNkWGtiYnpTSGgwbnJITitRclM1aE9GQkdPRHZRcFZ2eXVr?=
 =?utf-8?B?ZVkyTlZlMWpYazUyZlJBZFM1WjRSY3dxZHJKV21uZUgvRWZlQ3J6VEJPREN5?=
 =?utf-8?B?R3czQWliNzMydkNFUGMwNW50b216czd2Rjd0cFovdGQyL2dJZDZ3d1RRZjlx?=
 =?utf-8?B?VVFCOHFIc1FVTG02eUo1Y1Z4VUUzNlNFNnZkVmpxOGE3ZFNoNzFqb2w0R0F5?=
 =?utf-8?B?TGJ0RHVyQ0x3MFVxY3dnS2p5UVFCUnhFVm5JM2I2VE9QYzRCVVpaZFViOVZp?=
 =?utf-8?B?SmZNTEgvMEZ2NWVwS2QxbW1JQ3lmdnlENFhPeHlZQTlNOEIwOFFxZHJIb3NQ?=
 =?utf-8?B?UnliU1NkeEl0U280MGZLSUozTzBqY2R0RUFjMkNxWmx4bGhpajMxb0RDc0ZE?=
 =?utf-8?B?NWl5dU0vNGNJVWVrTXBmNGsxMWJaODFZdHpOd1J2dTFWSXhhWDRnWkxuVFdP?=
 =?utf-8?B?ZkhSVW9JdWhrOHl2Kzc1UHE0MUp3ZUJmKzZUZE9Zbm81MFYzV2M2cDk2RWlO?=
 =?utf-8?B?ckgxSHhRN3pwWnJ2cXFJOGNlb05SOFR5WmU4UVNLSTQvU3JpZlRubGp6Zi81?=
 =?utf-8?B?ejFhOHRUMFFIcmc4VlQ2VE0yVDZTRjJQZHRSUWZGeHpEYU5iOWlMdUxXYVR6?=
 =?utf-8?B?VUgvRE9qczk2TFBBTE9sRjFvWFNHL2t6MXdvODBMdEhSc2xsSmJHeWJXcjlI?=
 =?utf-8?B?cTl4dnlLRXJHYzFUZ0ZyNHlCbVZRSDRwSUFMTjFmMEV5dFplem1NU2ZIOElp?=
 =?utf-8?B?b1F0N0U4REJIa285Ym5nVmFsNVZibVRNVWI5elUwYUwxeDU5VmxSTTdNTVlk?=
 =?utf-8?B?UUNrUmhjOHU3THIvT3VuSURTalhEcTVxSEZQNXZGbDQ0a2dTWU9pOW1ITUVH?=
 =?utf-8?B?VnFvTjRqTWFsQjQ5Wnd6cTVIZUFDMWNtT0VzZk9ZZCsxTnkwdEtwOVV5bU5K?=
 =?utf-8?B?eHpIZXY2T0Nmb1RYYUZZbWk0dExjOWJianBacUYwM0RxWmI4OFcweVJ2UmNh?=
 =?utf-8?B?bi82QzVRclRENERXd0k2aHpYV1Y4dDNseU50VHI5UXFoY3U4Y1dlZlZiWS9W?=
 =?utf-8?B?Yk1hU3Z2QkVpRlNRamJCNFFNMkc0STB1Y3JFbGF4b2IvV1o5UGV5ZXV1cjR1?=
 =?utf-8?B?UWU4STZ5Q3JDajRLaGJPS1YwZmN3aFJjOFdIaWxZVE5SazdGVmlkZ3QxajE0?=
 =?utf-8?B?OE1KYWI1Q0RrdTZvcHd3a01UeHZiZ1B5akhPNkdKMzdKamdlVUFGbTYvazlU?=
 =?utf-8?B?QTVPNnFqYUw3VGd4YmJFZmV5a1pDOHQ1MURDU3JkWmtDUUpLbjBsTkhLQWpH?=
 =?utf-8?Q?eomDgAKxAx0X4fu2kO9tMLbNUlQv10bdt7BHSuGdk0TY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0dHcDAzQW1XYnJrUEtNNHBGSzZuZHYwUTZBajdQUE44aW1JeEk5L2JiUlBD?=
 =?utf-8?B?SUhrUkY3QzNkaUpweEFHUkpHUDNqRW1naHJWRXBXZFNIckZ3WmtaN2szS1hP?=
 =?utf-8?B?eXVwbkRsWmxZZFhVblJHckdiY1JQRXI3VWhDRHRPVjF6MjFBRVRvTGhNUHFI?=
 =?utf-8?B?SUhHQ1RMSmpwby9JQ2dlRml0OHhmVnIxckRQNDlHb0QxL0s4alBZUHFScS9h?=
 =?utf-8?B?Zy9Qc2FSbHpPT3hlQUx2RkR6K1F6MUt4eW42UWxwWEV5N0FESDBsRFN4ZnJn?=
 =?utf-8?B?YXY3djBYODB4eUVOK0VmUG0vMVhsRE8reHN0RWNXbFFOVG5tUlZTQlRTNWQ0?=
 =?utf-8?B?Tzg4UGZLbklDUzBrRUx3dCtkOGF6MkJObGNNazFmRHJhVnNFUzV3R3hYdklp?=
 =?utf-8?B?UnZaVzc1aW05R2hoVjB1QjBScTczSmx2WGVwTHFtcVFwcll6SEV5VUJ6U2F0?=
 =?utf-8?B?alRZaHlpT3dMVzl4ODgwd3ltVERHdjdNcUpsTU16M3Fzem83Y2dvNStFbkpy?=
 =?utf-8?B?VXQrQnIyQkUrdy90MVNrankvbkc5U3lrRkpHODhjSkQ5TzdobEV2bkVPblFm?=
 =?utf-8?B?TzZyUERvS24xdmlGc3JFd0NwMndUdmwvK2Z2djEwdFc5UTkxR3IzL0hYbFQr?=
 =?utf-8?B?cVNCNkhyMDIzQ3BIT2ZJc2Rpcm00NDR0aGxMdlhmRmVlSC9sdVNpWFAveFYy?=
 =?utf-8?B?VG16cU1GbHc1ZmtsSk9ESWEyaFBvdXhZNFFVclhUZFFSaEZ2L280TFU2OVJZ?=
 =?utf-8?B?YXF6S05YT0h6cFBqOXg4VnZMdlJReURQWk1HVWFhNnNxOXpiVkNiZisxb1F4?=
 =?utf-8?B?QmFMR05Pa3VrWnA1dlV0a3F6d3NyeHRJQnlQaWNqWWI3NVBuMmJVajFPdVJu?=
 =?utf-8?B?aVFGdk50S1FYN2g2Qmkwc3M4K2hGV3BkNTJNVXZlOWJMY0hQN2FpNTlvUklh?=
 =?utf-8?B?V3ZYSVV0NVYwRkJTSWR0dmZlNWI3bFNyankwcGpic0JuZndDZ01FcEsrNVFy?=
 =?utf-8?B?dUc3R3M5ODRQdjZLOGFjYXU0Z0dtTW8wcDQrY2pjNnBYdjhMK09lYVlKNW9o?=
 =?utf-8?B?Vk9WYjlUclM0eU1HbzMyczJ6a1JxV0NyWklqSlpGVVdOUDVabFphZHllU0M4?=
 =?utf-8?B?NzUwb3Z1TFpPL3dGamN0dEhsM0lJN2ZpR1BrUnZ3K3V6Nk1jSFdaQ0djM0Zl?=
 =?utf-8?B?Skx1YkRwRkxsTWFvTThKWUdOSWwrblM0aGw4cnhtcENTTG1LNGI1SWtKeE1p?=
 =?utf-8?B?d1YxMGVJV1pPUCswRGZBMm5jcWpuTFFseTJMUEFHMVc2Um13RUhpSU1MN3l0?=
 =?utf-8?B?TzlPeGxlSlBUWm0vY1E0cTJISHl6L0pMUHZYL2xnUkt5Q3dJbURXMGpCVUly?=
 =?utf-8?B?anBWcEMyWXVCSVRXYlF5dmlLNXc2aFRFdW83SWxScFUwMXJzbkhFajMzWm1x?=
 =?utf-8?B?TlFzaTQ4ZSsyZ29McmhEaWdZQjlvTUpFL2tkaXdMRDBtdnVOSlU0VHN2V1hk?=
 =?utf-8?B?NzNoYUQ3ZnFYaDJGYkkvQUV0MWZ4Um1yajRmNEpieFYycVNVeHQzMUk3UTZ1?=
 =?utf-8?B?L212bU9UeHRJMEFmT2lBVnc2QVlQVmZkRW5CU2pWWW5mVUJaVktqdzV1Wlcw?=
 =?utf-8?B?d1UvVnkrY3ZpUjJmaVVQVzFJNVl6SDJmWWRTOVhzSm9iSlFndzJRYU9uZ2Zo?=
 =?utf-8?B?RVNMeHJLNjNuakk3aHVUQVhYaGlUZFIvZW1nWDZyVzZYeHhrM2VvV3BvdTJX?=
 =?utf-8?B?WUxqZGx4ckNNOWp1eU40cFc5UEZKaktaNWFhZ0VoNzcrbWVxK25icXVFdEhT?=
 =?utf-8?B?NWFwUm5LTjZiVTdtdE1Pa1gzTGsxNlFGeVZlWXMwR240R201UlNPNXpmWGNE?=
 =?utf-8?B?N09FRmU4QWNxQW1pUSszdjlGNlo4OSs1M204Mkp4bENvamNBYUZ6NEFtN3Jv?=
 =?utf-8?B?cmRjWW9TZ2V4bDl3eDR1U1JxWFVkVzNLMmFpZnVjOVg3ZjBYUURXQkNFOEMw?=
 =?utf-8?B?MW1IcUJMU3Q0dTdEbVBPSHhISXBrbWJvVm14OGZJUmpCa24yQkwrbjJLdk9W?=
 =?utf-8?B?UmM4TlR0NUg0cDNuRjJ3R29QZC9EbDJCYXFOYitwZTdRRkhzczlvdmg3TXJO?=
 =?utf-8?Q?69mUUJYZlalOYiQNoyFZGxx8y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf4d01c-973e-4205-2cd2-08dce3deee3f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 19:09:40.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2B5fBCJb0ifowEcWslU+j36y0EDI2/KXVE5nZwov2gfu4r7k6KWzzOkk4Qnc9I2SfxV5OPSJXTpjafMZ/h2A9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

On 10/3/2024 13:51, Harry Wentland wrote:
> 
> 
> On 2024-10-03 14:23, Harry Wentland wrote:
>>
>>
>> On 2024-10-03 09:47, Mika Westerberg wrote:
>>> On Thu, Oct 03, 2024 at 08:42:21AM -0500, Mario Limonciello wrote:
>>>> On 10/3/2024 08:27, Mika Westerberg wrote:
>>>>> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>>>>>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>>>>>> Hi Harry,
>>>>>>>
>>>>>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>>>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>>>>>> my system hung at boot. No meaningful message showed on the kernel
>>>>>>>> boot screen.
>>>>>>>>
>>>>>>>> A bisect revealed the culprit to be
>>>>>>>>
>>>>>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>>>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>>>>>
>>>>>>>>        usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>>>>>
>>>>>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>>>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>>>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>>>>>
>>>>>>>> lspci output:
>>>>>>>>        https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>>>>>> acpidump:
>>>>>>>>        https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>>>>>
>>>>>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>>>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>>>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>>>>>
>>>>>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>>>>>
>>>>>>> Do you boot with any device connected?
>>
>> Great question. A Thinkpad USB-C dock. When I unplug the dock at boot it
>> boots fine and when I plug it in later the laptop charges from it and the
>> dock's audio output work fine.
>>
>> In the midst of my experiments I also noticed at one point the dock
>> wasn't charging my laptop and hard-resetting the laptop didn't fix that.
>> I had to unplug the dock from the wall and plug it back. So there is
>> likely some interaction going on with this particular dock that must've
>> sent the dock's FW into a bad state.
>>
>> The dmesg with the revert and thunderbolt.dyndbg=+p is here
>> https://gist.github.com/hwentland/7e25dedd3e707fdae1185d65224d4d66
>>
> 
> Apologies, that dmesg was from a build with a bad .config and has some
> FW loading errors. They seem to be unrelated though. This is a dmesg
> from a good build. It still has a wlan FW error but that shouldn't have
> anything to do with the problem at hand.
> 
> https://gist.github.com/hwentland/867f7afbf3df20547a877e794a8d8e6b
> 
>> I don't see any PCIe tunneling option in my BIOS.
>>
>>>>>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>>>>>> but from your lspci dump, I do not see the PCIe ports that are being
>>>>>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>>>>>> somehow?
>>>>>>
>>>>>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>>>>>> tunneling, and I agree that looks like the most common cause.
>>>>>>
>>>>>> This is what you would see on a system that has tunnels (I checked on my
>>>>>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>>>>>
>>>>>>              +-03.0
>>>>>>              +-03.1-[03-32]--
>>>>>>              +-04.0
>>>>>>              +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>>>>>              |                               \-04.0-[36-62]--
>>>>>>
>>>>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>>>>>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>>>>>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>>>>>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>>>>>
>>>>> Okay this is more like what I expected, although probably not the
>>>>> reason here.
>>>>>
>>>>> Are you able to replicate the issue if you disable PCIe tunneling from
>>>>> the BIOS on your reference system? (Probably not but just in case).
>>>>
>>>> I checked on the Lenovo Z13 laptop I have and turned off "USB port" in BIOS
>>>> setup and this caused the endpoints 3.1 and 4.1 I listed above to disappear
>>>> but the system still boots up just fine for me on 6.12-rc1.
>>>
>>> Okay thanks for checking!
>>>
>>>>>>> You don't see anything on the console? It's all blank or it just hangs
>>>>>>> after some messages?
>>>>>>
>>
>> It hangs after some messages.
>>
>>>>>> I guess it is getting stuck on fwnode_find_reference() because it never
>>>>>> finds the given node?
>>>>>
>>>>> Looking at the code, I don't see where it could get stuck. If for some
>>>>> reason there is no such reference (there is based on the ACPI dump) then
>>>>> it should not affect the boot. It only matters when power management is
>>>>> involved.
>>>>
>>>> Nothing jumps out to me either.  Maybe this is a situation that Harry can
>>>> sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to
>>>> enlighten what's going on (assuming the console output is "working" when
>>>> this happened).
>>>
> 
> I sprinkled printks but don't see any on the console.
> 

You said it can work properly without the revert if you don't boot with 
the dock plugged in?

How about if you unplug it, does unhang and you get everything flushed 
to the console?

Or maybe magic sysrq with a backtrace (l) can help see where something 
is spinning.

> Harry
> 
>>> There are couple of places there that may cause it to crash, I think.
>>> And the __free() magic is something I cannot wrap my head around :(
>>>
>>> Anyways, Harry can you try the below patch and see if it makes any
>>> difference? Also if it does please provide dmesg.
>>>
>>
>> The patch doesn't seem to make a difference. Same hang on boot.
>>
>> Harry
>>
>>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>>> index 21585ed89ef8..90360f7ca905 100644
>>> --- a/drivers/usb/core/usb-acpi.c
>>> +++ b/drivers/usb/core/usb-acpi.c
>>> @@ -157,6 +157,7 @@ EXPORT_SYMBOL_GPL(usb_acpi_set_power_state);
>>>    */
>>>   static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>   {
>>> +	struct fwnode_handle *nhi_fwnode;
>>>   	const struct device_link *link;
>>>   	struct usb_port *port_dev;
>>>   	struct usb_hub *hub;
>>> @@ -165,11 +166,12 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>   		return 0;
>>>   
>>>   	hub = usb_hub_to_struct_hub(udev->parent);
>>> -	port_dev = hub->ports[udev->portnum - 1];
>>> +	if (WARN_ON(!hub))
>>> +		return 0;
>>>   
>>> -	struct fwnode_handle *nhi_fwnode __free(fwnode_handle) =
>>> -		fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>>> +	port_dev = hub->ports[udev->portnum - 1];
>>>   
>>> +	nhi_fwnode = fwnode_find_reference(dev_fwnode(&port_dev->dev), "usb4-host-interface", 0);
>>>   	if (IS_ERR(nhi_fwnode))
>>>   		return 0;
>>>   
>>> @@ -180,12 +182,14 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
>>>   	if (!link) {
>>>   		dev_err(&port_dev->dev, "Failed to created device link from %s to %s\n",
>>>   			dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>> +		fwnode_handle_put(nhi_fwnode);
>>>   		return -EINVAL;
>>>   	}
>>>   
>>> -	dev_dbg(&port_dev->dev, "Created device link from %s to %s\n",
>>> -		dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>> +	dev_info(&port_dev->dev, "Created device link from %s to %s\n",
>>> +		 dev_name(&port_dev->child->dev), dev_name(nhi_fwnode->dev));
>>>   
>>> +	fwnode_handle_put(nhi_fwnode);
>>>   	return 0;
>>>   }
>>>   
>>>
>>
> 

