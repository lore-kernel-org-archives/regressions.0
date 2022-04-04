Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07olkn2030.outbound.protection.outlook.com [40.92.15.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378621FD3
	for <regressions@lists.linux.dev>; Mon,  4 Apr 2022 05:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmiiqBzdn1QuO7P7KN9WN8XFtUi529IYJYnKqVfF4SM099t1vbhlSAzOxl0Zh8w83D6NRQnlDTKRWrrpfTSnL+EHqWacFvRi3nAgEZfjv47/y0ErHYFgABk38kS8hPmn7cyDSTO26tXEbAsYfnqeNa+1G3HKmvi2EHQYWceMqGVvCHLUDOEvVq0TLraaepaUYS75CXnNeQGa5v2qrvw+FFHXX/mMOjIkEIA7+MtvNwUKpqhM6NHnYfTRlUxVBPJT7H2usps2y8kIuI/uvFrODUAz/uY4dKRQ7S4na61CSny6cxqTy6UU610zupUOt58lENgOC5cw9mXR0VsOFvh+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0SDwmUCd7KjFtra+fayOccGBOGZwPPdf/kH75iepKU=;
 b=hwuQKMCxUQ3+UCRymz7qZoNFU4VNwY42Uo+Vnx5W6WXZwzG52FY/rq131Nhc3DrzJ1Alff8u21vtXH87jBOuBf0xN/iTDuhnxmnXOvS0H2HOi0AILBTa231fXsRplwMIML3Gs+f4xmt3FPJXmBziV1ZQzEoWzQfofuqZqr/GNPZaBuSoPTUreifzX2WFvxRWxcWwMvuorw8fl/hQsXh6Jhi4fadmBpf0qxCuNZqxVnQByN5l8QurmTBQAE56qEUtOl9BDGJO6kGzo37JsFoYf7ZSHTY/2Zh87txmhdA2K/5N0LKuFhe0zmGC0HQO4u28bt5cEGNoMUhSeOu8B9FLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MN2PR20MB2512.namprd20.prod.outlook.com (2603:10b6:208:130::24)
 by MN2PR20MB3054.namprd20.prod.outlook.com (2603:10b6:208:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 05:29:18 +0000
Received: from MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::b88e:590:db84:1f8f]) by MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::b88e:590:db84:1f8f%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 05:29:18 +0000
From: Bruno Damasceno Freire <bdamasceno@hotmail.com.br>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
CC: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-btrfs
	<linux-btrfs@vger.kernel.org>
Subject: Re: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Topic: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Index: AQHYPN5CzLbpGwv62Eyf/QOJSNQRSqzOeNCAgAWocgOAAJL+gIAKXisI
Date: Mon, 4 Apr 2022 05:29:18 +0000
Message-ID:
 <MN2PR20MB251205164078C367C3FC4166D2E59@MN2PR20MB2512.namprd20.prod.outlook.com>
References:
 <MN2PR20MB2512314446801B92562E26B5D2169@MN2PR20MB2512.namprd20.prod.outlook.com>
 <07bb78be-1d58-7d88-288b-6516790f3b5d@leemhuis.info>
 <MN2PR20MB251203B4B5445B4B0C4148C9D21D9@MN2PR20MB2512.namprd20.prod.outlook.com>
 <35b62998-e386-2032-5a7a-07e3413b3bc1@leemhuis.info>
In-Reply-To: <35b62998-e386-2032-5a7a-07e3413b3bc1@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 9d936de2-3224-8d1a-db1b-876e723de79c
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Ip/dCt4TzuOGfTvVrHwxGP+ghKUkSZHV]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04b49901-b17d-4e43-2013-08da15fc1100
x-ms-traffictypediagnostic: MN2PR20MB3054:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hiftqvLvtv/ZIlI4UDm98oAYLMelJjGdfbC4Deme6OgQwv4fg1nEQxcChrzxG8McfDL9tVy9UNFlWu2IydZlPDo44QeaaHKCQg02pkK+TYhPcEt11FFFRiMWObHP7F3fCYEUpIikxBs/6/Pnp1taSiGHFmuGSt1BqGhGt/9PwWYv92G6lyNXNYjFmw4kX9Vk2v6w/RoWYvj4tEbKITTivnN7XBRNeA83/G+IecTKEKKc4t+ykDbTTAma0VD6EKDn8J2j3mIPTEVm2goqwTU5qFAqk+rxNqFDpyiiHH+Xhb9x2RCC6f+1IWz/YruNqTRPNDnhnpXdWXrNbZzAjX399EujvaQZrq34MhXrNU8VH6YxjUZ0HfzRIElzi3IgjyLTf1cjh2jrpdcZ9ltPmNcsTcwooYqIikpoqGPaFzRWdZHo6+dZ4jQoYlCpp14SHr2YlXf0DDONmLcu6gGWnHbZf5wVXaTbqJ/D5bSLyvgKdflR2Vil3irELOGj5VV9pEf8X5dZHS3sU+F/Tq0t/U2T2CVrMxG0BrBim/6iBV8+MSJxs2kNRiEYGCzpTBSb6PHMzat63eOk8QIT//f20fY0+y/yY7Tlhvb6CmMyuwTDwSw6Fy/5pGB8m4cnx/w7K+Dn
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ncmieAKgc3V1Cjcx1YWZTzz0XTO6z+afN5uPRfnLeaP7CxzKVdRlbpiuO6?=
 =?iso-8859-1?Q?bo+YduYYkG5/8sqnic9etnIDKJTVRde6DPOgcqWZ73+hqruuJb+dF+FcVn?=
 =?iso-8859-1?Q?CIACnneygkPMvy1Gi20+Lz/HZ8KCQ45gV8ncbR2ksb3hjd7G04WEFjjBx6?=
 =?iso-8859-1?Q?uKFCF6XpQBSf14vhMG3UisHCWt0H9kSBBUFDFGsNbiZFR6+LrkO2XdMumw?=
 =?iso-8859-1?Q?LhfW/WG/dliqDJElDsfnhI9AKiSRk60akOkBN6/E8S7XfvbJiLw/I3ZIzI?=
 =?iso-8859-1?Q?UpeeV0EG0L6XEHJX4ybXtsIssT/VqpAK73pzIPAKMprrrJUJTPtXIm5NjI?=
 =?iso-8859-1?Q?uWhKALebg8xthjp2Eh4BSgPb4nsgBcVaBlxG+hRfpc4WDPlCGdBJ3c4jeQ?=
 =?iso-8859-1?Q?P21S4UH2litGDtC24qmjBKm4T/IPH1e0EBtre4qw0yeGauLCwM0zMlnYBJ?=
 =?iso-8859-1?Q?afpFVLOBXE7YAi4pk4SRcTKb/hV9yC9upO+XIaLoOkrkObbdv3e050KjIV?=
 =?iso-8859-1?Q?3VPPS4VummNdKBwss0BnObtxHh6tczZKBtMHxdKMbzGt1+fVJtQIe85lMV?=
 =?iso-8859-1?Q?hKTHSu/DkHGNyIF8h998hpvvOdlclsWOOJtLlVK4T/FPt1hWhgazREjr7h?=
 =?iso-8859-1?Q?XWYWwFW2NhxrVfZTKrbpza4ocD4bUcl9c8VnT3E8KLQaVH84ysIM2ka9nh?=
 =?iso-8859-1?Q?L8kTz1fpEXQJaVQ+L7tCN/D9iywgfYCfM/8uN4oEXgFeY9FjJ/k87WYmjL?=
 =?iso-8859-1?Q?Nzwxxf7zDWpBlcPlHDY7bQreNFgzw31+UweEjAqY498tWQX2IwcDeXBg1V?=
 =?iso-8859-1?Q?lMIxrgVbtHPdJrlVrHCyc6qIi62foAtJ/g07HTqxjkZ6hoNI4XOHyxzcRg?=
 =?iso-8859-1?Q?3qCP3X/wqSQtaD/koyjXq+E6g9DLjo51dgr9qxzxIiIoF3tHDrm9yqdJD7?=
 =?iso-8859-1?Q?+AcKGRvubY7CiKv4lppWdyhNGlPu+ZaDJb0onZZ9HdPojLTsqmHXANhJ6Q?=
 =?iso-8859-1?Q?uct/YL/5uIIJ/vKPblmex4Qy1TroUUf6E4ydsNj2nrM0cTOPw0S3R9ESpy?=
 =?iso-8859-1?Q?fUNdWmgzSkNMMGiZbr1CpwhlZz6xaY49xRW76948CasHDArll0USCEDywu?=
 =?iso-8859-1?Q?+RQ9GSKC2sxQB2fq4Qnvet1ylzhpHcZHsWQdcGYe9aK3KqvNHSmhOmkIq8?=
 =?iso-8859-1?Q?3ggcTAazxVJ8LpUyG6/yMsGgWYXNs/GbF46IpBIC57EsKTtNq0GRJ2FM/Z?=
 =?iso-8859-1?Q?7otd4m+FQvEIVJOspc/WuGBPcCqYseqnPWG7ah8oxU7DyDLvuGuQk6ayZd?=
 =?iso-8859-1?Q?gaLrnxNNeA7MN9MJky3GX/MOmoiFlWTVgdgJcrZragf74uE4P7YaATHmgQ?=
 =?iso-8859-1?Q?RVHTdvXndmhfgpetyERgLVetV4w0Jh/CLkIY6OtRLgTijYqW1dOWeTfLhP?=
 =?iso-8859-1?Q?XI/KI47Livfd5S066u9ifY1VDniugyPjR/TtCg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b49901-b17d-4e43-2013-08da15fc1100
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 05:29:18.6571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB3054

On 28.03.22 13:28, Thorsten Leemhuis wrote:=0A=
> Hi Btrfs developers, this is your Linux kernel regression tracker.=0A=
> Top-posting for once, to make this easily accessible to everyone.=0A=
> =0A=
> Are there any known regressions in 5.15 that cause more inode evictions?=
=0A=
> There is a user reporting such problems, see the msg quoted below, which=
=0A=
> is the last from this thread:=0A=
> =0A=
> https://lore.kernel.org/all/MN2PR20MB2512314446801B92562E26B5D2169@MN2PR2=
0MB2512.namprd20.prod.outlook.com/=0A=
> =0A=
> @Bruno: sorry, you report is very hard to follow at least for me. Maybe=
=0A=
> the btrfs developers have a idea what's wrong here, but if not you=0A=
> likely need to make this easier for all us:=0A=
> =0A=
> Write a really simple testcase and run it on those vanilla kernels that=
=0A=
> matter, which are in this case: The latest 5.17.y and 5.15.y releases to=
=0A=
> check if it was already solved -- and if not, on 5.14 and 5.15. Maybe=0A=
> you need to bisect the issue to bring us closer the the root of the=0A=
> problem. But with a bit of luck the btrfs developers might have an idea=
=0A=
> already.=0A=
> =0A=
> Ciao, Thosten=0A=
=0A=
Hi Thorsten,=0A=
Thanks for the feedback.=0A=
I tried my best to make it simple this time.=0A=
I hope it is, at least, better than before.=0A=
Grazie, Bruno=0A=
=0A=
*** Test case about high inode eviction on the 5.15 kernel ***=0A=
=0A=
This regression was first observed during rpm operations with specific pack=
ages that became A LOT slower to update ranging from 4 to 30 minutes [1].=
=0A=
The symptoms are: high cpu usage, high inode eviction and much slower I/O p=
erformance.=0A=
Analyzing the rpm's strace report and making some experiments I could repla=
ce the rpm with a script that do 3 thing:=0A=
- rename a file, unlink the renamed file and create a new file.=0A=
=0A=
This test case is designed to trigger the following regression on the 5.15 =
kernel:=0A=
* repeated renameat2, unlink and openat system calls reach files with btrfs=
 compression property enable.=0A=
* the combination of these system calls and the btrfs compression property =
triggers the high inode eviction.=0A=
* the high inode eviction causes to much work for the btrfs directory loggi=
ng.=0A=
* the overloaded btrfs directory logging causes the slower I/O performance.=
=0A=
=0A=
A simplified script is supplied.=0A=
For a more capable script, more information and more test results please re=
fer to my github account [2].=0A=
=0A=
[1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1193549=0A=
[2] https://github.com/bdamascen0/s3e=0A=
=0A=
Index:=0A=
1.   Vanilla kernels=0A=
2.   k5.14.21 x k5.15.32=0A=
2.1. Detailed test report for compressed files=0A=
2.2. Comparison results for compressed files=0A=
2.3. Detailed test report for uncompressed files=0A=
2.4. Comparison results for uncompressed files=0A=
2.5. Cpu usage=0A=
3.   k5.17.1 and k5.16.15=0A=
3.1. Basic test report=0A=
4.   Simplified test script=0A=
=0A=
=0A=
1.   Vanilla kernels=0A=
=0A=
This test case mainly covers the following vanilla kernels [3]: 5.15.32 and=
 5.14.21.=0A=
The 5.15.32 vanilla kernel produced abnormal results:=0A=
* high cpu usage, high inode eviction and much slower I/O performance for c=
ompressed files.=0A=
* double inode eviction and slightly worse I/O performance for uncompressed=
 files.=0A=
The 5.14.21 vanilla kernel produced normal results and is used as a referen=
ce.=0A=
The 5.17.1 and 5.16.15 vanilla kernels [4] produced normal results which ca=
n be found at the end.=0A=
=0A=
[3] https://wiki.ubuntu.com/Kernel/MainlineBuilds =0A=
[4] https://software.opensuse.org/package/kernel-vanilla=0A=
=0A=
=0A=
2.   k5.14.21 x k5.15.32=0A=
=0A=
2.1  Detailed test report for compressed files=0A=
=0A=
ubuntu jammy jellyfish -- kernel 5.14.21 --- vanilla --- (kvm)=0A=
...updating   50 files on /mnt/inode-ev/zstd: Job took    226 ms @inode_evi=
ctions: 51=0A=
...updating   50 files on /mnt/inode-ev/lzo:  Job took    222 ms @inode_evi=
ctions: 51=0A=
...updating  100 files on /mnt/inode-ev/zstd: Job took    384 ms @inode_evi=
ctions: 101=0A=
...updating  100 files on /mnt/inode-ev/lzo:  Job took    462 ms @inode_evi=
ctions: 101=0A=
...updating  150 files on /mnt/inode-ev/zstd: Job took    493 ms @inode_evi=
ctions: 151=0A=
...updating  150 files on /mnt/inode-ev/lzo:  Job took    554 ms @inode_evi=
ctions: 151=0A=
...updating  200 files on /mnt/inode-ev/zstd: Job took    804 ms @inode_evi=
ctions: 201=0A=
...updating  200 files on /mnt/inode-ev/lzo:  Job took    725 ms @inode_evi=
ctions: 201=0A=
...updating  250 files on /mnt/inode-ev/zstd: Job took    745 ms @inode_evi=
ctions: 251=0A=
...updating  250 files on /mnt/inode-ev/lzo:  Job took    758 ms @inode_evi=
ctions: 251=0A=
...updating 1000 files on /mnt/inode-ev/zstd: Job took   3452 ms @inode_evi=
ctions: 1001=0A=
...updating 1000 files on /mnt/inode-ev/lzo:  Job took   2979 ms @inode_evi=
ctions: 1001=0A=
ubuntu jammy jellyfish -- kernel 5.15.32 --- vanilla --- (kvm)=0A=
...updating   50 files on /mnt/inode-ev/zstd: Job took    420 ms @inode_evi=
ctions: 1275=0A=
...updating   50 files on /mnt/inode-ev/lzo:  Job took    488 ms @inode_evi=
ctions: 1275=0A=
...updating  100 files on /mnt/inode-ev/zstd: Job took   1649 ms @inode_evi=
ctions: 5050=0A=
...updating  100 files on /mnt/inode-ev/lzo:  Job took   1566 ms @inode_evi=
ctions: 5050=0A=
...updating  150 files on /mnt/inode-ev/zstd: Job took   4448 ms @inode_evi=
ctions: 11325=0A=
...updating  150 files on /mnt/inode-ev/lzo:  Job took   4136 ms @inode_evi=
ctions: 11325=0A=
...updating  200 files on /mnt/inode-ev/zstd: Job took   9177 ms @inode_evi=
ctions: 20100=0A=
...updating  200 files on /mnt/inode-ev/lzo:  Job took   9070 ms @inode_evi=
ctions: 20100=0A=
...updating  250 files on /mnt/inode-ev/zstd: Job took  16191 ms @inode_evi=
ctions: 31375=0A=
...updating  250 files on /mnt/inode-ev/lzo:  Job took  16062 ms @inode_evi=
ctions: 31375=0A=
...updating 1000 files on /mnt/inode-ev/zstd: Job took 132865 ms @inode_evi=
ctions: 104195=0A=
...updating 1000 files on /mnt/inode-ev/lzo:  Job took 131979 ms @inode_evi=
ctions: 106639=0A=
=0A=
2.2. Comparison results for compressed files=0A=
=0A=
k5.15.32 vanilla (compared to: k5.14.21 vanilla)=0A=
50   files gives aprox.  1.8 x more time and aprox.  25 x more inode evicti=
ons =0A=
100  files gives aprox.  3.3 x more time and aprox.  50 x more inode evicti=
ons =0A=
150  files gives aprox.  7.4 x more time and aprox.  75 x more inode evicti=
ons =0A=
200  files gives aprox. 11.4 x more time and aprox. 100 x more inode evicti=
ons =0A=
250  files gives aprox. 21.1 x more time and aprox. 125 x more inode evicti=
ons =0A=
1000 files gives aprox. 38.4 x more time and aprox. 100 x more inode evicti=
ons =0A=
=0A=
2.3  Detailed test report for uncompressed files=0A=
=0A=
ubuntu jammy jellyfish -- kernel 5.14.21 --- vanilla --- (kvm)=0A=
...updating   50 files on /mnt/inode-ev/uncompressed: Job took  214 ms @ino=
de_evictions: 51=0A=
...updating  100 files on /mnt/inode-ev/uncompressed: Job took  402 ms @ino=
de_evictions: 101=0A=
...updating  150 files on /mnt/inode-ev/uncompressed: Job took  543 ms @ino=
de_evictions: 151=0A=
...updating  200 files on /mnt/inode-ev/uncompressed: Job took  694 ms @ino=
de_evictions: 201=0A=
...updating  250 files on /mnt/inode-ev/uncompressed: Job took  835 ms @ino=
de_evictions: 251=0A=
...updating 1000 files on /mnt/inode-ev/uncompressed: Job took 3162 ms @ino=
de_evictions: 1001=0A=
ubuntu jammy jellyfish -- kernel 5.15.32 --- vanilla --- (kvm)=0A=
...updating   50 files on /mnt/inode-ev/uncompressed: Job took  269 ms @ino=
de_evictions: 99=0A=
...updating  100 files on /mnt/inode-ev/uncompressed: Job took  359 ms @ino=
de_evictions: 199=0A=
...updating  150 files on /mnt/inode-ev/uncompressed: Job took  675 ms @ino=
de_evictions: 299=0A=
...updating  200 files on /mnt/inode-ev/uncompressed: Job took  752 ms @ino=
de_evictions: 399=0A=
...updating  250 files on /mnt/inode-ev/uncompressed: Job took 1149 ms @ino=
de_evictions: 499=0A=
...updating 1000 files on /mnt/inode-ev/uncompressed: Job took 7333 ms @ino=
de_evictions: 1999=0A=
=0A=
2.4. Comparison results for uncompressed files=0A=
=0A=
k5.15.32 vanilla (compared to: k5.14.21 vanilla)=0A=
50   files gives aprox. 1.2 x more time and aprox. 2 x more inode evictions=
 =0A=
100  files gives aprox. 0.8 x more time and aprox. 2 x more inode evictions=
 =0A=
150  files gives aprox. 1.2 x more time and aprox. 2 x more inode evictions=
 =0A=
200  files gives aprox. 1.0 x more time and aprox. 2 x more inode evictions=
 =0A=
250  files gives aprox. 1.3 x more time and aprox. 2 x more inode evictions=
 =0A=
1000 files gives aprox. 2.3 x more time and aprox. 2 x more inode evictions=
 =0A=
=0A=
2.5. Cpu usage=0A=
=0A=
ubuntu jammy jellyfish -- kernel 5.15.32 --- vanilla --- (kvm)=0A=
...updating 1000 files on /mnt/inode-ev/zstd:         Job took 132691 ms - =
real 2m12,731s sys 2m 7,134s=0A=
...updating 1000 files on /mnt/inode-ev/lzo:          Job took 134130 ms - =
real 2m14,149s sys 2m 8,447s=0A=
...updating 1000 files on /mnt/inode-ev/uncompressed: Job took   7241 ms - =
real 0m 7,256s sys 0m 4,732s=0A=
=0A=
=0A=
3    k5.17.1 and k5.16.15=0A=
=0A=
Just for the record, the 5.16 kernel never reproduced the regression.=0A=
The real life workload to trigger the regression, the rpm package updates, =
were verified to work fine since 5.16~rc6 [1].=0A=
It was expected that the synthetic workload from the script also produced n=
ormal results on the 5.16 and 5.17 kernels.=0A=
=0A=
[1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1193549=0A=
=0A=
=0A=
3.1  Basic test report=0A=
=0A=
opensuse tumbleweed ----- kernel 5.16.15 --- vanilla --- (kvm)=0A=
...updating 250 files on /mnt/inode-ev/zstd:         Job took 910 ms @inode=
_evictions: 250=0A=
...updating 250 files on /mnt/inode-ev/lzo:          Job took 740 ms @inode=
_evictions: 250=0A=
...updating 250 files on /mnt/inode-ev/uncompressed: Job took 717 ms @inode=
_evictions: 250=0A=
opensuse tumbleweed ----- kernel 5.17.1 ---- vanilla --- (kvm)=0A=
...updating 250 files on /mnt/inode-ev/zstd:         Job took 701 ms @inode=
_evictions: 250=0A=
...updating 250 files on /mnt/inode-ev/lzo:          Job took 695 ms @inode=
_evictions: 250=0A=
...updating 250 files on /mnt/inode-ev/uncompressed: Job took 954 ms @inode=
_evictions: 250=0A=
=0A=
=0A=
4.   Simplified test script=0A=
=0A=
This simplified script tries to setup, format and mount a ramdisk block dev=
ice.=0A=
It creates 3 testing folders (zstd, lzo, uncompressed) and set its btrfs co=
mpression property.=0A=
For each time the script is executed, 3 tests are done and the bpftrace is =
started right before each test.=0A=
=0A=
#!/bin/bash=0A=
# s3e_t3.sh (based on s3e.sh version 4.7)=0A=
# Simple Syscall Signature Emulator (test3)=0A=
# test3: populate + test. test renameat2/openat + unlink syscalls w/ empty =
files (3x)=0A=
# Copyright (c) 2022 Bruno Damasceno <bdamasceno@hotmail.com.br>=0A=
# Warning: no safety checks=0A=
=0A=
dir1=3Dzstd=0A=
dir2=3Dlzo=0A=
dir3=3Duncompressed=0A=
DIR=3Dzzz=0A=
NUM_FILES=3D250=0A=
DEV=3D/dev/ram0=0A=
MNT=3D/mnt/inode-ev=0A=
DIR_1=3D"$MNT/$dir1"=0A=
DIR_2=3D"$MNT/$dir2"=0A=
DIR_3=3D"$MNT/$dir3"=0A=
=0A=
populate() {=0A=
    DIR=3D$1=0A=
    echo "...populating 1st generation of files on $DIR:"=0A=
    for ((i =3D 1; i <=3D $NUM_FILES; i++)); do=0A=
        echo -n > $DIR/file_$i=0A=
    done=0A=
    }=0A=
=0A=
run_test() {=0A=
    DIR=3D$1=0A=
    sync=0A=
    xfs_io -c "fsync" $DIR=0A=
    echo -e "\n...updating $NUM_FILES files on $DIR:"=0A=
    #dumb pause so bpftrace has time to atach its probe=0A=
    sleep 3s=0A=
    start=3D$(date +%s%N)=0A=
    for ((i =3D 1; i <=3D $NUM_FILES; i++)); do=0A=
        mv $DIR/file_$i $DIR/file_$i-RPMDELETE=0A=
        unlink $DIR/file_$i-RPMDELETE=0A=
        echo -n > $DIR/file_$i=0A=
        echo -n "_$i"=0A=
        [ $i !=3D $NUM_FILES ] && echo -ne "\r"=0A=
    done=0A=
    end=3D$(date +%s%N)=0A=
    dur=3D$(( (end - start) / 1000000 ))=0A=
    echo -ne "\r"=0A=
    echo "Job took $dur milliseconds"=0A=
    }=0A=
=0A=
modprobe brd rd_size=3D128000 max_part=3D1 rd_nr=3D1=0A=
mkfs.btrfs --label inode-ev --force $DEV > /dev/null=0A=
mkdir $MNT=0A=
mount $DEV $MNT=0A=
mkdir $MNT/{$dir1,$dir2,$dir3}=0A=
btrfs property set $DIR_1 compression zstd:1=0A=
btrfs property set $DIR_2 compression lzo=0A=
btrfs property set $DIR_3 compression none=0A=
=0A=
for dir in "$DIR_1" "$DIR_2" "$DIR_3"=0A=
    do=0A=
        populate "$dir"=0A=
        bpftrace -e 'kprobe:btrfs_evict_inode { @inode_evictions =3D count(=
); }' & run_test "$dir"=0A=
        pkill bpftrace=0A=
        #dumb pause to wait the bpftrace report=0A=
        sleep 2s=0A=
    done=0A=
=0A=
umount $MNT=0A=
rm --dir $MNT=0A=
rmmod brd=0A=
