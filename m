Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68CB434
	for <regressions@lists.linux.dev>; Fri, 20 Jan 2023 23:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009E0C433EF;
	Fri, 20 Jan 2023 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674258432;
	bh=0UTo512SxTtTGc9vnyttJwZavTdapDdH6OHtTgTtZTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5MjcFSMgJO/CmMsqY474TOH38GxPhM6n8jFnx/2OseJ8ZRTETCPKn1+jlBmh+lH+
	 /CWSgT+iYE6ExbFf8Rl0txUbmMPIi01alCKYwEy3FysA05TgsWjUSlE92t7rfeN7lF
	 LwnUm/RYi9jaApJ7NQ16WmyJ+7o1KDeZm+SYKnfqxBhqzoeORSK3EJF4bchN+mlHJd
	 4b26CX7C8tpyBP74oQ2QzvGd01+zuQ2X19sZZ2En4ixI9XKra9Ds+DaOt16lTXzOHy
	 rIeAIXPXnUDWMZ8vxJlYn1o7ctSzkNSNKr+ptDz8P0Dfm/od80iT9vvF/GI+qeUlG/
	 1iO3KVVpalIJQ==
Date: Fri, 20 Jan 2023 23:47:09 +0000
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Johannes Altmanninger <aclopte@gmail.com>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
Message-ID: <Y8sn/fLG0PGr4WA5@kernel.org>
References: <7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz>
 <c39cc02da9f60412a0f7f7772ef3d89e4a081d38.camel@HansenPartnership.com>
 <Y60RoP77HnwaukEA@zx2c4.com>
 <7ebab1ff-48f1-2737-f0d3-25c72666d041@leemhuis.info>
 <Y7w74EBYP3+FHlkw@zx2c4.com>
 <58d7a42c-9e6b-ab2a-617f-d5e373bf63cb@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58d7a42c-9e6b-ab2a-617f-d5e373bf63cb@suse.cz>

On Tue, Jan 10, 2023 at 06:19:48PM +0100, Vlastimil Babka wrote:
> On 1/9/23 17:08, Jason A. Donenfeld wrote:
> > Hi Thorsten,
> > 
> > On Thu, Jan 05, 2023 at 02:59:15PM +0100, Thorsten Leemhuis wrote:
> >> On 29.12.22 05:03, Jason A. Donenfeld wrote:
> >>> On Wed, Dec 28, 2022 at 06:07:25PM -0500, James Bottomley wrote:
> >>>> On Wed, 2022-12-28 at 21:22 +0100, Vlastimil Babka wrote:
> >>>>> Ugh, while the problem [1] was fixed in 6.1, it's now happening again
> >>>>> on the T460 with 6.2-rc1. Except I didn't see any oops message or
> >>>>> "tpm_try_transmit" error this time. The first indication of a problem
> >>>>> is this during a resume from suspend to ram:
> >>>>>
> >>>>> tpm tpm0: A TPM error (28) occurred continue selftest
> >>>>>
> >>>>> and then periodically 
> >>>>>
> >>>>> tpm tpm0: A TPM error (28) occurred attempting get random
> >>>>
> >>>> That's a TPM 1.2 error which means the TPM failed the selftest.  The
> >>>> original problem was reported against TPM 2.0  because of a missing
> >>>> try_get_ops().
> >>>
> >>> No, I'm pretty sure the original bug, which was fixed by "char: tpm:
> >>> Protect tpm_pm_suspend with locks" regards 1.2 as well, especially
> >>> considering it's the same hardware from Vlastimil causing this. I also
> >>> recall seeing this in 1.2 when I ran this with the TPM emulator. So
> >>> that's not correct.
> >>
> >> James, are you or some other TPM developer looking into this? Or is this
> >> deadlocked now? And if so: how can we get this unstuck to get this
> >> regression solved?
> >>
> >> Side note: I wonder if the problem that Johannes reported yesterday in
> >> this thread (
> >> https://lore.kernel.org/all/Y7VCcgHUC6JtnO2b@gmail.com/
> >> ) is related or something else, as it seems his issue happens with 6.1,
> >> while Vlastimil's problems should be fixed there. Or am I missing something?
> > 
> > So, this is now in rc3:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1382999aa0548a171a272ca817f6c38e797c458c
> > 
> > That should help avoid the worst of the issue -- laptop not sleeping.
> > But the race or whatever it is still does exist. So you might want to
> > keep this in your tracker to periodically nudge the TPM folks about it.
> 
> Heh, booted rc3 and managed to hit it on very first suspend to ram attempt:
> 
> tpm tpm0: A TPM error (28) occurred continue selftest
> 
> But thanks to the patch, the next suspend worked:
> 
> [  236.598900] tpm tpm0: Error (28) sending savestate before suspend
> [  236.598915] tpm_tis 00:08: Ignoring error 28 while suspending
> 
> and on resume again:
> 
> [  238.196645] tpm tpm0: A TPM error (28) occurred continue selftest
> 
> and indeed now I keep getting (as expected)
> 
> [  399.671077] tpm tpm0: A TPM error (28) occurred attempting get random
> 
> So hopefully somebody will look into the root cause at some point.

I would start by using tpm1_auto_startup() also here, and see
the effect:

https://lore.kernel.org/linux-integrity/Y8U1QxA4GYvPWDky@kernel.org/

BR, Jarkko
