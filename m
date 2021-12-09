Received: from outbound-smtp01.blacknight.com (outbound-smtp01.blacknight.com [81.17.249.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A172C9C
	for <regressions@lists.linux.dev>; Thu,  9 Dec 2021 10:03:09 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail02.blacknight.ie [81.17.254.11])
	by outbound-smtp01.blacknight.com (Postfix) with ESMTPS id 405C2C4A23
	for <regressions@lists.linux.dev>; Thu,  9 Dec 2021 09:53:20 +0000 (GMT)
Received: (qmail 22147 invoked from network); 9 Dec 2021 09:53:20 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.197.169])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 9 Dec 2021 09:53:19 -0000
Date: Thu, 9 Dec 2021 09:53:17 +0000
From: Mel Gorman <mgorman@techsingularity.net>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
	Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel <riel@surriel.com>,
	Mike Galbraith <efault@gmx.de>, Darrick Wong <djwong@kernel.org>,
	Shakeel Butt <shakeelb@google.com>, regressions@lists.linux.dev,
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure to
 make progress
Message-ID: <20211209095317.GL3366@techsingularity.net>
References: <20211202150614.22440-1-mgorman@techsingularity.net>
 <df896d80-9972-5be-55c2-c5b0c7135d4b@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <df896d80-9972-5be-55c2-c5b0c7135d4b@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Dec 08, 2021 at 10:20:47PM -0800, Hugh Dickins wrote:
> On Thu, 2 Dec 2021, Mel Gorman wrote:
> ...
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> ...
> > @@ -3478,14 +3520,18 @@ static void shrink_zones(struct zonelist *zonelist, struct scan_control *sc)
> >  			/* need some check for avoid more shrink_zone() */
> >  		}
> >  
> > +		if (!first_pgdat)
> > +			first_pgdat = zone->zone_pgdat;
> > +
> >  		/* See comment about same check for global reclaim above */
> >  		if (zone->zone_pgdat == last_pgdat)
> >  			continue;
> >  		last_pgdat = zone->zone_pgdat;
> >  		shrink_node(zone->zone_pgdat, sc);
> > -		consider_reclaim_throttle(zone->zone_pgdat, sc);
> >  	}
> >  
> > +	consider_reclaim_throttle(first_pgdat, sc);
> 
> My tmpfs swapping load (tweaked to use huge pages more heavily than
> in real life) is far from being a realistic load: but it was notably
> slowed down by your throttling mods in 5.16-rc, and this patch makes
> it well again - thanks.
> 
> But: it very quickly hit NULL pointer until I changed that last line to
> 
> 	if (first_pgdat)
> 		consider_reclaim_throttle(first_pgdat, sc);
> 
> I've given no thought as to whether that is the correct fix,
> or if first_pgdat should be set earlier in the loop above.
> 

It's the right fix, first_pgdat may be NULL if compaction can run for
each zone in the zonelist which could be the case for a tmpfs swapping
load that is huge page intensive.

Thanks Hugh.

-- 
Mel Gorman
SUSE Labs
