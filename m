Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B6723DB
	for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 15:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1BBC433F0;
	Tue, 13 Jun 2023 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686668982;
	bh=Fa7lNk4I5TIVsPkI//Urocnu6JB8yz4pj0y9+9LXrP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0kA4gSF4Qd/IMr9UfNgK86O/Ii4e+pQyo6Po45XycdWpmW6483MjCxpbSAHONpoZP
	 R3ixYAMjHXSlKF0H92g/C0mU0v+dnSIrM9OhMe8wi4q3PY4kKuvcpHB9NVCXOqhmjq
	 H9M0odJuE4L1/wZBJoyGNYEqWCeFSruFy3OqkqNM=
Date: Tue, 13 Jun 2023 17:09:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, Stephan Bolten <stephan.bolten@gmx.net>,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix command cancellation
Message-ID: <2023061313-headed-stumble-cf30@gregkh>
References: <20230606115802.79339-1-heikki.krogerus@linux.intel.com>
 <977dae31-7963-d3f5-7612-6f7761b03507@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <977dae31-7963-d3f5-7612-6f7761b03507@leemhuis.info>

On Tue, Jun 13, 2023 at 04:51:58PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 06.06.23 13:58, Heikki Krogerus wrote:
> > The Cancel command was passed to the write callback as the
> > offset instead of as the actual command which caused NULL
> > pointer dereference.
> > 
> > Reported-by: Stephan Bolten <stephan.bolten@gmx.net>
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217517
> > Fixes: 094902bc6a3c ("usb: typec: ucsi: Always cancel the command if PPM reports BUSY condition")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Gentle reminder that this made no progress for a week now. Or was there
> and I just missed it? Then apologies in advance.

This just landed in my usb-linus branch a few hours before you sent
this, and will show up in linux-next tomorrow as:
	c4a8bfabefed ("usb: typec: ucsi: Fix command cancellation")

> I'm asking, as it afaics would be nice to have this (or some other fix
> for the regression linked above) mainlined before the next -rc. That
> would be ideal, as then it can get at least one week of testing before
> the final is released.

It will get there, sorry for the delay, now caught up on all pending USB
and TTY/serial fixes.

greg k-h
