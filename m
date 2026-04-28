Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401892741B5;
	Tue, 28 Apr 2026 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363997; cv=none; b=uSvc9vR4YQPkhJpWfzb+0je/zoOYGg6kfn42TQ1xK2RdtCsSrq390QOKK3B4CAUJV2HKbo2Y0ZNwM7sWNpsENbzWeXkKYjZKgf+a2yPtAw2oy35I60/T9J5XmUTG/1JPixiqOhXZMQVQcvmkbFsXOrcc3C6C7nmfB97Pim89CnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363997; c=relaxed/simple;
	bh=qoig90edamOZFlnbLlbQymvUio1eI4YwhRleMQv/aYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ3bcqkMIPzZ5r4qTgikYebJyelRc+Oi33Hfs/+SCqdgden/YnMp6lnEWdU2nkPTLHcKSTbUnE/4jrFzv2qB4Ss5+QigTVof0EW9OJLLRqW1c0cFgUX+8NEkhhmYH+2m5FolcatOuONsHlnyaTsjsEFrETQXcO0I87KjKOslfjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k4KfIK0I; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k4KfIK0I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6NilECp0m2FUAOg9cioK7uduTaZS/ORavn8koLfI5Eg=; b=k4KfIK0ITOixVALBXHoYtDhJKs
	6j641Q59Lf3O0PVWJk0atTPTd5JM7gGutG4Wc9/KZ4oSNL9fHuWyBGU8A136Dbl3irdF+YK44Lq58
	FQkTbxxtUyi+4hpTCoOrPwxVwhbdR3SNd33wA2sn0s6uJdgYNAIMSEa8CGMTN2VoZDOFiwE/BzHoT
	bij4WqgQkRtacxLbYaaIrtCTbq/SbHW6XOsU5bQkZTZVX1zw2Zz1cO+hG1b5iQwXjUV3jaGJQKPmS
	lW3VgvP8PdW67KFp1F2z+6TzxjeeIOkmU4Z4dGWIcHKV14FYHReRm/8yqnDSl2aGicM4aQ/J3EyO7
	X3n8Wd3g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdZ7-00000002NAr-33r0;
	Tue, 28 Apr 2026 08:13:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D832D301CEB; Tue, 28 Apr 2026 10:13:08 +0200 (CEST)
Date: Tue, 28 Apr 2026 10:13:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ingo Molnar <mingo@kernel.org>, Blake Oler <blake.oler@mongodb.com>,
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
Message-ID: <20260428081308.GK3102924@noisy.programming.kicks-ass.net>
References: <87ik9i0xlj.ffs@tglx>
 <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx>
 <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
 <87v7dgzbo7.ffs@tglx>
 <20260424150318.GE641209@noisy.programming.kicks-ass.net>
 <87se8kywhb.ffs@tglx>
 <87jyttz8cf.ffs@tglx>
 <20260428073938.GH3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428073938.GH3126523@noisy.programming.kicks-ass.net>

On Tue, Apr 28, 2026 at 09:39:38AM +0200, Peter Zijlstra wrote:

> > +	return IS_ALIGNED((unsigned long)rseq, rseq_alloc_align()) &&
> > +		rseq_len >= offsetof(struct rseq, end);
> > +}
> 
> Given we really only differentiate between ORIG_RSEQ_SIZE (32) and
> sizeof(struct rseq), perhaps we should also add something like:
> 
> 	if (rseq_len != sizeof(struct rseq))
> 		return false;
> 

Wakeup juice, I need more wakeup juice :-) Its there, except written
weirdly with that offsetof thing.
