Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AE8173
	for <regressions@lists.linux.dev>; Mon,  1 Nov 2021 13:03:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9EA760EBB;
	Mon,  1 Nov 2021 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1635771808;
	bh=2fPVxsJmoceiEYrWOhvSBAZSuXi8+AP3b1akK9ao5cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcpYyU6LLHyclfU6kOWMmG99Ay6x8TmcwYyPiKT4t31oK6WHojLMbpkAQbj8JOe6t
	 wa/QM0NHDqSDvWnofIyHWvDJbN0xAPOPV7XrgTHjVeWR/4cAy50MFJ0hs21omaxuv7
	 IzXrT9jyhlJ413ctlwtgzOOCnFHLqwXGNybV3Qgg=
Date: Mon, 1 Nov 2021 14:03:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Thorsten is tracking regression again and could need a little
 help (was: Re: Linux 5.15)
Message-ID: <YX/lnI5gX4TAF5Ea@kroah.com>
References: <CAHk-=wjfbfQobW2jygMvgfJXKmzZNB=UTzBrFs2vTEzVpBXA4Q@mail.gmail.com>
 <a365ffb9-a4d2-b1d7-7cd7-dd9d7039e04e@leemhuis.info>
 <YX/ekB+9F9xvHCB7@kroah.com>
 <da21322a-95e8-40f9-a718-fa1e56eb203f@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da21322a-95e8-40f9-a718-fa1e56eb203f@leemhuis.info>

On Mon, Nov 01, 2021 at 01:44:01PM +0100, Thorsten Leemhuis wrote:
> On 01.11.21 13:33, Greg KH wrote:
> > On Mon, Nov 01, 2021 at 05:49:40AM +0100, Thorsten Leemhuis wrote:
> >> example by simply forwarding the mail to regressions@leemhuis.info or
> >> CCing that address on a reply. I'll handle everything else then and tell
> >> regzbot about it. But if you feel adventurous, you can also skip me as
> >> the man-in-the-middle and tell the bot directly. To do that, just send a
> >> reply to the report to the regressions mailing list
> >> (regressions@lists.linux.dev) either directly or by CCing it on a reply
> >> you would have written anyway; when doing so, place something like
> >> '#regzbot ^introduced v5.15..' (separated by blank lines) somewhere in
> >> the text, as outlined in regzbot's 'getting started guide' or its
> >> reference documentation:
> >> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> >> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> >>
> >> That's it, regzbot then on its next run will add the report to the list
> >> of tracked regression. I'll keep an eye on things and try to fix any
> >> problems I notice, as there likely will be a few. But then doesn't need
> >> to bother you.
> >>
> >> There is one thing that would really help: if one or two subsystem
> >> maintainers could give regzbot a shot for all the regression reports
> >> they get, even for easy fixes, as the bot really needs something to chew
> >> on. Any volunteers?
> > 
> > I'll try it for the USB subsystem this merge cycle. 
> 
> That will be a great help, many thx.
> 
> > Do you want a bug
> > report email redirected to that address or will a simple forward work
> > well enough?
> 
> Redirecting will make it a little easier for me, but a simple forward is
> fine, too.

Ok, I did that now for a USB bug report, hopefully that worked.  If not,
I can forward it on.

thanks,

greg k-h
