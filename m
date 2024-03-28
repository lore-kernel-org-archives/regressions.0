Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4638112EBED
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 16:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711642570; cv=none; b=eppPgqgVyLgZPt5te/6SxTzSv5jKVPIu7d1CSvVlU7pMnM8Vz3oppJM2yr89aWhw3fbq/nlWdgTGlIHnqNO20C/P1CsH3P1K0/a06SuWuR90jnIURszm37oCZBcgZa/CwBqiv1PmOpCUatyB3AejvXo9oO+KyECWAWOoQ2E9WWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711642570; c=relaxed/simple;
	bh=WayXfCt51fOj9e3ngoyk9J2ucSskjyn9t2lD/fcCV/k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqvkDXeUkpmk/XZwv7Ax7w98oXizMPha/ASg7kjNYnBT5Kjp1Zw1zxNc60Is6IOPJ6Z4RmhTpGQUsLgdc8rR0sL7FSs9GmjeJhsl0lBCqLorNuTKAm/I8PN9BrsyD3yjmymY7vGw96xITQjnM0vS4m7w8x07DLDRqwp+KZlELdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 964356 invoked by uid 1000); 28 Mar 2024 12:16:06 -0400
Date: Thu, 28 Mar 2024 12:16:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexander Dahl <ada@thorsis.com>,
  Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
  Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <b8aeb235-1f07-4acc-bcf8-0e7344cab291@rowland.harvard.edu>
References: <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
 <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
 <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>
 <1b2ccaf6-597c-40fe-877a-4ed1fab5261b@rowland.harvard.edu>
 <3939f491-4890-4a64-9f41-8c3bf738bbc3@sairon.cz>
 <62a33e61-b202-4af5-bb91-96dc87783eb3@rowland.harvard.edu>
 <20240328-fragment-envoy-f2c5bfa5c4ff@thorsis.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-fragment-envoy-f2c5bfa5c4ff@thorsis.com>

On Thu, Mar 28, 2024 at 04:44:26PM +0100, Alexander Dahl wrote:
> Hei hei,
> 
> following this discussion with some kind of curiosity, because I own
> such a device and depent on it, but my firmware version does not seem
> to be affected.  Remarks below.

> > The ideal solution would be if the vendor updates the firmware to
> > prevent the device from turning on its pull-up (thereby telling the
> > host computer that it is connected to the bus) until it is ready to
> > operate.  There's no good reason to have that > 1-second period during
> > which the device claims to be connected but does not work.
> 
> As pointed out in the GitHub ticket already:  Firmware update from a
> users point of view is difficult to impossible.  There's no easy "take
> the latest firmware" and update and you're done.  It is not clear
> which tools are necessary, and even worse there are only certain
> combinations of upgrade paths.  For example upgrading to x.z is only
> possible from x.x but not from x.y, if I understood it correctly.  And
> you don't know if you will brick the device or not.  And I'm speaking
> as an embedded developer.  The ordinary home user is probably not even
> going to try it.

Oh, okay.  Too bad.  Although in many cases, manufacturers tend not to 
be eager to change their devices' firmwares just to suit Linux users...

> > Another possible solution, a lot less attractive, would be to change
> > the initialization code in the hub driver so that if it sees the
> > device disconnect itself from the bus, it restarts the entire
> > procedure from the beginning.  You'd end up getting a bunch of error
> > messages during the initial non-working period, just as you do now,
> > but afterwards the device should be detected and initialized okay.
> 
> Is it possible to hook in with some kind of quirk if this device ID is
> seen on the bus (and wait longer just for this device), or can you
> only access that after successful init?

The latter, unfortunately.  Before initialization there's no way to 
communicate with the device.

Alan Stern
