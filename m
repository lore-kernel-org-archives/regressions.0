Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E84388
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 22:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E54C433D2;
	Fri, 17 Feb 2023 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676673346;
	bh=AJkZmUCTEOmCCALQIpc7uUcbL0+2XWrf05ehY0N88Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUDU7xopOIEZs436JwIl+cCjUZA63Bqc/3skD+sDIV81RbNuihUv2rCacAjG7+UDA
	 anKS0vxHmLuCZFSyP71rOvqWQdcZDRb8QXRLjWnGcZ0NUNZunrKxhM0ulPVdIojsDB
	 NzdqHZ2CykePkK0icHoZxqnLQVDah7R5ZriBmGKd+U5p2wBMxOsYdZb+v87GUygq7D
	 pcoA1XnCs9PRJVsAt3eqnnvVZIQfday5V/XK4mTPoHaEZyWU7nV4/qtK9uaB2EZjHU
	 khWWiTcye8kLe1QZ115skjBuBFqkA/zTcAIVeywHRKHRw8pdIBm6+osm4ynbCxGd3Z
	 /wrpK3hxTBmYg==
Date: Sat, 18 Feb 2023 00:35:42 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jason@zx2c4.com, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 1/1] tpm: disable hwrng for fTPM on some AMD designs
Message-ID: <Y/ABPhpMQrQgQ72l@kernel.org>
References: <20230214201955.7461-1-mario.limonciello@amd.com>
 <20230214201955.7461-2-mario.limonciello@amd.com>
 <50b5498c-38fb-e2e8-63f0-3d5bbc047737@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b5498c-38fb-e2e8-63f0-3d5bbc047737@leemhuis.info>

On Fri, Feb 17, 2023 at 04:18:39PM +0100, Thorsten Leemhuis wrote:
> On 14.02.23 21:19, Mario Limonciello wrote:
> > AMD has issued an advisory indicating that having fTPM enabled in
> > BIOS can cause "stuttering" in the OS.  This issue has been fixed
> > in newer versions of the fTPM firmware, but it's up to system
> > designers to decide whether to distribute it.
> > 
> > This issue has existed for a while, but is more prevalent starting
> > with kernel 6.1 because commit b006c439d58db ("hwrng: core - start
> > hwrng kthread also for untrusted sources") started to use the fTPM
> > for hwrng by default. However, all uses of /dev/hwrng result in
> > unacceptable stuttering.
> > 
> > So, simply disable registration of the defective hwrng when detecting
> > these faulty fTPM versions.
> 
> Hmm, no reply since Mario posted this.
> 
> Jarkko, James, what's your stance on this? Does the patch look fine from
> your point of view? And does the situation justify merging this on the
> last minute for 6.2? Or should we merge it early for 6.3 and then
> backport to stable?
> 
> Ciao, Thorsten

As I stated in earlier response: do we want to forbid tpm_crb in this case
or do we want to pass-through with a faulty firmware?

Not weighting either choice here I just don't see any motivating points
in the commit message to pick either, that's all.

BR, Jarkko
