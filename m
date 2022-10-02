Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4423D6A;
	Sun,  2 Oct 2022 21:41:06 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 292LesV9022642;
	Sun, 2 Oct 2022 23:40:54 +0200
Date: Sun, 2 Oct 2022 23:40:54 +0200
From: Willy Tarreau <w@1wt.eu>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221002214054.GB22532@1wt.eu>
References: <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <YzmhoglDyEf3z0n8@kroah.com>
 <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
 <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
 <7d57b7d2-b39a-881c-65e6-969c4f0948cc@gmx.com>
 <CAHk-=wjfAERC3XjZ=rF8HM+Q52LD-j_EEtv0hhiyhi6PC6MCUA@mail.gmail.com>
 <8f2ad360-8719-e275-050b-f279201a1616@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f2ad360-8719-e275-050b-f279201a1616@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Oct 02, 2022 at 09:27:40PM +0000, Artem S. Tashkinov wrote:
> > Which is why in the general case, you really should consider email to
> > be the "lingua franca" of kernel development communication.  It
> > doesn't have the fundamental limitations and management issues that
> > bugzilla has. If you want to add more people to the Cc in an email,
> > you just do it.
> 
> Attention, Linus, the problem is attention.
> 
> Once something is filed in bugzilla, it's public, it's easily
> accessible, it can easily be found, you can easily add new info.
> 
> Emails? You've flown to Japan to a conference for a week and you have
> much better things than to check any email updates. A week worth of
> emails have suddenly become worthless.

Serious ? Have you ever attended a conference and looked over the
shoulder of the person in front of you ? There are 3 types of interfaces
you see:
  - code
  - slides
  - mails

The last thing people will look at during a conference definitely is a
painfully depressive bugtracker interface. However they will see bug
reports in their mailbox as they happen to read emails from their boss
or customers.

> Here's yet another issue, how would you send a follow up if you don't
> know the reference ("References" email field)? Instead of a follow up
> it'll end up being a new unrelated email.

You don't have such a problem with email. It only happens when you try
to respond via e-mail to stuff you find in a browser.

Willy
