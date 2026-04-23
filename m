Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6C12DC32C
	for <regressions@lists.linux.dev>; Thu, 23 Apr 2026 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776970401; cv=none; b=Ygzmu1Xg2Ima0KBd61P11wEOd7ox8j/Dn8rV+/x4/NXsB8PVj6OgKl+wF3svVYDxCwclKUDOi1ELrUGD55wdZBJ/Eg8XLYiZ+yXBVAbOoljILSieFPFV5ehlrDNbvvcDj2wvM/1uG+6aKYE2edlv2v2QyMACuMy1vQ9b4SsO/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776970401; c=relaxed/simple;
	bh=+tpjgevItmZWHyXhcU5jFIBGFFYCU+tf9QIwT3/y5a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kpg1eRs6UGNIAYVRtdlfkPTgvszuViMa6+JrEpzBwP0xzQ6Fp+/U7oIH7CXvQDVs8iO66EDJjtuOeMLxIgQb+AsdSDJFN6PhZpGFu+K5ov1re5Q9ZPiKHXLHHrZNeQ5KzejNUyaEJULx2/TgJamYxi9tTLShRD+l2BIAlzABX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ulWfGaN3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ulWfGaN3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E91D1BF3;
	Thu, 23 Apr 2026 11:53:14 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 002943F641;
	Thu, 23 Apr 2026 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776970399; bh=+tpjgevItmZWHyXhcU5jFIBGFFYCU+tf9QIwT3/y5a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulWfGaN3+aq1cLh0S77kH9MggoFAWGBM6EKH6BgVfYZSW07gnEEz/dSL6/PM5ZY4P
	 je9sR3D0H86PUpfmRS/PECX+9rIMWiO3GNhvt+WPpKxo/NFV/rZL57yXwRChOwvb0p
	 P1fECuvsJZtfVJiCjeBJvTLrK5yqgybSR3PXzoLY=
Date: Thu, 23 Apr 2026 19:53:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Mathias Stearn <mathias@mongodb.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
	Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <aepqMqPLE5b2FE-B@J2N7QTR9R3>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>

On Thu, Apr 23, 2026 at 10:41:02AM -0700, Linus Torvalds wrote:
> On Thu, 23 Apr 2026 at 10:19, Thomas Gleixner <tglx@kernel.org> wrote:
> I see some patches flying around, but am not clear on whether there
> was an actual patch that make this work again?

There's not a patch yet.

The diffs sent so far were options for fixing the arm64-specific issue
(missing aborts on preemption), NOT the generic issue (missing
clobbering of cpu_id_start that tcmalloc was depending upon).

For the arm64 issue, I think we can have a fix tomorrow (as it's end of
day here in the UK). Now that I've pored the entry code and the rseq
code, I think a variant of one of Thomas's proposed fixes will work, but
I'd like to make the naming/layering crystal clear so that it's harder
to break this by accident in future.

For the generic issue, hopefully the option Mathias proposed (clearing
cpu_id_start when rseq_cs is cleared) is sufficient. I'll work with
Mathias and Thomas for that.

I've also poked folk to make sure that CI systems run the rseq selftests
(which they evidently weren't), so that we catch this sort of thing
earlier.

Mark.
