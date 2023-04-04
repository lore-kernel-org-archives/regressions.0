Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66345C942
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 19:22:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 489BD1F45A;
	Tue,  4 Apr 2023 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1680636127;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ODYZv2rqCeD104KJVnxNFk8wPaLgQ/IPSN4YJhjX9bQ=;
	b=R8DpPpAGqw8veNqkiystBYWD19MIHzLJ7VK9o7n2qiHqS3STEr6UJHmvHnj0GO18vzCh1r
	wZ8D/rsG4KiYmUjaljH86enVPwNJON2kJG/Gwsy98VSmHijdEY9uhrnrVSYQH2ADEFYs1e
	z8RLFmOpBGYi+ZrA3PMEOIHTbjU0unw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1680636127;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ODYZv2rqCeD104KJVnxNFk8wPaLgQ/IPSN4YJhjX9bQ=;
	b=5N39ZCuJ6D4LYdNWHrxwOo5YCU23l4Fm1i3WLk+P8ZIOQn7f5K0vinfdONVXstbKOMIjjy
	7axG4q0W7IJ6gRAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0901C13920;
	Tue,  4 Apr 2023 19:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Ia1UAd94LGTrcwAAMHmgww
	(envelope-from <dsterba@suse.cz>); Tue, 04 Apr 2023 19:22:07 +0000
Date: Tue, 4 Apr 2023 21:22:05 +0200
From: David Sterba <dsterba@suse.cz>
To: Boris Burkov <boris@bur.io>
Cc: Chris Mason <clm@meta.com>, Christoph Hellwig <hch@infradead.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Sergei Trofimovich <slyich@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Christopher Price <pricechrispy@gmail.com>, anand.jain@oracle.com,
	clm@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
Message-ID: <20230404192205.GF19619@suse.cz>
Reply-To: dsterba@suse.cz
References: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
 <CAEzrpqeOAiYCeHCuU2O8Hg5=xMwW_Suw1sXZtQ=f0f0WWHe9aw@mail.gmail.com>
 <ZBq+ktWm2gZR/sgq@infradead.org>
 <20230323222606.20d10de2@nz>
 <20d85dc4-b6c2-dac1-fdc6-94e44b43692a@leemhuis.info>
 <ZCxKc5ZzP3Np71IC@infradead.org>
 <41141706-2685-1b32-8624-c895a3b219ea@meta.com>
 <20230404185138.GB344341@zen>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404185138.GB344341@zen>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Tue, Apr 04, 2023 at 11:51:51AM -0700, Boris Burkov wrote:
> Our reasonable options, as I see them:
> - back to nodiscard, rely on periodic trims from the OS.

We had that before and it's a fallback in case we can't fix it but still
the problem would persist for anyone enabling async discard so it's only
limiting the impact.

> - leave low iops_limit, drives stay busy unexpectedly long, conclude that
>   that's OK, and communicate the tuning/measurement options better.

This does not sound user friendly, tuning should be possible but not
required by default. We already have enough other things that users need
to decide and in this case I don't know if there's enough information to
even make a good decision upfront.

> - set a high iops_limit (e.g. 1000) drives will get back to idle faster.
> - change an unset iops_limit to mean truly unlimited async discard, set
>   that as the default, and anyone who cares to meter it can set an
>   iops_limit.
> 
> The regression here is in drive idle time due to modest discard getting
> metered out over minutes rather than dealt with relatively quickly. So
> I would favor the unlimited async discard mode and will send a patch to
> that effect which we can discuss.

Can we do options 3 and 4, i.e. set a high iops so that the batch gets
processed faster and (4) that there's the manual override to drop the
limit completely?
