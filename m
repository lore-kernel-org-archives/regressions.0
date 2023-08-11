Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57029187A
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 07:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C85CC433C8;
	Fri, 11 Aug 2023 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691738153;
	bh=XANmocGoF5MvmXVwlaZrC+0leVQYZlMfoH2RyQXKu94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0nc9A7bcksg22MKCjzDkiOdsVEOWIi0JJY01kJ6UlCULXi6/3sk1ok2afyewUied
	 RJuuh+vJzVOhRHHDnEzvzN1p40QG6VAiiqCfOjvD6u2dL2BH4g35eV+gYBjFk6JtSl
	 SWdeNEPdt70XZizIomcMFmeINxK+grfjPJn+qy7c=
Date: Fri, 11 Aug 2023 09:15:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	LKML <linux-kernel@vger.kernel.org>, Kurt Garloff <kurt@garloff.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: Drop 0fc6fea41c71 ("drm/i915: Disable DC states for all
 commits") from the 6.0.y series?
Message-ID: <2023081117-darling-ruined-33b1@gregkh>
References: <f0870e8f-0c66-57fd-f95d-18d014a11939@leemhuis.info>
 <2023080930-overturn-duo-17de@gregkh>
 <a10b911c-dc39-2924-26be-64c7964456ae@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a10b911c-dc39-2924-26be-64c7964456ae@leemhuis.info>

On Thu, Aug 10, 2023 at 01:31:00PM +0200, Thorsten Leemhuis wrote:
> On 09.08.23 11:15, Greg KH wrote:
> > On Mon, Aug 07, 2023 at 12:52:03PM +0200, Thorsten Leemhuis wrote:
> >> Hi Greg! Months ago you picked up mainline commit a2b6e99d8a6
> >> ("drm/i915: Disable DC states for all commits") for the 6.1.23 release
> >> as commit 0fc6fea41c71. It causes issues vor a few people (at least
> >> three, two of which are CCed) -- apparently because it depends on some
> >> change that wasn't picked up for 6.1.y.
> 
> Fun fact: here I had an off-by-one error I noticed and fixed, but...
> 
> >> This is known for a while now,
> >> but nobody has yet found which change that is (Al found something that
> >> worked for him, but that didn't work for others). For the whole story
> >> skim this ticket:
> >>
> >> https://gitlab.freedesktop.org/drm/intel/-/issues/8419
> >>
> >> I wonder if it might be better if you revert that commit for 6.0.y; I
> >> asked already in the ticket if this is likely to cause regressions for
> >> users of 6.0.y,
> 
> ...here I did not. :-/ Sorry.
> 
> >> but got no answer from the i915 devs (or did I miss
> >> something?). :-/
> > 
> > Now reverted (note, 6.0.y is long dead, I reverted this for 6.1.y)
> 
> Thx, but FWIW, seems my timing was bad. I had waited weeks before
> escalating this to you (which looking back now is something I maybe
> should have done earlier -- but first it looked like it was just one
> person/machine affected by this problem). But it seems soon after I
> brought this to your attention a solution came up, as a fix was posted
> and confirmed working by one of the reporters -- and the developer wants
> to post a backport for stable. For details see
> https://gitlab.freedesktop.org/drm/intel/-/issues/8419#note_2035731
> 
> Not sure what's the right thing to do at this point for 6.1.y --
> dropping the revert maybe before you do the release? You will know best
> anyway.

Let me keep the revert, that will fix the issue now.  If upstream wants
to solve this in a different/better way, we can add both patches at once
to prevent any systems from being broken.

thanks,

greg k-h
