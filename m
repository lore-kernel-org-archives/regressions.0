Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224541FA8
	for <regressions@lists.linux.dev>; Mon, 13 Feb 2023 07:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA15C433EF;
	Mon, 13 Feb 2023 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676273137;
	bh=jwIJ3njli56AjDHSVUClQZiIJljCv+5G23KjPML97EI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9aXQDJ39x2n5ScFWsC86/o8nrznQFRu/iVI78Pd3j4MYpLPazDbP747lvi6O9Icw
	 NdiTL95hqNSAr7ConwBuVbgPwiSn8AJhKjT9zZz8qfKoZfgkJ30qdVTOAvU4YHlX6G
	 lYJhz0zVL9+QVRzUPgwI57RThI33ItM9Z4hYiVRY=
Date: Mon, 13 Feb 2023 08:25:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Winter <winter@winter.cafe>, stable@vger.kernel.org,
	regressions@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [REGRESSION] 5.15.88 and onwards no longer return EADDRINUSE
 from bind
Message-ID: <Y+nl7nzQ3GPxlztq@kroah.com>
References: <EF8A45D0-768A-4CD5-9A8A-0FA6E610ABF7@winter.cafe>
 <Y+m8F7Q95al39ctV@1wt.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+m8F7Q95al39ctV@1wt.eu>

On Mon, Feb 13, 2023 at 05:27:03AM +0100, Willy Tarreau wrote:
> Hi,
> 
> [CCed netdev]
> 
> On Sun, Feb 12, 2023 at 10:38:40PM -0500, Winter wrote:
> > Hi all,
> > 
> > I'm facing the same issue as
> > https://lore.kernel.org/stable/CAFsF8vL4CGFzWMb38_XviiEgxoKX0GYup=JiUFXUOmagdk9CRg@mail.gmail.com/,
> > but on 5.15. I've bisected it across releases to 5.15.88, and can reproduce
> > on 5.15.93.
> > 
> > However, I cannot seem to find the identified problematic commit in the 5.15
> > branch, so I'm unsure if this is a different issue or not.
> > 
> > There's a few ways to reproduce this issue, but the one I've been using is
> > running libuv's (https://github.com/libuv/libuv) tests, specifically tests
> > 271 and 277.
> 
> >From the linked patch:
> 
>   https://lore.kernel.org/stable/20221228144337.512799851@linuxfoundation.org/

But that commit only ended up in 6.0.y, not 5.15, so how is this an
issue in 5.15.y?

confused,

greg k-h
