Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0629C7C
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1654673458;
	bh=Xy7WrHqyx3f/eKlkHyF0ATDh6U5GP4/KbwcY3kyYpgo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gnDcEh51z6H5zLEf6Xmuh/bJkKHpH+W8tIKyWz8Ubl84y4qAJMKyn9mf4ZcLl02ej
	 i8LY9HFA2e/0QQoIyGDtQyOpEaFeC1vLlWp+15Ex6XQWou9cj6l6hboz2R3uXHpGjY
	 8ONfY8nGrgAWQt36Th6ZHbQWVKz8X+drir9fg+wo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.85] ([95.118.91.155]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYcpt-1oCoef3IY7-00VVth; Wed, 08
 Jun 2022 09:30:58 +0200
Message-ID: <60f4d5b4-804d-dfb3-5810-bacf1e3401cb@web.de>
Date: Wed, 8 Jun 2022 09:30:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [REGRESSION] r8169: RTL8168h "transmit queue 0 timed out" after
 ASPM L1 enablement
Content-Language: en-US
To: Bernhard Hampel-Waffenthal <bernhard.hampelw@posteo.at>
Cc: nic_swsd@realtek.com, netdev@vger.kernel.org,
 regressions@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
References: <9ebb43ee-52a1-c77d-d609-ca447a32f3e6@posteo.at>
From: Heiner Kallweit <heiner.kallweit@web.de>
In-Reply-To: <9ebb43ee-52a1-c77d-d609-ca447a32f3e6@posteo.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G4dUPJEjI11U3TmuidCr6irm8sdcp7M7qbk2mipTXfuvh3SsyJz
 dhBeeUPy6mc3BNsNkgklSMQJEQH6hYffC5fFMyNOy+XwpDb1ZFK/x3zlZH16pT9OI0RdXKh
 AY2eJ4Dicex+RIDjYz3UwbrUXaB4nldQnd47qfHxgpznu9413AI5DkQ0Ntmbk704nZBdgqY
 hnE9BymHTqNMo9VmF92pA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JLX6omiErK4=:pAHaFMk2mWlKRSrdQAwJX8
 cT+Ag4YCdsJHJc7tYnEwbYaAVtdYHhUMyA8yd3o0CCIIx3FwNI1Qs3fJwiEyIojc0fRXNXpZi
 z3fri8ZHHmfnKvTcSN4ubfbRkKlzENtq1HRu9ETN9YDAVtmKNsvSHYObd62ri64W5mlpq99dI
 ugRA7NbAWwtIaQ6wKEYc1N2ovpEQgdZCOXF05VhJOVyOjJ4mGNn2H0z3KAJ0xrsSr2tI9eld+
 z4Ogu1cEl0UctflON6zgFYa6rDjfk8E/scuSE5/9JCSGFdXHu3n7xSrLhQDK/7h4zkYxKVfkx
 4FTV2YnnF9lVuU/8m/v8mKNkmRHPaOx6kSJ89W26g0SD8OYa9K2lSFUMXWSjdgac8kGUKECvm
 Aerd9xxLrRAVFFkUKsEKPPVOlOjlvZHxttfLwl6C59dYtr1zncNYyMExHW1gw2gKXC0kS7SSV
 I+z3979ULVj9uOPQygOd9vlQ2RjHNAJ9F0u61/Y2qsKTREeeX4m2NeZG6pwbUg2ims1mHxX/0
 aTZVs1F5pYYGGBPnnCVQ4e2u/px3LA2pCGRKcNPeBZyEpyANeA7jDYbDKVBl+Ioy8R58+bB2c
 LcFMGyhmn0c8Zj0UMknl6FXyjA5G+Z+XYWOW0arwQCdmKUrJV6BdTEa0LPFJXWF81PSCnkG9l
 v+PO6kbesk56NUdO32xhIYvkim/3qX3Eou6yHp3b6QKpl2pdUuZpHVc0lNjb6DpClZ731I1b2
 x1QfVVbhiXpYDBy+C1bVAmImNYebc/ST5vAp8dx96npKSIs8qj75NYaz2KMT+NZyAkYr87GoI
 8hf7dLsNWKpfoXEB+lZg8Z5Biyq1LLqY3ank7OCsoXk3u8IY0aQtglXoivh+5P9xoe7szW74F
 6sV57eJ+tCHQBdDaHqGuaCIxXLBrWjWlekEYiDOcX32reP9mbIxrhKDRO6vu50oiOWZQRIhOn
 nR9u6A1R8gn7d4TY0BPoC6kkER2bIvlW65Ko37/KVnUET329/l26GK18Nw2gfUjHBwx55FQPR
 D0Wb7kxFYU6PZoEwf3Mcq5NuADOcR2AzVcAx6GbKcXH+TIIOWM6efjmL6jJIMmE7ucnivmvD9
 QYvM9BhG7wyV2YZu6KnTnFGd0mXJfLCxkp9V60+lWfd8k+zhvnBhItTfA==

On 08.06.2022 02:44, Bernhard Hampel-Waffenthal wrote:
> #regzbot introduced: 4b5f82f6aaef3fa95cce52deb8510f55ddda6a71
>
> Hi,
>
> since the last major kernel version upgrade to 5.18 on Arch Linux I'm un=
able to get a usable ethernet connection on my desktop PC.
>
> I can see a timeout in the logs
>
> > kernel: NETDEV WATCHDOG: enp37s0 (r8169): transmit queue 0 timed out
>
> and regular very likely related errors after
>
> > kernel: r8169 0000:25:00.0 enp37s0: rtl_rxtx_empty_cond =3D=3D 0 (loop=
: 42, delay: 100).
>
>
> The link does manage to go up at nominal full 1Gbps speed, but there is =
no usable connection to speak of and pings are very bursty and take multip=
le seconds.
>
> I was able to pinpoint that the problems were introduced in commit 4b5f8=
2f6aaef3fa95cce52deb8510f55ddda6a71 with the enablement of ASPM L1/L1.1 fo=
r ">=3D RTL_GIGA_MAC_VER_45", which my chip falls under. Adding pcie_aspm=
=3Doff the kernel command line or changing that check to ">=3D RTL_GIGA_MA=
C_VER_60" for testing purposes and recompiling the kernel fixes my problem=
s.
>
>
> I'm using a MSI B450I GAMING PLUS AC motherboard with a RTL8168h chip as=
 per dmesg:
>
> > r8169 0000:25:00.0 eth0: RTL8168h/8111h, 30:9c:23:de:97:a9, XID 541, I=
RQ 101
>
> lspci says:
>
> > 25:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RT=
L8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 1=
5)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: Micro-Star Interna=
tional Co., Ltd. [MSI] Device [1462:7a40]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O+ Mem+ BusMaster+=
 SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- Fast=
B2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 0, Cache Line Size: =
64 bytes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt: pin A routed to IR=
Q 30
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IOMMU group: 14
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: I/O ports at f000 [=
size=3D256]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 2: Memory at fcb04000 =
(64-bit, non-prefetchable) [size=3D4K]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 4: Memory at fcb00000 =
(64-bit, non-prefetchable) [size=3D16K]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: <access denied>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: r8169
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel modules: r8169
>
Thanks for the report. On my test systems RTL8168h works fine with ASPM L1=
 and L1.1, so it seems to be
a board-specific issue. Some reports in the past indicated that changing I=
OMMU settings may help,
you can also use the ASPM sysfs link attributes to disable selected ASPM s=
tates for just this link.

>
> If you need more info I'll do my best to provide what I can, hope that h=
elps already.
>
> Regards,
> Bernhard


