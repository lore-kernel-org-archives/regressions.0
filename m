Received: from mail5.mxpn1.infra.improvmx.com (mail5.mxpn1.infra.improvmx.com [131.153.154.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92B3148BF
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.153.154.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345079; cv=none; b=LJBFsFKo0Rj6wEx4BShOuYNW8Iodgq7G1ydZoSFsr5y2lN7TMp5dTE+w+p950V7CwHJSeXOO6yOGTNnIMZeR7Enn1qaOzTg5KiPV5HxRtlIBC+mWCiN4HKPv3F+7dVKzJd3M5JzcQtJaWg0vjI4NKlFBedMfF4sKctMhYH2S9XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345079; c=relaxed/simple;
	bh=GnfcAdvE9UZzYP6EkLD2qNKn2Mi1J1RaHP0mx0T/6XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmQ+Woid8ypuSBfLDo3FEUCrJU1Jgb+dzPISrFR31dGe5rbu7EfMN6OQXnJXLREsRNs1+ZAmViZgghfBXBBaEavs93aBjaDaiiSe6JlI+/o0vwqpKzMQiGiaZ8K67MHc5FWXGx5WL/HaDftnqK93cNLzwurZFjdP0jSGdSZWZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msbs.com; spf=pass smtp.mailfrom=msbs.com; dkim=pass (2048-bit key) header.d=msbs.com header.i=@msbs.com header.b=npPmiikH; arc=none smtp.client-ip=131.153.154.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msbs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msbs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=msbs.com header.i=@msbs.com header.b="npPmiikH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=msbs.com;
 i=@msbs.com; q=dns/txt; s=dkimprovmx2; t=1783344940; h=date : from :
 to : subject : content-type : feedback-id : message-id;
 bh=gOyY3jB+Y2NCzondxxMSYGagVbSGdU/7wCArocx8wpc=;
 b=npPmiikHJdmU4SFMNr8d2xr89Spso+0ECiOqIIvAJsi3FzDsvrxdq5cZyFZ+1diyi32Yr
 bvMcSc++qRRUXfG1kMElepqXpuE5akOpAtaSJ3uIREbRPQQsftIp9YDeD+XjzKLBwJy3zDF
 zvBmifZ5FSbsXyS9CVknxEAbiFYOoT+CuBLTwvFbNZ2UnkaXRctS6a/RgXqnwIsP2Swyg40
 414JSsReJbEAQx5gTOXWHdGGQGvLFJRvXQh7Ib33JxuOjP7G6hR/EppYzQ+rUlkzAN2eO4y
 TaV9DkGZawZH6Rvso6m0xbHJ1N23szTYd1FvgMxGxWhwx/nGX8Ub0H6JV1zg==
X-Sending-Service: ImprovMX v3.0.0
Feedback-ID: bXNicy5jb20=:send:ImprovMX
X-ImprovMX-Server-Id: b459662
X-ImprovMX-Session-Id:
 87d9bfb9-c189-4005-b9ce-6b5cbda4da9f
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
    by mx1.improvmx.com with ESMTPSA (version=TLSv1.3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256)
    for <regressions@lists.linux.dev>;
    Mon, 06 Jul 2026 13:35:40 -0000
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3997a448ecbso30608351fa.0
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 06:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxkJ4igoiEubWZcsV/X5qwIdvPp9I42VIX2xcQXRzk9VSRg+9QSg4NvCBAd4i23aSrC2SpWngEMH+bfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO3WaHAdEI12nkTppIyWi/1gLPyH98n+f7f5IhLf16OYWFw1QA
	m6ldlX9EzjyJlsVLX4zSjVvK0au5NOFkuxiC+bPwPfOhFwo0qX11sqM90E8KHeUKc0zGZFYLICr
	nEB18Kz7ywNSIjHem4hY3ckuvuien2Bc=
X-Received: by 2002:ac2:414c:0:b0:5ae:bab8:31dd with SMTP id
 2adb3069b0e04-5b007bc59c3mr99674e87.36.1783344939022; Mon, 06 Jul 2026
 06:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPpkL-yLfeNwsePSGDK7m8ctzPLXTVto1HhrufHv12HO0+B1Vw@mail.gmail.com>
In-Reply-To: <CAPpkL-yLfeNwsePSGDK7m8ctzPLXTVto1HhrufHv12HO0+B1Vw@mail.gmail.com>
From: B X <brent@msbs.com>
Date: Mon, 6 Jul 2026 09:35:26 -0400
X-Gmail-Original-Message-ID: <CAPpkL-y54ySw8ftqeumccNEVatY0Zt6-Ag4PejYddK5WcsiV3A@mail.gmail.com>
X-Gm-Features: AVVi8CeMUfLCRnSJBhxNKlMNPmkKkmpDL-PUwCF0q1KIKR_uiEpf2507oBkrD-o
Message-ID: <CAPpkL-y54ySw8ftqeumccNEVatY0Zt6-Ag4PejYddK5WcsiV3A@mail.gmail.com>
Subject: Re: [REGRESSION] mt7925e: fails to read EEPROM MAC on 7.2-rc2, falls
 back to random MAC (worked on 7.1-rc7 and 7.0.x)
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

B X <brent@msbs.com>
8:12=E2=80=AFAM (1 hour ago)
to linux-wireless, nbd, lorenzo, ryder.lee, shayne.chen, sean.wang,
regressions, Brent

Hi,

Reporting a regression in the mt7925e driver: on Linux 7.2.0-rc2 the adapte=
r
fails to read its stored (EEPROM/efuse) MAC address and substitutes a rando=
m
one. The same hardware read its real MAC correctly on every earlier kernel,
including the immediately-preceding boot one day earlier on 7.0.0-22.

Verified with Claude Code when my ATT fiber kept failing to pin IP on
my Halo Strix

Hardware
--------
MediaTek MT7925 (RZ717) Wi-Fi 7 160MHz
PCI ID: [14c3:0717], driver mt7925e
Platform: AMD "Strix Halo" (Ryzen AI Max) mini-PC
linux-firmware: 20260319.git217ca6e4

Symptom (kernel 7.2.0-rc2, 2026-07-06)
--------------------------------------
  mt7925e 0000:c3:00.0: enabling device (0000 -> 0002)
  mt7925e 0000:c3:00.0: ASIC revision: 79250000
  mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 202601061530=
07a
  mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time:
20260106153120
  mt7925e 0000:c3:00.0: Invalid MAC address, using random address
12:1f:34:c6:57:04
  mt7925e 0000:c3:00.0 wlp195s0: renamed from wlan0

The driver then brings the interface up with the random MAC 12:1f:34:c6:57:=
04.

Last known good (kernel 7.0.0-22, 2026-07-05, same machine, no MAC override=
)
---------------------------------------------------------------------------=
-
  mt7925e 0000:c3:00.0: ASIC revision: 79250000
  mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 202601061530=
07a
  mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time:
20260106153120
  ...
  wlp195s0: authenticate with <ap> (local address=3Dac:f2:3c:35:31:15)

i.e. the real MAC ac:f2:3c:35:31:15 was read straight off the adapter. Note
the firmware init lines (ASIC revision, HW/SW Version, WM Firmware Version,
build times) are byte-identical between the good and bad boots -- only the
kernel differs, and only the MAC read fails. This rules out a firmware or
bad-NVRAM cause: the same silicon read the MAC correctly ~24h earlier.

Regression range
----------------
Confirmed good on: 7.0.0, 7.0.0-22, 7.0.0-27, 7.1.0-rc7 (dozens of boots,
journal-verified, no "Invalid MAC address" line on any of them).
First and only bad boot: 7.2.0-rc2.

So the regression landed between 7.1-rc7 and 7.2-rc2. I have not bisected t=
o
the exact commit yet, but I can -- the machine builds kernels quickly -- if=
 a
bisect would help pin it down.

Not reboot-type dependent: on the good kernels (7.0.0-22 / 7.0.0-27) the
correct MAC was read reliably across both warm/clean reboots and cold/hard
power cycles. The failure does not correlate with reboot type or chip power
state -- it correlates only with the kernel version (7.2-rc2).

Impact
------
The substituted MAC is random per boot, changing the adapter's L2 identity.
This breaks router-side DHCP reservations / fixed-IP allocations keyed on M=
AC:
the host stops receiving its pinned address and lands on an arbitrary lease=
.
Any MT7925 user relying on MAC-based address pinning is affected. Current
workaround here is forcing the real MAC via NetworkManager cloned-mac-addre=
ss.

#regzbot introduced: v7.1..v7.2-rc2



Thanks,


Brent Paine, AWS, CCNP

git bkpaine1
Medium bkpaine1


On Mon, Jul 6, 2026 at 8:12=E2=80=AFAM B X <brent@msbs.com> wrote:
>
> Hi,
>
> Reporting a regression in the mt7925e driver: on Linux 7.2.0-rc2 the adap=
ter
> fails to read its stored (EEPROM/efuse) MAC address and substitutes a ran=
dom
> one. The same hardware read its real MAC correctly on every earlier kerne=
l,
> including the immediately-preceding boot one day earlier on 7.0.0-22.
>
> Verified with Claude Code when my ATT fiber kept failing to pin IP on my =
Halo Strix
>
> Hardware
> --------
> MediaTek MT7925 (RZ717) Wi-Fi 7 160MHz
> PCI ID: [14c3:0717], driver mt7925e
> Platform: AMD "Strix Halo" (Ryzen AI Max) mini-PC
> linux-firmware: 20260319.git217ca6e4
>
> Symptom (kernel 7.2.0-rc2, 2026-07-06)
> --------------------------------------
>   mt7925e 0000:c3:00.0: enabling device (0000 -> 0002)
>   mt7925e 0000:c3:00.0: ASIC revision: 79250000
>   mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 2026010615=
3007a
>   mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time: 2026=
0106153120
>   mt7925e 0000:c3:00.0: Invalid MAC address, using random address 12:1f:3=
4:c6:57:04
>   mt7925e 0000:c3:00.0 wlp195s0: renamed from wlan0
>
> The driver then brings the interface up with the random MAC 12:1f:34:c6:5=
7:04.
>
> Last known good (kernel 7.0.0-22, 2026-07-05, same machine, no MAC overri=
de)
> -------------------------------------------------------------------------=
---
>   mt7925e 0000:c3:00.0: ASIC revision: 79250000
>   mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 2026010615=
3007a
>   mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time: 2026=
0106153120
>   ...
>   wlp195s0: authenticate with <ap> (local address=3Dac:f2:3c:35:31:15)
>
> i.e. the real MAC ac:f2:3c:35:31:15 was read straight off the adapter. No=
te
> the firmware init lines (ASIC revision, HW/SW Version, WM Firmware Versio=
n,
> build times) are byte-identical between the good and bad boots -- only th=
e
> kernel differs, and only the MAC read fails. This rules out a firmware or
> bad-NVRAM cause: the same silicon read the MAC correctly ~24h earlier.
>
> Regression range
> ----------------
> Confirmed good on: 7.0.0, 7.0.0-22, 7.0.0-27, 7.1.0-rc7 (dozens of boots,
> journal-verified, no "Invalid MAC address" line on any of them).
> First and only bad boot: 7.2.0-rc2.
>
> So the regression landed between 7.1-rc7 and 7.2-rc2. I have not bisected=
 to
> the exact commit yet, but I can -- the machine builds kernels quickly -- =
if a
> bisect would help pin it down.
>
> Not reboot-type dependent: on the good kernels (7.0.0-22 / 7.0.0-27) the
> correct MAC was read reliably across both warm/clean reboots and cold/har=
d
> power cycles. The failure does not correlate with reboot type or chip pow=
er
> state -- it correlates only with the kernel version (7.2-rc2).
>
> Impact
> ------
> The substituted MAC is random per boot, changing the adapter's L2 identit=
y.
> This breaks router-side DHCP reservations / fixed-IP allocations keyed on=
 MAC:
> the host stops receiving its pinned address and lands on an arbitrary lea=
se.
> Any MT7925 user relying on MAC-based address pinning is affected. Current
> workaround here is forcing the real MAC via NetworkManager cloned-mac-add=
ress.
>
> #regzbot introduced: v7.1..v7.2-rc2
>
>
>
> Thanks,
>
>
> Brent Paine, AWS, CCNP
>
> git bkpaine1
> Medium bkpaine1
