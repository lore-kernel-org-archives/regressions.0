Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DEE7E5
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 02:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qoaeL-0044GQ-OJ; Fri, 06 Oct 2023 10:33:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Oct 2023 10:33:14 +0800
Date: Fri, 6 Oct 2023 10:33:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Tatu =?iso-8859-1?Q?Heikkil=E4?= <tatu.heikkila@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Device Mapper <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: dm crypt: Fix reqsize in crypt_iv_eboiv_gen
Message-ID: <ZR9x6ifhd6axh5Ki@gondor.apana.org.au>
References: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>
 <ZR9dEiXhQv-wBVA2@debian.me>
 <ZR9l446ndB4n1Xl4@gondor.apana.org.au>
 <ZR9wRq7Rkz+LocDX@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR9wRq7Rkz+LocDX@redhat.com>

On Thu, Oct 05, 2023 at 10:26:14PM -0400, Mike Snitzer wrote:
>
> Sure, please do.  Shouldn't your header Cc: stable given that the
> Fixes commit implies v6.5 needs this fix?

Sure I'll add it although it will be picked up automatically due
to the Fixes header.  I'll also fix the reporter's name.

> Reviewed-by: Mike Mike Snitzer <snitzer@kernel.org>

Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
