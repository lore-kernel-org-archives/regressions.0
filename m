Received: from outbound-smtp55.blacknight.com (outbound-smtp55.blacknight.com [46.22.136.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C263172
	for <regressions@lists.linux.dev>; Fri, 26 Nov 2021 17:01:01 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp55.blacknight.com (Postfix) with ESMTPS id 8642BFBEDF
	for <regressions@lists.linux.dev>; Fri, 26 Nov 2021 16:52:13 +0000 (GMT)
Received: (qmail 10917 invoked from network); 26 Nov 2021 16:52:13 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.29])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 Nov 2021 16:52:13 -0000
Date: Fri, 26 Nov 2021 16:52:11 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Alexey Avramov <hakavlad@inbox.lv>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
	Rik van Riel <riel@surriel.com>, Mike Galbraith <efault@gmx.de>,
	Darrick Wong <djwong@kernel.org>, regressions@lists.linux.dev,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
Message-ID: <20211126165211.GL3366@techsingularity.net>
References: <20211125151853.8540-1-mgorman@techsingularity.net>
 <20211127011246.7a8ac7b8@mail.inbox.lv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20211127011246.7a8ac7b8@mail.inbox.lv>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Nov 27, 2021 at 01:12:46AM +0900, Alexey Avramov wrote:
> >After the patch, the test gets killed after roughly 15 seconds which is
> >the same length of time taken in 5.15.
> 
> In my tests, the 5.15 still performs much better.
> 

How much better?

> New question: is timeout=1 has sense? Will it save CPU?

It's the minimum stall time available -- it's 1 tick so the exact stall
time depends on HZ and yes, it's to stall to wait for something to
happen. It'll get woken early if another reclaimer makes forward progress.

This patch on top will stall less. I sent it already but it may not be
clear that I meant it to be applied on top of this patch.

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 176ddd28df21..167ea4f324a8 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3404,8 +3404,8 @@ static void consider_reclaim_throttle(pg_data_t *pgdat, struct scan_control *sc)
 	if (current_is_kswapd())
 		return;
 
-	/* Throttle if making no progress at high prioities. */
-	if (sc->priority < DEF_PRIORITY - 2 && !sc->nr_reclaimed)
+	/* Throttle if making no progress at high priority. */
+	if (sc->priority == 1 && !sc->nr_reclaimed)
 		reclaim_throttle(pgdat, VMSCAN_THROTTLE_NOPROGRESS);
 }
 

-- 
Mel Gorman
SUSE Labs
