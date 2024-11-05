Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522221D0E3A;
	Tue,  5 Nov 2024 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800235; cv=none; b=fAoIN97gq5xq2YU7phgcbYoeznVFKvRrENRGT0fqL+ee4rRcsqqtmekjHzFlvuOwiSkKXDj3PlhbL1oBGd9EO8PdfBe342INCDHQfEDQKys8tDrMAcIzotX4w5RP4Ant0RaniOCzBfPcrPtOQuusHzzPrQN3vunH42idVkvLLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800235; c=relaxed/simple;
	bh=TftNWG3NZOI1QG91r58byRtyjKzlyvVq7UW9RASECCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQlw7FPbN2v4wus5X/jUC1OtPJuHeEzVXvd6WrVC6cnx1AC+OhNMwwHqOALvvET16VMnLEvJpC55o7u794A4qViBRNwMkT782fZ3VbiiATbcdIDWkD0OMgYy54HjvmdWPHLi/tq+9qP+DU/QBgq9o4i/I3Nwi2Vak7Q/Jli+0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b8RwmVx5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b8RwmVx5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3763C4CECF;
	Tue,  5 Nov 2024 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730800235;
	bh=TftNWG3NZOI1QG91r58byRtyjKzlyvVq7UW9RASECCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8RwmVx5mhTQwjgxCteUOSH2iftZOsYaeXXdd/YxcHeytYYjdXOML5uHI3vnXco3H
	 AkokpZVaOcrkDI+2Wdk4CqW/CoDMF3DRraydEtkAkuie4bOUWmJaiPfetfng7RRQ52
	 3+z9XimuASfnBGCZe+1wSGpXXSsVZm3eFXuOmDdQ=
Date: Tue, 5 Nov 2024 10:50:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rick Lahaye <rick@581238.xyz>,
	Mario Limonciello <mario.limonciello@amd.com>, Sanath.S@amd.com,
	christian@heusel.eu, fabian@fstab.de, regressions@lists.linux.dev
Subject: Re: [PATCH] thunderbolt: Fix connection issue with Pluggable UD-4VPD
 dock
Message-ID: <2024110532-overdrawn-eggnog-4234@gregkh>
References: <20241105085301.524312-1-mika.westerberg@linux.intel.com>
 <2024110514-unashamed-amenity-6b9c@gregkh>
 <20241105092412.GF275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105092412.GF275077@black.fi.intel.com>

On Tue, Nov 05, 2024 at 11:24:12AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> On Tue, Nov 05, 2024 at 10:17:43AM +0100, Greg KH wrote:
> > On Tue, Nov 05, 2024 at 10:53:01AM +0200, Mika Westerberg wrote:
> > > Rick reported that his Pluggable USB4 dock does not work anymore after
> > > 6.6.28 kernel.
> > > 
> > > It looks like commit c6ca1ac9f472 ("thunderbolt: Increase sideband
> > > access polling delay") makes the device router enumeration happen later
> > > than what might be expected by the dock (although there is no such limit
> > > in the USB4 spec) which probably makes it assume there is something
> > > wrong with the high-speed link and reset it. After the link is reset the
> > > same issue happens again and again.
> > > 
> > > For this reason lower the sideband access delay from 5ms to 1ms. This
> > > seems to work fine according to Rick's testing.
> > > 
> > > Reported-by: Rick Lahaye <rick@581238.xyz>
> > > Closes: https://lore.kernel.org/linux-usb/000f01db247b$d10e1520$732a3f60$@581238.xyz/
> > > Tested-by: Rick Lahaye <rick@581238.xyz>
> > > Fixes: c6ca1ac9f472 ("thunderbolt: Increase sideband access polling delay")
> > 
> > This commit is not in the 6.6.y tree, it only showed up in 6.10.y, so
> > how does this resolve an issue in the 6.6.y tree?
> 
> This refers to a mainline commit that caused the issue. The 6.6.28 is
> the kernel version Rick used where it still worked. In other words, this
> is not a backport of a fix but a fix intented to the mainline ;-) I hope
> this clarifies. I can adjust the commit message if needed.

Ah, yeah, that is confusing so rewording it might be good as the
offending kernel is really 6.10, not 6.6.

Also, do you want me to take this in my tree now when you resend it, or
do you want to send it with other changes later?

thanks,

greg k-h
