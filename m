Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B234CF9
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 07:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C91CC433BA;
	Tue, 19 Sep 2023 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695107184;
	bh=lnoQzkQJCdvMNn1Qyd6ZH0UMjb+wlW5nHACslkBfBgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StoaHhYP18X4h6Sh6L8Q4DOr38v1tcC7PXjYAuOJfvs9sjbBMz9csxevwjJoy5ONW
	 2QgMYQA8UeCr4xexpnSSGjLJ1HxBFxGgBbi52O1z2rwqUFz4KgvEZ07PMHNBQfsod1
	 yh1aqvA5RPTToQ9Ub2SPn99lQmJHcDUOd/zTSnNU=
Date: Tue, 19 Sep 2023 09:06:15 +0200
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
Message-ID: <2023091921-unscented-renegade-6495@gregkh>
References: <5DHV0S.D0F751ZF65JA1@gmail.com>
 <82469f2f-59e4-49d5-823d-344589cbb119@leemhuis.info>
 <2023091333-fiftieth-trustless-d69d@gregkh>
 <7991b5bd7fb5469c971a2984194e815f@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7991b5bd7fb5469c971a2984194e815f@realtek.com>

On Tue, Sep 19, 2023 at 02:20:53AM +0000, Ricky WU wrote:
> Hi Greg k-h，
> 
> In order to cover the those platform Power saving issue, 
> our approach on new patch will be different from the previous patch (101bd907b4244a726980ee67f95ed9cafab6ff7a).
> 
> So we need used fixed Tag on 101bd907b4244a726980ee67f95ed9cafab6ff7a 
> or a new patch for this problem?

I'm sorry, but I do not understand.  I think a new change is needed
here, right?  Or are you wanting a different commit backported to stable
trees?  What about Linus's tree now?

What exactly should I do here?

confused,

greg k-h
