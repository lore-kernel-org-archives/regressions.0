Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 8369315E209
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970615; cv=none; b=RVa9Ne5N9uVAqChhTx/v6EBH/TOR5lnO+gAinCWMrljNKqNISXTGKZOar1aQLdOjJh2mVgab6A4JvyhtYqISxh3Yu9AgQ4qZ6DB2E/FIRcDqbE2PaKH0IhaIcLQ09V9j6NzsrQso+PF0Hq+Vk3wIlkmnY6gfjIIXrpIm1Iv24GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970615; c=relaxed/simple;
	bh=XNV80uPOuS9+EYqSvRuDMGz6eES0Lut2HB3MXM1J9AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl4mtCKF4Rq/7X2rU8ae1FzIullBbcofFwFAVgTfvqLqlHruE4poELUKqEpArdF9cuP1K3Ie8xExHD4eEyqhawTNS/CsQKO0jSTFfoNEdqXFkATm5CGVOhy2G25DYnWzQwq+tcRidq8HvdqqqIN3LjVuU+qMfWp+W5S69QV5gXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 453540 invoked by uid 1000); 24 Apr 2024 10:56:53 -0400
Date: Wed, 24 Apr 2024 10:56:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
  Oliver Neukum <oneukum@suse.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")
Message-ID: <5744adbf-c6ab-454e-bcd7-33a7ca85bf7c@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
 <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
 <8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
 <673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
 <8734rdjj4n.wl-tiwai@suse.de>
 <ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
 <87bk5zdtqs.wl-tiwai@suse.de>
 <bb7f94de-d520-4995-bb95-f3188be55f03@rowland.harvard.edu>
 <87a5lidemj.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5lidemj.wl-tiwai@suse.de>

On Wed, Apr 24, 2024 at 04:22:44PM +0200, Takashi Iwai wrote:
> On Wed, 24 Apr 2024 16:14:23 +0200,
> Alan Stern wrote:
> > 
> > On Wed, Apr 24, 2024 at 10:56:11AM +0200, Takashi Iwai wrote:
> > > On Tue, 23 Apr 2024 21:29:27 +0200,
> > > Alan Stern wrote:
> > > > 
> > > > On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > > > > As posted in another mail, it's a virtualized environment.
> > > > > Details are found in the original bug report
> > > > >   https://bugzilla.suse.com/show_bug.cgi?id=1220569
> > > > 
> > > > Hmmm.  If this is a virtualized device, isn't the best solution to fix the 
> > > > emulation code for the device so that it presents a valid descriptor?
> > > 
> > > Honestly speaking, I don't know, but it smells like a hard way.  After
> > > all, we brought some regression of the previously (even casually /
> > > unintended) working "device"...
> > 
> > Still, it would be good to report the incorrect descriptor to the package's 
> > maintainer.
> 
> Well, it's no Linux package.

Doesn't matter.  Bugs should always be reported when possible, for any kind 
of package.  Especially after you spent so much time and effort to track 
this one down.

The fact that xz isn't specifically a Windows package didn't prevent Andres 
Freund from reporting the recent backdoor problem.

Alan Stern
