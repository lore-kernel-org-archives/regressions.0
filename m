Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0171CF5C0
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373869; cv=none; b=Mtb2Y2o/905pt4grIlc4wuFloSlPJ1dyIZKgSliz3mBORSC0jKZEW2M/1sr5qYs3Dtf+xa+YINVVBDbOOrfwb2TPtNiMMPPBUoRLwOODXy0Tsj/D4UFYy79XciV81f4ge2T+GFQvCIFdSSPq+vIo0BUp5rpIw6vPLcwO/5Yv6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373869; c=relaxed/simple;
	bh=QbmbZQXsamqdNlHYd+X8ksgbc1iaoTp8ZFQxBPWYZ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvNJViOppNpXCmAbzUwE5Rb2EN78kpX3XPIhzwzd8DUgEueGxpnhd+4h4rXOMX9EYw8AVZs2qXd6pwm8mfNyHfzYObgnxl7CMVKTPxipCHNQl9tEKa/IG3KO8tMEl4K/lJmHSjC6fCd/gpb/a8+ltz1LqG1f/GNLyWIVfq+4H8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b82f3767so3708491e87.3
        for <regressions@lists.linux.dev>; Tue, 01 Jul 2025 05:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373865; x=1751978665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7HVFMPJAt1WeX7ij/W3jz0RpayYJ4zFyBYCplxep88=;
        b=SFAtno86COxp7+Qi5jh38v2sk1KufpizRArTIcnnvNVENsx5IYTlzDkniGPzr984ok
         czQU8lWdeCQVmKji3tkcoTuRYV5/dNgY3CsDKXFqqtasDOH0viQev1Qouppi6DxSwJax
         AUuQ2i/57Udp4XiNW83xpaiRz56kqVVbSWmZhNnKvxYyikMdduTXQzr8Si73vnvjWZs3
         aij7sROdr+sIYCFRv1gnURKg1v/wu3GNzEyQjX8zGp6rbCsKt1w1qz+y13R6NiLugox+
         W+R5L79DOAduebNFBCermL2xgrQt4Wy+NgYjDsMXGiEFR5iFZdfHbiNtmYt80MUBY6nU
         8nsg==
X-Forwarded-Encrypted: i=1; AJvYcCU9V4fUaiZW9NzSS5wp6UYoRSLqMnap0K6jRyZeszvegs9HHCPsNCihKBwIpHL0xq1ttqHyZsgxhY2UoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHdP2kSK/Wtnda3Mo3i6vwSuehTyybPoyNdNEDiBmdBeTnkjb1
	NWBiayY1mVxX+TCWjpb5zzAcfHFWUS03DqoQVnS7o4uObKYFxjeilpD5
X-Gm-Gg: ASbGncupiQYbGIodBAqnqfhQbLWCOGovh39ofC/XTA2yiBnXY6kE26liumTR6qcsqiP
	2l1nizwmXiGfkQOvKX+hR7doFWK3Xy1yqJJE4MxxUkYbWmrfdVqjGmUGhS57b+0TyI4BCk5bA+s
	p/jHTTpsjQgxoLVAmWx7G6+cjxysougNSyXG8clOYvK2a1NT879XiUIklSFPAJ0WZMLi/Q43Qv5
	g33EGUQStACzzifwpTmHQIr6aqz6Dz20CllMiIPWwJr1ZcsTOV/LYUxJf+HlMTXSph0M8ffeCw/
	9V/imnocDv2rcF4Hy5emVlBpGvT9wfCswXtB9CjrYfbXestkcrBmwqBrv5X/f/gstalKY8cn7zt
	BPCtMy82e4iFaP2owGssE
X-Google-Smtp-Source: AGHT+IEBV0/jUI6S0AOqcejoj0LNvQaJQtl1dQ8lichKDf56ZXv2ttjcgUReFpC0tfClg4HsVD1pdQ==
X-Received: by 2002:a05:6512:3083:b0:549:5866:6489 with SMTP id 2adb3069b0e04-5550ba224f5mr5695523e87.47.1751373865250;
        Tue, 01 Jul 2025 05:44:25 -0700 (PDT)
Received: from onyx.my.domain (88-112-35-58.elisa-laajakaista.fi. [88.112.35.58])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c615fsm1839514e87.154.2025.07.01.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:44:25 -0700 (PDT)
Date: Tue, 1 Jul 2025 15:44:23 +0300
From: Timo Teras <timo.teras@iki.fi>
To: "Lifshits, Vitaly" <vitaly.lifshits@intel.com>
Cc: En-Wei WU <en-wei.wu@canonical.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>, <netdev@vger.kernel.org>,
 <intel-wired-lan@lists.osuosl.org>, <regressions@lists.linux.dev>,
 <stable@vger.kernel.org>, <sashal@kernel.org>
Subject: Re: [Intel-wired-lan] [REGRESSION] Packet loss after hot-plugging
 ethernet cable on HP Zbook (Arrow Lake)
Message-ID: <20250701154423.1917c3de@onyx.my.domain>
In-Reply-To: <3023fe74-29c7-4a41-b805-c6b00fb0b3cc@intel.com>
References: <CAMqyJG3LVqfgqMcTxeaPur_Jq0oQH7GgdxRuVtRX_6TTH2mX5Q@mail.gmail.com>
	<3023fe74-29c7-4a41-b805-c6b00fb0b3cc@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Jul 2025 14:46:18 +0300
"Lifshits, Vitaly" <vitaly.lifshits@intel.com> wrote:

> On 7/1/2025 8:31 AM, En-Wei WU wrote:
> > Hi,
> > 
> > I'm seeing a regression on an HP ZBook using the e1000e driver
> > (chipset PCI ID: [8086:57a0]) -- the system can't get an IP address
> > after hot-plugging an Ethernet cable. In this case, the Ethernet
> > cable was unplugged at boot. The network interface eno1 was present
> > but stuck in the DHCP process. Using tcpdump, only TX packets were
> > visible and never got any RX -- indicating a possible packet loss or
> > link-layer issue.
> > 
> > This is on the vanilla Linux 6.16-rc4 (commit
> > 62f224733431dbd564c4fe800d4b67a0cf92ed10).
> > 
> > Bisect says it's this commit:
> > 
> > commit efaaf344bc2917cbfa5997633bc18a05d3aed27f
> > Author: Vitaly Lifshits <vitaly.lifshits@intel.com>
> > Date:   Thu Mar 13 16:05:56 2025 +0200
> > 
> >      e1000e: change k1 configuration on MTP and later platforms
> > 
> >      Starting from Meteor Lake, the Kumeran interface between the
> > integrated MAC and the I219 PHY works at a different frequency.
> > This causes sporadic MDI errors when accessing the PHY, and in rare
> > circumstances could lead to packet corruption.
> > 
> >      To overcome this, introduce minor changes to the Kumeran idle
> >      state (K1) parameters during device initialization. Hardware
> > reset reverts this configuration, therefore it needs to be applied
> > in a few places.
> > 
> >      Fixes: cc23f4f0b6b9 ("e1000e: Add support for Meteor Lake")
> >      Signed-off-by: Vitaly Lifshits <vitaly.lifshits@intel.com>
> >      Tested-by: Avigail Dahan <avigailx.dahan@intel.com>
> >      Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
> > 
> >   drivers/net/ethernet/intel/e1000e/defines.h |  3 +++
> >   drivers/net/ethernet/intel/e1000e/ich8lan.c | 80
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
> >   drivers/net/ethernet/intel/e1000e/ich8lan.h |  4 ++++
> >   3 files changed, 82 insertions(+), 5 deletions(-)
> > 
> > Reverting this patch resolves the issue.
> > 
> > Based on the symptoms and the bisect result, this issue might be
> > similar to
> > https://lore.kernel.org/intel-wired-lan/20250626153544.1853d106@onyx.my.domain/
> > 
> > 
> > Affected machine is:
> > HP ZBook X G1i 16 inch Mobile Workstation PC, BIOS 01.02.03
> > 05/27/2025 (see end of message for dmesg from boot)
> > 
> > CPU model name:
> > Intel(R) Core(TM) Ultra 7 265H (Arrow Lake)
> > 
> > ethtool output:
> > driver: e1000e
> > version: 6.16.0-061600rc4-generic
> > firmware-version: 0.1-4
> > expansion-rom-version:
> > bus-info: 0000:00:1f.6
> > supports-statistics: yes
> > supports-test: yes
> > supports-eeprom-access: yes
> > supports-register-dump: yes
> > supports-priv-flags: yes
> > 
> > lspci output:
> > 0:1f.6 Ethernet controller [0200]: Intel Corporation Device
> > [8086:57a0] DeviceName: Onboard Ethernet
> >          Subsystem: Hewlett-Packard Company Device [103c:8e1d]
> >          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx+
> >          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast
> > >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >          Latency: 0
> >          Interrupt: pin D routed to IRQ 162
> >          IOMMU group: 17
> >          Region 0: Memory at 92280000 (32-bit, non-prefetchable)
> > [size=128K] Capabilities: [c8] Power Management version 3
> >                  Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
> > PME(D0+,D1-,D2-,D3hot+,D3cold+)
> >                  Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1
> > PME- Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> >                  Address: 00000000fee00798  Data: 0000
> >          Kernel driver in use: e1000e
> >          Kernel modules: e1000e
> > 
> > The relevant dmesg:
> > <<<cable disconnected>>>
> > 
> > [    0.927394] e1000e: Intel(R) PRO/1000 Network Driver
> > [    0.927398] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > [    0.927933] e1000e 0000:00:1f.6: enabling device (0000 -> 0002)
> > [    0.928249] e1000e 0000:00:1f.6: Interrupt Throttling Rate
> > (ints/sec) set to dynamic conservative mode
> > [    1.155716] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized):
> > registered PHC clock
> > [    1.220694] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width
> > x1) 24:fb:e3:bf:28:c6
> > [    1.220721] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network
> > Connection [    1.220903] e1000e 0000:00:1f.6 eth0: MAC: 16, PHY:
> > 12, PBA No: FFFFFF-0FF [    1.222632] e1000e 0000:00:1f.6 eno1:
> > renamed from eth0
> > 
> > <<<cable connected>>>
> > 
> > [  153.932626] e1000e 0000:00:1f.6 eno1: NIC Link is Up 1000 Mbps
> > Half Duplex, Flow Control: None
> > [  153.934527] e1000e 0000:00:1f.6 eno1: NIC Link is Down
> > [  157.622238] e1000e 0000:00:1f.6 eno1: NIC Link is Up 1000 Mbps
> > Full Duplex, Flow Control: None
> > 
> > No error message seen after hot-plugging the Ethernet cable.
> >   
> 
> Thank your for the report.
> 
> We did not encounter this issue during our patch testing. However, we 
> will attempt to reproduce it in our lab.
> 
> One detail that caught my attention is that flow control is disabled
> in both scenarios. Could you please check whether the issue persists
> when flow control is enabled? This might require connecting to a link
> partner that supports flow control.

I wrote the other similar report from Dell Pro referenced earlier.
Additional testing on the Dell provided the following insight:

- A fast cable out/in will work. The cable should be disconnected
  for 10-15 seconds for the issue to trigger.

- Sometimes the first spurious link up is 1000 mbps/half and sometimes
  10 mbps/half.

- Using ethtool -r to renegotiate the link will make things work in
  the defunct state.

And yes, my issue seems to be exactly the same.

Thanks,
Timo
