Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597B354AE3
	for <regressions@lists.linux.dev>; Mon, 25 May 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704963; cv=none; b=MZ8WSceGe5StOtF14INZMaTpOsN0JRHTYT+mt3XnnWRsTE1+YVpBSEXNIFPWhmDna2Og0NX1RRqzy+e/XcMNgOwcCqr1GsZG2mu+/UyPx0LcDK6iuk2yqYkItlDkdITDj7/EY12FivYyxdT0d3CoZgvzDQNH4DpS3sGolGKfnNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704963; c=relaxed/simple;
	bh=xJ8I4E/MJSY3kBNWBvdIiPiOYXuFwMV9VTjh5bhScAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKRzQGdXob6i/5ZZ+DdFM2I/PIas70HJ940A2vkOOQgEStGjqDkbERw1+OETSMadjDn+WVXCG6YNoBpyfNBsyKErWk1YoBGLbhnFmQEa2BYaZlu6AGjJ3LkJ/ufwx+EadHuMoDRTFq+VM5imnQipsCrXqOYn8TR2CWIUiWQKgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JC6D2Bgi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V8pO8y7y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tIr/gFHi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u0pKEILD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JC6D2Bgi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V8pO8y7y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tIr/gFHi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u0pKEILD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E907D6712F;
	Mon, 25 May 2026 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779704960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CycC2ZMawe+cWFXV2MnLD5iCp+usEHsS0lt4PGUIcow=;
	b=JC6D2BgiXUbyJqfXHX3RNI8GRs8YEakziKzUofDhJZVuS68uX0Q+tCDD8o7g6i40xIK5zM
	RdIt2Jal0MRNkR61SPZh7HB5rz90J1sH798019RyRcFAW7Trtu7PsA601eyclMvQ7eVaW+
	Pz9kUi5LQ0A9PCxtPsi7jt/Gvimx11c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779704960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CycC2ZMawe+cWFXV2MnLD5iCp+usEHsS0lt4PGUIcow=;
	b=V8pO8y7y5KuM+PyWwu5eQIxIEToTkNitaofWoWpee8ooWNiGqni6lbh5spIgVSxf5tSFwk
	uYy9xBm29y1kGDBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="tIr/gFHi";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u0pKEILD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779704959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CycC2ZMawe+cWFXV2MnLD5iCp+usEHsS0lt4PGUIcow=;
	b=tIr/gFHi9jYWVNG0daj1gTLufvBVem/idYtb/H3qo+ufEqEHabbDK8n6DNpG/HhQ5G65ei
	oHqQpgjxIGEFtUHAdlsjkUH6IWGQ0YxW2aXhQKmI/pRDVwgyfMW5/9h9PfDQmktbRtaa/4
	1deGSRpXlzoLVROBRDDoyLOR19FeE8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779704959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CycC2ZMawe+cWFXV2MnLD5iCp+usEHsS0lt4PGUIcow=;
	b=u0pKEILDQ/Gq6We4ziTcV1jDtougCufoctiG8ZS+qm7NbZWpavmIucsPCuFNlL0z/IuwtZ
	OGD1fLs+4D522aCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4F6059BC8;
	Mon, 25 May 2026 10:29:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xm2QMH4kFGpRRgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 25 May 2026 10:29:18 +0000
Date: Mon, 25 May 2026 11:29:17 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Chengfeng Lin <23020251154299@stu.xmu.edu.cn>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, ljs@kernel.org
Subject: Re: [REGRESSION] mm/mprotect: shared dirty PTE toggle takes ~1.6x
 longer on v6.19 than v6.12
Message-ID: <ahQjTqw_m8lXFvsP@pedro-suse.lan>
References: <662955ba.f499.19e3b2cf478.Coremail.23020251154299@stu.xmu.edu.cn>
 <dfdef925-4127-4e7c-bbe1-e7b2542355da@kernel.org>
 <7bab1d67.f5c0.19e3c0979ea.Coremail.23020251154299@stu.xmu.edu.cn>
 <4fbfa9d.10a05.19e4eed247a.Coremail.23020251154299@stu.xmu.edu.cn>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fbfa9d.10a05.19e4eed247a.Coremail.23020251154299@stu.xmu.edu.cn>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Queue-Id: E907D6712F
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	internal_greylist_whitelist(0.00)[2a07:de40:b281:104:10:150:64:97];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, May 22, 2026 at 05:03:44PM +0800, Chengfeng Lin wrote:
> Hi David,
> 
> Thanks for the pointer. I tested the current akpm/mm mm-unstable branch at
> 444fc9435e57, which contains Pedro's v3 two-patch mprotect series: the
> softleaf refactor and the relevant small-folio / nr_ptes == 1 changes.
> 
> I first ran a local sanity check, and then reran the same shared-dirty
> full-range toggle workload on the lab machine:
> 
>   kernels: v6.12.77, v6.19.9, akpm/mm mm-unstable 444fc9435e57
>   QEMU: direct boot
>   lab guest CPUs: QEMU_SMP=1/2/4/8/16
>   lab guest memory: 14336 MiB for 1/2/4 CPU, 16384 MiB for 8 CPU,
>                     32768 MiB for 16 CPU
>   repetitions: 9
>   order: interleaved
>   coverage: disabled
> 
> The primary metric is cycle_ns_per_page, lower is better. Here "cycle" means
> one workload iteration, not CPU cycles:
> 
>   CPU   v6.12.77   v6.19.9   mm-unstable   mm-unstable vs v6.19   gap closed
>     1      336.1     532.0       497.0          6.6% faster          17.9%
>     2      369.2     581.9       503.3         13.5% faster          36.9%
>     4      355.7     587.2       524.2         10.7% faster          27.2%
>     8      369.7     583.6       534.2          8.5% faster          23.1%
>    16      374.8     607.1       547.8          9.8% faster          25.5%
> 
> The 1/2/4/8 CPU rows completed 9/9 runs for all three kernels. In the
> 16 CPU row, v6.12.77 had one QEMU failure, so I would treat that row only
> as a supporting trend.
> 
> So yes, Pedro's small-folio work does reduce this synthetic shared-dirty
> signal in my setup. It does not seem to remove most of the gap to v6.12.77:
> looking at cycle_ns_per_page, it closes roughly 18-37% of the v6.12 ->
> v6.19 gap in the clean 1/2/4/8 CPU lab rows.
> 
> I also ran a separate state-shape audit, because the MADV_PAGEOUT follow-up
> showed that a timing delta can be misleading if the compared kernels are not
> actually operating on the same page state. For this mprotect workload, the
> successful runs across v6.12.77, v6.19.9, and mm-unstable all used the same
> 4 KiB shared-dirty PTE mapping shape:
> 
>   expected_match_ratio = 100
>   unexpected_results = 0
>   final_vmas_avg = 1
>   present pages before/after protect = 16384 / 16384
>   AnonHugePages = 0
>   KernelPageSize/MMUPageSize = 4 KiB / 4 KiB
>   THPeligible = 0
> 
> The state audit used the same 1/2/4/8/16 CPU and memory matrix, with 5 runs
> per kernel. The 1/2/4/8 CPU rows completed 5/5 for all three kernels; the
> 16 CPU row had one v6.19.9 QEMU failure, but the successful v6.19.9 runs had
> the same state-shape values.
> 
> I put the follow-up summaries here:
> 
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/0c0e2d9/mprotect-shared-dirty-toggle/mm-unstable-lab-sanity
> 
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/0c0e2d9/mprotect-shared-dirty-toggle/state-audit-lab
> 
> Given Lorenzo's question and the synthetic nature of this workload, I will
> avoid treating this as a strong regression claim unless I can provide a
> standalone reproducer and/or a narrower bisect. If this remaining signal is
> still useful to characterize, I can prepare a smaller standalone reproducer
> or try to bisect the remaining gap.

Yes, if you could give me more pointers (and a simpler repro) I would be happy
to take a quick look. Otherwise there's not much I can do here :)

-- 
Pedro
