Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15D3D6A;
	Sun,  2 Oct 2022 20:48:43 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 292KmXf9022439;
	Sun, 2 Oct 2022 22:48:33 +0200
Date: Sun, 2 Oct 2022 22:48:33 +0200
From: Willy Tarreau <w@1wt.eu>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221002204833.GB22129@1wt.eu>
References: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <CAMuHMdVxUgyU97EK3S5Xx_vsbTv-cNO1wC9kDwsWEDx+6w9phw@mail.gmail.com>
 <9d0b30a7-a8d4-2308-a833-313c30aadfdb@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d0b30a7-a8d4-2308-a833-313c30aadfdb@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Oct 02, 2022 at 08:17:29PM +0000, Artem S. Tashkinov wrote:
> And most bugs reports in Bugzilla are semi-automatically closed (by me)
> because they are about amdgpu and i915 which have their own bug
> trackers. Without such reports the volume of bug reports is basically
> halved.

So that's fragmenting the locations where users have to look for issues
and report them, the thing you were complaining about regarding mailing
lists. So the problem is the same, except that it's based on web instead
of e-mail. At least e-mail threads don't have a "closed" status that
makes it more difficult for reporters to find what they're looking for,
and tends to be ignored by everyone since not expected to change anymore.

Willy
