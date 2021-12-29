Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCD929CA
	for <regressions@lists.linux.dev>; Wed, 29 Dec 2021 23:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5F5C36AEA;
	Wed, 29 Dec 2021 23:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1640821554;
	bh=dY5gYi5AkIP2+p4HXO+O9a3TyRp3lgzPpmtlA7gCn8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pA/X3yUYAg2zrhiisVScrdIBKB37ZcdHsuCigc9sx9hMzrxvQSUKWM1/KgXTi9LpZ
	 NvmZxusSmCLsXPFG9RGozBP1glGiIZKfYnSuQBYWad2HSgOA8LHaHys6kxns/RBzh4
	 DCP+l+e3E5gRstnJ6HseDvWVJggpmcBxXKz9H0HM=
Date: Wed, 29 Dec 2021 15:45:53 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mel Gorman <mgorman@techsingularity.net>, Mark Brown
 <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>, Vlastimil Babka
 <vbabka@suse.cz>, Alexey Avramov <hakavlad@inbox.lv>, Rik van Riel
 <riel@surriel.com>, Mike Galbraith <efault@gmx.de>, Darrick Wong
 <djwong@kernel.org>, regressions@lists.linux.dev, Linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/1] mm: vmscan: Reduce throttling due to a failure
 to make progress
Message-Id: <20211229154553.09dd5bb657bc19d45c3de8dd@linux-foundation.org>
In-Reply-To: <caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info>
References: <20211202150614.22440-1-mgorman@techsingularity.net>
	<caf247ab-f6fe-a3b9-c4b5-7ce17d1d5e43@leemhuis.info>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Dec 2021 11:04:18 +0100 Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 02.12.21 16:06, Mel Gorman wrote:
> > Mike Galbraith, Alexey Avramov and Darrick Wong all reported similar
> > problems due to reclaim throttling for excessive lengths of time.
> > In Alexey's case, a memory hog that should go OOM quickly stalls for
> > several minutes before stalling. In Mike and Darrick's cases, a small
> > memcg environment stalled excessively even though the system had enough
> > memory overall.
> 
> Just wondering: this patch afaics is now in -mm and  Linux next for
> nearly two weeks. Is that intentional? I had expected it to be mainlined
> with the batch of patches Andrew mailed to Linus last week, but it
> wasn't among them.

I have it queued for 5.17-rc1.

There is still time to squeeze it into 5.16, just, with a cc:stable. 

Alternatively we could merge it into 5.17-rc1 with a cc:stable, so it
will trickle back with less risk to the 5.17 release.

What do people think?
