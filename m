Received: from outbound-smtp42.blacknight.com (outbound-smtp42.blacknight.com [46.22.139.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6ABC6A
	for <regressions@lists.linux.dev>; Wed, 23 Feb 2022 12:56:58 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
	by outbound-smtp42.blacknight.com (Postfix) with ESMTPS id 2E2351D25
	for <regressions@lists.linux.dev>; Wed, 23 Feb 2022 12:50:05 +0000 (GMT)
Received: (qmail 528 invoked from network); 23 Feb 2022 12:50:04 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.223])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 23 Feb 2022 12:50:04 -0000
Date: Wed, 23 Feb 2022 12:50:02 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Shuang Zhai <szhai2@cs.rochester.edu>
Cc: akpm@linux-foundation.org, djwong@kernel.org, efault@gmx.de,
	hakavlad@inbox.lv, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
	regressions@lists.linux.dev, riel@surriel.com, vbabka@suse.cz
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress'
Message-ID: <20220223125002.GE4423@techsingularity.net>
References: <20220215144924.GS3366@techsingularity.net>
 <20220222172731.31949-1-szhai2@cs.rochester.edu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20220222172731.31949-1-szhai2@cs.rochester.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 22, 2022 at 12:27:31PM -0500, Shuang Zhai wrote:
> Mel Gorman wrote:
> > On Mon, Feb 14, 2022 at 04:10:50PM -0500, Shuang Zhai wrote:
> > > Hi Mel,
> > > 
> > > Mel Gorman wrote:
> > > >
> > > > Mike Galbraith, Alexey Avramov and Darrick Wong all reported similar
> > > > problems due to reclaim throttling for excessive lengths of time.
> > > > In Alexey's case, a memory hog that should go OOM quickly stalls for
> > > > several minutes before stalling. In Mike and Darrick's cases, a small
> > > > memcg environment stalled excessively even though the system had enough
> > > > memory overall.
> > > >
> > > 
> > > I recently found a regression when I tested MGLRU with fio on Linux
> > > 5.16-rc6 [1]. After this patch was applied, I re-ran the test with Linux
> > > 5.16, but the regression has not been fixed yet. 
> > > 
> > 
> > Am I correct in thinging that this only happens with MGLRU?
> 
> Sorry about the confusion and let me clarify on this. The regression happens
> on upstream Linux with the default page replacement mechanism.

Ok, the fio command for me simply exits with an error and even if it didn't
the test machine I have with persistent memory does not have enough pmem
to trigger memory reclaim issues with fio. Can you do the following please?

# echo 1 > vmscan/mm_vmscan_throttled/enable
# cat /sys/kernel/debug/tracing/trace_pipe > trace.out

and run the test? Compress trace.out with xz and send it to me by mail.
If the trace is too large, send as much as you can.

-- 
Mel Gorman
SUSE Labs
