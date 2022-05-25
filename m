Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F5CEC4
	for <regressions@lists.linux.dev>; Wed, 25 May 2022 14:26:31 +0000 (UTC)
Date: Wed, 25 May 2022 16:26:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1653488789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0Mv/hEChR/V+/w+toAJrTJdteedx/mB9mVO7SBB6UM=;
	b=ebhCUS1Dh2guv3NsO2B1Nc7XeAfwTNwhQB/RAHF98DVM8HdNKorMeaMexNT/uvyP2q4myg
	iaBpOcDQzD7tbhdKEMmxzUFr44Q8AN2hZrfcEg0cUgFP60D3nhsie/lX92qhixbD4WjYy6
	RXcj72CnZdVi/OxACy4JMJLBJRxQBW4HNBKx3dhBkNjYeGS2e4JhaMqjh+u18vIj7VcOUF
	W+CtElWdYcAZDkkU6rIhXeL6eA9y6DMsBflN5RofteAooeCZf3+pwf3xrVL48D4Rvczigt
	FxXdxgwDKAsTKdx3NUQNC+Dl3s8Oytnc5c1PbjkMFLGUVmIGhxN0PhxWdzVj7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1653488789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g0Mv/hEChR/V+/w+toAJrTJdteedx/mB9mVO7SBB6UM=;
	b=oxXUxxwUv1uzXvHWGZCI3ZXGoDpOjQL+DfKrw55C4YVxTXrMZ2xsifAi/6R9Hf2p10vwnA
	+vUNdOXnk8LbxaAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mel Gorman <mgorman@techsingularity.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Phil Elwell <phil@raspberrypi.com>, regressions@lists.linux.dev
Subject: Re: vchiq: Performance regression since 5.18-rc1
Message-ID: <Yo48k4InPmj8lDxZ@linutronix.de>
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
 <YoszE8lQ9VcofLtX@linutronix.de>
 <Yo41ggMvkI1B9TeM@fuller.cnet>
 <e0402350-687e-14b6-2e30-4b459afa9afb@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e0402350-687e-14b6-2e30-4b459afa9afb@i2se.com>

On 2022-05-25 16:07:47 [+0200], Stefan Wahren wrote:
> this was the same as Paul send. I think i need more time for investigation,
> maybe there is an issue with the application.

I haven't seen Paul referring to *that* patch. He pointed to some fs/
related changes.

Sebastian
