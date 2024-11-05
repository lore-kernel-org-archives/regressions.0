Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113821D95A2
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730816517; cv=fail; b=SBtK0bsIjk60i6sKSMHac00PUMkeH896i/jagNlkPzTBvPiIV086t/HbUufaETKBGSVn5b39smcFiuHwjrJY4QFCbDbR5ZBoLBT8Tu0G7uswaoKBtVEWiVWKAIukoQWpfB4je1L6QxzNfgbSm3vL4Csx7EfN7Ctx2Uda/0ur6pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730816517; c=relaxed/simple;
	bh=celZunICM/C/zSyprYBCPe82ENZgR6ITsC3ihWBEk5U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TvqzYrtRFWw5JE3NmSr/GO3Dfb6Nmhjamt9UpX2HFfTHHfIDK/obtF/pdDGoOnCITuyIGZs+g1Ke+TVsfuAR7pbeMNwbarLKRd6993QmDI0pxMk/Qja9OHWpfd0VCRKEHGPZOm2xe/0Ku0AvwaRbC+jZd8N833kuF6ACWIwcUkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bPT1ZRwc; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bPT1ZRwc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2vOaPKF1QOhX3sBkBqD9R06WoW4LoVGN1kywsQnR5Hu+iEHhEqx12ZVmqEK1qWlwcHOHcRyBsTh3Uy//jEUiqNxNQ/lm5SO29DCjOXp6+eqa7ImZHZejx52m8az6ZVGQ8439UezRsfLKF0ZHbadz7iIg+OcVs/XwGsMI83WsUnpp/ru8WNx3b4IoACMdfxAFNTSvZMvNSwTxzpQBBZQf67pMTS9W/eopiwXp7RDka9YquA9FXK919vJ+i20Bhgan3eHDO0uLvol+bli294JPlEmd4j+DQh0vPgiHPYs8j2mt/5Y31n9XxNBqqqtXE2Ls7OyLz2PCiZq0Foyxt8Nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6LxsIsHrYO6MlBdYPTgvTRQdBldx3xKoYuwnNDfy/0=;
 b=BJ0Ypd6ujUWSV3eColDS7gL7QNIeitRfjeProfCcmJYiGuCHuEWzf4/hFdNLJGOgKvUovpifr8+Pe0MNFUSyo9Ngj+L625nOmF6UepkqvNcp731VLMjTKI5seij6qaSdkkwhqL6PUS9ihYv7ei34UcjQn1IkcFkhz3IWwKc9G0XBxRI5+nIWlTesOHYWfYMyqN+ESDbG8z/U8c+A9A8G46DrEZcRp5uqanqoM22kn/v08sYSLyciykmXmaLc5L+PDjW57nwkuY901iBUIOlr3jAOn0QHiQ4H1Ifr8aEfjFGvB8xko+Umpamuv9QAcX9xiE80jwtRK3buJ8MEOVC9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6LxsIsHrYO6MlBdYPTgvTRQdBldx3xKoYuwnNDfy/0=;
 b=bPT1ZRwcle+0wD3lUPbcrQAgcJEdPmUB22IZo6VD5cHxnye5a7M38Xb69zCwL0x20VDs4peS8S778nZnDgCh7kGgXwoaETyw9PoJafD4t9n5SzQE2kxpCPw0BWI9n533DHRPB7iwTksXqojh3Gsy6NHySLbb6R0VD7Mwwf/Xi1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 14:21:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 14:21:52 +0000
Message-ID: <c0fcb97d-d849-4dec-b76a-7346b1619554@amd.com>
Date: Tue, 5 Nov 2024 08:21:50 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thunderbolt: Fix connection issue with Pluggable
 UD-4VPD dock
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>,
 Andreas Noever <andreas.noever@gmail.com>, Rick Lahaye <rick@581238.xyz>,
 Sanath.S@amd.com, christian@heusel.eu, fabian@fstab.de,
 regressions@lists.linux.dev
References: <20241105103157.526823-1-mika.westerberg@linux.intel.com>
 <2024110542-moaning-zap-7ac2@gregkh>
 <20241105140231.GH275077@black.fi.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241105140231.GH275077@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:806:f3::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 834c3bf8-8e7f-42b2-e41c-08dcfda5316f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlJNM25JK0ZoLzVYaWpYcnc0eTR5ejRkZnp6K09wZHNxcFZOUU8vcGVUQnlI?=
 =?utf-8?B?UiszZjhHMThocjZwRjVmQWVkNkRHQzNtQlNGem9iRnZvOXhOa2pzQ2RxMU5q?=
 =?utf-8?B?NUN5TU9UdzVFWFVYOG1vUzVWd1VKdVBzUk41K0NoanR2ZDVOOWJwM1hvMGFs?=
 =?utf-8?B?YXlUM1B0eS9vY2oxZEswZkVlM2llY1IrbU1OekI2d2R2MVRkN0RiQi9wRWlN?=
 =?utf-8?B?NlBNYm5SWEpUbGRXN2ZXWmh0VDk3OXpXWVNSTEgxZEhSTnpmNUFUNzFHaDZP?=
 =?utf-8?B?NC9DYWVYK0pqeHd3cnBQUUdmdEJtT2dMWlZKbHZQV1oybTRwNllZUnA2L2dX?=
 =?utf-8?B?MjcxT0VJOVFGVnVSRGlTa2QrWjNtY0tlTDk5SlVaemR0eGZUdUZNaFJMUE1T?=
 =?utf-8?B?dmFiMFhkSHJZZHJLMllnbit0eW1YSDkzSE9laS9HcEJOYWptc1A1a0hTdVFH?=
 =?utf-8?B?YkZaS2xqZXh1UElJbk81ZFVhVjh4cGpGZzhsbTdtbjZsclcyYjdPWHRIYUdN?=
 =?utf-8?B?Ym55KzdMWnoxam5scEZnV3RrZ01qN3RnYUJiMGY2Z2ZDSitNNkQrNmt1WHVC?=
 =?utf-8?B?L0FYdVpEK2t2WXQ1S1E4dDMxalRmaGZNb3JLMks3QlZ6UFMwT1NuemF5MU12?=
 =?utf-8?B?YzdzcVF3TmlNWDd2eGdEMEdmem5Ublh3cEpEcDgxWWdXdi90UisrVFJGK0Iy?=
 =?utf-8?B?bWlEWXhidXlHanlzZ3hSdEt2NG04OTB3a3BIeHR2WEprRzNyU1lWRHJNU2VM?=
 =?utf-8?B?eHZvN1Vyckx4ODArWmd3eTB2YjJSRlpEd1RLMCt2ODQya25zV2JEUjZaNHJt?=
 =?utf-8?B?aFM2NlFjanpzL3BkbHJkSERrVGZiZ1I5K2NiVHFNR2E2Y0VQSFdsb0E3RkVw?=
 =?utf-8?B?QzRMRlREY3I3N3lLeUtNYXhnWTk5S2R4a2E3Z0ltZmdLK0JRME5RUVBRRlZ3?=
 =?utf-8?B?bGUveVpUZjdRVW5mTi8xb1U1V1pYQlVESWEvaHA2a1EzR3QraTh6Rk11VVAx?=
 =?utf-8?B?WWRQdW00eStjNE9rSlRCYlJvM0FaUzJvV0V2REpNT3R3YUZBVVBYeUZLUEpa?=
 =?utf-8?B?by9oTDM1c2ZTb0l2bWpDTFp5OVYzc0Zkd0w4YlpZcGxXQjY2ODlxcjRnYVBL?=
 =?utf-8?B?SkJvNWFEVEUyR0xvSVhBNi9oWDRtQnhiVElCYlFrMjJsR25LdDZoTEZLZ2pB?=
 =?utf-8?B?VGU2TGxwbU5wQXZHRHh5VFRXempCUGw2S1R1eDU4Q0ZqL1lxSG1hdXZucGlH?=
 =?utf-8?B?M0x4SWd0bmVXWGgrNTgzOHl3SzIxTGtOWjFvUzd4MXNWNGFJK1hnbVRKWTNL?=
 =?utf-8?B?em9WRGhMcE92MlA2YlNLUjJGZW1FSFgrWm1qWDVtbE5vbXNMSmc5SVRTUVhD?=
 =?utf-8?B?NmxlZDVJdDVjQUxpTFZPWDZxUWRvaFp4NVk5WjJIbnhZbUU2R0tMdHdxWERK?=
 =?utf-8?B?WUNFajBHaG1SMzhGdUtvczBHRWxEY2IyWjhaY2tFVEFQVHMrdHVBeHNweWRB?=
 =?utf-8?B?Q1dNa2xwN21BUksvTVBOUHpBbnFaUjFlOFpLdk5nUjBzdzQyaTc5WGZWV0o4?=
 =?utf-8?B?dFdEZ3A0eTZDL29XTDlHcUZiV0o5QmV6Y2ZIQTNMOVd6MDNmdjNDT0h2bXRX?=
 =?utf-8?B?TDZrK1NrYndYR0krc1BzaXJ4UGl6a3g3WDlCUm1MeE03cWIvV0RHVEF2aXJY?=
 =?utf-8?Q?mcTy6URsLBOZYTUs1wGd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjdpcitxZWxON0NqcmdtYTVHVU1Wc0twemN1OVlZaEd0bHZTend0MUxVbXVh?=
 =?utf-8?B?eG5oajZDWFlTbXEwSm9sMmFxT1dWNDJHUW5ydGhmdHhBUDY0OWE4eUlubEhw?=
 =?utf-8?B?b2hzNWEvMXdHYzM5bVI4QzhaL0lCbzBCTWtUZ1ZOKzRGVXVSUWRSdnN3dHEy?=
 =?utf-8?B?ZGpWZVFGaVNKUEY4SkhXaXJFdTFNSTN6bTNzSVhKMjJaZytnNFBVVS91bE1N?=
 =?utf-8?B?OS8zek1TNVdEVGE2MllUUjlsZlV5YlNFTHY0RjBSNHpIcEZhU25pZERaSFpI?=
 =?utf-8?B?eWVuR2ZkaCtqWVhhWEY4R1kydmRmQ3k0U0dqait1T1diQnlQMmY3RmZEdWFM?=
 =?utf-8?B?SitnVWx4UmNoVEtMSkNGNjJjMjVjTXRwTmlEeE5RK2NGWFdoMzFnNGZTWmZJ?=
 =?utf-8?B?Z2Rhc0xGNVN0TjdWWVlqTWFMQ0JHczRzK3Z5N3dmRDkvS0pNcnN1R1BFekpr?=
 =?utf-8?B?T2JEOEcvSzhYUkJ0MkxybWk4ZG1ZME5BUzBFVkthZVBLWlF2RjdrTGxBT21p?=
 =?utf-8?B?UkRuNU5wYzdNYkhGb1ZySW13Z2ZjV2txN2tlTUhqc1QxQ3kvQXpQUEdEanU5?=
 =?utf-8?B?dWx2YVhLbGlkNUN0YUxnaklLNm5vQzkyZ24zMDRaUFVGdXNuQVUyUktpVEQ4?=
 =?utf-8?B?N09BSENPcldqbU1RMHU1MlFSS29RRzZCSXdBR3hQT2NZcmIwSVRodDYwMFg0?=
 =?utf-8?B?d1lCOFI0bTVGQXRzdVZPcWR2cHNVSFB5TmwwZld3VlAwUFVNN3FudHdNQU5V?=
 =?utf-8?B?TzB3Z3BOS0ttTHdXT09DblppZDI5M1dtZjl1M1NDMUVtODI0OWlNcTczcC91?=
 =?utf-8?B?ZXZDZ285VGtac3RBTDlMWlFGMkRCbjVCdGx6THQ3NGtHTDdmZnpIMDJ4VEhu?=
 =?utf-8?B?WUkxSkJoQU1nV29jUGFWNE1jdDFjNWg0TE5hNFlnMmFHREhGNFFpWlhwTS9r?=
 =?utf-8?B?cUxNN21QZFh3aDY0ME9jL1ZvMHQ1SmFCVWZiWjhyS1hDOE44Q3UrZXlnQVZI?=
 =?utf-8?B?ZlcrSW9JdXVrOHNCUS83czR4WTlwRm5nRFEvU2IvUGdEQk9KSHE2WFB0aVN4?=
 =?utf-8?B?NjZUb2k4dUpBM3pXSDJaSEZuT09VamJ1Vm12amlMYXc2QVN2MldabS9CTXRh?=
 =?utf-8?B?dFc4WXBhQUxjRjQxWDRBbTVkVFl4Z0ZFTnBHT3NuSERkUm96S25lMlpoRlJF?=
 =?utf-8?B?ZDdBZVd4K1BpVTh2VlVHaHBsU0xWdHRYRG9ndXpmMVRtSWlFQTNBbDJOazUx?=
 =?utf-8?B?bEtoNFM5NHdLSHh6SnhPcFhWT3ZFVUQ0YktlTW42RWY1Z2xLQmRYN0FjRy82?=
 =?utf-8?B?SGVqZW5aUWFxd0Z4NFZEN0xMaUlvZEh2bGJoc3lwdW9FTVpuSGZhSktvWkJ0?=
 =?utf-8?B?b29qeUZTaGZOdkVFV0dTRVZnYTlUd0dtSW96dE95WGdSdzUxbEtycUVYMU53?=
 =?utf-8?B?RjRqQUN0QnlnaDFOdTZUUytFaW5MNUNBbG93elM4VkxkNzV4OHJoUUZaZ3dI?=
 =?utf-8?B?angzZm9kMkV1SjloejgydlM0emJTbU9WWWxoaDFrNERmZWtQTWhITHNkUUxJ?=
 =?utf-8?B?SVZnRDFudGxUQlNJSVB3MVIrUzBrZUFTVlc3SUhGRXVwamhoRlZEVmUzdC9U?=
 =?utf-8?B?bGpkYkc5NWxESFhIbEdCc0xmUlE2dDBOU2ZpL0FmSnkwVDJXeHFBbXhxMEFB?=
 =?utf-8?B?M2gvWjV5elhwSVVoK0tUR0xQNXlLTFFoRlJKOUp0NVNQSW1SaXJtS3FWOW40?=
 =?utf-8?B?dnJWR1ZHb3kyM0k3dkRraTh1SjRPODZxNFdUNFYyV1hmUFI2TC9GYVJkblpD?=
 =?utf-8?B?SjIzWVBYdEtQL1pqczRNWjIvWUdmL3Q3OU5XZDF2S0dydWNIRERQeXJDWGFx?=
 =?utf-8?B?SWtpUkI3RVJIc0s0QWUxb2VkZXBGalgycWRjRnhRSWlTeVF1VVh5cHVwUVBp?=
 =?utf-8?B?ZkoxY0pFYmFFSEo1SGJHTi90dWFCclNOMVpnZTg0THdwQWVIOTg3YWVVRkFx?=
 =?utf-8?B?TmxMOURFQUFkOHM5K2lNeFZyNGQxZGdxU0FqQys0QXoxb1FTdEJpY0RUWnMr?=
 =?utf-8?B?UUFzeUF0N1JPczE0VldOSkJBZVRKblh2UlE3eEhURXFzQ3dSakl2b3p5SEpI?=
 =?utf-8?Q?4QcYSmqBF9D6Myv6QAPqaLot0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834c3bf8-8e7f-42b2-e41c-08dcfda5316f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 14:21:52.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDOUY3jGuTxJ65fzkuLywDeCLV2+dGXs6ETK/ps3EOX5t5kfdSedrz0fUADX4QOxKTwVlmtehFEzc1TdpkmKZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660

On 11/5/2024 08:02, Mika Westerberg wrote:
> On Tue, Nov 05, 2024 at 11:54:55AM +0100, Greg KH wrote:
>> On Tue, Nov 05, 2024 at 12:31:57PM +0200, Mika Westerberg wrote:
>>> Rick reported that his Pluggable USB4 dock does not work anymore after
>>> upgrading to v6.10 kernel.

If I'm not mistaken Rick was talking about a Dell WD19TB dock which is 
TBT3, not a Pluggable USB4 dock.

Nonetheless I wouldn't be surprised if other docks and devices have 
problems.

We have an internal report at AMD of something similar happening with 
TBT3 storage devices.  After this lands I'll ask that team that reported 
it to see if it helped them too.

>>>
>>> It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
>>> access polling delay") makes the device router enumeration happen later
>>> than what might be expected by the dock (although there is no such limit
>>> in the USB4 spec) which probably makes it assume there is something
>>> wrong with the high-speed link and reset it. After the link is reset the
>>> same issue happens again and again.
>>>
>>> For this reason lower the sideband access delay from 5ms to 1ms. This
>>> seems to work fine according to Rick's testing.
>>>
>>> Reported-by: Rick Lahaye <rick@581238.xyz>
>>> Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
>>> Tested-by: Rick Lahaye <rick@581238.xyz>
>>> Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 

> Thanks!
> 
> Applied to thunderbolt.git/fixes.

I'm a few hours late to the party, but if you update the commit message 
for my above comment feel free to add my tag too.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

