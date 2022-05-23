Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B8369
	for <regressions@lists.linux.dev>; Mon, 23 May 2022 07:19:52 +0000 (UTC)
Date: Mon, 23 May 2022 09:09:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1653289748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fXGl02y6RMoaaLIdcX/WdBIdoqHbzfOjOVe1GnCbiE=;
	b=QPcVXQdx4xVhSQNlutu55LBMOkk8goN5Yd+g6Qk9Yhcf7EkeMlTCJzW1nF/JDLQiN2i/mo
	VjWizzvX3DYgUkZyZ+2uyfx/nvVxb5S4NoY8S641n+BVB4TAH9lhIaFLZ7lVVgaob3pKNm
	4pWcVIx8ARh4iCLufnUlYDEXCgoklMoENYGUdkkTQvBClT2iRWIYy+g82n5+gG7nSQpbzk
	uc2cziWUWFtIhRB6GAyOc7h0U/gsMResXK2mHeQZ1oOlV8jidjXd6V5gsMqOhIX8h8LX+t
	O6RM8h90/TUwzgfYhoKmiKym5D3RrsugGQi9aEXdVlBCn9Ymi1uwkeHzGWx78g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1653289748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9fXGl02y6RMoaaLIdcX/WdBIdoqHbzfOjOVe1GnCbiE=;
	b=pUirtnHH1iEt/KEVCWaqVL0y0hyZIc/JCv0kjCf/2hMeSSRWirZ4kt/fVVPpXhIL51SZmV
	Y8rSMa3rqAiRXqCA==
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
Message-ID: <YoszE8lQ9VcofLtX@linutronix.de>
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>

On 2022-05-22 01:22:00 [+0200], Stefan Wahren wrote:
> Hi,
Hi,

> while testing the staging/vc04_services/interface/vchiq_arm driver with my
> Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
> regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
> lru_cache_disable: replace work queue synchronization with synchronize_rcu
> 
> Usually i run "vchiq_test -f 1" to see the driver is still working [1].

What about
	https://lore.kernel.org/all/YmrWK%2FKoU1zrAxPI@fuller.cnet/

Sebastian
