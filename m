Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0068A3C
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 05:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CDDC4339B;
	Tue, 24 Jan 2023 05:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674536954;
	bh=XCczaqZtBNFHQKqjgQkcJmjySTwAb+jycz3zrHYoxZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gk2oyQACnjE3w2t5BHWmo3Up1Tbw2TBE3/YqCMNEyMW4hlvR1NALK/l8hsyTASCnz
	 yEsHQldAkicQiFetyEIJ++UCxc6SCtI4GP1e2O9BpQzpIFil7FYBTfz7tAHxUsKJ/z
	 awwKnxKyQALGgMRn12O/+Ibk1HXvsMdPWqE9mt50=
Date: Tue, 24 Jan 2023 06:09:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasa Ostrouska <casaxa@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Lukasz Majczak <lma@semihalf.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
Message-ID: <Y89n98fRfTpLmPUg@kroah.com>
References: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com>

On Mon, Jan 23, 2023 at 09:44:34PM +0100, Sasa Ostrouska wrote:
> Hi all, sorry if I put somebody in CC who is not the correct one. I
> have a google pixelbook and using it with Fedora 37.
> The last few kernels supplied by fedora 37, 6.1.6, 6.1.7 but also some
> earlier have no working sound.
> I see the last kernel for me with working sound is 6.0.18.
> On my pixelbook this is showing in dmesg:

Any chance you can use 'git bisect' to track down the offending commit?

thanks,

greg k-h
