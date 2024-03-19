Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E08C181AC1
	for <regressions@lists.linux.dev>; Tue, 19 Mar 2024 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864220; cv=none; b=om1GkXK6Pj24NV62+ox65OieIj97Eao5YJunhwOOEPpCuBc+HzsNcF66oHbXXYoe5OrYysjfa3j3k6vVV18jjGfMeKCwGCd10wL1gHBYmwBO/Ue2qfVNw5htukO/Shpknn0XqvoLamtyo3qgzVeeRGj7vf8z/6sPs62Ld9/aIbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864220; c=relaxed/simple;
	bh=GfaLZGMTz9cmq4flbeIofGJbdiKDWXVWn45A7/cEDbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXUGoe1U8/L8d4iFhv6YPzODGMVJNBrqOa5wE9hrb7kK6eOGelEvJJS+PIG7TM+UlCPXZXbwTEP6FZIgEEA0DeBDINaF1XrkQ+/vnerG7781FPa4TvJ3J1yP4ZoCbgAfOb2k1qZRYOPsfNOrF6kLtnjiNXswxgRC50ngvDy3wHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 625704 invoked by uid 1000); 19 Mar 2024 12:03:30 -0400
Date: Tue, 19 Mar 2024 12:03:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
  USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Message-ID: <1b2ccaf6-597c-40fe-877a-4ed1fab5261b@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
 <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
 <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>

On Tue, Mar 19, 2024 at 12:54:37PM +0100, Jan Čermák wrote:
> Hello Alan,
> 
> On 16. 03. 24 21:35, Alan Stern wrote:
> > Below is a patch meant to get the number of resets back to what it
> > should be.  I'd appreciate it if you can test this, and report the
> > kernel log output along with the usbmon output for the normal case and
> > also with the "old_scheme_first" parameter set.
> > 
> > I'm not very hopeful that this will solve the problem, but there's a
> > good chance it will help point us in the right direction by removing
> > extraneous complications.
> 
> unfortunately you were right, the problem is still unresolved with your
> patch. I hope the traces will provide some new insights then.

I get the strong impression that this device just takes a long time to
initialize when it is plugged in.  A lot longer than the current
debounce time of 150 ms -- more like 2000 ms!  The usbmon traces show
the device disconnecting and reconnecting about 1500 ms after it is
first plugged in, and then it starts working about 300-400 ms later.

Try doing this: Keep the patch applied, but make the following changes
in addition.  In drivers/usb/core/hub.c, around line 128 the code says:

#define HUB_DEBOUNCE_TIMEOUT	2000
#define HUB_DEBOUNCE_STEP	  25
#define HUB_DEBOUNCE_STABLE	 100

Change the HUB_DEBOUNCE_TIMEOUT value to 4500, the HUB_DEBOUNCE_STEP
value to 250 and the HUB_DEBOUNCE_STABLE value to 2000.  That just
might give the device enough time to settle down and start working
before the computer tries using it.

This is not something we would want to do for ordinary kernels; it
would cause new USB devices to be ignored for more than 2 seconds
after they are plugged in, which would annoy many people.  But if my
theory is right, it may be what your device needs.

Alan Stern
