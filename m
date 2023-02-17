Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EDF364
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 18:32:18 +0000 (UTC)
Date: Fri, 17 Feb 2023 10:26:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1676658376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b03GfOT4dkuf8arvwGMY+h7JsXZlR+KDPY8uVhKZfJ4=;
	b=xWPOsc5VYy1gGTb9sWGQQOnvZT4z3cLJyptPALTEUOIyzo1o/UcEIIR15mb202Psn6SljQ
	vLiT1BNs7vnef1jh57hqSVJWLxOR6v4r6k4BVt1Lvyq48vE9VEIAM90aWEebCyBvAN7VEz
	eXCg0ksgNq9WlC+5EWGs7OAvMOp0uns=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Shakeel Butt <shakeelb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Waiman Long <longman@redhat.com>,
	Sven Luther <Sven.Luther@windriver.com>
Subject: Re: [PATCH RFC] ipc/mqueue: introduce msg cache
Message-ID: <Y+/GxJcNykVQxcG+@P9FQF9L96D.corp.robot.car>
References: <20221220184813.1908318-1-roman.gushchin@linux.dev>
 <7a3e0cb1-54f0-73b2-d9e5-db4d28836bfc@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a3e0cb1-54f0-73b2-d9e5-db4d28836bfc@leemhuis.info>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 16, 2023 at 01:29:59PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> On 20.12.22 19:48, Roman Gushchin wrote:
> > Sven Luther reported a regression in the posix message queues
> > performance caused by switching to the per-object tracking of
> > slab objects introduced by patch series ending with the
> > commit 10befea91b61 ("mm: memcg/slab: use a single set of kmem_caches for all
> > allocations").
> 
> Quick inquiry: what happened to below patch? It was supposed to fix a
> performance regression reported here:

Hi Thorsten!

I wouldn't call it simple a regression, things a bit more complicated:
it was a switch to a different approach with different trade-offs,
which IMO make more sense for the majority of real-world workloads.
In two words: individual kernel memory allocations became somewhat slower
(but still fast), but we've saved 40%+ of slab memory on typical systems
and reduced the memory fragmentation.

The regression reported by Sven and my "fix" are related to one very specific
case: posix message queues. To my knowledge they are not widely used for
anything that performance-sensitive, so it's quite a niche use case.
My "fix" was also hand-crafted for the benchmark provided by Sven, so it might
not work for a more generic case. And I don't think it can be easily generalized
without adding cpu or memory overhead.

On the other hand I'm working on improving the speed of kernel memory allocations
in general (I posted early versions some weeks ago). Hopefully it will mitigate
the problem for Sven as well, so we won't need these message queue-specific
hacks.

Thanks!
