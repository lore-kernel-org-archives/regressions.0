Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2042.outbound.protection.outlook.com [40.92.41.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B78A31
	for <regressions@lists.linux.dev>; Sat,  9 Apr 2022 17:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbwn0mhv+A3E2L0wHXIVNRTxR2n9lCdJr0yhaNB5F6IwyBfMCccwDdbwnVzUaDmNlJq9YzvY4ean52WYK0rp94rN/OkTN9kZdKQ90W5AdsyiJ7LSd8bQDdrLqSfaO8yeheaoAjvsNMyn4NmjxkS8W/IWMHdbCnF9/nIEbQT+ofYCfvmK9xDF+4jci3THwsfRESvj9rnmnzJvHljFmyLRwVDyOC0wVI+O2aJx2UrrB0jJY8GZOf4lVj6r9O12fdNTKAy4JD6Xe7isjH/qhEIL/HftSZmk8IbRZK3YoAKFnsfsHCpYd22ujBKSUBiW7cjbGaDfEOeLKPDPwh4h0PQN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5Z3YUo6LdAzebv0bJfcNyGkaG+3835sb19u/J4ytOY=;
 b=EMN46z+c7QkOwACm3IIIn2zVdOoKQtgXSQ4m7IP1OfM6x6F6XuhPnIbIcUDi01hdt/pyoJer70rqSHD1/fc32Uoy9974bmvG4NSPZJBPoWfI2SZhmweCrtZIE1FMWiAqgCsgyz/jexIIpb0iCLrwos1hhEGI6MwAklUPyejSeR2HB4KNdXEHhxi2EdeIk9o5nVLfVNgUdCefiDl6fYnm36qjXwpsUDS20pjDwus8/hcFSokkzhOtRt6TIkaBr/X2xZay0haE5SgpWUFpWgGHyzbccKKznAxpGpALiyXPRALIYLm7HX0PvgFoU5HkkMK+4B3lew1dvDuQiOcVHIUvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MN2PR20MB2512.namprd20.prod.outlook.com (2603:10b6:208:130::24)
 by CY4PR20MB1624.namprd20.prod.outlook.com (2603:10b6:903:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Sat, 9 Apr
 2022 17:12:31 +0000
Received: from MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::356d:2f6:6491:1391]) by MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::356d:2f6:6491:1391%4]) with mapi id 15.20.5144.028; Sat, 9 Apr 2022
 17:12:31 +0000
From: Bruno Damasceno Freire <bdamasceno@hotmail.com.br>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Filipe Manana
	<fdmanana@kernel.org>, "dsterba@suse.cz" <dsterba@suse.cz>, Chris Mason
	<clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba
	<dsterba@suse.com>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, linux-btrfs <linux-btrfs@vger.kernel.org>,
	"fdmanana@suse.com" <fdmanana@suse.com>
Subject: Re: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Topic: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Index:
 AQHYPN5CzLbpGwv62Eyf/QOJSNQRSqzOeNCAgAWocgOAAJL+gIAKXisIgAbbsgCAAEinAIAAEbGAgAAPbICAAZdy0g==
Date: Sat, 9 Apr 2022 17:12:31 +0000
Message-ID:
 <MN2PR20MB2512CEFB95106D91FD9F1717D2E89@MN2PR20MB2512.namprd20.prod.outlook.com>
References:
 <MN2PR20MB2512314446801B92562E26B5D2169@MN2PR20MB2512.namprd20.prod.outlook.com>
 <07bb78be-1d58-7d88-288b-6516790f3b5d@leemhuis.info>
 <MN2PR20MB251203B4B5445B4B0C4148C9D21D9@MN2PR20MB2512.namprd20.prod.outlook.com>
 <35b62998-e386-2032-5a7a-07e3413b3bc1@leemhuis.info>
 <MN2PR20MB251205164078C367C3FC4166D2E59@MN2PR20MB2512.namprd20.prod.outlook.com>
 <9163b8a9-e852-5786-24fa-d324e3118890@leemhuis.info>
 <20220408145222.GR15609@twin.jikos.cz> <YlBa/Rc0lvJCm5Rr@debian9.Home>
 <74e4cc73-f16d-3e79-9927-1de3beea4a11@leemhuis.info>
In-Reply-To: <74e4cc73-f16d-3e79-9927-1de3beea4a11@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: ef6682fe-0908-adec-3e5e-cf086684f4c2
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [4gy6QfkqIaeP2GYSC0IC90WNjp+QhtIg]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4924c5d-8e24-4211-ad26-08da1a4c21e1
x-ms-traffictypediagnostic: CY4PR20MB1624:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6vwGlFsCAD0zvRH4BM+TT0nePqTGLLtBPVvvk0CjCrzhkRDoCGNh8fWnKJpO38Q7wls7rbEM2ptAgGrLirGM5GmCJrKG0lcrPuoJWcF1GNzjZNuFLhs5aOeWLksqCz9Lva+PXdCl7PtbvWNsDBwKNLRS4qLHA32ZWrMJLA2uLfzeXHrp1XC/ph7vCVGEdFZSLfTe4fkVAJLQQ8zqZmBEy3qQ83aUaKrhxUFFZLCHcH7Dmu5rjHBXgZP9HyotMyX7/D4X3WR4XiU4edugOQk9U1JCO6DmLQ5iSy7jGR9mYfeBT1/Hsjww9VzxzmKQMi1bt36gxEB6SZnQKKDJ8c+wRdnkSfA1cPd4Te6CMpG64aZ7+ykWdnHz9LWFA1Br1RPAMb0yH75g7ef9gBcB2nKKFEjx06jKTsymMcN3QnWduJvrCAtxPZzy2gNm5k0Mv/7HNF6CGLQplJVu78ohAR54jHaky1cTPpg52tMb5xPnU0zfCYYDZfu1UhAwJxFynQcC8skGJ9yHroA84wNpFYyvUTE7BbqyVfsTpD7ec2KUi5fC7wUWyAwp16zmNgAmX0d38dw6jCj6y8svhGKWA1ytTnkaybIgIgPUAWJ/f5uHFJjo1GvFZNDRlVfywwUQOXBa
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sowuh1QqgARNSxhqldcouGdHiooGrpAnRFZUKnSEAR22MZ71vaSWxJOzw4?=
 =?iso-8859-1?Q?JWdhE6gDgbd1MjgZh/H0zmmx3/rMkpAfPNX1DW96RQqCaan9YypRQdm88W?=
 =?iso-8859-1?Q?NJDGAyN+MxQOyWnYFTJ9J9O4msUXDe9xyKJos4u+nEmgZY5eBc13rkMl4A?=
 =?iso-8859-1?Q?VS1li9xelW7NH1RxvApESWieCRjsSVBIDJWuMauh/aKzDQ2KXcspxME7Ps?=
 =?iso-8859-1?Q?h1Hef1lkageePFr5XHFN/knuI3NWwfNaDj5MqVLxu/bdEVrshHtW4wXni3?=
 =?iso-8859-1?Q?/oWpM2XxR5WadbDQcCPMtQXX8Y8L0SVFyQq/pnv/Srce7F4iatxfgIWZZt?=
 =?iso-8859-1?Q?/dAG5FXITqW7mmu45iTgisb8xvOCuXoiTQYxOLxJr91A81rT91SRWwzrAE?=
 =?iso-8859-1?Q?3TanTSzvgyWombyA9WFbZguJ8hpAQotirIJyFXhFDlyYO8MEyUVGxR+fEC?=
 =?iso-8859-1?Q?4jES8aamx9o5YvUBxZ/OynVtRCnT+JgSwXAVksM5CR058h9OYjMtEXQXeR?=
 =?iso-8859-1?Q?i3JknIKSFzJy0UZRLzmHzQMQCtXsqgCrbXEFzZwUz5nAcaVNIghgQRJX4c?=
 =?iso-8859-1?Q?JeTJj/oTgwewDOZMWEeO7r5nM3s0/Cp9fP/vkha0cp+Srw1jFOAmcc4O6i?=
 =?iso-8859-1?Q?k3z5Qi13eoReor0+2Ctvef5QuMxtxfzt602KoeWuxG3uGLBP9DgfV59AX4?=
 =?iso-8859-1?Q?SGijAvQmntaRHKhZ5x6Wq51FpLoSq+yeI8tJANRERyMDTdNcmIC93SzR7G?=
 =?iso-8859-1?Q?EnZ0gU4F0HeHwrlXtdmtRQ+5M4ZEr//4Z4XeHmnUAMOtLVni/bUXoILqtw?=
 =?iso-8859-1?Q?ElGKJ74q9vT+UCxIjqH6sGqMCgNWsbVttl6JVUXGncSHSnPNBs2K6RleJN?=
 =?iso-8859-1?Q?jN+Egy7900uOXUFvvPf/GKrJZN0KcP5eDHEwHfKjIEj7vY7QwO3zTXU/a+?=
 =?iso-8859-1?Q?idTiWcF8RC+QR8yVuxZrb7ieh2Kfl5Gyqn6dQSqsmjTHjZDX8GNKIoJ33e?=
 =?iso-8859-1?Q?SGNY8QTVKoJxT29LzB9J/Jdn5/ZcSitLPhh9GveED4TFwcgnbSJqvjcTsE?=
 =?iso-8859-1?Q?PcdDIDykn7YDOI9caIccgg2Ma+b1lcQLtvX14XIYn//fEPeYkoua55Zw4K?=
 =?iso-8859-1?Q?AHXjPsjIV3JgbuKh+ph/29ufUvYgiB54oJNrfjQTS7ZcmNInMTfd0BnMpM?=
 =?iso-8859-1?Q?BTNt3nko54DqUwDd/KP0WPNqFnrvg3Pe11Cjz6Y0h477pfSuORKwV5KHHl?=
 =?iso-8859-1?Q?iEU3MuRLawN1Jq3IPA/WBFL9wMxUnGhJs/ZVFsTYjoBckmu6Vwy1eg79bf?=
 =?iso-8859-1?Q?RuS/XAppcHzU+7WlMbUF3pO+4lnouVEvZR9CtvAuREgIw/vrKNWYA8nGxS?=
 =?iso-8859-1?Q?T/equWRo8cbw/DpnheN0jrn6YP7zJC2p8C3o47Vc2T20oThyYX/kuZwUTI?=
 =?iso-8859-1?Q?kR0U/GOXc4Rctmp97u1zc3V2PIGxdXomLJYLCQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-9803a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR20MB2512.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f4924c5d-8e24-4211-ad26-08da1a4c21e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2022 17:12:31.3840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR20MB1624

On 08.04.22 04:50, Thorsten Leemhuis wrote:=0A=
> First off: David, Filipe, many thx for your answers, that helped me a=0A=
> lot to get a better picture of the situation!=0A=
> =0A=
> On 08.04.22 17:55, Filipe Manana wrote:=0A=
>> On Fri, Apr 08, 2022 at 04:52:22PM +0200, David Sterba wrote:=0A=
>>> On Fri, Apr 08, 2022 at 12:32:20PM +0200, Thorsten Leemhuis wrote:=0A=
>>>> Hi, this is your Linux kernel regression tracker. Top-posting for once=
,=0A=
>>>> to make this easily accessible to everyone.=0A=
>>>>=0A=
>>>> Btrfs maintainers, what's up here? Yes, this regression report was a b=
it=0A=
>>>> confusing in the beginning, but Bruno worked on it. And apparently it'=
s=0A=
>>>> already fixed in 5.16, but still in 5.15. Is this caused by a change=
=0A=
>>>> that is to big to backport or something?=0A=
>>>=0A=
>>> I haven't identified possible fixes in 5.16 so I can't tell how much=0A=
>>> backport efforts it could be. As the report is related to performance o=
n=0A=
>>> package updates, my best guess is that the patches fixing it are those=
=0A=
>>> from Filipe related to fsync/logging, and there are several of such=0A=
>>> improvements in 5.16. Or something else that fixes it indirectly.=0A=
>>=0A=
>> So there's a lot of confusion in the thread,=0A=
> =0A=
> Yeah, definitely. That basically why I had hoped from a rough assessment=
=0A=
> from the btrfs maintainers.=0A=
> =0A=
>> and the original openSUSE=0A=
>> bugzilla [1] is also a bit confusing and large to follow.=0A=
>>=0A=
>> Let me try to make it clear:=0A=
>>=0A=
>> 1) For some reason, outside btrfs' control, inode eviction is triggered=
=0A=
>>    a lot on 5.15 kernels in Bruno's test machine when doing package=0A=
>>    installations/updates with zypper.=0A=
> =0A=
> So I assume there are no other reports like this? Great!=0A=
=0A=
Well, "inode eviction is triggered a lot on 5.15 kernels in Bruno's test=0A=
machine when doing package installations/updates with zypper" is a little=
=0A=
misleading IMHO. While this was true at the very beginning it became more=
=0A=
than that. Now the high inode eviction is already know to be 100%=0A=
reproducible on:=0A=
- at least one real workload (opensuse package update).=0A=
- 3 different bare metal machines with different hardware configuration.=0A=
- 3 different cpus from 2 different cpu manufactures.=0A=
- one synthetic worklod (the scripts I provided).=0A=
- 4 different distributions on virtual machines.=0A=
- all 5.15 kernels that I tried on.=0A=
=0A=
About the lack of reports, my only guess is that most users must choose the=
=0A=
compress mount option instead of manually setting the compression property:=
=0A=
- the compress mount option doesn't trigger the regression.=0A=
- the compression property does trigger the regression.=0A=
=0A=
>> [...]=0A=
> =0A=
>> 6) In short, it is not known what causes the excessive evictions on 5.15=
=0A=
>>    on his machine for that specific workload - we don't have a commit to=
=0A=
>>    point at and say it caused a regression. [...]=0A=
> =0A=
> Bruno, under these circumstances I'd say you need to bisect this to get=
=0A=
> us closer to the root of the problem (and a fix for it). Sadly that how=
=0A=
> it is sometimes, as briefly explained here:=0A=
> =0A=
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
Documentation/admin-guide/reporting-regressions.rst#n140=0A=
=0A=
Ok Thorsten.=0A=
=0A=
It's not sad at all: I had a great time researching this regression and=0A=
gained a lot of knowledge while doing so. The problem is that I am just a=
=0A=
simple user at its limits here and additional bisection is probably beyond =
my=0A=
abilities. I can only hope some kernel developer feels motivated to further=
=0A=
investigate this subject.=0A=
=0A=
Again, sorry for the confusion and thanks a lot for your patience and for t=
he=0A=
directions.=0A=
=0A=
>> This thread is also basically a revamp of an older thread [3].=0A=
>>=0A=
>> [1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1193549=0A=
>> [2] https://lore.kernel.org/linux-btrfs/cover.1642676248.git.fdmanana@su=
se.com/=0A=
>> [3] https://lore.kernel.org/linux-fsdevel/MN2PR20MB251235DDB741CD46A9DD5=
FAAD24E9@MN2PR20MB2512.namprd20.prod.outlook.com/=0A=
> =0A=
> Yeah, but it was this thread that made me aware of the issue -- and just=
=0A=
> like [3] it didn't get a single reply from a btrfs maintainer, so I had=
=0A=
> to assume the report was ignored. A quick "we have no idea what my cause=
=0A=
> this issue and it's the only report with such symptoms so far; could you=
=0A=
> please bisect" would have made me happy already. :-D=0A=
> =0A=
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)=
=0A=
> =0A=
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of=0A=
> reports on my table. I can only look briefly into most of them and lack=
=0A=
> knowledge about most of the areas they concern. I thus unfortunately=0A=
> will sometimes get things wrong or miss something important. I hope=0A=
> that's not the case here; if you think it is, don't hesitate to tell me=
=0A=
> in a public reply, it's in everyone's interest to set the public record=
=0A=
> straight.=0A=
> =0A=
=0A=
Grazie, Bruno.=
