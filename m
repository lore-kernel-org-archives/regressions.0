Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D787C
	for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 06:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D378BC433EF;
	Sat, 14 Jan 2023 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673679416;
	bh=tZH5+7ljPefS8hBdYpJxPsf2KyAm+uGZidjIkwVg2cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbGRUgrfMhm/PmfWOAWCxY40qyw8jcLu9KbT/cDIEBqcIK49sFyxZuyqnoMhmssDO
	 rcYNv+nP4nVq9WYeZgkzbzg1jlxSBkm338HtFChZMwyeS+QUCcrKqxPZEgmnv8Mnj6
	 SFq3M+OyoSqHaWCad/M/BTx12eC+r1ZBfwva2dJo=
Date: Sat, 14 Jan 2023 07:56:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Fahner <mdfahner@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Second Monitor Issue on Kernel 6.1.5
Message-ID: <Y8JSMlMgnggwOYl0@kroah.com>
References: <CADsncqR2mTUArTv2HhRnsfmQx5iNgUZo=JVgkUcZT7MtjxEoYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADsncqR2mTUArTv2HhRnsfmQx5iNgUZo=JVgkUcZT7MtjxEoYw@mail.gmail.com>

On Fri, Jan 13, 2023 at 11:58:47PM -0500, Matthew Fahner wrote:
> Hello,
> 
> I'm running Ubuntu 20.10 and experienced a regression when trying
> kernel 6.1.5 that was not present in previous kernels such as 6.0.19
> or 6.0.9
> 
> I have two monitors attached using DisplayPort MST (daisy chaining the
> displays).
> 
> Normally, this works without issue and both monitors are detected and
> display properly.
> 
> With kernel 6.1.5, the second monitor (the monitor that's not directly
> connected to the computer) was detected but would not display.  I
> didn't spend much time troubleshooting the issue and instead reverted
> to 6.0.19 where it again worked without issue.  The first monitor
> worked without issue.
> 
> Let me know what steps I can take to help identify the root cause.

Can you use 'git bisect' to track down the offending commit?

thanks,

greg k-h
