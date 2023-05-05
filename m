Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4DFC2EF;
	Fri,  5 May 2023 19:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943A5C433D2;
	Fri,  5 May 2023 19:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683315147;
	bh=uIYZDSLkos+kOTYYQ2APOo0jrdAuVxmIhuS9ORUHscA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DkoV+rO6rWjTu8eduoeaimH2kFB1k5WM25kGWtXs76/7hnTGQAZ8gD2OnYDDeM8LD
	 6243wdWcCvo+jjuJ780cirSCz+EWkEELo0D70eOeniKhyMxbpHpM2+6ZkQb9e5ShbF
	 wWHTIITX7lFLSRtaj4kFolEMcm0iw+GEbkixDsBr8gWnce44EK9biBFiBVUs10pEzl
	 nS5uOSqGCV1SUdDNNm+rnFA1Pf+0j2AuwcPIUOfJg7iKjIkdkJWQuZvoy1CYgRnc4Y
	 YABjDLRX2UH+NJ0lw7e7YTcv0HYs/SnG1KYB6uRoSMVOIOqDiSN1ZKnB3mByUsjOwW
	 uZ4oqKmCFwAUg==
Date: Fri, 5 May 2023 12:32:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505123226.731d8ff8@kernel.org>
In-Reply-To: <20230505-lent-swoosh-4897e2@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
	<20230505085218.60c62d75@kernel.org>
	<20230505-lent-swoosh-4897e2@meerkat>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 5 May 2023 15:12:02 -0400 Konstantin Ryabitsev wrote:
> On Fri, May 05, 2023 at 08:52:18AM -0700, Jakub Kicinski wrote:
> > > Per our discussion last fall, I've been working on a bridge between bugzilla
> > > and public-inbox, which went live in the past few days. It's still a very
> > > early release, but it can do the following:  
> > 
> > What about closing the bugs once they had been fixed/triaged/proven
> > invalid?  
> 
> For now, bugbot can look at a branch in a git repo and close bugs when it sees
> a matching "Closes:" trailer.

Interesting. Obviously that assumes the bug needs a fix, and we're
talking bugzilla so lots of clueless people lobbing non-issues at us.

But also - Closes: is a legit trailer now? I thought we only allow Link:

In any case - I'm guessing I just don't have permissions to close the
issues via web. Is your preference to iterate on the bot or maintainers
to request permissions in BZ (how?)?
