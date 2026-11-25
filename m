Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795590534;
	b=FyomY72MlB8Ts0J2fqhffHVcVgOUZoNiXqLNl4ZSuIKQgKBkKzxjfhhEYnSM8liafb1m
	 6/rS6uJznN1wxSoU2i00iAUGlM0sIXIhwbzCHfGAUhhXAw/i9mn77paPGmZ+SJh3nYtL4
	 qG0lubVRlpYtPCDKzCHZct4fjfYwNsKXjFb9bxh3tikWJoIrJlNNW6qeLt9t+N9nG/oTM
	 B2+Tj4BYRn5SyEMRHCTKItFZLH+6JTYDTDEs/FOiD2ySyhb7/kam4dFpo4Q3kwBJqs32O
	 u+9k27HbCmCvOArR74MKlqFRArHC1THEUqqIpiFXY0LkfmrOGLBjZYwiK1Cg1OnEHzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590534;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:Cc:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TTGkgqVGq65gkbnsjtbOkjWAYreGpgNwIkoZKblVKDo=;
	b=RaN9dTdS0EMP2S+px0HpS0CMjpZ52D3VDHCs46RjcayF2nwlzsN1hoI/OxwbvMYPG0QP
	 IeyCFAbZ2PjM5Or6iWaMRp+L8PQXOgFGudSI2rDvEIXVJO/Te7rOoYvhjwaDbt3bko4Es
	 1NDw32mAg8ehd1xGSd74d/yCYor1Vgs6Ff+KlS8uLlH0LzzZFJCJGES/pmEnGCeG3Y0Le
	 01wBWRZMijt60fFpCpAiCOFihn7o24OKIa5emRuXrdGSZWFKAziNOe2RJXRnwfBKRtO2j
	 gx6FZO1XF7+Ww+kE8Aw3MRTEkaT60HVA9D3SoKmsR+G4dI6s/gQyK8DwVZolfMs2h/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.kr;
	spf=pass smtp.mailfrom=outlook.kr;
	dkim=pass header.d=OUTLOOK.KR header.i=@OUTLOOK.KR header.a=rsa-sha256 header.s=selector1 header.b=vFd0gxv6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.24
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011024.outbound.protection.outlook.com [52.103.43.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814F6606A6AE
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 07:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 814F6606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.KR header.i=@OUTLOOK.KR header.a=rsa-sha256 header.s=selector1 header.b=vFd0gxv6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqX3uA3sD+aSl0pK/jWF0QncgLv3NX6d+XPNhlLV/yPLHrI5ORLX1GPgRrtf6kePm96fJ14fRuaifzLV9S5/IRSAXhW7ahldGQSqZtTTUiNki8Jq2YGbYYMkI1nJaerg13/p4N5yzF57bb+kk0kMwA+XqQ4myMHfMvObBGvX+79JrEAG+pDmS3JHqnchAqoGiSFMrRHtHGe3wiXPX/01tlz8MICNan+Hs49fjbKQ98DkEB48MnnKwsg3z25NvjV1IHUG9DC2n6HEuN0kNMCHgclM+UL7uiEaB87zHmpbgv8ClaYb72w4GrSrIXxE4nfOn7o9P/k9lM3JbUWdeVVSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTGkgqVGq65gkbnsjtbOkjWAYreGpgNwIkoZKblVKDo=;
 b=IV48f5T09Lo88lrwBHWUlvqQW6+uFmiESEMvyNiMwbKt1sn5DpFeJq1hoZ7fUqzt9SN6OuCKu2NkMBmWwZBTjzFphFu2sX+4hb9OT++hPQU/senL+8VD8G7nbfM7XBrWT4cq7OVHORNUof/5a8IY0GhU8OwNyhFGC97/VlZh0syf6m0lcSEYMRkrscFUw3qtOxGSe/ViI/H8cZJ3Wfon+XJBY7TUz3opPwYC4uX0AuqOIIIJphf6tWkZ/bZUuLTSjxeOxetLklpqcgjxizUYrxL2to4WeXLj3Chkoho0c4jdOc43j+EJHk5ufILWB9PuI9U2d6FQvwxfdKfb22WxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.KR;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTGkgqVGq65gkbnsjtbOkjWAYreGpgNwIkoZKblVKDo=;
 b=vFd0gxv6hepo5MlOTVjYTIcVSOSpxQoP/FkZ6mLh5VotzZb6mjJvyVbghb0J8IQ9taUHhiUfq/pg6m3MEis9h1YG820UJvZ1MHXQA8q+KEyacwVgfnIUdK6SGOyaghNpST9u6iD2RUsqIzoOkExWbznzOioi4Y/zdDNYw/mfjCM0q+ONnKRetbMOsA2qfMD4vIJaUgW6H4Wf7IXdB1epgc06idhzMV/NwPFDDmYg71cg2SFd+gQHQmaZ0FKEugjQPokUF3ta3efGCv1aj3qnKGGa9J5Udak22bKtemB8KwDWF7GcPQHf1UHanzOqXfPbpkXgJnTVGMLYEUPOGXVanw==
Received: from OS7PR01MB13914.jpnprd01.prod.outlook.com
 (2603:1096:604:36b::13) by TYRPR01MB13233.jpnprd01.prod.outlook.com
 (2603:1096:405:116::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 07:08:47 +0000
Received: from OS7PR01MB13914.jpnprd01.prod.outlook.com
 ([fe80::641e:83cf:743b:85bc]) by OS7PR01MB13914.jpnprd01.prod.outlook.com
 ([fe80::641e:83cf:743b:85bc%7]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 07:08:47 +0000
Message-ID:
 <OS7PR01MB13914328949FC969309913E1796432@OS7PR01MB13914.jpnprd01.prod.outlook.com>
Date: Wed, 25 Nov 2026 16:08:45 +0900
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
To: Thorsten Leemhuis <regressions@leemhuis.info>
References: <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
 <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
 <b89b83ee3de3ab113820ad94cf09be6b98ec3585.camel@redhat.com>
 <b2c5e6b7-d579-449c-b894-ee162230e328@leemhuis.info>
Content-Language: en-US
From: Eric Kim <seohyun.kim@outlook.kr>
Cc: dakr@kernel.org, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <b2c5e6b7-d579-449c-b894-ee162230e328@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0016.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::10) To OS7PR01MB13914.jpnprd01.prod.outlook.com
 (2603:1096:604:36b::13)
X-Microsoft-Original-Message-ID:
 <b8260d8b-b451-4831-a162-7549f7b419f1@outlook.kr>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13914:EE_|TYRPR01MB13233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a5c0b81-b5e6-460b-6a0a-08df4ac2f301
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|19110799012|8060799015|25031999004|5072599009|15080799012|6090799003|23021999003|12121999013|41001999006|1602099012|10035399007|40105399003|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3I3SWVlQzczYVc3aU1PT2gyWDlPRW9oczRNbFFpTmYvendWdEJMMFBuV0Zz?=
 =?utf-8?B?RW9USTZxd2xnTXl5MFFwbzlIcE9FT0NKVm15cnhUT2VleEh5empsS3ZZRHNh?=
 =?utf-8?B?U0U1Kzg0YUVLQkt1K0xMWVRPSTRiUW8wQVVVRGxxeHZyN3FKcTM3R2JVNmk4?=
 =?utf-8?B?TStxUkw4Sk4yVHJWeVZ3WDlhV1hRQzkvSHJTL3NuRVZ0RmFqcWJtalV4SXU0?=
 =?utf-8?B?RWJMdEJMUnFwRVAxN2NMcUxYeCtLclVwS2lkcGxuSHAxay9aUURmdnQ1K3dV?=
 =?utf-8?B?RTF6bTRTM1hNbFo4eWJmLzN2T1ZwZkhvOFNtWDJLc2YrRW9oZFd4NzNQVkdO?=
 =?utf-8?B?VFdsY2xpSkhORldXSlhLZmhScXIwOHV1SWhRdHluYXBhTUVoWnBQc3BSbmgw?=
 =?utf-8?B?QXNTYVlsOW0wcmNXajJzZndIbmt6NTZkL2dsNGZNNmFuNDVDZDZpWnpDcVlj?=
 =?utf-8?B?bFZqdFFBQ3RqOGw1N3QxTjQzYlRVaXJTYWVuTVpRVkNtSUhaay9lbHAxSS9B?=
 =?utf-8?B?SDY1WVFiVytJNm1MTG5lUVR2bWFoQ0hUSHhwNk05YUlxNVppNkl5NzBCclIr?=
 =?utf-8?B?RGxYcFMyY1pnMzBvVTRCd3pBL1V5eXllaVpGVHBtZStPY0xyWjVkcXZpaGxT?=
 =?utf-8?B?Rno3OVhxT0VRNXd4U1JZQ2ZWWGhUejBNWEczdE5heDlCdHZ1Z3E3eEI4TDNL?=
 =?utf-8?B?QnRieWhucmMzM21xTkxCd3QwYUY2eUdlOUVJem1LbUNOOGZsV3BScEs4ZzJj?=
 =?utf-8?B?TUcyWXlhQXJia0VpcDd1b1VnZzQ4SittL1NJYTVodkp3VXpmNUo4NmVHSUFk?=
 =?utf-8?B?eENQb2w5UmdWbUlTQVNqbzdacVNNelZnanR6YXlxSXc2ekZXVUg4bXhuYzRk?=
 =?utf-8?B?WFdLN0lkS0J5Mmd6S2V5R2FycVd6UDhUQjlRZEJsVGUvelRzNHVROFNqcWN5?=
 =?utf-8?B?WHVlejZMeFNWOGZTdVJjOFBpS2Rzcm5ISTJicTJ1TG1YV3lVOGxiVUpYY0pD?=
 =?utf-8?B?Szk2MGQ2aVVlVXBXTnVyeHlkZU95WjR5cGk5Zk5HMFlvaGJ3dDV4cHpvcmQv?=
 =?utf-8?B?Qk5Yb3I5UEJPc0FhUHQ1QTRScVVkcDdZTElrUzVDTWIzQnMxTGhPOXhMOGJy?=
 =?utf-8?B?NlhaMVB1OWN6RDdaM0tsSzdpTVhnTXM4dmtHWDhKdEwvYlU3bTNKWThqUVlW?=
 =?utf-8?B?WGxPUTVlVFpndXJXQ2NzTkgzaVMrZFgxUGxIU2hxUGxsVzMvOS9EM052NlJZ?=
 =?utf-8?B?QWNlNFl2elRKRHYvcVR2MXZCeE9paUE5cHEyMGwzQTMzSWY0SzNRdEVyTUsy?=
 =?utf-8?B?bS9lL055amFRRjVUa25xNGR1RUE5TzRyOUMxM1hmVU91NTE2VFNlaGNhUnU1?=
 =?utf-8?B?ZXBpUzNRVjJYa2FNRXVoaWpMZ05DeUlEM3NYTXh6bDF5ZjBRZ2llZWhZWVNX?=
 =?utf-8?B?b2k0QTA0d05wQUVkQURGemxPZUZnRUJUS1hzWXVpaDlIQWkvSFljNVVZbW1L?=
 =?utf-8?Q?MF/zig=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2kza1pNdy8xdkdpb2htUEE0c09wUEM1WEJOYmlqOWVIVjZnRVdsVGZrcHht?=
 =?utf-8?B?aHNtT3hCT3J3VEhaTnk5aFNEQUh3d05Iai92T1VRMzRaaU9hNk1ycTdGd1Zs?=
 =?utf-8?B?VzJpcTlGNWQwQ3ZwdVJXZWttdFlOSkY1MEZka0M5Vy8zVEQ4TzBad0s3UWE4?=
 =?utf-8?B?eDc5M09pTnZOclpudGE2YU11QUw1TFN6bnQ4NHJhMzJJSi9WMW00Yjd0MjZF?=
 =?utf-8?B?SXFIdlhUOU9Gck90V2FSdkZCbURuK0E1Y1NQeHVRanl0TWtaZmRReXd2b3pQ?=
 =?utf-8?B?SkxpOVFjVzI5MW9zaVFNWU9xY0h0bzlVNW9jNStOT3I2aG4vVERFV2ZwYmtK?=
 =?utf-8?B?dGJHY2NIUkdFYlhZMTV3RFU0SzcvcWhkVmhVNzJENCttcTJKNUNWSUYvUFcz?=
 =?utf-8?B?SkZFVmZqdDcwR1dkSUl1K1FmRXRYSlhkUDVLZVkrME5NQnJPSTlxWGZzNmZo?=
 =?utf-8?B?TUVqZGwvZFUrdXR1ZlBCKzRmVWYxRE5SQVBvU09zMlhUOWVPcWMrVUd0Qng0?=
 =?utf-8?B?M3ZhODR3a1l5VmFKc08yS24xRm5sZkZnWFUyMG5hL0hCVG1pS05MalFjTkd1?=
 =?utf-8?B?NGdqMjFiYnJ1MVN5dGN6aENHR1k0dlBoTVRZaU8rVHNhWTJaeWJwZ1Y1ajF6?=
 =?utf-8?B?S2hTdG5oaWt1dElkc0lDMVlaMythVVkwWFBBTFphM2VTOTdVc3hTWXFLY2lZ?=
 =?utf-8?B?enJvYnJXRE5oemlMTGhMVE9ncjYvc0lZbndRNjhyR2svTEpFN3NQZnl3Mk5T?=
 =?utf-8?B?UE1QZlRrazl4SEw1cm95Zi84SmFkd0xhVUo1dFFJOFNmR2lSZWJ4Mmo3Qmdi?=
 =?utf-8?B?a00wUGpZMFdFTnRlVWJIVjgreWZzTXVKbVB0Y3Q2WW1naHBGS2Y4TGJQcmc4?=
 =?utf-8?B?S2x3YVRXR0tuMXBiRVlrdUVGWFRQcS9QRHRRK2VZOE9FZE5EYlUyM0ZOajV1?=
 =?utf-8?B?cWZ5TFRjbXdNUjIvdjVOMVhBemwrcmk1NTVFWDZ1b1kyWUhyTGdtOVZPRjR3?=
 =?utf-8?B?SVpPc2tualpPKzJ1ZUI4UFIrdlVrL1BUZEVNa0VBMzQyL2krRzdmV2EvNlRE?=
 =?utf-8?B?dTdzM0g0Q2xlSkRpYzNmNWhlMkpDTjI1NHoxM05qL00wYzQvTi9xTlNxUzVa?=
 =?utf-8?B?QjBIVmNmUW56cEQ4THdHVVFNRWR2dHZFM2Y5RE9PSTRxK1JLaXZNRjhjbzd3?=
 =?utf-8?B?V3JSZTFDeU1nZzBXK0pFVDkxOXg3TUtiTll2dUk1Q2hEOGJ2eU1qSUEyUFJG?=
 =?utf-8?B?YzhPZnZXZFh4dDdJaDJFbjF2OWNsV2M2RmZpa2xsbWM5bkJsU09GcVk2ZEdL?=
 =?utf-8?B?ZERHYzg4bEZTTHg2Y0dndFBRSlJYRHVtN2dvZzFWcTVuMEVzK3VUYkZDR3F5?=
 =?utf-8?B?WDUzZTVrQ2x5dm1OcFp6OXVsY0s1cHE5cTFJV3dHbCtZM1N1UXpBVWJDRVA4?=
 =?utf-8?B?SDY4NGJRdWptYXNVaVNWWEN6YktVcGVhWW1FbTM3WG11ZXI0NzBaSWRsU0E1?=
 =?utf-8?B?Q2pkQk1abTFxU0Fzc2ZoYXJGU0NJSEhQTXVERGIycTNBUDNGbWN5LzBGTzRx?=
 =?utf-8?B?UHlBL1JHZTd6N3dEMVRXQ0s4MlgwUjJmVWhobHFIL3Vxem5DcEdKckhJVUJt?=
 =?utf-8?B?QVV3L0tWcXkwRENNUUg0MlRscEFPcFRNbTN2d3BFZmZSSUkzZDZWeFJJNHJQ?=
 =?utf-8?B?OHF1VVlwbEVmbEY4WjJzM0F6YjZiQ0Z0S09RRXJSRVN3alFmU2FFM0NMSEN6?=
 =?utf-8?B?L3VzRTBVdGs4ZENyejBmZzNEZDM3UTA4anRoaDVpcWpNc0hSVmNLb1hmTklx?=
 =?utf-8?B?OE03TkhhaGlCVjNySDVPSzZBcGdoTTFFQW5IZGhScElVdnVaa2ladlhySnJ0?=
 =?utf-8?Q?8FE2qOYg4gqfq?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5c0b81-b5e6-460b-6a0a-08df4ac2f301
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:08:47.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13233

On 11/23/26 7:55 PM, Thorsten Leemhuis wrote:

> On 11/10/26 01:54, lyude@redhat.com wrote:
>> Hi - I'm back! Sorry about this, I've been busy moving and only just
>> got my machine setup. I will take a look at this tomorrow
> Any progress on this? Looks like nothing happened, but it's easy to miss
> something from the outside.

I found other reports that display the same behavior on NV50 and up platforms
regarding the same issue.

Link: https://lore.kernel.org/all/96444f8e0155d34c7a07fd5cc67ed87784bedd38.camel@gmx.de/
Link: https://lore.kernel.org/all/629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel@aol.com/

It seems like it causes problems in systems using hybrid graphics, combination
of iGPU and external GPU.

> Just wondering: should we maybe just revert the culprit for now and
> retry in a later cycle?

I was considering to revert the commit, but it seems like Dave already fixed
The problem.
Link: https://lore.kernel.org/all/20261111-nouveau-atomic-fix-v1-1-118e65d3a2f5@redhat.com/

> Ciao, Thorsten
>> On Mon, 2026-11-09 at 08:45 +0100, Thorsten Leemhuis wrote:
>>> On 11/2/26 13:47, Eric Kim wrote:
>>>> On my laptop, which has GP107 GPU with intel graphics and uses
>>>> nouveau
>>>> driver, booting kernels after commit
>>>> 2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer
>>>> dereference
>>>> at initialization.
>>> Thx for your report. Hmm, no reply yet afaics. Wondering if it would
>>> have been better to report it at the dedicated place for nouveau
>>> kernel
>>> bugs: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/
>>>
>>> You thus might want to at least check if any similar reports are
>>> found
>>> there.
>>>
>>> Would also be good to know if reverting 2652aca460dc ontop of latest
>>> mainline fixes this.
>>>
>>> Ciao, Thorsten
>>>> [   17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on
>>>> minor 0
>>>> [   17.556364] nouveau 0000:01:00.0: [drm] No compatible format
>>>> found
>>>> [   17.556792] nouveau 0000:01:00.0: [drm] Cannot find any crtc or
>>>> sizes
>>>> [   17.557237] BUG: kernel NULL pointer dereference, address:
>>>> 0000000000000000
>>>> [   17.583880] #PF: supervisor instruction fetch in kernel mode
>>>> [   17.598078] #PF: error_code(0x0010) - not-present page
>>>> [   17.601475] PGD 0 P4D 0 [   17.608839] Oops: Oops: 0010 [#1] SMP
>>>> PTI
>>>> [   17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tainted
>>>> 7.3.0+
>>>> #1 PREEMPT(lazy) [   17.608954] Hardware name: SAMSUNG ELECTRONICS
>>>> CO.,
>>>> LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS P11RDV.075.170829.XJ
>>>> 08/29/2017
>>>> [   17.608990] RIP: 0010:0x0
>>>> [   17.609090] Code: Unable to access opcode bytes at
>>>> 0xffffffffffffffd6.
>>>> [   17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
>>>> [   17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RCX:
>>>> ffffffffa97d8091
>>>> [   17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RDI:
>>>> ffff89b74c466800
>>>> [   17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R09:
>>>> 0000000000000000
>>>> [   17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R12:
>>>> ffff89b74c466800
>>>> [   17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R15:
>>>> ffff89b77f1a2400
>>>> [   17.610320] FS:  00007fc4a888d780(0000)
>>>> GS:ffff89bac4364000(0000)
>>>> knlGS:0000000000000000
>>>> [   17.610357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> [   17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR4:
>>>> 00000000003726f0
>>>> [   17.610448] Call Trace:
>>>> [   17.610483]  <TASK>
>>>> [   17.610521]  drm_atomic_commit+0xb1/0xe0
>>>> [   17.610558]  ? __pfx___drm_printfn_info+0x10/0x10
>>>> [   17.610590]  drm_client_modeset_commit_atomic+0x25c/0x2d0
>>>> [   17.610618]  drm_client_modeset_commit_locked+0x5a/0x170
>>>> [   17.610647]  ? drm_master_internal_acquire+0x1d/0x40
>>>> [   17.610675]  drm_client_modeset_commit+0x25/0x40
>>>> [   17.610700]  drm_fb_helper_single_fb_probe+0x1aa/0x1c0
>>>> [   17.610729]
>>>> __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
>>>> [   17.610754]  drm_fbdev_client_hotplug+0x79/0xb0
>>>> [   17.610782]  ? drm_client_init+0x13e/0x180
>>>> [   17.610811]  drm_client_register+0x79/0xc0
>>>> [   17.610839]  drm_fbdev_client_setup+0xc9/0x1c0
>>>> [   17.610867]  drm_client_setup+0x6a/0x90
>>>> [   17.610893]  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
>>>> [   17.610922]  local_pci_probe+0x4a/0x90
>>>> [   17.610951]  ? cpu_hotplug_disable+0x15/0x30
>>>> [   17.610977]  pci_call_probe+0x5a/0x1a0
>>>> [   17.611009]  pci_device_probe+0xdb/0x180
>>>> [   17.611060]  call_driver_probe+0x23/0x100
>>>> [   17.611104]  ? driver_sysfs_add+0x55/0xc0
>>>> [   17.611137]  really_probe+0xd7/0x2d0
>>>> [   17.611171]  ? __pm_runtime_resume+0x50/0x60
>>>> [   17.611220]  __driver_probe_device+0x9c/0x1b0
>>>> [   17.611261]  driver_probe_device+0x1f/0x80
>>>> [   17.611297]  ? __pfx___driver_attach+0x10/0x10
>>>> [   17.611335]  __driver_attach+0xcc/0x200
>>>> [   17.611373]  ? __pfx___driver_attach+0x10/0x10
>>>> [   17.611409]  bus_for_each_dev+0x97/0x100
>>>> [   17.611451]  bus_add_driver+0x1d0/0x280
>>>> [   17.611493]  ? __pfx_init_module+0x10/0x10 [nouveau]
>>>> [   17.611530]  ? __pfx_init_module+0x10/0x10 [nouveau]
>>>> [   17.611567]  driver_register+0x75/0xe0
>>>> [   17.611602]  nouveau_drm_init+0x60/0xff0 [nouveau]
>>>> [   17.611633]  do_one_initcall+0x89/0x3d0
>>>> [   17.611667]  do_init_module+0x8e/0x290
>>>> [   17.611703]  init_module_from_file+0xc8/0x180
>>>> [   17.611736]  idempotent_init_module+0x23e/0x360
>>>> [   17.611773]  __x64_sys_finit_module+0x7f/0x110
>>>> [   17.611805]  do_syscall_64+0xbe/0x470
>>>> [   17.611844]  ? do_syscall_64+0x37/0x470
>>>> [   17.611883]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>
>>>> It boots without this problem when booting with nouveau.atomic=0
>>>> kernel parameter.
>>>>
>>>> My guess is that atomic_(commit|check) operation is not present in
>>>> nouveau_mode_config_funcs, and commit
>>>> 2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
>>>> atomic modesetting by default for NV50+ gpus caused
>>>> the problem.
>>>>
>>>> Also, drm_helper_(commit|check) was added to
>>>> nouveau_mode_config_funcs
>>>> at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
>>>> reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
>>>> unreliability.
>>>>
>>>> I hope this problem can be fixed at one of the next releases.
>>>>
>>>> Thanks,
>>>> Eric Kim
>>>>
>>>> #regzbot introduced: 2652aca460dc
