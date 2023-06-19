Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6766CA94D
	for <regressions@lists.linux.dev>; Mon, 19 Jun 2023 08:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A874DC433C8;
	Mon, 19 Jun 2023 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1687164680;
	bh=9tr894bUJPyEle9Z+F67V1kJcNZRBdDZOiDjGqyney4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNxBbN+zNy6zJrESVV4+SnU1w7tUjSxxu6+2fIa0MLE7C+wIESxTdvsSqNIj9OfNg
	 FnWjwq7SAXdmA8VLAthcbSRHuzOuvtyeAiXeRnrsxitTqFoGW2dSVrsp96PmAGFa5N
	 jGkPxwf7lyUnVwmQb2TtZLRuAZSSgjQQfEnyu30Y=
Date: Mon, 19 Jun 2023 10:49:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: JFYI: patches in next that might be good to mainline rather
 sooner than later?
Message-ID: <2023061955-abdominal-refute-4b5a@gregkh>
References: <9e0f5378-63d8-add4-2b79-2173a4c98086@leemhuis.info>
 <24edd13e-791a-bd05-0a44-dd5475c7e200@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24edd13e-791a-bd05-0a44-dd5475c7e200@leemhuis.info>

On Sun, Jun 18, 2023 at 03:40:15PM +0200, Thorsten Leemhuis wrote:
> On 18.06.23 10:49, Thorsten Leemhuis wrote:
> > Hi Linus, hi Greg,
> > 
> > I got the impression that early stable releases with a huge number of
> > patches (like 6.3.2 with ~690 changes) seems to cause a few regressions.
> > As you know, those releases usually contain many backports of changes
> > merged during the merge window for the following mainline release (e.g.
> > 6.4). That made me wonder:
> > 
> > How many patches do we have in linux-next right now that better should
> > be merged this cycle (e.g. ahead of the 6.4 release) instead of merging
> > them in the merge window for 6.5 and backporting them shortly afterwards?
> > 
> > To check I briefly set down and quickly hacked together a python
> > script[1] that looks at linux-next for patches with tags like 'Cc:
> > stable...' and 'Fixes: ', as all respectively some (or many?) of those
> > will be backported. I made the script ignore a few things, like commits
> > from the past eight days and commits that fix changes committed to
> > mainline more that a year ago.
> > 
> > I ran this a few minutes ago and it spilled out about 260 changes (about
> > 80 of them with a stable tag). I put the results into a table:
> > https://docs.google.com/spreadsheets/d/1OnMrde1e7LBMPhOPJL0Sn9rd3W32mTGls_qGMoZS8z8/edit?usp=sharing
> 
> TWIMC, I just updated the data slightly, as I updated the script to also
> look for commits that revert changes from the current mainline cycle.
> 
> Did that while I was preparing this weeks regression report and noticed
> a series of reverts[1] in next where my brain said "hmmm, Andrew merged
> those more than a week ago to mm-hotfixes-unstable and -rc7 is due
> today; I don't see a pr from him and wonder if these revert are
> something that better should be in rc7 to help preventing a rc8?"
> 
> [1] https://lore.kernel.org/all/20230609081518.3039120-1-qi.zheng@linux.dev/
> noticed it via
> https://lore.kernel.org/lkml/ZH6K0McWBeCjaf16@dread.disaster.area/

Having "only" 82 commits that cc: stable is a _HUGE_ decrease, so that's
great to see.  That's a very low % overall from the number of
non-cc-stable commits in the tree, so this feels good to me.

Most of those are tiny stuff, dts fixes, fixes for minor
platforms/drivers, lockdep fixes, and other tiny things that maintainers
probably just don't think worthy of getting into -final now, as long as
they make it into the tree "eventually".  I know it's that way for some
of the commits in my trees that are tagged that way.

The "fixes-only" commits are a bit more interesting, we still have huge
swaths of subsystems that refuse to actually tag commits for stable, but
luckily developers know to at least put a "Fixes:" tag on their fixes,
which help us out in classifying where they should go.

The "reverts" look not so good to me, but it's hard to know if they are
followed up with a "real fix" afterward, which is common at times.

Anyway, thanks for doing this, looks pretty sane to me.

greg k-h
