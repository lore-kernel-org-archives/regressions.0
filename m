Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D60440C
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 18:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59189C433C1;
	Tue,  4 Oct 2022 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664906577;
	bh=XB8wRP/Kj3AZw2HyVY3jFV+pQ3ygjqk2Qvvg0S28p2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nav9wVIfPeRtCBRp+YN9/U4/MvUcoktehCWe2cndYL+6naMK00IdG8sYK0nLfO/u+
	 QQKHWzctjBoRohRnFkGbJXPq3l4Bj0vAHPQRWDkGfZHnvi6Vv/werM5FwDvQzg92iD
	 PXB4XjrBwd20mdL2SPD3tEBDXLf9STunkDVRrFuo=
Date: Tue, 4 Oct 2022 20:02:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"Artem S. Tashkinov" <aros@gmx.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <Yzx1T05Ut0of55KY@kroah.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004175354.bfvg3vhfqch35ib5@meerkat.local>

On Tue, Oct 04, 2022 at 01:53:54PM -0400, Konstantin Ryabitsev wrote:
> As I have stated multiple times, the hard part will be keeping a team of
> people who are willing to do the bug triage work, but maybe we can start with
> Greg KH using his intern funds to hire someone (assuming he's not already
> using these funds for someone to help him with all the other tasks).

I have no interns anymore, and the ones that the LF does have in the
kernel program are using all of the remaining budget that we have, so
much so that we have a whole bunch of unpaid ones at the same time as we
have so many people applying for the process.

So I don't think you can use those funds, they are all spoken for,
sorry.

greg k-h
