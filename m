Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7E4139B
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 01:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qoZqh-0043of-2s; Fri, 06 Oct 2023 09:41:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Oct 2023 09:41:55 +0800
Date: Fri, 6 Oct 2023 09:41:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Tatu =?iso-8859-1?Q?Heikkil=E4?= <tatu.heikkila@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Device Mapper <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>, Alasdair Kergon <agk@redhat.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: [PATCH] dm crypt: Fix reqsize in crypt_iv_eboiv_gen
Message-ID: <ZR9l446ndB4n1Xl4@gondor.apana.org.au>
References: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>
 <ZR9dEiXhQv-wBVA2@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZR9dEiXhQv-wBVA2@debian.me>

On Fri, Oct 06, 2023 at 08:04:18AM +0700, Bagas Sanjaya wrote:
>
> > Git bisect lead me to:
> > # first bad commit: [e3023094dffb41540330fb0c74cd3a019cd525c2] dm crypt:
> > Avoid using MAX_CIPHER_BLOCKSIZE
> > 
> > If I git revert e3023094dffb41540330fb0c74cd3a019cd525c2 on current Linus'
> > git master, the issue goes away. So I'm personally not all that affected
> > anymore (if I'm ready to compile my kernels from now on), and I understand
> > that you have no clear way to reproduce this as it seems strongly bound to
> > hardware, but seems like this could point to a potentially serious security
> > issue since it involves both crypto and undefined behaviour.

Thanks for the report.  Sorry this is indeed my fault.  The allocated
buffer is too small as it's missing the size for the request object
itself.

Mike, would you be OK with me picking this fix up and pushing it to
Linus?

Cheers,

---8<---
A skcipher_request object is made up of struct skcipher_request
followed by a variable-sized trailer.  The allocation of the
skcipher_request and IV in crypt_iv_eboiv_gen is missing the
memory for struct skcipher_request.  Fix it by adding it to
reqsize.

Fixes: e3023094dffb ("dm crypt: Avoid using MAX_CIPHER_BLOCKSIZE")
Reported-by: Tatu Heikkil� <tatu.heikkila@gmail.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index f2662c21a6df..5315fd261c23 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -753,7 +753,8 @@ static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
 	int err;
 	u8 *buf;
 
-	reqsize = ALIGN(crypto_skcipher_reqsize(tfm), __alignof__(__le64));
+	reqsize = sizeof(*req) + crypto_skcipher_reqsize(tfm);
+	reqsize = ALIGN(reqsize, __alignof__(__le64));
 
 	req = kmalloc(reqsize + cc->iv_size, GFP_NOIO);
 	if (!req)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
