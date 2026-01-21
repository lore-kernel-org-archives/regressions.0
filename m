Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960A34CFBB;
	Wed, 21 Jan 2026 19:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023539; cv=none; b=qZWh9sl3oYfry2Khxwb7I1Uhz64EoS+dyLk7e5iDi8VDEPFuM6Nxw7dsRjPWHAhmmMFD+8hdLUeBdEoKjhxlWJcF1DMtSK9nnIldcHyFCIXlh4S9XDMi0CMnTO7rvinapjMptfI5xtuik5FN0i0rHzyu3ltcdkUR6KOKt7czdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023539; c=relaxed/simple;
	bh=dRKRlvmamvbk5CfvKmylO1/PDKEuaBe2CUSfId099lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWk8foHIyYwiPLtpXPjS9YnrF3Hh6pjkzOaWediAG2sbD++E7XaGkkdrfTjljHDCudoEcR5FD9C9RqAuhCorZG6RBkTLeACo+EbOXMw66AA4mQiTfbAQV6p4Ksdo42oWeTpqn5ytc7xv5mmWEcDT+JwibohVE8JFlw+t7D1WDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qp+aohaC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qp+aohaC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KlUFIeazWU5NpNAl+nwft1NjY/qSqAbZt6eAH6zEH3U=; b=Qp+aohaCHK0Mjs1Xb5Z5OU54aJ
	WN36B2jh32WF9pUrn0f1VYyyCLL5TDUeH3AZiAwrquTJxuBKPslIlL50rCwFpGKdiukK/m5fvS4Iu
	6EqtVKIcBa63jUdUnEE+BWyljDoJtaNZ/X0153IAKWTjeQuyTG8C5C0WrE8Vj42RdzhRHYVRiIC9Q
	JAEGB9poiNDmzxG30zeP/coCjpqOJ80nFrmo93pfuHLg31qwWhr+IFZaY279CEgBxZyz2/gVR7Ja8
	VPewLy8F+CKFxZGhfyUynD2n2P3XwSTbcQMRXgfBoF0c3GLHmHzgi9kGMmiLrV/3KhgzfxJisRjtW
	+AYKrSvA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidpb-0000000Ggpo-3p1V;
	Wed, 21 Jan 2026 19:25:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0BE06300328; Wed, 21 Jan 2026 20:25:31 +0100 (CET)
Date: Wed, 21 Jan 2026 20:25:31 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, acme@kernel.org, irogers@google.com,
	jpoimboe@kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, torvalds@linux-foundation.org,
	x86@kernel.org
Subject: Re: [PATCH] objtool: fix libopcodes linking with static libraries
Message-ID: <20260121192531.GN166857@noisy.programming.kicks-ass.net>
References: <aXDBRPmk1N5m6Jr-@laps>
 <20260121162532.1596238-1-sashal@kernel.org>
 <CAJZ5v0jRxwuVgody9TbUqhyj6Ajr+NjchUSo2m6Uzs3PrNoJHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jRxwuVgody9TbUqhyj6Ajr+NjchUSo2m6Uzs3PrNoJHw@mail.gmail.com>

On Wed, Jan 21, 2026 at 08:08:51PM +0100, Rafael J. Wysocki wrote:
> On Wed, Jan 21, 2026 at 5:25 PM Sasha Levin <sashal@kernel.org> wrote:
> >
> > Commit 436326bc525d ("objtool: fix build failure due to missing libopcodes
> > check") tests for libopcodes using an empty main(), which passes even when
> > static libraries lack their dependencies. This causes undefined reference
> > errors (xmalloc, bfd_get_bits, etc.) when linking against static libopcodes
> > without its required libbfd and libiberty.
> >
> > Fix by testing with an actual libopcodes symbol and trying increasingly
> > complete library combinations until one succeeds.
> >
> > Fixes: 436326bc525d ("objtool: fix build failure due to missing libopcodes check")
> > Reported-by: Rafael J. Wysocki <rafael@kernel.org>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >
> > Rafael, I'd appreciate if you could test this patch without the .so symlink
> > workaround. Thanks :)
> 
> Works here, so
> 
> Tested-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

Excellent, thanks all!
