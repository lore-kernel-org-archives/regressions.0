Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CED1D8E18
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 14:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816994; cv=fail; b=TCyWWHg7uqxWq5K4ZRyDqiQtAuQpyApHhqDC2LKl2knKy2lPVP4I9Sog7l9rFzQ5VK7h8g87CLB+fry+NsDbWnMl1zCfyA30gkl8BHvLAPftKn/xLOyKAklHBmhzneB4w4nIHboYRHWGVtpWxCOQl/+daH16Ua+JjNwH0zeLMyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816994; c=relaxed/simple;
	bh=ly7UKzUyTeGT3ZlBSQd1w+B3EgoJQo1NXXSv1Ha8MKI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gMnUEkuHq5UL6HIOCHmdx2J+X1VXfGdMglVXeQDMD9E+/AdU30vc7R3kNvMU4snJrpzY5nfuy01pStpvKNkXA2FnPx4q5Fd+jYT48Nq+p8CLy+8dS3BBKzMjYShEHpJJJ6mX1G/wqXwkvqhOobue8s6fwqGTQ2DQNFY3r/cuFao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xs/kwzv3; arc=fail smtp.client-ip=40.107.212.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xs/kwzv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKq+lLo5W6IcCjquMI74LPyWbJ+1CCkfgF/wU27SvZTnWXyCMVrRAIVHp0rtBMbW/hEf5aWVMJd3aaP2lxPw4DqpamBsB8/04PJFNY/wIbFtMV912QERDzU6L6Tw7y5UlOPgjhIG38zQwuuG5CILIVKyE7247lTRj7u+NMG+vuGX05C+VPoC+ZeCEU8nOuD0aA6SkKv1nMyh9sdEwpeMIigOiaU3VlVYRtHsy1TzFmuyAAFtDEWhkthPwg0WF8SNY4a8i7S3ZfQt/BSoy18iOlapwzJ+BYdGCXJ5dHGpkIiPuc4Tx2t4veaR67qBDqNcggX/xkvPtIYvoCn8Kdt/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ma5dZstKLk7rjLKHfTRMszueoJewL6JvsUwoqRPcPeo=;
 b=wjjVgYFNY4MldK8eyYbdfp2ahWQAWocUIZhEce42Je11OBSwyTM00+0PE9pJkk5hzwZ9IWp5a2pE52oIt8p8CcGrBpf0DPIMF+xhlQxWG6dL1Of89ENij3SV7Iw0UneOVdSHL7B5FFZAQd824LL3peeaCvr9fKFZTBJIoQ+PtSLBt7ctDIjAZ19aNEExv4otXnkegD/McHKizXlrQf26VQ9EdSkxFZ9n8YbnltwX8OJItRft8/9VBSK0GK6hCF6eiZZU2Zx7Rt9AfY/Yyp7rflRGqfN/xTZcxKHDNDYbmbDXebPYwqUgsisMlv2vIMLijlFX0t6zpKTx6dqCfl8flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma5dZstKLk7rjLKHfTRMszueoJewL6JvsUwoqRPcPeo=;
 b=xs/kwzv3hdWbE21glPziCSn9NsCK7nYN4uwK+b5Gin3o2MM0MHyCl3IJJElUU/phSCZj8u0Gc0P1Wyc2clbZ4A0XwC+9dZuMEuD1eciGVAgj0r/mP+CvH34LWYIgNeeVbfHc7rBg4V7q0dDYzc0yrDHtpLt6yqqXC5twPMDZQ1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 14:29:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 14:29:49 +0000
Message-ID: <150903b3-d2b2-4931-a2b0-688e31f5234c@amd.com>
Date: Tue, 5 Nov 2024 08:29:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thunderbolt: Fix connection issue with Pluggable
 UD-4VPD dock
To: Rick <rick@581238.xyz>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>, Sanath.S@amd.com,
 christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
References: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
 <2024110542-moaning-zap-7ac2@gregkh>
 <20241105140231.GH275077@black.fi.intel.com>
 <c0fcb97d-d849-4dec-b76a-7346b1619554@amd.com>
 <da14058b-3f40-4725-827b-0e5e1e8135a8@581238.xyz>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <da14058b-3f40-4725-827b-0e5e1e8135a8@581238.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:806:f2::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: c80d5ba5-7533-40cb-e7e3-08dcfda64dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEpaWjQ3RGJneUFrMUNjcVdoVi8zemtIaFExWHg5NkY0OUVFc2xUUWNpc2hT?=
 =?utf-8?B?SDIweTVBRi9PY3hITFRHYnkyQjBVSzVKbTExWGlib2VXb3VEYWEzYTlFNVNQ?=
 =?utf-8?B?OE1RSkF0Q05DdlhPUXFRM2dmQkFqMUw4OFdZSnFCWmZJVTl5UGdLT2ZMVUda?=
 =?utf-8?B?cm90WmFMT0lHVW93NmQ0a2daZ1Q0ZGs0Zy9yRHhNK0NabUhYVWRTcGttcHJ6?=
 =?utf-8?B?YWFDdHluOEdTazNIbzVVZkRNTUtZL0tLK245c0pWckJ1bzVSMUxMbVV2RTlL?=
 =?utf-8?B?RHFMMDA1dnJUY3RYQTNRb3ZWSXhzQkVrM2dHbENBLzFJR3JNUzdXQ0t1OThY?=
 =?utf-8?B?NngyZ1lCeVFkVDhoTWh1T3hZemZFdldCR1BpS1NjRHNXK1c0NkEvZXdCbGcz?=
 =?utf-8?B?Vm9nVXgwYVRJM1JBeXpBcjBIcXNRTkcxNFpOaDlsUVU3WmorWWhKeDYrWDhG?=
 =?utf-8?B?SEtMR1E1WEs0NnVZQUtHNitGQ2NTODNjaFJuVDJQcUY4cE1uU1hkUTJjMFVV?=
 =?utf-8?B?WVplTHE0dGFsRC9nMXN0TkdkU0h6UmFWdSt0KzdKandYVmxycWJSSG5xWUUv?=
 =?utf-8?B?YnFjNFdBYnAxcmNiWGNLNmc0Q2NEUTlzSjBUYXUyYnh1eDVBU3BHc3BDRjJQ?=
 =?utf-8?B?MUJ1ZTRkR2EveDhObml2akZVQU82N1Z6dFBkamxMNHd0a1Z5eDZqQi9qS09B?=
 =?utf-8?B?QkR6VXVDaktwY2NIOFJjWTZuUzBMV2N1MFpkL0hySGx3Tk8za2ZFc2hobzVX?=
 =?utf-8?B?a3R6VlNPa2JnT3lveThJTkxYL2tTYnUyZ1c1U3pqM0N3TE4wRlp1WjdpMnhy?=
 =?utf-8?B?UUdkSEI0cjlnZ1h2bnBhNlpqSFF4bVFlWGxkSGdCb0F0R0FXQjh5Wld2Vldl?=
 =?utf-8?B?U3ZVTUtwKzZHSjRwTmtYSUE3NllQYWlHNDMwdS94V0tTei9Gam8xY3RHRnF1?=
 =?utf-8?B?TlVyUS9CL3M0NWthbGtJZi9VaUxWaU9iYzBvUldOeGxnQktFWDJYQ241cSt4?=
 =?utf-8?B?TC8zZCttaGlGUDd2SFErTnRzR2FjcWdGWlg2YzN5LzdrcGxZbE91NTRMRVM1?=
 =?utf-8?B?V0hObGVtQzdUcGkrT0NoZ3hzZ1hKVlFWZFZvYXc0ZXBCSDJVSFNpbHhIT1o0?=
 =?utf-8?B?enBtYmExV3lFZkNWZXY2SW5vSmRNWDdXZDlGOHhwSHF1WEdIeHV2WDlDSGI2?=
 =?utf-8?B?ZGJybWdSVHVzMzc0QWsxRTRJODdqd3lsV3N2YlFiMVFjUFhWT2ZXRUQvOW9t?=
 =?utf-8?B?WjNHWi9XY3ZzdWkzSklIR0wvZ215MjQyd0VPMTFmTldMbHhoNFJXa0x4U1Zk?=
 =?utf-8?B?c2htaGcwczhaeTlDbUVPalN5a2YxL1A0bGlRcTBZMlRPdXV1Z2tXRnI0aUdp?=
 =?utf-8?B?TGZ1NDMzeVBON2pBL0dUZXFQQjhBRGhtVWZrSGt4M20xT2h6aFhBbFZYaFls?=
 =?utf-8?B?N0p4WS9PMFlHZVRFQjk2RzFnMlZEUmE2YkdtQTZpNGxUUVp3RldQend2TGg0?=
 =?utf-8?B?NHg4bC84RXlPUHBjOGEyd1pPRExVRFFSYTZDVkhTbjFKWnUvRDV0bFJjRWM1?=
 =?utf-8?B?R0h3VTdvT1JlbDVJQVA0V0lyTHkybjFmK1BKOTg1eENQNHFYQTBPL0J0ZmFj?=
 =?utf-8?B?T2NQMHN0TGIvS1c3MEF5OUlpQjRSOUZjL01OeGRvRlNBMmhWRndIcmJteDR3?=
 =?utf-8?Q?6lHpZKCh8cWbLhEE/z8I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2p5bWowcG9OVWJCSjJZcXQ5ZFVQS2FCRDJyVytYS0ZHcGptZEZOa2RrN2hR?=
 =?utf-8?B?SHNMeURlVXFCTmRYNnIvSU9SdXhVRjhpS3h3ZUxZUkRMR0V6cnh4dXZlTUJY?=
 =?utf-8?B?cUYvQ0lKL0pTK2RGMmY3UFF0S3ZIbEl2Y0psNjNpK3NyZzZtcTh5bysvUWh1?=
 =?utf-8?B?ZmplcHNGdHhMaU45dVdWbVVuMlg4VlIzY1JEZW5DS1NjTTdySHFsWFhLaTAw?=
 =?utf-8?B?bHNDSFJZVjZpZ2p4M1BnRWYvWTMyb3AyTDZYZEZWVlh6MzhIS0NPQndXN3Vj?=
 =?utf-8?B?d2tpOC96ZkEra3I3VDNFYmhNS0lOdFdQcmhPQnJpamg3ZU9BRDVTb2pRUFF6?=
 =?utf-8?B?NUxBY3pSMDc3dzUzUm92NHZ2cVdETmx4M3lPc3A3Q2kzRlZxcE5mSXVnR2M3?=
 =?utf-8?B?NlNQQ1ZyaXJkM29ZQXZ5TzFTRzg0dlFqVW1iMXBTV0prT1JVbjdJdmNpR1R2?=
 =?utf-8?B?VnRCbUQyNzBZd1IramNrUkJzM2ZQeDBlL21SbXMrS2tMSHJ6WXJBSHo2YkFk?=
 =?utf-8?B?T2lITDAyOHAxNGZzMWpvRjROR1ArcmpEY2ovUHRoTy9tbERTeHBsZjMzMlFu?=
 =?utf-8?B?YU8veUU1aSsrK2FWRUJVbXpTNjYzRktkZktaRXk0K2RCYXpmVEJKYjRsbU5i?=
 =?utf-8?B?TVhwdExSL3dvdW1aRmpWTXNMQUQ2T0J2elpQTS9RWWtVZ29uWDZqZkkxRXBE?=
 =?utf-8?B?THB6TlNabGMxMXNsR09EUkdtNUwyMyswWmZud3N5dDN3azllU0dNcDgzcC9q?=
 =?utf-8?B?aE0zVTh0T1BNT1lGVGxndVdZdytQTU1pK25YR0tON2xpY2pmQ2lONGhHUmkv?=
 =?utf-8?B?UmdtRXhZSitMdWlKRCtHcERjeUI0bUtvRU9GTURpK1hOb3gyM25iTmp0OS9W?=
 =?utf-8?B?bUNmR2pXTnB4TWE0MUhnZWJhQ2I4ZC9ERDE5UFdBRGZDWDI3TWI3am1Xalor?=
 =?utf-8?B?ZlFpZzBnanREc3FKVjNOS0VLLy8zaGNsaEpPSjFQcy9tMDI3STQzYjdZT2xp?=
 =?utf-8?B?aGpuM0wzR1pNLytkK3h6VU1OTDVZUEViaXEzSDhqNGdubFEydnVZZmg0Z2NW?=
 =?utf-8?B?VUE1N3paelU2NDBYZXBZZjh5U0hGSTU2SWl2TFRsWkpSN1IvSXB3ajBQYUVD?=
 =?utf-8?B?TnZmdVorWGMxSEQ1N2pvZEZ5cWNTVi9kTnZ1Q3UvR3NHWXJOWHpLMmg5UTUr?=
 =?utf-8?B?TTJwR0ZGcnRYaVBOclRRMFl3K3FWcmYrcVBSb3BZK1dHUkhIcmZFZldMRGhj?=
 =?utf-8?B?YmZqcmJwVnErYklubXZVbnpSR3F6ZUlPUlZ0aG51aTJuQzRmUU9ReWdReHph?=
 =?utf-8?B?bEJhQVdBalVnWTlSdytkME43c1pYZFBkVDRENUhETDhaNC8rajFiK2E2NGFQ?=
 =?utf-8?B?S0JNNFNrdkhFK2I2NzJVN1pIVllNdXJlT1ZNQ2cvS1EzU2tmbmx0RG5xcEtF?=
 =?utf-8?B?MmRTc2xPbXJSWWVERnpTdEJBTjZ2eEZVV051d251Y3VlWW10OW1RUnlhZG1X?=
 =?utf-8?B?SHFjMFF4aTNXUTcxUDE4UncwVlBRc3cwZ0wxbHlvNHlIQU9pbXdFVElmZXBy?=
 =?utf-8?B?dXNxLytBZmJuY2pnYTFoZEx0YnA3MlAvYkFiUS9oT1Fma0pjV3h6WHpYUFBk?=
 =?utf-8?B?U2w4SkdPNWQrdnNUNzkzM3lrc05FZkFpOGR4MEJYM0hIRDFvb0sxZ2hWcEF1?=
 =?utf-8?B?clpFOGR3RmVWYzE5ZHJtQ3VXRkxZS3VnU0ZhdEp4b2ZOQUJLY2F4bGJkanFr?=
 =?utf-8?B?MXpsYk1xcldtRm1ycWRMWEFYZld5ZnViQmpsTVVWZ3hVQ3IvZWxLdEN0Vk0y?=
 =?utf-8?B?R0F2NWtLTnB3Rmt1Q3VPUVN4d3lIZ3hscWlpSkJOLzM4aU9JbHp1T0kzREln?=
 =?utf-8?B?Y200bE1scXJLK0FvYkNEcVp1dXFSSDB1UURBVDR4VVRVVkNvQkNvdHRERFps?=
 =?utf-8?B?SEdPRTRzWENlZG9tRUk0bkNldWY3QWpYbGJ5Vm9UTThNbC9WK2ViM3NKMDIz?=
 =?utf-8?B?RmxXaktXcFpyLzZjM0dHUnN0QUhwRFkyaWh2UFZGWWZWbERlWEZ1ZW5vN3Vm?=
 =?utf-8?B?TitEcGs1RW03TnVuUU5iUDE3bFgrZVl1T1h5VFBaaTV0T1pTSEg4dXNHSlRu?=
 =?utf-8?Q?/ZK7hmBts9Obrr3pshDxFxAKG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80d5ba5-7533-40cb-e7e3-08dcfda64dbf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 14:29:49.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BoYP4UzFxxsnAsyiTAWlybDzJAnkxTCnx8ILCkywR1Dn7FU/854e3zBiomDvBbIzTvB2ISjAqv5OB76ByX+Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830

On 11/5/2024 08:25, Rick wrote:
> Hi Mario,
> 
> On 05-11-2024 15:21, Mario Limonciello wrote:
>> On 11/5/2024 08:02, Mika Westerberg wrote:
>>> On Tue, Nov 05, 2024 at 11:54:55AM +0100, Greg KH wrote:
>>>> On Tue, Nov 05, 2024 at 12:31:57PM +0200, Mika Westerberg wrote:
>>>>> Rick reported that his Pluggable USB4 dock does not work anymore after
>>>>> upgrading to v6.10 kernel.
>>
>> If I'm not mistaken Rick was talking about a Dell WD19TB dock which is 
>> TBT3, not a Pluggable USB4 dock.
>>
> 
> To prevent any confusion; I don't own any Dell WD19TB dock. I had these 
> issues with the UD-4VPD dock.

Oh!  I see, you were saying a "me too" to the thread which was about 
WD19TB.  Thanks for clarifying.

> 
>> Nonetheless I wouldn't be surprised if other docks and devices have 
>> problems.
>>
>> We have an internal report at AMD of something similar happening with 
>> TBT3 storage devices.  After this lands I'll ask that team that 
>> reported it to see if it helped them too.
>>
>>>>>
>>>>> It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
>>>>> access polling delay") makes the device router enumeration happen 
>>>>> later
>>>>> than what might be expected by the dock (although there is no such 
>>>>> limit
>>>>> in the USB4 spec) which probably makes it assume there is something
>>>>> wrong with the high-speed link and reset it. After the link is 
>>>>> reset the
>>>>> same issue happens again and again.
>>>>>
>>>>> For this reason lower the sideband access delay from 5ms to 1ms. This
>>>>> seems to work fine according to Rick's testing.
>>>>>
>>>>> Reported-by: Rick Lahaye <rick@581238.xyz>
>>>>> Closes: https://lore.kernel.org/linux- 
>>>>> usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
>>>>> Tested-by: Rick Lahaye <rick@581238.xyz>
>>>>> Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling 
>>>>> delay")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>>>
>>>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>
>>
>>> Thanks!
>>>
>>> Applied to thunderbolt.git/fixes.
>>
>> I'm a few hours late to the party, but if you update the commit 
>> message for my above comment feel free to add my tag too.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>
> 
> Kind regards,
> Rick Lahaye
> 
> 

