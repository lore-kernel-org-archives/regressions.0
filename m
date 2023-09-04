Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53421FBD
	for <regressions@lists.linux.dev>; Mon,  4 Sep 2023 22:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CHRE1cLyKsjkZQAS4TIibSgoP17StuO7UkBUcla/njw=; b=D+uZMBdxDKG6znncSiuAJau2Ud
	5vF177GratsH7T+uHAqXC9sifFPs/tiD1SAUBEuwDv08ZBFomGnN8a2mDH+Plz4SFXgJWuvV0JzXm
	9zB836m84oe2oDjDceB56wub/hgBEU1M2NcfZVgEq22/nebAITuo54KuAHlHWOegx/mjZC3yLEHQ2
	qJDSUWB+UWkVGQXW14qrYpE0hoUt059LQ65HwGcEiB7qDzOmRezBZO5LvEwTzhVxDujCJGXBWkdSV
	cN8qI1yqqxNLHoueFq4oSVI0ZLTr/wkY4fB6IlFjpcgz4PbGteLH38M5TYwifobzYn4DVhcNyvK+g
	k51THaEw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qdHz6-002zz8-Cl; Mon, 04 Sep 2023 22:23:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F0484300642; Tue,  5 Sep 2023 00:23:51 +0200 (CEST)
Date: Tue, 5 Sep 2023 00:23:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hao Jia <jiahao.os@bytedance.com>
Cc: Benjamin Segall <bsegall@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Igor Raits <igor.raits@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: [External] Re: Fwd: WARNING: CPU: 13 PID: 3837105 at
 kernel/sched/sched.h:1561 __cfsb_csd_unthrottle+0x149/0x160
Message-ID: <20230904222351.GC2568@noisy.programming.kicks-ass.net>
References: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
 <xm26cyz4ibnb.fsf@google.com>
 <55e2861e-9722-08f8-2c49-966035ff4218@bytedance.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55e2861e-9722-08f8-2c49-966035ff4218@bytedance.com>

On Thu, Aug 31, 2023 at 04:48:29PM +0800, Hao Jia wrote:

> If I understand correctly, rq->clock_update_flags may be set to
> RQCF_ACT_SKIP after __schedule() holds the rq lock, and sometimes the rq
> lock may be released briefly in __schedule(), such as newidle_balance(). At
> this time Other CPUs hold this rq lock, and then calling
> rq_clock_start_loop_update() may trigger this warning.
> 
> This warning check might be wrong. We need to add assert_clock_updated() to
> check that the rq clock has been updated before calling
> rq_clock_start_loop_update().
> 
> Maybe some things can be like this?

Urgh, aside from it being white space mangled, I think this is entirely
going in the wrong direction.

Leaking ACT_SKIP is dodgy as heck.. it's entirely too late to think
clearly though, I'll have to try again tomorrow.
