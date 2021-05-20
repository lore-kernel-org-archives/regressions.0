Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4791E70
	for <regressions@lists.linux.dev>; Thu, 20 May 2021 10:23:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11C606109F;
	Thu, 20 May 2021 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621506191;
	bh=Ne8XWBjCjC7wMEdXnGePN5BGuqE/9UQF0eMVmwjZmgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtYjcM9VChqKKpPfgLDpUZn56MOoNCY1C3QUQdtMNbLH22/6n+YCYMPx/ZL5MgbCX
	 zKFTBcw5DfH5Kdw0pP9Ces1FmRO8A9XdQ88MxPm8ipZGgNd6AGy6QPat4jS6JYVp4S
	 zbMVw6yN9c9vrB+H89nqbDNyi9adLX1rVGzeAvaE=
Date: Thu, 20 May 2021 12:02:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
Message-ID: <YKYzwBJNTy4Czd1A@kroah.com>
References: <87v97dhh2u.fsf@codeaurora.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v97dhh2u.fsf@codeaurora.org>

On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
> Hi,
> 
> I got several reports that this mhi commit broke ath11k in v5.12.3:
> 
> commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
> Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Date:   Wed Feb 24 15:23:04 2021 -0800
> 
>     bus: mhi: core: Process execution environment changes serially
>     
>     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
> 
> Here are the reports:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=213055
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=212187
> 
> https://bugs.archlinux.org/task/70849?project=1&string=linux
> 
> Interestingly v5.13-rc1 seems to work fine, at least for me, though I
> have not tested v5.12.3 myself. Can someone revert this commit in the
> stable release so that people get their wifi working again, please?

How does the mhi bus code relate to a ath11k driver?  What bus is that
on?

This seems odd...

greg k-h
