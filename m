Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFD121B185
	for <regressions@lists.linux.dev>; Mon, 17 Mar 2025 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742195888; cv=none; b=bolxb3Bi84ZRnRT3HJRouMl05lO83j7ebP7KDdni2XWpHrf9tzvCO82R4Z6mfzrRUlPoiR9UrhYHaStXTOFx75uUfCe+2kqoyG5Zmp2LDrvCrv3cEYfT9bHsWo1s7M8GrehNwUNvagOEEyt+xcK+H0YbeNPWh5zc53NaxGCWQWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742195888; c=relaxed/simple;
	bh=eHIwsN6Abmy3U973+5Mx78LBVNlGSdUy8PsUDtqGj9c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gg58aH0OqfjEl8cuAXDG5KGRuxB4j2kypHkCki9XbPHQBSDxfS7a5SrwxVBSpzi9tV6qoYKiJZCRlqxytWbwVry+bCzZ/2S+ouJVF8MbE1RicBWfWDduVMLtawRAnklMzE1zBsFEMHb8rLBGfVG1+Ewun7zZ2qlGH0h0DMoonvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLLBEhj6; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLLBEhj6"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso4365264e0c.1
        for <regressions@lists.linux.dev>; Mon, 17 Mar 2025 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742195886; x=1742800686; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AH2HYt2r1KmI4Zyzljw4+AJ7HTRk4dVIoYMbtEO/GLA=;
        b=lLLBEhj6EWcxbXCKOzCKhLf5vKnJ7jdL6F6vG0SNI12PFKEgWsAfsauukdSwAH2YxI
         0K9XMd1vPXsUBxJwlWmB/cZbGiXihNhalS2yCWbT1jQf5A8/ZCMVF1yqrmiLlomt1HVq
         fZuXrITJtKn3vrRnhOrgQyeGz/i6HefGbu5zsZdona2PICWNHTUWuDWXH91FrgFt/c/X
         J8Qza3V7QYY2oszASVfgDmM9ExDgiQKpGo6NMk+eSBlZ1evJu1UnV4iLqQGO9sFqo1/5
         9z38cbC5dDovo8lMp95w6iXMZYd3aoaYcBGI/qBOB2eIY+euuoi8Op5RznwByMb16N21
         wbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742195886; x=1742800686;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AH2HYt2r1KmI4Zyzljw4+AJ7HTRk4dVIoYMbtEO/GLA=;
        b=aLKfNozvim4iIC2c0z9+k3kaeZ8js25Ts1jQuuW366nPtojqp2a2Z+szgp6IW/XkfQ
         V65NxUdIoYF493IkacQq971iBoNUVZy2ydkTOPlKJv1tWaETtrLVhtSHc9895OaGYS0N
         Dtg4Xl1RcDCq66pkoKf3zGj1p/iJuFjRO6U7s7+S3BpMMn7STWn6060qZMiCUH1Au30P
         R4QdOr69f0S+OlR/F+5EX/eftV7aznPiHD3rrlBf1Q9TA+Jl1t/+hXQwrozwgBVbyiQD
         VK2iFz4qh+KpQPr4Vvy4OYM2UXmGEMByAT4YRn3HaW+c9xJexV4PnQk8pa0cHvrv7ttW
         z2Dw==
X-Gm-Message-State: AOJu0Yw26iMrCrbgq/9yTMpOvbuo65EWE0WfEb4s63LFwILqHqG0+uH4
	XgZUeUig//nF7n5jN3im2g2I7ozSpu034lJoq+S/Jeu8eU4lwo1ThF+BtaQvRcL7ubaCdSilJCV
	6AgZtKRKNXmQx0dh67MlHyhSg65g=
X-Gm-Gg: ASbGncvyHKmg3g0CEh4+wo1MXyYezwbPkz9w2b+1etHMTBL4cuTLoVp5LC+nuqJ8uBe
	g+nl66bzVjNmJW3wUS0dJ35I6cmiMKlIdAIyrP78i3BCNixZZZelUHM7axQxoauiOwZD9FnRFoo
	PocFWDpA2GTf7dhELWvhvMfjZV
X-Google-Smtp-Source: AGHT+IF5nZsXFhv0x61B5lLZXjl6XJjrC/v6qUzWhCh86DAF6p8MJWQClVaGlTKU9ceW3BS3KeHcYXv/y9g2Kt1b1BM=
X-Received: by 2002:a05:6122:660f:b0:520:60c2:3f3 with SMTP id
 71dfb90a1353d-524498ba1b1mr7539795e0c.4.1742195885927; Mon, 17 Mar 2025
 00:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Jean=2DFran=C3=A7ois_INGELAERE?= <masterprenium.lkml@gmail.com>
Date: Mon, 17 Mar 2025 08:17:55 +0100
X-Gm-Features: AQ5f1JqZ3sk5XcXTZKtYXvP9xiv1rrojiY1ZguEyPbjMkkVtcj7mBcZy314OqyQ
Message-ID: <CACr2tqv6ZsEt1heUKvYeSOT9joYqCFsepn6j8sqVO7ErhKvGeQ@mail.gmail.com>
Subject: Wireless speed regression issue with >6.12.12/6.13.x + firmware
 update for mediatek MT7925
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello guys,

I'm reporting an issue with Linux kernel >6.12.12 and 6.13.x with
mediatek 7925 serie Wi-Fi card. Reproducible ALWAYS.
I got a regression with newer firmware and kernel >6.12.12.
The regression seems to be between 6.12.12 and 6.12.13 (and ported to 6.13.x).
I'm having low speed connection and especially really bad Upload speed
(<4Mbit/s) while running in 802.11ax (better speed in 802.11ac), the
MIMO/channel width function seems to be linked with this issue.

Here are some speed reports & infos :

With 6.12.1 + firmware-202412x speed is correct (1Gbps/800Mbps)
With 6.12.12 + firmware-202412x speed is correct (1Gbps/800Mbps)
With 6.12.12 + firmware-202503x speed is NOT correct but between
acceptable and unacceptable (350Mbps/25Mbps)
With 6.12.13 + firmware-202412x speed is NOT correct but between
acceptable and unacceptable (280Mbps/80Mbps)
With 6.12.13 + firmware-202503x speed is unacceptable (280Mbps/3mbps)
With 6.12.13 + firmware-202503x BUT with only one Wi-Fi channel (here
ch 36) (See at the end of this message) ie 20Mhz channel width, I got
better upload speed than in wider channel width (80Mbps/30Mbps).



Kernel 6.13 +
Linux Firmware 202412 version.
[24305.691750] Loading firmware: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[24305.695281] mt7925e 0000:73:00.0: ASIC revision: 79250000
[24305.772614] Loading firmware:
mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
[24305.772732] mt7925e 0000:73:00.0: HW/SW Version: 0x8a108a10, Build
Time: 20241104132949a
[24306.121223] Loading firmware: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[24306.121674] mt7925e 0000:73:00.0: WM Firmware Version: ____000000,
Build Time: 20241104133053
[24306.207593] Loading firmware: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[24306.804659] mt7925e 0000:73:00.0 wlp115s0: renamed from wlan0


Linux-firmware >=202501, upload speed unacceptable (download quite the same) :
[23925.753738] Loading firmware: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[23925.757066] mt7925e 0000:73:00.0: ASIC revision: 79250000
[23925.834400] Loading firmware:
mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
[23925.834518] mt7925e 0000:73:00.0: HW/SW Version: 0x8a108a10, Build
Time: 20250113153001a
[23926.197786] Loading firmware: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
[23926.198160] mt7925e 0000:73:00.0: WM Firmware Version: ____000000,
Build Time: 20250113153106
[23926.281524] Loading firmware: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin



lspci -vvvv
73:00.0 Network controller: MEDIATEK Corp. Device 7925
        Subsystem: AzureWave Device 6002
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 195
        IOMMU group: 25
        Region 0: Memory at 82200000 (64-bit, non-prefetchable) [size=2M]
        Region 2: Memory at 82400000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: [80] Express (v2) Endpoint, IntMsgNum 0
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+
FLReset+ SlotPowerLimit 10W TEE-IO-
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag+ PhantFunc- AuxPwr- NoSnoop+ FLReset-
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
                LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <2us, L1 <8us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 5GT/s, Width x1
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
NROPrPrP- LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not
Supported, ExtFmt+ EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                         AtomicOpsCtl: ReqEn-
                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink-
Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance Preset/De-emphasis: -6dB
de-emphasis, 0dB preshoot
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [e0] MSI: Enable+ Count=1/32 Maskable+ 64bit+
                Address: 00000000fee54000  Data: 0022
                Masking: fffffffe  Pending: 00000000
        Capabilities: [f8] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Vendor Specific Information: ID=1556
Rev=1 Len=008 <?>
        Capabilities: [108 v1] Latency Tolerance Reporting
                Max snoop latency: 3145728ns
                Max no snoop latency: 3145728ns
        Capabilities: [110 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=3us PortTPowerOnTime=52us
                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=0us LTR1.2_Threshold=118784ns
                L1SubCtl2: T_PwrOn=52us
        Capabilities: [200 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO+ CmpltAbrt-
UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr-
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP-
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+
                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr- CorrIntErr- HeaderOF-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+ CorrIntErr+ HeaderOF-
                AERCap: First Error Pointer: 0e, ECRCGenCap-
ECRCGenEn- ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Kernel driver in use: mt7925e
        Kernel modules: mt7925e



The AP is a Cisco 9120AXI running in 160Mhz channel width @ (52, 56,
60, 64, 36, 40, 44, 48) channels (yes reported in this order, I think
it can mind) 52 is the primary one.
Also tested this setup with another cheap AP with channel in "correct"
order ? It can maybe be a little better but doesn't change a lot of
things.


The setup is the same as previously where I was able to get 1Gbit/s
Upload speed, just kernel & firmware update.

Any way to fix it ?
Best regards,
