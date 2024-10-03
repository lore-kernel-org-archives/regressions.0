Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C66B1ABED6
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727988208; cv=fail; b=tFuF4JulIcrTvs79VJtsmrS4tTScD+jyC4XclEoN/xX3FBN5TO8r2iWEWOLjB9uNpFMw/T2g5WkGk+kYrH9CijNp+cCUn3Pr7Fkbvg9Bt5GX/mr5P+acWTi24WQF1oXb+jIpqGyA6eJ93G2HiEpW1uWNImOekWHWCwfxdXBiwBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727988208; c=relaxed/simple;
	bh=0h/HhfStveHtCCW9mPNd33j2eFs542DrxZycHInbcNA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JbdlFLaTsI01rCyubF22er9quYZaqROIRhkm8ObLVS2EhASgXFMpdclFAJ+jNXj0O+ibIyz2NxN3QocsJ47OZ5pM6QWPRbQWK0TOeQKIhz4Nw0oW4Xlb/oYq9ArOafuJ9L2vPW902+MFM82yqkko/GZ1ujzxcGVRAp0/kvLElb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wvvh8QvY; arc=fail smtp.client-ip=40.107.92.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wvvh8QvY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tk0PDY4Ez7lTjGE1ca10hKs3Fr4dT5ZC08jcod67yQcRxa0UaZ09+sbGLj0CLlFbPAfCuUGSuj51puV034Np4iduPAOM6owAhRW49xwBHWXIFzpMRbFuBlnN9pgOYRiRTIVnP/3L2kfwikgn3JfG/dnuY+Fjiz9bD9AGCEIVmVwugEI1CsV00jT7l1YjwK8M1LsEUPwl71Z7dhG3TyZta+hWvqsgkJTL9sfr9B+8bNO+cAmcATKajMYwrcmIMvbtQNe92n98AVBeANQY7FlT9T7hw/vFSDc4E8kDVyXelhbALsNF9dQvseC+bEt/7IUYfhGnzeyyEmJqsFv5gRNgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qh9IpzNP1YPL+a57EDHbDy48ePAgMGUnN2zL6U/VQg=;
 b=uXBppUaA2ENkepRuEBmRl2aTxgUu2gkZndrpdkKr9NYDC8V5TS3ZxFDWYploMzFK+6oRnGuM5KgjANcfAZdHvaA9hkMfmV0wI+t6Ut1q6xrPlisJMGiPzNEHslWIWrc2Gs7onu9PNGGXR1EpVMrPJJKzq35J+R6QxESD4A31Qyjd/m0wFI/rYWFZ8seXgptSPKH9Yj1qc2K4Gbd0gSpAV+Vzs5oCuJUkPgb0d2EcEs+P/oU6F4ESgsvNNYwBmcL1MNuXS9/1L4ITVSu5BcTXGiGWhzsSwEW0zPEf+L27pKExXmG8h/YvcDKJbcoK4cNkEIfAKucY3sL+Pwj/kJ5Htw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qh9IpzNP1YPL+a57EDHbDy48ePAgMGUnN2zL6U/VQg=;
 b=wvvh8QvYlvsrMdkXVoN+F1FU/Zuiqw4vdM5OmOLRBq9cAgvAqpOOZFR0o1FdCHsutkoLoiW12b8dhBi2Cu4fRNdaWw2hNyd7Icr1F7Rqliu9BcBx1aCjFcttapaWuB5Ng/UXpP2nfncvKk2WgBMVcfudBde/SYMxRCY+pMeladA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) by
 DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.18; Thu, 3 Oct 2024 20:43:22 +0000
Received: from DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20]) by DM8PR12MB5431.namprd12.prod.outlook.com
 ([fe80::6cd6:bbdf:298b:7d20%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 20:43:22 +0000
Message-ID: <82aa97b6-4b3a-48d3-a022-04563eb01e45@amd.com>
Date: Thu, 3 Oct 2024 16:43:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Raju.Rangoju@amd.com, Sanath.S@amd.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, mario.limonciello@amd.com,
 mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com,
 regressions@lists.linux.dev
References: <20241003214827.4edb8731@foxbook>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20241003214827.4edb8731@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::16) To DM8PR12MB5431.namprd12.prod.outlook.com
 (2603:10b6:8:34::8)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fac1e3d-88a1-4748-2ba4-08dce3ec055c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVlYZzkwMVZVNHpkVTBJajBjYjZGRzdFR1NnbzlsSmNOTDlvZjFRUUZDTkZT?=
 =?utf-8?B?UkNTMnBrWnRGelo1YSt2Mm5tTWg3VEFmVGMrRUZ4RTRNVkJWRzBLbTF3U3JF?=
 =?utf-8?B?Q3FXOTYzcEpOMytLTFhQMTE2RzdTTmZvVzVraGJaMHdhWDZsbXlwMjNjdFcy?=
 =?utf-8?B?RnFrekRyeG5HY1ZnOXJrNTJMWGJKUEJYbkdrWC9aY1hLVHVXZnNneVU1ckJt?=
 =?utf-8?B?WjhWR1F2LzhEbXh1ajFaU3lZQ2xKUXJoNFhCNDczVVFDYkJMdnp0WThtNGky?=
 =?utf-8?B?bVVEOHlQMjU1d0ZHTS80QkdzSnREeWNGaU9JWFZwZTZtYkRaSmFKQzFrVnRm?=
 =?utf-8?B?RzVKazljdGdtRTg1Nlkwb2l0TUswa0l2UnJaZFE5ZTVjYUtwZUZmQUVCeUFZ?=
 =?utf-8?B?VHRKeTBiazJyYXROZWRQMzlsVC8xOFVYQ3hSYkF4TEhSSUtNS0xIcnV0aHI4?=
 =?utf-8?B?dVNOZmE1TDZXdDFCL2VLRTZLTjZVMUNQeUQrWWRkQUx6eGdpa3RDMjg0eDhR?=
 =?utf-8?B?R3N4MUEvK1lFZUFZbFRDRHN1SnFDUE1FN2ZIUW50U3ZPNktoOGtIWGFtbE9a?=
 =?utf-8?B?TGtCQ094TGdSNEEwRGtiNENKRnB6Tkl3RmdyZUpvYS9ESU01Slk3ZDVnOFZr?=
 =?utf-8?B?QUpSYjBlanBnNUF6NnZOSlBTWjNzZHFEWTI5VmxlbjlRc1FLOFpBOVhGaUI5?=
 =?utf-8?B?UGk5clJPY25zSFNQN2dCeHJ0NHlzTjNLUVgremJxNVYwU3E0cCtLSTY1L09S?=
 =?utf-8?B?NE9uZllHd2VMZmV0clh0dk1BSjVxYnRheE1SWVFDd3Rvd1Ftc283N2NGWkFt?=
 =?utf-8?B?bzkvaGVsZWtITFg0TWJIRzAzMUNPektwelB2Y3FEbnlkb1AyRjEyTmVYUkt0?=
 =?utf-8?B?ZDF4T0VLR3NKN1o3blg2WW4yMUZiNHhZcTdJTE9lN0I5dDBXLzIxd2JPYUNG?=
 =?utf-8?B?NUljTVBpcmVXd3k5bldLQkEvdyt0Wkt2MmNmVGZJb25TdWx4NS9acENST1JO?=
 =?utf-8?B?dkp2NHB0WGNMOU9Zcjl2OU9jcThJcVMyNUM0Z3Q3eG83ODNTdjdIbmlId0c4?=
 =?utf-8?B?enU5bGRONmk4NGZQR2JDcEN6ZCtDaG1NSkdaeEpvdmRnVjdPS1VIbmFOUDAr?=
 =?utf-8?B?SWl4dDV0QldNRGd2NXp5SmFBN1JzSlIwdlBSV0VDeTVDMk1yWnRKRngxN2xW?=
 =?utf-8?B?L3E0MHJIQW9BTnZzcUdENXdKK3lTM3cxdnpSZER5bHpSVGRyN2hJMFdzVTUr?=
 =?utf-8?B?ckJrWE5SalFSVlVBSDFxd256SXhIbjBYMGIxaHBVVnY5dEZ3d0c3WERHMUQx?=
 =?utf-8?B?YXhJS3d3WGlTMzdVSEhqZ1crUkRHYkwrKzEzZG5wZkxIZ1NTVjZXd0t6a1k4?=
 =?utf-8?B?Q3dVNHRRRFhxVFhtRDFBT3VMUUR3VVFKQzF0aU5hSzc0aE9HK0RmaVhYOFRT?=
 =?utf-8?B?OWpSSWNRd1p3YXRyWWdtd3BneGFIYjRhMXBhZ1l4NVdZZVdTNUVVejhQRG44?=
 =?utf-8?B?b2Q0TlQ5b3FRQjJleThUYzJMZ3J2MjN1bm5QWlV1LzlyOTZPcURVU3F6QTlv?=
 =?utf-8?B?VVZ2elB3OWZzalBVUURvVkQ5MUI4ZlFFL2V2SWRPUnBmNjJHQ29Yc25zajJL?=
 =?utf-8?Q?MFL00dJQEQPXAb9Ddu/mqZ6yvPvmYvEtpfqCVOVk1Upg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5431.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzFoSW1tRlo0aG1ybTNoNWJMWGVnM2x6MHZwN01tNVV0aFJmenBCb1E4TDkw?=
 =?utf-8?B?OXIwUHhvdGhpUWlJZ2N1cm43dlB5cDFkeEc5elc1Yi9sQ0dJeFV0WHQzSkw2?=
 =?utf-8?B?NTBsZFJtS0FjcnBTdGdiSCtIZG5DR2hFZFBKS0UxYVQxQXY5UWdoK1V6OEdD?=
 =?utf-8?B?ZjFxWlBpbXM0RWR4RitaSGcyUGlMV2pBU3dncTdGMURvLy92WXRyV2lvVGJi?=
 =?utf-8?B?ZkYwTEhlcDlPZ1QwNVNwUnRIaUs3QnIveVNnUUpwUVJTT1AyT055OU5WaU10?=
 =?utf-8?B?clc5Nm5qRWc4N2dxS2xWSDltUXloallJRFFneEgxQWdPdVFMa1J6d1hMQmVi?=
 =?utf-8?B?ejN1bkR4emMxYkl6RUc1OEJtc1YzMS8wSmtpSHhDbHB0am5vN1RIdmd1ektC?=
 =?utf-8?B?SzJkdG1ydmJDN2dvQldvTXN0SE43N2FDNGFKZlltbWIrY282VE0xVmF0TUtS?=
 =?utf-8?B?LzdzUWRIRXAvY1orWnVPVFBXd0gwd1gwbVpCSUdrUGFKTndwU1JTeUQ0dXV5?=
 =?utf-8?B?RVR0VXFJbXQyL01ZRVlUa1dYTGl2bWZ5U0pBTzRab00wL2t3Wm5nV2xqQ2lW?=
 =?utf-8?B?eHNxdEVYbzRRUTd6VlJHVzJnN3NLVDJCbzdLMThUMXNYTVUyTVNrVktmbFRn?=
 =?utf-8?B?bjlkd0pkRnVoSk5GdEhqb3J4NHQ1TitXdUF0RXFEeUFMalJsOWdvSVgwVXpP?=
 =?utf-8?B?R1NNMnUyUS9NcXdnaFVicjhvMVFYNlNlTERiOWgxclFoaENIeGxBeEdpbkUz?=
 =?utf-8?B?MzJCR2dnVkpIQnJlVTg1aEdJWmh3ZDR3Z09uUFVRaDIyMDNSbE1SaDNwODdh?=
 =?utf-8?B?VnROeDFqMFI1LzYwL0dmelYwaDltS1NtanhmUTlYN2VGT3FjU3drT0VicVBS?=
 =?utf-8?B?RWlGMzNxc01SM0wvWHRQWFlmZW51SHN5Tk5ZTVJaQ0dxN3ZnbGxTQk5LZWZU?=
 =?utf-8?B?OGdmMVhNcG14S1g0cVAwWnF6ZGpUN09NanZWTk1iNmI4TUx0OVozckZxaGht?=
 =?utf-8?B?YnZRdDkrQi9DL1BtNVh5MGJ0N0FRME85NnVjcWtEYzJMbUxOTEExWkFaNDB0?=
 =?utf-8?B?TEplV2pIU1ZUNVhFbE5FOWVUdzZ4WEJ3OCt1RFVsSjNxdXFtVENqbWVOMVpl?=
 =?utf-8?B?a3VjT3JQVWtjaDZFaHM3L3VFZkgydDlpbS9qQkx0YnZEREtqd1haNmh3NzhI?=
 =?utf-8?B?VjluMC9reU5kTTNGSWRFbnB5RWltZXNoL3BjV1IxM1dsbFllR0lpTSsyL2tz?=
 =?utf-8?B?MWJGVE9aUUFxcE5lbmNaQ2g5cjBET0U3dlpMb3pidjdYL3QvU2pEZU5Ba0ZT?=
 =?utf-8?B?UFJ1OEJVR2pDaEw1eCs3MFRVTHl2WjdUQjRTL05ER0xDV0FpTHowQ3JUSDRO?=
 =?utf-8?B?bThzeHNJamg5YUtqWmJjVzFuMWR6bGxDR25HRkMzaDlqSi9veER2ejZoc29T?=
 =?utf-8?B?aWloZVZha3hnZ2VET2J6b1VWbFNSUXNSSlFJUHJ4RjRmbkxKdzRwVVJtSXFL?=
 =?utf-8?B?R3Q2RXlkOG0rOG5BWFZLaUp3N2ppQWxkZ042VlNjQXFraXNzREl5TjlzdVFT?=
 =?utf-8?B?WlpUK2RYV1V5QndSQ3R3NTlZT3k0WkxiQUVhaTlQcEhmZWdqbDJDbEx5N2xZ?=
 =?utf-8?B?QzRqdmNVVUZUYWNqa1docS9LQjJLZStSa1FyeEZmd1RSUE5scWJCdTJpYWJ0?=
 =?utf-8?B?MXd0NDZnblgxbXYwV1NkWEgzRDVKTXpXTWM5QjNkME1LVkRMQVZObEJ4SmEx?=
 =?utf-8?B?QXdxL0VJSGhRSktwYVhQMW5ma3ZpdFh0WFFqVnVoY05EV2RXQ1NOcVJJRjVh?=
 =?utf-8?B?SzdRSmF4VUExOFk4WThncWxyMGdrR2dhRFE0akpZMkxpTWJ2cUhzaDlZeS9m?=
 =?utf-8?B?Mjlib1QxRnBPZTY5eHBIY0FLU2xQUXpsRDlYT3d6MVo3QXJVcklLU0pLeEd5?=
 =?utf-8?B?dExOYzRqSkVpQUNRb005V0xHZ2F0UHBWeDZXNTBwWFVIZlNFdUwvblIyYzdM?=
 =?utf-8?B?aXd2TGpIeWt2RkloTnJKaEpFSW10Z2s2TzZzR1NuRW5HL3FqSXE5dm4yWXk4?=
 =?utf-8?B?WG5lTkJkcmlqeS9tbGphZHFLcFFCMkRuNjFLbXo0czZCWEthUHYvU0VsWk1u?=
 =?utf-8?Q?3BonXzqLpUnrSnd+lHfLymE/x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fac1e3d-88a1-4748-2ba4-08dce3ec055c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5431.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:43:22.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Twrl8d0Cw1EB5hdfW6MSLgxW+eLy3XW6dRdzBBnapS5sRCUS8/E6i1qUbXL8k3H0K7cgrxt/iuVvbKpNeauN5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655

On 2024-10-03 15:48, Michał Pecio wrote:
>> It hangs after some messages.
> What are those messages?
> 

https://pasteboard.co/dsPP640WFSBq.jpg

>> I sprinkled printks but don't see any on the console.
> Did you use loglevel=3 on the kernel command line? No surprise then,
> unless you turn all messages you care about into 'printk(KERN_ERR ...)'
> or 'dev_err(...)'.
> 
> I would also recommend increasing loglevel to 4 (permanently), because
> KERN_WARN is rare and usually tells you about pathological conditions.
> The 'quiet' option is an alias for that and used to be a quite popular
> default in distributions.
> 

No 'quiet' option and with loglevel at 4 I still don't seem to see
any prints.

This journalctl -k -b -1 might help:
https://gist.github.com/hwentland/7564cd08950e38dc4b7d305352481c85

I see this, but the same message appears on a good boot:
Oct 03 16:30:02 hwentlanrmb kernel: hub 6-0:1.0: config failed, hub doesn't have any ports! (err -19)

Interestingly if I set loglevel to 6 my boot gets much farther but then
gets stuck at "A start job is running for Load Kernel Modules
with ever increasing timeout values".

Harry

> Regards,
> Michal

