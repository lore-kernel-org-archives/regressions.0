Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C271C13;
	Thu, 29 Sep 2022 13:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF558C433C1;
	Thu, 29 Sep 2022 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664459007;
	bh=XvEUSpy5gFWS2rJxFuOwPGvDngmGQsgTXpxLcU+BZX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igC9Dt3YW9FOLDnmDrDSUzUAkZj6CzmYZDoToVO+Jvu5uAKfi5Ka7ciQqFnWO5uGG
	 Y/25/GbLH8W6VYRV8q2DqoJBBY3jFbOw5Y2C128KMkDnT9A+AvpGVWgS58gH4bc4HU
	 YWAmUAVLlEaYMxRySfisKqWEOMDZiUO7SfBc26oM=
Date: Thu, 29 Sep 2022 15:43:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzWg/GjvPGvhhPkB@kroah.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>

On Thu, Sep 29, 2022 at 01:31:49PM +0000, Artem S. Tashkinov wrote:
> 
> 
> On 9/29/22 13:04, Konstantin Ryabitsev wrote:
> > On Thu, Sep 29, 2022 at 12:22:35PM +0000, Artem S. Tashkinov wrote:
> > > AFAIK, the kernel bugzilla is a Linux Foundation project and the
> > > organization receives funding from its very rich members including
> > > Google, Meta, Intel, and even Microsoft. The fact that no one is
> > > seriously working on it looks shameful and sad. We are not talking about
> > > a minor odd library with a dozen users we are talking about the kernel.
> > 
> > The bugzilla as a software platform is a Mozilla product, not Linux
> > Foundation. Unfortunately, it's pretty much dead:
> > 
> > 1. all development has stopped years ago
> > 2. it doesn't even work with recent MySQL servers
> > 3. it is written in perl5 and can only pretty much run with mod_perl
> > 
> > We're committed to running it as far as we can, but we all must also admit
> > that the platform is near-death and probably will become an ever-increasing
> > burden to keep it operating. Heck, one of our IT staff is currently trying to
> > convert bugzilla.kernel.org to use Postgres just so we can keep operating it
> > past the end of 2022.
> > 
> > The Linux Foundation IT is in charge of running infrastructure -- we're not a
> > development shop. All of our software projects are pretty much "skunkworks"
> > efforts (and yes, this includes b4).
> > 
> > We do have ability to fund development efforts -- LF has been the primary
> > sponsor behind public-inbox.org over the past 3 years. However, there must be
> > a clear, strong, and well-articulated mandate from the community. From what I
> > heard, the vast majority of maintainers simply want a web form that would
> > allow someone to:
> > 
> > 1. clearly state what kernel version they are using
> > 2. clearly describe what they were trying to do
> > 3. explain what they expected vs. what they got
> > 4. attach any files
> > 5. give this bug report a unique identifier
> > 
> > Then a designated person would look through the bug report and either:
> > 
> > a. quick-close it (with the usual "talk to your distro" or "don't use a
> >     tainted kernel" etc)
> > b. identify the responsible maintainers and notify them
> > 
> > The hard part is not technical -- the hard part is that "designated person."
> > Being a bugmaster is a thankless job that leads to burnout, regardless of how
> > well you are paid. Everyone is constantly irate at you from both ends -- the
> > users are annoyed because their stuff doesn't work, and the maintainers are
> > annoyed because you keep yanking them to work on dull problems that require a
> > ton of back-and-forth with people who aren't capable of applying patches and
> > booting custom kernels.
> > 
> > Before we try to fix/replace bugzilla, we really need to figure out the entire
> > process and pinpoint who is going to be the one in charge of bug reports. If
> > you think that LF should establish a fund for a position like that, then you
> > should probably approach LF fellows (Greg KH, Shuah Khan), who can then talk
> > to LF management. The IT team will be happy to support you with the tooling,
> > but tooling should come second to that -- otherwise we'll just be replacing an
> > old and rusty dumpster on fire with a new and shiny dumpster on fire.
> > 
> > -K
> 
> To me it sounds like the best way to keep moving forward is simply
> convert git.kernel.org + patchwork.kernel.org + bugzilla to
> gitlab.kernel.org and that will solve all the issues immediately. That
> will require of course a ton of work but:

For loads of reasons that have been stated before, we aren't going to
move everything to gitlab, sorry.  That's a non-starter for a wide range
of reasons, not the least being you are trying to solve a "we have no
one who wants to wrangle bugs in bugzilla" problem with "move all of our
code hosting infrastructure to a totally different thing that can't even
provide the basic things that we have today".

Sorry, not going to happen, gitlab is not the solution here.

greg k-h
