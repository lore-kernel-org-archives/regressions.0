Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F24430BA4;
	Sun,  1 Mar 2026 21:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400739; cv=none; b=boFVkLNZzRDjcmCKUO7XnAnNCrYVXgg53MoifDCGpEmHsevRY8RqU4H/HMD2vvnbe68ubNmTUW3X+/VBegcb7U6uD0AqJcY1uaFDBmgKVq9i/sBuNgLmMXGRMDDut8PqFfX9aSaQf90YISUspLes5QRHTZDypo6mMQwOVnSiMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400739; c=relaxed/simple;
	bh=1dAbbQkASy+iF1RgByBWu2Hsouor4gV3VbaAofcyyLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcOZIZNtL0en/tP3kuXYESV4O9WJUWdM89nzlaI9SKwVk2gaMbEhFX7uO+x9pj4F24jwaVPHVa9b7SJO6oOo30oscNsZw1hzA3ngQOMl/M+OmWR/3qK52rHAQuYGaiVW4A6ATdFjceuedErqE5hrZ+7u1tog0zUQZndioUrsYu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oKVf+MRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oKVf+MRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF4BC116C6;
	Sun,  1 Mar 2026 21:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772400739;
	bh=1dAbbQkASy+iF1RgByBWu2Hsouor4gV3VbaAofcyyLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKVf+MRk0RCyXfHOCtf57tD7mP9pzfvUz1JjYJEFW+zaIKFCqnDlUFuvDLgBztDHC
	 b5lgKGTCrgPJPdGlvHGD5EvSc+vF02p6TKXK+eYQ/ss8l9Kdg/jrAnMoBB31J+dm4H
	 auRHArmV7MeAiNFwSGByKMasPK2ud0uj4aRj9oX0=
Date: Sun, 1 Mar 2026 16:32:08 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Chris Friesen <chris.friesen@windriver.com>, stable@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: question about automatic backports to -stable branches
Message-ID: <2026030107-jubilant-edge-f5c9@gregkh>
References: <90479cf8-8087-4c8d-8d94-6bd3b885a77c@windriver.com>
 <2026022502-spoilage-drearily-cade@gregkh>
 <8160818d-0138-481d-ba84-e33d7b3845b9@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8160818d-0138-481d-ba84-e33d7b3845b9@leemhuis.info>

On Thu, Feb 26, 2026 at 09:32:45AM +0100, Thorsten Leemhuis wrote:
> On 2/25/26 17:20, Greg KH wrote:
> > On Wed, Feb 25, 2026 at 09:56:12AM -0600, Chris Friesen wrote:
> >>
> >> I'm trying to figure out what the expected process/timeline is for automatic
> >> backports to -stable.
> >>
> >> Commits 2fa119c0e5e5 and a5338e365c45 were merged to mainline on Feb 01,
> >> with the "Cc: stable@vger.kernel.org" in the commit message, but I don't see
> >> either of them backported to either 6.18 or 6.12 -stable branches.
> > For a commit that was made in Dec 16, why did it wait until 7.0-rc1 to
> > be merged?  We treat all of the cc: stable patches that show up in -rc1
> > as "obviously no rush" as that's why they are showing up in -rc1.
> 
> For the Dec 16 commit, I can understand this. But that "all" in the last
> sentence hit a nerve here, as from the regression perspective,
> "obviously no rush" to me feels like the wrong categorization for CCed
> stable fixes between, say, -rc7 and the following -rc1, as quite a few
> of those afaics would benefit from being backported rather earlier than
> later:
> 
> - Fixes that (maybe overly careful) maintainers at the end of a mainline
> cycle queued for the merge window instead of the current cycle; see the
> first example in this recent mail for one like that:
> https://lore.kernel.org/all/b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info/
> 
> - CCed stable fixes for regressions that are found and quickly fixed in
> mainline right after a new mainline release came out without anybody
> telling the stable team to manually pick the fix up soon.
> 
> So wouldn't it be better after a mainline -rc1 to work through the
> possible backports in an order like this:
> 
> 1. Recent CCed stable fixes.
> 2. Older CCed stable fixes.
> 3. Commits with a fixes tag not CCed stable.

Yes, it would be "better", and to be honest, I haven't really thought
about it much.  When staring down 700+ patches to process, it's a bit
hard...

I have done simple scans of "is this fixing a crash" and merged them
first.  After that, it's just by order of when they were merged into
Linus's tree, as I see that feed from the git-commits mailing list.

Trying to figure out dates as to when things are merged is tough, as
dates don't always match up, any suggestions on how to process that in a
way that is "fair"?  Just look at "commit date"?  Or "author date"?

thanks,

greg k-h
