Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0D3C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 21:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F249CC433C7;
	Sat,  2 Sep 2023 21:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693688978;
	bh=lBErDo3YbmEVCrO7/M3zGQ5lL9T7zvGAJ7hwkTIO26w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o09bcla4iKKEkmNgnv4tf/uFrjkCP5+AAjjjYHMuh9JfU9R1Bm4YKRB5z0C0y0t/o
	 Bd3p5YDFqA1IZIQhCT+IHTUd7APgL2CzvAnEIjnfHAphdaR6AFBXg+cSnUFnmKlKGG
	 H+It8vfmmjbqRUkHKvLkHSOKE/OvR5Lg6hai94T8=
Date: Sat, 2 Sep 2023 23:09:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Serguei Ivantsov <manowar@gsc-game.com>
Cc: regressions@lists.linux.dev
Subject: Re: DRBD broken in kernel 6.5 and 6.5.1
Message-ID: <2023090201-hybrid-footage-2622@gregkh>
References: <CAKH+VT3YLmAn0Y8=q37UTDShqxDLsqPcQ4hBMzY7HPn7zNx+RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKH+VT3YLmAn0Y8=q37UTDShqxDLsqPcQ4hBMzY7HPn7zNx+RQ@mail.gmail.com>

On Sat, Sep 02, 2023 at 10:37:04PM +0200, Serguei Ivantsov wrote:
> Hello,
> 
> After upgrading the kernel to 6.5 the system can't connect to the peer
> (6.4.11) anymore.
> I checked 6.5.1 - same issue.
> All previous kernels including 6.4.14 are working just fine.
> Checking the 6.5 changelog, I found commit
> 9ae440b8fdd6772b6c007fa3d3766530a09c9045 which mentioned some changes
> to DRBD.

If you revert that change, does it work properly?

If not, can you run 'git bisect' to try to find the offending change?

thanks,

greg k-h
