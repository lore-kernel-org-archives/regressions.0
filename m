Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 48DF1158DDD
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713968067; cv=none; b=Zjw66E+Gvmma2xRshRO0zavDiFcIYPR+t60qb6ApyJIjhfdA+OJ1BsKB/iy/wOior+MBCk9JBpp+KMX9hxGvrpjpbGhYBG3hfZ+TOKnwrMF0prlJTnY9PO/JU3EYN4YERiKa3MQz96eVJ6brgfXfC61TwW7SFAugL5rCdzh4Q4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713968067; c=relaxed/simple;
	bh=ARsPWOAXI7AWEWUwDIppIN+H+XnETFvup6KpEyBjgQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv8LDvVGjsvvnz/csyhLKzGmXXBKyIy/fOaoCUoj7W0VVvVqY/i+vHQLSJbbM3ozJBmK6g0cGlog4cy1fzwUzos2Y5zIdfVPDmt7PflfmFmwtL5Www94NgYBp+KotrqObGBVZ0C33Ets6uONBJ/tEIFtOJLlyDdBAWDmRD7pqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 451839 invoked by uid 1000); 24 Apr 2024 10:14:23 -0400
Date: Wed, 24 Apr 2024 10:14:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
  Oliver Neukum <oneukum@suse.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")
Message-ID: <bb7f94de-d520-4995-bb95-f3188be55f03@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
 <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
 <8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
 <673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
 <8734rdjj4n.wl-tiwai@suse.de>
 <ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
 <87bk5zdtqs.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk5zdtqs.wl-tiwai@suse.de>

On Wed, Apr 24, 2024 at 10:56:11AM +0200, Takashi Iwai wrote:
> On Tue, 23 Apr 2024 21:29:27 +0200,
> Alan Stern wrote:
> > 
> > On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > > As posted in another mail, it's a virtualized environment.
> > > Details are found in the original bug report
> > >   https://bugzilla.suse.com/show_bug.cgi?id=1220569
> > 
> > Hmmm.  If this is a virtualized device, isn't the best solution to fix the 
> > emulation code for the device so that it presents a valid descriptor?
> 
> Honestly speaking, I don't know, but it smells like a hard way.  After
> all, we brought some regression of the previously (even casually /
> unintended) working "device"...

Still, it would be good to report the incorrect descriptor to the package's 
maintainer.

Alan Stern
