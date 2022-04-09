Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2093.outbound.protection.outlook.com [40.92.20.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A8A31
	for <regressions@lists.linux.dev>; Sat,  9 Apr 2022 17:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8JKf06e8+8fnet8wND200HW9PWkCtatftKI0ABRL1W0fH5uYhI9qIb/2DBhjvkeUGIc+mtTOWuu5bwUeEKtwXFmJ4j5ooBPGTK8/+OLmW4t7uXdNUzBkB6eC6BvrpmdYyyGiboT+BWWt15BEFqRQJg1eFTQuzVSfDe8m0XpGXLUW97ms8W9HHILkWT0aTtyJ8bM5Yg6leM34JqE+gLGrsIrJE2FK1AoTNn6c+iW8NKhpJfkfAdgN+sZXr7MSA+02ZFM7Dqj91jAd+CRA+WU4EBOBjGopTiy9vFU3T0hZmk22OD1DnETOGZim6zH4ezU29/sOFDFnJYW3bOLNdGpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpifeW5r9zbz8JgoulrxFPQ2isuBhAwQzcp/zrqDgiw=;
 b=M3eTXytOzIkH041GmXikv4XN2VFnNNJyieCe6EkBmR0ATIVK5jbmNxe444t6YmmclktGB9FQORlmI3q1324ve9nh2gOsw0jOK26bfea/kmg7opzkMNBp438KlB6dYmfqCiEVdJAs4AR/TwM8ElIIYsJMKAL7FBO0Ko9qAv7dXB5eGBcXooL4+nDP9lnZrp/bAai8TDKmmQPLB49lCgZppSVhReaCAlWCFtYP2JyVQcvahmWJovQVdFahWaTqfC9k9YxLQ+8XJe0beGuV9sHwADaNSUFp/mq89SNatJEnHkvuJAYT9pmrGeCg2XuoeIrqLTdDA9V4RLPSOoFfu58MUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MN2PR20MB2512.namprd20.prod.outlook.com (2603:10b6:208:130::24)
 by SA0PR20MB3549.namprd20.prod.outlook.com (2603:10b6:806:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sat, 9 Apr
 2022 17:07:38 +0000
Received: from MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::356d:2f6:6491:1391]) by MN2PR20MB2512.namprd20.prod.outlook.com
 ([fe80::356d:2f6:6491:1391%4]) with mapi id 15.20.5144.028; Sat, 9 Apr 2022
 17:07:38 +0000
From: Bruno Damasceno Freire <bdamasceno@hotmail.com.br>
To: Filipe Manana <fdmanana@kernel.org>, "dsterba@suse.cz" <dsterba@suse.cz>,
	Thorsten Leemhuis <regressions@leemhuis.info>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-btrfs
	<linux-btrfs@vger.kernel.org>, "fdmanana@suse.com" <fdmanana@suse.com>
Subject: Re: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Topic: [regression] 5.15 kernel triggering 100x more inode evictions
Thread-Index:
 AQHYPN5CzLbpGwv62Eyf/QOJSNQRSqzOeNCAgAWocgOAAJL+gIAKXisIgAbbsgCAAEinAIAAEbGAgAGd7MU=
Date: Sat, 9 Apr 2022 17:07:38 +0000
Message-ID:
 <MN2PR20MB2512BB0751A02690F01FA723D2E89@MN2PR20MB2512.namprd20.prod.outlook.com>
References:
 <MN2PR20MB2512314446801B92562E26B5D2169@MN2PR20MB2512.namprd20.prod.outlook.com>
 <07bb78be-1d58-7d88-288b-6516790f3b5d@leemhuis.info>
 <MN2PR20MB251203B4B5445B4B0C4148C9D21D9@MN2PR20MB2512.namprd20.prod.outlook.com>
 <35b62998-e386-2032-5a7a-07e3413b3bc1@leemhuis.info>
 <MN2PR20MB251205164078C367C3FC4166D2E59@MN2PR20MB2512.namprd20.prod.outlook.com>
 <9163b8a9-e852-5786-24fa-d324e3118890@leemhuis.info>
 <20220408145222.GR15609@twin.jikos.cz> <YlBa/Rc0lvJCm5Rr@debian9.Home>
In-Reply-To: <YlBa/Rc0lvJCm5Rr@debian9.Home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: fa1d31cf-08b4-1fe4-e649-6c01993bdb62
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [t0VM7b9j11YBv+oHjZ3ETuMxk9a9LeXJ]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d1e8c3c-27da-4981-5293-08da1a4b731a
x-ms-traffictypediagnostic: SA0PR20MB3549:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LDgIt3BtAGFtUrgYuhdlqbd0kHyF9f1+WjcsVWlGOj1hJwupTzYx4gKdpCgjIxM80atxgizoSessyoyrOWglEWbJEG4oB5lzvDde+GJwRgoSD4WfE+mqkwqdSlrgrSgRUS6xzaJRbH30nf2eYMeXLo/3Wj992mkf064BxGM7zDAOr6Q7YBTzFBNoN1f4+do0jjF/UiUilOkYNc3bDnlbiKXOseN2OTnstEwNfungpRSEBrFMwGJ9JGkLujkL/fmC5yxi8N4dX6Hqa+jr5y8QqKS1bMl7wlsgyek4MltiEzixFrvcrePTFDVY/AXZPi7msnAzsvr9q/4CgLQpvD335ZHzjuI8mOSjbbxy96mzKyARnvDVMuncABLwyiDwamPSNjeRMst4sqjGTXLiD/2j8FL8ZqD1d2NmGjxVtRorIoOjE6ESpB65nHEDP12Puf2xb4WhYhf+9GlG3TbdC+ZLMlpUHiR4Tvljhc4e2zvGioeDgvdDYnfKLcbUQmTwmPcnXBT/pr6/1+G+M7oo9OHlm62YbCQC07KUXE9xTTmzpusrqjuETB7zbwgysvxpcFhf5S8Xtp8rTdZqXYAH95WwnYdjM4SGd92R/KcsqZFHeIG9D2MYn3Y7cDTDgqlM8gT8
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6sbogXjZiIhuHC3O+RXhDQd8meRglm8kutUB8WMKiFZdbXDi1M+SG9JqGS?=
 =?iso-8859-1?Q?eMihNF4vp5f3FaqjViHngs51bZios2NLSsuPvEwV8kUj/HaOdI7UxDj4/i?=
 =?iso-8859-1?Q?gmV9Se8XPIzJx4oADAc6hHxnZRCTrZbkKgGb9kuAUkKFy3vGrrVcc1UXgH?=
 =?iso-8859-1?Q?GkyUxuuhIMwoI0Uy1VfCaTTyM2xMbQHIimNbTGfIk08s5oliBxDjx9l4MD?=
 =?iso-8859-1?Q?t+mayZYnIIdrotYtz8CB9D7hqT6DLKigdWjdfLy7gdtcV+f+DqpVvRFnP9?=
 =?iso-8859-1?Q?xnTNkyoS4C/ls2tneIWktJNQqEPhWle0lSG21KQhAlfuDYE+vQcXTM5Qkb?=
 =?iso-8859-1?Q?SPh3g+3XnipPJWX8vuueMnoNvKYdnRW878aTFI5u93DmN7sP97QLW2VwnI?=
 =?iso-8859-1?Q?KiCkPyrZpPT4BGGMtAPU+yfRJRcfbH/rA+kr2vvOt1/OFmGkJXPrzzXJwA?=
 =?iso-8859-1?Q?Omey+YS9THPu7efSRiBNveBu9ibIcsqkRppg2oUOuVhrLLKumzy38Jtmcs?=
 =?iso-8859-1?Q?wPeBRliMwpThi2m39lWt6dtCR5kB+nKs6VCRNP6QVZiSIkSXSsfvvlV0lH?=
 =?iso-8859-1?Q?72oAAOSfEVV86+9MtEY/PpcMsIztbu5HJiaCkj9h1tn5aXzp6Hm10xwCzl?=
 =?iso-8859-1?Q?sQvTuL2IuWR99oV+wtiOzEpWBnxGaADxlo7ZZLkllgI1H8gBz19UbVPx8H?=
 =?iso-8859-1?Q?HS4G+qxlOXBUwLEp0uYF978SRgQNWHq6HB25BWvYIFn/O8gBU7FaPkSSE5?=
 =?iso-8859-1?Q?zomONMoU5JKtxx9cSeZRWP6QtDgJiG4p7iJwUC6WX8FNFflqDycEtAvpgK?=
 =?iso-8859-1?Q?jQc0+4+uUUWK1RnDmi1eY5mQuIy/Ei2m4/jGLq6NGnmSyntuMkB5rbV3+g?=
 =?iso-8859-1?Q?tEDz99vbSmtehu+h66mg5UYfWPQ+MnD6fHYhMvazKZfdtnrywY++F3aM7h?=
 =?iso-8859-1?Q?os6EUdL5W5xQElMxYvnRIb+xyLNfwa2/3dK6rC92TYBOy+GuCc1lXaCKyR?=
 =?iso-8859-1?Q?0D2VJ/rzHvjWPeJVJEfqukyQD8zlCkGbYmoEZXSXrDBaIigVcahbAH+iNZ?=
 =?iso-8859-1?Q?a55+3guLfyO8qQdXCKllVN0XbRXAkFih0y+1UOxzg95cFM6rgfD4iXBCUK?=
 =?iso-8859-1?Q?DhvEC/uVmuX8KQkONHYyhBZ2+E8YWfYhmcSRrBmJcr0Dsb+3wBTjUcafhq?=
 =?iso-8859-1?Q?vqI2Omn6DDz4WMOQ553RVnr1YlH/Lg3bRx3dPkgMBbzfKcsa0BIKy8jHlE?=
 =?iso-8859-1?Q?tl9a/Yab4ZS3krfh+PuFDOZTqonr/kh/MzTEM/0kAe+U0VAc1Ky0HZjMYM?=
 =?iso-8859-1?Q?i8RvIxI9gfu1wcDNk4gqqBOkeiGLx/bNwaZRtc5SvdqRoygiIXlyivqjbP?=
 =?iso-8859-1?Q?x9LKgBgvogaNyt3a6s4t/WTbUpfVfqiDLSYfClAeKDOsGi41k9M2a2mXc7?=
 =?iso-8859-1?Q?Vwo3uAnMhHa8Xvj0+9vQpdyTUlGGWyyMs8EWOw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1e8c3c-27da-4981-5293-08da1a4b731a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2022 17:07:38.1383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR20MB3549

On 08.04.22 17:55, Filipe Manana wrote:=0A=
> On Fri, Apr 08, 2022 at 04:52:22PM +0200, David Sterba wrote:=0A=
> > On Fri, Apr 08, 2022 at 12:32:20PM +0200, Thorsten Leemhuis wrote:=0A=
> > > Hi, this is your Linux kernel regression tracker. Top-posting for onc=
e,=0A=
> > > to make this easily accessible to everyone.=0A=
> > >=0A=
> > > Btrfs maintainers, what's up here? Yes, this regression report was a =
bit=0A=
> > > confusing in the beginning, but Bruno worked on it. And apparently it=
's=0A=
> > > already fixed in 5.16, but still in 5.15. Is this caused by a change=
=0A=
> > > that is to big to backport or something?=0A=
> >=0A=
> > I haven't identified possible fixes in 5.16 so I can't tell how much=0A=
> > backport efforts it could be. As the report is related to performance o=
n=0A=
> > package updates, my best guess is that the patches fixing it are those=
=0A=
> > from Filipe related to fsync/logging, and there are several of such=0A=
> > improvements in 5.16. Or something else that fixes it indirectly.=0A=
> =0A=
> So there's a lot of confusion in the thread, and the original openSUSE=0A=
> bugzilla [1] is also a bit confusing and large to follow.=0A=
=0A=
Sorry for the confusion.=0A=
It was not my intention.=0A=
=0A=
> Let me try to make it clear:=0A=
> =0A=
> [...]=0A=
> =0A=
> 4) What can be done, and was done in a recent patchset [2] (5.18-rc1), wa=
s=0A=
>    to make the behaviour on rename to not be so pessimistic, and instead=
=0A=
>    accurately determine if an inode was logged before or not, even if it =
was=0A=
>    recently evicted, and then skip log updates.=0A=
> =0A=
>    The test scripts in the change logs of the patches of that patchset,=
=0A=
>    essentially mimic what was happening with the zypper package=0A=
>    installations/updates. Bruno's test script basically copies/integrates=
=0A=
>    those test scripts;=0A=
=0A=
I'm not sure if I understood why you are bringing out this last comparison.=
=0A=
Your test scripts don't trigger the regression, which is fine since they we=
re=0A=
not made with this objective.=0A=
=0A=
If you look at my research (https://github.com/bdamascen0/s3e) you'll see=
=0A=
that I clearly named you and your patches as my references.=0A=
=0A=
Anyway, thank you for having published them.=0A=
=0A=
> [...]=0A=
> =0A=
> This thread is also basically a revamp of an older thread [3].=0A=
>=0A=
> [1] https://bugzilla.opensuse.org/show_bug.cgi?id=3D1193549=0A=
> [2] https://lore.kernel.org/linux-btrfs/cover.1642676248.git.fdmanana@sus=
e.com/=0A=
> [3] https://lore.kernel.org/linux-fsdevel/MN2PR20MB251235DDB741CD46A9DD5F=
AAD24E9@MN2PR20MB2512.namprd20.prod.outlook.com/=0A=
=0A=
Yes, it is a revamp for a reason:=0A=
- The older thread was 100% based on opensuse, rpm, tumbleweed kernels and=
=0A=
  tumbleweed rpm packages which is a hard selling point to attract any=0A=
  contribution.=0A=
- OTOH, this thread has a simple script that anyone can run on any=0A=
  distribution to reproduce the regression and further research it.=0A=
=0A=
In my book, this is progress, even if its a tiny one.=0A=
=0A=
Regards, Bruno.=
