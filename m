Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DC11DFFB
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713813859; cv=none; b=LP1f6tNT5nrKae0pAMRuLi/uZkH8L7iOqNh+iLZ1pNrYYFH8RDXWFc1Ot5sWGrOW9W655vVdLiUcALkcWGcbRQG1b4q/B6708LOHoqcCbl2CxL2c+QEkAyr26IHi2OiIgrmWvpJ02Oy0XsHSABgMeHP5nmnJy53cnL5SQFSGqF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713813859; c=relaxed/simple;
	bh=lMRoPxTzvUSQsod+HsYds0B9mvrnETl3lI3A34Dnhc8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RlL/rnSlCLjkvZnHJ00Ry8IBfDfUBTrdn31K/dn6SX9hKYPW3BdRYMC05ssi0Z7D6lEgeg0AsPJjlnIo5Y/hb/Lxf2wl7xGY6I3bBgT+PjVaFR0wv+/VkhMVww/pfgNxiuRE/sIVniRxzoLDcH5QQkE6u5PP0MhPUI1lbQty3WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IGZpn6Dx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IFq2jaPP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IGZpn6Dx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IFq2jaPP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IGZpn6Dx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IFq2jaPP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IGZpn6Dx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IFq2jaPP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7EAB15D4FA;
	Mon, 22 Apr 2024 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713813855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s0v/cnsA7bLqu9f1/FaCARuDQPv0O+u+bHuPG79H3JM=;
	b=IGZpn6DxzQxVG8nDp5ypdRMwWmQyHLdcH/dTU3Y+FrGCo9gzq+gUSeMU3W0lIHglnGUGkc
	5j7MM0QFDqmBlDDOCTMZ+wU07CsUwm+IlnHaQnLHFR2vT2EJUMfgCvwNA4OajaxSatos/7
	xjXhcVYyK9c1uwgkqkxssCb3BMlK14I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713813855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s0v/cnsA7bLqu9f1/FaCARuDQPv0O+u+bHuPG79H3JM=;
	b=IFq2jaPPH85IRFc2BMlZz7fECfpKWmLqR6q5IuEhNswt5jv60jo+Wzb9FGlvLdGbVCEU3s
	Za90KjPaUEkaZ5AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713813855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s0v/cnsA7bLqu9f1/FaCARuDQPv0O+u+bHuPG79H3JM=;
	b=IGZpn6DxzQxVG8nDp5ypdRMwWmQyHLdcH/dTU3Y+FrGCo9gzq+gUSeMU3W0lIHglnGUGkc
	5j7MM0QFDqmBlDDOCTMZ+wU07CsUwm+IlnHaQnLHFR2vT2EJUMfgCvwNA4OajaxSatos/7
	xjXhcVYyK9c1uwgkqkxssCb3BMlK14I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713813855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s0v/cnsA7bLqu9f1/FaCARuDQPv0O+u+bHuPG79H3JM=;
	b=IFq2jaPPH85IRFc2BMlZz7fECfpKWmLqR6q5IuEhNswt5jv60jo+Wzb9FGlvLdGbVCEU3s
	Za90KjPaUEkaZ5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EF6E136ED;
	Mon, 22 Apr 2024 19:24:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A8rbFV+5JmYPPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Apr 2024 19:24:15 +0000
Date: Mon, 22 Apr 2024 21:24:24 +0200
Message-ID: <8734rdjj4n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Oliver Neukum <oneukum@suse.com>,
	USB list <linux-usb@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
In-Reply-To: <673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
	<78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
	<8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
	<673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Mon, 22 Apr 2024 20:03:46 +0200,
Alan Stern wrote:
> 
> On Mon, Apr 22, 2024 at 07:33:21PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> > 
> > Is anyone still working on fixing below regression? From here it looks
> > stalled, but I might have missed something.
> 
> I've been waiting to hear back from Oliver or Takashi.  A revised patch 
> taking my comments into account would be welcome; it should be a very 
> small change (just one or two lines of code).

As posted in another mail, it's a virtualized environment.
Details are found in the original bug report
  https://bugzilla.suse.com/show_bug.cgi?id=1220569

About the patch change: I appreciate if you cook it rather by
yourself since I'm not 100% sure what you suggested.  I can
provide the reporter a test kernel with the patch for confirmation, of
course.


thanks,

Takashi

> 
> Alan Stern
> 
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> > 
> > #regzbot poke
> > 
> > On 09.04.24 16:56, Alan Stern wrote:
> > > On Tue, Apr 09, 2024 at 03:49:01PM +0200, Oliver Neukum wrote:
> > >> Hi,
> > >>
> > >> with the following device:
> > >>
> > >> Bus 002 Device 002: ID fb5d:0001 BHYVE HID Tablet
> > >> Device Descriptor:
> > >>   bLength                18
> > >>   bDescriptorType         1
> > >>   bcdUSB               3.00
> > >>   bDeviceClass            0
> > >>   bDeviceSubClass         0
> > >>   bDeviceProtocol         0
> > >>   bMaxPacketSize0         8
> > > 
> > > A USB-3 device, running at SuperSpeed with its bMaxPacketSize0 set to 8 
> > > instead of 9?  Presumably this thing never received a USB certification.  
> > > Does the packaging use the USB logo?
> > > 
> > >>   idVendor           0xfb5d
> > >>   idProduct          0x0001
> > >>   bcdDevice            0.00
> > >>   iManufacturer           1 BHYVE
> > >>   iProduct                2 HID Tablet
> > >>   iSerial                 3 01
> > >>   bNumConfigurations      1
> > > 
> > > Why on earth would an HID tablet need to run at SuperSpeed?
> > > 
> > >> Binary Object Store Descriptor:
> > >>   bLength                 5
> > >>   bDescriptorType        15
> > >>   wTotalLength       0x000f
> > >>   bNumDeviceCaps          1
> > >>   SuperSpeed USB Device Capability:
> > >>     bLength                10
> > >>     bDescriptorType        16
> > >>     bDevCapabilityType      3
> > >>     bmAttributes         0x00
> > >>     wSpeedsSupported   0x0008
> > >>       Device can operate at SuperSpeed (5Gbps)
> > >>     bFunctionalitySupport   3
> > >>       Lowest fully-functional device speed is SuperSpeed (5Gbps)
> > >>     bU1DevExitLat          10 micro seconds
> > >>     bU2DevExitLat          32 micro seconds
> > > 
> > > A tablet not capable of running at any speed below 5 Gbps?
> > > 
> > >> we are getting a regression on enumeration. It used to work with the
> > >> code prior to your patch. Takashi is proposing the attached fixed.
> > >> It looks like we are a bit too restrictive and should just try.
> > >>
> > >> 	Regards
> > >> 		Oliver
> > > 
> > >> From: Takashi Iwai <tiwai@suse.de>
> > >> Subject: [PATCH] USB: hub: Workaround for buggy max packet size with super
> > >>  speed
> > >> Patch-mainline: Not yet, testing
> > >> References: bsc#1220569
> > >>
> > >> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > >>
> > >> ---
> > >>  drivers/usb/core/hub.c | 13 ++++++++++---
> > >>  1 file changed, 10 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > >> index e38a4124f610..64193effc456 100644
> > >> --- a/drivers/usb/core/hub.c
> > >> +++ b/drivers/usb/core/hub.c
> > >> @@ -4830,7 +4830,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> > >>  	const char		*driver_name;
> > >>  	bool			do_new_scheme;
> > >>  	const bool		initial = !dev_descr;
> > >> -	int			maxp0;
> > >> +	int			maxp0, ep0_maxp;
> > >>  	struct usb_device_descriptor	*buf, *descr;
> > >>  
> > >>  	buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
> > >> @@ -5070,7 +5070,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> > >>  		else
> > >>  			i = 0;		/* Invalid */
> > >>  	}
> > >> -	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
> > >> +	ep0_maxp = usb_endpoint_maxp(&udev->ep0.desc);
> > >> +	if (ep0_maxp == i) {
> > > 
> > > This variable looks like it was left over from earlier testing.  It's 
> > > not really needed.
> > > 
> > >>  		;	/* Initial ep0 maxpacket guess is right */
> > >>  	} else if ((udev->speed == USB_SPEED_FULL ||
> > >>  				udev->speed == USB_SPEED_HIGH) &&
> > >> @@ -5082,9 +5083,15 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> > >>  			dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
> > >>  		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
> > >>  		usb_ep0_reinit(udev);
> > >> +	} else if (udev->speed >= USB_SPEED_SUPER && initial) {
> > >> +		/* FIXME: should be more restrictive? */
> > >> +		/* Initial guess is wrong; use the descriptor's value */
> > >> +		dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
> > >> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
> > >> +		usb_ep0_reinit(udev);
> > > 
> > > This could be merged with the previous case fairly easily.
> > > 
> > >>  	} else {
> > >>  		/* Initial guess is wrong and descriptor's value is invalid */
> > >> -		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", maxp0);
> > >> +		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d, expected %d\n", maxp0, ep0_maxp);
> > > 
> > > This also looks like a remnant from earlier testing.
> > > 
> > > Alan Stern
> > > 
> > >>  		retval = -EMSGSIZE;
> > >>  		goto fail;
> > >>  	}
> > >> -- 
> > >> 2.35.3
> > >>
> > > 
> > 
