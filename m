Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29C10E6
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 00:03:30 +0000 (UTC)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
	(TLS1.3:TLS_AES_256_GCM_SHA384:256)
	by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pb9BF-0003zR-0b;
	Sun, 12 Mar 2023 00:03:17 +0000
Date: Sun, 12 Mar 2023 00:03:16 +0000
From: Brian Morrison <bdm@fenrir.org.uk>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: USB regression in kernel 6.2.2
Message-ID: <20230312000316.2955d55a@deangelis.fenrir.org.uk>
In-Reply-To: <20230309200415.118777d2@deangelis.fenrir.org.uk>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
	<db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
	<20230309200415.118777d2@deangelis.fenrir.org.uk>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.1git47 (GTK 3.24.37; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett

On Thu, 9 Mar 2023 20:04:15 +0000
Brian Morrison <bdm@fenrir.org.uk> wrote:

> On Wed, 8 Mar 2023 17:16:01 +0200
> Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
>  
> > 
> > Looks like that those devices initially enumerated fine, but
> > suddenly disconnect about 19 seconds after boot.
> > 
> > [   19.155556] usb 2-1.1: USB disconnect, device number 4
> > [   19.155685] cp210x ttyUSB0: cp210x converter now disconnected
> > from ttyUSB0 [   19.159290] usb 2-1.4: USB disconnect, device
> > number 6 [   19.242344] usb 2-1.4: 3:0: failed to get current value
> > for ch 0 (-22) [   20.100761] usb 2-4.1: USB disconnect, device
> > number 8 [   20.100894] cp210x ttyUSB1: cp210x converter now
> > disconnected from ttyUSB1 [   20.100999] cp210x 2-4.1:1.0: device
> > disconnected [   20.107188] usb 2-4.2: USB disconnect, device
> > number 9 [   20.107253] cp210x ttyUSB2: cp210x converter now
> > disconnected from ttyUSB2 [   20.107284] cp210x 2-4.2:1.0: device
> > disconnected [   20.111938] usb 2-4.4: USB disconnect, device
> > number 10 [   20.181363] usb 2-4.4: 3:0: failed to get current
> > value for ch 0 (-22)
> > 
> > Interestingly those are all the devices behind external hubs.
> > 
> > Bisecting this to find the offending commit would be best, but a
> > dmesg with xhci and usb core dynamic debug enabled could also show
> > why those devices disconnect.
> > 
> > Adding "usbcore.dyndbg=+p xhci_hcd.dyndbg=+p" to your kernel cmdline
> > should do this.  
> 
> In addition to the debug output I have been looking at the diff
> between kernel-6.1 and kernel-6.2 in the /drivers/usb tree, in
> particular under /drivers/usb/core/hub.h and /drivers/usb/core/hub.c
> where the vendor for this device with VID 0451 is newly listed
> although its PID is not:
> 
> Bus 003 Device 002: ID 0451:2046 Texas Instruments, Inc. TUSB2046 Hub
> 
> this device is missing from lsusb output in kernel 6.2.2 but is
> present with kernel 6.1.*

I was wrong about this, it's the devices on the far side of the TI and
SMSC hub devices that are missing, not the hubs themselves.

> 
> In my inexpert way I think it is all tied in to changes from a few
> months ago (November 2022) that went into the 6.2rc kernels where the
> early_stop capability was added to USB enumeration but I am certainly
> not smart enough to identify exactly why the particular combination of
> hardware I have is caught up in it. I can see from the extended dmesg
> output that certain USB interfaces are unregistered for no obvious
> reason and that once this happens they are invisible to the OS. The
> altered USB core code would seem to be a prime suspect as the cause of
> this regression.
> 

Further testing with kernels 6.1.18 and 6.2.5 is added to the bug entry
here:

https://bugzilla.redhat.com/show_bug.cgi?id=2175534#c12

I don't know how to bisect this with the available Fedora kernels.

-- 

Brian Morrison

