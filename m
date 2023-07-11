Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4F1E504
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 17:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E61C433C8;
	Tue, 11 Jul 2023 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689096068;
	bh=D9NhEWLQ+8T9pjVANP9yzpBRkQDSj1Txy7/I4fmLuC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLFN6GiFIF2oAhds3PLA6zV44YXggdZxwAeEVlcqsKqWBHuPqaV5HW9K/0Dkuz8gE
	 0HUN1+ZGbbcWIsLs+2jrzjZ8QjkUM8BtbdDEfRlHRwQ8fPmkuMUW27GnQ5X5AVuqmN
	 zmAg0Jf3+YhzrlVe8MMNe9QKFgdkEHb/umFJohA8s1w1ccSCqNPigVitG9PhIumFvW
	 UbVDZGoGByXpwryx/EvfRJI4WoDov13LYhLvXqmPhzC+mTlyJCAPICiei7qFF5xLb7
	 7n7iTgz7BD249Yj1Jg+TsSMYYznL+67fzI2qiSD6+ZGB6O/dD3tVu3mX4huGmIK+lQ
	 HpunQ6cFV9eFQ==
Date: Tue, 11 Jul 2023 11:21:04 -0600
From: Keith Busch <kbusch@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	"Clemens S." <cspringsguth@gmail.com>,
	Martin Belanger <martin.belanger@dell.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	John Meneghini <jmeneghi@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux NVMe <linux-nvme@lists.infradead.org>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Javier Gonzalez <javier.gonz@samsung.com>,
	=?utf-8?B?67CV7KeE7ZmY?= <jh.i.park@samsung.com>
Subject: Re: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV
 (Samsung SM-953 Datacenter SSD)
Message-ID: <ZK2PgNizcMLW+S/V@kbusch-mbp.dhcp.thefacebook.com>
References: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
 <ZJsKBkPqoWzYyngS@kbusch-mbp.dhcp.thefacebook.com>
 <6f333133-2cc4-406a-d6c2-642ac6ccabca@leemhuis.info>
 <CGME20230710155902eucas1p2b464a29adc35e983c73b00d18ab5344c@eucas1p2.samsung.com>
 <ZKwqvTMPVmhnkZjS@kbusch-mbp.dhcp.thefacebook.com>
 <f0fdf86e-4293-8e07-835d-b5a866252068@samsung.com>
 <462e0e1e-98ea-0f3c-4aaa-8d44f0a8e664@leemhuis.info>
 <20230711120609.GB27050@lst.de>
 <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whXh9sgLo24RO02JjfD0m3HE5NADRPWoEd+dW6bruFhVA@mail.gmail.com>

On Tue, Jul 11, 2023 at 09:47:00AM -0700, Linus Torvalds wrote:
> On Tue, 11 Jul 2023 at 05:06, Christoph Hellwig <hch@lst.de> wrote:
> For example, we have this completely unacceptable garbage:
> 
>         ret = nvme_global_check_duplicate_ids(ctrl->subsys, &info->ids);
>         if (ret) {
>                 dev_err(ctrl->device,
>                         "globally duplicate IDs for nsid %d\n", info->nsid);
>                 nvme_print_device_info(ctrl);
>                 return ret;
>         }
> 
> iow, the code even checks for and *notices* that there are duplicate
> IDs, and what does it do? It then errors out.

This check came from a recent half-baked spec feature called "Dispersed
Namespaces" that caused breakage and data corruption when used in Linux.
Rather than attempt to support that mostly vendor specific feature, the
driver attempted to fence that off as unmaintainable. This check wasn't
aimed at enforcing "correctness", but it certainly found a lot of that
as collatoral damage. Let's see if we can find a better way to detect
the difference with a sane fallback as you suggest.
