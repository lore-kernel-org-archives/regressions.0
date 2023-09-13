Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97D803
	for <regressions@lists.linux.dev>; Wed, 13 Sep 2023 03:14:33 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38D3AEMp83444902, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38D3AEMp83444902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Sep 2023 11:10:14 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 13 Sep 2023 11:10:15 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 13 Sep 2023 11:10:14 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Wed, 13 Sep 2023 11:10:14 +0800
From: Ricky WU <ricky_wu@realtek.com>
To: Paul Grandperrin <paul.grandperrin@gmail.com>,
        "stable@vger.kernel.org"
	<stable@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        Wei_wang
	<wei_wang@realsil.com.cn>,
        Roger Tseng <rogerable@realtek.com>
Subject: RE: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from drivers/misc/cardreader breaks NVME power state, preventing system boot
Thread-Topic: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
Thread-Index: AQHZ5XTPQHzxhN3m602gmLzU6tUtJLAYEMCA
Date: Wed, 13 Sep 2023 03:10:14 +0000
Message-ID: <c7bdd821686e496eb31e4298050dfb72@realtek.com>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
In-Reply-To: <5DHV0S.D0F751ZF65JA1@gmail.com>
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

Hi Paul,

We have notice this issue....
https://lore.kernel.org/lkml/fa82d9dcbe83403abc644c20922b47f9@realtek.com/t=
/#m90373a16017f07ca32f43d6b4327164fb31bf9bb
main reason is:
"it is a system power saving issue....
In the past if the BIOS(config space) not set L1-substate our driver will k=
eep drive low CLKREQ# when HOST want to enter power saving state that make =
whole system not enter the power saving state.
But this patch we release the CLKREQ# to HOST, make whole system can enter =
power saving state success when the HOST want to enter the power saving sta=
te, but I don't  know why this system can not wake out success from power s=
aving state"

This is a PCIE CLKREQ# design problem on those platform, the pcie spec allo=
w device release the CLKREQ# to HOST, this patch only do this....

We are thinking about how to compatible with these potentially problematic =
platforms

Ricky
> -----Original Message-----
> From: Paul Grandperrin <paul.grandperrin@gmail.com>
> Sent: Tuesday, September 12, 2023 8:29 PM
> To: stable@vger.kernel.org
> Cc: regressions@lists.linux.dev; Wei_wang <wei_wang@realsil.com.cn>; Roge=
r
> Tseng <rogerable@realtek.com>; Ricky WU <ricky_wu@realtek.com>
> Subject: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
> drivers/misc/cardreader breaks NVME power state, preventing system boot
>=20
>=20
> External mail.
>=20
>=20
>=20
> Hi kernel maintainers!
>=20
> My computer doesn't boot with kernels newer than 6.1.45.
>=20
> Here's what happens:
> - system boots in initramfs
> - detects my encrypted ZFS pool and asks for password
> - mount system, pivots to it, starts real init
> - before any daemon had time to start, the system hangs and the kernel
> writes on the console
> "nvme 0000:04:00.0: Unable to change power state from D3cold to D0,
> device inaccessible"
> - if I reboot directly without powering off (using magic sysrq or
> panic=3D10), even the UEFI complains about not finding any storage to
> boot from.
> - after a real power off, I can boot using a kernel <=3D 6.1.45.
>=20
> The bug has been discussed here:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217705
>=20
> My laptop is a Dell XPS 15 9560 (Intel 7700hq).
>=20
> I bisected between 6.1.45 and 6.1.46 and found this commit
>=20
> commit 8ee39ec479147e29af704639f8e55fce246ed2d9
> Author: Ricky WU <ricky_wu@realtek.com>
> Date:   Tue Jul 25 09:10:54 2023 +0000
>=20
>     misc: rtsx: judge ASPM Mode to set PETXCFG Reg
>=20
>     commit 101bd907b4244a726980ee67f95ed9cafab6ff7a upstream.
>=20
>     ASPM Mode is ASPM_MODE_CFG need to judge the value of clkreq_0
>     to set HIGH or LOW, if the ASPM Mode is ASPM_MODE_REG
>     always set to HIGH during the initialization.
>=20
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Ricky Wu <ricky_wu@realtek.com>
>     Link:
> https://lore.kernel.org/r/52906c6836374c8cb068225954c5543a@realtek.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>=20
>  drivers/misc/cardreader/rts5227.c  |  2 +-
>  drivers/misc/cardreader/rts5228.c  | 18 ------------------
>  drivers/misc/cardreader/rts5249.c  |  3 +--
>  drivers/misc/cardreader/rts5260.c  | 18 ------------------
>  drivers/misc/cardreader/rts5261.c  | 18 ------------------
>  drivers/misc/cardreader/rtsx_pcr.c |  5 ++++-
>  6 files changed, 6 insertions(+), 58 deletions(-)
>=20
> If I build 6.1.51 with this commit reverted, my laptop works again,
> confirming that this commit is to blame.
>=20
> Also, blacklisting `rtsx_pci_sdmmc` and `rtsx_pci`, while preventing to
> use the sd card reading, allows to boot the system.
>=20
> I can't try 6.4 or 6.5 because my system is dependent on ZFS..
>=20
> Have a nice day,
> Paul Grandperrin
>=20

