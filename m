Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437815887C
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727962949; cv=fail; b=LWVLye5vlC5yj9KeHNixfPzEKRVjt71Qf3tGTglMOensIimvMSZ/ZGvOlD5Q5jp4/sZ41p7ydNMYl6TRFM478blTamTmg92TLdt+du8ZW748ZtOH4zo6wUBjCz8ewPO1em9kVnjsB6z0agaUKS4RFL7uwdzJ2tZl8SuOWL0aECw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727962949; c=relaxed/simple;
	bh=7HLUl6I4vxlHtTrplRHqdjySm8F8Av2wMYlpsz0lYN0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AwyfqEl9fDk/AEtPwVcvX6czpMHugQ1DWTy0R/JXHmn54eE0w/cLzc2oWiHPinSHPk4URpVWSCjjZ1g+p26yzo9DvDxSaAzMqNGeeycTIA37+WxaqAxHh8amQR2ciKk+Lth0/iPZSt4L3Bnrm7jzZrjtgPMj6WGvzEuJOBFHAxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EKKWG5wk; arc=fail smtp.client-ip=40.107.212.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EKKWG5wk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lucd6thHzYRUva2dlmu/9+EJhGx1IMOezB65unjRLCPR1yLqBn44HckfgkQtl6DeGqlbTtRyf33+LLCdYnqEkWxb69s+IA7bmuxXfShmMBIHe4xsiOlYF3W9QrT6wwe1bL/hmRo4rgHvG2fkbF2iBOEpujtHCGdm06qrbRwOHijX78BSyZJ8Z5pvLTrBeCHdzRCcnIl09JZdnDljV5gFE/+x6tQ9HdwdUX1uCoMzbmwC2me5+GX8xQoPBXqViwlo+aG0d+9ouklwfHQ/8EH/ZQwe6MSh0uPrLSkjMimqKGg0he8TkN45cbupRi9Kyf5jqE5tqHOaBahvy9Hx/I1gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmMnS1tkAUlkHWyJCPahnTWgSRa6WfUyrCmGLqjpBRY=;
 b=BWcr4Y/xwWMCI2IN2h6eRjhfggcDcLomC5EI3S0a4dw5+/vmhDWyBexpGIaCyUUht+ZFYQTNE4OVKabzj6BIgU2M9b4G1pL4t9VfslO3UjniHGJ4kgBvXYWZRcGPL6FY3X3e7KEo7AxrP1P05G/Jot/pvR2vQ6S2jDEbSeOOrdfsB/a8VVTQjzzX10lAGe3IYkI0upCI5p6Dz89FeAlHzWe6Y0vQqhx7te7QAy4jMixcXr4rpHzIGSIvw2owtQn/+xMR8/ZPIPYZtiSVpmsk5imcf+RiP0OhnDW2AfLLd1jDmCTRsCGNS28JrgZoeNbKwKsd+nDX0e+z8Pu1GHL/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmMnS1tkAUlkHWyJCPahnTWgSRa6WfUyrCmGLqjpBRY=;
 b=EKKWG5wkbEMgz1FzUccXIoQNP9dFylEjWYIg2hP/jyDxJ+xbU3YZSOIzAfhHN2D3TO4cMfjyuHKhiTGL7n8Bac3o7TwSQzXqf1mikzaw9I+k5FORBlTA86KubHIF+FuYSp7Zk5FXJqGRY8USqgIm9bd7q1Cx352hAj/IJQBkjjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7850.namprd12.prod.outlook.com (2603:10b6:8:146::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 13:42:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 13:42:23 +0000
Message-ID: <797f52fa-ab9d-45c5-828b-9dcaf75fcc83@amd.com>
Date: Thu, 3 Oct 2024 08:42:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com, regressions@lists.linux.dev,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
 <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
 <20241003132726.GN275077@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241003132726.GN275077@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:805:106::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: c95a0e41-a9e9-4fb8-4771-08dce3b135c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDBCRGJFaFg0Zi9tbEl1RFhjTGQyR25EbmR0WnpWVGVsTGR0MTN2NURPVVZp?=
 =?utf-8?B?aEZITDVsbmN3QzlzeS95WnRjN1dQaG9KUXdtdXo1SHFJdG04amdYcnIvZzFI?=
 =?utf-8?B?OWpuTEhmMHlDQzNrVWZZOHVqczR0YUdJUTkvMWlTaVEreW51OUtaYjVDcWJH?=
 =?utf-8?B?TmJZbklUczRoRmNxSEFETUI5QzRFbmpWRWNrRUtsQUVoWThzcGQvWDZDTkUv?=
 =?utf-8?B?ZlNmUUhRdXhmaFAxeGF0azhLWjlJUDlITFRuWm1nYzB6c1IrcG1RTXBvQWVL?=
 =?utf-8?B?TFBnWUNkd1ljWUhZMVhEdlhzdnRmQW9pRDFTTGtkbFRuNHljaCtSVW5oa3VM?=
 =?utf-8?B?cWh0Ymh1VjNNTXRETis1UEFPRGVIMGE4U01Da2VPU2R1VmFHNlJRQmFMb05K?=
 =?utf-8?B?WWlSTGtjQi9pcXdXWnphME5MSlY1ZFd3ald0UmpwTUZiZ2dEYkVQaUxVOW1v?=
 =?utf-8?B?Mmc0UCt4V2gxNkI2WENxR0kxeldEMHdCS3YrUlowblFGVDl1N2lRWkZ0K1Ro?=
 =?utf-8?B?cHE4MWd4NmxUZ3FjdEJwb2ZTMWE1TG42cmxtNWpLNDZzQzFtRWpISkZNNjkv?=
 =?utf-8?B?ZEVRdVMrVGp5WnBUTWhCcWMrTk5GS0FoSUdRR25jR2dFc3NUUE9DRUJsM0d1?=
 =?utf-8?B?VFpZVVBoSU5yVVZYaVJZZ3ZHL3VEbHZOaDVEK0Y2UEY0OUhrbXgwYzJhSjZw?=
 =?utf-8?B?OVpvS0oyRWNPL3IrZ0I2Qk5ZcG5PWklyNjJpYTdlMTh1K1RobmJ4Q3Nvajdl?=
 =?utf-8?B?YXRza1FEZ09tUHljTjlaRGh5dzBMZ0lzSnBPQzMwVEZ2T1NuaXN5bFM2RERL?=
 =?utf-8?B?LzV4Z3ZFOTl6aERlYndyMzFRZ0NjaHNudEE0YXEzVzJaS2RqUGx2aHBkUzRM?=
 =?utf-8?B?ZWZYY2pOZEZDTGNXS3VCQjJoYnV2T3Vsb0Zyd2x0N0Y5M0dXK1JEVnlrS2sz?=
 =?utf-8?B?ejhYL0VHQ0Nob2RESk5vUys4cWNudjRSbm5XYVQvSEZvY2h0cFpySmJINlB3?=
 =?utf-8?B?K0dsRVFYR3RHbGFHcmRxS2orMitYR1A2VllKTnZmcUthMDNlVkhYTWxpQkxk?=
 =?utf-8?B?YzNMWFJTcjJOcWh4eWVxV0JqR01wZ25TOTdPemhMRUhUcUlMSTBzQ2dvQ0VQ?=
 =?utf-8?B?NVlZQ3RuWVVrVXdGUDBpa0tQUUU1SG51dEg2MVcveUQyRmtyaTVjYnhBOW15?=
 =?utf-8?B?NXFMVnBublhSTUtSV1dZL0tka1Axa3BjTS9CSXJJanNjV2RILzVrTlFoZkQx?=
 =?utf-8?B?c0NLSVlWVXJISkVZWFRzNzBBYnoxVWJyejluRmsyQmpkaFB2bzdqbDNIOXlN?=
 =?utf-8?B?TmV3cVR0ZmJTb2h4cnczOHdBS29kb0M4SWdYZmQ1bWJ3N2ZqeGtWWTgrblAz?=
 =?utf-8?B?RU9teFN0M3ZUbXVRV0RLQ29mNFlMbU1rYVhTSlZwTmowRDFCUnRyOStBVEVL?=
 =?utf-8?B?OU93Q0Nkc0txQXJCZjM0c3N0OHFFM2FIZVVhVWxPcHhnNlF1WmJvbXdadTBV?=
 =?utf-8?B?eFJ1TnpsbDlsdlJpcjdBNGFuZitxVmpPQnRhS3dyVkN0RnFWWkxxQlkrZjBG?=
 =?utf-8?B?d0tnZXFpNUpDc0hwaGFSL0JueXFySis3S2E2Z0s0U0tldUdzYjl1WC8rdTRM?=
 =?utf-8?Q?dJfljvDsc3G6iyOrsnwqo3mPKAst1XSgLpCfvbQ3bBHw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZSdURibkFSMm50RDJxd1dPd0VHdDMvNzU4STkzckJsNnFJR3RjNWorTlh1?=
 =?utf-8?B?bHZBb05LamMydzMycXBhYWg3NFlKZWNZUTFBRG9tUkdZVVZuTWZ1QXpJNHV4?=
 =?utf-8?B?YVNYSGhtMzdLSXVmb0NXcll1YmMvemExYzFXTXlObnNuc1hFRnc3SVFTWW50?=
 =?utf-8?B?Uno2YWtiSCtOcHVESHpCL3JqUTFLbjBMbm15YnFCTmo1ZHBMRFlGbE1vZVky?=
 =?utf-8?B?L1dHQWlSdEtVYm9kQ0xLNzZ6NE90ZG41aElmbEpVUTM1UVg3V05qUmZ3YTRz?=
 =?utf-8?B?RlFzYU84UXJPeVR3RkZnRzc3K0ZDY1lId3JtdC9DV0lnRmd1UTNMUnBYUzZ2?=
 =?utf-8?B?dlR4UzNMbEk1RnBCYUN2TU5nTGNCa3NGaXJsdGc4aXBSTzRIS3phVXB0cER1?=
 =?utf-8?B?SXNyenEvTkZFbmJobGt5TVI4Vi9ZWUM1bmlDSXhJMS9aSnA1eWFzd0ZXZ20x?=
 =?utf-8?B?V0syWkxhK05vSkRXaVlaWmpwZktES1BWTUszVUM2UGRYTnJTL082aml6bXJt?=
 =?utf-8?B?YUZyWUE3cFJvYllsRDB0MlhlT1dSNjZvNXdrS0NJaXJNWDhIWENtTG85WHdX?=
 =?utf-8?B?T0JGNGd2RnhrZ0pNYWJrSnFaY2h0QSt4ak1VSENNcmZYa0ZlWFFhNXRtMDJM?=
 =?utf-8?B?V0NxM21JWFIvbXJwS2g4MUhvY2xWekhTNTVYMDVDN0hYV0haUFNhN1c0N1N2?=
 =?utf-8?B?UDF5bmtQRnFhR085VWo1TFRkL1ZDYUJJZFV1TG1KbWdtVlFncmk3NFZPY2E1?=
 =?utf-8?B?cGQwU1NqaG1tTUJ5WHBvRWdMU2VHUWtBeTJQSkx0Rm4vU0hJQjhsNTZpeGZj?=
 =?utf-8?B?WlNRWnAxSDZQenlKeUlZblVaZVRqSHI0aEc3OC9HU0V5YUNTS3IvNE5WN0VG?=
 =?utf-8?B?Y0lHK2FTd0RXRHZFWG80UUtZL2YweFNSNmVJOFFicDlOcnZybStyWlJuWW1Z?=
 =?utf-8?B?eUQwQ08ycDJRYk05cHJxeEpNU21NRDBzaUdENCtUWGQyUEpTcjVvdG11WWI5?=
 =?utf-8?B?emZLUHo1ZUVGOEpLTElDRmRKTldmUkxvRmlzekdNQWJ1Ny9ac1VxV3dwNXVY?=
 =?utf-8?B?dHY3dmc4eUEwcFBlNzBnRUtOZ3dVSW0zZEdodlZ4RjRVSXBqSVlmTjBDVEk1?=
 =?utf-8?B?bERxSldlTWIrMk9yekhvajVkekw0U0QwL1dEakJnTjI3K2I0bGpjWXlMRCtx?=
 =?utf-8?B?cTIwUUdoSU9ETXVHeHFiRlhILzltM1JDaTVIR291dzV1NDdqeUhJSEtMTEdx?=
 =?utf-8?B?clVYN0RRcVFvM1FoeSttMjNxcHFhbnh5YUc1eCtMRnVoOWdVMUdZVVUrVUpM?=
 =?utf-8?B?ZjdiSSswNWMxUS9mVXJRQ1hoZE5nWlR1MEdFMFE0dTk3ZWVyQXR2Z09kVzJX?=
 =?utf-8?B?VXJ2bk1Sei9zSVlpcmNGOFdnb0NhYWlQMTJCV09SbUpQR1MrVXQ0ZzBRRE50?=
 =?utf-8?B?c1NCKzhQdWJKWkV2QjFJREJPV051WDE5dDI2TXBYeDZucXhtOXN2VXZKOFJn?=
 =?utf-8?B?aGJFTCtUSVNia2JvUnczQ09Sb1RvZVc1bmdidWJzQzVuU3lCdCtRL3g2RzE0?=
 =?utf-8?B?aTdvQkhudno4Z1V6MXBkczZlWFpKRkhCcVl6V2ZjZG1VUHhWUmxqQzdaWXVQ?=
 =?utf-8?B?TTlGbmlVTGx6cmsweHVxVjZ5SHZaMWs2ZWZLWXdwbE9QYzRXWkE1MEZUaHli?=
 =?utf-8?B?OUxrMDFscnc3d2RoVFZ3Y25hWEpkTnh5a3BDbHRXK3daZEhDOVBSTG1IM05L?=
 =?utf-8?B?Q0toM2FQV3hxdG0vYUZtM3ZJS3pPWFBBMzE3N3BERjFOYmxNQ0M3MlJGeWNJ?=
 =?utf-8?B?eTYrdFFpM1lVRGlZQXM5a3o2UEY2aFQ3RzE2bUJIMitOUFJQdU84L0kvQnd0?=
 =?utf-8?B?QnlGbmhyRit6TVl1dFRPOXFYcmJzdElpcnhBakVRN2FBM0VvYW1IazhhaWNW?=
 =?utf-8?B?d3RSUDhDNUtuSTFQWnVtenVPazdUdjNXVWlNVWhPbVFYNnhudm5oZkR2Mkt4?=
 =?utf-8?B?amlnZEp5cU9QUHk2OHQ4YmUxTTJkMVQzMGVFNWhERjJqNmMxVkQwalpCYVdH?=
 =?utf-8?B?ZXRySXRPWFVyd1hEbzlFQWNCcFZmbGxVTEhDdU5aNzdZZWpjVFJVaWZGRHEz?=
 =?utf-8?Q?LHfCEzAbZarkOun2oXhld9aFa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95a0e41-a9e9-4fb8-4771-08dce3b135c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 13:42:23.2964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy56XFOaJv2CpoJYvfC1ke/LWdJuDPB5nIDTONfvWoM23LK00nPBoDxOnJJEW5tRC2pyVREWhXDVbN1b3Uf0Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7850

On 10/3/2024 08:27, Mika Westerberg wrote:
> On Thu, Oct 03, 2024 at 08:10:11AM -0500, Mario Limonciello wrote:
>> On 10/3/2024 00:47, Mika Westerberg wrote:
>>> Hi Harry,
>>>
>>> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>>>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>>>> my system hung at boot. No meaningful message showed on the kernel
>>>> boot screen.
>>>>
>>>> A bisect revealed the culprit to be
>>>>
>>>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>>>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>>>
>>>>       usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>>>
>>>> A revert of this single patch "fixes" the issue and I can boot again.
>>>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>>>> It's running Arch Linux but I doubt that's of consequence.
>>>>
>>>> lspci output:
>>>>       https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>>>> acpidump:
>>>>       https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>>>
>>>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>>>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>>>> on a kernel with the faulty patch, without USB functionality, obviously.
>>>>
>>>> I'd be happy to try any patches, provide more data, or run experiments.
>>>
>>> Do you boot with any device connected?
>>>> Second thing that I noticed, though I'm not familiar with AMD hardware,
>>> but from your lspci dump, I do not see the PCIe ports that are being
>>> used to tunnel PCIe. Does this system have PCIe tunneling disabled
>>> somehow?
>>
>> On some OEM systems it's possible to lock down from BIOS to turn off PCIe
>> tunneling, and I agree that looks like the most common cause.
>>
>> This is what you would see on a system that has tunnels (I checked on my
>> side w/ Z series laptop w/ Rembrandt and a dock connected):
>>
>>             +-03.0
>>             +-03.1-[03-32]--
>>             +-04.0
>>             +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
>>             |                               \-04.0-[36-62]--
>>
>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>> 00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
>> 00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family
>> 17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
>> 00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h
>> USB4/Thunderbolt PCIe tunnel [1022:14cd]
> 
> Okay this is more like what I expected, although probably not the
> reason here.
> 
> Are you able to replicate the issue if you disable PCIe tunneling from
> the BIOS on your reference system? (Probably not but just in case).

I checked on the Lenovo Z13 laptop I have and turned off "USB port" in 
BIOS setup and this caused the endpoints 3.1 and 4.1 I listed above to 
disappear but the system still boots up just fine for me on 6.12-rc1.

> 
>>> You don't see anything on the console? It's all blank or it just hangs
>>> after some messages?
>>
>> I guess it is getting stuck on fwnode_find_reference() because it never
>> finds the given node?
> 
> Looking at the code, I don't see where it could get stuck. If for some
> reason there is no such reference (there is based on the ACPI dump) then
> it should not affect the boot. It only matters when power management is
> involved.

Nothing jumps out to me either.  Maybe this is a situation that Harry 
can sprinkle a bunch of printk's all over usb_acpi_add_usb4_devlink() to 
enlighten what's going on (assuming the console output is "working" when 
this happened).

