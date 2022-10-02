Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D16A3D6A;
	Sun,  2 Oct 2022 20:54:38 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 292KsUeK022465;
	Sun, 2 Oct 2022 22:54:30 +0200
Date: Sun, 2 Oct 2022 22:54:30 +0200
From: Willy Tarreau <w@1wt.eu>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221002205430.GC22129@1wt.eu>
References: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002150522.ul4nbtfawqjhnsag@meerkat.local>
 <b594681b-6b8c-ffb7-f526-3da847d160a8@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b594681b-6b8c-ffb7-f526-3da847d160a8@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Oct 02, 2022 at 07:43:19PM +0000, Artem S. Tashkinov wrote:
> Again, to remind everyone, bugzilla sees around ~20 bug reports
> _weekly_. There are hundreds of active of kernel developers. That means
> for a single bug report maybe a couple of people will receive maybe a
> few emails per week.
> 
> Is this really an _issue_?
> 
> Why are people are now blowing stuff out of proportion for no reason?

Because the approach is wrong. As I explained it gives a false sense to
the reporter that their issue is being handled while the simple fact that
a message was sent to a person is in no way an engagement to do anything
about it. LKML is a broadcast area. Everyone hopes someone else will
respond and that eventually happens. When the reports are targetted, it
puts pressure on the few developers receiving the message who know that
it's unlikely anyone else will deal with that report.

> This conversation alone has already seen close to three dozen emails and
> no one is complaining.

Because it's easy to ignore. Try to setup this conversation in your
favorite bug tracker and you'll feel alone discussing with yourself.
This is a great indication that participation is much more powerful
in the mailing list model than in the bug tracker model.

Willy
