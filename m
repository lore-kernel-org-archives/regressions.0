Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9E94513E418
	for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713900576; cv=none; b=XEzn/0HFpPCODq8jZ4nDJAa3Tu5bm0N1OoqFxXVdz91H/ofuLOjFzkyd82NDqepCKz9CDcvSSPnWhEHGBkGPqDtp75ic1WfdJXE0fOoa2ey7Mo0belKI6nkv8aIisSvalFWKm39hYJXUU1/h6UV7MSmOxj/n87GIbkh7oOiPxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713900576; c=relaxed/simple;
	bh=xywC62rVQwx51sBx7jZsCY1csXmIOO5SjEwhksUXS+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/mwTLkjVifXltOJZ1ex26gl6y/BW3lfXd7MHwn+oYQaISSYHa23DcyubbZ4wLkoyrYVa5qQOAawHyFKKJopnP1e/MW9gOOpaIbNX6nM1MT8Ff/3vedSAX+za5uE+t+0oTHNDNWqdz11MmSnHlpRA/1/f1EFsXZya1Yd+D6PL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 426141 invoked by uid 1000); 23 Apr 2024 15:29:27 -0400
Date: Tue, 23 Apr 2024 15:29:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
  Oliver Neukum <oneukum@suse.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")
Message-ID: <ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
 <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
 <8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
 <673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
 <8734rdjj4n.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734rdjj4n.wl-tiwai@suse.de>

On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> On Mon, 22 Apr 2024 20:03:46 +0200,
> Alan Stern wrote:
> > 
> > On Mon, Apr 22, 2024 at 07:33:21PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > for once, to make this easily accessible to everyone.
> > > 
> > > Is anyone still working on fixing below regression? From here it looks
> > > stalled, but I might have missed something.
> > 
> > I've been waiting to hear back from Oliver or Takashi.  A revised patch 
> > taking my comments into account would be welcome; it should be a very 
> > small change (just one or two lines of code).
> 
> As posted in another mail, it's a virtualized environment.
> Details are found in the original bug report
>   https://bugzilla.suse.com/show_bug.cgi?id=1220569

Hmmm.  If this is a virtualized device, isn't the best solution to fix the 
emulation code for the device so that it presents a valid descriptor?

> About the patch change: I appreciate if you cook it rather by
> yourself since I'm not 100% sure what you suggested.  I can
> provide the reporter a test kernel with the patch for confirmation, of
> course.

Here's a condensed version of the patch you wrote.  But I would prefer not 
to add this to the kernel if the problem can be fixed somewhere else.

Alan Stern



Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -5110,9 +5110,10 @@ hub_port_init(struct usb_hub *hub, struc
 	}
 	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
 		;	/* Initial ep0 maxpacket guess is right */
-	} else if ((udev->speed == USB_SPEED_FULL ||
+	} else if (((udev->speed == USB_SPEED_FULL ||
 				udev->speed == USB_SPEED_HIGH) &&
-			(i == 8 || i == 16 || i == 32 || i == 64)) {
+			(i == 8 || i == 16 || i == 32 || i == 64)) ||
+			(udev->speed >= USB_SPEED_SUPER && i > 0)) {
 		/* Initial guess is wrong; use the descriptor's value */
 		if (udev->speed == USB_SPEED_FULL)
 			dev_dbg(&udev->dev, "ep0 maxpacket = %d\n", i);

