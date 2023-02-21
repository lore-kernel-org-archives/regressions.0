Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD96FAB
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 17:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBCDC433EF;
	Tue, 21 Feb 2023 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676998963;
	bh=oLPwNsH1kzbIduAeXPFkZrP52COW7jFDZtOfTDZi3h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3HiRF8pCUCycONsklo4cGqNJnCXZxsZDeUaHOwGWcV7e98cHmfU82qtJuBf1y1z7
	 UdKqq44l3OK4b8BbzuM6rSu1FTz8XQQXgw070fpepnzhdcLKJrlNKMkIkwfp6QSPd/
	 oZXwst6bFsiyRmXpXCjsZ3ZCfyp/L8ZS/GXu6WGZvs6Q5BVL44xPScpMVGyBI9T8di
	 ph9LD+HQn4dorMuN5GhFmhpa+D5IokEGyrYBs75Clu/+wvZ2c/vRfzVz3MO2YsQfvy
	 u82yqLw7xDlsxCX3E0ENQm4YISpm/JFmGXCZ/J+PufYxMH/0mWo5PthJx57a1OjqQh
	 0Qzrnjn+LTzCQ==
Date: Tue, 21 Feb 2023 10:02:39 -0700
From: Keith Busch <kbusch@kernel.org>
To: Michal Berger <michallinuxstuff@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] Bug 217037 - cmb attributes missing from the nvme
 class under sysfs
Message-ID: <Y/T5L1ZIssWY5wQZ@kbusch-mbp>
References: <52f9afe2-f621-77d8-9d10-449d539e901d@leemhuis.info>
 <Y+5JdR02tlzD/TFS@kbusch-mbp>
 <151a00d9-0ea2-eadb-72b4-fa8a2dd41bfc@kernel.dk>
 <CACosJgyjgh+cz6nTrKWVQ9P8Z9_wJGWGQBOjae2MoJrZQ3RmTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACosJgyjgh+cz6nTrKWVQ9P8Z9_wJGWGQBOjae2MoJrZQ3RmTQ@mail.gmail.com>

On Sun, Feb 19, 2023 at 11:54:37PM +0100, Michal Berger wrote:
> Have there been any patches submitted for testing? I don't see any as
> part of this thread nor at the bugzilla where the issue was initially
> reported. :)

I'm sorry, I didn't see your email in the bugzilla. With time running out, I
just posted the patch for upstream with a link to your original report, but I
apologize for not getting you CC'ed on it. The fix is included in the 6.2
release.
