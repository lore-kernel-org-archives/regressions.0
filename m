Received: from outbound-smtp46.blacknight.com (outbound-smtp46.blacknight.com [46.22.136.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE552C80
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 10:21:16 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail01.blacknight.ie [81.17.254.10])
	by outbound-smtp46.blacknight.com (Postfix) with ESMTPS id 5BEBCFAB18
	for <regressions@lists.linux.dev>; Thu,  2 Dec 2021 10:13:26 +0000 (GMT)
Received: (qmail 8972 invoked from network); 2 Dec 2021 10:13:26 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.29])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 2 Dec 2021 10:13:26 -0000
Date: Thu, 2 Dec 2021 10:13:24 +0000
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
Message-ID: <20211202101324.GX3366@techsingularity.net>
References: <20211125151853.8540-1-mgorman@techsingularity.net>
 <20211127011246.7a8ac7b8@mail.inbox.lv>
 <20211129150117.GO3366@techsingularity.net>
 <20211201010348.31e99637@mail.inbox.lv>
 <20211130172754.GS3366@techsingularity.net>
 <20211201033836.4382a474@mail.inbox.lv>
 <20211201140005.GU3366@techsingularity.net>
 <74248b525d5ee03bfd00aaa66cd08a4582998cd6.camel@gmx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <74248b525d5ee03bfd00aaa66cd08a4582998cd6.camel@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Dec 02, 2021 at 04:11:38AM +0100, Mike Galbraith wrote:
> On Wed, 2021-12-01 at 14:00 +0000, Mel Gorman wrote:
> >
> > I've included another patch below against 5.16-rc1 but it'll apply to
> > 5.16-rc3. Using the same test I get
> 
> LTP testcases that stalled my box no longer do, nor can I manually
> trigger any unexpected behavior.
> 

Excellent, can I add the following?

Tested-by: Mike Galbraith <efault@gmx.de>

-- 
Mel Gorman
SUSE Labs
