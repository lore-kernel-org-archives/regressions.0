Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A52562
	for <regressions@lists.linux.dev>; Tue, 20 Sep 2022 14:12:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 25B9968AA6; Tue, 20 Sep 2022 16:12:18 +0200 (CEST)
Date: Tue, 20 Sep 2022 16:12:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Dusty Mabe <dusty@dustymabe.com>, Ming Lei <ming.lei@redhat.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: regression caused by block: freeze the queue earlier in
 del_gendisk
Message-ID: <20220920141217.GA12560@lst.de>
References: <017845ae-fbae-70f6-5f9e-29aff2742b8c@dustymabe.com> <YxBZ4BBjxvAkvI2A@T590> <20220907073324.GB23826@lst.de> <Yxr4SD4d0rZ9TZik@T590> <20220912071618.GA4971@lst.de> <Yx/jLTknQm9VeHi4@T590> <95cbd47d-46ed-850e-7d4f-851b35d03069@dustymabe.com> <f2c28043-59e6-0aee-b8bf-df38525ee899@leemhuis.info> <d39e9149-fcb6-1f7c-4c19-234e74f286f8@kernel.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d39e9149-fcb6-1f7c-4c19-234e74f286f8@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Sep 20, 2022 at 08:05:06AM -0600, Jens Axboe wrote:
> Christoph and I discussed this one last week, and he has a plan to try
> a flag approach. Christoph, did you get a chance to bang that out? Would
> be nice to get this one wrapped up.

I gave up on that as it will be far too much change so late in
the cycle and sent you the revert yesterday.
