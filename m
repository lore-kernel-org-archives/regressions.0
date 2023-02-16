Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC712747A
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 15:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0519BC433D2;
	Thu, 16 Feb 2023 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676560760;
	bh=aUBobFomaZu++V/z3TN862RlF8Gpj5REZIykBITcL58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqBVA10AXCjsux3YIwa2fodrNJHeOuFYmSuNljY3SNd0nn7UPAMH7WXZmWN8rPgyh
	 JKMBhblQLDcgQczf8qSepkGW7aAmEdyUDfCwLLAgYAbnaVF6eklPJgf/cZNK+StFJ+
	 lcJZ8owTQC8FANEBXHMRE2A8Zv0hIX9+ACdTnoCzQNQ+N4KQ9DjYHOg1ZPOynkkDKV
	 A0OBs0D3vaPCiU2iZCarZtMrdCKZ4/sdbGousJ+tbZfxfySpDh9Xo5v+o1Q3fq7cIL
	 y1oMZBxYj7qSfDjSTAg9ICD7wWN9DzyUqg9Nnq1/6NaXysAVbjWYfDQCA0Ot8u8Cv8
	 IW1C31J5vXr1g==
Date: Thu, 16 Feb 2023 08:19:17 -0700
From: Keith Busch <kbusch@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, michallinuxstuff@gmail.com
Subject: Re: [regression] Bug 217037 - cmb attributes missing from the nvme
 class under sysfs
Message-ID: <Y+5JdR02tlzD/TFS@kbusch-mbp>
References: <52f9afe2-f621-77d8-9d10-449d539e901d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52f9afe2-f621-77d8-9d10-449d539e901d@leemhuis.info>

On Thu, Feb 16, 2023 at 10:28:55AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217037 :
> 
> >  michallinuxstuff@gmail.com 2023-02-14 14:16:26 UTC
> > 
> > For the CMB-capable nvme ctrls, kernel was exposing couple of related attributes under the sysfs. E.g.
> > 
> > 
> > # grep . /sys/class/nvme/nvme0/cmb*
> > /sys/class/nvme/nvme0/cmb:cmbloc : x00000062
> > /sys/class/nvme/nvme0/cmb:cmbsz  : x0008021d
> > /sys/class/nvme/nvme0/cmbloc:98
> > /sys/class/nvme/nvme0/cmbsz:524829

The breakage is that the attributes are decided before we've setup the cmb
regions. I'll send a fix shortly.
