Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E5A61651B6
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714397348; cv=none; b=p4E9P/nDepGVxojN7AQs4hrb3kVCiksLEVBNyjweT9no1k7Eusc66uMg+bHuZCT9m3yM9nY24GnDFBcs7fenwl8E+s1xluOhWXxE67zh6dJVpZQBL8lmL5qFMlxAbARNhfkQwFi9xLOavlp7/KVerQOl7jT9euGz29+o3iYAUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714397348; c=relaxed/simple;
	bh=vmPpGBWs9j5Hx2wTEfbYhfsAjW3yI+oF4tQyCWjbx2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkh9MWTuMxSS+7kXdqf6o7FtU17W0TuPS0nPnTxVhZXo13cmWkcE3CnEgWR5BVocSboPPpo4giK9wUtFaA5ze9G+L6TyUZKWX4jS19rrXm2IVXAf9Pb8hUSuCakIGKVGh4qkUCQatckZhEMvMAeD8H4Idb8F77ppD9vkEpHJ5aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 621039 invoked by uid 1000); 29 Apr 2024 09:28:59 -0400
Date: Mon, 29 Apr 2024 09:28:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
  Oliver Neukum <oneukum@suse.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")
Message-ID: <c6989828-975e-430c-9334-06b895d646b7@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
 <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
 <8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
 <673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
 <8734rdjj4n.wl-tiwai@suse.de>
 <ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
 <87bk5zdtqs.wl-tiwai@suse.de>
 <8734r53ond.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734r53ond.wl-tiwai@suse.de>

On Sun, Apr 28, 2024 at 09:57:42AM +0200, Takashi Iwai wrote:
> On Wed, 24 Apr 2024 10:56:11 +0200,
> Takashi Iwai wrote:
> > 
> > On Tue, 23 Apr 2024 21:29:27 +0200,
> > Alan Stern wrote:
> > > 
> > > On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > > > On Mon, 22 Apr 2024 20:03:46 +0200,
> > > > Alan Stern wrote:
> > > > About the patch change: I appreciate if you cook it rather by
> > > > yourself since I'm not 100% sure what you suggested.  I can
> > > > provide the reporter a test kernel with the patch for confirmation, of
> > > > course.
> > > 
> > > Here's a condensed version of the patch you wrote.  But I would prefer not 
> > > to add this to the kernel if the problem can be fixed somewhere else.
> > 
> > Thanks, I asked the report for testing the patch now.
> 
> The reporter confirmed that it's still working.

Can you get a Reported-and-Tested-by: from the reporter?

Alan Stern
