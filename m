Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE94C6C
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 15:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9E3C433D6;
	Fri, 30 Sep 2022 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664550144;
	bh=T6FiqdMep748yXvI5CONSjuxDxr1LADx4NBVpN7SLAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wyL4u2x1rmAXexFxrjyPalUBK/0ftnKp5NyT/irG32ZWsLlj5mzGAPsQ8A+68U5JH
	 RxisN4clTMWxbkt4Tri+ABURoWpQPaVwO/FOjsGBqO+6/DcVXqHkm8XgXt9A4o1MIJ
	 mjRYvehDZMMg6SQg3T/Fev5L+4OIXiNGNSNKlOms=
Date: Fri, 30 Sep 2022 17:02:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jerry Ling <jiling@cern.ch>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
Message-ID: <YzcE/YEKcUDzuES/@kroah.com>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
 <b85bc2cf-5ea5-c5fb-465c-cd6637f6d30f@leemhuis.info>
 <36d318f0-9fc4-d5d9-9dc2-26145c963f0f@cern.ch>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36d318f0-9fc4-d5d9-9dc2-26145c963f0f@cern.ch>

On Fri, Sep 30, 2022 at 09:05:31AM -0400, Jerry Ling wrote:
> > If it is, simply starting with "i915.enable_psr=0" might already help.
> 
> unfortunately this didn't help.

Ick.  Ok, can you test your own kernel build out?  If I provide a patch
that reverts the what I think are offending commits, can you test it?

Also, does 6.0-rc7 also have this same problem?  That should be tested
first here, and if that's a problem, then we can get the i915 developers
involved.

thanks,

greg k-h
