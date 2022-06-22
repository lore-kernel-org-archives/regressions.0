Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11CA52
	for <regressions@lists.linux.dev>; Wed, 22 Jun 2022 00:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D927C3411C;
	Wed, 22 Jun 2022 00:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1655856976;
	bh=PgcuBqHZZbQa503bM4Scmsi3N1vfutVANcvd63kNuss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YHoqI6jQZ9n64iK1Jnv8hF/5uCm+hiv+wdBc20tt7b8V8OZ7QWtrkQlxj2VNsvJKj
	 7sskAV1Hp8mo7yYAlK6aUvFLWEPI43CTBovgt3bBjIIDNbIE+3D/VqolRzlITy0Lzw
	 qUEUuqLFPqy0DqUx5v/1U2vrl5kwVd0WsTTagsTM=
Date: Tue, 21 Jun 2022 17:15:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Michael Larabel <Michael@MichaelLarabel.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Minchan Kim
 <minchan@kernel.org>, Matthew Wilcox <willy@infradead.org>, Mel Gorman
 <mgorman@techsingularity.net>, Nicolas Saenz Julienne
 <nsaenzju@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Stefan Wahren
 <stefan.wahren@i2se.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: [patch v5] mm: lru_cache_disable: replace work queue
 synchronization with synchronize_rcu
Message-Id: <20220621171554.7ad01842c933b3049afeb3b6@linux-foundation.org>
In-Reply-To: <67d39f78-8eed-f49a-b3b0-18f77f9821cd@leemhuis.info>
References: <YhUI1wUtV8yguijO@fuller.cnet>
	<YhUKRzEKxMvlGQ5n@fuller.cnet>
	<YiI+a9gTr/UBCf0X@fuller.cnet>
	<20220304163554.8872fe5d5a9d634f7a2884f5@linux-foundation.org>
	<Yin7hDxdt0s/x+fp@fuller.cnet>
	<YkWyLaom/r7jXgbA@zn.tnic>
	<YmrWK/KoU1zrAxPI@fuller.cnet>
	<20220528141809.732788db257253396462c79e@linux-foundation.org>
	<134065a4-0446-bbbc-fca8-59f32798cf08@MichaelLarabel.com>
	<0ce05ce7-1a00-82df-f37a-bf7f9e216504@MichaelLarabel.com>
	<67d39f78-8eed-f49a-b3b0-18f77f9821cd@leemhuis.info>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 19 Jun 2022 14:14:03 +0200 Thorsten Leemhuis <regressions@leemhuis.info> wrote:

> Andrew, is there a reason why this patch afaics isn't mainlined yet and
> lingering in linux-next for so long? 

I didn't bother doing a hotfixes merge last week because there wasn't anything
very urgent-looking in there.  I'll be putting together a pull request later this week.
