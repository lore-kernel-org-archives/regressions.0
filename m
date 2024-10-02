Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE822141CD
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897982; cv=fail; b=DT0l0iSuaw1CsUqiTz7uDCd0QDo4PIwxwl46Nat6KXRJW5JRZ9lpidIVGsD3zUzYvuZbaOWFUdXH1Pi7IXP+2SfH2CVx+z/j4E7CwBsvn577BMejkCgouGHC2pDzdY69D/I3kv9gTuFZ6ncZb6gH6dwJvsaqFq4QvlVQ9E6Yy6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897982; c=relaxed/simple;
	bh=Z8d1GAL8tBZyGs0XUH+L21favttwtQzI1KXj5+DZHyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hMbIV7eGh5ZpTjXblvdqEVr/qgQr8fuUJqGDLwhM2jDv5pCmAI5sqbkM+XmolJXuD061U8NjaoWZ274cxk2Ydn/Q9LVOXR2NlMEgBaYN0g/vggWK+YVUBYiIxBFTVg+2o4M2MuRarCZnJjiDIkQmNJ4eswql8U5sOSdt17j2HiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3ZiR0ZFi; arc=fail smtp.client-ip=40.107.100.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3ZiR0ZFi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCdsZEIIBjd50VpeRm1qiqP46oJRjqGsXkph7sirG7pgTnAGnXxqkefTqojddRDaueTFDknxSuW0u1ZogtLecQJTPF3rCHoFrD43DB3dHhe++TwxM38RIx+MBQr10YyTOH6Qp5HM5dSEjbBdCCb+vDlQlWbtldmOMeM8FF9E+rEbXB9ipePShGaYinLt1fv09oE5ynqXZL+Ac23C5tDQeiJiiqhvTD7I4Pc8oI5DRGcQiyO0l02ML73STMTXEhto1Ol4dHXNGoiQTo4pRiDakvL3/kRrhvV9boe8bqkvEejO7tU4n0o5LTAylK/Z0iY0Yka0bojCD5Vb9sz2b1O3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjkKZPpCRm74bg7rtUBvpH/C+b9OPVIOAbUqlYXu3rQ=;
 b=SanIjbMQRIam9ufhHO3Hx1th/8gWn8F8DZy3GB/ZB+uULsRF9aVeNp7jjpAka9Vm26YKvz7IO4PjFjBxYvNGmsXSZdvpmCurj1iijsslP5x9DUhKDIxnedhOC4owuGDiX1UxrZonTXVACqToRuwPD0y0nU0C/wUEuS8DugEzzJwIq/2AFWNp6ZVlzrmmeZwmr+yekL/bqkF3PBRbkZ4dV4hcGRzulCcAnbhBjQ0XWg6rMZ9bT277lHI0rof4DhoLmpBTiQt1HU27H0gPlFuEsPA24V5MevqhYmzLDKzCOB/I6EvgAgCv06utTDLZPPXDi3J/TBt0ZJnDUmxjLVE6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjkKZPpCRm74bg7rtUBvpH/C+b9OPVIOAbUqlYXu3rQ=;
 b=3ZiR0ZFi8HJ25fNVCm40/7fjYfpoQTnVcVzkkVPgfJlrkKrLjvDZece+9l1PJduhpb5h/ae9RZ934UgxU3GzHG6dGO5n1kWM2og9i9cR8Glpb5i75sQIiEJKNeXqTVOP+tY0svKKoSCeP0I6vXzrZXE5nJKwWfIPs5zgWycRUiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 19:39:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 19:39:33 +0000
Message-ID: <f87b2e1c-4dd3-4a5c-9adc-0786c7e3b554@amd.com>
Date: Wed, 2 Oct 2024 14:39:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Harry Wentland <harry.wentland@amd.com>, linux-usb@vger.kernel.org,
 mathias.nyman@linux.intel.com
Cc: regressions@lists.linux.dev, mika.westerberg@linux.intel.com,
 Raju.Rangoju@amd.com, Sanath.S@amd.com, Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0023.namprd05.prod.outlook.com
 (2603:10b6:803:40::36) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d02bd26-91cc-4c78-f0c5-08dce319f0de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTZLeTNHS0JURGRMUWlKN1I0eWpGUXI2ZTlVeTd1U0Y2YTJwMUZ2Uk5PQ0c2?=
 =?utf-8?B?RHpScm52TFF3Qkx1ZnY4aTNNRmlyMlI0TGZEampJS3Q2ZGdYQkpBc2pid0F6?=
 =?utf-8?B?empZWUpLRXowL1lRU0Rma1hUK2gxb2pmMlh3WVVVQ2pJOGcxR2xJenBZMVRT?=
 =?utf-8?B?Wkg2R0xHWmRNcmtxa0hBem9NakpoYmliMEpDTXc3OEVUSkljVkpDTHNjNU9V?=
 =?utf-8?B?aU9jRW5ndWZzZGJMcnFDNEt1bHhCRHkwbGdiSWtXNXBqNWZqa1VzSTNyckxS?=
 =?utf-8?B?cWg0QlJURGJZVFNRZTJmLzBEVXIxckg0eEpzL2dSWkhXOHVwYjYwRmduYWE1?=
 =?utf-8?B?eEpudlZMU3JOTWJUWnV1dlQwaDY5czhKV09JYjFybWdlZzBnck9lQlZoVjNM?=
 =?utf-8?B?TEVRcWdXUVhrclVrbWR3UnpvN0RvWFRscHByWGg4REEwUnNHZkpBcE02QlJq?=
 =?utf-8?B?ZlRiYTNIOCtKZ0tnMXBMd1c5bWNQWUh1UXpGZnNCVmorOTZUZ0pscFZqSFpE?=
 =?utf-8?B?eElMU0cvbWZIdVNkRGdCUFBwWUVPOWs4TUZnZ01FMUVOWG1XR2E3NE56ZkU3?=
 =?utf-8?B?SUpDNjFmU0hpM1NxK1ZxR0tVYjBQWXhMK2djcjhVbU9HenBERERrVFJnN09B?=
 =?utf-8?B?MzF3TFpkM3JUZmtLb2lEaHo4ZVc4Z0xwL3Ywa1BRcGhvQVArSWtjTFpJRUEw?=
 =?utf-8?B?bkxaY3hYd0FObXZhbFQrd2ZNakI3d0VOL1ZHdUp6TC80YUUvUC9lNHhIbzBU?=
 =?utf-8?B?enhxZGxIY05hRTRjWWMvMzI4cGVaZmZVYW5KdUFwY3dzcE9jODlGd3YwbWYv?=
 =?utf-8?B?ZExFRTJ6MVp4ZHFiak1CTzRiMDFIcTVlY3Uyd21WNFpzNVZZMkpGTHhPRS9N?=
 =?utf-8?B?NWJSaGY5SGJYdit4V09iVmRIK2dOTXFkSDY3OXJKWXVpVzg3akx6MFNlbW1q?=
 =?utf-8?B?Znd0Q0dlb1NEUmU0azYzSkFTTm1hNmhYRWNLc1hsc2VDalhuSHJaNTRZOXJR?=
 =?utf-8?B?QXFxZlZyNzA4c0F0TXhpdEI4N1NzMlRPcCtyUUE4Mkk0NGxFczVvelFHWjVk?=
 =?utf-8?B?NVc1RTFCSTdyR2RBbk4rT2g4SkI4eTd6RHZ1a2lsUTVBTmFmTkRaa3oyYVFO?=
 =?utf-8?B?eWRFQVAyanlGMUtsYm5pOUxkSWlKNk02V280bkNKOUd4akhjaVM0Mm5iUTdZ?=
 =?utf-8?B?eGRMVjBnMjFxYnhxK0hrcWVQeFhHdWNQamNxQ09BdTQ3Mm5veE1qSzY5OXIr?=
 =?utf-8?B?Y0Q0d0RIa0FEOHFNLzZxMTRWVnVtckpYR1VMZExEUmtQd0lFK2Ywb0gvdVUx?=
 =?utf-8?B?SGNySmpDYzllYTk3anIrNnlpL0o5dzQwNytCM2M0dHhiM1BvbHJGeW5xSmlz?=
 =?utf-8?B?Ty9FL0hCVUVpd3ZtQi82VGtuVS95U2RoMjBnNFg0L0E2T1lSTnU0Mk9RZ1B3?=
 =?utf-8?B?VHBDRm9tUGJvcDdMMEtXSXp2QXpLOUdnYTVMRWswWUF3VDd3SmtWZGV6ZTRY?=
 =?utf-8?B?ZEtBeTRDdE9tRTZJTWt5UkMrcFo0Y1pRYVR2QmZNVGlEVmcwU0JKc2lvWCs1?=
 =?utf-8?B?QzQrVlZaNVUvemQyRmxBRnlSakhlekZHM1BqS1NmaDdaeGVBR3NEMkNEeG00?=
 =?utf-8?Q?bFb6Ligs+xSRAmV0AVZg5WtO7AKm4D66lWrig6sjzMCM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHBZVjJibEZja2REd0ZFdUU1TmZ5dWJFNDF1MG14bW5qSEZsSnBkMTlFMnZ5?=
 =?utf-8?B?U2FWT0VTNUh3WjVuNVZhNDZBRVRwRUNMdzRBYTdWeFM3R0Q3OStQdC9wbkky?=
 =?utf-8?B?VUx2OHBhVHNYVGYveUhobVhqVDNReHBGMjZVMVFGVG5hdm00Z01QTFlYRG42?=
 =?utf-8?B?eFlWNkpzaGtKWENVM3Iwa1QrZnh0bEFJK24zVlNtdXJjT01QYldNeUpjZWJ3?=
 =?utf-8?B?NGNENzhZMjlHMTMzZzZheEZ3czdVYzdld0R4YmRnTCtyamZFQkNyc1NJTTF2?=
 =?utf-8?B?RXFoWUljR3dGTzlSVFAvNlNlbzFWbjdFemNHU0s1K3hoSlV1TlpjS2JNeWpE?=
 =?utf-8?B?dU5rdVE1aXZsVmV1NTVQTWs5QWVzcTZLTU5hbC9VT3RBdVh3c08vOC9UanNH?=
 =?utf-8?B?YjdtZElJaWM3cEMrRmI1eC9kUnh3bVZjcDBDUmxiakE5RkFGV0lONGZJVit0?=
 =?utf-8?B?bERTOUgxbUxEZktDUnBJb091OHZiQ2NDTjJuT091WXVWZnpJTUh0TEJOK0Yr?=
 =?utf-8?B?S3d0RVNrN1I5MmhTNitqMzNITWNZSGlwRDg5S1JEd3YxNUlMdFRyczlkMXB5?=
 =?utf-8?B?MXpKZmtkeWJDYnN5WWFWMkY5Z0w3ZmZkdzU4SlJ2SEVPYW9NaTJ0WjAxRGl4?=
 =?utf-8?B?QkEydTZNSjc0bWI2ckZXcTd0RGJyc1pVWnp2UmJ5M2ZqVnJWbDZYZ1M3cWti?=
 =?utf-8?B?N1NDMGh5S05vaWh0MHdQclRrMFVGVzZZcXN5bmVTaW9uREhPSkQ2cm5UTStm?=
 =?utf-8?B?RVVuVkhjZjJTSUM1Qm1salorTDZlclhvYUZySVdZWkJ4MDFIVWc2ZDN5aEJt?=
 =?utf-8?B?RHQ5SUZLWnRpQkk0MDRmRjVjTzR3eGVCZkVudVh5eitldXdBNXI3Ni9sb0I3?=
 =?utf-8?B?UWsyK2VVSDlIYjlrSWZldnIzNEN1MmVPUjhMZU5PeVpRWHNDb2svN29SNXF3?=
 =?utf-8?B?TzJHRlRRUk55eGh3QnZxcmdHVXdSZThFcjRLS2NBbGxnUlZzUTl4MUYxcXh6?=
 =?utf-8?B?bk0wcnFxOVB0Vi9vRmxGN3pIeXYzbFo0amRMRTIwcEY4am8rZ2VKK01JU1hE?=
 =?utf-8?B?M0lvazZIWVRXM2w3dTJ3Z1NqUjlWa1ZWdWJLNDZaRVJCNmdsYTJGbXpQTFMz?=
 =?utf-8?B?NDA2aTJaMHZxdUJ0QWRLS2tBdXZUMkNGM3dkZTAya1lrVjR0cWYrUVdIVVJT?=
 =?utf-8?B?bm5XNkFUbUNNYUxMYUc5b0dqNWRPZFhicWJaS0JTT2l2aDNqM3o0anN0aUxB?=
 =?utf-8?B?NlFRODNWcVZhK01VS0thOEo5OHkvNE9veUN0U2l1TWNsWkE4VU9DYjB6Ym10?=
 =?utf-8?B?d0NYZHpGV0pnR3BaWkxEalJ6MWFCdjNERmo2bFFhWWM0aFdaVXFIUWt4Vmty?=
 =?utf-8?B?M1p1OWZ1dkZQNXFsUzhaNE1NZTdvTDBFY3dBalgybStzOUNCMEgwdkwyeEll?=
 =?utf-8?B?dmZQUHRjSkhNVUxIZ3VGelF3eFQ5WG5BUFNUem5Obm9US3Qzbjg2VW1UT1hZ?=
 =?utf-8?B?VytJUUY4ZnRsMTMvdkxKbUM2KzBYRXQ4bGZZT0FkSU1MS3dPQnU4elJ6emxU?=
 =?utf-8?B?S3RCUFJRSTFidWN3eW10TTg2aGhWSDllTGpKRHpySlVUMVBkY1ZPeDVIbkUw?=
 =?utf-8?B?UnI2WFh2b0hrSXYrODlxeGZDMC9ienpmNUZLcjl0eVpBdGtCd1N6dmJDMGFh?=
 =?utf-8?B?MDgrM0kyVGUwQW1VVjJJYTRuY2lYbG54TFo3Q3dKbCt2MlZzOCtNUy85K2F2?=
 =?utf-8?B?OFJuZWNOeU1Uci9pNEtuWTNDOEJMdXBqWGg3amRVV1A3Lys4K3lFN3prNk5y?=
 =?utf-8?B?ZWgrSk9FOWVQMGdDMlY2ZmVXa2FWbnh4V2pISGR1SXg0TVJlMnY0c1VtWGUr?=
 =?utf-8?B?L2RRMkllblVLNEtTaVRjZitiUmJlMm5qMjBsKzV6LzJQQmh0dkhuM3pCenB4?=
 =?utf-8?B?K2Ftbm52cXRML05iTTBsSSsxbkFySGRKR1lFSWVZWHJhQU54Sk8zRlVTbTUy?=
 =?utf-8?B?UlJYeWJIYUI0eUVTaTZEL2I5VmljZTJwM0NaQXBhQ1JGbjMzVktPTUpFazhs?=
 =?utf-8?B?ZXgxTGlEd254Smh4aDBUdHA2R0xVdlBwWEJrdlBSdUkzNGl3eng4WTBtaTRj?=
 =?utf-8?Q?pRhHma2FmlBx9HXAETIECnFGh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d02bd26-91cc-4c78-f0c5-08dce319f0de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 19:39:33.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxDflbGT4QFqLMFNDbAcqzzuGNzj5n8NRZalgRFKU3Oq1HX+Up47eIXehrSdu6kF0cRIyPDrnFIPUhT/xPkE5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

On 10/2/2024 12:42, Harry Wentland wrote:
> I was checking out the 6.12 rc1 (through drm-next) kernel and found
> my system hung at boot. No meaningful message showed on the kernel
> boot screen.
> 
> A bisect revealed the culprit to be
> 
> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> Date:   Fri Aug 30 18:26:29 2024 +0300
> 
>      usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
> 
> A revert of this single patch "fixes" the issue and I can boot again.
>      
> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
> It's running Arch Linux but I doubt that's of consequence.
> 
> lspci output:
>      https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
> acpidump:
>      https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
> 
> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
> Another suggestion to do usbcore.nousb lets me boot to the desktop
> on a kernel with the faulty patch, without USB functionality, obviously.
> 
> I'd be happy to try any patches, provide more data, or run experiments.
> 
> Thanks,
> Harry

FWIW I did take another Lenovo laptop (Z13) w/ a CPU from the same 
generation (Ryzen 5 PRO 6650U) and 6.12-rc1 but can't reproduce this issue.
