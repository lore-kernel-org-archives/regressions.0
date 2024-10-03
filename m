Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863AA1581F8
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961019; cv=fail; b=rvSZqfEWP3x0zafACVg1G+tSnBj4p8O/ICfoPsS7EainLE5g8AtXpjMpFqT9OMQpfBNBYlLCEmFJ0dPoqCqGafzjdV+7+2LK70ZspmyHKotxkLjwk0zp/TrBgdCvyvWSYdPoG9JH7O5o3imnxpP8fNmE0MQcHe4XmXzOept08F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961019; c=relaxed/simple;
	bh=d3OnQO3Q1ovLawuuReEeIbyf67TQxMmAod2e4OnnI90=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C0bby2pxxBpx2/mMVvfZbrPLJ4oouWBCCkFdc3xNDP4s4nKjFzjewYjAtvvPhhars02Dv3K7TWO/mnytRr8YJs/f2bBTNSr/hcqg1pHQVxxv8MfyZkRmX4vbgyYa1gHM9KrGsMf4El9Q5r01iT3LY82xihuhBCwHTHDLLAu8LCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zPZJQvHs; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zPZJQvHs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moYyy2HWKl9hsoeRVkcvvqAPH2P1icy5D0jlJB5PiYpFotD2f7f/intylXuoblVg7IHY8UZPi+vezrpEhqsYBqao7+NKmr0PSOlj4CPhhO0zPwdK8EuZ+OxmKxO6H+wjqx59xasbBsdj/FHNkWe5kCWMi6GQwo9u/P+1FKZLw7O9DCIy4Sr5axdPb6MifWX/12xt0OHYoeUWWVY1uf7kYD+6aNdNjSkldm3/fEsxlqUY4ERdKZ64Uw8dDzSE6NsdPZZwW/plZssa8nDhQDHLY1LX2PgH9c8UvVwzg4Nr4FYX32CVY2P+UeEN4oDs+23vUVuhsp4L4rhC7oOLXPRSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0IOKvIJIAhUDm2NiqC/w6YxMJTLrRBgyLL27ln3sEY=;
 b=xxPZSTvcM+bZS72Fp8nNVFJ5LY2YBYRxyIbkA74jGCFeCuuAc6hUS2x7frKIf4yKvFmojr14iQfQQHwGwghvXHqxxEzCcxUisksx+hgNtFN/1xNjGF2QvxEMZgNTnsZrknut4qSlwf9+bgqhIc6SnkCvFrPWJiE11oVSnbf0NT06h2Z+vU31ow46zq9iw6Pi+ZbVVmuIJh7Y9kVAlRPvopgjNMw1bipg9tzf5ZDFgz4PoGWs0c8CGfwusFcr0KqyVjDjfjAiJJ/Mir1WNBJra1FktXxs+0DzMHiv5CjTOq51xeRS5LO+rcQOCvZiuVQ5sHgqYoytMfByxCUoBBYfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0IOKvIJIAhUDm2NiqC/w6YxMJTLrRBgyLL27ln3sEY=;
 b=zPZJQvHsrTACSy3eyQ23/B8sIS5SWP/2PiOkYH7fwo+h7kb8dr/fHR2/JOesByskfzob7P4kVF6HGyDnP7WlIKelhzKO+oHdLanxio+bwe3dQnzgwTSywP8wP2pQuseGeiAbFM2gzYEOzPLUqtEotu5PxFmMOn2azeVbE4vrFIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6185.namprd12.prod.outlook.com (2603:10b6:208:3e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 13:10:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 13:10:14 +0000
Message-ID: <01bf9a3a-6277-4b57-83ed-82c4bfb62dd2@amd.com>
Date: Thu, 3 Oct 2024 08:10:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 regressions@lists.linux.dev, Raju.Rangoju@amd.com, Sanath.S@amd.com,
 Greg KH <gregkh@linuxfoundation.org>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
 <20241003054704.GM275077@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241003054704.GM275077@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: bb959f25-f6fb-4a13-3a26-08dce3acb7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVU0OUFySDljclNyb2FjeDE5MVo4eGJSdUdjNkwyNzhJODlsTG5CeWFOajJ0?=
 =?utf-8?B?VkZSQ1FlQ2taSktTbEVMM1NFdG9YOWJZMVYvZ2UydlJrMk53T0J6bitCKzFv?=
 =?utf-8?B?N1dHZjJGeEtHS3I3M3loUTErVnBKbGcydDJaOE1BUjE1OGpLOUhuR2ZQY210?=
 =?utf-8?B?ditpemlwNWhyZlJrVnBJMVlOU3BMR0tnOUJmRFN1cmFOTGpjQkhLZUFFT2Rh?=
 =?utf-8?B?Nkt4aDNrbkZQOE9XSzc2cklJZUhFeWgxZ2cxMGdwOG5xZHV3c25ENTcyYmJL?=
 =?utf-8?B?V1Q4WXplQnZxeGhsQUxEZG1XRkEyQjJUVVpmS1ZPYWlEMzJZTitPRHVvRWV0?=
 =?utf-8?B?Q3JNcksreElvekNUVlJRTXU3Mm44Wk5ySmd5TmRtd0dzVG5XODU1Wi9jalJ4?=
 =?utf-8?B?VG5pMHVLRE9jMXJVVE9ncEVDakFqTHhzV210QmdTVWRXQXRhNnhienl2U3J5?=
 =?utf-8?B?dSsxeGtvZ1NCZm15QUNNeEY1Mjg3TkFPUUcvQWFOYTNpQVJId29vVEZIamlL?=
 =?utf-8?B?MC9rQ0VFM0pib1hhNzNFZGtabHo5Z2VHcEJUeU9oVEkrK3BHV0l4eWw5Z1h0?=
 =?utf-8?B?ZzMxOXZhbzJKVG92aC93RDNNNEZHZnZ5TnJNUWJBNkl5ZitrTkRXb2JBWElp?=
 =?utf-8?B?YW1OMUJKWklpVDVwOHBjdDdlRUtiN1RJT2dLOEptSG0wZTUrOTFVemdNTm40?=
 =?utf-8?B?QjkvSzVCZTBaSVBmU004bnNmbWVhdUJkaG5VLzg4Q0NqTXBRajVtWFpnb2Fn?=
 =?utf-8?B?ZmhGRmo2RUd6Ty9kWnZjZThHSFJGbEJPUE5ScFRPWkVZNmhQeG9Ga3I4UU9W?=
 =?utf-8?B?dERvYzFGaWdqNkJnL2poRjFRQnZndFFVOUFGL3RQeVoyN3FKL0pXeGg4Qkhx?=
 =?utf-8?B?b3VHdlJFZWlxK2NTemJMNmdRbURkWTU2bm9EQllXeXNTdVFqdDlKb295dVd0?=
 =?utf-8?B?WTdzVVBMQU5yejBhQXRJbnozbU9VMlVib0NKV3MvRzBuSVJlK1RNazd5aDZu?=
 =?utf-8?B?R3huZUZsUThOZEU5YVczbnVYeUdtQm9sV242YkRVWTJ5Nm53Z0FlWHJQQTVG?=
 =?utf-8?B?R3l6NXlNbjRSS00vQVRFb09DZjQrMnh4OGVkQ1BESkRQeWZGYjE1S1lOdUw0?=
 =?utf-8?B?NGdIVS81eGJIbGJYd2NJV2t2QnEzbXNqNFF1eUg3ZENsSHd3WGxSWnB5a1Zm?=
 =?utf-8?B?YlNOT1pqQTZLOWxUMVFOK2gxd3dlbUorOXNRVWpRTXB0dHB2ek9SV1M2bFFT?=
 =?utf-8?B?WTBabE9YZG1SMmhqK01QbVJGTXBLd2lrTWxGZDRQNHVnUzllcEpybVp3c2xz?=
 =?utf-8?B?Wk9idjdMUm1mRDZZNUdFNmkrcS9GUk9QSFdMbU8vWm9YQ2E5anE3bzBEMmVX?=
 =?utf-8?B?RmhsQWJCQzRYMXc2ZHFvMXcwM21LZmdYYjdYNm1MdDBRaXVkdjNjMjRSeTQv?=
 =?utf-8?B?dG5rWENOQklsaEtmZ2NCQ0NFTzZCNGR0OUFhVWR1UEJpZ2dQeElaVFVFV1lm?=
 =?utf-8?B?c3dKYUZ1aDZ3ZWFzOW02WmdhTGltUkx2SFNqWDZtTE9BSVVGZDByYUJrUnk0?=
 =?utf-8?B?djhtRmR5SnI0dEdGV2NySTFyZGExeTNEdWd2KzMvYm9SUUxHWTZpc216MFdB?=
 =?utf-8?Q?VgYIGcTN6DTBu6KVu4XMdVFSxjqvcNGwRH2wjEfv5qC4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWZqd3N2Zlhhb0NQUXJhRUZoMnNZYzF0U0hvSUVQZWNIVEd1VHJPR2c5cUxC?=
 =?utf-8?B?V2xwckZ6b2N1VEZlYXFzUXg1dVhWcTRKVkkvRVpjNjdLVDZPcmRHV01BNXE4?=
 =?utf-8?B?QUZJLzRpb3RTNDBSVG04b3pPVVBmRzFtUGZFVTNETEhXanVDVUxTck1FS0pW?=
 =?utf-8?B?RnYrNTE1NW5naHNaUzRXMjhMdTFxeTAzcTlhTHZPY0UvajBmNk9XTWM2WlUr?=
 =?utf-8?B?aVBOektSL0hFc1VGaWpTSzJwemZOcWxDS2h1QlcvMHIvdjVSWHdTTC9pTkZG?=
 =?utf-8?B?Y3ZJcDFoVlpHbHNRSHdxWnovOEhQNmNrMUMzOGpqTng2V2JyN3RTUm9kb25H?=
 =?utf-8?B?K3FNTGtKWXJYYzlxQXRnN09zbjAwZzFZRC95d2xEUUtXOWJlcVZ3cWhPcGFI?=
 =?utf-8?B?d2xiTDQ5RW9uVDMwSjg4cE00aUFSMml3NmppZGhlbHRhNmF3eU9EL1FYT09F?=
 =?utf-8?B?bVdXUUJPTDhGMUVVeHF3bk5nOWkvc0drazFRUmF4R2REVElMbkVrSlNVcTQw?=
 =?utf-8?B?MFoyZnRENDdRdFY4RVptK3ZEN0Z3N1B2S1ZuczNZZG5rQlZvT2xTb2lNc3Vq?=
 =?utf-8?B?dWdKM3NHMXM4TVNoSGRyRFdiVnRjR0ZjaXVTbW5qeUM2bDlqUkMralBrd0R1?=
 =?utf-8?B?NzY2Mkc1emRqN0NpSzRNZ1RRVFVXL2hadzVVdzJ0TVJpdythNlltd3YyaG5V?=
 =?utf-8?B?aGlvK1BvY21Mczk2SlVuVkFHNm5mNGlCWjIwTm94Vm1UbDE5UEY3bi8xWGo1?=
 =?utf-8?B?MVJnWFZTSnVvb3hkaXNGZ2dGZmFKa1QwMTFYOUx0aUhQbkxiaXN4NWROZFVN?=
 =?utf-8?B?OVptNkJ5Z0xGK3RnamVtcExaSGVmZkdZaUtHL1JDTnhKT2txcGtZTHZwUXRp?=
 =?utf-8?B?dlIweXhLb09EWEVPYmY5dW0rblQ0Yit6a25rVnY4Y0FMSjU5QlFEWGgzMEFV?=
 =?utf-8?B?aXRzdVYwMCtGYUlRT1ZoQ3J3a1BUVmZzWExrNFc4SE9mRk9SZXJhY21LQ0l1?=
 =?utf-8?B?UW5kMm9lNC9lemlXU0I2cnVia3pLcmhVNTZXSTVSNDE4eCsxUEVsZ29xVkFL?=
 =?utf-8?B?cXlhTFZmR3BNcnpFQ1lKdGtWZ255Sko5amNMK1FmV1dqRVI4cGhsNFZJK2RM?=
 =?utf-8?B?MnVvcCtHM0krS3AwVElsQ3lJaHNiZldBRTJZM1U4SkFNMGI0T25yblJsa3Fw?=
 =?utf-8?B?NWcwbXplVHJ0Y3pXRlVDY1hkbXVDMUtPOGpIQjQxaUJHa2tSQ0cvUkpVRExo?=
 =?utf-8?B?alZ4R01uM1g1dHhhRE5hSjhDU3hOU1VhM3JnUThKWERKSGtPbnBzRWRLd3BH?=
 =?utf-8?B?MDlLbGpOVldwS0kzN29lRzVselhpRTRYam1Hekh3QWVUUVM3U0RlNWV4WXA1?=
 =?utf-8?B?eTVkbnZnVU1qRy96QWZQekF2Y0RrbEVVb09QbkplZTIvc2ZsaVNBTElWeWFL?=
 =?utf-8?B?REdoYmpDQlFrWXBlOWdDbWk1RXNBWXoxNVBSWm9EMkk4blBYRHh1VXJyd3Bv?=
 =?utf-8?B?aCtLWmtHY2R3WVczS2YzcGZ0SmJaRzlMbThMNGI5TXlKUkRiU2dSUmtJcjRG?=
 =?utf-8?B?WVh6aE5aa1ZPem9EMklxazhKM2FLSVdPSnY1UGRpY3A0cmhLSm1MeXZFZCtH?=
 =?utf-8?B?KzM1c0pFRFB4SmR4RXErSktNK29HSHdOYktqZTRDZDV2MGpOVmRXdTBuTUdE?=
 =?utf-8?B?cmxZQm9obUlMeFBoNlcvUWhTaEgyVnpham00YmpnWEw2aXoxZWRLai9GZ1ZP?=
 =?utf-8?B?QUJEOEZPQlBzSE14MVRyZ3VqR0Y2V1JSRDU0cncvcjBSQnlKMFc3K1kzemxy?=
 =?utf-8?B?QnU4N1RzYi9rUmRmSFNPNzhJd3VnNGtuODhsTjI0dVN5NkhPMHI0SS9JeVBu?=
 =?utf-8?B?bGxnWTJIZVFBRVlJcThTMFM1U2FZc0t5QTBFSVFvWEtSNTJuRUtUYllleW1C?=
 =?utf-8?B?a21mRDIvTDl2NnBXRk9JZjhvaDR2TTZDc3QxK2M5MWFhYnZYU0JqV3hpK1lQ?=
 =?utf-8?B?UFNpQWkvdU91OUR2SzZVQVNDYVBZTlV3UHZXam1iaVV0bnVTZkQ1Z1hQNWhS?=
 =?utf-8?B?aFNubjhya1lwcytRT2dlRW9UQTZTdURZSXMxc3o5aitJbURWTmd3bUNMM3hy?=
 =?utf-8?Q?HIK8OasvphR9BF3h6IpzZYusv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb959f25-f6fb-4a13-3a26-08dce3acb7f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 13:10:14.1574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdCtIWjUoY0AUqWoLIXkmyDYpxZAGLekfkGiCfxJNXW05FaIzi8OVMoNeH5oyHXXQGvvWI5LUQ0o0W/rSgsNSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6185

On 10/3/2024 00:47, Mika Westerberg wrote:
> Hi Harry,
> 
> On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
>> I was checking out the 6.12 rc1 (through drm-next) kernel and found
>> my system hung at boot. No meaningful message showed on the kernel
>> boot screen.
>>
>> A bisect revealed the culprit to be
>>
>> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
>> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Date:   Fri Aug 30 18:26:29 2024 +0300
>>
>>      usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
>>
>> A revert of this single patch "fixes" the issue and I can boot again.
>>      
>> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
>> It's running Arch Linux but I doubt that's of consequence.
>>
>> lspci output:
>>      https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
>> acpidump:
>>      https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
>>
>> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
>> Another suggestion to do usbcore.nousb lets me boot to the desktop
>> on a kernel with the faulty patch, without USB functionality, obviously.
>>
>> I'd be happy to try any patches, provide more data, or run experiments.
> 
> Do you boot with any device connected?
 > > Second thing that I noticed, though I'm not familiar with AMD hardware,
> but from your lspci dump, I do not see the PCIe ports that are being
> used to tunnel PCIe. Does this system have PCIe tunneling disabled
> somehow?

On some OEM systems it's possible to lock down from BIOS to turn off 
PCIe tunneling, and I agree that looks like the most common cause.

This is what you would see on a system that has tunnels (I checked on my 
side w/ Z series laptop w/ Rembrandt and a dock connected):

            +-03.0
            +-03.1-[03-32]--
            +-04.0
            +-04.1-[33-62]----00.0-[34-62]--+-02.0-[35]----00.0
            |                               \-04.0-[36-62]--

00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 
17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:03.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h 
USB4/Thunderbolt PCIe tunnel [1022:14cd]
00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Family 
17h-19h PCIe Dummy Host Bridge [1022:14b7] (rev 01)
00:04.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Family 19h 
USB4/Thunderbolt PCIe tunnel [1022:14cd]

> 
> You don't see anything on the console? It's all blank or it just hangs
> after some messages?

I guess it is getting stuck on fwnode_find_reference() because it never 
finds the given node?

> 
> Can you also provide full dmesg with that commit reverted with
> "thunderbolt.dyndbg=+p" in the kernel command line?

