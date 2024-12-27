Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107E12BAF7
	for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735286470; cv=none; b=iPSmKGrYcKAxH4dtIJhZHwkjfHxHtmpWOmDAHZlo6G3pGqK46e8o0m4cg5TCxvTzEJmaPO0nHWrL2ST+rWbQuU+1pdSo0mdEAPh6Ii1BuAt5eZ+FLFvKEscWEnEuE2+orT5lN47ao1ySG2ifjwvsovYjSiL/Hs0ENzedahMjAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735286470; c=relaxed/simple;
	bh=bSPxODeNOXU8ZwaMSc5Pg0VDt9yex7hup8+dGOBbzfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mO3GlG7rTzFSV4/xHoy7kCJwsF6kGYM788pT4MJ+aHODLQh6wssg2+JXBDc5RK/yo8D2XesGwuUOOCQMJpuVLFCTcfLv0jTJWoSlLmMRpqojqxaP7nMYG41Ri7z28ueBOdsNFThiIliwyP8ANBp9Z2o46OgL0obfrR+B3RXaAqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=av1EtVrC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="av1EtVrC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17248C4CED0;
	Fri, 27 Dec 2024 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735286469;
	bh=bSPxODeNOXU8ZwaMSc5Pg0VDt9yex7hup8+dGOBbzfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=av1EtVrCLkIkd3+Tc6Sx04QNVuBLuafs/LAoIGslu+u3Gkce5eOBhvuNTIcHZmbD4
	 W9mDAYyE0ze6zZHKk9TBFbQDNMEGF/D7QCsY8vjeg2gwUEPX5Rh1uTG2LgJUofT9Kt
	 RvK4mlyeDMLAyFvx7PW9codq3NJTwClG4l555uY0=
Date: Fri, 27 Dec 2024 09:01:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alvaro Kuolas <kuolas@gmail.com>
Cc: regressions@lists.linux.dev
Subject: Re: Longer boot times with kernel 6.11.7 and newer (including
 6.12.6).
Message-ID: <2024122755-status-provolone-58f2@gregkh>
References: <CAKUwrzBKjtxYkGoL-=mrJ9PoN_PACW0VO1Si1rUdLXfvW_h1cA@mail.gmail.com>
 <CAKUwrzDtcu2JGdVve0BF9nUR-25M3bZrSyJ6xLLiwjCehmWCxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKUwrzDtcu2JGdVve0BF9nUR-25M3bZrSyJ6xLLiwjCehmWCxw@mail.gmail.com>

On Thu, Dec 26, 2024 at 06:33:44PM -0300, Alvaro Kuolas wrote:
> /////////////////////////////////////////////////////////////////////////////////
> bisecting the regression ended in this commit:
> /////////////////////////////////////////////////////////////////////////////////
> 
> cfc72b86fa20cbf44d2b6cc27b35eb15080232ab is the first bad commit
> commit cfc72b86fa20cbf44d2b6cc27b35eb15080232ab
> Author: Greg Kroah-Hartman <gregkh>
> Date:   Tue Oct 29 01:23:04 2024 +0100
> 
>     Revert "driver core: Fix uevent_show() vs driver detach race"
> 
>     commit 9a71892cbcdb9d1459c84f5a4c722b14354158a5 upstream.
> 
>     This reverts commit 15fffc6a5624b13b428bb1c6e9088e32a55eb82c.
> 
>     This commit causes a regression, so revert it for now until it can come
>     back in a way that works for everyone.
> 
>     Link:
> https://lore.kernel.org/all/172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com/
>     Fixes: 15fffc6a5624 ("driver core: Fix uevent_show() vs driver detach
> race")
>     Signed-off-by: Greg Kroah-Hartman <gregkh>
> 
>  drivers/base/core.c   | 13 +++++--------
>  drivers/base/module.c |  4 ----
>  2 files changed, 5 insertions(+), 12 deletions(-)
> 
> /////////////////////////////////////////////////////////////////////////////////
>  - Building the latest git kernel without this commit:
> 
> Reverting the commit on 6.13.0-rc4 works as expected.

"as expected" is what, faster boot?

And yes, this will slow things down as we add back the lock we had
removed as we had reports of real regressions with this change.  Sorry,
but a slow down is better than a non-working system, and in fact, you
are just back to the same speed you were before this commit was added,
so it shouldn't be that big of an issue.

In other words, we can't revert this revert, sorry.
If you could help out in fixing the issue that this original change
caused, that would be great, as then we could add it, and the fix, to
the tree and your speed would come back.

But really, upower taking that long at boot time feels very odd.  What
is it attempting to do?

thanks,

greg k-h
