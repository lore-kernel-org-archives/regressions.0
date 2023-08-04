Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D4946D
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 13:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F87C433C7;
	Fri,  4 Aug 2023 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691155833;
	bh=im2RMECXabHoMAl6aoY/p4hXCll2/KJcbIiea1mLir8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofNDSiWzVm0r4xjuy9aOUMs1uNTeXTfZCnUkjNUhaFV5M9txgRHS1AUo5AAArQbH3
	 MzMtKRv4PI00/z539qt+HoROQ+2+b3uRVrvQYfJC/csYFEbUgcZJ03ZMwm0WNun/9H
	 7fMIGryo5UW8koPC5Wyo9ik6eSLHkVNK84aj4kZQ=
Date: Fri, 4 Aug 2023 15:30:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH 04/24] PM: hibernate: move finding the resume device out
 of software_resume
Message-ID: <2023080422-hurricane-rehab-7c2d@gregkh>
References: <20230531125535.676098-1-hch@lst.de>
 <20230531125535.676098-5-hch@lst.de>
 <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
 <20230804103101.GA23613@lst.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804103101.GA23613@lst.de>

On Fri, Aug 04, 2023 at 12:31:01PM +0200, Christoph Hellwig wrote:
> Looks good, thanks!
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


