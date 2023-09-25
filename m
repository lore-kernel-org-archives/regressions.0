Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F2CA5D
	for <regressions@lists.linux.dev>; Mon, 25 Sep 2023 08:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5372C433C7;
	Mon, 25 Sep 2023 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695628933;
	bh=OGi7/VuDOOt0kJK/1Naj5b1F1uKD4LwLyqzc95rQlRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwPGoePnsKTCSHlUY+m5iy6lOHChFkkibngne8gTbUF3MToOMbS85xpw0eQKck3lR
	 SkMxcAuRDwQ0WaWay5H64WO57K4XU4U8oVzxtToqqvr1axOfVr1Ezrm0gra8QL4AJ1
	 fh5vkvBpQ7lqxqol8dJlNiCiEVWr6yPjAxS8ABTc=
Date: Mon, 25 Sep 2023 10:02:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Linux regressions report  for mainline [2023-09-24]
Message-ID: <2023092522-climatic-commend-8c99@gregkh>
References: <169557219938.3206394.2779757887621800924@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169557219938.3206394.2779757887621800924@leemhuis.info>

On Sun, Sep 24, 2023 at 04:17:40PM +0000, Regzbot (on behalf of Thorsten Leemhuis) wrote:
> (2) Nearly six weeks ago there was a report that 101bd907b4244a ("misc:
> rtsx: judge ASPM Mode to set PETXCFG Reg") [v6.5-rc6, v6.4.11, v6.1.46,
> v5.15.127] broke booting various laptops (many or all of them are Dell).
> This apparently plagues quite a few users, hence there were multiple
> reports (see [2] for those I'm aware of). At least Fedora, openSUSE, and
> nixOS have meanwhile reverted the change in their latest stable kernels
> [3]. I one and a half week proposed to revert the culprit when I fully
> noticed it's impact, but Greg wanted to give the developers more time.
> We finally have a fix in sight now [5]; someone affected replied that it
> helps. Not sure what's the right way forward now. But overall this to me
> feels a lot like "this is not how a regression should be handled".
> That's why I wanted to bring it up here in case to ensure your are aware
> of this.

We now have confirmed testing that the proposed fix resolves the issue
so I'll be getting it to Linus in time for the next -rc.  I've been
traveling all last week and this week for conferences so my response
times have been a bit slow, sorry.

thanks,

greg k-h
