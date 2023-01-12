Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD3B290F
	for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 11:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BEEC433EF;
	Thu, 12 Jan 2023 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673523652;
	bh=2tx5v7AAONozVAirkomQrh2CmhT+HtyfG5InFeBthBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qk7VBO6XwJC52EIeTVWvLDnAqT4I3WQXxaP6zk/Gbihm0+OK+mvQDlrICv4JnTzbH
	 0itfBVv77HLIOx2/V1Mdg6P7HgYhfTqniLLd7m6S1eIz9aEuJh3ZG1cto0IgH0z05I
	 b6lapY4ckaKpZrIV/QaRpzFFurov1t9HaUFGSa2s=
Date: Thu, 12 Jan 2023 12:40:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Holzinger <pholzing@redhat.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [Regression] 6.0.16-6.0.18 kernel no longer return EADDRINUSE
 from bind
Message-ID: <Y7/xwk9lmaNwrDwo@kroah.com>
References: <CAFsF8vL4CGFzWMb38_XviiEgxoKX0GYup=JiUFXUOmagdk9CRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFsF8vL4CGFzWMb38_XviiEgxoKX0GYup=JiUFXUOmagdk9CRg@mail.gmail.com>

On Wed, Jan 11, 2023 at 04:52:21PM +0100, Paul Holzinger wrote:
> Hi all,
> 
> Since updating to 6.0.16 the bind() system call no longer fails with
> EADDRINUSE when the address is already in use.
> Instead bind() returns 1 in such a case, which is not a valid return
> value for this system call.
> 
> It works with the 6.0.15 kernel and earlier, 6.1.4 and 6.2-rc3 also
> seem to work.
> 
> Fedora bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2159066
> 
> To reproduce you can just run `ncat -l 5000` two times, the second one
> should fail. However it just uses a random port instead.
> 
> As far as I can tell this problem is caused by
> https://lore.kernel.org/stable/20221228144337.512799851@linuxfoundation.org/
> which did not backport commit 7a7160edf1bf properly.
> The line `int ret = -EADDRINUSE, port = snum, l3mdev;` is missing in
> net/ipv4/inet_connection_sock.c.
> This is the working 6.1 patch:
> https://lore.kernel.org/all/20221228144339.969733443@linuxfoundation.org/

As 6.0.y is now end-of-life, is there anything keeping you on that
kernel tree?  If you send a fix-up patch for this, I'll gladly apply it
and push out one more 6.0 release with it.

thanks,
g
reg k-h
