Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B163D8C
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 14:00:30 +0000 (UTC)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
	(TLS1.3:TLS_AES_256_GCM_SHA384:256)
	by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pc5CD-000lnn-0r;
	Tue, 14 Mar 2023 14:00:09 +0000
Date: Tue, 14 Mar 2023 14:00:08 +0000
From: Brian Morrison <bdm@fenrir.org.uk>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: USB regression in kernel 6.2.2
Message-ID: <20230314140008.79a90c38@deangelis.fenrir.org.uk>
In-Reply-To: <d5ff9480-57bd-2c39-8b10-988ad0d14a7e@linux.intel.com>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
	<db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
	<20230309200415.118777d2@deangelis.fenrir.org.uk>
	<20230312000316.2955d55a@deangelis.fenrir.org.uk>
	<d5ff9480-57bd-2c39-8b10-988ad0d14a7e@linux.intel.com>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.1git48 (GTK 3.24.37; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett

On Mon, 13 Mar 2023 12:06:59 +0200
Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> 
> In your v6.2 logs the usb bus numbers are interleaved, in the v6.1
> they are not. xhci driver registers two usb buses per host, one
> High-Speed and one SuperSpeed.
> 
> in v6.2:
> 
> [    1.094679] xhci_hcd 0000:00:14.0: new USB bus registered,
> assigned bus number 1 [    1.094695] xhci_hcd 0000:04:00.0: new USB
> bus registered, assigned bus number 2 [    1.096690] xhci_hcd
> 0000:00:14.0: new USB bus registered, assigned bus number 3 [
> 1.100549] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus
> number 4
> 
> in 6.1:
> 
> [    1.071987] xhci_hcd 0000:00:14.0: new USB bus registered,
> assigned bus number 1 [    1.073300] xhci_hcd 0000:00:14.0: new USB
> bus registered, assigned bus number 2 [    1.076445] xhci_hcd
> 0000:04:00.0: new USB bus registered, assigned bus number 3 [
> 1.082133] xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus
> number 4
> 
> 0000:00:14.0 is your Intel xHC
> 0000:04:00.0 is your Renesas xHC
> 
> This change could be due to 6.2 commit:
> 
> 4c2604a9a689 usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS
> 
> Not sure why it would cause this regression, but worth testing it.

I have now reverted the above commit, it's only the one line in
xhci-pci.c and it took a couple of hours to rebuild my kernel rpms which
wasn't too bad.

With this change all of my USB devices are present again and the 3
/dev/ttyUSB* nodes are all present and usable.

I found this in the linux-usb list archives:

https://www.spinics.net/lists/kernel/msg4569289.html

and the first part of this patch series here:

https://www.spinics.net/lists/kernel/msg4569288.html

Should both of these patches be reverted? I assume so but I don't think
I have anything that uses an ehci device to test it.

I know nothing about how this all works other than finding this:

"Note that the end goal is to switch the kernel to use asynchronous
probing by default, so annotating drivers with
PROBE_PREFER_ASYNCHRONOUS is a temporary measure that allows us to
speed up boot process while we are validating the rest of the drivers."

which is at:

https://www.kernel.org/doc/html/v4.14/driver-api/infrastructure.html

so by the looks of it either this driver needs to initialise
synchronously or there is a further problem which causes the bus
ordering to be wrong but it also seems to be a work in progress so I
don't know how this will eventually play out.


> 
> Can you try to revert that commit?
> Or alternatively unbind and rebind the hosts from the xhci driver:
> 
> echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> echo 0000:04:00.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> 
> (all your usb devices should now be disconnected)
> 
> echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/bind
> <wait a couple seconds>
> echo 0000:04:00.0 > /sys/bus/pci/drivers/xhci_hcd/bind

This suggestion only worked on one of the two USB ports, I mention it
only for completeness, the revert above is a 100% fix.

-- 

Brian Morrison

