Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148433D6CC
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 22:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676303; cv=none; b=QBl3VnJRXcSKvOq53Z+0T5HUDTlgGJ9XhQ92zaxYnm2PSX0JLnxbmbCBW3+osagaIeaSNVGX7tsXuwBkiCPFP67lDGVtaSbIhK3KIrXYZu5UvTtHlcLVKup0/wM1vGykMTQ3X4qkZ+hUdVYJrQbkWuAVKcDUdTHiA5S2IeL33Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676303; c=relaxed/simple;
	bh=Rvmv1h7SASnS2GmozAzv5bTF2jkuyjizM6jsXSWqh5U=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ldZbb1A8lND0m9O/wHpkZZf5EzLnofV2A+2ksU3lqTaig2G4rlvLsmejfdKfppCO6SRoBn4OWAXw1i7WQP9aPeHjiq0YBEPc/6MBPRM34eG9NcqAPe/FgM13ctGoijyfhwltwRAFas23Szv+WcrxKM3SdjAummh42NZ7o+ZZ7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa; spf=pass smtp.mailfrom=gaga.casa; arc=none smtp.client-ip=64.142.111.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaga.casa
Received: from 192-184-188-171.static.sonic.net (192-184-188-171.static.sonic.net [192.184.188.171])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 5AKM4jlJ032282;
	Thu, 20 Nov 2025 14:04:45 -0800
From: Forest <forestix@gaga.casa>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Thu, 20 Nov 2025 14:04:45 -0800
Message-ID: <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net> <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com>
In-Reply-To: <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVaBKIBn1jpnMsNYYc6fQTz7pUtXpKsRPy7Ej9000xaIDh7PhqIs4DSCb97g7yyzl3WQWi8qmIybLEnQG6ApuXTj
X-Sonic-ID: C;xDI+7FzG8BG9ZK76uCp4aA== M;6tJP7FzG8BG9ZK76uCp4aA==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On Tue, 18 Nov 2025 11:21:18 +0200, Mathias Nyman wrote:

>If the bisected patch is the issue then disabling runtime suspend could help.
>For all usb* roothubs:
>
>echo on > /sys/bus/usb/devices/usb*/power/control
>
>Does it affect anything?

Yes. After setting all of those to 'on', I have been unable to
reproduce the freeze. Tested for nearly 12 hours so far, so I think
it does avoid the problem. (I'll do some more testing and report
back if that changes.)

>Could you share some info about this setup:

$ sudo lspci -nnv -d ::0c03
0c:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series Chipset USB 3.2 Controller [1022:43f7] (rev 01) (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. Device [1b21:1142]
        Flags: bus master, fast devsel, latency 0, IRQ 24, IOMMU group 23
        Memory at f6900000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [78] Power Management version 3
        Capabilities: [80] Express Legacy Endpoint, IntMsgNum 0
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [160] Latency Tolerance Reporting
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

0e:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 3.1 xHCI [1022:15b6] (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device [1043:8877]
        Flags: fast devsel, IRQ 86, IOMMU group 28
        Memory at f6500000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [2a0] Access Control Services
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

0e:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 3.1 xHCI [1022:15b7] (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device [1043:8877]
        Flags: fast devsel, IRQ 95, IOMMU group 29
        Memory at f6400000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [2a0] Access Control Services
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

0f:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device [1043:8877]
        Flags: fast devsel, IRQ 24, IOMMU group 31
        Memory at f6e00000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2a0] Access Control Services
        Capabilities: [410] Physical Layer 16.0 GT/s <?>
        Capabilities: [450] Lane Margining at the Receiver
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci


$ sudo lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/12p, 480M
    |__ Port 005: Dev 002, If 0, Class=Wireless, Driver=btusb, 480M
    |__ Port 005: Dev 002, If 1, Class=Wireless, Driver=btusb, 480M
    |__ Port 005: Dev 002, If 2, Class=Wireless, Driver=[none], 480M
    |__ Port 006: Dev 003, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 006: Dev 003, If 1, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 006: Dev 003, If 2, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 006: Dev 003, If 3, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 007: Dev 004, If 0, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 007: Dev 004, If 1, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 011: Dev 005, If 0, Class=Vendor Specific Class, Driver=[none], 12M
    |__ Port 011: Dev 005, If 2, Class=Human Interface Device, Driver=usbhid, 12M
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/5p, 20000M/x2
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 10000M
/:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 10000M
/:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M


>Enabling usb core and xhci dynamic debug could share some light on this:
>
>mount -t debugfs none /sys/kernel/debug
>echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
>echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>< Reproduce issue >
>Send output of dmesg

With these enabled and adb running, dmesg produces a 90-line burst of
output roughly each second. This generated megabytes of output before
the freeze happened. Comparing the last three bursts, I found them to
be identical except for the relative order of a few lines, and the
timestamps.

I was redirecting `dmesg --follow` to a file while watching it in a
terminal, in hopes that any buffered output that wasn't written
to the file when the freeze happened would be visible on-screen.
A photo of the screen showed the same messages as found at the tail
of the file, but with newer timestamps.

Here is the last burst of logged messages:

[ 3516.610664] xhci_hcd 0000:0f:00.0: Setting command ring address to 0xffffe001
[ 3516.611616] xhci_hcd 0000:0f:00.0: xhci_resume: starting usb7 port polling.
[ 3516.611619] xhci_hcd 0000:0f:00.0: xhci_hub_status_data: stopping usb7 port polling
[ 3516.611621] xhci_hcd 0000:0f:00.0: hcd_pci_runtime_resume: 0
[ 3516.611624] usb usb7: usb auto-resume
[ 3516.611628] hub 7-0:1.0: hub_resume
[ 3516.611632] xhci_hcd 0000:0f:00.0: Get port status 7-1 read: 0x2a0, return 0x100
[ 3516.611689] hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[ 3516.611695] hub 7-0:1.0: hub_suspend
[ 3516.611704] usb usb7: bus auto-suspend, wakeup 1
[ 3516.611708] xhci_hcd 0000:0f:00.0: xhci_hub_status_data: stopping usb7 port polling
[ 3516.611712] xhci_hcd 0000:0f:00.0: config port 7-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.611714] xhci_hcd 0000:0f:00.0: xhci_suspend: stopping usb7 port polling.
[ 3516.611726] xhci_hcd 0000:0f:00.0: Setting command ring address to 0xffffe001
[ 3516.612681] xhci_hcd 0000:0f:00.0: hcd_pci_runtime_suspend: 0
[ 3516.622567] xhci_hcd 0000:0e:00.4: Setting command ring address to 0xffffe001
[ 3516.623346] xhci_hcd 0000:0e:00.4: xhci_resume: starting usb5 port polling.
[ 3516.623349] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb6 port polling
[ 3516.623351] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb5 port polling
[ 3516.623352] xhci_hcd 0000:0e:00.4: hcd_pci_runtime_resume: 0
[ 3516.623354] usb usb6: usb auto-resume
[ 3516.623378] hub 6-0:1.0: hub_resume
[ 3516.650531] xhci_hcd 0000:0e:00.4: Get port status 6-1 read: 0x2a0, return 0x2a0
[ 3516.650565] xhci_hcd 0000:0e:00.4: Get port status 6-2 read: 0x2a0, return 0x2a0
[ 3516.650614] usb usb5: usb auto-resume
[ 3516.650632] hub 5-0:1.0: hub_resume
[ 3516.650635] xhci_hcd 0000:0e:00.4: Get port status 5-1 read: 0x2a0, return 0x100
[ 3516.650642] hub 6-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 3516.650664] xhci_hcd 0000:0e:00.4: Get port status 5-2 read: 0x2a0, return 0x100
[ 3516.650689] hub 5-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 3516.650697] hub 5-0:1.0: hub_suspend
[ 3516.650715] usb usb5: bus auto-suspend, wakeup 1
[ 3516.650733] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb5 port polling
[ 3516.662574] xhci_hcd 0000:0e:00.3: Setting command ring address to 0xffffe001
[ 3516.663352] xhci_hcd 0000:0e:00.3: xhci_resume: starting usb3 port polling.
[ 3516.663355] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb4 port polling
[ 3516.663357] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb3 port polling
[ 3516.663358] xhci_hcd 0000:0e:00.3: hcd_pci_runtime_resume: 0
[ 3516.663360] usb usb4: usb auto-resume
[ 3516.663383] hub 4-0:1.0: hub_resume
[ 3516.686531] xhci_hcd 0000:0e:00.3: Get port status 4-1 read: 0x2a0, return 0x2a0
[ 3516.686560] xhci_hcd 0000:0e:00.3: Get port status 4-2 read: 0x2a0, return 0x2a0
[ 3516.686588] hub 4-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 3516.686616] usb usb3: usb auto-resume
[ 3516.686637] hub 3-0:1.0: hub_resume
[ 3516.686640] xhci_hcd 0000:0e:00.3: Get port status 3-1 read: 0x2a0, return 0x100
[ 3516.686655] xhci_hcd 0000:0e:00.3: Get port status 3-2 read: 0x2a0, return 0x100
[ 3516.686676] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 3516.686684] hub 3-0:1.0: hub_suspend
[ 3516.686704] usb usb3: bus auto-suspend, wakeup 1
[ 3516.686722] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb3 port polling
[ 3516.686736] usb usb2: usb auto-resume
[ 3516.686744] hub 2-0:1.0: hub_resume
[ 3516.710545] xhci_hcd 0000:0c:00.0: Get port status 2-1 read: 0x2a0, return 0x2a0
[ 3516.710578] xhci_hcd 0000:0c:00.0: Get port status 2-2 read: 0x2a0, return 0x2a0
[ 3516.710599] xhci_hcd 0000:0c:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
[ 3516.710624] xhci_hcd 0000:0c:00.0: Get port status 2-4 read: 0x2a0, return 0x2a0
[ 3516.710645] xhci_hcd 0000:0c:00.0: Get port status 2-5 read: 0x2a0, return 0x2a0
[ 3516.710670] hub 2-0:1.0: state 7 ports 5 chg 0000 evt 0000
[ 3516.858535] xhci_hcd 0000:0e:00.4: set port remote wake mask, actual port 6-1 status  = 0xe0002a0
[ 3516.858551] xhci_hcd 0000:0e:00.4: set port remote wake mask, actual port 6-2 status  = 0xe0002a0
[ 3516.858559] hub 6-0:1.0: hub_suspend
[ 3516.858567] usb usb6: bus auto-suspend, wakeup 1
[ 3516.858594] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb6 port polling
[ 3516.858600] xhci_hcd 0000:0e:00.4: config port 6-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.858615] xhci_hcd 0000:0e:00.4: config port 6-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.858636] xhci_hcd 0000:0e:00.4: config port 5-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.858658] xhci_hcd 0000:0e:00.4: config port 5-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.858660] xhci_hcd 0000:0e:00.4: xhci_suspend: stopping usb5 port polling.
[ 3516.858677] xhci_hcd 0000:0e:00.4: Setting command ring address to 0xffffe001
[ 3516.859456] xhci_hcd 0000:0e:00.4: hcd_pci_runtime_suspend: 0
[ 3516.894548] xhci_hcd 0000:0e:00.3: set port remote wake mask, actual port 4-1 status  = 0xe0002a0
[ 3516.894567] xhci_hcd 0000:0e:00.3: set port remote wake mask, actual port 4-2 status  = 0xe0002a0
[ 3516.894575] hub 4-0:1.0: hub_suspend
[ 3516.894582] usb usb4: bus auto-suspend, wakeup 1
[ 3516.894610] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb4 port polling
[ 3516.894615] xhci_hcd 0000:0e:00.3: config port 4-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.894631] xhci_hcd 0000:0e:00.3: config port 4-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.894653] xhci_hcd 0000:0e:00.3: config port 3-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.894674] xhci_hcd 0000:0e:00.3: config port 3-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[ 3516.894676] xhci_hcd 0000:0e:00.3: xhci_suspend: stopping usb3 port polling.
[ 3516.894693] xhci_hcd 0000:0e:00.3: Setting command ring address to 0xffffe001
[ 3516.895472] xhci_hcd 0000:0e:00.3: hcd_pci_runtime_suspend: 0
[ 3516.918537] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
[ 3516.918551] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-2 status  = 0xe0002a0
[ 3516.918561] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-3 status  = 0xe0002a0
[ 3516.918569] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-4 status  = 0xe0002a0
[ 3516.918578] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-5 status  = 0xe0002a0
[ 3516.918584] hub 2-0:1.0: hub_suspend
[ 3516.918591] usb usb2: bus auto-suspend, wakeup 1
[ 3516.918599] xhci_hcd 0000:0c:00.0: xhci_hub_status_data: stopping usb2 port polling
