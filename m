Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C36FBB
	for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 17:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132AFC4331D;
	Sat, 28 Jan 2023 17:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674928350;
	bh=+ToD+2oFiXI72VVfZGhjDjDjCi/u1IoA9mUE6JuHeGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JUVhBmUlQDVnmNRnoorIp0jLqCh+69qPkSBh2MrTqBbeZXbs9zIhcUlQmIiS4NENT
	 zfEPoj8hutO+lAxicEzg5MctjP10prjr0rEf2qtXP1N/WagxfsnwmUH65zSduZIa6e
	 0RFTSvjV4s6NsQgqzNNcKxaGQRa7aX1cpT1kFWL8=
Date: Sat, 28 Jan 2023 18:52:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jason Montleon <jmontleo@redhat.com>
Cc: casaxa@gmail.com, cezary.rojewski@intel.com, lma@semihalf.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
Message-ID: <Y9Vg26wjGfkCicYv@kroah.com>
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>

On Sat, Jan 28, 2023 at 12:09:54PM -0500, Jason Montleon wrote:
> I did a bisect which implicated
> f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 as the first bad commit.
> 
> Reverting this commit on 6.1.8 gives me working sound again.
> 
> I'm not clear why this is breaking 6.1.x since it appears to be in
> 6.0.18 (7494e2e6c55e), which was the last working package in Fedora
> for the 6.0 line. Maybe something else didn't make it into 6.1?
> 
> 

So this is also broken in Linus's tree (6.2-rc5?)

thanks,

greg k-h
