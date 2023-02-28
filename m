Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAB89459
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 19:46:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BF691FDF8;
	Tue, 28 Feb 2023 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1677613599;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O1DFtNUoiEKvJsWjC750ncMKko1mfsdfGBS++7Mc/4M=;
	b=BffTSXjnd70v/1FpzEOx+mNJGNOgzmC65vTnc9y9XMg+5d4I1NDABmwixnah7HUFFixy6N
	YU7dH4aMyEZH1FoWDSvBFqF6cUjiR0/3jTf0wRBcbMCo+00ROR24jxm5sm3KG4Wj33bVGc
	VFNwpMFwYlS9E7F83FhLMT8fj2om+mg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1677613599;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O1DFtNUoiEKvJsWjC750ncMKko1mfsdfGBS++7Mc/4M=;
	b=WZ6vaYFaIDvRSRUjtc5BJu1vkXThYYiWwi4nywnAVWtuoe1t/7obBAMT2eYxfR56NciUR+
	YPimTPePjlLFGxDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C96FA1333C;
	Tue, 28 Feb 2023 19:46:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2VwnMB5a/mNWcAAAMHmgww
	(envelope-from <dsterba@suse.cz>); Tue, 28 Feb 2023 19:46:38 +0000
Date: Tue, 28 Feb 2023 20:40:39 +0100
From: David Sterba <dsterba@suse.cz>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Chris Mason <clm@fb.com>, linux-btrfs <linux-btrfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Wyatt Childers <kernel.dbwta@haxing.ninja>, pmacedo@gmail.com
Subject: Re: [Regression] Bug 216961 - Severe IO scheduling starvation issues
 with btrfs
Message-ID: <20230228194039.GP10580@suse.cz>
Reply-To: dsterba@suse.cz
References: <0ca02b1f-ab00-9fa6-aecc-c2c46d624e49@leemhuis.info>
 <e0998928-0f4e-f2a9-2e77-3e4bab459688@leemhuis.info>
 <CAEzrpqc6tweHqKKPZYyVuOXH1Wd+hmrTPfcrpa-5-btU_Z24Fg@mail.gmail.com>
 <06a5ada1-d1b8-3139-3a60-f43958f90f79@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06a5ada1-d1b8-3139-3a60-f43958f90f79@leemhuis.info>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Fri, Feb 17, 2023 at 06:17:58AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 16.02.23 23:39, Josef Bacik wrote:
> > On Thu, Feb 16, 2023 at 12:43 PM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >>
> >> Hi btrfs maintainers and developers.
> >>
> >> I might be missing something, but it looks like the report was ignored.
> >> Is there a reason for that?
> > 
> > Mostly just being blind.
> 
> Happens.
> 
> >  I've responded to the BZ, I'll investigate
> > through the BZ.

According to the bug it's a problem in BFQ.
