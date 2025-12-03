Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345002D7D47
	for <regressions@lists.linux.dev>; Wed,  3 Dec 2025 23:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764805305; cv=none; b=ITAk07qQSLI32Fhul4i8Lb7ndggZF/QoNHiyZczmr27AKJ2wrabuaNznzg7POiIqK7kg96LVNzCeEdhnTqpNR2KbdZF5YFqGu/3FcowLuTT4JuFFZbxHHSQB4Q602nkvIyC4hOg2UF06Airb06SEu6NCjFkiM1B84NrbqCxHmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764805305; c=relaxed/simple;
	bh=V2Ednu6eGGlo1Fo3FGOtGpPoQRmz0QOBQscU0iXbHvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gix4Q0z8AN9vJQyppWKrH6l2NhAH7C7vIMfKREi05YHcN1nT47DNWTUOyzP5k5+b1LbTdoX5hH3Pd7dVZ44HeNc0kvFrKG9i2mKZyDqkls8g4xS+hanbkJOpHG7lWFhNLD15gxKszqlBC6+Hplpd7eYNxVqQEInSb5rqeoaYJVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxXljbeb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxXljbeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764805303; x=1796341303;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V2Ednu6eGGlo1Fo3FGOtGpPoQRmz0QOBQscU0iXbHvI=;
  b=WxXljbebfG+PbUNZDen+JyxN34xrbpFaXUhu74G0/3tKj7yu7AwXsK9s
   E/s0wH77dxyXBqvgHFuO8LweoWlUjxboee6d4j7mO3jSOYW5eAbjodnqp
   OuPEg1wP38TArTN5WAadZas0UyXItYV6ipTGm8w37OCKz9JtMoqILJ96L
   kVIqagRj7V5Bsc5jOubek2f/wIgWY2Yi3qgwnGwDzo7He0Bf6+Ubae033
   SCSjf8J2jsA/EVdos53bMQjCQ0FjrHVvFtvP7k2WB/O59uQGA2qAJR+vO
   OdXH+nSSLrQ8hu3Bvgo31TD08qY8g40hWUiIw1XMR5QLu1cy+MwHC/6nM
   Q==;
X-CSE-ConnectionGUID: 6oxKBhISTqWWaKcoI/jhsg==
X-CSE-MsgGUID: yYc1BqoDTVG2PhJmZFsCpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78167200"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78167200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 15:41:43 -0800
X-CSE-ConnectionGUID: KogLQMSYQVKx/rbD/s9/bA==
X-CSE-MsgGUID: lgSVF/S9RqCB4XdqthLlaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="193895080"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.51]) ([10.245.245.51])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 15:41:40 -0800
Message-ID: <f8ee4a2f-6b95-4f91-9ffc-b7df45464d46@linux.intel.com>
Date: Thu, 4 Dec 2025 01:41:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
To: Forest <forestix@gaga.casa>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
 <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com>
 <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the info and testing, got hung up on some other tasks for a while

On 11/21/25 00:04, Forest wrote:
> On Tue, 18 Nov 2025 11:21:18 +0200, Mathias Nyman wrote:
> 
>> If the bisected patch is the issue then disabling runtime suspend could help.
>> For all usb* roothubs:
>>
>> echo on > /sys/bus/usb/devices/usb*/power/control
>>
>> Does it affect anything?
> 
> Yes. After setting all of those to 'on', I have been unable to
> reproduce the freeze. Tested for nearly 12 hours so far, so I think
> it does avoid the problem. (I'll do some more testing and report
> back if that changes.)
> 
>> Could you share some info about this setup:
> 
...

> 0f:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8] (prog-if 30 [XHCI])
>          Subsystem: ASUSTeK Computer Inc. Device [1043:8877]
>          Flags: fast devsel, IRQ 24, IOMMU group 31
>          Memory at f6e00000 (64-bit, non-prefetchable) [size=1M]
>          Capabilities: [48] Vendor Specific Information: Len=08 <?>
>          Capabilities: [50] Power Management version 3
>          Capabilities: [64] Express Endpoint, IntMsgNum 0
>          Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
>          Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
>          Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
>          Capabilities: [270] Secondary PCI Express
>          Capabilities: [2a0] Access Control Services
>          Capabilities: [410] Physical Layer 16.0 GT/s <?>
>          Capabilities: [450] Lane Margining at the Receiver
>          Kernel driver in use: xhci_hcd
>          Kernel modules: xhci_pci

This looks like a special xhci that only has a usb2 roothub.
Those did cause issues earlier with hub post resume work, but should be fixed now.

> 
>> Enabling usb core and xhci dynamic debug could share some light on this:
>>
>> mount -t debugfs none /sys/kernel/debug
>> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
>> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>> < Reproduce issue >
>> Send output of dmesg
> 
> With these enabled and adb running, dmesg produces a 90-line burst of
> output roughly each second. This generated megabytes of output before
> the freeze happened. Comparing the last three bursts, I found them to
> be identical except for the relative order of a few lines, and the
> timestamps.

Ok, so with this setup we end up running a runtime suspend/resume stress
test that wakes up and suspends the hosts about once a second.

> 
> I was redirecting `dmesg --follow` to a file while watching it in a
> terminal, in hopes that any buffered output that wasn't written
> to the file when the freeze happened would be visible on-screen.
> A photo of the screen showed the same messages as found at the tail
> of the file, but with newer timestamps.
> 
> Here is the last burst of logged messages:
> 
> [ 3516.610664] xhci_hcd 0000:0f:00.0: Setting command ring address to 0xffffe001
> [ 3516.611616] xhci_hcd 0000:0f:00.0: xhci_resume: starting usb7 port polling.
> [ 3516.611619] xhci_hcd 0000:0f:00.0: xhci_hub_status_data: stopping usb7 port polling
> [ 3516.611621] xhci_hcd 0000:0f:00.0: hcd_pci_runtime_resume: 0
> [ 3516.611624] usb usb7: usb auto-resume
> [ 3516.611628] hub 7-0:1.0: hub_resume
> [ 3516.611632] xhci_hcd 0000:0f:00.0: Get port status 7-1 read: 0x2a0, return 0x100
> [ 3516.611689] hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
> [ 3516.611695] hub 7-0:1.0: hub_suspend
> [ 3516.611704] usb usb7: bus auto-suspend, wakeup 1
> [ 3516.611708] xhci_hcd 0000:0f:00.0: xhci_hub_status_data: stopping usb7 port polling
> [ 3516.611712] xhci_hcd 0000:0f:00.0: config port 7-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.611714] xhci_hcd 0000:0f:00.0: xhci_suspend: stopping usb7 port polling.
> [ 3516.611726] xhci_hcd 0000:0f:00.0: Setting command ring address to 0xffffe001
> [ 3516.612681] xhci_hcd 0000:0f:00.0: hcd_pci_runtime_suspend: 0
> [ 3516.622567] xhci_hcd 0000:0e:00.4: Setting command ring address to 0xffffe001
> [ 3516.623346] xhci_hcd 0000:0e:00.4: xhci_resume: starting usb5 port polling.
> [ 3516.623349] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb6 port polling
> [ 3516.623351] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb5 port polling
> [ 3516.623352] xhci_hcd 0000:0e:00.4: hcd_pci_runtime_resume: 0
> [ 3516.623354] usb usb6: usb auto-resume
> [ 3516.623378] hub 6-0:1.0: hub_resume
> [ 3516.650531] xhci_hcd 0000:0e:00.4: Get port status 6-1 read: 0x2a0, return 0x2a0
> [ 3516.650565] xhci_hcd 0000:0e:00.4: Get port status 6-2 read: 0x2a0, return 0x2a0
> [ 3516.650614] usb usb5: usb auto-resume
> [ 3516.650632] hub 5-0:1.0: hub_resume
> [ 3516.650635] xhci_hcd 0000:0e:00.4: Get port status 5-1 read: 0x2a0, return 0x100
> [ 3516.650642] hub 6-0:1.0: state 7 ports 2 chg 0000 evt 0000
> [ 3516.650664] xhci_hcd 0000:0e:00.4: Get port status 5-2 read: 0x2a0, return 0x100
> [ 3516.650689] hub 5-0:1.0: state 7 ports 2 chg 0000 evt 0000
> [ 3516.650697] hub 5-0:1.0: hub_suspend
> [ 3516.650715] usb usb5: bus auto-suspend, wakeup 1
> [ 3516.650733] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb5 port polling
> [ 3516.662574] xhci_hcd 0000:0e:00.3: Setting command ring address to 0xffffe001
> [ 3516.663352] xhci_hcd 0000:0e:00.3: xhci_resume: starting usb3 port polling.
> [ 3516.663355] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb4 port polling
> [ 3516.663357] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb3 port polling
> [ 3516.663358] xhci_hcd 0000:0e:00.3: hcd_pci_runtime_resume: 0
> [ 3516.663360] usb usb4: usb auto-resume
> [ 3516.663383] hub 4-0:1.0: hub_resume
> [ 3516.686531] xhci_hcd 0000:0e:00.3: Get port status 4-1 read: 0x2a0, return 0x2a0
> [ 3516.686560] xhci_hcd 0000:0e:00.3: Get port status 4-2 read: 0x2a0, return 0x2a0
> [ 3516.686588] hub 4-0:1.0: state 7 ports 2 chg 0000 evt 0000
> [ 3516.686616] usb usb3: usb auto-resume
> [ 3516.686637] hub 3-0:1.0: hub_resume
> [ 3516.686640] xhci_hcd 0000:0e:00.3: Get port status 3-1 read: 0x2a0, return 0x100
> [ 3516.686655] xhci_hcd 0000:0e:00.3: Get port status 3-2 read: 0x2a0, return 0x100
> [ 3516.686676] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
> [ 3516.686684] hub 3-0:1.0: hub_suspend
> [ 3516.686704] usb usb3: bus auto-suspend, wakeup 1
> [ 3516.686722] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb3 port polling
> [ 3516.686736] usb usb2: usb auto-resume
> [ 3516.686744] hub 2-0:1.0: hub_resume
> [ 3516.710545] xhci_hcd 0000:0c:00.0: Get port status 2-1 read: 0x2a0, return 0x2a0
> [ 3516.710578] xhci_hcd 0000:0c:00.0: Get port status 2-2 read: 0x2a0, return 0x2a0
> [ 3516.710599] xhci_hcd 0000:0c:00.0: Get port status 2-3 read: 0x2a0, return 0x2a0
> [ 3516.710624] xhci_hcd 0000:0c:00.0: Get port status 2-4 read: 0x2a0, return 0x2a0
> [ 3516.710645] xhci_hcd 0000:0c:00.0: Get port status 2-5 read: 0x2a0, return 0x2a0
> [ 3516.710670] hub 2-0:1.0: state 7 ports 5 chg 0000 evt 0000
> [ 3516.858535] xhci_hcd 0000:0e:00.4: set port remote wake mask, actual port 6-1 status  = 0xe0002a0
> [ 3516.858551] xhci_hcd 0000:0e:00.4: set port remote wake mask, actual port 6-2 status  = 0xe0002a0
> [ 3516.858559] hub 6-0:1.0: hub_suspend
> [ 3516.858567] usb usb6: bus auto-suspend, wakeup 1
> [ 3516.858594] xhci_hcd 0000:0e:00.4: xhci_hub_status_data: stopping usb6 port polling
> [ 3516.858600] xhci_hcd 0000:0e:00.4: config port 6-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.858615] xhci_hcd 0000:0e:00.4: config port 6-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.858636] xhci_hcd 0000:0e:00.4: config port 5-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.858658] xhci_hcd 0000:0e:00.4: config port 5-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.858660] xhci_hcd 0000:0e:00.4: xhci_suspend: stopping usb5 port polling.
> [ 3516.858677] xhci_hcd 0000:0e:00.4: Setting command ring address to 0xffffe001
> [ 3516.859456] xhci_hcd 0000:0e:00.4: hcd_pci_runtime_suspend: 0
> [ 3516.894548] xhci_hcd 0000:0e:00.3: set port remote wake mask, actual port 4-1 status  = 0xe0002a0
> [ 3516.894567] xhci_hcd 0000:0e:00.3: set port remote wake mask, actual port 4-2 status  = 0xe0002a0
> [ 3516.894575] hub 4-0:1.0: hub_suspend
> [ 3516.894582] usb usb4: bus auto-suspend, wakeup 1
> [ 3516.894610] xhci_hcd 0000:0e:00.3: xhci_hub_status_data: stopping usb4 port polling
> [ 3516.894615] xhci_hcd 0000:0e:00.3: config port 4-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.894631] xhci_hcd 0000:0e:00.3: config port 4-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.894653] xhci_hcd 0000:0e:00.3: config port 3-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.894674] xhci_hcd 0000:0e:00.3: config port 3-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
> [ 3516.894676] xhci_hcd 0000:0e:00.3: xhci_suspend: stopping usb3 port polling.
> [ 3516.894693] xhci_hcd 0000:0e:00.3: Setting command ring address to 0xffffe001
> [ 3516.895472] xhci_hcd 0000:0e:00.3: hcd_pci_runtime_suspend: 0
> [ 3516.918537] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-1 status  = 0xe0002a0
> [ 3516.918551] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-2 status  = 0xe0002a0
> [ 3516.918561] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-3 status  = 0xe0002a0
> [ 3516.918569] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-4 status  = 0xe0002a0
> [ 3516.918578] xhci_hcd 0000:0c:00.0: set port remote wake mask, actual port 2-5 status  = 0xe0002a0
> [ 3516.918584] hub 2-0:1.0: hub_suspend
> [ 3516.918591] usb usb2: bus auto-suspend, wakeup 1
> [ 3516.918599] xhci_hcd 0000:0c:00.0: xhci_hub_status_data: stopping usb2 port polling
> 

I can't see anything suspicious in here.
xHCI hosts and their roothubs resume, USB2 roothubs suspend back almost immediately, USB 3 hubs after
200ms of post resume delay. host controller suspend right after that.

Best guess is that something is still messed up with flushing the work.

If possible, could you try with the same usb debugging enabled as last time,
and add HUNG_TASK debugging entries in kernel config:

CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=30
CONFIG_DETECT_HUNG_TASK_BLOCKER=y

And add the following patch to hub driver:

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 256fe8c86828..6863a2feb1d5 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1383,6 +1383,7 @@ static void hub_post_resume(struct work_struct *ws)
  {
  	struct usb_hub *hub = container_of(ws, struct usb_hub, post_resume_work.work);
  
+	dev_err(hub->intfdev, "HUBHANG hub_post_resume()\n");
  	usb_autopm_put_interface_async(to_usb_interface(hub->intfdev));
  	hub_put(hub);
  }
@@ -1395,6 +1396,7 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
  {
  	struct usb_device *hdev = hub->hdev;
  	unsigned long flags;
+	bool flushed;
  	int i;
  
  	/* hub_wq and related activity won't re-trigger */
@@ -1412,7 +1414,11 @@ static void hub_quiesce(struct usb_hub *hub, enum hub_quiescing_type type)
  
  	/* Stop hub_wq and related activity */
  	timer_delete_sync(&hub->irq_urb_retry);
-	flush_delayed_work(&hub->post_resume_work);
+	dev_err(hub->intfdev, "HUBHANG %pS -> hub_quiesce() flush post resume work\n",
+		  __builtin_return_address(0));
+	flushed = flush_delayed_work(&hub->post_resume_work);
+	dev_err(hub->intfdev, "HUBHANG post resume work flush%s\n",
+		  flushed ? "ed" : " not needed");
  	usb_kill_urb(hub->urb);
  	if (hub->has_indicators)
  		cancel_delayed_work_sync(&hub->leds);
@@ -1781,6 +1787,7 @@ static void hub_release(struct kref *kref)
  {
  	struct usb_hub *hub = container_of(kref, struct usb_hub, kref);
  
+	dev_err(hub->intfdev, "hub_release()\n");
  	usb_put_dev(hub->hdev);
  	usb_put_intf(to_usb_interface(hub->intfdev));
  	kfree(hub);
-- 
2.43.0

Thanks
Mathias






