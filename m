Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016915;
	b=rUD0PMH0kzzkCtLxG1cIOFjEhBia38wsTEjinTtH7EqS5ejE++Fi5QN4lRH5SSBXGoVH
	 2TtIKv5Cw6GjHlD3X1mOacbCYLOPvQyL9MoNmRDvWI38a39wHtl0xcgeqDEEvppBazzRB
	 oSnCwp3/Y9UWlMybjn8EzLidzjQhguMG6auxxDoIW25LTa/gZspUFJUaySV0xR1Ln58oK
	 tDv8/zw9NrNeNG0Xs0cjLjCgC6L123GZj3I2HqWo3MxbeNPgjQOGLkjgDhPauGhjfL6HP
	 q91iXMn8/WS9oovComvsBfAerNeDChrLvcsFav62opv4chi6sFUrF7UH2cUP0HKxm2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=m5LgUOKMWb8vJkuqw01Y2mNnINBmVuzndAfYu1bG4UA=;
	b=mHQF+OxM/szkOvVninGEFETP53symgQbjAOuu7YbEn17IE8se9aC8P8HfsSJVP6/DvsX
	 C9f/vb7yqrw/WtPLcJ/Nu3Nj9lRxqbl94OQ1Ucjk9z3cxRVbpHY1Bent/lP/H+bcUjEXi
	 y0P3JG6Xeus6l0R1/QyabOpxiTewslpbzsMqsuIyuNG/fVeN/KQoWgh5otxY6hfXAzbUO
	 TT+NchAD7iQKfYgMEC3SlSAD3qLGC/NwF81Sds55DADrDDAkGkCBtpjnh3VSxsIt9HCX7
	 FZ9pewufBuq+LcGOQuBiRxarqRpmCUPvTw2qMWFhu2mmf2EMf0jjq0S7++QDcrAP5Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=TJTgKrwT;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0338606A339
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 15:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0338606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=TJTgKrwT
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jV5Wm5hjQz68M2;
	Wed, 18 Nov 2026 16:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795016692;
	bh=6W78CIV+VFHs/eRoRR7XLz3T4okJ2yxymasjkheTO4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TJTgKrwTmHDnrCKNLZwJXAA7PH4jsGacSvD5L0+WSyOjEGueHJsJ2VVxnTedhrTOB
	 uKd26MJw7EKzmAYcdDWH2LDttkYeDjfaAfvzvlABFVOlLgqF+M7UXStn06wC1AaHJH
	 BDHPQDH4B6zc3tiP9Bnkqb0shgDp/ONhOEIBBdFJUn9FejayVpBtHgeLR7NUTuy52g
	 sz4SVINanTaioqDoksgkw5ALudnpZYAHHn1k4kK4jNq8bvB10hm8OACYWCILEz2Cp3
	 3/Pb+nScHhaOjvOW7AY/MjkwDXmKLYpmRpVNkXIuaYXm2LrmdnnspRch+4x64csT+z
	 9F99N9JyORm6w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jV5WB5dcqz51ct;
	Wed, 18 Nov 2026 16:44:22 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jV5W94x4Qz8svk;
	Wed, 18 Nov 2026 16:44:16 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7FC3D5FD6A;
	Wed, 18 Nov 2026 16:44:06 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <cfdb01ab-ee1f-410a-912d-1b07f90b6e91@leemhuis.info>
Date: Wed, 18 Nov 2026 16:44:04 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] r8169: RTL8127A (XID 6c9) SFP+ link fails to come up
 in 7.4-rc3 (inband/10gbase-r)
To: Frits Letteboer <frits@letteboer.com>, hkallweit1@gmail.com
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev, andrew@lunn.ch,
 rmk+kernel@armlinux.org.uk
References: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <9e803eea-2446-425a-93d3-2524890d9508@letteboer.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179501664687.2416742.10315534654183012741@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 7FC3D5FD6A
X-NC-CID: UYn6CVIyMPUVvFAFYSkmsb8rzkqIKsi9LyHswDMF3P7GVWp4Rfo=

On 11/18/26 16:18, Frits Letteboer wrote:
> 
> Between Linux 7.3 and 7.4-rc3, my Realtek RTL8127A (XID 6c9) SFP+ NIC
> stopped establishing a link and generating interrupts under r8169.
> 
> Hardware details:
> - NIC: Realtek RTL8127 10GbE Controller (rev 08), XID 6c9
> - Transceiver: Intel FTLX8571D3BCV-IT (10GBASE-SR SFP+)
> 
> On Linux 7.3, r8169 attached the "Realtek SFP PHY Mode" driver and
> brought up the 10Gbps link normally. On 7.4-rc3, r8169 configures
> "inband/10gbase-r link mode" via phylink, after which "Link detected"
> remains "no", no link state transitions are logged, and zero IRQs fire.
> 
> Tested workarounds on 7.4-rc3:
> - pci=nomsix, iommu=pt, amd_iommu=off: no effect
> - Realtek out-of-tree r8127 driver (11.017.02) on 7.4-rc3: works
>   properly and brings the 10G link up immediately.
> 
> --- dmesg on Linux 7.3 (working) ---
> [    3.777598] r8169 0000:0a:00.0 eth1: RTL8127A, 8c:a6:82:71:89:12, XID
> 6c9, IRQ 152
> [    3.777601] r8169 0000:0a:00.0 eth1: jumbo features [frames: 16362
> bytes, tx checksumming: ko]
> [   13.540664] r8169 0000:0a:00.0 re0: renamed from eth1
> [   34.179244] Realtek SFP PHY Mode r8169-0-a00:00: attached PHY driver
> (mii_bus:phy_addr=r8169-0-a00:0, irq=MAC)
> [   34.871337] r8169 0000:0a:00.0 re0: Link is Down
> [   35.053740] r8169 0000:0a:00.0 re0: Link is Up - 10Gbps/Full - flow
> control off
> 
> --- dmesg on Linux 7.4-rc3 (broken) ---
> [    3.806559] r8169 0000:0a:00.0 eth1: RTL8127A, 8c:a6:82:71:89:12, XID
> 6c9, IRQ 152 (32 total)
> [    3.806562] r8169 0000:0a:00.0 eth1: jumbo features [frames: 16362
> bytes, tx checksumming: ko]
> [   14.285134] r8169 0000:0a:00.0 re0: renamed from eth1
> [   34.926923] r8169 0000:0a:00.0 re0: configuring for inband/10gbase-r
> link mode
> [   40.505158] r8169 0000:0a:00.0: invalid VPD tag 0x00 (size 0) at
> offset 0; assume missing optional EEPROM

This is not my area of expertise, so the following might mislead you.
Nevertheless FWIW:

That error msg recently showed up here, so I wonder if it might be related:
https://lore.kernel.org/all/20260522114135.2104890-1-18255117159@163.com/

Ciao, Thorsten

> --- ethtool re0 on Linux 7.4-rc3 ---
> Settings for re0:
>     Supported ports: [ MII ]
>     Supported link modes:   10000baseT/Full
>                             10000baseKX4/Full
>                             10000baseKR/Full
>                             10000baseR_FEC
>                             10000baseCR/Full
>                             10000baseSR/Full
>                             10000baseLR/Full
>                             10000baseLRM/Full
>                             10000baseER/Full
>     Supported pause frame use: No
>     Supports auto-negotiation: Yes
>     Supported FEC modes: Not reported
>     Advertised link modes:  10000baseT/Full
>                             10000baseKX4/Full
>                             10000baseKR/Full
>                             10000baseR_FEC
>                             10000baseCR/Full
>                             10000baseSR/Full
>                             10000baseLR/Full
>                             10000baseLRM/Full
>                             10000baseER/Full
>     Advertised pause frame use: No
>     Advertised auto-negotiation: Yes
>     Advertised FEC modes: Not reported
>     Speed: 10000Mb/s
>     Duplex: Full
>     Auto-negotiation: on
>     Port: MII
>     PHYAD: 0
>     Transceiver: internal
>     Supports Wake-on: pumbg
>     Wake-on: d
>     Link detected: no
> 
> I am happy to test any diagnostic patches on this hardware.
> 
> Thanks!

