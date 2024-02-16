Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AADF1CF81
	for <regressions@lists.linux.dev>; Fri, 16 Feb 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708124503; cv=fail; b=pJQnHPM5xRT1KJTXM+wTWp3LePHRVK5rQayaqcwhWjMPiCTaouOCfJj9Q3ynJYglFuj17Vw7dlQ3M7bbAoWkxXGy6UAA5kAkrLf3djahMeEr+CFVxKEnweA678I+LReUwx6OLB5fu44bwS+O7CdoXbGNUWNPPgSkpa2vpG5fMgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708124503; c=relaxed/simple;
	bh=oJTP3qXvllkqPBAXH4PIQUrTxD8KtO0KLtCAX8zOD5c=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W1wfVW/1CjXqc8BWXnOch9MMXZa9Wsc0COIM1WZ4kw7npxCgiOKqfxXRZOZEorcGLISpvNebDE84/BbbPEuQwUAWDhmZ9L14+wHWFS2rhYQi9l0YVan/K529GducAoypKcLJSE+NZyXz2+Sh37is7OQFv9z9S6YinGYE2dnTK+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PPCdAuxx; arc=fail smtp.client-ip=40.107.93.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PPCdAuxx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js3ByOMFAOBNVMGx+l8Mjw3K1ArRLhgbceuT0n9dYtq9Tk3GFeQ/dnSGUZkKNiPZmodTwL1dj8v4ahIUThJT8rjLrqgiWgRN5oDU4O2qhtaAyzK4cNkYJk8mBmSPojPvG9DESsSGsEfpMKWIW/MFpt5xMyybP3f0Z77AMUA79e3ZWfOWyb0sm1IPe4Yf0ddLxBjVNqj4bubc71aowln/+j28jXQBiGHNLOTcGBapw71Riqcd7SFY5NDt1shcb+el/n5XF2h7lo4/wex8H+bPeZ+Qr0NTNwrQVPpxBRCV0sndX4q473IrZ3PCDbwk7csasSkbnz/tYMEXMx+ClEC4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym9R6I3RiCz6O/kC4Nw5ivWxS7Hm3se8kDvRjxy/kN8=;
 b=jeoeNCgq4L40fV6vzqqo1qbh70p7Hp7QKhTNsdy7Bzy8VCdFchQPHSoBD8wftk4DZf25W6mtVI75467Px7uYOVjc1Q8LowrSicuHsoqhl+CMyZ/j9CFK/7tG9jpCMk4VCiQ/KDDezhF3xAKkOp4IRgJ7GGEi1CMR3hJuOD+ppKKEphWt7xPQY+7YKcnuQXkCylKSDfmmqXw/r33idytJBgjU403ibwlq+gqZhv3kBjM2V/O58Uz+H1jV6pMkb0dxeLi3spac1Ckli7GQQUN6W4BorZzmur1kRdsdQWSkCDgCQ7XcI4C8prNlZ36/sV9vdK+mal3yGy06C2Q7y4cXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym9R6I3RiCz6O/kC4Nw5ivWxS7Hm3se8kDvRjxy/kN8=;
 b=PPCdAuxxPM+4cAgY8EnNxFksRZ8s5hHzMFs0oo09IoMPPXbbTfs+ZlN1hai10rkiPlkwHVstcu8YosNCWw/VoPSAPJhulq8j8WYnXTg0rD7CgxPuS7VMhc9ftUFQ4qDEolHzTQTSvAZPQWSGe/xLn5E3Y0dSZfa5lp1Jo4jv9TA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Fri, 16 Feb
 2024 23:01:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 23:01:36 +0000
Message-ID: <0a103f43-0340-4c01-8a26-ecdfc186915a@amd.com>
Date: Fri, 16 Feb 2024 17:01:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
To: Trolli Schmittlauch <t.schmittlauch@orlives.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
 <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0059.namprd12.prod.outlook.com
 (2603:10b6:802:20::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 605840d7-8771-44c6-1e0e-08dc2f433a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P6sInP+Zhq7aGQOG0Gm9AmhsfCsIr4StAvKHb3zrkJsjuAhnmNAQ5+8yY+WlbDFWZsOuxbIka/Sunr4FiCiAwSLbmZOq9e9deYDwuitQHA+Ih33QPQ7WMtqg22femlbobTOsWUuqkIEp+Pk5A8fk6Zpi4HkWFndZd0Fo6keDNZEKBAyVXGvRhZ+xIHHN+uFrx7XAd72y6ZzvR4GZTEIHXhKsen8hLDZsW+juNjpKKAFsVV1yNH125OkIxpQdChjSuKAoCay1wtXqAidvz1Pk4u2vxxvI0CZXX/SNz4xkjjWZUd0PL5dKJaLbNJdvzFI8kEhTbiMpnfHmQXltpVLcUn6svJlkaOqf2vCb7Zk7IwKSnhbzHeYaLDRgfSd/tIn24DwuEMaiI8NWmGsKEJecDJMXX3rF61jUB3m4qNSAQGXdnSV8nSXg0oz+x5mWOHQaFDgUpVeBJahGRI74VnxgNLa6HRjRuN8q5uOYrNabbQpOhEmPL24OrirxqXkvR1yGLC0+azPgcIpTJ8/2C62g99C4ermQxqwO+c6J5WUGmOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(966005)(478600001)(44832011)(6486002)(6512007)(2906002)(2616005)(15650500001)(66946007)(66556008)(66476007)(110136005)(5660300002)(53546011)(8936002)(83380400001)(8676002)(316002)(26005)(86362001)(31696002)(38100700002)(6506007)(36756003)(41300700001)(31686004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUVkbUJwN2h2V2xFTUpjZnJDZm44OGFyMG8xWU9SV3M3TWxLeGw4MDJRcko2?=
 =?utf-8?B?MVRYek84T1l5QXJReDM1amsxTGlmenNJZVNhaUlaaTN3WHdxTTV1a1E5T0RV?=
 =?utf-8?B?VG1HRTZib0x0K05wdEphNXRXMEJBUGJubmdxTitiR1dzTzRPSTQrUHlacnFv?=
 =?utf-8?B?cU1PeDVBK3Vod2RZZVVFZy9LSkFpdGVVSEF0ajkvTGRxS3h2ZTM5cy9jaWN0?=
 =?utf-8?B?Qk5HcXpzcDRMM2xycmFwRWZFNWkydzByN0RuVk5maXNLRWNrclZ6blYrMGZQ?=
 =?utf-8?B?SlhRTmFySDFKMUt1cTdMdk85OUN0azhaZDZWeDJqZ3luZDZZT3FNc3c2aWx4?=
 =?utf-8?B?Wm91dHVWRGdwM1h6MklJYWVYaUdwVUx3cW5Hc2V5MVd5U01BMm4rMkt6Y24w?=
 =?utf-8?B?alYrdFNUWC9DWVo5WC9LS1poN1hPbSt1MWhCZngxWEtmMFNxWmxyb1JNdFFD?=
 =?utf-8?B?UmUraXdUU1VFL0ZsODFCemRQZWM3QkY5V2JqSU9TSGVRbnE1ZlJ1ck92VTlP?=
 =?utf-8?B?T3FVWFZBaFZNOVoxcklkTmdHZHRld0JsWERyZDNTc3REQy9SNi90bHZxSk04?=
 =?utf-8?B?RFhVNE0zNnVVTjZQZWllZzBsTkNOQVExKzR3SUE1MjU2WW9kN3NvanU2N2FY?=
 =?utf-8?B?QllGbUx2alRhU1FkaTRvclZFZ3MvWkYyN1VQSVRlUDJNQUxUak1qLysydEtm?=
 =?utf-8?B?blF4dnZXQWFkdW5NNHhpQnU3N09xcGhzUlVGRWF3QTZjSnV5TWYxTVhMeGk2?=
 =?utf-8?B?RkorR3FiUmhzWlRiQVJ1S2F2TkV1b05YcFFXdmhDTGdET2FFNnVCcDB0WE9D?=
 =?utf-8?B?VVFvRFRLUDFyQndNeC9JVE14NDUxYVVNeCtPM0xVSElEckpodmcxNGZ6R05Q?=
 =?utf-8?B?dHNxQVNjN1lBRGpQN2NHSTdIODl5VFY1ODhzNUJZR0lUUHpkWExuVGUrQmF5?=
 =?utf-8?B?K014azNxZVBEbWQ1ODJpWnpPeHg1blJVZFkyYm9DYTVLaTZWZFpLSU1xSk1Q?=
 =?utf-8?B?NUtQVmJOaDllamErbU85ZFdmMEdiRTNDOWMwWWQvMklhd3g0eStzVW1HcjFH?=
 =?utf-8?B?TjY0K2NIWkxhUGZHQ2dIWDduN0VseGtueGw0dnBlZFIwbnNwM2NFWG5rb082?=
 =?utf-8?B?U1dlRXhnckpoMHRqS1daQkhUeGJuZDZqaWt2N1dnaVREZDV1Q1lENkRXQitL?=
 =?utf-8?B?OFVjQWE0OWFwcW9xODc2ZTA3T3ZLaG1HOFR2bXgzMUh3dE9CN25KTEhhK2hp?=
 =?utf-8?B?UmRlNEZaRDhxc2hBQmRrbXVleVdYbkRMREVEcUN3YUhtRU9NR29WWklibE5w?=
 =?utf-8?B?a25NZnViem4rNHdacEpJY2ZtTWFtbnI5aU1ERCtEbEVTQ05BL0Fjb1ZwTENS?=
 =?utf-8?B?MjYwZENWVDJWZjZNeWZNVngyUjNvUTl5b2dqdnIrS0c2T3U3OUxKenRpU1F3?=
 =?utf-8?B?MkE3R3dhQVpKaWN3UTNMTEp5dm1MM2Z3bnR2bnhiMFBhQ0hUTlpWS0NOUjJU?=
 =?utf-8?B?TXF5ejlRQVFMU094QXpXZzlabWQ1bUtTVmpOeHh4eVRuYnFwaFJGTkZReVZu?=
 =?utf-8?B?RVpMaHR3enZSdGVDSUtFRGR2NUJwWSsvcmVBY1ByTUdha0JXRHQxRCtKMUFS?=
 =?utf-8?B?YVJ1aE1LV1lpdFVmVFZxb3NPK2V4SmlqT29HMkxyKzZ6UWZjREJKa1AwOTIw?=
 =?utf-8?B?b1M4alhMM2I3b29hN3RXQTBOQ3FYcWRSczhjRk9nQ2ZSZFRrektSWUNjVndR?=
 =?utf-8?B?eWVjeFY2RWpsajVkY0IxK29oQkdhaEc0aTJRYWFpa2c1a21rZ3BWMXpyb0lD?=
 =?utf-8?B?amJvNk04WVYvMFlFMUp4WWV4U1MrZGhhclBCWjg1MEVoVXlGVVYzcnlBMG93?=
 =?utf-8?B?ZXVQTGVoNk9oZFVBZFFFR3pURWs3UlYyOHFkQmRzaXR2RlBZamdQQUZJTDdZ?=
 =?utf-8?B?R0FkdkNic1E2ZlQ3MG02L2RzT05jYXJkT3pBdTFRdm9LWWo1QTd1UGJpRlBY?=
 =?utf-8?B?cDdlb1dXOUhVZ0I0RVh0YkJ6Y2FCU0tuOXZ3dzdIYTl0Y0VjKzF1T0Q4TXZn?=
 =?utf-8?B?MTdOLzN3S1hRRXRibm8wZzNJZWk5MThrSWNaOSt2di94ckk1RnFqVmUxS0Z4?=
 =?utf-8?Q?r1ogYsUqXKhI4vPYlhWw/uGn4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605840d7-8771-44c6-1e0e-08dc2f433a50
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 23:01:36.8706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naI2jtuVWZAfMdBxxswkClL4AI7vvZLIOBloZ2lYABqqi7mQ4+vNoNjJglXBZQ+vjecX3zdYWo8jEkQWtvW7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

On 2/16/2024 15:55, Trolli Schmittlauch wrote:
> Hi,
> 
> thanks for the hints.
> 
> 
>> There have been a lot of regressions in 6.8-rc both in GPU scheduler, 
>> MM and AMDGPU.
> 
> Still, I had the time to bisect the vanilla kernel and landed at 
> 7c45534afa4435c9fceeeb8ca33c0fdc269c2240 as the first bad commit.
> Could be a red herring though if there have been multiple phases of 
> brokenness between v6.7 and v6.8-rc1. I've attached the bisect log in 
> case it might be useful anyways.
> I'll continue trying out the patches and – if necessary – the bisecting 
> with the patches applied as you've described.

If this turns out to be accurate, it's actually quite interesting.
You can prove it's accurate by doing a module blacklist for the amd-pmf 
driver (even on 6.8-rc4+).

If that works, it's a great hint at the problem scope and we need to 
pull Shyam into the conversation.

> 
> I see you already found the Framework forum thread [1] where other users 
> also were able to confirm this issue. Still leaving the link here for 
> the mailing list.
> 
>> Here is what I would suggest:
>>
>> 1) Test 6.8-rc4 + patch 1 and patch 2 from this series:> 
>> https://lore.kernel.org/amd-gfx/20240208055256.130917-1-mario.limonciello@amd.com/
>>
>> These two patches are headed into 6.8-rc5.
> 
> Just to clarify, you mean the first two e-mails from that thread, [PATCH 
> v4 1/3] and [PATCH v4 2/3]?
> 
> I'll report back once I've discovered more information.
> 
> [1] 
> https://community.frame.work/t/kernel-6-8-rc-system-freezes-after-resuming-from-suspend-reproducers-wanted/45381
> 

