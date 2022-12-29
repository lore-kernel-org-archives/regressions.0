Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A81105
	for <regressions@lists.linux.dev>; Thu, 29 Dec 2022 04:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85084C433D2;
	Thu, 29 Dec 2022 04:17:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="HIwmwkOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1672287423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mryHCuwKL4ka0P8BgAVspE8IMbN7LJc0YktowyLFPBU=;
	b=HIwmwkOQ33WeQbwrhkbvP9jwvW6KhesTh1A1e6UMyWZYf1mH5qGJFqk8/M/bmzvSeU9hg+
	8HBWjdLAUMVbiSicxFUbBsJkY8IxvC4XFd926K1MZGUMUfIliLoFqDq3aYWUwAdQH2U6Ar
	PpsmuM0TbZxiqtOWTUtqmvk8Mv6aHe8=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 18782bdc (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 29 Dec 2022 04:17:02 +0000 (UTC)
Date: Thu, 29 Dec 2022 05:16:59 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
Message-ID: <Y60Uu8HcGyXasnOO@zx2c4.com>
References: <7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz>
 <c39cc02da9f60412a0f7f7772ef3d89e4a081d38.camel@HansenPartnership.com>
 <Y60RoP77HnwaukEA@zx2c4.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y60RoP77HnwaukEA@zx2c4.com>

On Thu, Dec 29, 2022 at 05:03:44AM +0100, Jason A. Donenfeld wrote:
> I recall seeing something pretty similar to this report with the
> selftest as well. Basically, the call to tpm1_do_selftest can race with
> the call to tpm1_get_random, presumably because tpm1_get_random doesn't
> do any locking on its own. So it might be a good idea to make sure that
> tpm1_get_random() isn't running before tpm1_do_selftest() or any other
> TPM commands run.

The other locking angle is that tpm1_pm_suspend() should wait for
tpm1_get_random() to finish or cancel tpm1_get_random(), if that's not
already happening. IIRC, the selftest gets tripped up when it's
triggered on resume due to an already in-flight tpm1_get_random() from
prior to sleep, that never completed.
