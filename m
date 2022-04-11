Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490551363
	for <regressions@lists.linux.dev>; Mon, 11 Apr 2022 10:21:23 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ndrAf-0002jA-9e; Mon, 11 Apr 2022 12:21:21 +0200
Message-ID: <53fe33c5-eb14-0bff-22c2-249f845383bc@leemhuis.info>
Date: Mon, 11 Apr 2022 12:21:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Bug 215740] New: kernel warning: DMA-API: xhci_hcd: cacheline
 tracking EEXIST, overlapping mappings aren't supported #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
 <69a5233e-aa11-073a-a390-3f80e6dc4466@leemhuis.info>
In-Reply-To: <69a5233e-aa11-073a-a390-3f80e6dc4466@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649672483;ded8afbf;
X-HE-SMSGID: 1ndrAf-0002jA-9e

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot invalid: not a regressions, just and existing problem that
became visible due to a new error message

On 31.03.22 09:41, Thorsten Leemhuis wrote:
> Hey Christoph, Marek, Greg!
> 
> Below warning was reported to bugzilla.kernel.org more than a week ago;
> to quote the important parts here:
> 
>> https://bugzilla.kernel.org/show_bug.cgi?id=215740
>>
>>     DMA-API: xhci_hcd 0000:09:00.3: cacheline tracking EEXIST, overlapping mappings aren't supported
>>     WARNING: CPU: 4 PID: 69 at kernel/dma/debug.c:570 add_dma_entry+0x1c7/0x250
>> [...]
>>     Call Trace:
>>     <TASK>
>>     dma_map_page_attrs+0x82/0x250
>>     ? _raw_spin_unlock_irqrestore+0x30/0x60
>>     usb_hcd_map_urb_for_dma+0x3eb/0x4f0
>>     usb_hcd_submit_urb+0x9b/0xb90
>>     ? lockdep_init_map_type+0x62/0x260
>>     usb_start_wait_urb+0x55/0x130
>>     usb_control_msg+0xc9/0x110
>>     hub_ext_port_status+0x89/0x110
>>     hub_event+0x1e4/0x1920
> 
> See the full quote below for details.
> 
> According to a bugzilla.redhat.com ticket linked in the report this
> started to happen with 5.14. A second user there also confirmed the
> problem that still seems to happen with recent 5.17 pre-releases.
> Searching on lore revealed that others have hit this warning as well in
> the past few months:
> 
> https://lore.kernel.org/all/65271fd1-1c1c-f2ad-9b0f-60174e791eaa@linux.intel.com/
> https://lore.kernel.org/all/5cd6fc87-0f8d-0b9b-42be-8180540a94e7@gmail.com/
> https://lore.kernel.org/all/CABXGCsP-JJAUh-SV0u1ALu5+awxcWT3BsQ=FzKrqb+9HOk2EUA@mail.gmail.com/
> 
> Does anyone have a idea what might be wrong here? If not, I guess we
> should ask one of the reporters to bisect this.
> 
> Anyway, to ensure the issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v5.13..v5.14
> #regzbot title dma or usb: warning "DMA-API: xhci_hcd ... cacheline
> tracking EEXIST, overlapping mappings aren't supported"
> #regzbot from: Andrew  <travneff@gmail.com>
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215740
> #regzbot https://bugzilla.redhat.com/show_bug.cgi?id=2021242
> #regzbot ignore-activity
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 
> On 24.03.22 16:18, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=215740
>>
>>             Bug ID: 215740
>>            Summary: kernel warning: DMA-API: xhci_hcd: cacheline tracking
>>                     EEXIST, overlapping mappings aren't supported
>>            Product: Drivers
>>            Version: 2.5
>>     Kernel Version: 5.17
>>           Hardware: All
>>                 OS: Linux
>>               Tree: Mainline
>>             Status: NEW
>>           Severity: normal
>>           Priority: P1
>>          Component: USB
>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>           Reporter: travneff@gmail.com
>>         Regression: No
>>
>> Created attachment 300612
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=300612&action=edit
>> full dmesg log with the warning
>>
>> I have this kernel trace often while PC booting:
>>
>>     DMA-API: xhci_hcd 0000:09:00.3: cacheline tracking EEXIST, overlapping
>> mappings aren't supported
>>     WARNING: CPU: 4 PID: 69 at kernel/dma/debug.c:570 add_dma_entry+0x1c7/0x250
>>     Modules linked in: bpf_preload
>>     CPU: 4 PID: 69 Comm: kworker/4:1 Not tainted 5.17.0 #1
>>     Hardware name: ASUS System Product Name/TUF GAMING B550M-PLUS, BIOS 2423
>> 08/10/2021
>>     Workqueue: usb_hub_wq hub_event
>>     RIP: 0010:add_dma_entry+0x1c7/0x250
>>     Code: ff 0f 84 97 00 00 00 48 8b 5f 50 48 85 db 75 03 48 8b 1f e8 4b 53 80
>> 00 48 89 c6 48 89 da 48 c7 c7 58 b3 84 94 e8 27 21 ca 00 <0f> 0b 48 85 ed 0f 85
>> 69 d2 ca 00 8b 05 88 a0 30 02 85 c0 0f 85 f4
>>     RSP: 0018:ffff9cadc0c9ba88 EFLAGS: 00010292
>>     RAX: 0000000000000060 RBX: ffff9173d2c49ea0 RCX: 0000000000000000
>>     RDX: 0000000000000001 RSI: 00000000ffffdfff RDI: 00000000ffffffff
>>     RBP: ffff9173d11a5e80 R08: 0000000000000000 R09: ffff9cadc0c9b8c0
>>     R10: ffff9cadc0c9b8b8 R11: ffffffff95165128 R12: 0000000000000000
>>     R13: 0000000000000001 R14: 0000000000000206 R15: 00000000046882ee
>>     FS:  0000000000000000(0000) GS:ffff9182a8200000(0000)
>> knlGS:0000000000000000
>>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>     CR2: 00007fce5d52a130 CR3: 0000000119b28000 CR4: 0000000000350ee0
>>     Call Trace:
>>     <TASK>
>>     dma_map_page_attrs+0x82/0x250
>>     ? _raw_spin_unlock_irqrestore+0x30/0x60
>>     usb_hcd_map_urb_for_dma+0x3eb/0x4f0
>>     usb_hcd_submit_urb+0x9b/0xb90
>>     ? lockdep_init_map_type+0x62/0x260
>>     usb_start_wait_urb+0x55/0x130
>>     usb_control_msg+0xc9/0x110
>>     hub_ext_port_status+0x89/0x110
>>     hub_event+0x1e4/0x1920
>>     ? lock_acquire+0xe0/0x2d0
>>     ? lock_is_held_type+0xea/0x140
>>     process_one_work+0x29b/0x5f0
>>     worker_thread+0x4f/0x390
>>     ? process_one_work+0x5f0/0x5f0
>>     kthread+0xf5/0x120
>>     ? kthread_complete_and_exit+0x20/0x20
>>     ret_from_fork+0x22/0x30
>>     </TASK>
>>
>> My usb devices:
>>
>> $ lsusb -t
>>     /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>>         |__ Port 4: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>>             |__ Port 4: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
>>                 |__ Port 2: Dev 4, If 0, Class=Mass Storage, Driver=uas, 5000M
>>                 |__ Port 4: Dev 5, If 0, Class=Hub, Driver=hub/4p, 5000M
>>                     |__ Port 4: Dev 6, If 0, Class=Hub, Driver=hub/4p, 5000M
>>     /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>>         |__ Port 2: Dev 2, If 3, Class=Application Specific Interface, Driver=,
>> 12M
>>         |__ Port 2: Dev 2, If 1, Class=Vendor Specific Class, Driver=btusb, 12M
>>         |__ Port 2: Dev 2, If 2, Class=Vendor Specific Class, Driver=btusb, 12M
>>         |__ Port 2: Dev 2, If 0, Class=Vendor Specific Class, Driver=btusb, 12M
>>         |__ Port 4: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
>>             |__ Port 1: Dev 12, If 0, Class=Communications, Driver=cdc_ether,
>> 480M
>>             |__ Port 1: Dev 12, If 1, Class=CDC Data, Driver=cdc_ether, 480M
>>             |__ Port 4: Dev 4, If 0, Class=Hub, Driver=hub/4p, 480M
>>                 |__ Port 4: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>>                     |__ Port 3: Dev 6, If 1, Class=Human Interface Device,
>> Driver=usbhid, 1.5M
>>                     |__ Port 3: Dev 6, If 0, Class=Human Interface Device,
>> Driver=usbhid, 1.5M
>>                     |__ Port 4: Dev 7, If 0, Class=Hub, Driver=hub/4p, 480M
>>                         |__ Port 2: Dev 8, If 0, Class=Human Interface Device,
>> Driver=usbfs, 1.5M
>>                         |__ Port 3: Dev 9, If 0, Class=Vendor Specific Class,
>> Driver=, 480M
>>                         |__ Port 4: Dev 10, If 0, Class=Imaging, Driver=, 480M
>>     /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>>     /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>>         |__ Port 6: Dev 2, If 2, Class=Human Interface Device, Driver=usbhid,
>> 12M
>>         |__ Port 6: Dev 2, If 0, Class=Vendor Specific Class, Driver=, 12M
>>         |__ Port 7: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
>>
>> $ lsusb
>>     Bus 004 Device 006: ID 2109:0812 VIA Labs, Inc. VL812 Hub
>>     Bus 004 Device 005: ID 2109:0812 VIA Labs, Inc. VL812 Hub
>>     Bus 004 Device 004: ID 0578:0578 Intrinsix Corp. KingSpec
>>     Bus 004 Device 003: ID 2109:0812 VIA Labs, Inc. VL812 Hub
>>     Bus 004 Device 002: ID 2109:0812 VIA Labs, Inc. VL812 Hub
>>     Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>     Bus 003 Device 010: ID 1004:633e LG Electronics, Inc. LM-X420xxx/G2/G3
>> Android Phone (MTP/download mode)
>>     Bus 003 Device 009: ID 0bda:8812 Realtek Semiconductor Corp. RTL8812AU
>> 802.11a/b/g/n/ac 2T2R DB WLAN Adapter
>>     Bus 003 Device 008: ID 0463:ffff MGE UPS Systems UPS
>>     Bus 003 Device 007: ID 2109:2812 VIA Labs, Inc. VL812 Hub
>>     Bus 003 Device 006: ID 046d:c30e Logitech, Inc. UltraX Keyboard (Y-BL49)
>>     Bus 003 Device 005: ID 2109:2812 VIA Labs, Inc. VL812 Hub
>>     Bus 003 Device 004: ID 2109:2812 VIA Labs, Inc. VL812 Hub
>>     Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB
>> Ethernet/RNDIS Gadget
>>     Bus 003 Device 003: ID 2109:2812 VIA Labs, Inc. VL812 Hub
>>     Bus 003 Device 002: ID 0b05:17cb ASUSTek Computer, Inc. Broadcom BCM20702A0
>> Bluetooth
>>     Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>     Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>     Bus 001 Device 003: ID 05e3:0610 Genesys Logic, Inc. Hub
>>     Bus 001 Device 002: ID 0b05:1939 ASUSTek Computer, Inc. AURA LED Controller
>>     Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>
>> Kernel is built from
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> at v5.17 tag (f443e374ae131c168a065ea1748feac6b2e76613)
>>
>> Also reproduces for my distro kernel:
>> https://bugzilla.redhat.com/show_bug.cgi?id=2021242
>>
> 
