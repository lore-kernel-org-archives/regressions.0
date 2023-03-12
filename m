Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABF81103
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 01:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17A1C433D2;
	Sun, 12 Mar 2023 01:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678584908;
	bh=WKzZH6nR2LDVUj+kiMAJEwlCmwOLq2myYN0WUPAMo5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIx5ZcOU/4pSt6I0UtRZPrgLZJEgMZ0HGwFPGyL8Olcks6gxLcS8aK1SioT+uYS00
	 1Un1X6m9pAdAXyoq5LxuraDtgWM/lh4BGI3A2i9Dpri1V/ejw+ZkiTnh5LVDgvv7ma
	 aDxN0bY+222omcQyC2ACkuUUwFZbecYd8YyIoX4uCOB6g2dsAyhdg+TPfgPjoEWCRM
	 wvuCQrEk9h97mm98thUh29c6Sq5+K0AtzjN8m5BuF2uJCv9U1agdU/TpQ9FTi2M/I0
	 K7mzfOhQEvpHhpHZaTAA9sbhCpkm3V/HaTED7d1y0509zMwo9fmg5GfA/XB9vm+ejU
	 ApOA1jIrs7FPw==
Date: Sun, 12 Mar 2023 03:35:05 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Herbert Xu <herbert@gondor.apana.org.au>, stable@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	reach622@mailcuk.com, Bell <1138267643@qq.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3] tpm: disable hwrng for fTPM on some AMD designs
Message-ID: <ZA0sScO47IMKPhtG@kernel.org>
References: <20230228024439.27156-1-mario.limonciello@amd.com>
 <Y/1wuXbaPcG9olkt@kernel.org>
 <5e535bf9-c662-c133-7837-308d67dfac94@leemhuis.info>
 <85df6dda-c1c9-f08e-9e64-2007d44f6683@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85df6dda-c1c9-f08e-9e64-2007d44f6683@leemhuis.info>

On Fri, Mar 10, 2023 at 06:43:47PM +0100, Thorsten Leemhuis wrote:
> [adding Linux to the list of recipients]
> 
> On 08.03.23 10:42, Linux regression tracking (Thorsten Leemhuis) wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> > 
> > Jarkko, thx for reviewing and picking below fix up. Are you planning to
> > send this to Linus anytime soon, now that the patch was a few days in
> > next? It would be good to get this 6.1 regression finally fixed, it
> > already took way longer then the time frame
> > Documentation/process/handling-regressions.rst outlines for a case like
> > this. But well, that's how it is sometimes...
> 
> Linus, would you consider picking this fix up directly from here or from
> linux-next (8699d5244e37)? It's been in the latter for 9 days now
> afaics. And the issue seems to bug more than just one or two users, so
> it IMHO would be good to get this finally resolved.
> 
> Jarkko didn't reply to my inquiry, guess something else keeps him busy.

That's a bit arrogant. You emailed only 4 days ago.

I'm open to do PR for rc3 with the fix, if it cannot wait to v6.4 pr.

BR, Jarkko
