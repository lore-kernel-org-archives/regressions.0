Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666368;
	b=HEZsfMxtPtcFMOrSFrM9jOMozObuwhO8NJxc32ndsVwBpEJP3ieRLCqLLX4cKddLuuGj
	 VfjBSFq5NsvDi/F9jF6nIWcFMi5jks76sR8rjVP4UyWe4O1qD2aHr/rD68XuP1v/0UDEi
	 40TrKuLxLDjlxQ/dQMByd0nmRrqG0BszbAD5SGcjc0yCuO9dr+KDFtu//5u7tHyNBdqy6
	 PSqu3guQFwdc5d8bTlE6vsNVUgaaCe9hPWO4DoXaXPcm+jYGz5zezQY7WFP17WxTD0tnc
	 T01LynB7pgJjxvzUlGL8DKjHL+yu7iPRxf8uBQszU8U97I/14uq/nPXLSiRvdBvn/gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666368;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6oVpQoaAfUBDMLGh8jDeVDGb49kS8N4K41NNZ9NvSzg=;
	b=Aska8UR1lmL3CZVCTBCrd7cJLz8ePexpz5yQK+qeFHIyoPVPswk/PLOAiWP6vxbmynRI
	 2tj5Axzgs6Q/yg+SMWqnL17SNcuf0HuUjAggHwCxfYieAZycTFV654rEgA36XtLB0xK3H
	 3KCpIPPMmRl4sn6rUrqAPOLlSRb05y7Uu2k417ausFYdKqhLxXzINa8hxggSr9CidD6I7
	 BlPbqJZ7iNb0pH4oBw9F96CJbDpIIRjrmZAzkFm8h+jH1sIlNu4a9m7dysdX7H5yYC+7i
	 kXlH00Fm9CGFfwM+331sp6Qtqy6Ih5pdQ7oxPS63VsunJtiNibdfdXdNuCQGDQvZwrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXlxWdDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34FD606A319
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXlxWdDi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E57E1F000C7
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792666367;
	bh=6oVpQoaAfUBDMLGh8jDeVDGb49kS8N4K41NNZ9NvSzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RXlxWdDilyxzQGbuKQNxbYjcbVIChV5nHyS/al0R+FMoCLxYHFQtZ94FmUDy/QBmp
	 eKuEmBanZgmepaTQE4YrXcmU42tTLSk7VnJnR6LQNxsBSKGkW6opVexOhlYfI0LAf8
	 dsmnWg+VYO4lrx0pZm4xaNcM4msEjZCkmJRWF3eRbqlxeunra8EW74aTJZrpw9c8WX
	 kFhS3QFyXZv0fDIFgnbmTwdV0PCQzv58757LvkYAwxqjlsNEwLz99TEAlRn0Judu+f
	 R+Fy8+Z4/Y9iRgFg0EgpQ2Cl2h34FVWRh6TOX5qDODpz1tf2naORFW+4VsrUd58oCO
	 bbYSTLgRZ/U2w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1416051e87.2
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 03:52:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXwNHXs94OpWT3CaF7bIMvrlocr2b6woW7lax6Z7ftKpkYOf58HU6z0Tw4uCE3cTkguJeJwv5Ia4XAAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLK6fwv3gJN6+zuLRGEOJMsC2MVToRKRwqe2z4l98tYk9Ult34D
	55s11feMPzahfLgTUqE8FVVX5NEQtg7L7IkFA8hRYUrkKMfDeya4WOp0UQpIiqZ6f37x+Up8dzL
	CafZJRq956GSHaJCLTGWLKPUZdMhtPL0=
X-Received: by 2002:a05:6512:689:b0:5ba:4296:cb8d with SMTP id
 2adb3069b0e04-5bfa1c4f138mr1910136e87.57.1792666365789; Thu, 22 Oct 2026
 03:52:45 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <d4aaa5e8-7366-461c-94b1-ccf3631c8bf9@6bit.com> <b859285b-e43e-43f2-a4f7-af82705d3513@6bit.com>
In-Reply-To: <b859285b-e43e-43f2-a4f7-af82705d3513@6bit.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 12:50:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h8ke_CE1Y_nesgOU8L-R6WcPaoxFjjRp0rfyRdg+Lj1Q@mail.gmail.com>
X-Gm-Features: AclHuK8naCpr6PnXRIxW3blPFvl6oFVcOrYvteiSPSRAvMlkDGcfHwaBJITl2-A
Message-ID: <CAJZ5v0h8ke_CE1Y_nesgOU8L-R6WcPaoxFjjRp0rfyRdg+Lj1Q@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION_6=2E16=5D_r8169_RTL8168h=2F8111h_fails_to_?=
	=?UTF-8?Q?probe_=E2=80=94_=22Unable_to_change_power_state_from_D3cold_to_D0=22_?=
	=?UTF-8?Q?=E2=80=94_bisected_to_4d4c10f763d7?=
To: Josh Perry <josh@6bit.com>
Cc: mario.limonciello@amd.com, bhelgaas@google.com, hkallweit1@gmail.com, 
	nic_swsd@realtek.com, rafael@kernel.org, linux-pci@vger.kernel.org, 
	netdev@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 3:37=E2=80=AFAM Josh Perry <josh@6bit.com> wrote:
>
> On 6/11/26 19:07, Josh Perry wrote:
> > #regzbot introduced: 4d4c10f763d7
> >
> > Since v6.16 one of two onboard RTL8168h/8111h NICs on this board fails
> > to probe on boot; the device drops to D3cold and the driver can't bring
> > it back:
> >
> >    r8169 0000:02:00.0 eth0: RTL8168h/8111h, 00:2b:67:48:40:01, XID 541,
> > IRQ 137
> >    r8169 0000:04:00.0: Unable to change power state from D3cold to D0,
> > device inaccessible
> >    r8169 0000:04:00.0: Mem-Wr-Inval unavailable
> >    r8169 0000:04:00.0: error -EIO: PCI read failed
> >    r8169 0000:04:00.0: probe with driver r8169 failed with error -5
> >
> > The board has two identical RTL8168h NICs (both XID 541): 0000:02:00.0
> > and 0000:04:00.0. Only 04:00.0 fails =E2=80=94 its sibling 02:00.0, on =
a
> > different root port, probes and works normally on the very same kernel
> > and boot. The failing NIC then does not appear (no enp4s0), taking the
> > machine's WAN offline. This strongly suggests the problem is port/
> > topology-specific rather than device- or driver-specific: the upstream
> > port behind 04:00.0 is placed in D3cold and the endpoint cannot be
> > resumed to D0.
> >
> > Hardware: RTL8168h/8111h, XID 541, PCI 04:00.0 (onboard 1GbE).
> > Platform: Lenovo ThinkCentre M90n-1 (11AHS0B200), BIOS M2AKT49A
> > (2026-03-25, latest available). Firmware is current, so this is not a
> > platform-firmware issue.
> >
> > Bisection: v6.15 good, v6.16 bad (verified by booting both). I then
> > reverted 4d4c10f763d7 ("PCI: Explicitly put devices into D0 when
> > initializing") together with its follow-up 907a7a2e5bf4 ("PCI/PM: Set u=
p
> > runtime PM even for devices without PCI PM") on top of 6.16.7: the NIC
> > probes and links at 1Gbps/Full normally, with no workaround:
> >
> >    r8169 0000:04:00.0 eth1: RTL8168h/8111h, 00:2b:67:48:40:02, XID 541,
> > IRQ 138
> >    r8169 0000:04:00.0 enp4s0: Link is Up - 1Gbps/Full - flow control rx=
/tx
> >
> > Workaround: booting an unmodified v6.16+ kernel with pcie_port_pm=3Doff
> > also restores the NIC, which is consistent with the upstream port being
> > placed in D3cold and the device failing to resume to D0 after the
> > explicit-D0 init change.
> >
> > The follow-up 907a7a2e5bf4 does not fix this resume case: v6.18.33 is
> > still affected (retested today on current firmware).
> >
> > Happy to test patches or provide full dmesg / lspci.
>
>
> Hey guys,
>
> Thanks, and apologies for the slow follow-up. Multiple of you asked me
> to test on the latest mainline.
>
> I had a chance to do just that today with the latest mainline v7.3.
> Verdict is that it's still broken, same messages as in the original
> report. pcie_port_pm=3Doff on the same build still works around it.
>
> dmesg, "sudo lspci -vvv" and the sysfs PM state for both boots (same
> v7.3 build, only the command line differs) are attached here:
>
>    https://bugzilla.kernel.org/show_bug.cgi?id=3D222179
>
> New detail from the failing boot: the root port above the dead NIC
> (00:1d.3) is in D0 but its link shows DLActive-, and the endpoint's
> config space reads all-ones ("Unknown header type 7f"). With
> pcie_port_pm=3Doff the port shows DLActive+ and the NIC is in D0 at
> 2.5GT/s x1. So the port seems to come back but the link to 04:00.0
> doesn't retrain.
>
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D222179

Please also try v7.3 with this patch applied:

https://lore.kernel.org/linux-pci/20261015020811.1132314-1-keng-yu.lin@hpe.=
com/raw
