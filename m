Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF8517C1;
	Mon,  3 Oct 2022 10:05:26 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 293A432u025351;
	Mon, 3 Oct 2022 12:04:03 +0200
Date: Mon, 3 Oct 2022 12:04:03 +0200
From: Willy Tarreau <w@1wt.eu>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>,
        Mike Rapoport <rppt@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221003100403.GA25318@1wt.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d3fdc6a-a98a-fe3b-2e3e-acc2ffa24f9d@gmx.com>
 <c828f525-8fdf-186a-2d18-582f534ecb61@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Oct 03, 2022 at 07:49:38AM +0000, Artem S. Tashkinov wrote:
> Lore looks alien to me and in my life I've worked with a dozen bug trackers.
> 
> * Where are open "issues"?
> * Which issues are now resolved?
> * What's the status of the "issue"?

Very often this status is an issue by itself. It only serves to hide
the less interesting junk to discover what's left behind, but when
people continue to respond to resolved issues nobody sees that. And
if you block them from continuing to feed a closed issue, it's even
worse as it forces them to reopen a new one that causes duplication.

With e-mails you can respond to an old message if you want and keep
all the participants. And it does happen.

> If you remove bugzilla I'll never use lore.kernel.org, I promise.

It's a convincing argument, for sure!

> > > Again the volume of bug reports is relatively low, fewer than two dozen
> > > a week.
> > 
> > Which proves this tool is insignificant in the grant scheme of (Linux)
> > things.
> 
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=204807
> 
> A very insignificant exchange of over 2 hundred comments, patches,
> suggestions, etc. by the people absolute most of whom would have failed
> to do that via email.

You've already claimed that and we've also told you that it could very
well have been the opposite and have been resolved in 6 months instead
of 2.5 years, by having many more eyes on it. The thing is that you're
only listening to yourself and not to the arguments that the people you
accuse of not reading the lists gave you. At this point there's not much
more that can be done, you've completely closed that discussion by
refusing to listen, thus I think it's better to stop now.

Willy
