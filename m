Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47A4A5EC6
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268966; cv=none; b=XHexJNM777WJvV/s7FNRlpbpz5UzL6MZ8qVBQEtedWpj7tJw21TBwYT25EKI0Ou+oMhvilzO/1Y2Zi4T81Ed2hl3gJZnuhUOFiMJ2sIYr0MSTGvzeoM5BrVit6ZoszKksoDiv6GpfvJqYAcMYXA53W2LwE7VA1zShL6IXl9Y5yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268966; c=relaxed/simple;
	bh=q1ySiRpfEjhoUCRwyrPZF2lgs4V/ilBp6LCfakRU09w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkqKlK2WYgpmcKQsOD3cbk/vm1hD2DKEcZyxeLyAxIrow2PCHjM119roW+cZd80U4HqkcN5PrQyn1l/JDaxxZasMOXsR2KK2vI2g4N7IthcZbBZYXSacC47GyNBGtHTXg0ycY4XBq4Jt3p33SBJeuUngOG3SZkr8kAR+7Qund6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ua3RJWou; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wm4A0Jau; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HaNflKyO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E7ygGZZU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ua3RJWou";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wm4A0Jau";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HaNflKyO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E7ygGZZU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7BA47200E3;
	Thu, 24 Sep 2026 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790268958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7n45gBEqdK6VAZz1DfpvjOQS+V1wZqlT5J+u3UVYPhw=;
	b=ua3RJWouCsLj2SI68B/ZFenE/7XzJtuAu9zZavGj8+EWsiDKp7bPzGgW5B1hAjGfXiBlH9
	Zd6NWv82M84r2Eeak564gbIxw4PXpp319BfBFgnGTvmeUE0RHPUhZosooPmk1iQQ++i+td
	Z/hBJVdwwALTPJiMwP4MSklkgS2yluI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790268958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7n45gBEqdK6VAZz1DfpvjOQS+V1wZqlT5J+u3UVYPhw=;
	b=wm4A0JautO6WnwDzSjpjcpwVYAVG2B6Qe9+EauDiGXjakBm/0qesXi4WA1GSiDzlPbLbpr
	PfFt2NByGzRscyCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790268954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7n45gBEqdK6VAZz1DfpvjOQS+V1wZqlT5J+u3UVYPhw=;
	b=HaNflKyOBM7aQfnGMbwbpLMYLgCnwhe5++bj1HJUo3xYl5WSEXlI2chPbZZX28eLBDO2Ms
	oE5/ZkluYbW5YzJmFmuR1Yy2F7vza+IJXJfvde/wlEVISybRpwQKq1LSR/Mps3idtVfCAc
	WXgct2PAO8Z3peXx4hJ/TJ5nx6d039g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790268954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7n45gBEqdK6VAZz1DfpvjOQS+V1wZqlT5J+u3UVYPhw=;
	b=E7ygGZZUsLDUnBCtWigA3rxDWkjc2Kjm7CHD0No1Z4/Xp/qw9mgjO56m/FiIcSUH+eJ8hu
	9oGMuO4NpoSZOSBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F33E13354;
	Thu, 24 Sep 2026 16:55:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0mfIBxlWtWquNwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 24 Sep 2026 16:55:53 +0000
Date: Thu, 24 Sep 2026 17:55:51 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Toshi Kani <toshi.kani@hpe.com>, linux-mm@kvack.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/mm: Drop the page allocation from
 pud_free_pmd_page()
Message-ID: <arVV9WLXQOwR8Hy8@pedro-suse.tail5790ac.ts.net>
References: <20260923223116.20090-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923223116.20090-1-mikhail.v.gavrilov@gmail.com>
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pedro-suse.tail5790ac.ts.net:mid,imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Thu, Sep 24, 2026 at 03:31:16AM +0500, Mikhail Gavrilov wrote:
> On a box with a discrete GPU, lockdep reports a possible deadlock as soon
> as kswapd shrinks the TTM page pool:
> 
>   WARNING: possible circular locking dependency detected
>   7.3.0-rc3-f6e7b42bf05b+ #183 Tainted: G     U
>   ------------------------------------------------------
>   kswapd0/269 is trying to acquire lock:
>   ((init_mm).mmap_lock){++++}-{4:4}, at: change_page_attr_set_clr+0x29a/0x4a0
>   but task is already holding lock:
>   (pool_shrink_rwsem){.+.+}-{4:4}, at: ttm_pool_shrink+0xb2/0x330 [ttm]
>   Chain exists of:
>     (init_mm).mmap_lock --> fs_reclaim --> pool_shrink_rwsem
> 
> The cycle is built from three edges:
> 
>   1) pool_shrink_rwsem -> (init_mm).mmap_lock
> 
>      The TTM shrinker restores the caching attribute of every page it
>      frees, while holding pool_shrink_rwsem:
> 
>        ttm_pool_shrink()
>        -> ttm_pool_dispose_list()
>        -> ttm_pool_free_page()
>        -> set_pages_wb()
>        -> change_page_attr_set_clr()   [ init_mm mmap read lock ]
> 
>   2) fs_reclaim -> pool_shrink_rwsem
> 
>      The same shrinker, called from reclaim.
> 
>   3) (init_mm).mmap_lock -> fs_reclaim
> 
>      ioremap() installing a huge PUD mapping over an existing PMD table:
> 
>        ioremap_page_range()
>        -> vmap_range_noflush()
>        -> vmap_try_huge_pud()          [ init_mm mmap read lock ]
>        -> pud_free_pmd_page()
>        -> __get_free_page(GFP_KERNEL)  [ enters reclaim ]
> 
> Edge 3 is the one that should not exist.  Now that the attribute-change
> path takes the init_mm mmap lock, reclaim can acquire it, so the lock
> must not be held over an allocation which can enter reclaim.  CPA itself
> follows this rule: split_large_page() drops the lock around
> pagetable_alloc().  The huge vmap path, which has held the same lock
> since commit 26444eb71465
> ("mm/vmalloc: acquire init_mm lock on huge vmap to avoid ptdump UAF"),
> does not: pud_free_pmd_page() allocates a scratch page underneath it.
> 
> That page does not need to exist.  It only holds a copy of the PMD
> entries, so that they can be cleared before the PUD is.  But the PMD
> table itself is freed after pud_clear() and the flush, so the code
> already relies on the table being out of reach of the page walker at
> that point - and if it is safe to free it then, it is safe to read it
> then.  Nobody else writes to it either: vmap_try_huge_pud() only gets
> here for a range covering the whole PUD, and ptdump is kept out by the
> init_mm lock the caller holds.
> 
> So clear the PUD, flush, and free the PTE tables straight from the
> detached PMD table - the same order pmd_free_pte_page() uses one level
> down.  With no allocation left the cycle is gone, and so is the only way
> this function could fail.
> 
> The copy came with commit 5e0fb5df2ee8
> ("x86/mm: Add TLB purge to free pmd/pte page interfaces"), whose
> changelog explains the flush but not the copy; the allocation itself was
> already questioned in review back then [1].  The same lock cycle was
> also reported from the i915 shrinker, with &vm->mutex in place of
> pool_shrink_rwsem [2].
> 
> Fixes: d5d8b8662e6e ("x86/mm/pat: Acquire init_mm read lock on attribute changes to avoid UAF")
> Suggested-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

Thanks for the fix!

-- 
Pedro
