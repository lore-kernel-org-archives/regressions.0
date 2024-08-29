Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6875647
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724913796; cv=none; b=s3UHhviO3wZzPqIonnYXyeWZ0qPwHQVWOg1/KGslOhICc/P33eFTRx8zKwOP0kTzM9mDr8vYuDn4I6o/UtLNMChA/hQIbcf6MIbZvF40YUZ3VIiwFJSL9tkHH+t+B5ZEBh0RkO1ozWA4hpk+7IY8AzR4OTtFfe6NbqHxQosxc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724913796; c=relaxed/simple;
	bh=oA+wBhESLMyFMtNAP7JY/AA6NWei4y8/eR8f/ozgY5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFrBZmEnLeu/87Nan48FEFNK3QYRTwpscDpL0CuuJBf5136C4nMDyxXoVWNfsOXaWv7QctIFKO7X0JPzliFf9oqqEU/NTq/+NbLhEZjOLb58cWdgOc9u3eX4scjIg0Y00OHt3gC9XT+mRVawvmCNYWHczwuNbLK/W8q2rxmmkXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o7OzsBVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o7OzsBVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7180C4CEC1;
	Thu, 29 Aug 2024 06:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724913796;
	bh=oA+wBhESLMyFMtNAP7JY/AA6NWei4y8/eR8f/ozgY5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7OzsBVYWd4tRZZ33izwQkIyVEGXzbVQr4fhhckQqDasI8GfumlpcO/2nVCVRytvr
	 Id/EV52yQX2JdOas+VxUdhV18+jQuyJ0eNY8I01tu64Sn1GUT8KnBxAKFuanubZjsx
	 6P1zgoEH/SHkx/59fmxxIzZpLajOlp4X4o9LSyuE=
Date: Thu, 29 Aug 2024 08:43:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: denalimoose <denalimoose@proton.me>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] console scrollback
Message-ID: <2024082910-magenta-hatching-04d7@gregkh>
References: <LAnGXs-kzVpOpp-r_RfFvWOeG6OGCf5zILdCmBVOBg9J-nJnRPLWKRxzusRGjj3C3Z7r5Tt1udZCQYtE6F9bkjYnY02LmV_pEabm4valGJo=@proton.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LAnGXs-kzVpOpp-r_RfFvWOeG6OGCf5zILdCmBVOBg9J-nJnRPLWKRxzusRGjj3C3Z7r5Tt1udZCQYtE6F9bkjYnY02LmV_pEabm4valGJo=@proton.me>

On Thu, Aug 29, 2024 at 05:33:43AM +0000, denalimoose wrote:
> 2 patches were made in 2020 that have unknowingly been causing many people some headaches.
> 
> fbcon: remove soft scrollback code
> commit 50145474f6ef4a9c19205b173da6264a644c7489
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=50145474f6ef4a9c19205b173da6264a644c7489
> 
> vgacon: remove software scrollback support
> commit 973c096f6a85e5b5f2a295126ba6928d9a6afd45
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=973c096f6a85e5b5f2a295126ba6928d9a6afd45
> 
> I'm sorry, I'm not a developer and I don't know how to properly report this. But our team (that works with consoles all day, everyday) have been wondering why scrollback has been broken for years. We only recently became aware that it was removed on purpose.
> 
> No, piping to less or something else is not a replacement for what was there and working great for a long time.
> 
> The reasons cited in these patches are narrow, shortsighted and not at all inclusive of people that work with consoles.

But the reasons there are real.  No one is there to maintain the code
and it is full of bugs that were exploitable.

If this code is being used, wonderful, please take it over and revert
the change and submit patches to fix it all up properly, we will gladly
accept that!

Can you do that?

thanks,

greg k-h
