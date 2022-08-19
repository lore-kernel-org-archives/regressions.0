Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80423D2
	for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uJIjedYarczgR1fsBatrH00iIT2IriOKYXL6KyniivQ=; b=lVjBzwDnL3TrLWNLHk7fn3Zu5H
	uOneN7WQJLk3Ocvk6+5NHFKCHi7tRAShM40RhrUHtyho7QHrHAg9Gq8avL2auKCXw82/3DsATrxIt
	F3hHmQ/GZVrguU14SMnEi1xfiKp2iuBlEwpwe1KKSgKDtmA9SGJ+BqXAedD0JnDxVqpAQyIg4qqaS
	RhNgIJGA1P8YMmmiNOaRDxVc4CASWoh2Z6WsV5GwLITc0PsAkbTyKH4f66HcJh0TMFV+FqFwYi6Yk
	alrKd5oIBDJrz7hFmhwl4PIi0kemfNQnTOhstNfXVZ7F/ClCIyzzZAW3TEuqjTaBkBkLLt0oTPBjQ
	8fRWd75Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0ui-00B6SB-EK; Fri, 19 Aug 2022 12:15:48 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 84B18980163; Fri, 19 Aug 2022 14:15:46 +0200 (CEST)
Date: Fri, 19 Aug 2022 14:15:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 1017425@bugs.debian.org,
	=?iso-8859-1?Q?Martin-=C9ric?= Racine <martin-eric.racine@iki.fi>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: [PATCH] x86/speculation: Avoid LFENCE in FILL_RETURN_BUFFER on
 CPUs that lack it
Message-ID: <Yv9+8vR4QH6j6J/5@worktop.programming.kicks-ass.net>
References: <Yv7aRJ/SvVhSdnSB@decadent.org.uk>
 <Yv9OGVc+WpoDAB0X@worktop.programming.kicks-ass.net>
 <Yv9tj9vbQ9nNlXoY@worktop.programming.kicks-ass.net>
 <9395338630e3313c1bf0393ae507925d1f9af870.camel@decadent.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9395338630e3313c1bf0393ae507925d1f9af870.camel@decadent.org.uk>

On Fri, Aug 19, 2022 at 01:38:27PM +0200, Ben Hutchings wrote:

> So that puts the whole __FILL_RETURN_BUFFER inside an alternative, and
> we can't have nested alternatives.  That's unfortunate.

Well, both alternatives end with the LFENCE instruction, so I could pull
it out and do two consequtive ALTs, but unrolling the loop for i386 is
a better solution in that the sequence, while larger, removes the need
for the LFENCE.
