Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9317AB7
	for <regressions@lists.linux.dev>; Fri, 18 Aug 2023 09:14:04 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qWuvM-005ETi-R3; Fri, 18 Aug 2023 16:33:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Aug 2023 16:33:41 +0800
Date: Fri, 18 Aug 2023 16:33:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: meenakshi.aggarwal@nxp.com
Cc: horia.geanta@nxp.com, V.sethi@nxp.com, pankaj.gupta@nxp.com,
	gaurav.jain@nxp.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Linux regression tracking #adding (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Bastian Krause <bst@pengutronix.de>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] Revert "crypto: caam - optimize RNG sample size"
Message-ID: <ZN8s5UL1SuJOQtKh@gondor.apana.org.au>
References: <20230814053239.608702-1-meenakshi.aggarwal@nxp.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814053239.608702-1-meenakshi.aggarwal@nxp.com>

On Mon, Aug 14, 2023 at 07:32:39AM +0200, meenakshi.aggarwal@nxp.com wrote:
> From: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> 
> This reverts commit 1abc89661ad3cd18d8c6af5c2584bcc63df43bf2.
> 
> Reverting the commit because of RNG instantiation failure
> observed on imx8mm board.
> 
> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
> ---
>  drivers/crypto/caam/ctrl.c | 52 +++++++++++++++-----------------------
>  drivers/crypto/caam/regs.h | 14 ++--------
>  2 files changed, 22 insertions(+), 44 deletions(-)

This isn't the patch that was being discussed.  The offending
patch was ef492d08030 ("crypto: caam - adjust RNG timing to support
more devices").

I'll revert that one instead of this.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
