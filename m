Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82711238C05
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347940; cv=none; b=ISL2wciyZ2AJv+w1vrnfalIW4QXVl2bh00+FKbm5yFwZNGWDRzkdEyVwXYCfYiT/gCFF3PoPYC0uZBOoKpO+SuJ4/rBmSuSpQ2jk/7cNt87aeby6WaARP7j1NZzNgjbB/LHX6hXjUDMWZx456PgF9A5wSrXh8VYwkuR4lta5al0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347940; c=relaxed/simple;
	bh=Ia9bC7BliojpDQhV0cK1tnHWh30Sa7PZo14jzxTtV4U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CF/vg720lK5CMCHgY3S4e/7nYXkkFdQKxufEzn6HPRlJvYZk/m8JGa+2cRIklqQsOeda8sKopFrgAnpk54CKCcDrGs4cL1nBlwTNozs5NbmjzK7d0tJY4ahzZjgqieTfkXF7j8YVcKgfH1uGBw9Ab0+b9fXTIIGblR6HYSTowvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=iix+x8il; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="iix+x8il"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0A0663F69A
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 05:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751347930;
	bh=Th6tfyDO394CCH7+jhRsGZjGv3kV4BdFVr82r26bkjE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=iix+x8ilzqChwqsnSekO4oirO80ZQUxusm4x0FXNpSluyiRw6ewVAv8u1e0nV9WYG
	 hDhijbktS0A5lbT1619vw4MUxe9hWq988NStxRHNbvnwAEixkHwmez5jkqfn8EppBh
	 m76i4127mc/oSMVBLElR5SkVVc4BXYR/NQaHlFefJxN4VWMjRXw6WD/NBfmqFACh9S
	 uH25ByA7/j/CRW32GYUFu9d3mP5XqiI/f7a3jj/dyL/KNXEZhLV8F+B4SiEnuxtlH4
	 hY02bNRtc4oqZ2QecL/Tv5lVY39+J5yvlzJOf3G/ab52dY4xQV4kTnQd2dMxk2EWZm
	 Ul+QtL/U3rd/Q==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453a190819bso10749285e9.1
        for <regressions@lists.linux.dev>; Mon, 30 Jun 2025 22:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751347929; x=1751952729;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Th6tfyDO394CCH7+jhRsGZjGv3kV4BdFVr82r26bkjE=;
        b=ej4yC9LydZqJHmfX0Ii4Uorm6dcL7UYIMG1WCa+d7hQkl5P9b+RfPvY4PCuGRPAfvL
         6fKlUsTvM5p0X8ex4AUck22PJvY/YOOZt1bbw4EIwsQTWtqQxZyBTrKzaY438K/iEmhq
         SEytuQtcJo4k0Y+tN6v/IHRBnav9dZdHeOBPJKeHu38J2xyopdmXIJ2vwKk3UsbepulK
         G1CBD7LK5VNWazepZ10sAdshXDyeEQ1AwzBKeEsEnfcjKDZ13pScPf/ZUv63//JmQgi5
         wfnNqABVje1O2v2+23qmeTI/DRCKSkWn/5l163qFPeg4oRsMjbYPn1krn1FxFMDdSCVq
         iIXw==
X-Gm-Message-State: AOJu0Yxg1yQJWIaEd5FfnsQYE99N52j9hVtqVg1ovqnpEeikd2cDmCdy
	/j2Ae2Ok11bQjcT2FuVWeSH0YBlbredANqQ4ZOwNrpMKVdPzii7SGR8/vtVTVb/63xHrkuTWqCM
	iePgADgpTrnI/eh79XCYMTvDQYu6bQiyDaWtHi87DhEOLu9cusnawtlSyvk01OdbRPhQpCw+Tb3
	bsjgbs/3ax62nHUDM0od98zi9fZv4p82qF27utMp4KCOaVp1c0rF7H6Ak=
X-Gm-Gg: ASbGncvHy+DUiJxjrScOOfp2nYvg7TCCbAAiX/NdpbBjBVa9wJ9IOuo2jd6tQ6VtJAb
	ejLAxfewTO/xIk4HGrN9WvLTnEYRoSPdkJgJn9yZzqWUf6IiwmTfpGTCDZuQFkDFG+2YA+NhQ2W
	fYh5Fo
X-Received: by 2002:adf:e68d:0:b0:3a4:fc3f:b7fd with SMTP id ffacd0b85a97d-3a90d69c1ebmr9798643f8f.19.1751347929280;
        Mon, 30 Jun 2025 22:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQS3XawVxrrKMLZsnhzsHuYQTttD0IeJ90NQXWb6KtNxi3msiWFQZXCQ9dWC8kYKoB37mb6mkCcsSe0DFPtYM=
X-Received: by 2002:adf:e68d:0:b0:3a4:fc3f:b7fd with SMTP id
 ffacd0b85a97d-3a90d69c1ebmr9798628f8f.19.1751347928826; Mon, 30 Jun 2025
 22:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: En-Wei WU <en-wei.wu@canonical.com>
Date: Tue, 1 Jul 2025 13:31:57 +0800
X-Gm-Features: Ac12FXzfag1g2nwhulkJ_FDCmz-gasu-2kJw2gi7_6NbhQZX4c5tIUv2dN6Kb-g
Message-ID: <CAMqyJG3LVqfgqMcTxeaPur_Jq0oQH7GgdxRuVtRX_6TTH2mX5Q@mail.gmail.com>
Subject: [REGRESSION] Packet loss after hot-plugging ethernet cable on HP
 Zbook (Arrow Lake)
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	"Lifshits, Vitaly" <vitaly.lifshits@intel.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Cc: regressions@lists.linux.dev, stable@vger.kernel.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm seeing a regression on an HP ZBook using the e1000e driver
(chipset PCI ID: [8086:57a0]) -- the system can't get an IP address
after hot-plugging an Ethernet cable. In this case, the Ethernet cable
was unplugged at boot. The network interface eno1 was present but
stuck in the DHCP process. Using tcpdump, only TX packets were visible
and never got any RX -- indicating a possible packet loss or
link-layer issue.

This is on the vanilla Linux 6.16-rc4 (commit
62f224733431dbd564c4fe800d4b67a0cf92ed10).

Bisect says it's this commit:

commit efaaf344bc2917cbfa5997633bc18a05d3aed27f
Author: Vitaly Lifshits <vitaly.lifshits@intel.com>
Date:   Thu Mar 13 16:05:56 2025 +0200

    e1000e: change k1 configuration on MTP and later platforms

    Starting from Meteor Lake, the Kumeran interface between the integrated
    MAC and the I219 PHY works at a different frequency. This causes sporadic
    MDI errors when accessing the PHY, and in rare circumstances could lead
    to packet corruption.

    To overcome this, introduce minor changes to the Kumeran idle
    state (K1) parameters during device initialization. Hardware reset
    reverts this configuration, therefore it needs to be applied in a few
    places.

    Fixes: cc23f4f0b6b9 ("e1000e: Add support for Meteor Lake")
    Signed-off-by: Vitaly Lifshits <vitaly.lifshits@intel.com>
    Tested-by: Avigail Dahan <avigailx.dahan@intel.com>
    Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>

 drivers/net/ethernet/intel/e1000e/defines.h |  3 +++
 drivers/net/ethernet/intel/e1000e/ich8lan.c | 80
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/net/ethernet/intel/e1000e/ich8lan.h |  4 ++++
 3 files changed, 82 insertions(+), 5 deletions(-)

Reverting this patch resolves the issue.

Based on the symptoms and the bisect result, this issue might be
similar to https://lore.kernel.org/intel-wired-lan/20250626153544.1853d106@onyx.my.domain/


Affected machine is:
HP ZBook X G1i 16 inch Mobile Workstation PC, BIOS 01.02.03 05/27/2025
(see end of message for dmesg from boot)

CPU model name:
Intel(R) Core(TM) Ultra 7 265H (Arrow Lake)

ethtool output:
driver: e1000e
version: 6.16.0-061600rc4-generic
firmware-version: 0.1-4
expansion-rom-version:
bus-info: 0000:00:1f.6
supports-statistics: yes
supports-test: yes
supports-eeprom-access: yes
supports-register-dump: yes
supports-priv-flags: yes

lspci output:
0:1f.6 Ethernet controller [0200]: Intel Corporation Device [8086:57a0]
        DeviceName: Onboard Ethernet
        Subsystem: Hewlett-Packard Company Device [103c:8e1d]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin D routed to IRQ 162
        IOMMU group: 17
        Region 0: Memory at 92280000 (32-bit, non-prefetchable) [size=128K]
        Capabilities: [c8] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee00798  Data: 0000
        Kernel driver in use: e1000e
        Kernel modules: e1000e

The relevant dmesg:
<<<cable disconnected>>>

[    0.927394] e1000e: Intel(R) PRO/1000 Network Driver
[    0.927398] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.927933] e1000e 0000:00:1f.6: enabling device (0000 -> 0002)
[    0.928249] e1000e 0000:00:1f.6: Interrupt Throttling Rate
(ints/sec) set to dynamic conservative mode
[    1.155716] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized):
registered PHC clock
[    1.220694] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width
x1) 24:fb:e3:bf:28:c6
[    1.220721] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connection
[    1.220903] e1000e 0000:00:1f.6 eth0: MAC: 16, PHY: 12, PBA No: FFFFFF-0FF
[    1.222632] e1000e 0000:00:1f.6 eno1: renamed from eth0

<<<cable connected>>>

[  153.932626] e1000e 0000:00:1f.6 eno1: NIC Link is Up 1000 Mbps Half
Duplex, Flow Control: None
[  153.934527] e1000e 0000:00:1f.6 eno1: NIC Link is Down
[  157.622238] e1000e 0000:00:1f.6 eno1: NIC Link is Up 1000 Mbps Full
Duplex, Flow Control: None

No error message seen after hot-plugging the Ethernet cable.

-- 
Best Regards,
En-Wei.
