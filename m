Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF279CC
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 10:31:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3A04567373; Fri, 11 Aug 2023 12:31:24 +0200 (CEST)
Date: Fri, 11 Aug 2023 12:31:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Christoph Hellwig <hch@lst.de>, Wang Yugui <wangyugui@e16-tech.com>,
	linux-btrfs@vger.kernel.org, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: Re: btrfs write-bandwidth performance regression of 6.5-rc4/rc3
Message-ID: <20230811103123.GA17179@lst.de>
References: <20230801235123.B665.409509F4@e16-tech.com> <20230801155649.GA13009@lst.de> <20230802080451.F0C2.409509F4@e16-tech.com> <20230802092631.GA27963@lst.de> <adfdb843-2220-5969-e647-d31ba8684d42@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adfdb843-2220-5969-e647-d31ba8684d42@leemhuis.info>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Aug 11, 2023 at 10:58:27AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Ok, so you have a case where the offload for the checksumming generation
> > actually helps (by a lot).  Adding Chris to the Cc list as he was
> > involved with this.
> 
> Radio silence from Chris here and on lore in general afaics. Also
> nothing new in this thread for more than a week now.

We're also waiting for additional data from Wang.

I'll be off for a two weeks vacation tomorrow with rather limited
inter connectivity, so if we want to make progress I'd better be
today or tomorrow morning.

