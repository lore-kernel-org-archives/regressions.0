Received: from outbound-smtp57.blacknight.com (outbound-smtp57.blacknight.com [46.22.136.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10A2C82
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 15:06:22 +0000 (UTC)
Received: from mail.blacknight.com (pemlinmail03.blacknight.ie [81.17.254.16])
	by outbound-smtp57.blacknight.com (Postfix) with ESMTPS id 8A978FABAA
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 15:06:15 +0000 (GMT)
Received: (qmail 6766 invoked from network); 1 Dec 2021 15:06:15 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.17.29])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 1 Dec 2021 15:06:15 -0000
Date: Wed, 1 Dec 2021 15:06:13 +0000
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
Message-ID: <20211201150613.GV3366@techsingularity.net>
References: <20211125151853.8540-1-mgorman@techsingularity.net>
 <20211127011246.7a8ac7b8@mail.inbox.lv>
 <20211129150117.GO3366@techsingularity.net>
 <20211201010348.31e99637@mail.inbox.lv>
 <20211130172754.GS3366@techsingularity.net>
 <c2aee7e6b9096556aab9b47156e91082c9345a90.camel@gmx.de>
 <20211201130155.GT3366@techsingularity.net>
 <2899c7841c8afc23b329230bd940692ffd586f63.camel@gmx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <2899c7841c8afc23b329230bd940692ffd586f63.camel@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Dec 01, 2021 at 02:52:01PM +0100, Mike Galbraith wrote:
> On Wed, 2021-12-01 at 13:01 +0000, Mel Gorman wrote:
> > On Tue, Nov 30, 2021 at 06:59:58PM +0100, Mike Galbraith wrote:
> > > On Tue, 2021-11-30 at 17:27 +0000, Mel Gorman wrote:
> > > >
> > > > Obviously a fairly different experience and most likely due to
> > > > the
> > > > underlying storage.
> > >
> > > I bet a virtual nickle this is the sore spot.
> > >
> >
> > You win a virtual nickle!
> 
> I'm rich I'm rich... oh dang, virtual.
> 
> I went back to 5.15, and confirmed that wait_iff_congested() did not
> ever sleep with the try to eat /dev/zero load.  Nor did it with insane
> overcommit swap storm from hell with as much IO going on as my little
> box is capable of generating, making the surrounding congestion bits
> look.. down right expendable.
> 

wait_iff_congested was broken once the block layer stopped tracking
congestion and became a glorified cond_resched() in most cases. This is
why the series aimed to remove the reliance on
congestion_wait/wait_iff_congested.

-- 
Mel Gorman
SUSE Labs
