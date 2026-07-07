Received: from mail5.mxpn1.infra.improvmx.com (mail5.mxpn1.infra.improvmx.com [131.153.154.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C945F168BD
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 00:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.153.154.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783383387; cv=none; b=U8M18pfDd8tLV/OqZTFoWvpyUIYPaspjVpUfWI2Flwdojq55nmd2nKcbMzZzu+ODSMxkATaPkansdpIrKvOKbV8fis1hnabT2Y0nHR/sxnLBOk2lcW36DXcURBjU8lnd39iOAkw8dJxEViRnspsNmQlze5d+SUTmMWu8AkYtnIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783383387; c=relaxed/simple;
	bh=PMQiM5eBVmU0LoAzw5OFyjtzlzaRKLO+l1L/lXziWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CG8DZimcNmzd1ntFK1IPKUHoc9NlYISCYAgdZr1IVRF3wIBWqXfwkeZ+LRTAgjbpfs2DsPSr53JQyJ/zKPX6hmkRMeifNTjGE6pQ4xB+USgoslg6Um+ZIuIbt/Rn83r5LL9gW7S9s/7B4Vd7GOrXcK4vYmK26FstcQg5ly0OHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msbs.com; spf=pass smtp.mailfrom=msbs.com; dkim=pass (2048-bit key) header.d=msbs.com header.i=@msbs.com header.b=lRoa4YFv; arc=none smtp.client-ip=131.153.154.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=msbs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=msbs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=msbs.com header.i=@msbs.com header.b="lRoa4YFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=msbs.com;
 i=@msbs.com; q=dns/txt; s=dkimprovmx2; t=1783383380; h=date : from :
 to : subject : content-type : feedback-id : message-id;
 bh=ey3QhB6J3gnwrfAIUZr8wNCqwKOYSyeo95dRaK+/vzk=;
 b=lRoa4YFvkbBuGGAlK9eEBmMcHkfoTeGHI/lSDhmCMRHihnXDDNrjsoBQ0ZaQG8mWzevXF
 iLJvxSHa4FIO/ihTKz3yvsQnsHK2mWMWS/6l9ik63LI8RbcsJdpSI6rFWFI0Dpg0PAEkgpL
 QDg5riZSal7LrxIC01IXEKMHkz6skZodvMP5MSrc6XMU3r71OpOzJdUrhpBYS3DMER3aVXQ
 4B/tDDvvTXDNZvX3u6QZNLyPpqoj7KqDLVA7uSV+6su+vrrGMotkMLHI0rEecQx8zF1ds8f
 ll9v87q9Fcp9keCcAokxRMpNb5oerNO2kah5UaNqPZKAevWf7dIhpFkao89w==
X-Sending-Service: ImprovMX v3.0.0
Feedback-ID: bXNicy5jb20=:send:ImprovMX
X-ImprovMX-Server-Id: 088d2cf
X-ImprovMX-Session-Id:
 fa6c6add-6b01-4ec7-b63e-a3a9c8d95dbc
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
    by mx1.improvmx.com with ESMTPSA (version=TLSv1.3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256)
    for <regressions@lists.linux.dev>;
    Tue, 07 Jul 2026 00:16:19 -0000
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b293079d1so30917201fa.3
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 17:16:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYM33OrqNeJDrOV8VK9+7dSuI+Z9tuG5xvxw94sfVzKRbJgX+zG2mzm7fzefBjOvTWKbza/VbpYX1XGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkC6O0ZSy3WgCQwlomkE4iAFKcTyyNv+jo9YlSWIbBdNYaAI7X
	0JQ1BDJngankOsX3Ku72m2IJW4JfhXyv8GquE74ke3EOFmAnodvBNmbeuxO4V+2vKVWz6ox1JJZ
	ov98G0RiDAIDUZOdqtKp8AgaDS3/c1E8=
X-Received: by 2002:a2e:9b95:0:b0:393:8ba5:3d01 with SMTP id
 38308e7fff4ca-39c5ffa4574mr4697491fa.22.1783383377035; Mon, 06 Jul 2026
 17:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPpkL-yLfeNwsePSGDK7m8ctzPLXTVto1HhrufHv12HO0+B1Vw@mail.gmail.com>
 <CAPpkL-y54ySw8ftqeumccNEVatY0Zt6-Ag4PejYddK5WcsiV3A@mail.gmail.com> <870f1c80-5027-4503-b6c4-6df80eea7df3@leemhuis.info>
In-Reply-To: <870f1c80-5027-4503-b6c4-6df80eea7df3@leemhuis.info>
From: B X <brent@msbs.com>
Date: Mon, 6 Jul 2026 20:16:05 -0400
X-Gmail-Original-Message-ID: <CAPpkL-xcQJu2Y_7h_moAJ1XEMimQVByz6+_cZCmAj6RqZr0cGQ@mail.gmail.com>
X-Gm-Features: AVVi8CfAhBrZ2u3uERpszP9KdYBi5EX9GEnu78omY7Lc_zd7GvlznoDbleUyEoc
Message-ID: <CAPpkL-xcQJu2Y_7h_moAJ1XEMimQVByz6+_cZCmAj6RqZr0cGQ@mail.gmail.com>
Subject: Re: [REGRESSION] mt7925e: fails to read EEPROM MAC on 7.2-rc2, falls
 back to random MAC (worked on 7.1-rc7 and 7.0.x)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	regressions@lists.linux.dev, Rosen Penev <rosenp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed -- the patch fixes it.

I applied 20260630210215.400379-1-rosenp@gmail.com on top of 7.2-rc2 and
booted it on my x86 Strix Halo (MT7925 RZ717, non-OF PCIe card). With the
patch, the "Invalid MAC address, using random address" line is gone and the
adapter comes up with its real EEPROM MAC (ac:f2:3c:35:31:15). Stock 7.2-rc=
2
without the patch reproduces the random-MAC behaviour on the same hardware.

Tested-by: Brent Paine <bkpaine1@gmail.com>

Brent

On Mon, Jul 6, 2026 at 10:21=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 7/6/26 15:35, B X wrote:
> > B X <brent@msbs.com>
> > 8:12=E2=80=AFAM (1 hour ago)
> > to linux-wireless, nbd, lorenzo, ryder.lee, shayne.chen, sean.wang,
> > regressions, Brent
> >
> > Hi,
> >
> > Reporting a regression in the mt7925e driver: on Linux 7.2.0-rc2 the ad=
apter
> > fails to read its stored (EEPROM/efuse) MAC address and substitutes a r=
andom
> > one. The same hardware read its real MAC correctly on every earlier ker=
nel,
> > including the immediately-preceding boot one day earlier on 7.0.0-22.
>
> Sounds a lot like it's the problem "wifi: mt76: fix MAC address for non
> OF pcie cards" aims to fix:
> https://lore.kernel.org/all/20260630210215.400379-1-rosenp@gmail.com/
>
> Would be great if you could confirm.
>
> Ciao, Thorsten
>
> > Verified with Claude Code when my ATT fiber kept failing to pin IP on
> > my Halo Strix
> >
> > Hardware
> > --------
> > MediaTek MT7925 (RZ717) Wi-Fi 7 160MHz
> > PCI ID: [14c3:0717], driver mt7925e
> > Platform: AMD "Strix Halo" (Ryzen AI Max) mini-PC
> > linux-firmware: 20260319.git217ca6e4
> >
> > Symptom (kernel 7.2.0-rc2, 2026-07-06)
> > --------------------------------------
> >   mt7925e 0000:c3:00.0: enabling device (0000 -> 0002)
> >   mt7925e 0000:c3:00.0: ASIC revision: 79250000
> >   mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260106=
153007a
> >   mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time:
> > 20260106153120
> >   mt7925e 0000:c3:00.0: Invalid MAC address, using random address
> > 12:1f:34:c6:57:04
> >   mt7925e 0000:c3:00.0 wlp195s0: renamed from wlan0
> >
> > The driver then brings the interface up with the random MAC 12:1f:34:c6=
:57:04.
> >
> > Last known good (kernel 7.0.0-22, 2026-07-05, same machine, no MAC over=
ride)
> > -----------------------------------------------------------------------=
-----
> >   mt7925e 0000:c3:00.0: ASIC revision: 79250000
> >   mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260106=
153007a
> >   mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time:
> > 20260106153120
> >   ...
> >   wlp195s0: authenticate with <ap> (local address=3Dac:f2:3c:35:31:15)
> >
> > i.e. the real MAC ac:f2:3c:35:31:15 was read straight off the adapter. =
Note
> > the firmware init lines (ASIC revision, HW/SW Version, WM Firmware Vers=
ion,
> > build times) are byte-identical between the good and bad boots -- only =
the
> > kernel differs, and only the MAC read fails. This rules out a firmware =
or
> > bad-NVRAM cause: the same silicon read the MAC correctly ~24h earlier.
> >
> > Regression range
> > ----------------
> > Confirmed good on: 7.0.0, 7.0.0-22, 7.0.0-27, 7.1.0-rc7 (dozens of boot=
s,
> > journal-verified, no "Invalid MAC address" line on any of them).
> > First and only bad boot: 7.2.0-rc2.
> >
> > So the regression landed between 7.1-rc7 and 7.2-rc2. I have not bisect=
ed to
> > the exact commit yet, but I can -- the machine builds kernels quickly -=
- if a
> > bisect would help pin it down.
> >
> > Not reboot-type dependent: on the good kernels (7.0.0-22 / 7.0.0-27) th=
e
> > correct MAC was read reliably across both warm/clean reboots and cold/h=
ard
> > power cycles. The failure does not correlate with reboot type or chip p=
ower
> > state -- it correlates only with the kernel version (7.2-rc2).
> >
> > Impact
> > ------
> > The substituted MAC is random per boot, changing the adapter's L2 ident=
ity.
> > This breaks router-side DHCP reservations / fixed-IP allocations keyed =
on MAC:
> > the host stops receiving its pinned address and lands on an arbitrary l=
ease.
> > Any MT7925 user relying on MAC-based address pinning is affected. Curre=
nt
> > workaround here is forcing the real MAC via NetworkManager cloned-mac-a=
ddress.
> >
> > #regzbot introduced: v7.1..v7.2-rc2
> >
> >
> >
> > Thanks,
> >
> >
> > Brent Paine, AWS, CCNP
> >
> > git bkpaine1
> > Medium bkpaine1
> >
> >
> > On Mon, Jul 6, 2026 at 8:12=E2=80=AFAM B X <brent@msbs.com> wrote:
> >>
> >> Hi,
> >>
> >> Reporting a regression in the mt7925e driver: on Linux 7.2.0-rc2 the a=
dapter
> >> fails to read its stored (EEPROM/efuse) MAC address and substitutes a =
random
> >> one. The same hardware read its real MAC correctly on every earlier ke=
rnel,
> >> including the immediately-preceding boot one day earlier on 7.0.0-22.
> >>
> >> Verified with Claude Code when my ATT fiber kept failing to pin IP on =
my Halo Strix
> >>
> >> Hardware
> >> --------
> >> MediaTek MT7925 (RZ717) Wi-Fi 7 160MHz
> >> PCI ID: [14c3:0717], driver mt7925e
> >> Platform: AMD "Strix Halo" (Ryzen AI Max) mini-PC
> >> linux-firmware: 20260319.git217ca6e4
> >>
> >> Symptom (kernel 7.2.0-rc2, 2026-07-06)
> >> --------------------------------------
> >>   mt7925e 0000:c3:00.0: enabling device (0000 -> 0002)
> >>   mt7925e 0000:c3:00.0: ASIC revision: 79250000
> >>   mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 2026010=
6153007a
> >>   mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time: 2=
0260106153120
> >>   mt7925e 0000:c3:00.0: Invalid MAC address, using random address 12:1=
f:34:c6:57:04
> >>   mt7925e 0000:c3:00.0 wlp195s0: renamed from wlan0
> >>
> >> The driver then brings the interface up with the random MAC 12:1f:34:c=
6:57:04.
> >>
> >> Last known good (kernel 7.0.0-22, 2026-07-05, same machine, no MAC ove=
rride)
> >> ----------------------------------------------------------------------=
------
> >>   mt7925e 0000:c3:00.0: ASIC revision: 79250000
> >>   mt7925e 0000:c3:00.0: HW/SW Version: 0x8a108a10, Build Time: 2026010=
6153007a
> >>   mt7925e 0000:c3:00.0: WM Firmware Version: ____000000, Build Time: 2=
0260106153120
> >>   ...
> >>   wlp195s0: authenticate with <ap> (local address=3Dac:f2:3c:35:31:15)
> >>
> >> i.e. the real MAC ac:f2:3c:35:31:15 was read straight off the adapter.=
 Note
> >> the firmware init lines (ASIC revision, HW/SW Version, WM Firmware Ver=
sion,
> >> build times) are byte-identical between the good and bad boots -- only=
 the
> >> kernel differs, and only the MAC read fails. This rules out a firmware=
 or
> >> bad-NVRAM cause: the same silicon read the MAC correctly ~24h earlier.
> >>
> >> Regression range
> >> ----------------
> >> Confirmed good on: 7.0.0, 7.0.0-22, 7.0.0-27, 7.1.0-rc7 (dozens of boo=
ts,
> >> journal-verified, no "Invalid MAC address" line on any of them).
> >> First and only bad boot: 7.2.0-rc2.
> >>
> >> So the regression landed between 7.1-rc7 and 7.2-rc2. I have not bisec=
ted to
> >> the exact commit yet, but I can -- the machine builds kernels quickly =
-- if a
> >> bisect would help pin it down.
> >>
> >> Not reboot-type dependent: on the good kernels (7.0.0-22 / 7.0.0-27) t=
he
> >> correct MAC was read reliably across both warm/clean reboots and cold/=
hard
> >> power cycles. The failure does not correlate with reboot type or chip =
power
> >> state -- it correlates only with the kernel version (7.2-rc2).
> >>
> >> Impact
> >> ------
> >> The substituted MAC is random per boot, changing the adapter's L2 iden=
tity.
> >> This breaks router-side DHCP reservations / fixed-IP allocations keyed=
 on MAC:
> >> the host stops receiving its pinned address and lands on an arbitrary =
lease.
> >> Any MT7925 user relying on MAC-based address pinning is affected. Curr=
ent
> >> workaround here is forcing the real MAC via NetworkManager cloned-mac-=
address.
> >>
> >> #regzbot introduced: v7.1..v7.2-rc2
> >>
> >>
> >>
> >> Thanks,
> >>
> >>
> >> Brent Paine, AWS, CCNP
> >>
> >> git bkpaine1
> >> Medium bkpaine1
>
