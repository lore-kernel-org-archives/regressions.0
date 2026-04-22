Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E67B3D1CAA;
	Wed, 22 Apr 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863628; cv=none; b=MP+NNTzEA2mqIkid/1flehMB+ZsvT/kkQ8a5Bdi9J8JrGQmxpQvJSsT7/pDFcoxUmHGIrAQCdSjGvW7S+BvqycnIAyzvkqDX0cFf5obpzRd3DJzgE32B+Q8185/cgpYQKcSKOmjYWjg8eoBOcqvSC0y6QB8GWdN9KiRFzCAr4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863628; c=relaxed/simple;
	bh=kxIVk+2lF1IFEhTBCo9akungjiYvqR+2SYK2EwxtkmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHLpgfYwjp1EhG12/xZ/MChUQJFnmk6pb8Ywn3sCIYTf7Iz5IuZsinqpDnW5CU0Tka2ORGpgQTnn/bl4W4Ucg8eOLRvZN0b4ecl6cnTe/8zS4QuBFDAupDfCQ+v7z2653MxqAmn/026EVEbQ+hto3HqEQG9s5Guiy4R0r6oNQAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tX/+ArC+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tX/+ArC+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LVW29VgTBcSEwz3Up8blF0S6ObWPFVHT6wdQNGV4Ppk=; b=tX/+ArC+dmBJ6gpIMcIYmbvE+A
	jhYyel6wJNfb+MJR+kK3WOCw7ZNeKOlhAGIcKkLUMM89y85oTDHlF2nxnLtxR4TUIAzw2am5ABfPx
	3WkGAsz2BIIbNjXqiihnqldwDQFS9bKqNfjO0wBefgzxYL2QvIVy8PXI3+GilcYW27NU1pnZCK5KZ
	fbdBWi9e5pRJjHehmA3JtJwrmcTaw4Dk2AriRrqDXEAa+n4ietTA625ZzWgXA+C8xx9h90JiyKpHS
	4TVPAMKdCeGSyANp7YOpkz7SprOauIUcKRikeDXvk5RgnFpSMPjS6ZuUU548gtCgNqhJhUbCrdW4Z
	2zL5+/Rg==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXOd-0000000Bn56-26nM;
	Wed, 22 Apr 2026 13:13:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2301B3008E2; Wed, 22 Apr 2026 15:13:38 +0200 (CEST)
Date: Wed, 22 Apr 2026 15:13:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422125647.GP3126523@noisy.programming.kicks-ass.net>

On Wed, Apr 22, 2026 at 02:56:47PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:
> 
> > Additionally, it breaks tcmalloc specifically by failing to overwrite
> > the cpu_id_start field at points where it was relied on for
> > correctness.
> 
> This specific behaviour was documented as being wrong and running with
> DEBUG_RSEQ would have flagged it.
> 
> The tcmalloc issue has been contentious for a long time. The tcmalloc
> folks relied on something that was documented to be wrong. It has been
> reported to the tcmalloc people many years ago and if you were to run
> tcmalloc on most any kernel (very much including 6.19) with
> DEBUG_RSEQ=y, it would have yelled.
> 
> The tcmalloc people didn't care. There was a proposal for an RSEQ
> extension for what they need, and they didn't care. All this should be
> in their bugzilla or whatever.
> 
> The RSEQ rework improved performance significantly for everyone, and
> kept all the documented behaviour (+- arm64 bug). Tcmalloc got screwed
> over because they relied on implementation behaviour that was
> specifically documented to be broken. And they didn't care. Google was
> very much aware of this. And hasn't lifted a finger to remedy it.

Also: https://lore.kernel.org/all/874io5andc.ffs@tglx/ 
