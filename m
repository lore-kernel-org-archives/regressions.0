Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03olkn2021.outbound.protection.outlook.com [40.92.58.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046B19C
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 18:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Myb38JIcppN72cCIzpL63rvJsCp0diGLzqUA8cpTrdRD7asAI7IDLCaFGHTU34bsE1dTw7jzObbJU4PMIE7FnXklJGbz4npGEZnyvPSpo9RtQvAuXCNgugWhMJK+v7cFNAAqqUPBioNew3EpGKM4eIZg7StxDCovMQAwLJhEMMATS9PcsZsF49fcZgXRUsWYdD+Fx7b59OaCZ1g2U6nnqk9nwCrGJsRlZHxk72SkrB8BSoidttX0yWSwTKiRXEpEHCPr9VS1zRPrrGflHnK6kZRg55xv4ud5cKHoiVEvQ+/a0C+Mz7oRkqFv9OpYwip7rIcTuF9UBhak7+Y0kij6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tg55b0SolvFYalcr4uQqS3gKIR93RaI5ZecBYndA7U=;
 b=dWX4K+Bb2MvET6iHFLkPR537yh9fLa0lI22sYQhFM1P4eBSx9fyfLq6sahrBkFkxgLx/mvB8cJoFu/ThPuolEoa6miFuX1m42K2DoggMRuDRYVoGQDuJVrmIgv0vYc3yGo+9jJLjOnqH40lLK1KzjmK/qnvS4xU/io5IJqZmTSXvoH4L2KKMC96EkoOB4YD2tTJWsgKuYAH1BJ3VW/q5v019CxX2144pm7JFTOetnJzdiiadCAts8llZDQIRBJjrMwOXVpYSnoLEZphW/RffmLVTie2NnPTlBFMPoHMqMGzYfD3JTrfuSZ6fFbQpCSmt47DIFpS0H+0GRmYRpQLmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from GVXP194MB1759.EURP194.PROD.OUTLOOK.COM (2603:10a6:150::12) by
 AM9P194MB1266.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:3a8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Wed, 20 Sep 2023 18:53:00 +0000
Received: from GVXP194MB1759.EURP194.PROD.OUTLOOK.COM
 ([fe80::fd80:c57c:1bc9:9846]) by GVXP194MB1759.EURP194.PROD.OUTLOOK.COM
 ([fe80::fd80:c57c:1bc9:9846%4]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 18:52:59 +0000
Message-ID:
 <GVXP194MB17595E1811E5132B6E03BADF80F9A@GVXP194MB1759.EURP194.PROD.OUTLOOK.COM>
Date: Wed, 20 Sep 2023 19:52:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] Bug 216360 - No power to DVD drive
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
 <ZQryrfLC6GPhSCnu@debian.me>
Content-Language: en-GB
From: bruce <bhealey@live.co.uk>
In-Reply-To: <ZQryrfLC6GPhSCnu@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [JhQQEmZDCq5OKhRTwvxb1hbF4aX5Xret]
X-ClientProxiedBy: PR1P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::18) To GVXP194MB1759.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:150::12)
X-Microsoft-Original-Message-ID:
 <e4a5508b-0540-412a-ac21-ebeb942718f7@live.co.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP194MB1759:EE_|AM9P194MB1266:EE_
X-MS-Office365-Filtering-Correlation-Id: e211aed2-be2b-4068-5429-08dbba0acf64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dR/SLwe2TRlgQAAIfWkNzmR3mvkmXIDhwRkenRM1QFDFy0xoF4EKs3AlpIXnu4DYk+j6p/iYuvSOnKL21Pl9gG4RQBDYnSep6DCF6j7Sv8A381QX0HxTaXC0PJzj36xXxX2uisquTifkgT9CCJpiSJlm/o0GHiFr1vfs38ljzvM5G5Y1Ay3QktWmzhjZS46Nqp84jPcO9QiKbd0UMExqqd7Vf6tj5cu9Rr0+RCPV49Yuc/ZnTj6XHstuLE2gU7v5uzbsaFELF5moaTRu12hcjhKQWntYswZ1ZCmO9G/2BjmvV76AJxkmiW6R0fB55zxVA4SEDuyN6MQpdczkEgGe/g02jVPn20Sf3Wy5Rlm8s83s0UOsueJUFD+gbnbxnzNwFttOyvWAhLfoAz6gtam3Qy84ZhM/CkEPmK6dbZeJRUs1+HPX8buSjCrXBQdvq9omDM5z3othPODNMj/7KJOsgRYqKRCI6X168jqXIeLUYXeORF5wc9debXCk+PtrKstzWHtvHYjqL4Rq/6dk+hGwSk+fIZ8/F/ocHQbW3jlnXrkYl2m9cLaHW2O+fk3mZYWJSC79VFzdcha1jdvWBsXTcCXwd9MIcilKRpkrymFHmn4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am5BeGFxMzBuc0JvemZNVis5a2laejl1UmNMQm5GSG4yVGxtcVp6ZlZrWTV1?=
 =?utf-8?B?aGYyRjhJRi9TdExNVXdXTlR4VjZCZXFKcTBpa2xMRDhzUzM2TTNCVHB1RmE4?=
 =?utf-8?B?ZVUrVXFWS3BuQkMxeEdzdjcvYiszd0x0UkhkVUhWV1YwcU1iTWxuNzJnNmVO?=
 =?utf-8?B?ZFZWWUJ1VkpKcm1xd2xuZ0hpcmNPeTg4aEk3eVVGUnRNMnAvUHN5dGJpZDFI?=
 =?utf-8?B?eWlXV2FoSGVxRmRML2dLazVkTVdWTzEyMi95UTZOMTdLdHBJQ3BPQWNrWE1s?=
 =?utf-8?B?K25TLzM2RE1xbVJ6UjJUV0hzcUpJRTV6K3VHZDR4VExmSGpENmQwQ0tYaDZm?=
 =?utf-8?B?WEhNSWgvd1M3RWtaaTV5RzQ0OHdnQVlnUHljR1kyaUliYnNBS1diMU1pOUQy?=
 =?utf-8?B?R05SN1ViRGI2c2R2OHNGQ0pPdGgyVThuWncrQVpyMXY2cjlVSVRvWHVaYVJT?=
 =?utf-8?B?Q1JqZFQwdTAwWVpPbzlnZEo1ZHVSMHBHL3Fxc1dyVnhOUzBKZHJkdlBBV1Nh?=
 =?utf-8?B?bmtQSzdDSm5vWUJFRmpJbkVWU0FwVHA4Q0cxdzNlQW5heEVrTkZOZThrVUNu?=
 =?utf-8?B?NUJ2c0pkT1JQTktxajc4ME1GM3hnbUgxZHlENGJSMVVkbDJXQ0lVQzVKYWpW?=
 =?utf-8?B?SVNXdDRKOHlmbjc4bDVYZnpqa09VdStTcC9kRFVEQy94VlUrOFBFRUpMUjJL?=
 =?utf-8?B?TmcrZ2Z5NldqMmRyYzh6SnVYcXVZekcrWTVxYW5MY2J1UmdqdUdtYkRpYWth?=
 =?utf-8?B?dSsxVFBTb2dha3UrTDgrcytDUi92NnY4N2VpeFRiZzlRZHdWbFU4UzVyaUJL?=
 =?utf-8?B?Vjd6VWlGQ3Zxb3pWK212cnEvREZMdVNmQ3RhQ2dhV1h0L214MkdaNzZsWjRR?=
 =?utf-8?B?UElkTHdVVmEwa0lDRkloVC8xa2RnVlpmcm00YmlEQUZlZ1lCVjFOWG4yd1dN?=
 =?utf-8?B?VE5XWkZFTmNTVWt0WGFLVHZyQVZIdS80SUtuTkFieno2SCtzSk9MMTNza1M0?=
 =?utf-8?B?RjBwNlVSWmNYZUcyZUFTdkxIRk9DUkdUOWVkeG9yMWkxZXo1RjNLU0U0U0Qx?=
 =?utf-8?B?T3VYUk5vdGlLaEphcmtXTVNQd1I2OVBwaVNnOXMyR09yc2dzNkttWmlCTitk?=
 =?utf-8?B?OE8wNWZMUW0xYWdBSHlsUjJqM0F5dWdUdlQyV2U4Mi93Qi9MZURpV1BqcEJJ?=
 =?utf-8?B?WCtwL1NmeEVCTTM4dVFDODFNZjk1d1hPOTczVWxxbXRkMWg1MUJTQk54b3lM?=
 =?utf-8?B?eWtLUnNzK3FmbmRsdmR2MVh2a0ZXTWVhVkVxMWlMbUlOTlJ1SndEZjl6aW1k?=
 =?utf-8?B?Ky9GcXl1UzFObDVVUzhPV0FnVHJqS2o5SWZzU04xSEJSdDlGMDE0UkVkR1Uw?=
 =?utf-8?B?cVBtd252N05LeGt3bHhqdjJGU3JVZmh5NUYzVFZSUDM1eU01R3dsbUI2NEVq?=
 =?utf-8?B?UVJDMlBzNHd1WWlVSmZOc1BMTTBVeHhxMnJKQnFBcTdzVElRcHVTanFkSHBw?=
 =?utf-8?B?V25scDhxMUI2RXBtdDgrRXArZk5EMUlsRG81OUppczlhcnpMU3VROTFBN3RQ?=
 =?utf-8?B?ZjNYdE9qd05EVzVCd0hFSmVNMzB3bzVpb2FMS2dDYlBuYXlSMVcyWjNVL25v?=
 =?utf-8?B?WmF5V3JzeSt4YnRMSkpScFJ0dllZVGc9PQ==?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-84264.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e211aed2-be2b-4068-5429-08dbba0acf64
X-MS-Exchange-CrossTenant-AuthSource: GVXP194MB1759.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 18:52:59.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P194MB1266

All,

I have started work on trying to find which version of the kernel this 
bug first appeared. It is taking me some time to find how to do this 
(might be easy for you). But I have other priorities at present which 
mean I have not had the time to work on this. My present commitments end 
at the end of October and I expect to get back to this at that point.

Yes, I do care about this bug and I will get round to it but it on the 
equipment I have it is inconvenient, takes a long time for each build 
and stops me working on other things.

Regards,

Bruce Healey

On 20/09/2023 14:25, Bagas Sanjaya wrote:
> On Fri, Aug 26, 2022 at 12:13:13PM +0200, Thorsten Leemhuis wrote:
>> #regzbot introduced: v5.15..v5.16
>> https://bugzilla.kernel.org/show_bug.cgi?id=216360
>> #regzbot ignore-activity
>>
> This regression looks stalled (no reply from Bruce or maintainers), so
> to clean up:
>
> #regzbot inconclusive: no one cares the regression
>
