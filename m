Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B98487
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 07:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B48C433C8;
	Wed, 20 Sep 2023 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695195302;
	bh=cceVS0pUPFMspnErpmWDwRXbsiaVz9xJE/gAJ0/F06M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCKzrhLCwQ5ZIai38bw+bqq1ucFDO3l3FeWxisGEHheiAFeq68ibWIItiD4lTcLyd
	 bOMRGg30E/gaIJvVURaTvxG8R1+X2H231Un56MwkAEUltvU+I3vIk0FqdzK7XLmgMN
	 8fN3p8GRxwfLKAyH6Q9LwwSrzgsRXtRiWZ+dYkIo=
Date: Wed, 20 Sep 2023 09:34:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ricky WU <ricky_wu@realtek.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Paul Grandperrin <paul.grandperrin@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Wei_wang <wei_wang@realsil.com.cn>,
	Roger Tseng <rogerable@realtek.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from
 drivers/misc/cardreader breaks NVME power state, preventing system boot
Message-ID: <2023092041-shopper-prozac-0640@gregkh>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
 <82469f2f-59e4-49d5-823d-344589cbb119@leemhuis.info>
 <2023091333-fiftieth-trustless-d69d@gregkh>
 <7991b5bd7fb5469c971a2984194e815f@realtek.com>
 <2023091921-unscented-renegade-6495@gregkh>
 <995632624f0e4d26b73fb934a8eeaebc@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <995632624f0e4d26b73fb934a8eeaebc@realtek.com>

On Wed, Sep 20, 2023 at 07:30:00AM +0000, Ricky WU wrote:
> Hi Greg k-h,
> 
> This patch is our solution for this issue...
> And now how can I push this? 

Submit it properly like any other patch, what is preventing that from
happening?

thanks,

greg k-h
