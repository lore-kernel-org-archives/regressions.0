Received: from outbound.mail.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7D1D1510
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727890959; cv=fail; b=j5LtiBEiOP8jg1IswWgFAy2g9goV5CLViJrTtFBbvUVlYCdvm+V1kVgH38j2qQTT3CRheaj/S0yuvzJ2dQxAgn0vRzmOMdDbDCm0irnqapHVNzYCpTToBgyIQ9Zlw15sIp3WnUnXUCmqH13Ucn6JmnA8tMRnQkMmSwWJbVsjKhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727890959; c=relaxed/simple;
	bh=BQLpEblP/DwhaEkRKjEat6HguhqwXBxu46IVQRVPVBA=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=BNfiwyaHc06HLWRJpbChe+NAnICYzqC4bChJv0jU3VEejUDBR0k4iXsqWOVAcIEijat8m+MDpTHyWMKcxvBfn+WdZIGGNl44Rqj9pqQUYxX0mlEvYktRvvUoPlKwl7mVVgT2Y+lEgwKKBgvHrJnpJuMbU787zKQrtiqOaZkTy4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CHxKblEe; arc=fail smtp.client-ip=40.107.243.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CHxKblEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXdUTf9tcjAopr2R4E4cNQ+y0UQoCMNrTV+/u1yV+HTWKz2/+O8sY9+V2TfHiHXwyO2/pp8kXlpyc83bzPeNfomVjtJFnDlnhzfTTXQBL/iqBc3q1t1o2r7qprn0iXO0fqWIHUtA5t+p04gKOgwWGIGxV/Yb+LcF+7S/MlsA9ndnj3RmvlGffSG9LUFEILFc6yzcumtb1fKoR4AL6zl5MFOeFNGv2BQjLjWYNSiL3gM9OnsZwNalpQvawDr+lGXQBM2YX6nPi69YQxU/chSG0IdiEQEwk7P3NNaJfLqO92hYzraDbyH6E/xcFGLUSE66eo8buIa1eOnA4AUY1tul1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSYGsYySsaTN8osn4qJe3rNF3nypnyYnKz0TdxknT4Y=;
 b=JsfgooVlQ9y5n7KUSoR82g0wYkQX+R98Ma4OIVj7h/l8uEQnRlAXhKeJAeKbGVhaJaDayyXYRgnbZ9IfWE1eCFQd5hTeysowULpJBivPqjGS3Sl6FDqgS3KquA7yu1ZNNWN8WrBB1QgO7UBgoELYwcZ1hRRJb2I/7rUJ9NX/LpTflRBUJVNJYedZ+Zu/FQmmDUpypaMShQtaDzttsaaFMeLjGrG+LAFZ5sZQwvnFGTbwVfQFLrTsylicm041BJGV0xMrdDq5sdzwG9MwIS7FPKWWKko+s0srx2DleBZv9wx4Zzx5cHfBw2LyTst3g5RruPuOSkpsjoOHv3dupctJvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSYGsYySsaTN8osn4qJe3rNF3nypnyYnKz0TdxknT4Y=;
 b=CHxKblEeDhtZRdSXUsUoasIFJ+XTxQQ0l1L8HFzTt8yTJdVLNGLEVtaersyC6zxlmL+pbo3PUNjNgcOzf78U0SnfjyNetkLw56AywDdqjtHq8AC4dWLiC+CnOBT0S9rMgb1D0bdl+NcpSl0YluL1tFscs4jK2UQ3go61Rfd2CaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.27; Wed, 2 Oct 2024 17:42:34 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 17:42:31 +0000
Message-ID: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
Date: Wed, 2 Oct 2024 13:42:29 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
Subject: [REGRESSION] usb: acpi: add device link between tunneled USB3 device
 and USB4 Host Interface
To: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Cc: regressions@lists.linux.dev,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 mika.westerberg@linux.intel.com, Raju.Rangoju@amd.com, Sanath.S@amd.com,
 Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::6) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c45ca4-b857-414f-00dd-08dce3099763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N29nMis3ZGc2bWJha1YzeGtnZ3lvb1ZxU2FwU3FTR2tTNWd3OW5MSm5pZjNq?=
 =?utf-8?B?Y2RrenY5MGUxQm55TEdiU1RyQlRRYVdCZkFjQ1hmQXZOTjcwc0dJa255K0Ix?=
 =?utf-8?B?SDd0VFRiSE40SDdLNSthRk9Wd1VDTUtZcHdsTEFzMmFsVk9ZbVE1QkdncVI1?=
 =?utf-8?B?NUhRU2NJdWRsT3BJSFpmNFpSYXVSWjZ6VU1OVWRLWE4yZFlsZU9GVldpKzFV?=
 =?utf-8?B?cmdvTjBVTkRaNmJNWDhuZHkzTXBXOFVRWTZCbFE5UjNrQS9qTWVoVjlwTkNV?=
 =?utf-8?B?NTl2Y1ZCdHdjcVZxanRnbE81bEVsQW9RTnB6YmdWNEJkcDVCbHVONlNzc2Zj?=
 =?utf-8?B?V3kvZ25nQ3hPc2haVXRCaVh2OHlQSEpOUjJJVzdZaDZNc1pxTmVyMnlud1p4?=
 =?utf-8?B?UkhncjlML0xCTTRQUThEbEFWNktvVlRTdzh4YkF0WU9uQW14a2FZRkhHOVgw?=
 =?utf-8?B?YnZCUTR1cXp3dmMwcmJkTWw5VlU3b052YzZMUWdHdHJzMWhoK1hvTXV3eXkx?=
 =?utf-8?B?QzkvSmpZNE0wT1BSZUJjVVhVdk9FN3JvMGlsZForRmtFSlB0aDkvUEk4MHVz?=
 =?utf-8?B?dFlienVaWmhqaHkvdEVuZ1FJS1BaRUtNSmE3WURRQVRnZDlPT1pncVBLWFdD?=
 =?utf-8?B?U0xTVUN1NTZpclc3WlpZSG5OdlM3bU5zZ0loSWwzdnNDMGsxb1JrVkxrN0xu?=
 =?utf-8?B?TmtHTmZ5b3VudThhNk5VUkZBMngxQWh4bVRFSDllVmQzMUtDRG9ibWNnY0VE?=
 =?utf-8?B?NFAvVnNJcXd6NVRST3crRHdEa0VqVEh1ZUVVVEFKdDVzZUZldG1zVnFUb1Ix?=
 =?utf-8?B?Vi9VNjFWeDFhWWtRU2MvaGI3MzVlMVJKbGpJWEdPQ2JNRnZhdlRyZlB3eXdM?=
 =?utf-8?B?VnRIU0JzTGt5R2YyOVdYUjJpNVZWd09yeDd3UDBiZnJoYVgzTVBHcXE5Nkx1?=
 =?utf-8?B?dFpTMlNVT3JRcVNIbklkVDRGMnVLUkkyakhiSTlZM3FjR0QvUFQvVytWMEk3?=
 =?utf-8?B?dGZVTzFBSjVjZmViR1RFZG9UelNoRGFSUDVXVWhPSVN0QVlHcVNQVmRqTDd5?=
 =?utf-8?B?UFJWUHl1VnA1dDBmR1luNHZLcDZYK0lqVW5CL3hJak1nNVF1TVVJZE9KVXdu?=
 =?utf-8?B?S1dVajh1RHYvckR3NFBWdVBZZXJjT2VwZ2k1a0MwTzBTVTJJdzZhQXVVTGFB?=
 =?utf-8?B?MXkwR1o3V2IzWUJLMDhxR05SK3htS3B2cm5Wc2hMcnZVY3orcHpSNDk2WkdC?=
 =?utf-8?B?SUw3ZU9wODkwS1U0bXB6cDhJcUFaWnpSMm1lSm9GVkpjdzVaYjJvTjZma0ND?=
 =?utf-8?B?U0ZGMkRVL1ZmQjFPZGpnNUlzbDhFOC9XVmFIUVVqdHIzZVdQSTg5LzViVVp5?=
 =?utf-8?B?SW0rRjB4NkNJalJnTVNGNnY4bGxBMmJxUkErNHBuOG1vb21mc1dWdTJmTlZF?=
 =?utf-8?B?bTcyUk82R2tFSlZ1NHprZ1VnQnRSZ0t0MDEwYmpWMVNGcGNnbHo2NEhCRHVw?=
 =?utf-8?B?SW5Sc21TTEs3THZBTWwxelFqZEYwRzhuT1BrYnZQWlJtSjlyL2ZLSTlFVEM3?=
 =?utf-8?B?enZYamtzUmxITkxuOXhUbDM3blp0c2NvVUYwRmJkK0xyaUVtc1hWWmxLN1VR?=
 =?utf-8?Q?RRhjOlVI+1XdXkaPnyBbKsmY1yL+Mr8CFO1gnlQEuoQs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmEvcnAyTTNmTVU0NFo2clN6VmxUbkNqR055T2kzam5IZ09pcEdtcmtkbkVD?=
 =?utf-8?B?RXB4TEZYSVZGVjRNNEg3b3NadFpremg0VjhCbllaT3pMZXVmcXpZSW5Ia0lu?=
 =?utf-8?B?QVJsZlhFVEQ3T2xnbzZ4aUxJZWFzTGRiOENLdkdkUDR3RWplYytWaWEzVE9k?=
 =?utf-8?B?YU5JVkJ1M3hCZzUxS2NBR2NaSC9MdzBYcWI2RG51T1p4Z2J1UStvRjN0L25w?=
 =?utf-8?B?K3pPdGRKcHI4emNQbjZLVExxV1FSWndQMm9Uc1NYQTM5akJzNmZwRk5zeUh2?=
 =?utf-8?B?aGdFaVBNSlZNUW9UZWRpQmJwVzBKNEdrMHlyUkhVSjRva2ZqOEx3eUE2UDZ6?=
 =?utf-8?B?WkM4R3F5dk5JSmEvd2hCTC9Na2dCdW0ySTIwYnZSYUdPRUwrSm55OVFrZUZW?=
 =?utf-8?B?aTY3alNWeHZmUHE3UWNieWJGb1IzOWF6eGZ3WU8zZ29iY1Y4eXJPTUp5eGxO?=
 =?utf-8?B?R3FhRlozTDM2d2ZKMVJYckdzS2cvcFJUcXN1dlp6RnVpaFNpcHIrR2padWVL?=
 =?utf-8?B?bXp2UUQrd1VNQWV2Rm5OYW1HbEtFMDhFOE5CS01zaloxUVIzTkZlVU85L0lG?=
 =?utf-8?B?dm9vUkpRaUpkTHBhb2xUS2R1WDlYZklGdlhNUWxxc2RxWkw0Y3p3SzhKOUpt?=
 =?utf-8?B?RUtWaTY0ZXhlUFMvY2pDMXpISFpoMk9Ka1hPa1h5c2hHS0dEMUc2ckZRclVB?=
 =?utf-8?B?dVVHci9ENHpsUjZpUU1rdkh4akF2cG5sNEpTM1VtTXNkdml6ZE1xUWU2Njlo?=
 =?utf-8?B?S1lxeFA2SDczdnJaQXVIU1RKS3YzSERSVlkzS3RqcGwwUzVXNzFjVVhwbEwr?=
 =?utf-8?B?V0dhZzBsbjR1QmFjTVRBdUYxWERkOG9TbUdaV2pRUVVEL2UxY2FqNU1IWE1q?=
 =?utf-8?B?Q2VXbGNrbVVLYk9IWDMyV01NWHFQaTJMRGp3Z0ZHc29zUnpHK2NPSXVRVzRv?=
 =?utf-8?B?bytydnRYTTlNUm1xWUJ2NGZRUi9GaC8yRUJ4MnBsZkcrZk1ieU5qcVBFOFcw?=
 =?utf-8?B?QUt6azgxdXpuWHlmRThVb3pVVkxNSExGYlhOYW1NWVRVd1lZbmV0YlEvYk9W?=
 =?utf-8?B?WHZPMEw1WVdRRFpwTWxYS09HZHEySXlMdXRUM2J1QmFtYUlRVU9Ib3AxNXZZ?=
 =?utf-8?B?RkNaQnBiRlFXbUoyQnBxa1dyejk4T3R2eXg0SjFhR2hpaXBtVXZncU84aVRR?=
 =?utf-8?B?RC84MWJRN2tKTmVPeW1NRlZ2TWFWYmM3akV3UG9hdi9DTXV4eklwZEp0eUNX?=
 =?utf-8?B?REhENzQ1dmpxcG5LU1YyVi9HYnFZdU54d1M5N0FNNnpnS0UwSmpIQ1dpVFZD?=
 =?utf-8?B?aE00b2ozclVyODdjN0hKVStNeldtYWhxTk1SeXA0V0ljdTlJbm5UUUtvMnRj?=
 =?utf-8?B?TnVDTGFxb3A0RHRkRC9nTDVKTEoxa0EwUHF5cUZzUjBPbWtMNTExVzZieEl3?=
 =?utf-8?B?dFl4bUdnQjVweUdQUnJpbEJDNU5oclJJRXpVdnV5MVNVQklBL1I0dHM2UzRE?=
 =?utf-8?B?Z0JoTlJtOWlNVm02WVJYNXN4bkRycktHQU9CMGk2Znk2RDNYWUxkQ1VuNXg0?=
 =?utf-8?B?bEYzL0kvQ1RqUm40VlA2dmEyWjErazdUV3lsLzlUdmh6Q044VEtBbURCYkJi?=
 =?utf-8?B?U1BEbHA1OHUrNzhrbFRhRlYwZW9sZUNvKzVxQnZVMGh6Wk1UMnVHVmJnMXlH?=
 =?utf-8?B?UW5vOGZrZDNVa2xSaDQxL01LNlhQcUZoVEYwTFU3WUwvR0hlZllGeUtTQU5Q?=
 =?utf-8?B?VDlLMDhFZkVjQ2lMQ1djdjJTQVNZb3lyQ2ordm03cHJ1SDdCRThwQzNvOXRa?=
 =?utf-8?B?RVN1T2NNWnhtelFVcTZBbnJpL042ZlJFM2xSRkZIVXNuVzBqNDA3R00zNG5i?=
 =?utf-8?B?eFMva3Q1VENoTjhMdnRGWVpzaFJsRVhuaDgyQTBmR3pFdUFpdGVIemhhQVdr?=
 =?utf-8?B?OWtITHprQmU1S2JxRml3Wk1LRHVFajhOSXd2eEtvT05uWTJSNDIwWHlFaGtB?=
 =?utf-8?B?RHh6cjNvTURSR3hLN0JQMm9MQitHUWJ4YW9TdnVuWkFVS3Jjdkl1Q0hjc0VJ?=
 =?utf-8?B?V3hXeUhNa3NmQUJ2WGxyU08rMWZIa3VVd2tNTGFHYktrejVRZWx4dTRqbjFI?=
 =?utf-8?Q?T+g3YaNTdTsqVSTIC1h/y2cf6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c45ca4-b857-414f-00dd-08dce3099763
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 17:42:31.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ghJZiPBjlTZzEzUjnHBPnBWB3ZCthg7+E7ppmXeVgHMka7dXB5a/lsZgjs17BLa3+2BFXkyht1SMRu5IWoimA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046

I was checking out the 6.12 rc1 (through drm-next) kernel and found
my system hung at boot. No meaningful message showed on the kernel
boot screen.

A bisect revealed the culprit to be

commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
Author: Mathias Nyman <mathias.nyman@linux.intel.com>
Date:   Fri Aug 30 18:26:29 2024 +0300

    usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface

A revert of this single patch "fixes" the issue and I can boot again.
    
The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
It's running Arch Linux but I doubt that's of consequence.

lspci output:
    https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
acpidump:
    https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089

Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
Another suggestion to do usbcore.nousb lets me boot to the desktop
on a kernel with the faulty patch, without USB functionality, obviously.

I'd be happy to try any patches, provide more data, or run experiments.

Thanks,
Harry
