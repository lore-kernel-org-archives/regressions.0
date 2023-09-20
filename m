Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3D111AB
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 08:32:28 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38K8WIZ00869755, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38K8WIZ00869755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Sep 2023 16:32:18 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 20 Sep 2023 16:32:18 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 20 Sep 2023 16:32:17 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Wed, 20 Sep 2023 16:32:17 +0800
From: Ricky WU <ricky_wu@realtek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Linux regressions mailing list <regressions@lists.linux.dev>,
        "Paul
 Grandperrin" <paul.grandperrin@gmail.com>,
        "stable@vger.kernel.org"
	<stable@vger.kernel.org>,
        Wei_wang <wei_wang@realsil.com.cn>,
        Roger Tseng
	<rogerable@realtek.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: RE: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from drivers/misc/cardreader breaks NVME power state, preventing system boot
Thread-Topic: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
Thread-Index: AQHZ5XTPQHzxhN3m602gmLzU6tUtJLAYNE4TgAk8SwD//83wgIACG3Pg//9+6YCAAIkp0A==
Date: Wed, 20 Sep 2023 08:32:17 +0000
Message-ID: <3ddcf5fae0164fbda79081650da79600@realtek.com>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
 <82469f2f-59e4-49d5-823d-344589cbb119@leemhuis.info>
 <2023091333-fiftieth-trustless-d69d@gregkh>
 <7991b5bd7fb5469c971a2984194e815f@realtek.com>
 <2023091921-unscented-renegade-6495@gregkh>
 <995632624f0e4d26b73fb934a8eeaebc@realtek.com>
 <2023092041-shopper-prozac-0640@gregkh>
In-Reply-To: <2023092041-shopper-prozac-0640@gregkh>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.81.100]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

> On Wed, Sep 20, 2023 at 07:30:00AM +0000, Ricky WU wrote:
> > Hi Greg k-h,
> >
> > This patch is our solution for this issue...
> > And now how can I push this?
>=20
> Submit it properly like any other patch, what is preventing that from
> happening?
>=20

(commit 8ee39ec) some reader no longer force #CLKREQ to low when system nee=
d to enter ASPM.
But some platform maybe not implement complete ASPM? I don't know..... it c=
auses problems...

Like in the past Only the platform support L1ss we release the #CLKREQ.
But new patch we move the judgment (L1ss) to probe, because we met some hos=
t will clean the config space from S3 or some power saving mode=20
And also we think just to read config space one time when the driver start =
is enough =20

> thanks,
>=20
> greg k-h
