Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18553A5;
	Thu, 29 Sep 2022 16:42:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56E7347C;
	Thu, 29 Sep 2022 18:42:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1664469738;
	bh=Px3pAoyZFv/K9T1/keIuJOaFWik7BVMa7QB94t6qEaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2ZzK4gMg3E9B9ZR6xvzXzGvRf3wNBf8gkIZZr059sxmfRVfBU8xp0vaHNzlJLMo8
	 x50e43DtCHTUF8iH8d1kUcvxt8SMSuNTgA7q3QIf4JU6ioZLwXYP6WW2nKKWRsq4L+
	 IMAWZlBecfAB68wk9NZ6swRZZJN7HymAsoHeBOBg=
Date: Thu, 29 Sep 2022 19:42:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Slade Watkins <srw@sladewatkins.net>
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>

On Thu, Sep 29, 2022 at 10:54:17AM -0400, Slade Watkins wrote:
> Hey!
> 
> Jumping in here to offer my input...
> 
> > On Sep 29, 2022, at 10:22 AM, Artem S. Tashkinov <aros@gmx.com> wrote:
> > 
> > That leaves us with Bugzilla that no one wants to touch and some people
> > actively want to delete altogether. In other words, no central place to
> > report bugs or keep track of them.
> 
> This is the current problem that seems to be appearing here. I get why
> no one wants to touch it, but it doesn’t solve the problem. 
> 
> As you said:
> 
> > I've mentioned several times already that mailing lists are _even worse_
> > in terms of reporting issues. Developers get emails and simply ignore
> > them (for a multitude of reasons).
> 
> It’s 100% true that emails get _buried_ as waves of them come in (LKML
> itself gets hundreds upon hundreds a day, as I’m sure all of you know)
> and it just isn’t something I personally see as viable, especially for
> issues that may or may not be high priority.

E-mails are not that bad to report issues, but they can't provide the
core feature that any bug tracker oughts to have: tracking. There's no
way, with the tools we have at the moment (including public-inbox, b4
and lei), to track the status of bug reports and fixes. Even for patches
we need to rely on patchwork, and that's far from perfect.

When things fall through the cracks (and at the moment it's more of a
sieve with very large holes, if not a bottom-less pot), we mostly assume
that, if the problem is important enough, the submitter will ping time
after time until a fix is produced and merged. There is no way to
produce a list of open issues.

I agree with the comment that was repeated multiple times: it's quite
pointless to improve the tooling if we don't first improve the process,
and find a way to allocate people and time to handling bug reports. Even
if bugzilla has reached EOL upstream, and even if it isn't perfect, the
instance runs today, and gives us a tracker that could be used to design
a proper process and implement it, should we desire to do so. There's no
chicken-and-egg issue to be solved where lack of tooling would prevent
the implementation of a bug tracking process. I'm quite confident that,
if we manage to implement a bug tracking process, we will find a way to
get the tooling we need, be it through bugzilla or something else.

> > Getting back to my first message in this discussion,
> > 
> > * Let's refresh all the components in Bugzilla
> > * Components may not have any people responsible for them at all. Bug
> > reporters will have to CC the people they are interested in.
> > * Let's subscribe the past six months of developers (using git commit logs)
> > * Whoever wants to unsubscribe is free to do so.
> 
> Not a terrible idea to me, though obviously, that’s up for debate.
> 
> > If not for bugzilla, let's use something more modern. I don't know any
> > comparable projects however. Trac is truly horrible. You cannot even
> > unsubscribe from bug reports. Maybe I've missed something. Discourse?
> > Not a bug tracker per se but can certainly work this way.
> 
> Discourse probably isn’t the best fit here, in my opinion. Jira and
> YouTrack are the only ones I personally know of that are similar to
> Bugzilla, although as far as I know, they aren’t open source...

-- 
Regards,

Laurent Pinchart
