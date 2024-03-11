Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6CD6540873
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168605; cv=none; b=s6fLGIquoeDHODGe1pzQUtxbSm89KmXAq96CR1exdK56Q0pDTYrC2/r3UwWAa+zg9UeZkQLrfoFBrRy4lJwp7Kqn07ZhhShBOM+1JeH9lu6j2CL6F+mEABa2Y7woEZOcbFE8pAYqXsZAcYcx2kbxLBeXLKqEY5q0ZUbZVBEt7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168605; c=relaxed/simple;
	bh=GHnYMe+WEotd44RKk/LUCLleSJ/Soc7ZLvvKc9Wt2lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBiTIMFRhmue4/WQS/gdvF5v1Q7/UCX/BATS1VckbB2ziPi8HjORPQc3b9WtbSyaSjgM9oBJLEVBTvv6Mo/vkm+L2bnJFZDqvqSyhGjTNK8VsLJ+xbegexAmPJMav2TmdBT8kjXrDXQPIxkMDe4YC5Scmn4/5vL1foQCok0/sz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 350621 invoked by uid 1000); 11 Mar 2024 10:43:21 -0400
Date: Mon, 11 Mar 2024 10:43:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>

On Mon, Mar 11, 2024 at 10:58:18AM +0100, Jan Čermák wrote:
> On 07. 03. 24 20:34, Alan Stern wrote:
> > Another thing the traces showed is that the device doesn't like the
> > "new" initialization scheme; it wants the "old" one.  You can test
> > this by setting the old_scheme_first module parameter for usbcore
> > before plugging in the device:
> > 
> > 	echo 1 >/sys/module/usbcore/parameters/old_scheme_first
> > 
> 
> You are right, this indeed works and probing is successful after the
> power-cycling attempt.

Well, at least this means you do have a way of using the device, even
if it is rather awkward.  It might even work on the Raspberry Pi machine.

> > Also, you can try the patch below (without the module parameter set).
> > I suspect it should be applied in any case, but it would be nice to
> > know if it makes any difference in your case.
> > 
> > Index: usb-devel/drivers/usb/core/hub.c
> > ===================================================================
> > --- usb-devel.orig/drivers/usb/core/hub.c
> > +++ usb-devel/drivers/usb/core/hub.c
> > @@ -5481,6 +5481,7 @@ loop:
> >   			msleep(2 * hub_power_on_good_delay(hub));
> >   			usb_hub_set_port_power(hdev, hub, port1, true);
> >   			msleep(hub_power_on_good_delay(hub));
> > +			hub_port_debounce_be_stable(hub, port1);
> >   		}
> >   	}
> >   	if (hub->hdev->parent ||
> 
> Unfortunately, this doesn't fix it. It changes the log output a bit but
> still does not enumerate:
> 
> [  199.295695] usb 1-1.2: new full-speed USB device number 25 using ehci-pci
> [  199.360684] usb 1-1.2: device descriptor read/64, error -32
> [  199.534678] usb 1-1.2: device descriptor read/64, error -32
> [  199.708671] usb 1-1.2: new full-speed USB device number 26 using ehci-pci
> [  199.773666] usb 1-1.2: device descriptor read/64, error -32
> [  199.941602] usb 1-1.2: device descriptor read/64, error -32
> [  200.044871] usb 1-1-port2: attempt power cycle
> [  200.528631] usb 1-1.2: new full-speed USB device number 27 using ehci-pci
> [  200.940603] usb 1-1.2: device not accepting address 27, error -32
> [  201.208592] usb 1-1.2: new full-speed USB device number 28 using ehci-pci
> [  201.223783] usb 1-1.2: device descriptor read/8, error -32
> [  201.345772] usb 1-1.2: device descriptor read/8, error -32
> [  201.452899] usb 1-1-port2: unable to enumerate USB device
> 
> I'm attaching usbmon traces with this patch.

The device is so non-responsive, I'm amazed it ever works at all.
Judging by the usbmon traces, it doesn't look as if it would work on a
Windows system.

Actually, if you have access to a computer running Windows or Mac OSX
and you can try out the device on that computer, it would be good to
get the equivalent of a usbmon trace (something like a Wireshark
capture log would do).  If those systems manage to do something that
Linux doesn't, we ought to know what it is.

Alan Stern
