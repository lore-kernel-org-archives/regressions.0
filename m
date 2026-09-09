Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C03B1ED0;
	Wed,  9 Sep 2026 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979656; cv=none; b=r2ogf2pKav/TRto2PPZX5Yr3LdNWKvIRns6hMvpmZlyNT2HLht71nYsVALC5PFWpPMT9g1RW+i91oZ80BNq+GmXxbb+ry2P7AGD+rovXauHW+eaV0nvJlWpGi9MwfBLMPhqXTxd2nkzYoBdKJHZVTUzrzpZfCjCn/FsXmu55E5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979656; c=relaxed/simple;
	bh=sL3B7wZjGBX9YpvcTWSBIBSgWNdiji5vX7p8DXbv3hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8Xk1RTP8YUuUHA0H/bvDbr94nIRIqse6tpNGvIR2zFXMkyJPkmPHnVIiujQefQMaOnfCaQ2wAPrBzdsse9rTFT+bdJLwlxe7tjDbbhC2RnBwLu8XE/Uqy6x/mm2b34bWYfBoiwSJlBw2lYcxp3O0WJxkgDvPQKky+SYLWxAvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofsZyvnW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofsZyvnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FDB1F000FF;
	Wed,  9 Sep 2026 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788979654;
	bh=LNmsyxAoQC/kdl71kAyyiQ/6erPFpnJPO1ZIQdzCFIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ofsZyvnW7+YUVEMh2Foj+pkLLQJL/6I/2nW60lQ1oQHipnkqkGLMtzA3zNBHwyPIs
	 sMU6F5AVkj4FApxxg525JukuiJVHQxuYOdFB87MIZhu9usxYPAsoelHoiUZvytFPu4
	 +S+PzrKGT9LLH/RGBF2BtqlQHmxo9XoVfjvM4YNO6H/SwRLTqIslswChMtUkzNnfAE
	 65iEZlUZ6knFCFM09eyvVwfLa8xU/Q9b7P2/nkoE9iO6vVRhdjp5IivocvqxzgovSy
	 ac9hMprGRSEJ8udGMvDxtYKWgRCg0eUhYjKZ9q5binRe/XUTBzW40z50yAG2WMNUP0
	 7L4extHN+zV8A==
Date: Wed, 9 Sep 2026 11:47:34 -0700
From: Kees Cook <kees@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Ruben Sutton <ruben@scstudios.tech>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] docs: process: use gender-neutral pronouns
Message-ID: <202609091143.0B34CB0E1@keescook>
References: <20260909144100.78177-1-ruben@scstudios.tech>
 <87pkymlao3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pkymlao3.fsf@trenco.lwn.net>

On Wed, Sep 09, 2026 at 09:14:04AM -0600, Jonathan Corbet wrote:
> Ruben Sutton <ruben@scstudios.tech> writes:
> 
> > Several process documents use gendered pronouns when referring
> > generically to developers and maintainers. Use singular they instead,
> > making the language inclusive without changing its meaning.
> >
> > Leave pronouns referring to named people and text in attributed
> > quotations unchanged.
> >
> > Assisted-by: LLM
> > Signed-off-by: Ruben Sutton <ruben@scstudios.tech>
> > ---
> >  Documentation/process/2.Process.rst            | 2 +-
> >  Documentation/process/5.Posting.rst            | 2 +-
> >  Documentation/process/6.Followthrough.rst      | 2 +-
> >  Documentation/process/handling-regressions.rst | 2 +-
> >  Documentation/process/howto.rst                | 2 +-
> >  Documentation/process/submitting-patches.rst   | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> Ouch.
> 
> I have no objection in principle to this change, but if we try to clean
> up the whole kernel in this way we're going to have a *lot* of churn
> and, undoubtedly, some unpleasant discussions at some point.
> 
> I'm tempted to raise this question at the maintainers summit to see if I
> can get some sort of project-wide policy laid out.

FWIW, I'd agree "indefinite they" (or "singular they") is the right
language here: "his or her" is both annoying to read (too many words)
and non-inclusive. Using "their" solves both.

-Kees

-- 
Kees Cook
