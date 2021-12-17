Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076ED2CA0
	for <regressions@lists.linux.dev>; Fri, 17 Dec 2021 07:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1658C36AE1;
	Fri, 17 Dec 2021 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639725485;
	bh=BrjLuTgwkVDkWW+pLaIC5P4F3wcFgdj61lfKTRq0ik0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=YrOd/9ARbtA/roUUrb9HMhNrACqTMF+ciSKtbnKNtHzmrG5aAgOhNCtJbvnSCd72C
	 Pq32CmAvqdmXD8aFrYHBDhcNuYi/9lJjksfcvjmYTSDM5x7WKjkKWWdvAbGuUUTm1H
	 Ky2Wc4YaXmcf7d5VqFd8gWg9jtDA/6rVnobiBbsg=
Date: Fri, 17 Dec 2021 08:17:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	tlinux@cebula.eu.org, linux-input@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: FWD: Holtek mouse stopped working after kernel upgrade from
 5.15.7 to 5.15.8
Message-ID: <Ybw5puYO2dajw+Iu@kroah.com>
References: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4efbf13-bd8d-0370-629b-6c80c0044b15@leemhuis.info>

On Fri, Dec 17, 2021 at 08:00:10AM +0100, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a bugreport from Tomasz C. (CCed) that sounds a lot like a
> regression between v5.15.7..v5.15.8 and likely better dealt with by email:
> 
> To quote from: https://bugzilla.kernel.org/show_bug.cgi?id=215341
> 
> > After updating kernel from 5.15.7 to 5.15.8 on ArchLinux distribution, Holtek USB mouse stopped working.
> > Exact model:
> > 04d9:a067 Holtek Semiconductor, Inc. USB Gaming Mouse
> > 
> > The dmesg output for this device from kernel version 5.15.8:
> > 
> > [    2.501958] usb 2-1.2.3: new full-speed USB device number 6 using ehci-pci
> > [    2.624369] usb 2-1.2.3: New USB device found, idVendor=04d9, idProduct=a067, bcdDevice= 1.16
> > [    2.624376] usb 2-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [    2.624379] usb 2-1.2.3: Product: USB Gaming Mouse
> > [    2.624382] usb 2-1.2.3: Manufacturer: Holtek
> > 
> > After disconnecting and connecting the USB:
> > 
> > [   71.976731] usb 2-1.2.3: USB disconnect, device number 6
> > [   75.013021] usb 2-1.2.3: new full-speed USB device number 8 using ehci-pci
> > [   75.135865] usb 2-1.2.3: New USB device found, idVendor=04d9, idProduct=a067, bcdDevice= 1.16
> > [   75.135873] usb 2-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [   75.135877] usb 2-1.2.3: Product: USB Gaming Mouse
> > [   75.135880] usb 2-1.2.3: Manufacturer: Holtek
> > 
> > 
> > On kernel version 5.15.7:
> > 
> > [    2.280515] usb 2-1.2.3: new full-speed USB device number 6 using ehci-pci
> > [    2.379777] usb 2-1.2.3: New USB device found, idVendor=04d9, idProduct=a067, bcdDevice= 1.16
> > [    2.379784] usb 2-1.2.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [    2.379787] usb 2-1.2.3: Product: USB Gaming Mouse
> > [    2.379790] usb 2-1.2.3: Manufacturer: Holtek
> > [    2.398578] input: Holtek USB Gaming Mouse as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2.3/2-1.2.3:1.0/0003:04D9:A067.0005/input/input11
> > [    2.450977] holtek_mouse 0003:04D9:A067.0005: input,hidraw4: USB HID v1.10 Keyboard [Holtek USB Gaming Mouse] on usb-0000:00:1d.0-1.2.3/input0
> > [    2.451013] holtek_mouse 0003:04D9:A067.0006: Fixing up report descriptor
> > [    2.452189] input: Holtek USB Gaming Mouse as /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2.3/2-1.2.3:1.1/0003:04D9:A067.0006/input/input12
> > [    2.468510] usb 2-1.2.4: new high-speed USB device number 7 using ehci-pci
> > [    2.503913] holtek_mouse 0003:04D9:A067.0006: input,hiddev96,hidraw5: USB HID v1.10 Mouse [Holtek USB Gaming Mouse] on usb-0000:00:1d.0-1.2.3/input1
> > [    2.504105] holtek_mouse 0003:04D9:A067.0007: hiddev97,hidraw6: USB HID v1.10 Device [Holtek USB Gaming Mouse] on usb-0000:00:1d.0-1.2.3/input2
> > 
> > Rolling back the kernel to version 5.15.7 solves the problem.

Ah, this looks like my HID changes probably broke something here :(

If the person reporting this could run 'git bisect' between these two
kernel versions, to find the offending patch, that would be great!

thanks,

greg k-h
