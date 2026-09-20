Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808233A014
	for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912510; cv=none; b=TK6fYDZiw6eZKrIh2dKvqHX17Cu2IjEVgNMgfXdAZT2Yg35lxiACX0O26DSVPClKqj3Jv5NLN2weYdl6jL6R4GM32gXYWVPZRKZIyMQwNzjuzt6M4yagvC3h/oappzSDRrnhQqcWLVn3kqkwDWiJq73kLF1dFtldOuioBfkPQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912510; c=relaxed/simple;
	bh=3BGKPjEXlHJ/7EQvEX2Y+2jm8uh1xcJQttD0VeU5MmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCmDZFbwtMTu63yN20dZ/Owrwm6xW3nxLdjIdbKQr40+CHESN5F9lG/7APvdsSHX/rYcl++TJet6m6PvMt9kXGpX5wrxtr5kG1jgsz+AAZBWDxYv6zpdPmdbAzTG2s0mYbiG1EcTuxmVpdoNVQj/m8LjdUA584387ik97JVNHGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.de; spf=pass smtp.mailfrom=online.de; dkim=pass (2048-bit key) header.d=online.de header.i=cito@online.de header.b=EXAoiUGB; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=online.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=online.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=online.de header.i=cito@online.de header.b="EXAoiUGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
	s=s42582890; t=1789912500; x=1790517300; i=cito@online.de;
	bh=AqcM6OH+H51Vyn6T0c3uTYZxt3s2a8bLr9yFqcooSIQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EXAoiUGBoI8GnVcOc3B4B/Bx0VJIRgoDa8S+rj8u9002GuEUeQZO7YFixGvRJUm4
	 UBi5iEbkgXMZFhGlf2RgKO0Q5g2Kp5DObGcMUv2iI2z20vXLF8uWR4oUk1Xu2ySIT
	 7B3ZeZr9yBeV8KlEW8yirGxwhvL7ba8SXba4BQNpnNcdMLRJDzkoU68+cVHXpQyWG
	 VBzPti4MNNp68PiMdc7g1bT0DuQ/m6/eTgwM2fL/Qb8iSbkaQJ4nKnZDKqueAkoVH
	 4USaFi+3LL1zfn6AQBkYW4aAPU87lAJiPk6kZInqZVl5TWlcEb0lZd062hyaQTpX0
	 lFZQMPhsGTNTR2eluw==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MzQXu-1wutrL43iy-011wXF; Sun, 20
 Sep 2026 15:49:12 +0200
Message-ID: <0fd8c1c9-7f56-4bcb-a727-e4386d8ef094@online.de>
Date: Sun, 20 Sep 2026 15:49:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] btusb: ASUS USB-BT540/BT600 IDs backported without,
 RTL8761CUV support, adapter re-enumerates endlessly (6.18.50, 6.12.109,,
 6.1.188, 5.15.221, 5.10.270)
To: "ra.prism" <ra.prism@gmail.com>, stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Max Chou <max.chou@realtek.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org,
 regressions@lists.linux.dev
References: <9ac1c05b-e9f2-49e9-af63-9cd0e42115fc@gmail.com>
Content-Language: en-US
From: Christoph Zwerschke <cito@online.de>
In-Reply-To: <9ac1c05b-e9f2-49e9-af63-9cd0e42115fc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R4csNoRzKW9O02+9m23soDiC297hXinYTrzF6Hr+dk6LHcjBHuk
 16MIukKmvtXrMSzcypbpCkivxPrPeikAINpBXKJhjemq9n5KqQm7d2NzDDVgi57eQQxFQec
 fsUMVaybmqUU23PymazWoXfilIqQoHseAcKNaU/6aATlwcHKkXxnIOSR5tfrE3FneViz6rs
 BqkkSOJFTz8QZQJmX2D3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2+YaVqYJ8Dk=;SrqdPhQJKifNkmOV+FVtbq7ooyB
 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
 YkaNnfPaNgl3UW

Hi Ralf, hi all,

I submitted the two commits. Your analysis is correct - please revert
them from every tree below 6.19.

The commit message was also wrong where it called the adapters
"non-functional" without the entry. They bind via the generic
Bluetooth class and run their ROM firmware. I had tested that on a
machine that was also running ASUS' out-of-tree rtk_btusb, and
credited the working adapter to my patch.

Measured 2026-09-20 on 6.18.50 with the two IDs removed from a local
btusb build: BT540 (0b05:1bef) and BT600 (0b05:1d70) both come up
with real BD addresses, no USB disconnects, and carry ASHA and A2DP.

My recommendation is the revert rather than fixing it by backporting the=
=20
RTL8761CU support that btrtl gained in 6.19 (4a23ce935f74). I tried the=20
backport against 6.18.50 and measured it, but it is hardware enablement=20
rather than a regression fix, and it doesn't seem to gain anything=20
substantial: against the ROM firmware these adapters already run, I=20
could measure no difference in audio quality. The revert is smaller,=20
needs no stable-policy argument, and simply restores the behavior these=20
adapters had for years.

Sorry for the breakage, and thanks for the report.

Christoph


On 14.09.26 13:44, ra.prism wrote:
> Hi,
>=20
> two btusb device-ID commits were backported to stable branches that lack
> the btrtl support they depend on:
>=20
>  =C2=A0 980084de4d9b ("Bluetooth: btusb: Add ASUS USB-BT540 for Realtek =
8761CU")
>  =C2=A0 6f0624b4427e ("Bluetooth: btusb: Add ASUS USB-BT600 for Realtek =
8761CU")
>=20
> Both set BTUSB_REALTEK for 0b05:1bef / 0b05:1d70, so the adapters now go
> through btrtl setup. btrtl only learned about this chip in v6.19-rc1:
>=20
>  =C2=A0 4a23ce935f74 ("Bluetooth: btrtl: Add the support for RTL8761CUV"=
)
>=20
> Without it, setup fails and the adapter resets in a loop. Before the
> backport the adapter bound via the generic Bluetooth class and did not
> loop.
>=20
> Affected, checked against the stable trees (btusb.c has 0x0b05/0x1bef,
> btrtl.c has no rtl8761cu entry):
>=20
>  =C2=A0 released=C2=A0 6.18.50 (aa7b93fe98ba, bce588b4ca08), still in 6.=
18.51
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.12.109 (f05baf6e0680, 32412=
aff8d11)
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.1.188, 5.15.221, 5.10.270
>  =C2=A0 queued=C2=A0 =C2=A0 queue-6.6
>=20
> Not affected: 7.1.y (has 4a23ce935f74 but not the IDs) and 7.2.y (has
> both).
>=20
> Observed with an ASUS USB-BT540 (0b05:1bef, hci_rev 000e, lmp_subver
> 8761) on 6.18.50: 203 re-enumerations in 37 minutes, one every ~10.8 s,
> independent of the USB port:
>=20
>  =C2=A0 [=C2=A0 =C2=A0 8.008281] Bluetooth: hci0: RTL: examining hci_ver=
=3D0d=20
> hci_rev=3D000e lmp_ver=3D0d lmp_subver=3D8761
>  =C2=A0 [=C2=A0 =C2=A0 8.008294] usb 5-2: USB disconnect, device number =
3
>  =C2=A0 [=C2=A0 =C2=A018.476022] Bluetooth: hci0: RTL: RTL: Read reg16 f=
ailed (-110)
>  =C2=A0 [=C2=A0 =C2=A018.852034] usb 5-2: New USB device found, idVendor=
=3D0b05,=20
> idProduct=3D1bef, bcdDevice=3D 2.00
>  =C2=A0 [=C2=A0 =C2=A018.875711] Bluetooth: hci0: RTL: examining hci_ver=
=3D0d=20
> hci_rev=3D000e lmp_ver=3D0d lmp_subver=3D8761
>  =C2=A0 [=C2=A0 =C2=A018.886986] usb 5-2: USB disconnect, device number =
4
>  =C2=A0 [=C2=A0 =C2=A029.228274] Bluetooth: hci0: RTL: RTL: Read reg16 f=
ailed (-110)
>=20
> Same machine and adapter on 7.2.5, which has both commits, works:
>=20
>  =C2=A0 [=C2=A0 =C2=A0 7.816015] Bluetooth: hci0: RTL: examining hci_ver=
=3D0d=20
> hci_rev=3D000e lmp_ver=3D0d lmp_subver=3D8761
>  =C2=A0 [=C2=A0 =C2=A0 7.820005] Bluetooth: hci0: RTL: rom_version statu=
s=3D0 version=3D1
>  =C2=A0 [=C2=A0 =C2=A0 7.825030] Bluetooth: hci0: RTL: loading rtl_bt/rt=
l8761cu_fw.bin
>  =C2=A0 [=C2=A0 =C2=A0 7.826003] Bluetooth: hci0: RTL: loading rtl_bt/rt=
l8761cu_config.bin
>  =C2=A0 [=C2=A0 =C2=A0 7.840001] Bluetooth: hci0: RTL: fw version 0x7bf1=
5762
>=20
> 6.18.48 (without the IDs) did not loop. The kernels were distribution
> builds (CachyOS linux-cachyos-lts 6.18.50, linux-cachyos 7.2.5). I
> checked the relevant btusb/btrtl lines against the vanilla stable trees
> listed above. I only have the BT540 and only tested 6.18.y; the BT600 an=
d
> the other branches are untested but in the same situation.
>=20
> Could you please:
>=20
>  =C2=A0 - drop both patches from queue-6.6, and
>  =C2=A0 - revert them in 6.18.y, 6.12.y, 6.1.y, 5.15.y and 5.10.y, or ba=
ckport
>  =C2=A0 =C2=A0 4a23ce935f74 (btrtl.c, +15/-1) where it applies. I have n=
ot checked
>  =C2=A0 =C2=A0 whether it applies cleanly to any of these trees.
>=20
> Thanks,
> Ralf Ahlbrink
>=20
> #regzbot introduced: v6.18.49..v6.18.50
>=20
> #regzbot title: btusb: ASUS USB-BT540/BT600 IDs in stable without=20
> RTL8761CUV btrtl support cause endless re-enumeration


