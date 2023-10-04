Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132F376
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 01:18:52 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qnqX8-003JDo-78; Wed, 04 Oct 2023 09:18:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 04 Oct 2023 09:18:42 +0800
Date: Wed, 4 Oct 2023 09:18:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Stefan Wahren <wahrenst@gmx.net>, Olivia Mackall <olivia@selenic.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Mark Brown <broonie@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH V2] hwrng: bcm2835: Fix hwrng throughput regression
Message-ID: <ZRy9cvCZMdo0QbIz@gondor.apana.org.au>
References: <20230905232757.36459-1-wahrenst@gmx.net>
 <ZQQ1tgDEGGXwfu/4@gondor.apana.org.au>
 <436a7e20-082f-4aa9-bfbd-703d149d5463@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <436a7e20-082f-4aa9-bfbd-703d149d5463@leemhuis.info>

On Tue, Oct 03, 2023 at 01:35:29PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>
> Hi Herbert, I there a strong reason why you merged this to what from
> here looks like the branch that targets the next merge window? The patch
> fixes a regression introduced during the last 12 months and thus
> normally should not wait for the next merge window. For details see
> "Expectations and best practices for fixing regressions" in
> Documentation/process/handling-regressions.rst; or if you want to hear
> it from Linus directly, check these out:
> https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/
> https://lore.kernel.org/all/CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com/

This is a one-year-old regression, and the fix is not a trivial
reversion.  So there is no urgency in pushing this out.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
