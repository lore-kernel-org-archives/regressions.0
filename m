Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352BEBE0
	for <regressions@lists.linux.dev>; Fri, 18 Nov 2022 23:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F10C433D7;
	Fri, 18 Nov 2022 23:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668813690;
	bh=yq4XAD6qbEKFHEDjO0C0tq5Twf+Stcvxb7JwJYeanAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9HFfJIPaBKxGk4Co8pZ6E3sHfINVr02Vr2NTmWOL6vQ5byFsFAcjSwPZtUiyeyC8
	 X4VEk+HNQgMMau6kaMq4BDhd0ZB0AxPg3FalGeTq1wQWbecyim2nKlxRknUpzXi065
	 z8+jqsxvMCf1xjaFPnHETHbuwaqq4bsTPlDsQVJE+66pwHOL3sXwXMAQw44SyP9Ktl
	 s0kXLqwr+kM6TVD9fgUs+g073nrVCkd9Oq2yG6Kw9YigmGWOPlQGmrrxT+Q+chWoa+
	 mRfKoafpAKraFlhhVEwMgwDkMZe42hkLQWyKBo5GWqFWrtIP6cDmQV7E/TsRUs0Aej
	 +xmu+yOsGs1pg==
Date: Fri, 18 Nov 2022 23:21:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ivan Smirnov <isgsmirnov@gmail.com>,
	"Neftin, Sasha" <sasha.neftin@intel.com>,
	"Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	"Ruinskiy, Dima" <dima.ruinskiy@intel.com>,
	"Avivi, Amir" <amir.avivi@intel.com>, regressions@lists.linux.dev
Subject: Re: [Intel-wired-lan] igc kernel module crashes on new hardware
 (Intel Ethernet I225-V)
Message-ID: <Y3gTdsg4l71L0vz9@spud>
References: <CAPAtJa_o5q-sU+AD=G3y43H_5pBKnOZTQGXM99uszPXNkn8Z9A@mail.gmail.com>
 <20221031170535.77be0eb5@kernel.org>
 <03f7dc73-3e7c-1e6d-275f-85539493cd7f@intel.com>
 <CAPAtJa8qupPZZ0AiMWSxNKSd-WMg0MQDQeZcCO_Z-GGBu3jZCg@mail.gmail.com>
 <CAPAtJa_-yMusW5-C3BDivMu=MOyfKF9VQkxQotX3L_P+Q48oMA@mail.gmail.com>
 <CAPAtJa_nL5edyiN61ghXZxVUSDBFQQR3uiYJM0uo9mEao=RC0w@mail.gmail.com>
 <CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>
 <Y3gKkYeijrAIhxjc@spud>
 <20221118145443.427ecf10@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118145443.427ecf10@kernel.org>

On Fri, Nov 18, 2022 at 02:54:43PM -0800, Jakub Kicinski wrote:
> On Fri, 18 Nov 2022 22:43:29 +0000 Conor Dooley wrote:
> > > Is there any update for the community? More and more folks are asking. We
> > > are all techies and happy to help debug.  
> > 
> > Vested interest since I am suffering from the same issue (X670E-F
> > Gaming), but is it okay to add this to regzbot? Not sure whether it
> > counts as a regression or not since it's new hw with the existing driver,
> > but this seems to be falling through the cracks without a response for
> > several weeks.
> 
> Dunno, Thorsten's will decide. The line has to be drawn somewhere
> on "vendor doesn't care about Linux support" vs "we broke uAPI".
> This is the kind of situation I was alluding to in my line of
> questioning at the maintainer summit: https://lwn.net/Articles/908324/

Yeah & it is /regression/ tracking which I don't (or rather didn't)
consider this situation to be. I'm generally a little unsure as to when
I should trigger regzbot in general:
- immediately when I find something?
- only if it goes a while with nothing constructive?
- is it okay to use it outside of "this used to work and now doesnt"?

Either way, but I did some more googling and found this reddit thread:
https://www.reddit.com/r/intel/comments/lqb4km/for_people_having_i225v_connection_issues/

That's being reported against windows & I dunno if the dude is using
firmware and driver interchangeably etc. But the disabling power saving
etc sounds oddly like the issue we have here, since that was a proposed
workaround in Ivan's 2022 reddit thread.

Supposedly I am on firmware-version 1082:8770, but /I/ I have no idea
how that corresponds to windows versioning. That may lend some credence
to your assertion about firmware being the source of many issues.

> Finding a kernel release which does not suffer from the problem
> would certainly strengthen your case.

Aye, likely to be a little difficult to do a meaningful bisection for
me at least, since the motherboard I have with the problem is an AM5
one for the new Zen4 stuff. I'm not an x86 person, so not entirely
sure when that support landed. I may do some poking tomorrow..

