Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B6C0818C1A
	for <regressions@lists.linux.dev>; Wed,  6 Mar 2024 21:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709759285; cv=none; b=ENVlKY690dHnf7XD1eqLFGnbBiCstxdJDNvZ9WDn9Zbkwn+dvlynUB0fLWyCq10uYcpWcWo/6y2jwOQiQJdAEaf/5lPBbt5sbg3whkhyzkJFsQd5j9Txqcj7GdgIRNW/IrMmDbEdb1I4LSWjis51O79R93wo4QSdQE0hqRlvWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709759285; c=relaxed/simple;
	bh=XXbOdt/8dHYV01mKifmZFKHcb/pfCcfFzWLW1L+aVhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4MWEzL4JJZW4Y97bRnS1UqexKG7mkbUNDPFUQjZBCsUoGlYVD4CyI2qUmNpdgh1K9Z+dBwna0+X1isPT7DRjqUiycwHal4/L1cdeHnqMN+cfeBK2GtZuB1J2X80JTyj8Q+zn0t5NvTAlb0RzWkoo1LN9xbKYRvGIFVJAuewcVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 201984 invoked by uid 1000); 6 Mar 2024 16:08:00 -0500
Date: Wed, 6 Mar 2024 16:08:00 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>

On Tue, Mar 05, 2024 at 09:20:22AM +0100, Jan Čermák wrote:
> Hi Alan, Greg, everyone,
> 
> On 04. 08. 23 21:09, Alan Stern wrote:
> > An outstanding syzbot bug report has been traced to a race between the
> > routine that reads in the device descriptor for a device being
> > reinitialized and the routine that writes the descriptors to a sysfs
> > attribute file.  The problem is that reinitializing a device, like
> > initializing it for the first time, stores the device descriptor
> > directly in the usb_device structure, where it may be accessed
> > concurrently as part of sending the descriptors to the sysfs reader.
> 
> I have a suspicion that some of these patches (three from the original
> series, plus the "Fix oversight..." one) introduced a regression we see with
> some USB devices in Home Assistant OS (but in mainstream distro as well, see
> below). In particular it's Z-Wave.me UZB stick (0658:0200), however roughly
> at the time of introduction of these patches, we started to see a few more
> reports of issues with USB devices (in general radios for IoT protocols), so
> I can't rule out it's source of more regressions. For this particular
> device, we have most detailed tracing of the issue, confirming it also
> manifests on mainstream distribution (Debian) which included these patches
> in its kernel. Most issue reports come from RPi 3 but we also got them on
> amd64, and both on HAOS and Debian.
> 
> I'm a layman in terms of the USB stack, so I might be wrong about some
> assumptions, but anyway, the device seemed to always misbehave due to poor
> HW (?) implementation - every time it's plugged into an USB slot, the
> following messages appear:
> 
> [ 1134.073005] usb 1-1.4: new full-speed USB device number 12 using dwc_otg
> [ 1134.153006] usb 1-1.4: device descriptor read/64, error -32
> [ 1134.341003] usb 1-1.4: device descriptor read/64, error -32
> [ 1134.529004] usb 1-1.4: new full-speed USB device number 13 using dwc_otg
> [ 1134.609063] usb 1-1.4: device descriptor read/64, error -32
> [ 1134.797005] usb 1-1.4: device descriptor read/64, error -32
> [ 1134.905181] usb 1-1-port4: attempt power cycle
> 
> However, kernel versions prior to 6.1.52, or 6.1.73 with these patches
> reverted, were able to recover:
> 
> [ 1135.717049] usb 1-1.4: new full-speed USB device number 14 using dwc_otg
> [ 1135.741234] usb 1-1.4: New USB device found, idVendor=0658,
> idProduct=0200, bcdDevice= 0.00
> [ 1135.741275] usb 1-1.4: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [ 1135.743959] cdc_acm 1-1.4:1.0: ttyACM0: USB ACM device
> 
> Without these patches reverted, 6.1.73 goes 2 another rounds of device
> descriptor read errors, and ends with:
> 
> [ 263.705865] usb 1-1-port4: unable to enumerate USB device
> 
> Also it should be noted that it seems that this only happens on USB 2 ports,
> on USB 3/SS ports, the descriptor read errors are "protocol error" instead
> of "broken pipe", and the driver recovers (realizing this, I am now finally
> able to reproduce the issue in my environment):
> 
> [ 38.244292] usb 2-3: new full-speed USB device number 3 using xhci_hcd
> [ 38.372319] usb 2-3: device descriptor read/64, error -71
> [ 38.608317] usb 2-3: device descriptor read/64, error -71
> [ 38.844287] usb 2-3: new full-speed USB device number 4 using xhci_hcd
> [ 38.972317] usb 2-3: device descriptor read/64, error -71
> [ 39.208325] usb 2-3: device descriptor read/64, error -71
> [ 39.316405] usb usb2-port3: attempt power cycle
> [ 39.936295] usb 2-3: new full-speed USB device number 5 using xhci_hcd
> [ 39.957228] usb 2-3: New USB device found, idVendor=0658, idProduct=0200,
> bcdDevice= 0.00
> [ 39.957241] usb 2-3: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [ 39.999591] cdc_acm 2-3:1.0: ttyACM0: USB ACM device
> [ 39.999639] usbcore: registered new interface driver cdc_acm
> [ 39.999641] cdc_acm: USB Abstract Control Model driver for USB modems and
> ISDN adapters
> 
> This is the gist of the problem, more detailed findings can be found in
> reports by @FredrikFornstad in the GH issue [1], who managed to reproduce
> and pinpoint the likely source of the problem.
> 
> Let me know if you need any more details, or if there's something more to
> try, I'll be happy to help with getting this resolved.

Can you provide two usbmon traces, one showing the problem with those 
patches present and the other (on the same system but with the patches 
reverted) showing the recovery?  Comparison of the two should indicate 
what's happening differently.

Alan Stern

PS: I would avoid the Raspberry Pi for this sort of testing, because 
it uses a nonstandard USB host controller driver (dwc-otg) by default.
