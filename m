Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2016.outbound.protection.outlook.com [40.92.20.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FC4182
	for <regressions@lists.linux.dev>; Mon, 28 Mar 2022 01:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+xrUF1yKFnxO8wmDCPBTjGJ46yc7P9NxcjjkQ76HsmO346Vc3kJGw+pa4aXxNkWVjJEqj9304IlxsSoJJIx3N32VITfWtpNrGjJJeBx+vqU68K1+Vdz0SwiPQvPGGRZbRGWl5PDQhNofsiKQ7a4uT/3K+HnPQrXgKAFONunQ/guktoUOtbwebwL+l/BLghjf42EeycRcKUiT37POlwi8fn/5YwOxxAZqc4z+gHdAhHGFJadLBcx4/SpEA4Nxu+nxNHZTyIbQTCv7oSlPPEGNLBTiywa+g5WULMv4oqNSOMz4DFtn34Y1ybeXeR+x+Tj20EJrz+TeQGB+9yUlfzDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UM/Gk8CkN9QO2X71vQYdvFC37BB5K2QHcIXhvnuctT8=;
 b=hSPLwMIj//FGBvrkjrLlyI55CSNjwFlwi0zufy3S8pxhIPan8Hjd3s9p1bcnOdqafAkpZ08tJlxtWRxmdSKYboaXZr1UAMFEaGP9Azc8j944SwGCSHxusPrGl3ioWC0vmXtC4snjfnu6ze9SNmEZATDemPnqh+5GeSPCWNKXb353KDEKs1mTTyGR1RwFOkW33e+/RdqrFLasAGRJxMGIf/8nLlfOFrr0QH/AMBIxxT5kQDtDiP0CA/YCaWkQPIrMXSqwqywDWlo3keVZ3naAL/Y95IVvyMHyLW9dMKisuCZp7jwVm8rkHJlGChB1pWR9Ek5MfI5v6U6pOdRDMAZwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MN2PR20MB2512.namprd20.prod.outlook.com (2603:10b6:208:130::24)
 by CH0PR20MB3929.namprd20.prod.outlook.com (2603:10b6:610:cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 01:29:06 +0000
Received: from MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::9478:70e3:10c0:b16b]) by MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::9478:70e3:10c0:b16b%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 01:29:06 +0000
From: Bruno Damasceno Freire <bdamasceno@hotmail.com.br>
To: Thorsten Leemhuis <regressions@leemhuis.info>
CC: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Topic: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Index: AQHYPN5CzLbpGwv62Eyf/QOJSNQRSqzOeNCAgAVDwAE=
Date: Mon, 28 Mar 2022 01:29:06 +0000
Message-ID:
 <MN2PR20MB2512CC55566CDBE7133C0ACDD21C9@MN2PR20MB2512.namprd20.prod.outlook.com>
References:
 <MN2PR20MB2512314446801B92562E26B5D2169@MN2PR20MB2512.namprd20.prod.outlook.com>
 <07bb78be-1d58-7d88-288b-6516790f3b5d@leemhuis.info>
In-Reply-To: <07bb78be-1d58-7d88-288b-6516790f3b5d@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: a6ecd9f3-ed7e-f35c-1fca-c8313d0c45ad
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Z1yJhKG4aiOWLx6rwIMh4GV6TlzUJjMB]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3051a980-2b35-44e6-0444-08da105a59ab
x-ms-traffictypediagnostic: CH0PR20MB3929:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 m9ZMG6KHPehmr7it2t7HjsX88C6FhvLytqXRglRMye8RQhE64/vyskBz2nNFaEju899zG3gQ8AWnhtoMWdQ/PXZGjMMcgecV7DzD4s2AowO9dsc4i021HFkeMhphqwM+Fiub5CYPHA4/w0CcRs8buTRU2/0tfwOGklGHWGwGaGxtgtyCHRoXt5tOd8ZTtX4bZIFCzq2QJbWpcjh8XytDhQ+HA5260rbPmkQVLUwi61grjnZyoTVJUX8aK+rbvAm83u4Yp1p2qSGMV9YCURue8sB+yA9aOPwh/YkZXQ7R7d4izzxFRAqive7hhJu1ENG+YGSH4nvL7e845+B+N4Y9dRIocbewbHk9vJZ+bjLGPnHyZQY56PRgM3yXWdPTaocluSEgBEAvxbpNyI4aj5al8Ns2hpcrbu6NTPpoexfeXSFUktc/F13PKTOy0mgnva89l9YSH1OzU4D72HXyL8I9QOBVUJDFb7Jog+44myggRYVW7J2lmtFXMD/9wsjaAyyWSy7vGbr8r8BkmIOWF+cm2ZlHNI0sP8bUk/Q2ZukAg3FyYQWfrR7w3qdbKvdERIisO137z/nsKjZaBuprYviUnOdrP4CAl4ax7WQz6w5R8eeRPIxr6A8AG43EBS2HISUi
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ll3GBRfmwSFWKYDL7e+ptNgioPd11em7JD2lxL8MG4/zdqQaEloVgBPptb?=
 =?iso-8859-1?Q?iL5e37pTpK2Fkry4AbjR8c9qSK5GWNEfxE8I3Cb5nYwBrSpFwtf4oyjqMZ?=
 =?iso-8859-1?Q?9Kz4H7fO3RvmApyPYEeEZs4Zbfb7INRt4UQBh/0warDIUZdXIqF3qqV7V1?=
 =?iso-8859-1?Q?LDelsLZTVLtmzOerFSUy+dXAnmUAWfJ1TpIXBCSGE6jbqwyGITI61cpEuI?=
 =?iso-8859-1?Q?XOyuzRWAJTYWi7jjbdhHZJdmYizlAh+ROchxdGz6HF5CUQp8OUSXM/HAoz?=
 =?iso-8859-1?Q?g7SSbwxFr6guCQ7fL4skzYDOgwLsOlvko3b2qDY3VgY/Ci8pilkRxzlgEN?=
 =?iso-8859-1?Q?Gc2PGYuo2/7IsKDQMWaHfdZDQ9v1TKWHWs5k+Dsk7stK7HQmvExX2TlJZV?=
 =?iso-8859-1?Q?HBLxiGa+5Y8v1nPRq1a91Ub2joO4p4+x8by4fUjRVI2KwhzRpDGCFlkMcs?=
 =?iso-8859-1?Q?Xi6X9vinQx87hfKJahG+4+8K0zP1v9uM/dwGQUzkadPiFn7GHT/vQHjgYD?=
 =?iso-8859-1?Q?4R96Rl32QuejJxXBBvp1gkZGFrSTusH3DLQqv62LoKKRI8uWc2K58sURvH?=
 =?iso-8859-1?Q?3YWty7kuoh7DkncDj7VKzrS09507b9+ZIfDPReUpqT2wScGCHueEIr7wEb?=
 =?iso-8859-1?Q?6Vy2THbsFDfZJ+xXJvCOMhR1vvteWPAEks6DX0VJvftMfnOmnySljSKGpN?=
 =?iso-8859-1?Q?kci8dBp3a3xPYrcK65nUMZ4hUsLKmHBsl2KkDPo8qBDAY09KGAwlU1Wuyr?=
 =?iso-8859-1?Q?Nk+j0kJjN4BDSkFPii9mn9dp1HuTk5Y+o3gkE45DajxJ14HqQzhpAWEsVE?=
 =?iso-8859-1?Q?GojXvn8lEqD5jg1RJXYqYUen+br2t9CF583IQlorO4AE+3GrtGRTy3MXwH?=
 =?iso-8859-1?Q?prjpv9JF+87CzrOmJ9UXUSZPv2p9XlHbX2gonMQ1vFt+VebMOShhBDs7yC?=
 =?iso-8859-1?Q?yH5bfENS7JHqehGd4/uGa4eNj+DFdLjWe5aoLY4ngaepZA6wfG2vmLJZzm?=
 =?iso-8859-1?Q?d2sERTcX7F+WpfwfYaAiVOkgoLsxTvbbAhAWk+WTjuLztbn1JmmEiDFd5d?=
 =?iso-8859-1?Q?j15mZQZtiL1HXZ6abXONjuuaND0w8ANlXudVxs7JTjSvBL+LaNx3cssO6+?=
 =?iso-8859-1?Q?Zta5OVrTSzNsUJHdxM3XmIPRO+Ffuv/zBm8bmSdMmYxZJQ69M6KpN7pUxy?=
 =?iso-8859-1?Q?8Z7m8uhAyKvHbqpfUBGRqPNOfkQOV/m5SuITnkwxK9ib5oYIbmLmuqN2+/?=
 =?iso-8859-1?Q?SuScNLQwNy9zcrfm8IN18IdIGBfKbTnbq69pJsH3q35DAJC3pXcGwITrqn?=
 =?iso-8859-1?Q?1gxMcFMed9WLu6evIAX4vayTnw16A6FmjPRnI3oQeKQCQDrZjVs9efT2Ow?=
 =?iso-8859-1?Q?AX/INpUymjusH/RDWIbfI7okCg1Ub4SzQrj1Yx8t1KhqLI9h5jV78XhV9D?=
 =?iso-8859-1?Q?nLuYgAQPbTrfNySNVu/Eznlaxh6g5+Td1goSyw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3051a980-2b35-44e6-0444-08da105a59ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 01:29:06.2421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB3929

On 24.03.22 13:18, Thorsten Leemhuis wrote:=0A=
> Hi, this is your Linux kernel regression tracker.=0A=
> =0A=
> CCing the regression mailing list, as it should be in the loop for all=0A=
> regressions, as explained here:=0A=
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html=
=0A=
=0A=
Thanks.=0A=
=0A=
> On 21.03.22 05:53, Bruno Damasceno Freire wrote:=0A=
> > Hello everybody;=0A=
> > =0A=
> > This regression was first found during rpm operations with specific pac=
kages that became A LOT slower to update ranging from 4 to 30 minutes.=0A=
> > =0A=
> > The slowness results from:=0A=
> > a_ the kernel regression: specific system calls touching files with btr=
fs compression property will generate higher inode eviction on 5.15 kernels=
.=0A=
> > b_ the inode eviction generating btrfs inode logging and directory logg=
ing.=0A=
> > c_ the btrfs directory logging on the 5.15 kernel not being particulary=
 efficient in the presence of high inode eviction.=0A=
> > =0A=
> > There is already an ongoing work [1] to improve "c" on newer kernels bu=
t I was told they are not elegible for the 5.15 version due to backporting =
policy restrictions.=0A=
> > AFAIK there isn't any work for "a" yet.=0A=
> > The consequence is that btrfs users running the 5.15 LTS kernel may exp=
erience severely degraded performance for specific I/O workloads on files w=
ith the compression property enabled.=0A=
> > =0A=
> > ___How to reproduce:=0A=
> > After some research I learned how to reproduce the regression without r=
pm.=0A=
> >=0A=
> > 1st option)=0A=
> > I made a script specifically to research this regression [2].=0A=
> > It has more information, more test results and several options.=0A=
> > The scrip does a little too much so I'm just linking it here.=0A=
> > I hope it can help.=0A=
> > =0A=
> > 2nd option)=0A=
> > boot a 5.15 kernel,=0A=
> > setup and mount a RAM disk with btrfs,=0A=
> > create a folder and set its compression property,=0A=
> > populate the folder,=0A=
> > make a loop that:=0A=
> > -rename a file,=0A=
> > -unlink the renamed file,=0A=
> > -create a new file.=0A=
> > =0A=
> > [1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1193549=0A=
> > [2] https://github.com/bdamascen0/s3e=0A=
> > =0A=
> > ___Test results=0A=
> > These tests were done on a virtual machine (kvm) with Ubuntu Jammy Jell=
yfish.=0A=
> > The kernel is 5.15.0.23 that relates to the 5.15.27 upstream kernel.=0A=
> =0A=
> Please repeat this with a vanilla kernel, Ubuntu's kernel are heavily=0A=
> patched and one of their patches might be causing your problem.=0A=
=0A=
Done. Same higher inode-evictions and slow results.=0A=
Also tested on a 5.15.0-rc1 kernel and, again, same results.=0A=
Older and newer 5.14 kernels produced normal results so it really seems tha=
t the regression was introduced early in the 5.15 cycle.=0A=
=0A=
> > Main results (x86_64):=0A=
> > 250 files - zstd:         17521 ms @inode_evictions: 31375=0A=
> > 250 files - lzo:          17114 ms @inode_evictions: 31375=0A=
> > 250 files - uncompressed:  1138 ms @inode_evictions: 499=0A=
> > =0A=
> > Load test results (x86_64):=0A=
> > 1000 files - 51.6 x more inode evictions - 18.1 x more time=0A=
> > 250  files - 62.9 x more inode evictions - 15.2 x more time=0A=
> > 100  files - 25.4 x more inode evictions -  3.7 x more time=0A=
> > 50   files - 12.8 x more inode evictions -  2.0 x more time=0A=
> > 10   files -  2.8 x more inode evictions -  1.3 x more time=0A=
> =0A=
> I'm missing something: more inode evictions when compared to what? A=0A=
> 5.14 vanilla kernel?=0A=
=0A=
Not clear at all. Sorry.=0A=
Will repost with my full set of results [2] including a vanilla kernel, the=
 15.0-rc1, more distros and a better load test report.=0A=
=0A=
> > CPU usage results (x86_64):=0A=
> > 1000 files - zstd:           137841 ms=0A=
> > real    2m17,881s=0A=
> > user    0m1,704s=0A=
> > sys     2m11,937s=0A=
> > 1000 files - lzo:            135456 ms=0A=
> > real    2m15,478s=0A=
> > user    0m1,805s=0A=
> > sys	2m9,758s=0A=
> > 1000 files - uncompressed:     7496 ms=0A=
> > real    0m7,517s=0A=
> > user    0m1,386s=0A=
> > sys     0m4,899s=0A=
> > =0A=
> > I'm sending this message to the linux-fsdevel mailing list first.=0A=
> > Please tell if you think this subject would be of interest of another k=
ernel subsystem.=0A=
> > PS: I'm not subscribed to this list.=0A=
> =0A=
> We need to get Btrfs people into the boat, but please clarify first if=0A=
> this really is a regression with the upstream kernel.=0A=
=0A=
Sure. The Btrfs crew belong on this boat.=0A=
The Btrfs developer Filipe Manana assisted me on the original bug report [1=
].=0A=
He concluded that the btrfs compression property just happens to trigger so=
mething outside the btrfs code and was guessing it could be at the vfs or m=
m subsystems.=0A=
The bug was also the beginning of a long term work to make the filesystem m=
ore robust but the improvements would not be elegible for the 5.15 version =
due to backport restrictions.=0A=
=0A=
> Ciao, Thorsten=0A=
=0A=
Grazie, Bruno=
