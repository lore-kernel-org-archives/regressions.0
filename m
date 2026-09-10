Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735222D7DEF
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033806; cv=none; b=KXsWehgtRIjT3k+ixIWkDSEZZlxLS97g66lJO82EEqdPEhNvJeMa5Vq48umCxIqm+Am1VerzpaMvXjOM4bRQStxkoHUcg8COB05rmvEUIdrpP4mAfqLCGiQEEgpZnLiBdceKzVio/+IExYqdSC2zCTfj7QQ0Ah4m+MuQeEKGGPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033806; c=relaxed/simple;
	bh=Lm1iDn1MpImB0Z6Zn3rV0unyaPyNmR3nCxRWSJRkZT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4BcfxbcMVq3NstFfn11X5bkVBzzRLgumYopGomhNzzmpXidozQuyTN2dQfsv+sR/LTJNOgoORWjxAcxnxccYMaw5d6Yz/vimPT/g+nngrs6iC3QXlmiBbmuc7X8BitNJ+VdFa5l6QIfjgt0/+q15rK/k0/mVb5jhBTQ2M+CxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cGCQsyJb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cGCQsyJb"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02F9F447;
	Thu, 10 Sep 2026 11:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789033703;
	bh=Lm1iDn1MpImB0Z6Zn3rV0unyaPyNmR3nCxRWSJRkZT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGCQsyJbAP2bXayNbuaQcVxLQP8U/QrZy6zehkn9bzrvreS3Cv+Ni6FePcNLGXwu7
	 FNzq5zJGumyL4EcU6J/PZVB0CJbi/L0IIHcZRwiu3DUmOw6e/p1PeM6+oM+MissSVk
	 uX2bwj1E6uvOeR00xun8/VE7mqEeOqq7K4srKUOk=
Date: Thu, 10 Sep 2026 12:49:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Ruben Sutton <ruben@scstudios.tech>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] docs: process: use gender-neutral pronouns
Message-ID: <20260910094958.GI1892234@killaraus.ideasonboard.com>
References: <20260909144100.78177-1-ruben@scstudios.tech>
 <87pkymlao3.fsf@trenco.lwn.net>
 <202609091143.0B34CB0E1@keescook>
 <6e4cb304-fc9c-4cd8-bd6d-2d0dd635f3cf@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e4cb304-fc9c-4cd8-bd6d-2d0dd635f3cf@leemhuis.info>

On Thu, Sep 10, 2026 at 08:59:04AM +0200, Thorsten Leemhuis wrote:
> On 9/9/26 20:47, Kees Cook wrote:
> > On Wed, Sep 09, 2026 at 09:14:04AM -0600, Jonathan Corbet wrote:
> >> Ruben Sutton writes:
> >>
> >>> Several process documents use gendered pronouns when referring
> >>> generically to developers and maintainers. Use singular they instead,
> >>> making the language inclusive without changing its meaning.
> >>>
> >>> Leave pronouns referring to named people and text in attributed
> >>> quotations unchanged.
> >>
> >> Ouch.
> >>
> >> I have no objection in principle to this change, but if we try to clean
> >> up the whole kernel in this way we're going to have a *lot* of churn
> >> and, undoubtedly, some unpleasant discussions at some point.
> >>
> >> I'm tempted to raise this question at the maintainers summit to see if I
> >> can get some sort of project-wide policy laid out.
> > 
> > FWIW, I'd agree "indefinite they" (or "singular they") is the right
> > language here: "his or her" is both annoying to read (too many words)
> > and non-inclusive. Using "their" solves both.
> I do, too.
> 
> But all this makes me wonder: In case we decide to go down that route,
> how do we prevent gendered pronouns from accidentally sneaking back in,
> for example, through subsystems that change their docs directly? Do we
> maybe have something already somewhere that watches changes to
> Documentation/ where we could plug in a test script that yells if it
> detects this in next? And yes, obviously someone would then also need to
> write such a script.

This appears to me as similar to the words we decided to ban in commit
a5f526ecb075 ("CodingStyle: Inclusive Terminology"). As far as I'm
aware, there's no tooling to enforce this, we instead rely on reviewers
(and authors in the first place of course) knowing the rules. The
inclusive terminology discussion that occurred back then made the news,
helping us to raise awareness of the rules. For gender-neutral pronouns
we may need to communicate a bit more proactively towards at least
subsystem maintainers.

-- 
Regards,

Laurent Pinchart
