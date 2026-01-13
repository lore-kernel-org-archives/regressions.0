Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E149156F45
	for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768272478; cv=fail; b=qGArfFUWFhJD13dAm9VXnQTSbDtgKDib6GpiHSm3amyWE8B/QhlCcNeayz5/tCjrrn1vxjnQNMaGqbtqp+7QuGUdF8nIwM9rM91Uh50ivnk5i07o7ZKKo8RpXJNuhLgg+xtX1McTY53NeGNMWliobJxiyIwf0AQ0VvYzKUOc8ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768272478; c=relaxed/simple;
	bh=PSG4iWfTvPfN3bwXI15s0GWUP8itqf9FCyGsPmCd2Ws=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YX3rdjd7arr2sUCkngk/E1qcgileFc3NWXxJnydUDVkr9akCatlhUqgTG5YMfN2Kjscl++GsqqYg4N6U3/lkaeHTjwZOIjMf3dulS0al641Wa47UE3z3uv/cHi902Oy3qPOdfZjAMtID+6HkGGUKCOr4wwzGFdfGOH0dSya0jbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zPUOZFNE; arc=fail smtp.client-ip=52.101.61.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zPUOZFNE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHP8b6eXZYdD9JL4GOwl37q8yXD7Zrhdnq20Thge8UG7DUWF2Xwm5HL1gyXkXkzfkwpHNkLLW6rClfkmaWYHqCLm3b0VwQdQc20eJ7plQcWElSwh28Onl1tkkQcqOl+0V+85AVIGXNXlT8Q4Na/ZjwIcnH8XZvz/X1H7Sxi9enNV/mz/kOhEQ8wqkJ8pTiFJnozgEeE0FCFW24Tidj+aAIKEMIF40N6bgXJDuMMQkoUdpHPJMXZfCiDJGSmXfxsTE+pFR9DGt9ayeSoLjYzseQiTtfod2pUYpRQN3ZbF3iVU00NkqdRvV584b9WCVrJFhDU8vYbGCMf6KWUFwC5sJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiukI4URWEw/4sukDxMBfvUkJMC/ZgDUz9N22Ug7QcY=;
 b=V4uGRxThM+oCc4UTHSGpD/wc/VYaD03QkRKFwTQEfczREW76lRthmucKfU4RfFcW3mxfvaM0uoZkw12+R7kseS2V5u4VxprnBGJxZBOLwY4lTnbdgNUR1DwKAcD8e1S8qQYdT6dq86D5J4hT6xifsQ76rtmaJoXHlATuki203fywhkzZjhpPQwQtfF6ePR/q6yQJjWtopeV2ywFHzUF0wPa0zdEtXlK9piqBGEK/NjuX8bijKo8w770L7pEchRwy9z31Zb8F/AQDowlMiHA9ck1LVCJauYfszp/WtoRh/3sxTHkshXTXF4GKUgcvGpDEVbqpgUdWxTPgdTYMKmpCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiukI4URWEw/4sukDxMBfvUkJMC/ZgDUz9N22Ug7QcY=;
 b=zPUOZFNEBWPfyMya13IGA96Z5x4UQSShXDdttIaFuHp1U1f37WM6UaHIUiWQMAZo5/soKjAPc7iYYwJ5/c2/9mDspKFL0tpfPc6TKxImbcfB4n37Bag/nCKPXF9XdFciB7O3IWFYZ2vUGl4lOdp/8W74X/QQLT0jyRPPJt7iKnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6623.namprd12.prod.outlook.com (2603:10b6:930:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 02:47:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:47:52 +0000
Message-ID: <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com>
Date: Mon, 12 Jan 2026 20:47:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <aWWZb3eRfQdB4OsI@mail-itl>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aWWZb3eRfQdB4OsI@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR12CA0031.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::44) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a68143-8eb4-412b-9c5e-08de524e2573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MThlMHp1U3Rud1U5cWUvcXJvUWk2cmNLTVRaY09XelhLbGM4K2tlbWJCWWY3?=
 =?utf-8?B?R2F6ZXNkNjFkbmlaZkkwV1poeEhJYTg2ZGk5QU1Gb2VMTzRqMkl1NTExamVT?=
 =?utf-8?B?STRkUjhIRkI5dGVXa0g4bGxCSTc5MkcxRElmYVF6Zm5FNU5KaXI1cklDc1Ar?=
 =?utf-8?B?bHE5bDU1cjNpeTdPOWdEQ1RDWC9YODN0eUxnUU9Uak0yWElPYm5xcFcxTWlP?=
 =?utf-8?B?NitGZzlUZXFLYnpKUkhmK3BDUVJDUnBMVUNib0t0c25NeEk0OFNYQWwzYUdJ?=
 =?utf-8?B?UU1adWgyS2gzdG5QOTZCSWJ5Y0hiVXZvQUZUWUQ4VEMyVzMwOTNqVUp4UW1x?=
 =?utf-8?B?VE10QnRRZTh4UkdQMzJYazE3ck9YSkpwUElHbTFWS012M2UxYk5hTHpPWVNz?=
 =?utf-8?B?WWxTNkhxMENVUFNwai83ZmtTWnRwZkRpMmplOVNpQ0ljbXhkdnB0dlJib2hK?=
 =?utf-8?B?anNXMUREOHl6b3pkYUNndjhHVGhKaDQxbzhxRVU1QXhpc1lhTDYrb2trUjFX?=
 =?utf-8?B?ZzlKcEpwTTM1ZXRRUEZOamFTK050UmFZY0V2V20wRmpTNTE0VVJ4LzhCWGJT?=
 =?utf-8?B?aWtUSDAvblllTXFNWEg3NWVraFlaSzYzOHA2VTg2RWwvK2kzSVhIRWYxNFlm?=
 =?utf-8?B?a0ZaZ1cyQ2xVT1U0YU0vcFdWajl5UHpleFk2Q29lbzJoTTBiKzl0QUNnMVkv?=
 =?utf-8?B?OEFSQU9sTjBCM3hPeGNUWHgyUXp0QWplOFhGMmViMklUNDEwaW1odnZycWtC?=
 =?utf-8?B?eDF6djl1R2pFZm1uUlEwSUxQY096M3JnOGFiTnFxbEhpZXYybmVGekMrS1VF?=
 =?utf-8?B?dlJwR0Q0Njk0QjF6aGlBbU41UUJlcXJwUlJxUGF0UjF4aTA2V3d1bFpBWXZn?=
 =?utf-8?B?OU5NZnc2KzBhb1lMcWpZZnEzNHQrSjJaamtLbW54c0RmbTF5TjRPV3J4dVVk?=
 =?utf-8?B?OHRNRTc5Y0hEVnZNTjBtd1VQRndHZ2p2UEdZVFNrWHd1WVQzNFZSR2ZkY05I?=
 =?utf-8?B?NzlFVnVNMXhUYi9zeDVyK1poZ2xzclpNSVdTV0d4WmZ6T3lkd3Q1eDJvZStt?=
 =?utf-8?B?eG9Dd1dRVlRJTDNnWUVVNFNMZ0MxMlY1bzk0b2xocWZPQjM1aDRzTUVzUGYr?=
 =?utf-8?B?dm1RTEtYY3hVZXprSFNkZWtFeldNT0xtZndpeXhaRFFmYkhwL1JuUjVNVDgz?=
 =?utf-8?B?WE9iQ0IvWTdoRHZMb3ZTZEI3Qi9KOEVabENJUUlyUnRIVGRvbjBFUHZ0Rlhv?=
 =?utf-8?B?VXZaYVFWc0NXMVBycTRiaEg4QVhNaW1hd0RqRytnb0ZoS25ZMUhrVmMxRmJK?=
 =?utf-8?B?akNvL3paam9vNTBwUmd5MG9IbzdJT2NnbUxWRm5aZVF3dm9LNTdWT1RLazI2?=
 =?utf-8?B?OXlOdlNDb1dBTk5qME1FbXlTSEtDSE5QVFVtUFJTcHczQ1FCQS9BcU16Y2E4?=
 =?utf-8?B?YnYvKytKRFEydWpiMnhGYjR2Tk10Ri93MEdjSFFsbnhMY3Z6M0JlSTFIdTEr?=
 =?utf-8?B?UmFUZHFOSkxzVHMvc3lJMzZTNnVDbThwVE5rYU5uMzhMZW1WL2MvM0RXQWV5?=
 =?utf-8?B?WlFZTWxNa3d1YmVDaU1FeXRQR1RNUStuVDE4Si9kWi9Gb2hrL3grZ0Q4QVg5?=
 =?utf-8?B?aExuYlZCcmRzeGhya1Y0UHg5QmZnT1U2dDh3TktESGMxVVhqVkZ4MmJsbVVz?=
 =?utf-8?B?ajJoUHVBQ3BYcXpNOEl3VDBFZXZJV080SktldzFvWmcvWnU1TEV0djMzN3FN?=
 =?utf-8?B?U2dPRm1sMVUva2F5cFgzbjNuWmZzbW9FdVB4MFRTU3dHdXFmVjB5NHdkM29v?=
 =?utf-8?B?VHNQbDduUHFGWXFueVZKS2RDamx1SndEU1Y1cUdLaTYwZEVaRkdmbHFlYUhz?=
 =?utf-8?B?ZnM2UnZ3TWNoRmdtYmpaTG5nTXBoTEtkWitpOURwNnJ1UkhEdHNPSlduWERw?=
 =?utf-8?Q?Fry5LrR1f9K+iCcYvA8xxpPMqaAkhFL9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE9FUGtUUlRWNUw3SEhCb2lkVzVnUDF1eDF6ZUFuZW00ODdLK0RPa3dwSFVj?=
 =?utf-8?B?YkVwQmxyMXJFVWM2ekFIUk1ONkQyWG5mSVhDdFpHQkU2OEZLb21raFNweFJZ?=
 =?utf-8?B?WGVMTUFMSzdjL2R2SktPNDBaUnVmU2cyVFgwMXFOeXA5MXA4QkhxekNiTUV1?=
 =?utf-8?B?YkVoUVMwM2RZd1U5T0ZvVDNwbHRjVnUvOElDNVRqaFBucy95UGh5Yys5ekpn?=
 =?utf-8?B?dGp3ZXVVVmdwcXdGZTgrOS85Nko2QkNOWG9RY1F4UjBPUktFdEtaaGhad0JO?=
 =?utf-8?B?RXkrZXFwVHU1VHB2QUpla0FoblhGM0doK1VwYlN3RThKOU5zQWdPWEpTZDlF?=
 =?utf-8?B?M0s5ZWlBNFpaYUpLMWE2YllqdDBsbWF2TWRGUG9UcEE2aHZaNFZhVnk5N3dz?=
 =?utf-8?B?d3BkYUF4SW1Ca1ZXeXNadnRCV2cwZExWUzVzVm1tQmFIUTN5aDVZekVkazR6?=
 =?utf-8?B?SmlFWm9uSjJBOWJFM3VmUWt2Yk5BTmNuYUg1Z2JoYkVid1VhY2JFdEd5MUdH?=
 =?utf-8?B?YnBpTDlPZWxFbWlnS3VwMUxGL3NNcTBheHhzcEFTem1FaHB0UjIyTk03LzJN?=
 =?utf-8?B?bmtKTlJlNVZWTUtRM2E2ZTV5UzJrYkt2ek45K1R5Q2w2dnBwTHJMNmY1bjB3?=
 =?utf-8?B?NVNLcjJENk16bDRPYWszL1c5QjN4blNHc3NCaWhkQ0hZakg5ZVVxNzFjK1lw?=
 =?utf-8?B?QUgrdEFsckMvcG5sZTdQeGtwY2o3ZCtDWDBoNnRKTDVzN1BkS2xabVdUMnNB?=
 =?utf-8?B?L21yVGdpV2lhai9WUm14MEp6bUM0ZVNPb0JRRXRsMUVwSTRJWEtob01vWHha?=
 =?utf-8?B?QVFWL1pXdjl1TVo3cmtUZ2NyUlZoS2pCM1hYdkE2UTJLYk9aMUxtNlV3VytP?=
 =?utf-8?B?aFZ2OXVna0VLTmFvdlFMaGlHcEhxUmJKUi8yU29EV2ZXcnNwYmFvcUJ4U01D?=
 =?utf-8?B?NTBpNnFtRUxWcGt5QXorUjRxSGo1MEFVQWlwWFA2OG9nUXROdHdXZHA4dnhu?=
 =?utf-8?B?MXM1WTNuWHM1NlFIaGhPRkZqc0I4Z1VQZXFzcU1VWTF3ZGdLOXFFQmNjL3Yx?=
 =?utf-8?B?bXJTN3dZcjRsUHp2NERoSFFTSHdXN0tBbkQ4Y0l0bjh3VUJyMTF5V1hUVm1G?=
 =?utf-8?B?Q3JoYmZDZ05nbUN2N1o0NUtWQ25xcmI5YURlc2RPdmJPemNXYUx5a0xhbUZ3?=
 =?utf-8?B?TTlpbktuQmhhQXBmR1p2T2hBVCtadEh4WnVvZGlRRzRocmVpcHNaTyswQkw4?=
 =?utf-8?B?SDM5ZXhSNm1YQXEvblRPNW5PWXluYTNiUlYwZWw2V3gyVEtINmRvdGJCK3pI?=
 =?utf-8?B?WU1wc2VWMEN4UnBXcmREbktudXd2ejRnYzdFcFcwNmRhUHcxZlNLb2ZXcnFR?=
 =?utf-8?B?WS9UaGJmYnNBWEs3YTY1RVN6OFBybDVuckU3SnUxdkhpTmNnQmpKYm9rM3kr?=
 =?utf-8?B?Rk5temJURmNkWEZlaDE3YmFjckQwMEhHK0hpMHZFT0VwNjU3a3l5TEg0cHdX?=
 =?utf-8?B?RmFaMHNDQXBRdUoxS1lvdmJVQnZLQWg5MTZZVWR6MlBWUFAvcXVxR1N1eG10?=
 =?utf-8?B?VUxubVUySVJXeTM4czloWEJaNVkvcGUya2RNWWRvVGhoeEpCSmsrRGdrNCtz?=
 =?utf-8?B?cmt4M0RaUG5IQlpUL0xwT0ZDWWdyazJvMzZvRHVOQndJZEU0ZkJxNHVyZ3RD?=
 =?utf-8?B?YjNIc20zN0xsaTJtVU93c3dtVlMvV2E3eEtlU01LRU4wVW56R2Jmaks4RTBn?=
 =?utf-8?B?RDFiYkFhMVRqejJKTU9hd3VlTjlVc3NsZkxWTU94TXlwTGZ3MVNlVG9KcWVE?=
 =?utf-8?B?c1hza3ltTXZNMFg2SFZISVlNa2V5anFlMkZGN01CZkI4ZEhrRFh4Mk9Bd2hN?=
 =?utf-8?B?UU5oekJpZks3cmVObGgwOVJFUk9zSDZqRWNUVzBnZjFRbitVcXdlQWVkY3Vv?=
 =?utf-8?B?MnZ6SFpQUVVQV3BISnVnKzd2NFVFVVpVSTVOS3RYdnZZeWNNcnlvM0lOQ0hm?=
 =?utf-8?B?YklzdTFvK1hWdnk2ZFN4bit3c0g1MW16eittN091bk83MkYxaDVvWGJCcGdu?=
 =?utf-8?B?eHMxVDZ0REdVd0p3VHV2b2J6NlhiUnBVa243K2pVZlFLblNkMWdsK2svRVFr?=
 =?utf-8?B?QTZtYU9GdnJwMmFBZG80bEtEd01hWDFTdlpudVFtUGlpVTlzZzJDSnA5Z3dY?=
 =?utf-8?B?K2Q0V09hd1FINWtKNFdyamgxamZNeW9vSTBpSzVQN1kwM0FYekErbmJvQ0F2?=
 =?utf-8?B?TVgxUHdKRmp3R3FWOEI4RE5sZHV4QWMxQ0Y2ckkwS1dxUVRpQVBzYTVxZE5a?=
 =?utf-8?B?MU5ydlZ3ZHhYSUlWOXd1MHZwZVgzcW5nUktpRHFac25ZRCtEQnhLdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a68143-8eb4-412b-9c5e-08de524e2573
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:47:52.3986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mu1DJn9hsuQjgiaBNelfFYDMQH0CYTqRnkEpWmTQSJdcfMW41bCjq2eLh4ALdP98YFS8WKufB5WAxufT/ag5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6623



On 1/12/2026 7:01 PM, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
> with AMD Raphael/Granite Ridge USB controller passed through.
> It worked correctly in 6.12.59. Between those versions, I don't see any
> relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
> but the AMD node driver did got some changes, so my guess is one of them
> is to blame. I know the good-bad range is huge, but there aren't that
> many changes to the AMD node driver in this range.

Is this perhaps a case that only the USB controller was passed through 
but that the root controller wasn't?  That would lead to a case that 
amd_smn_init() was never called and thus amd_roots was not initialized 
properly.

So it would be a NULL pointer deref.  If that's correct, something like 
this should work to avoid it.

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 3d0a4768d603c..894823b444d47 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -91,6 +91,11 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, 
u32 address, u32 *value, b
         if (node >= amd_num_nodes())
                 return err;

+       if (!amd_roots) {
+               pr_warn("AMD SMN roots not initialized.\n");
+               return err;
+       }
+
         root = amd_roots[node];
         if (!root)
                 return err;

> 
> It's running on Qubes OS 4.3, which uses Xen 4.19, and does PCI
> passthrough of USB controllers to a dedicated VM (HVM).
> 
> The full crash message is:
> 
>      [    0.302571] pci 0000:00:08.0: quirk_usb_early_handoff+0x0/0x180 took 16590 usecs
>      [    0.303172] BUG: kernel NULL pointer dereference, address: 0000000000000000
>      [    0.303189] #PF: supervisor read access in kernel mode
>      [    0.303202] #PF: error_code(0x0000) - not-present page
>      [    0.303216] PGD 0 P4D 0
>      [    0.303225] Oops: Oops: 0000 [#1] SMP NOPTI
>      [    0.303236] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.9-1.qubes.fc41.x86_64 #1 PREEMPT(full)
>      [    0.303258] Hardware name: Xen HVM domU, BIOS 4.19.3 08/26/2025
>      [    0.303273] RIP: 0010:__amd_smn_rw+0x30/0x100
>      [    0.303288] Code: 05 bd 44 b8 01 66 0f af 05 2d 44 b8 01 41 57 41 56 41 55 41 54 55 53 66 39 c2 0f 83 c0 00 00 00 48 8b 05 c3 61 d7 02 0f b7 d2 <4c> 8b 34 d0 4d 85 f6 0f 84 a9 00 00 00 80 3d a4 61 d7 02 00 0f 84
>      [    0.303327] RSP: 0018:ffffcdd30001fd68 EFLAGS: 00010297
>      [    0.303341] RAX: 0000000000000000 RBX: ffffcdd30001fdb4 RCX: 0000000010136008
>      [    0.303359] RDX: 0000000000000000 RSI: 0000000000000064 RDI: 0000000000000060
>      [    0.303377] RBP: ffffffffa684bb80 R08: ffffcdd30001fdb4 R09: 0000000000000000
>      [    0.303395] R10: ffffffffa7567420 R11: 0000000000000020 R12: ffff8dd081dff000
>      [    0.303413] R13: ffffffffa736ab60 R14: 00000000055ee14a R15: ffff8dd081dff000
>      [    0.303434] FS:  0000000000000000(0000) GS:ffff8dd0e87c1000(0000) knlGS:0000000000000000
>      [    0.303452] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      [    0.303468] CR2: 0000000000000000 CR3: 000000000c62c000 CR4: 0000000000750ef0
>      [    0.303487] PKRU: 55555554
>      [    0.303495] Call Trace:
>      [    0.303504]  <TASK>
>      [    0.303513]  ? __pfx_quirk_clear_strap_no_soft_reset_dev2_f0+0x10/0x10
>      [    0.304112]  amd_smn_read+0x27/0x50
>      [    0.304112]  quirk_clear_strap_no_soft_reset_dev2_f0+0x37/0x80
>      [    0.304112]  pci_fixup_device+0xf6/0x1b0
>      [    0.304112]  pci_apply_final_quirks+0xe9/0x280
>      [    0.304112]  ? __pfx_pci_apply_final_quirks+0x10/0x10
>      [    0.304112]  do_one_initcall+0x57/0x310
>      [    0.304112]  do_initcalls+0x1ef/0x240
>      [    0.304112]  kernel_init_freeable+0x187/0x210
>      [    0.304112]  ? __pfx_kernel_init+0x10/0x10
>      [    0.304112]  kernel_init+0x1a/0x140
>      [    0.304112]  ret_from_fork+0xf2/0x110
>      [    0.304112]  ? __pfx_kernel_init+0x10/0x10
>      [    0.304112]  ret_from_fork_asm+0x1a/0x30
>      [    0.304112]  </TASK>
>      [    0.304112] Modules linked in:
>      [    0.304112] CR2: 0000000000000000
>      [    0.304112] ---[ end trace 0000000000000000 ]---
>      [    0.304112] RIP: 0010:__amd_smn_rw+0x30/0x100
>      [    0.304112] Code: 05 bd 44 b8 01 66 0f af 05 2d 44 b8 01 41 57 41 56 41 55 41 54 55 53 66 39 c2 0f 83 c0 00 00 00 48 8b 05 c3 61 d7 02 0f b7 d2 <4c> 8b 34 d0 4d 85 f6 0f 84 a9 00 00 00 80 3d a4 61 d7 02 00 0f 84
>      [    0.304112] RSP: 0018:ffffcdd30001fd68 EFLAGS: 00010297
>      [    0.304112] RAX: 0000000000000000 RBX: ffffcdd30001fdb4 RCX: 0000000010136008
>      [    0.304112] RDX: 0000000000000000 RSI: 0000000000000064 RDI: 0000000000000060
>      [    0.304112] RBP: ffffffffa684bb80 R08: ffffcdd30001fdb4 R09: 0000000000000000
>      [    0.304112] R10: ffffffffa7567420 R11: 0000000000000020 R12: ffff8dd081dff000
>      [    0.304112] R13: ffffffffa736ab60 R14: 00000000055ee14a R15: ffff8dd081dff000
>      [    0.304112] FS:  0000000000000000(0000) GS:ffff8dd0e87c1000(0000) knlGS:0000000000000000
>      [    0.304112] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>      [    0.304112] CR2: 0000000000000000 CR3: 000000000c62c000 CR4: 0000000000750ef0
>      [    0.304112] PKRU: 55555554
>      [    0.304112] Kernel panic - not syncing: Fatal exception
> 
> The device, as seen from within the VM:
> 
>      00:09.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] (prog-if 30 [XHCI])
>          Subsystem: ASUSTeK Computer Inc. Device [1043:8877]
>          Physical Slot: 9
>          Flags: bus master, fast devsel, latency 0, IRQ 21
>          Memory at f2200000 (64-bit, non-prefetchable) [size=1M]
>          Capabilities: [48] Vendor Specific Information: Len=08 <?>
>          Capabilities: [50] Power Management version 3
>          Capabilities: [64] Express Endpoint, IntMsgNum 0
>          Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
>          Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
>          Kernel driver in use: xhci_hcd
>          Kernel modules: xhci_pci
>      00: 22 10 b8 15 07 04 10 00 00 30 03 0c 10 00 00 00
>      10: 04 00 20 f2 00 00 00 00 00 00 00 00 00 00 00 00
>      20: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 77 88
>      30: 00 00 00 00 48 00 00 00 00 00 00 00 2e 01 00 00
>      40: 00 00 00 00 00 00 00 00 09 50 08 00 43 10 77 88
>      50: 01 64 03 00 08 00 00 00 00 00 00 00 00 00 00 00
>      60: 31 60 00 00 10 a0 02 00 a1 8f 00 00 30 29 00 00
>      70: 04 0d 40 00 00 00 04 11 00 00 00 00 00 00 00 00
>      80: 00 00 00 00 00 00 00 00 1f 00 01 00 00 00 00 00
>      90: 1e 00 80 01 04 00 1f 00 00 00 00 00 00 00 00 00
>      a0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
>      b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      c0: 11 00 07 80 00 e0 0f 00 00 f0 0f 00 00 00 00 00
>      d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> Any ideas?
> 
> Original report at (with full kernel log etc): https://forum.qubes-os.org/t/yet-another-usb-keyboard-thread/38355/8
> 
> #regzbot introduced: v6.12.59..v6.17.9
> 

