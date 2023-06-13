Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338723DB
	for <regressions@lists.linux.dev>; Tue, 13 Jun 2023 16:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF4CC433F0;
	Tue, 13 Jun 2023 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686673469;
	bh=e0lGt4W4LRbgMJIkd2g8XPriuNT71YGvpwWLGzTcwB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTnr7CPRWfFhJ1WvvtGXqCDUKWVAxTfE22yZ6caZPpFCBynxFYMGX++KD5NVB7rFJ
	 7tmp49cA/gINTGyNA9tg3qZuCs8Dn/3AmGz+RNc4a5wSD2CnyjmYDjXx5Rvn+TzcFy
	 S4E78MZ3DV6SHHS8HbCYzAxO+oZVSHLAcMlPteKY=
Date: Tue, 13 Jun 2023 18:24:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, Stephan Bolten <stephan.bolten@gmx.net>,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix command cancellation
Message-ID: <2023061349-disobey-empathy-c1a9@gregkh>
References: <20230606115802.79339-1-heikki.krogerus@linux.intel.com>
 <977dae31-7963-d3f5-7612-6f7761b03507@leemhuis.info>
 <2023061313-headed-stumble-cf30@gregkh>
 <49292fe0-db4a-0358-1949-f0ce1c876a73@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49292fe0-db4a-0358-1949-f0ce1c876a73@leemhuis.info>

On Tue, Jun 13, 2023 at 05:36:50PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 13.06.23 17:09, Greg Kroah-Hartman wrote:
> > On Tue, Jun 13, 2023 at 04:51:58PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> >> On 06.06.23 13:58, Heikki Krogerus wrote:
> >>> The Cancel command was passed to the write callback as the
> >>> offset instead of as the actual command which caused NULL
> >>> pointer dereference.
> >>>
> >>> Reported-by: Stephan Bolten <stephan.bolten@gmx.net>
> >>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217517
> >>> Fixes: 094902bc6a3c ("usb: typec: ucsi: Always cancel the command if PPM reports BUSY condition")
> >>> Cc: stable@vger.kernel.org
> >>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >>
> >> Gentle reminder that this made no progress for a week now. Or was there
> >> and I just missed it? Then apologies in advance.
> > 
> > This just landed in my usb-linus branch a few hours before you sent
> > this, and will show up in linux-next tomorrow as:
> > 	c4a8bfabefed ("usb: typec: ucsi: Fix command cancellation")
> 
> Ahh, great! Sorry, I check next in cases like this before sending mails,
> but not the subsystem trees directly. :-/

I wouldn't expect you to look in subsystem trees, not a problem at all,
thanks for the ping, you're doing great work here.

greg k-h
