Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F701C07
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 11:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CA1C433EF;
	Mon, 16 Jan 2023 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673868616;
	bh=zjZm8nnM5icpWS5Ktv9fM9x6p9DiE34nQjN7zca0moA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nKC7eLSlL5MNAYfdrSHyIIDCU7XQTT4Lyubt4jDqV/NY7qts5gf1oRml73MXnwBmW
	 b8pV3NH25CHAswaeiog+vj0B891k0d31eakMRzPMLn6lXr8Z42XnP7NCvENKgBQOTi
	 htx1sT55pht6TpNvuBFe0sByLxwX2BfIQ2ZN6xv8m6pJ8iYz7MvNrvJlWAaAveOGMd
	 f3WWdDyU1337rta4RJ2jzRentFGgcbJ5A/S14hR2CHbX08mvWGMYVwgg+7Hft7kJL5
	 aC0nzVl3aYRwIJbb6vWquTHpCRnAxSvKtHVof4IENyEn31AeTYgDXcvSeYQI6in+eI
	 sCJs+UQ3BCebw==
Date: Mon, 16 Jan 2023 13:30:11 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jan Dabros <jsd@semihalf.com>, regressions@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	linux-integrity@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
Message-ID: <Y8U1QxA4GYvPWDky@kernel.org>
References: <7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz>

On Wed, Dec 28, 2022 at 09:22:56PM +0100, Vlastimil Babka wrote:
> Ugh, while the problem [1] was fixed in 6.1, it's now happening again on
> the T460 with 6.2-rc1. Except I didn't see any oops message or
> "tpm_try_transmit" error this time. The first indication of a problem is
> this during a resume from suspend to ram:
> 
> tpm tpm0: A TPM error (28) occurred continue selftest

This failure occurs in tpm_tis_resume().

tpm1_do_selftest() is called for the first time during a power cycle in
tpm_chip_register(), which does not spawn anything klog, does it?

Because they wrap the call differently tpm_tis_resume() does not disable
clkrun protocol, which is at least obvious semantical difference.

I'd suggest to workaround the bug by replacing tpm1_do_selftest() with

1. tpm_chip_start()
2. tpm1_auto_startup()
3. tpm_chip_stop()

tpm1_auto_startup() has already convergent rollback semantics as in

https://lore.kernel.org/lkml/20230105144742.3219571-1-Jason@zx2c4.com/

To add, even without bug, it makes a lot of commons to make semantics
convergent.

BR, Jarkko
