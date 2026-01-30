Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4033031C;
	Fri, 30 Jan 2026 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769791614; cv=none; b=kDcW0CMXcRj2e5lUJ/XE63Oor47wiYnehOD8efwO7pkoNpQ3lWu35f0IpSK4YsN1ibdZpDjR5aq53N31IojoDnohANQvqI+D9KcMDLAD/8kVjhLXl7RrZkXUvohEMfcIRcJFGmbOkXkDwC5r9aCXR1cgvuCTmkeHVrmwNU2ls5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769791614; c=relaxed/simple;
	bh=a6etAljMMvEBt71o/mh5dZs/e8EkwlzVycstWvjDYR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtnAEbDcQ9rjyHfNkYFodB1HNL7H3s6DGHA1yoHSqlShTQ++YESe4TDQ4cwWyctfK1TxlUkOtTwjd7k2aqGqI5ow4rllflRxbReD2Jhdr26aIIzYTTG1NQn9Oik/MPNcEzTGr0MsFUSo/aAbw0Hvw4Wev/rT67Vy201pOlLhofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaUof+eU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaUof+eU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B4BC4CEF7;
	Fri, 30 Jan 2026 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769791613;
	bh=a6etAljMMvEBt71o/mh5dZs/e8EkwlzVycstWvjDYR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaUof+eUky4k/89gYV0/sDVF4Nclwiuc4UB69N9WPEON04lRwI+bBN7FZ/S7iwaLc
	 CmzJiCEIsvx3wDJht96gSw7NEHFeCjqiMfTUFpivgyKw02ORPkj0KnXWZBRGCZ2JCE
	 emUOL7Vf2Rwp6FbTm57Eut9Yy+zZEmegWxEtgAD2PDywzi85lHCM60thT3XIqq0XA4
	 aoO1GpPN4mlkuW8yEralDWHNbjHHE9jsRncDkgdi1hhWX9eLRw7DNkF97gOJRcRxiI
	 77BLRKQaRM6hWzv2JSDp6jxp7tGZrwXcHW46v0n9ohEqYZiyHFzVgva+BXoej3ZeNG
	 d6/lDwPqxp8Cg==
Date: Fri, 30 Jan 2026 08:46:48 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Justin Forbes <jforbes@fedoraproject.org>, Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
Message-ID: <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>

On Fri, Jan 30, 2026 at 05:24:02PM +0100, Thorsten Leemhuis wrote:
> [CCing Linus, maybe we still can get this fixed for -rc8 or at least final]
> 
> On 1/23/26 18:35, Josh Poimboeuf wrote:
> > On Fri, Jan 23, 2026 at 10:47:18AM +0100, Thorsten Leemhuis wrote:
> >> [CCing the regression list]
> >>
> >> On 1/22/26 11:00, Alexey Makhalov wrote:
> >>>
> >>> Thanks for reporting the problem.
> >>> [...] 
> >>> Workarounding QEMU misbehavior from the kernel side by introducing less
> >>> efficient asm inlines does not sound correct.
> >>
> >> Well, fixing bugs right where they are obviously is a good thing.
> >>
> >> But well, the problem according to the description quoted below was
> >> exposed by a change that went into 6.19-rc1 -- which makes it a kernel
> >> regression that must be fixed in the kernel (ideally before 6.19 is out).
> >>
> >> At least from my understanding of Linus point of view on situations like
> >> that. Or am I mistaken for some reason?
> >>
> >> Or is this a case of "we for now assume this is such a corner case that
> >> nobody else will hit; if we are wrong we'll reconsider".
> > 
> > Hm, yes, from that perspective I agree this is a kernel regression that
> > needs fixed.  We still want Linux to work with older "broken" versions
> > of qemu that clobber registers.
> 
> Josh, what's the status here? From here it looks like nothing happened
> during the last week. Should we move on with the patch at the start of
> this thread? Or is "widening the hypercall just for
> VMWARE_CMD_ABSPOINTER_DATA" as suggested by Alexey elsewhere in this
> thread a better fix? Or would temporarily reverting aca282ab7e75
> ("x86/asm: Annotate special section entries") be the best move for now?

I think we still need to go with the original patch at the start of this
thread.  There's nothing preventing the compiler from doing similar
optimizations for the other hypercalls.

-- 
Josh
