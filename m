Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BEB1118
	for <regressions@lists.linux.dev>; Thu, 28 Sep 2023 13:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11F8C433C8;
	Thu, 28 Sep 2023 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695906255;
	bh=JuiGqphlzi+zpVMiN/0CFYkzc2zHSO21pjDawbVduIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BfZdbE/d88ZSxbSf3ugJGDmyLrrX/+qvOAAwh7bNHjAPd9LXdVy5UtL//J3aJHhbO
	 4gWJsnPjPj/WQeWS7+nQ31RBYNyBtR1Fptn7RSRoFQj2WAgAHF4lSBdHyxULh55HgB
	 Pmi4aEk4MtPeP2e8RHDI/ixIEAo10tmifKFDOsXE=
Date: Thu, 28 Sep 2023 15:04:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux regressions report for mainline [2023-09-24]
Message-ID: <2023092846-envy-underpaid-cd36@gregkh>
References: <169557219938.3206394.2779757887621800924@leemhuis.info>
 <2023092522-climatic-commend-8c99@gregkh>
 <0efa9992-c2f8-4ae3-943f-9b17d0e1b1b7@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0efa9992-c2f8-4ae3-943f-9b17d0e1b1b7@leemhuis.info>

On Mon, Sep 25, 2023 at 11:11:51AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 25.09.23 10:02, Greg KH wrote:
> >  I've been
> > traveling all last week and this week for conferences so my response
> > times have been a bit slow, sorry.
> 
> No worries, I already suspected this[1]. The major aspect in this whole
> episode that bugs me a lot is different anyway:
> 
> Wouldn't it have been much much better to revert[2] the culprit quickly
> once it was known to cause a regression that annoyed some users a whole
> lot[3, 4]?

Possibly, yes.  It's a balancing act between keeping the pressure on the
developer to provide a fix, vs. the severity of the issue and how
wide-spread it is, vs. my ability to do anything at all due to
non-development issues (i.e. travel and conference work.)

Trying to pick the best thing with all of those is hard, sometimes we
get it wrong, sometimes we get it wrong, usually someone is upset no
matter what we pick, including a lack of sleep for the maintainer.

So "it's complicated", as you know...

thanks,

greg k-h
