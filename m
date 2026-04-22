Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849BA3D3318;
	Wed, 22 Apr 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862621; cv=none; b=YtgHwEpniP+m9yObYNjDeTpQlT93FzzELi/JbwtDA8c4FwNZ+y97KUqQ5gI9Lz3eDgf+0pHW7ZSd9vYr1BJmnOfdXfie5C/MmbfQV2QowlsF9hinoIDvWT6I5DRjxgxKo2gSXHDQkV+tm8oCArhVc09vmEk5tc+0nxdoXgtzD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862621; c=relaxed/simple;
	bh=bZJYejPinbwg2dgZwGQp878b4bBUZhrcDpVoZap6PBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogZJhy381nbjkpv6XAh2xYhkhD6dzoKf8zZ41Px6zhkSJr9Pa9J7dDce9J5l/xDT4J/jJeQF1xJT88ryLXtxkOs5sMRNMXMx7go1yZFsQaB1UNscbBCG6dojccADY39OEEenymdJVzTxPIJMWX4Xx9w6jhAiZag0ygmxtTlK/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e6/liRiA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e6/liRiA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bZJYejPinbwg2dgZwGQp878b4bBUZhrcDpVoZap6PBA=; b=e6/liRiAZhw/qeNrxn/I70F0hZ
	Vf61kP1Ugbq/deh03FjHdUTeOuzaXRUvK9G/4GyBzJyG/R3P/O3BaWLVh833nqNQVQz8aO3AB5Z6e
	9YYG9F5UNL0Wno7rVQq+S7k3nmq3vFkJsDLZ0zslfPgLdq0rVkRnY1dzfqd3dNlV9bB0no05hjt+A
	ax7a8uh61rMUI+6JAK5IKxSP/YtSt4Ya/FA91gw0nURDbva+mbzDK8KPB1CBomGDLtBwwxlK+tr8R
	Al7wJeGc7kv3ETE7JmM4UqbN0GakpY7k5F7EEzGoxRbH/AvZI/9G7HOJW68rZa5w2DfdHXkcaVAuW
	4VB+BlvA==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFX8L-0000000BPjS-3ewN;
	Wed, 22 Apr 2026 12:56:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C53D93008E2; Wed, 22 Apr 2026 14:56:47 +0200 (CEST)
Date: Wed, 22 Apr 2026 14:56:47 +0200
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
Message-ID: <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>

On Wed, Apr 22, 2026 at 11:50:26AM +0200, Mathias Stearn wrote:

> Additionally, it breaks tcmalloc specifically by failing to overwrite
> the cpu_id_start field at points where it was relied on for
> correctness.

This specific behaviour was documented as being wrong and running with
DEBUG_RSEQ would have flagged it.

The tcmalloc issue has been contentious for a long time. The tcmalloc
folks relied on something that was documented to be wrong. It has been
reported to the tcmalloc people many years ago and if you were to run
tcmalloc on most any kernel (very much including 6.19) with
DEBUG_RSEQ=y, it would have yelled.

The tcmalloc people didn't care. There was a proposal for an RSEQ
extension for what they need, and they didn't care. All this should be
in their bugzilla or whatever.

The RSEQ rework improved performance significantly for everyone, and
kept all the documented behaviour (+- arm64 bug). Tcmalloc got screwed
over because they relied on implementation behaviour that was
specifically documented to be broken. And they didn't care. Google was
very much aware of this. And hasn't lifted a finger to remedy it.


