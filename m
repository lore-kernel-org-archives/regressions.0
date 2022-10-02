Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500B3D6A;
	Sun,  2 Oct 2022 21:11:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2DEF505;
	Sun,  2 Oct 2022 23:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1664745068;
	bh=qv2su+QSycPx0jnsfJ8GfepNj8T6Grl7/TcXglSgRyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZJTi08sPv41VZH7lpr0NmEGl1FZv0yA9h8Ac0Qny9ET1vuYExkhlrCK8nnh/8TYs
	 4+YSvxqEw7FQHcfJRdsrn35VtwxymflYdzXMNfnZouTtPJ48C887iE5512MIJfsjSs
	 iT0qm3jqOza6SmouwOMAfX03L1mnLuk3nH4tbLyk=
Date: Mon, 3 Oct 2022 00:11:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Slade Watkins <srw@sladewatkins.net>, Theodore Ts'o <tytso@mit.edu>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yzn+a5lA8fryeGNG@pendragon.ideasonboard.com>
References: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <11098E44-8BB4-4318-9BE1-A659573E6BA4@sladewatkins.net>
 <20ddd12f-7277-f343-885d-b39d9ab5c2c3@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20ddd12f-7277-f343-885d-b39d9ab5c2c3@gmx.com>

On Sun, Oct 02, 2022 at 07:37:38PM +0000, Artem S. Tashkinov wrote:
> On 10/2/22 14:48, Slade Watkins wrote:
> >> On Oct 2, 2022, at 8:49 AM, Artem S. Tashkinov <aros@gmx.com> wrote:
> >> As I've said many times already: bugzilla must be an opt-out, not opt-in
> >> experience/option.
> >>
> >> Let's subscribe the past six months of developers using git commits and
> >> if someone doesn't like getting emails they go to the website and
> >> unsubscribe _once_ which takes a minute. This is a non-issue I've no
> >> clue why we're dwelling on it.
> >
> > I disagree with this in its *entirety* and I really don’t think it
> > has any chance of moving forward.
> >
> > If this were to happen (and it won’t!) then developers will just
> > send the emails to spam or some other filter because they didn’t
> > _consent_ to being subscribed to it. And in my opinion, they’d be
> > justified in doing that.
> 
> It was a proposal from no one, i.e. me.
> 
> The other option will be what? To _mass email_ everyone asking them to
> subscribe to bugzilla? Do you know what will happen? 2/3 of relevant
> people will forget about/neglect this email, they will never sign up
> even if they are willing to and we'll end up with a disfunction bugzilla
> again.
> 
> It feels to me we are back to:
> 
> "Users are expected to break their necks finding random mailing lists
> and sending their reports to them expecting feedback".
> 
> 95% of users will just give up.
> 
> 4.95% of users will not receive any feedback: the developer has been
> busy with their work, life, past time, etc - "Sorry, missed your email".
> 
> Maybe 0.05% bug reports will be actually dealt with.
> 
> Again this does not work for serious collaborations requiring multiple
> people over extended periods of time. It absolutely sucks in terms of
> filling in the missing details.
> 
> I begin to sound like a broken record repeating what we've already
> discussed to death a dozen times.
> 
> Let's deprecate bugzilla and just say "f it". That's what I hear. Great!
> 
> No responsibility, no bug reports, no fixes, welcome regressions.
> 
> I concur. This discussion has been a complete waste of time.

Do you realize how insulting this is, for all the developers and
maintainers who spend lots of their free time doing their best ? It's
all very nice to complain and rant, but if you want things to move
forward, lead the effort and work on it.

-- 
Regards,

Laurent Pinchart
