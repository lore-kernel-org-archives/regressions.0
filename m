Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24501173;
	Fri, 23 Jan 2026 17:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769189711; cv=none; b=t21nhLOHpOj6tDiEbprWYWMVZer719SBMlFDUGQay3qk1Hy1NSbXtEWBclsS/ark9v8HkGAbrSZSeD/ktDxgQQjcTDoAs1xhXvRyapx5hiS6haH813/Bcf4knRs+WrRRJOTJFcVs7Xwq7eF1RJVG+LAutMQxJ7KcDr0O5a2I6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769189711; c=relaxed/simple;
	bh=VOMV+3msTcsGNw+GkM0UslDsY4hQhdoHDJb1wdtiHFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFjetTMnKEPlstJvUZH7xRqm6GJXlEr2Ru4HslLIJsh6Sr1f/1rgh+e+6LPPlBvnYDuL5WnhiLwqEN4eV6+S0lDPsIK3I1OsB8cNofdIhNLRMJExxveCqcK1GnAD9kVCdN6UvMGpI+CcCuYaxc06xd8XXRM7tMV28yx54FRDZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqvLvnC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqvLvnC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E343EC4CEF1;
	Fri, 23 Jan 2026 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769189710;
	bh=VOMV+3msTcsGNw+GkM0UslDsY4hQhdoHDJb1wdtiHFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqvLvnC/Wcf2gtTKwAcJ+x/wPMryn0ceR/XqlfQzNkodxWZIwGq4OJLE1cjkhD77w
	 7DzTWKAa8Uow1/7d9L1xxHn6mcsMy043YSf6AkzO0HELf1V4ZdfkZWDUSutrGEHwLC
	 pPLmUzXOYM9jCkseemdW3OtpwauHbnjKXt4h/KQsCqKzQby3myhR+D4Pn4OKzsqghh
	 krr6po1N2t6+NS3WrcPsR7E4M/jBtmyzKIX/muzauPQYTfq6OS2bV8mkrF3dp3Knh7
	 0Kcgr0y0drluca1ez1kzQfQDirXyWts3T8/EJsuArMjRlH5TITXflLMQdSk22msy6a
	 X4Y1qGepmS8rg==
Date: Fri, 23 Jan 2026 09:35:08 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Justin Forbes <jforbes@fedoraproject.org>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
Message-ID: <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>

On Fri, Jan 23, 2026 at 10:47:18AM +0100, Thorsten Leemhuis wrote:
> [CCing the regression list]
> 
> On 1/22/26 11:00, Alexey Makhalov wrote:
> > 
> > Thanks for reporting the problem.
> > [...] 
> > Workarounding QEMU misbehavior from the kernel side by introducing less
> > efficient asm inlines does not sound correct.
> 
> Well, fixing bugs right where they are obviously is a good thing.
> 
> But well, the problem according to the description quoted below was
> exposed by a change that went into 6.19-rc1 -- which makes it a kernel
> regression that must be fixed in the kernel (ideally before 6.19 is out).
> 
> At least from my understanding of Linus point of view on situations like
> that. Or am I mistaken for some reason?
> 
> Or is this a case of "we for now assume this is such a corner case that
> nobody else will hit; if we are wrong we'll reconsider".

Hm, yes, from that perspective I agree this is a kernel regression that
needs fixed.  We still want Linux to work with older "broken" versions
of qemu that clobber registers.

-- 
Josh
