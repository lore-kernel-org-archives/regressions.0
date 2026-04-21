Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78935979;
	Tue, 21 Apr 2026 06:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753711; cv=none; b=alVNZ4lZF6oJ/HEWMSqG3IKNiC4sdNde3wQm7L9oiIpDivymQnPfhPUbokiA7cUSOhPqj+Cm8RLO59ilYZv5nwIGODF9ASz4TyZLgmmXBdQ5m+yfUCGosN+ALMYk3EAX2RCkwr/M9cWLNFdvbFoudtpEvWMRLmBlp6G2PUkmync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753711; c=relaxed/simple;
	bh=+ipSU820E6LpVopDoZIXdrJ6aRl4Cc2ecFHSCrYZhIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqsO0SehWk6nsm+FxBTPqqTMye+p8ytXzfCnK7k9ZbUvdc4QKyg8r5ABY2a8kdSlA4My7FW1diiAt56W+wOmI38prVEF4S2vZmW4JCdISdEu644yMrj/jObVHQ/kxpwnz5KNUSL/A7OtANDI/iD2EuWPGgBLx6RMgnTYQPfOsa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sdjwREFw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sdjwREFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21120C2BCB0;
	Tue, 21 Apr 2026 06:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776753710;
	bh=+ipSU820E6LpVopDoZIXdrJ6aRl4Cc2ecFHSCrYZhIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdjwREFw2an5QQZlS3EW2H8NwKUXUmAnrVu/OEniFOC6pX/d6xDDXCc5+5sZz8dtx
	 y9FXodmXeoCREADn1JRJ67Rl+BgcrZlNSlZDxiMDqtbQlANGW8Jv0/oX8j0o1941NW
	 Dxumj9d+PEALnYqx08QqX8x6fJGoGEUiu8cIVjAI=
Date: Tue, 21 Apr 2026 08:41:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Hanabishi <i.r.e.c.c.a.k.u.n+kernel.org@gmail.com>,
	Eric Naim <dnaim@cachyos.org>, stable@vger.kernel.org,
	linux-tip-commits@vger.kernel.org, x86@kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [tip: timers/urgent] clockevents: Add missing resets of the
 next_event_forced flag
Message-ID: <2026042110-surpass-petite-9551@gregkh>
References: <87340xfeje.ffs@tglx>
 <177636758252.1323100.5283878386670888513.tip-bot2@tip-bot2>
 <5cbb14d8-46f9-4197-917f-51da852d7500@leemhuis.info>
 <87mrywdeen.ffs@tglx>
 <bbf8cc92-9ce1-4579-85ac-f90aca4d7858@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf8cc92-9ce1-4579-85ac-f90aca4d7858@leemhuis.info>

On Tue, Apr 21, 2026 at 08:26:35AM +0200, Thorsten Leemhuis wrote:
> On 4/21/26 08:18, Thomas Gleixner wrote:
> > On Sun, Apr 19 2026 at 17:11, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 4/16/26 21:26, tip-bot2 for Thomas Gleixner wrote:
> >>> The following commit has been merged into the timers/urgent branch of tip:
> >>>
> >>> Commit-ID:     4096fd0e8eaea13ebe5206700b33f49635ae18e5
> >>> Gitweb:        https://git.kernel.org/tip/4096fd0e8eaea13ebe5206700b33f49635ae18e5
> >>> Author:        Thomas Gleixner <tglx@kernel.org>
> >>> AuthorDate:    Tue, 14 Apr 2026 22:55:01 +02:00
> >>> Committer:     Thomas Gleixner <tglx@kernel.org>
> >>> CommitterDate: Thu, 16 Apr 2026 21:22:04 +02:00
> >>>
> >>> clockevents: Add missing resets of the next_event_forced flag
> >>
> >> Just wondering: what's the plan to mainline this? I wonder if this is
> >> worth mainlining rather quickly and the tell the stable team right
> >> afterwards to queue it up for 7.0.1, as in addition to the two affected
> >> people in this thread (one of which stated that "several users from
> >> CachyOS reported this regression as well") I noticed three more 7.0 bug
> >> reports in the past few days that likely are fixed by the quoted patch:
> > 
> > It's in Linus tree and I asked the stable folks to withhold the original
> > patch which it fixes, so they can queue both at once.
> 
> Yeah, I noticed, and many thx! Also many thx for planning the backport,
> this is great. But that "original patch" is already in 7.0, which makes
> me wonder:
> 
> Should we ask Greg (now CCed) to include a backport (once it exists) for
> 7.0.1, even if that is in testing already and might mean that this needs
> another stable-rc or delayed? Because in addition to those three reports
> I mentioned earlier I noticed one more today:
> https://bugzilla.kernel.org/show_bug.cgi?id=221377
> 
> And maybe this is the same issue, too:
> https://bugzilla.kernel.org/show_bug.cgi?id=221388
> 
> IOW: quite a few people are hitting this.

I've already dropped this from all of the other stable queues.  If you
want me to pick up something from linux-next now, for 7.0.1, I'll be
glad to do so, just let me know.

thanks,

greg k-h
