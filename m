Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E534BA28
	for <regressions@lists.linux.dev>; Wed, 22 Jul 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729500; cv=none; b=Kw6q/eX67HJVWCeL8n85qhOIKIKt3mjH/9de5DgLWutpNim43BhuNIKyr0d9rnDN0v22I7QtxF/EGhxEa/UF4Mjr5CvjFN/Lea4mjpjuQNSApA6MZ5RhTUdkCXCHUGDfxomTA8R7Vct+aI8sVSH2mtMXv67wPVyg9N5+MX260fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729500; c=relaxed/simple;
	bh=QWFbfdKOhnViM3dmLfszh+P7lBfRPS8MfC/o78FIeWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zp1EKc7XFoOrkC0zwxtJcj3crOjvaLC5BfN4mT1SMDaMvTrfbPFfX7ZXBFDapRkKcc7ucJHcjHx/nF9DEjjrk1202OuGqGGRFNrO/1MZLLQYk7H7U8u3Npa8nyePxGXNdnqLSOGMLByObZRZupWkr+dA/hwCbUU3mRx2DtTgl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xpRyxpJ6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=paLVIxha; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sFnXoS7k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0oIcZBox; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xpRyxpJ6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="paLVIxha";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sFnXoS7k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0oIcZBox"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 355CE7AB1A;
	Wed, 22 Jul 2026 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784729497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkI7b3KzTTEbecciLZp7VpOs077wu87j0443+fnVSOA=;
	b=xpRyxpJ6/1Io65Ocv49WPB22oI9cxtLRl2tOYwMTU8+YlQVVfqULvecE1DDLhleGcPbDsL
	b+ZNgO1bA8p/+q+Usoy+k7G8HOZK+Dd1fsZVUXp0V4qy8Qle7AynC9r6jIX9xPsJF9AfTd
	1KTYmv8Ahoj/xtg14K4jYQSib+0rzDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784729497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkI7b3KzTTEbecciLZp7VpOs077wu87j0443+fnVSOA=;
	b=paLVIxhajQzCG2cSkVnmW/+WQAKxASK6HtCujduysZ900eKCstJkEQjqtpzvoPFsN01C+y
	iYeWa3J0wpTBEGDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784729496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkI7b3KzTTEbecciLZp7VpOs077wu87j0443+fnVSOA=;
	b=sFnXoS7kZOwTeETW90nA0EOl+wld74h9v+gnJpFCw1W5O/RwVh1EGcVLBNl+2kRI9mcxL5
	SGzM8fNMXzWCMIoqchcnBL6zgr7Pt9k+TDKn+8CfjUCU0/Ox3e5h0nrQtqvPjJIyJ4xwjZ
	X5o7lloXAcLc+2ZHLtzWJEMpzdpG/R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784729496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hkI7b3KzTTEbecciLZp7VpOs077wu87j0443+fnVSOA=;
	b=0oIcZBoxY07zLnwfUWWXoQmuKT5XR6hFNMSRvkm+pxHmHrF4GN2ulwrB+EC25iqdlY/usW
	d7XjIXcwgjbVVkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E6EF779B0;
	Wed, 22 Jul 2026 14:11:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6RldHJbPYGqlWAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 22 Jul 2026 14:11:34 +0000
Date: Wed, 22 Jul 2026 15:11:32 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: Chengfeng Lin <chengfenglin@stu.xmu.edu.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] mm/mprotect: shared-dirty base-page toggle slower
 since v6.17
Message-ID: <amDOXEjIQCQdOfb9@pedro-suse.lan>
References: <7c9eeb21.1c04f.19efaacbb2f.Coremail.chengfenglin@stu.xmu.edu.cn>
 <433d619a.1e8a6.19f1d4d1be6.Coremail.chengfenglin@stu.xmu.edu.cn>
 <6c8d9b6c.24a8b.19f84afccdd.Coremail.chengfenglin@stu.xmu.edu.cn>
 <dc402537-1527-4433-839e-960b6eb32bc4@arm.com>
 <4dceab6f.24e3b.19f8966e8ed.Coremail.chengfenglin@stu.xmu.edu.cn>
 <03f91210-e0b7-43b9-9a95-755b986b3c40@arm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03f91210-e0b7-43b9-9a95-755b986b3c40@arm.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Wed, Jul 22, 2026 at 07:24:31PM +0530, Dev Jain wrote:
> 
> 
> On 22/07/26 4:07 pm, Chengfeng Lin wrote:
> > Hi,
> > 
> > Sorry that my earlier message was difficult to follow.
> > 
> > The previous exact parent/child test showed that cac1db8c3aad slowed this
> > workload by 39.77%. To answer your question directly: no. In a separate
> > matched v7.1.3 patch-on/patch-off test, Pedro's full v3 series was 6.20%
> > slower than the no-v3 controls, so it did not reduce the slowdown in this
> > workload.
> > 
> > I also checked for an update. The latest public revision I found is still v3,
> > and it is already included in Linux v7.1.3.
> > 
> > To isolate the series, I used the same v7.1.3 source for both kernels. The
> > no-v3 kernel replaces only mm/mprotect.c with the exact pre-series file at
> > 19999e479c2a. The full-v3 kernel is unmodified v7.1.3 and matches the series
> > tip at 89e613bc0b2d. The normalized configs and all other build conditions
> > were the same.
> > 
> > I used a fresh boot for every point:
> > 
> >   point       mean ns/page
> >   no-v3 A          55.333
> >   full v3          58.200
> >   no-v3 B          54.267
> > 
> > The no-v3 midpoint was 54.800 ns/page. Full v3 was 6.20% slower than that
> > midpoint. The two controls drifted by -1.93%. Dropping the first measured run
> > from every point left the v3 delta at +6.18%.
> > 
> > This was the same narrow standalone workload: a 64 MiB shared anonymous
> > mapping, dirty 4 KiB pages, and repeated full-range read-only, restore, and
> > write-touch cycles. Each point had 3 warm-up processes and 15 measured
> > processes; each measured process ran 1,000 cycles. The benchmark was pinned to
> > one P-core with Turbo disabled and preempt=none.
> > 
> > All 45 measured processes passed the returned-value checks and stayed on 4 KiB
> > pages with no THP. The protect and restore phases were each about 23 ns/page
> > with v3 and 21 ns/page without v3. The later write-touch phase was unchanged.
> > 
> > So, for this specific microbenchmark on this machine, Pedro v3 did not reduce
> > the slowdown. It produced a small slowdown instead. I am not making a claim
> > about other mprotect patterns or application-level performance. My earlier
> > QEMU result that suggested a partial improvement should not be used.
> 
> I don't see why Pedro's patches should cause a slowdown. The only diff I can think
> of is the if (likely(nr_ptes == 1)) check.

Agree. I don't really understand what this slowdown is about (nor have I had
a proper look, to be fair).

> 
> But again, we have had these microbench regression discussions before. I think it
> is clear by now that vm_normal_folio() is bad on some systems. Best we can do
> here IMO is avoid that by doing something like

On my desktop the results were very clear: vm_normal_folio() didn't really
make a difference.

Perhaps we're looking at microarchitectural differences here. I dunno.

-- 
Pedro
