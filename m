Received: from outbound-smtp50.blacknight.com (outbound-smtp50.blacknight.com [46.22.136.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E62C82
	for <regressions@lists.linux.dev>; Tue, 30 Nov 2021 13:16:08 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail01.blacknight.ie [81.17.254.10])
	by outbound-smtp50.blacknight.com (Postfix) with ESMTPS id 5685BFA7D6
	for <regressions@lists.linux.dev>; Tue, 30 Nov 2021 13:09:38 +0000 (GMT)
Received: (qmail 27593 invoked from network); 30 Nov 2021 13:09:38 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.29])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 30 Nov 2021 13:09:38 -0000
Date: Tue, 30 Nov 2021 13:09:35 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Mike Galbraith <efault@gmx.de>
Cc: Alexey Avramov <hakavlad@inbox.lv>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
	Rik van Riel <riel@surriel.com>, Darrick Wong <djwong@kernel.org>,
	regressions@lists.linux.dev,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
Message-ID: <20211130130935.GR3366@techsingularity.net>
References: <20211125151853.8540-1-mgorman@techsingularity.net>
 <20211127011246.7a8ac7b8@mail.inbox.lv>
 <20211129150117.GO3366@techsingularity.net>
 <a20f17c4b1b5fdfade3f48375d148e97bd162dd6.camel@gmx.de>
 <20211130112244.GQ3366@techsingularity.net>
 <b8f607c771a4f698fcb651379ca30d3bb6a83ccd.camel@gmx.de>
 <b966ccc578ac60d3684cff0c88c1b9046b408ea3.camel@gmx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b966ccc578ac60d3684cff0c88c1b9046b408ea3.camel@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 30, 2021 at 01:51:10PM +0100, Mike Galbraith wrote:
> On Tue, 2021-11-30 at 13:00 +0100, Mike Galbraith wrote:
> > On Tue, 2021-11-30 at 11:22 +0000, Mel Gorman wrote:
> > > On Tue, Nov 30, 2021 at 11:14:32AM +0100, Mike Galbraith wrote:
> > > > >       }
> > > > > +       if (2 * write_pending <= reclaimable)
> > > >
> > > > That is always true here...
> > > >
> > >
> > > Always true for you or always true in general?
> >
> > "Here" as in the boxen located at my GPS coordinates :)
> >
> > > The intent of the check is "are a majority of reclaimable pages
> > > marked WRITE_PENDING?". It's similar to the check that existed prior
> > > to 132b0d21d21f ("mm/page_alloc: remove the throttling logic from the
> > > page allocator").
> >
> > I'll put my trace_printk() back and see if I can't bend-adjust it.
> 
> As it sits, write_pending is always 0 with tail /dev/zero.
> 

That is not a surprise for the test in question as it doesn't trigger
a case where there are lots of page cache being marked dirty and write
pending.

-- 
Mel Gorman
SUSE Labs
