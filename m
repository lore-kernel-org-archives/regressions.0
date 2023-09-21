Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64124424
	for <regressions@lists.linux.dev>; Thu, 21 Sep 2023 07:19:40 +0000 (UTC)
Date: Thu, 21 Sep 2023 09:09:19 +0200
From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Labiuk <michael.labiuk@virtuozzo.com>,
	Linux PARISC <linux-parisc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
Message-ID: <1695279990@msgid.manchmal.in-ulm.de>
References: <1694366957@msgid.manchmal.in-ulm.de>
 <ZQWUzwiKWLk79qbp@debian.me>
 <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
 <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com>

[
    A tad late in the party, I know. The box I had encoutered this isn't
    quite on 24/7, and reproduction took some time.
]

Linus Torvalds wrote...

> I haven't pushed it out (because it would be lovely to get a
> "Tested-by" for it, and that will make the commit ID change), but I'll
> probably do so later today, with or without confirmation, because it
> does seem to be the problem.

Confirmed this solves the issue here, too. Tested on 6.6-rc2.

    Christoph
