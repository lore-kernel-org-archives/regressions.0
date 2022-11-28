Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87C8F6C
	for <regressions@lists.linux.dev>; Mon, 28 Nov 2022 17:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F75FC433D6;
	Mon, 28 Nov 2022 17:02:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="onr0UUoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1669654922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XUuLSVxoi2T3v92DIrHeANXGii/LdTyi4KZ94Wo1K4o=;
	b=onr0UUoiqYUMl4xaK+epdJ8eymzn1X6ZfwmueHjkJ5d1dXgYQ2qPVM/Md7neOaVnG25ImQ
	1AUZyOQqJamWWhFAIGiASlEyqtrzlgWS7p8kwGwTjjDMGNXZ5j5JrFlO8lT2lhKtY1w8pK
	enbXtL/J+l3owR5I/t1s/Y8ZNyBz384=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1a12627 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 28 Nov 2022 17:02:01 +0000 (UTC)
Date: Mon, 28 Nov 2022 18:01:53 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>,
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] suspend to ram fails in 6.1 due to tpm errors
Message-ID: <Y4Tpgb+qJpNad7gG@zx2c4.com>
References: <c5ba47ef-393f-1fba-30bd-1230d1b4b592@suse.cz>
 <Y4Sjk+Fibcsihg4Y@zx2c4.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4Sjk+Fibcsihg4Y@zx2c4.com>

On Mon, Nov 28, 2022 at 01:03:31PM +0100, Jason A. Donenfeld wrote:
> I'll play around and see if I can repro too. Looks like you have a T460?
> I don't have exactly that but maybe something close enough.

I reproduced it, and then tried that commit you linked, and it appears
to fix the problem. So maybe just poke the author/maintainer there and
make sure that gets in somewhere.

Jason
