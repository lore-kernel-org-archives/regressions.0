Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E033D6
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 16:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F0DC433EF;
	Mon,  9 Jan 2023 16:08:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GMLhpMcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1673280482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9CMefNSPpzQGGusKKpp/tRUQY9r0tR2TCOoSgR3x04=;
	b=GMLhpMcMJ5qn7N5Fa3L2jx2hupU7frDA80muIQfpXfGt7SagmaV5MQS5s87tkTJDI83JGw
	nh7DO5t0P7Ha8HKLJ59+uQ5rhPX42fEKxsuUv8BZwnz3d0OXhSFfJmQ0maxdUoq14arXV8
	5z+/tSc2YllnwzyBNeoLsSQ+UodNS+M=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6acfe7eb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 9 Jan 2023 16:08:02 +0000 (UTC)
Date: Mon, 9 Jan 2023 17:08:00 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Vlastimil Babka <vbabka@suse.cz>, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Johannes Altmanninger <aclopte@gmail.com>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
Message-ID: <Y7w74EBYP3+FHlkw@zx2c4.com>
References: <7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz>
 <c39cc02da9f60412a0f7f7772ef3d89e4a081d38.camel@HansenPartnership.com>
 <Y60RoP77HnwaukEA@zx2c4.com>
 <7ebab1ff-48f1-2737-f0d3-25c72666d041@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ebab1ff-48f1-2737-f0d3-25c72666d041@leemhuis.info>

Hi Thorsten,

On Thu, Jan 05, 2023 at 02:59:15PM +0100, Thorsten Leemhuis wrote:
> On 29.12.22 05:03, Jason A. Donenfeld wrote:
> > On Wed, Dec 28, 2022 at 06:07:25PM -0500, James Bottomley wrote:
> >> On Wed, 2022-12-28 at 21:22 +0100, Vlastimil Babka wrote:
> >>> Ugh, while the problem [1] was fixed in 6.1, it's now happening again
> >>> on the T460 with 6.2-rc1. Except I didn't see any oops message or
> >>> "tpm_try_transmit" error this time. The first indication of a problem
> >>> is this during a resume from suspend to ram:
> >>>
> >>> tpm tpm0: A TPM error (28) occurred continue selftest
> >>>
> >>> and then periodically 
> >>>
> >>> tpm tpm0: A TPM error (28) occurred attempting get random
> >>
> >> That's a TPM 1.2 error which means the TPM failed the selftest.  The
> >> original problem was reported against TPM 2.0  because of a missing
> >> try_get_ops().
> > 
> > No, I'm pretty sure the original bug, which was fixed by "char: tpm:
> > Protect tpm_pm_suspend with locks" regards 1.2 as well, especially
> > considering it's the same hardware from Vlastimil causing this. I also
> > recall seeing this in 1.2 when I ran this with the TPM emulator. So
> > that's not correct.
> 
> James, are you or some other TPM developer looking into this? Or is this
> deadlocked now? And if so: how can we get this unstuck to get this
> regression solved?
> 
> Side note: I wonder if the problem that Johannes reported yesterday in
> this thread (
> https://lore.kernel.org/all/Y7VCcgHUC6JtnO2b@gmail.com/
> ) is related or something else, as it seems his issue happens with 6.1,
> while Vlastimil's problems should be fixed there. Or am I missing something?

So, this is now in rc3:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1382999aa0548a171a272ca817f6c38e797c458c

That should help avoid the worst of the issue -- laptop not sleeping.
But the race or whatever it is still does exist. So you might want to
keep this in your tracker to periodically nudge the TPM folks about it.

Jason


