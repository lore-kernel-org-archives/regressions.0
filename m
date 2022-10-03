Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018228F68;
	Mon,  3 Oct 2022 10:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4A5C433C1;
	Mon,  3 Oct 2022 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664792831;
	bh=kH1AYJKWLogqFmpUGazI4RX66w9QwxKIZAER7Nc3sJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gc5r/8C8+pgb+sxWhSmS7ObPQQxeLI+XpxjuBEjJr5LLLBsvHqoAt5jD8BFAZndO5
	 rJJoEjkvtpy8CGyQbOResUom8AU+fCf4IWYy9sSH7NowE/7J/UhVXX+hCGZ1/6AUND
	 LXPLopoyIkuSx60aA0HbDH+fqJSp4rixOW5RPFd7oo1dDv5e/j++bqnvAv7tOLdXfI
	 c3JLCm3qDmubIojIzaDwpOkF6pBy+wUHNu9NrCEKZZIh66kO/XsnAT6QxEtkfUz/xG
	 mO5KxYilC9f0//DKLM/24pnb6UMTVKypnLIi3BTJ1a6vo5NnzZUMXC7Sfz440NHG9d
	 HqWNCS4CuNQhg==
Date: Mon, 3 Oct 2022 13:26:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>, Theodore Ts'o <tytso@mit.edu>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Greg KH <gregkh@linuxfoundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yzq47x55QwHBLue4@kernel.org>
References: <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
 <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
 <CAMuHMdX8Ko_LiqsWafzcqheW_7SZmtzEvgrpBbyoCLxyWqjqBg@mail.gmail.com>
 <1d3fdc6a-a98a-fe3b-2e3e-acc2ffa24f9d@gmx.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d3fdc6a-a98a-fe3b-2e3e-acc2ffa24f9d@gmx.com>

On Mon, Oct 03, 2022 at 09:40:43AM +0000, Artem S. Tashkinov wrote:
> On 10/3/22 09:26, Geert Uytterhoeven wrote:
> 
> Nothing was lost, no messages were accidentally sent to SPAM, all the
> people in the conversation _retained_ their privacy as Bugzilla _hides_
> emails.
> 
> Hasn't privacy been raised as the cornerstone of this discussion several
> times already? You're _far more private_ on Bugzilla.

The privacy and SPAM volumes are not the cornerstones, it's the opt-out
thingy that behaves like a spam, feels like a spam and so it's treated like
a spam. 
 
> > 
> > Never send bug reports privately, unless you have a monetary
> > relationship with the receiving end.  Always Cc the subsystem
> > mailing list, so anyone involved can help.
> 
> I've done that on multiple occasions and in _many_ cases actually
> received help vs. sending to a mailing list where my messages were
> completely neglected.
> 
> For instance, I've CC'ed Linus Torvalds _privately_ from Bugzilla twice
> and he _chimed_ in and _helped_ resolve the bugs. My messages to LKML
> were _ignored_ by +1000 people subscribed to it.

Did you try CC'ing developers *and* the relevant lists? 
 
> Maybe I should start the list of "Why email sucks in terms of bug
> reporting" because I keep saying the same stuff over and over again.
 
Maybe you also need to listen what other people reply... 

I can take the point that bugzilla (or another tracker) could be more
convenient to users. But that does not mean that kernel developers and
maintainers can be forced to use it.
 
> Regards,
> Artem

-- 
Sincerely yours,
Mike.
