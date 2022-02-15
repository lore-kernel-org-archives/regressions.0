Received: from outbound-smtp20.blacknight.com (outbound-smtp20.blacknight.com [46.22.139.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B301578
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 14:54:39 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp20.blacknight.com (Postfix) with ESMTPS id 3AF921C3829
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 14:49:27 +0000 (GMT)
Received: (qmail 6599 invoked from network); 15 Feb 2022 14:49:26 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.223])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 15 Feb 2022 14:49:26 -0000
Date: Tue, 15 Feb 2022 14:49:24 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Shuang Zhai <szhai2@cs.rochester.edu>
Cc: akpm@linux-foundation.org, djwong@kernel.org, efault@gmx.de,
	hakavlad@inbox.lv, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
	regressions@lists.linux.dev, riel@surriel.com, vbabka@suse.cz
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
Message-ID: <20220215144924.GS3366@techsingularity.net>
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <20220214211050.31049-1-szhai2@cs.rochester.edu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20220214211050.31049-1-szhai2@cs.rochester.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Feb 14, 2022 at 04:10:50PM -0500, Shuang Zhai wrote:
> Hi Mel,
> 
> Mel Gorman wrote:
> >
> > Mike Galbraith, Alexey Avramov and Darrick Wong all reported similar
> > problems due to reclaim throttling for excessive lengths of time.
> > In Alexey's case, a memory hog that should go OOM quickly stalls for
> > several minutes before stalling. In Mike and Darrick's cases, a small
> > memcg environment stalled excessively even though the system had enough
> > memory overall.
> >
> 
> I recently found a regression when I tested MGLRU with fio on Linux
> 5.16-rc6 [1]. After this patch was applied, I re-ran the test with Linux
> 5.16, but the regression has not been fixed yet. 
> 

Am I correct in thinging that this only happens with MGLRU?

-- 
Mel Gorman
SUSE Labs
