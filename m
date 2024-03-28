Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC11304AB
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640692; cv=none; b=T621JJHmSRL5KACaUpezlpftaFASBPWi0GP+i3zexT3R8ZfarTqSluvAsQLnhiVhXfDSTzI7iZ9SsEuNA3PUCbKtilmf20LXczHcj3jDp94+qPTKZdoGLYR0Vc0kITDDadcu8fLU/GPhjQxrKQ+0DlU8+Jnnyv4zOsLR6Zc3bH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640692; c=relaxed/simple;
	bh=w6qNLCs+96xNFPGAOcDvwHXVvQZnk84ozCzES21NkFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVxMsHh4Fh3H/yPnawMBo7S0+c+f/3upAd9Y/eu4P/QVswkP+GWVpEqd5OPIwUQdOuGSKxRPKtJAL4vIroc+mYxHICHXE3Q/bx+X7Ym0BJfhvzI9xAuQnmsnkP+Zwxx/+dkKaMUjh3Szw7vi0Pxii2bIKrWMaVsr0BCPXnbVEiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=LzR3vONp; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="LzR3vONp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BA0A148B74A;
	Thu, 28 Mar 2024 16:44:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1711640677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s/r91FUwwJHrHxKsOjkyPhqNpOfWwZ1nY1bTtbZfI1E=;
	b=LzR3vONpuIhWvC9eP78ACQhezktAOEGEy+hLNhll2MoFx4mcq2nohFSX/D07HQS0Mg+oI0
	LkTvxTij+XLRuAm3UmEoPaNID90dbkA6LdT6MtbWS0JM22oy4J80Gvh2NR8BerIKll3dtw
	zF1YMJo0WIAFwYYDpOpy+zs4yLbyTSLAhgrsq5oLNRjcDzUvU0P2A3eGOacI9+fsbU+fJG
	qQk/Gk/TRnyvXXnViS3osUexsmhRjXaIhbQDx0/YrcZyg5PcTY5ipmtF0RPc3biIbcXdqq
	6VYcxWETm0n+Vm8eay7ImwaWftKTnjpda1OH3fgAdw80Os9ds9Aoz03x2/Y5rA==
Date: Thu, 28 Mar 2024 16:44:26 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
	Greg KH <gregkh@linuxfoundation.org>,
	Khazhy Kumykov <khazhy@google.com>,
	USB mailing list <linux-usb@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <20240328-fragment-envoy-f2c5bfa5c4ff@thorsis.com>
Mail-Followup-To: Alexander Dahl <ada@thorsis.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
	Greg KH <gregkh@linuxfoundation.org>,
	Khazhy Kumykov <khazhy@google.com>,
	USB mailing list <linux-usb@vger.kernel.org>,
	regressions@lists.linux.dev
References: <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
 <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
 <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>
 <1b2ccaf6-597c-40fe-877a-4ed1fab5261b@rowland.harvard.edu>
 <3939f491-4890-4a64-9f41-8c3bf738bbc3@sairon.cz>
 <62a33e61-b202-4af5-bb91-96dc87783eb3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62a33e61-b202-4af5-bb91-96dc87783eb3@rowland.harvard.edu>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hei hei,

following this discussion with some kind of curiosity, because I own
such a device and depent on it, but my firmware version does not seem
to be affected.  Remarks below.

Am Wed, Mar 27, 2024 at 10:21:19AM -0400 schrieb Alan Stern:
> On Wed, Mar 27, 2024 at 02:24:34PM +0100, Jan Čermák wrote:
> > Hi Alan,
> > 
> > On 19. 03. 24 17:03, Alan Stern wrote:
> > > Change the HUB_DEBOUNCE_TIMEOUT value to 4500, the HUB_DEBOUNCE_STEP
> > > value to 250 and the HUB_DEBOUNCE_STABLE value to 2000.  That just
> > > might give the device enough time to settle down and start working
> > > before the computer tries using it.
> > 
> > sorry for the delay, I only managed to test it today. You are right, with
> > the timeouts adjusted, it enumerates fine after a while, without any
> > descriptor read errors or anything like that:
> > 
> > [  210.957371] usb 1-1.2: new full-speed USB device number 5 using ehci-pci
> > [  211.037728] usb 1-1.2: New USB device found, idVendor=0658,
> > idProduct=0200, bcdDevice= 0.00
> > [  211.037747] usb 1-1.2: New USB device strings: Mfr=0, Product=0,
> > SerialNumber=0
> > [  211.039764] cdc_acm 1-1.2:1.0: ttyACM0: USB ACM device
> 
> Great!
> 
> > If it's worth anything, usbmon trace is attached below. Anyway, do you have
> > any ideas what could be done to make it work without doing any detrimental
> > changes? I was thinking I'll try to reach out to the vendor at this point -
> > they should be aware their device might stop working with recent kernels,
> > and they could explain the quirky behavior, or implement any changes on the
> > firmware side (if it's even possible).
> 
> The ideal solution would be if the vendor updates the firmware to
> prevent the device from turning on its pull-up (thereby telling the
> host computer that it is connected to the bus) until it is ready to
> operate.  There's no good reason to have that > 1-second period during
> which the device claims to be connected but does not work.

As pointed out in the GitHub ticket already:  Firmware update from a
users point of view is difficult to impossible.  There's no easy "take
the latest firmware" and update and you're done.  It is not clear
which tools are necessary, and even worse there are only certain
combinations of upgrade paths.  For example upgrading to x.z is only
possible from x.x but not from x.y, if I understood it correctly.  And
you don't know if you will brick the device or not.  And I'm speaking
as an embedded developer.  The ordinary home user is probably not even
going to try it.

> Another possible solution, a lot less attractive, would be to change
> the initialization code in the hub driver so that if it sees the
> device disconnect itself from the bus, it restarts the entire
> procedure from the beginning.  You'd end up getting a bunch of error
> messages during the initial non-working period, just as you do now,
> but afterwards the device should be detected and initialized okay.

Is it possible to hook in with some kind of quirk if this device ID is
seen on the bus (and wait longer just for this device), or can you
only access that after successful init?

Greets
Alex

