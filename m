Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3794C7C;
	Mon,  3 Oct 2022 15:59:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5198440;
	Mon,  3 Oct 2022 17:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1664812764;
	bh=lUz5Lq9T37UC12wd8MViI0mlNQ7LoqI2XtH8x6p4eWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeCiAmBwYWJc7NU3g6vgKC/UNvA4IuV8tjyMS9jqvhFoNaDhZOlEthzwIe6SaM4hG
	 +Y9Oyp3MzyCSeb8M5zTwfKcnxiw7FJgOdOdhPR0+hFVKwW20C5KX432jZaPEDe2mMP
	 Ul0D9nwX/AQRKh17ZlV8qi4mtkyaxdRYLewCyHmM=
Date: Mon, 3 Oct 2022 18:59:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Slade Watkins <srw@sladewatkins.net>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzsG2uC70WfawKTs@pendragon.ideasonboard.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
 <534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net>
 <e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
 <20221003112605.4d5ec4e9@gandalf.local.home>
 <YzsDbeF8WQHy9Hat@pendragon.ideasonboard.com>
 <20221003115102.35bff30e@gandalf.local.home>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221003115102.35bff30e@gandalf.local.home>

On Mon, Oct 03, 2022 at 11:51:02AM -0400, Steven Rostedt wrote:
> On Mon, 3 Oct 2022 18:44:45 +0300 Laurent Pinchart wrote:
> 
> > > The sad part is that most people that are going to report a bug is not
> > > going to read a full document to figure out how to do it. Usually when
> > > someone hits a bug, they are doing something else. And it's a burden to
> > > report it. Obviously, they want it to be fixed, but it's viewed as a favor
> > > to the developer and not the user to get it fixed, as it's likely seen as a
> > > mistake by the developer that the bug exists in the first place.  
> > 
> > It really depends on how badly the bug affects the reporter. I'm sure
> > that a bug that prevents GPU or audio from working alone on a shiny
> > brand new laptop will see lots of pings. A side issue noticed by the
> > user that wouldn't really affect them is more likely to end up in a
> > blackhole. I recently faced issues with a display controller. I sent
> > patches for the problems affecting my use case, and only notified the
> > maintainer for the other issues. Those have been "added to their todo
> > list (TM)". But is that really a problem ? If I'm not affected and
> > neither is the maintainer, there's likely better use of their time, at
> > least until a user who is really affected by the problem shows up.
> 
> I guess that's the main question. If we see hundreds of bugzilla reports
> ignored, are they the one offs that nobody really cares about, or are they
> the ones where it's preventing someone from using their new laptop properly?
> 
> Sometimes, even if it prevents a laptop from working properly, it could be
> ignored if a workaround is in place. Like just buying an external webcam if
> you can't get the internal one working.

That's an interesting example. https://lwn.net/Articles/904776/ shows
how it made lots of users *very* unhappy.

-- 
Regards,

Laurent Pinchart
