Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4208F68
	for <regressions@lists.linux.dev>; Thu, 20 Apr 2023 19:02:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A215219DF;
	Thu, 20 Apr 2023 19:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1682017370;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyOpH1UnQrvVJw6kWYdzta6t/ke0kX3oYrzbrP5nCuQ=;
	b=v1d+3DaMAllHzLN5tsGSUp+ae/unfKhbqg+TQFsgWHC+t4iTyrrUgFOp5USdxySWmOnw88
	xrkk/1PF4C/qgKHJH2Q4s1IlBbXov5PXa3Mg8iea3F2Vl6oK7WhiygJvLuaVAbGnsc51xs
	1b2KHd6La1ccwopUyNu3ZglA21e9Sss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1682017370;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wyOpH1UnQrvVJw6kWYdzta6t/ke0kX3oYrzbrP5nCuQ=;
	b=NNsgpZgAKDpS40EAM3z4xvLFkP2uLB+Pl1kG6ul1+v08CNRiszf8icDRDKzWCnWrD34DSU
	J/BuQwFuLRia8NCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDD0F1333C;
	Thu, 20 Apr 2023 19:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7lVxMVmMQWTKQgAAMHmgww
	(envelope-from <dsterba@suse.cz>); Thu, 20 Apr 2023 19:02:49 +0000
Date: Thu, 20 Apr 2023 21:02:39 +0200
From: David Sterba <dsterba@suse.cz>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>,
	Rafael Wysocki <rafael@kernel.org>, David Sterba <dsterba@suse.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Linux regressions report for mainline [2023-04-16]
Message-ID: <20230420190239.GX19619@suse.cz>
Reply-To: dsterba@suse.cz
References: <168166781352.1843526.278570500979918184@leemhuis.info>
 <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
 <20230418182036.GS19619@suse.cz>
 <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)

On Tue, Apr 18, 2023 at 12:11:51PM -0700, Linus Torvalds wrote:
> On Tue, Apr 18, 2023 at 11:20 AM David Sterba <dsterba@suse.cz> wrote:
> >
> > There's also in-memory cache of already trimmed ranges since last mount
> > so even running discard repeatedly (either fstrim or as mount option)
> > will not do extra IO. We try hard not to provoke the firmware bugs.

[...]

> Again, that's libata - odd crazy hardware. But it's exactly the odd
> crazy hardware that worries me. When the failure mode isn't "it's
> slow", but "it ATE MY WHOLE DISK", that's a scary scary problem.
> 
> Hmm?
> 
> I dunno. Maybe you have reason to believe that all of these cases have
> been fixed, or that some of these were caused by kernel bugs because
> we did things wrong, and those have been fixed.
> 
> But the failure modes just makes me worry. From your email, it *seems*
> like you think that the failures were primarily performance-related.

No, the main concern is if discard works without destroying data,
performance is more like an optimization. I too worry about buggy
hardware, we have a page just about that
https://btrfs.readthedocs.io/en/latest/Hardware.html .

I've taken notes from your reply and will enhance the page, or page
about discard in particular. The info about device quirks/horkage could
be linked too or I thought about generating a static page from the
per-bus tables so it's on one page.

I'll send pull request with fixes for the regression.
