Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB738398F
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780680999; cv=fail; b=aoNbk0bZd9sVUNVjOmjH5C7LkgDprBGVQm5qAR9xrdbHE1YZLlfiDrIdFZfTHMT3dDC5EFHkhXBUb24iPNRR/7Eri99pauG9hRlsc1rAG7xc67tpAVn0uPWDcol5ijgRNdP7mlXP2p+acpgg/6K2Uae7UeaQVDfTrO0Ha9RmbPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780680999; c=relaxed/simple;
	bh=YuXGdHW5l8vIFfqkwtRgdmIOHMZvvLVlw8gMFhTxE64=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lz4dKjTsf0HT2xmF/N59B8rc+spC2ocq+Y+c0HGv3rSuIjIR2aYPqyROJ39/KRC2tfx6+CJtsFXvlVXR9OCwHezwGP/uobCheOC866QO0sWxad/d+Gxku9PUyyl3kFvadowRCQSX7E7qSOAfa8qw7M68YSqNn2u5DfnKEbWQlPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gx3jbtSX; arc=fail smtp.client-ip=52.101.61.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gx3jbtSX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfRz9d8T0AJqGikw0A9MWMWzbbFz/nDxNStkd+KM4PHgXud4ipn8IH4TY6i7fj6Q6yzSvAxr9Gx3bC5C6KUf0hj5D8IdJJLgAB0bLF5V3uOMp77qW2fB5/mqodqzdz1RxzOV/j3eJ/M+f/ObhvDmqr31M5WqA4Ci7wKXdRjdFUMCFk2Hxcypq32LmQVy9mejuC6mUWZvXfpLd6RqCogHL1ros+OXXfis9exTrGLnCGUkBSknkBtusisAEch//aOkehhMfdJxWhjTG0FDCqAX/LZhVVPu9sdNu8g62SvJDA3xkzaaqACTy210rF7Dor//Mvcoh6Vq8iCayqyp7Kmvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZc3OeevSExF0VLCzq/E3J9HSxYSwxlEpf4SialwYpE=;
 b=j1uKJVeodGX1WYgtkELp9vGTR8zpL3JCkded5T80ScImu/pKdmtmQx9C6ukKNHuezq8a6OHNRq/oqlsRheuJdiMrGygrRgW9ont4kMAU8ec8RJQNvpuxDxaBHS/op32DWXX68xlCdB+bp5FAFY7SSIjzI3rL46xHkd6T1A1u+Pj+mnMcPXV/tPml08l113pAPlms1sNgnmpTWlmgdZzl/EJfw32Pr1EI1o5UowJMURdsq3WQr1sGbmx87DUkNJWe5xJ5Tn36C4lt9OiMhzbiedSxmqllz1pFdxWar0g5rI/UT/y9mu50NcEdnCc9BjTTk6WAM1SQ560u9HRecyI4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZc3OeevSExF0VLCzq/E3J9HSxYSwxlEpf4SialwYpE=;
 b=gx3jbtSXB40+dN6+yB4BDB4UOJzrWifHZ5rE9hs2o7TbeyiolIApsNKFDJ636dGSj0IPz1Cd/dbIWfQXBo6lyaq5wMzUg0jf+h8RVKbOUMw/vYTmxJW3EG7VGnBJZEkv3v27v0A83XPV+/tpeWKA2qtUm9Da3Xy2e//1AUHyxA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SN7PR12MB8002.namprd12.prod.outlook.com (2603:10b6:806:34b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 17:36:30 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 17:36:30 +0000
Message-ID: <2535f876-adea-41f1-bf92-a2f15a1eb157@amd.com>
Date: Fri, 5 Jun 2026 12:36:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: kernel NULL pointer dereference in
 quirk_clear_strap_no_soft_reset_dev2_f0 -> amd_smn_read
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "open list:AMD NODE DRIVER" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <aWWZb3eRfQdB4OsI@mail-itl>
 <68d86871-12f2-4de1-81aa-dbc9e12b6f91@amd.com> <aiMIiOzJejNV1tCL@mail-itl>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aiMIiOzJejNV1tCL@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::12) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SN7PR12MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 68393d6d-ea18-4fa4-55e5-08dec328fa90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	g8GtF5I7chQDZmaGPTCHAYgllI0ZZzTh2ftfXQJjEzut3hBrmSqDoACWRDcahBrdsulyqc9eZZzzRqjZiDtXeUGXunzHo/wn3/QBE3oSGwHs4PTF0OkJcQOrTfwrDqM67YMzKccPVLonEEK6x70GA1qDQHfPgfCkiARq5FKBKUDAyEfNUQAi9RTBysi0iH9XKXMX/8SP99Sck+siRYlCDrZurF7pM5cak7v27fobvxE7osepi1/IFCvuWO1Uc0I79EHx4fdzYcOnX5+gjDNkPqDZ+PZZ/x07RBEzDLv+SCr2ZG6JoEF8pby+ZfOjOdCSL9+vY5Fc7PX33vDzsRWEhHdo1V8R8tmtsZEXtwmx/fUytxqwNfNw+VLkqVLGqk3aKQC02ephi/O7SQShrNDl1ipa3owSsu31/8yhw7YmrBOMRvuNNOcBVgYdZg7khFpeOkUcLmOPxjKb98mtJCPdXG7iyl/j9gxGGHmS+6hnOmwgKBYjsxNohiHTy9Gou6nUZaNUoXbE5NFycoQasiSrA115C5MqR0jwHCPySmB44P25TklhG7sHOnVyHQM0CCC3lUmqsCuYSFTl3obzlfO77Hm3EQVMK5KFrfTG1+tjdh4u1FAQVTTnn52m3onNIOyo1TpjaFsqx+wxR+g+Qk004tUZKeGSTz/iDPmKvoQKYjWxovz5oJokZvw7G50rohfT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNVZHByTlRtenludlRyTk9qV3BQcU42d3M4Ynk2cnlGMlVBclZRRnBCcnRQ?=
 =?utf-8?B?TDZYcHN0dlViZE5vWmVMK01WTERhSkMyaGVNYWQ2Y0JFMGV6S0RQNGZidnRX?=
 =?utf-8?B?SkRNYUU4SjhXZFdOTy9MQkY4cUwxamVOSDBSWDNCcmM4ZE1OMWxiTzR5Qk8v?=
 =?utf-8?B?bFdnWi9xUzNTbG1SdEFpWVp5RHVzYmZtcDh5c1hQblJYeEh3a1lYNmp0dC9o?=
 =?utf-8?B?V2t2STBqSzF1WkZRQlU3dkU5MWo0SVBEMU5uaDBqQTRrSDJqalN0WUtsN1pQ?=
 =?utf-8?B?T1ZnU290UHZUOSt2dG5wZklWaDh5cUIwemd1ejlrZzZzNzNzVDNkTXVUWTVG?=
 =?utf-8?B?emFrMVZRYzVIMm5uM0h2NmZrNlRHalhaU2xwV0Q0dXhkWjZucFBmMXFiTlVO?=
 =?utf-8?B?UUc1emJQVEYxWndaUHIveWFTQzZ4cWlTVUJRMWYrS3h0ZVpVVHJtdlltSUlI?=
 =?utf-8?B?V2V0QzdEUnI4bklZSzFZM2tPZ1NRVUNPSHFBaEY3S256VzNXWE5jK2J2OVAx?=
 =?utf-8?B?Z25JTE9HTXhzYzErSjdaOFhlNjdhK3o3ZXlEWWJDOWVKaGF6cDVtbDRCMmJ4?=
 =?utf-8?B?dVZSY2lMSTI2cE0zZHdHWkk1VjM2aGtKTzlUUGp3YVNSSEhOV0VRblBuYitX?=
 =?utf-8?B?a3p4ZEc4SEIvWHZ4L3hxRzBTdHphZ01WUkZTclpqNlo3R1dXVlBvYzNxL1Fu?=
 =?utf-8?B?eGJWdnhhZ3lId0NjakxUN25kb0NpRmNBMDc1SW9QVHBSVjFsNGtDNkp5alZO?=
 =?utf-8?B?aWc0QnkrZHJtbFRFbW1nWEgrZUlXMS96eWJMMEhzYnVjNzlhMDBWQVVtMjUr?=
 =?utf-8?B?VkR5ekJ6aEdnK1hTQzhNVENWUFpMSC8wenkvek15YzFqUXVsZDdBbXpWbmgx?=
 =?utf-8?B?YTkvNkpzSHc1ZitZd1duUXBxdHRHWENaclFVaE9oWFovVXRQa0wwbytYbW9r?=
 =?utf-8?B?REozaCt5NGIxRlk4Y1hvdnREaUJMbEFqcW5zYzJsZEtvc2xTdHZUOC80UVZS?=
 =?utf-8?B?VC9EMVlDR2NOWWtuWFFZd0ZBcUVocy92Z3JuQjJQT2FJRVh4ZUh0RGJVZG5k?=
 =?utf-8?B?Q21XS3dObndITkxWemI2bmVCQWIzS0xUczhjUHJoelNtMnhwUEY5WUNLbjZr?=
 =?utf-8?B?U0JlZi85RnB3UXFlNi9wdGN2dGFNV21td1krMmkvWlpGYkRPVXVEeFpnc1ZN?=
 =?utf-8?B?enA5aE5OTnllQXhpYlNYRmh2YU0yUnFzM09zQkJ4dTZucmU3Z1pWVDdaUW81?=
 =?utf-8?B?V1liQ01qZG9IRFd5UmpyUUhxRDQ0cmRjTVh1M3pxeUwxTjhuRkorNXR3QVNQ?=
 =?utf-8?B?bElFSzdOS3NYUldyTjhEb0JyYWVEMGdTeDZiY29sRXllekxFYnlmZ28rYWcx?=
 =?utf-8?B?U1JsZVVRcm9hemtyVW1KMXl0RGVQR1U5NEJSYTdYYzY3eUt1NjN0amdNT0U1?=
 =?utf-8?B?S0NrZWtaQ0w3OEFyNFBsYlBVbVJPaEdNR093M3M1cCtiYnM5amV1NlVyVWJK?=
 =?utf-8?B?MTRCK01LRnpaN2ZkVEFNQVJ5c2RzMkVQQk5jTFhUVDJjK25ZdUZpLzFFbHJt?=
 =?utf-8?B?bmZhVFZuMGZnSkVLNXpOQ244ditIYzNUZmpjdmxGK0lTcXl4K2ZBVFgvMjBx?=
 =?utf-8?B?eGFqVFk0c0Y2V2V5cXBOb1IvVzRERkgvUlorNE1SckFyUTcxbHdhQUFVTUpC?=
 =?utf-8?B?R1A2RkN1b1czenBJallqYWZyVG9YN3JBN0pFaHlNSmVIVTc2L3NPZGdxdU45?=
 =?utf-8?B?VCs4S1NqYVZ3ZUJkeFZJeGN4ejdPOWJTMjNRcC9JRWt5QnFnUDg5QVhpQllS?=
 =?utf-8?B?c091U29mMm92SkJEZ1A1UmE0K25SR2VBbERqS1ZhYzFPU0NKTHJYR3NuZHB5?=
 =?utf-8?B?bVdobXVHQ0YraHZGWUxFTW5SZWJSV0NNV011Zm8vaU5zZldMM3czYlZweEcz?=
 =?utf-8?B?UVpKcHNKTWhpdUpNUmZ5Q3JqK1pXYlRWOWo1ZUFvMFAvWGhLTlpXb1VGcDBv?=
 =?utf-8?B?bjI2V2Zod296U1NoaTJkT1pnWUNDaEhQL3A0dC9LN1E5Q0J4Rlpzb3JDVnUv?=
 =?utf-8?B?bXlLNDJ3ZFBzVXF4cWVHNnJiclpaeFNnMi95OUtIQTBUVEFaN2wyZEcvZkdV?=
 =?utf-8?B?ZXFXQlRHSnJueFIxbklGb1pkMmN4cFlDZUVrY29nQnp0elg3YVZTZkhDanBn?=
 =?utf-8?B?ak5wbWpETEx1TDhPSmF3RlhwNFh4bGNlRHk1dndlV3BRdlVIdDFjT0VwZUw2?=
 =?utf-8?B?OTFNMkJaMTRtRkJiSVMxRGY4VUZRS1puRml5WG92SXBZR1ZzdElwNlZ6WTlj?=
 =?utf-8?Q?U14K5UYThaUX2uWSrJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68393d6d-ea18-4fa4-55e5-08dec328fa90
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 17:36:30.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI7SAJsuBx3MhEmflZQ8foTOPH5oTqOGYGTKPSzvw750j2hqhZI9F0ykY3gxh211fE0RV8TAc0pJpfO2S5qJ8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8002



On 6/5/26 12:34, Marek Marczykowski-Górecki wrote:
> On Mon, Jan 12, 2026 at 08:47:50PM -0600, Mario Limonciello wrote:
>>
>>
>> On 1/12/2026 7:01 PM, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> I've got a report that kernel 6.17.9 crashes when running a Xen HVM domU
>>> with AMD Raphael/Granite Ridge USB controller passed through.
>>> It worked correctly in 6.12.59. Between those versions, I don't see any
>>> relevant change to quirk_clear_strap_no_soft_reset_dev2_f0() function,
>>> but the AMD node driver did got some changes, so my guess is one of them
>>> is to blame. I know the good-bad range is huge, but there aren't that
>>> many changes to the AMD node driver in this range.
>>
>> Is this perhaps a case that only the USB controller was passed through but
>> that the root controller wasn't?  That would lead to a case that
>> amd_smn_init() was never called and thus amd_roots was not initialized
>> properly.
>>
>> So it would be a NULL pointer deref.  If that's correct, something like this
>> should work to avoid it.
>>
>> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
>> index 3d0a4768d603c..894823b444d47 100644
>> --- a/arch/x86/kernel/amd_node.c
>> +++ b/arch/x86/kernel/amd_node.c
>> @@ -91,6 +91,11 @@ static int __amd_smn_rw(u8 i_off, u8 d_off, u16 node, u32
>> address, u32 *value, b
>>          if (node >= amd_num_nodes())
>>                  return err;
>>
>> +       if (!amd_roots) {
>> +               pr_warn("AMD SMN roots not initialized.\n");
>> +               return err;
>> +       }
>> +
>>          root = amd_roots[node];
>>          if (!root)
>>                  return err;
> 
> Thanks, I finally got confirmation from affected user that this patch
> fixes the issue. From what I understand, adbf61cc47cb ("x86/acpi/boot: Correct
> acpi_is_processor_usable() check again") was not enough.
> 
>>> Original report at (with full kernel log etc): https://forum.qubes-os.org/t/yet-another-usb-keyboard-thread/38355/8
> 

There's another patch being discussed.  Could this help?

https://lore.kernel.org/all/20260602184823.GKah8ld2QJLm28xoa9@fat_crate.local/
