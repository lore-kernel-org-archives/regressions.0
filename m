Received: from outbound-smtp56.blacknight.com (outbound-smtp56.blacknight.com [46.22.136.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B868
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 13:11:09 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail02.blacknight.ie [81.17.254.11])
	by outbound-smtp56.blacknight.com (Postfix) with ESMTPS id A452CFAB00
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 13:01:57 +0000 (GMT)
Received: (qmail 12057 invoked from network); 1 Dec 2021 13:01:57 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.29])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 1 Dec 2021 13:01:57 -0000
Date: Wed, 1 Dec 2021 13:01:55 +0000
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
Message-ID: <20211201130155.GT3366@techsingularity.net>
References: <20211125151853.8540-1-mgorman@techsingularity.net>
 <20211127011246.7a8ac7b8@mail.inbox.lv>
 <20211129150117.GO3366@techsingularity.net>
 <20211201010348.31e99637@mail.inbox.lv>
 <20211130172754.GS3366@techsingularity.net>
 <c2aee7e6b9096556aab9b47156e91082c9345a90.camel@gmx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <c2aee7e6b9096556aab9b47156e91082c9345a90.camel@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Nov 30, 2021 at 06:59:58PM +0100, Mike Galbraith wrote:
> On Tue, 2021-11-30 at 17:27 +0000, Mel Gorman wrote:
> >
> > Obviously a fairly different experience and most likely due to the
> > underlying storage.
> 
> I bet a virtual nickle this is the sore spot.
> 

You win a virtual nickle!

Using an older laptop with slower storage and less memory a frequency
analysis of the stall reasons and source showed the top triggering event
was

Event count:                6210
 mm_vmscan_throttled: nid=0 usec_timeout=100000 usect_delayed=xxx reason=VMSCAN_THROTTLE_WRITEBACK

 => trace_event_raw_event_mm_vmscan_throttled <ffffffff9987224a>
 => reclaim_throttle <ffffffff99873df2>
 => shrink_node <ffffffff99875bd5>
 => do_try_to_free_pages <ffffffff99875cf8>
 => try_to_free_pages <ffffffff998772e3>
 => __alloc_pages_slowpath.constprop.114 <ffffffff998c2ad9>
 => __alloc_pages <ffffffff998c366b>
 => folio_alloc <ffffffff998e4107>
 => page_cache_ra_unbounded <ffffffff99868fab>
 => filemap_fault <ffffffff9985cb13>
 => __do_fault <ffffffff99899361>
 => __handle_mm_fault <ffffffff998a1470>
 => handle_mm_fault <ffffffff998a19ba>
 => do_user_addr_fault <ffffffff99688734>
 => exc_page_fault <ffffffff9a07bcd7>
 => asm_exc_page_fault <ffffffff9a200ace>

-- 
Mel Gorman
SUSE Labs
