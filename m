Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B9FC2EB
	for <regressions@lists.linux.dev>; Fri, 25 Aug 2023 11:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B51AC433C8;
	Fri, 25 Aug 2023 11:26:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dkUcuEL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1692962780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tHJ9SmLCZiH7Y9dFtS8P4UlraHCGudNA9kJ7LlAZTJA=;
	b=dkUcuEL66LBhvTYD3ql+22WcADCe5/+6/6qPXGOlI77n3jManCdMiCggPIJWls1+k+qmHv
	aIGStpp7GgGmZc8BUv7ijqL1rIbPcg5XOG5zPTDskIh2g64lBIcWivmMBDXkToezsZkTb1
	DeXy/BrNN8+Vj8L2elVZCCb/FGlSkUU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 42898e26 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 25 Aug 2023 11:26:18 +0000 (UTC)
Date: Fri, 25 Aug 2023 13:26:16 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andrei Coardos <aboutphysycs@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: bcm2835-rng: Performance regression since 96cb9d055445
Message-ID: <ZOiP2H_6pfhKN3fj@zx2c4.com>
References: <bc97ece5-44a3-4c4e-77da-2db3eb66b128@gmx.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc97ece5-44a3-4c4e-77da-2db3eb66b128@gmx.net>

Hi Stefan,

On Fri, Aug 25, 2023 at 01:14:55PM +0200, Stefan Wahren wrote:
> Hi,
> 
> i didn't find the time to fix the performance regression in bcm2835-rng
> which affects Raspberry Pi 0 - 3, so report it at least. AFAIK the first
> report about this issue was here [1] and identified the offending commit:
> 
> 96cb9d055445 ("hwrng: bcm2835 - use hwrng_msleep() instead of
>   cpu_relax()")
> 
> #regzbot introduced: 96cb9d055445
> 
> I was able to reproduce this issue with a Raspberry Pi 3 B+ on Linux
> 6.5-rc6 (arm64/defconfig).
> 
> Before:
> time sudo dd if=/dev/hwrng of=/dev/urandom count=1 bs=4096 status=none
> 
> real	3m29,002s
> user	0m0,018s
> sys	0m0,054s

That's not surprising. But also, does it matter? That script has
*always* been wrong. Writing to /dev/urandom like that has *never*
ensured that those bytes are taken into account immediately after. It's
just not how that interface works. So any assumptions based on that are
bogus, and that line effectively does nothing.

Fortunately, however, the kernel itself incorporates hwrng output into
the rng pool, so you don't need to think about doing it yourself.

So go ahead and remove that line from your script.

Now as far as the "regression" goes, we've made an already broken
userspace script take 3 minutes longer than usual, but it still does
eventually complete, so it's not making boot impossible or something.
How this relates to the "don't break userspace" rule might be a matter
of opinion. If you think it does, maybe send a patch to Herbert reducing
that sleep from 1000 to 100 and stating why with my background above,
and see if he agrees it's worth fixing. Or, if removing that line from
your scripts is good enough for you, that's also fine by me.

Jason
