Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8E5145B27
	for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321253; cv=none; b=pqIZEwNaRCiCYxhoknw82JXXLCHm/PngEaN2TFXBq9MTOtsLl35e7fpqnzht4lfOpVfYaSKem6t/43b6sFHyYHReIqLQpMlRomopMFYOrROwTRTkpLQvP4INYpWvFeNGRnEnU2701tssMTXWCeaSYdeZijnQHFEd4yMNrZaWhC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321253; c=relaxed/simple;
	bh=MczutNopvym+aLd4VAnmq1I5ltfQNC54OxZUv3eO/Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVBoqM04H+nI8IlAWrSbfEqy54Nt+XqVJz7bFWLEjkTrcnDgrwtRkKnxFXpAoPyxmLaIzn72XbhntfLF5nTOgjy5ZqW5EWujrMV/zbf3Dvb65/GsUv24rAvK68j/x3W7MfLlDuPwvbg+QAZn15t7cK1CDcQePYASPSjCmzWp1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSfc4ysL; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSfc4ysL"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso4591065e9.3
        for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790321250; x=1790926050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qVH4xy3bEZql7DbItAa1RNXdUwDHnSm6EwoBaYYWu8=;
        b=WSfc4ysLyV6Fnzsvbu83HJ3IC1A7+MuWNHtvx/rXuPbAYKHM4fwmnOKcLThAHBmAnV
         B4NnRL1EUsU0T0oS7+X5agRnKxcMkaijj0qbOxCKAY1yalgongJv6GmEOM4TvU8cNnwb
         wDAYckUm4Xwi8/t/TZ2wjksqDA8rqCZzKUELkvooFmaAcs41NoWxYnaY+x1UzwkHXBOE
         4kLIJse20NjpK2o6FKb/AnzzUr5r5v3K4ZZuVs+yAi0uA1zvZ4e8CwszHoQbRSYbsaIE
         4tCFzTCjymgzRVyJx9iCJGDP4ZcJBPemaJldlpIksk+m0bfcBEdfe5VuK2yrmoMigkDj
         4yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321250; x=1790926050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qVH4xy3bEZql7DbItAa1RNXdUwDHnSm6EwoBaYYWu8=;
        b=uIn6kHYMppSxgyP25DsNigAjRNJMsiqxSTO8TQgCWUaaXTuELp/J9cUwwx/+h60nin
         y5tieZzMNTbMbaL7uqOr8XQtXbCgYdkRsDgYONs6qQb/qVkPlb+cekvZq3cCvluFW3aK
         Ig9G2EpiyMhvH9fEe9oGvFGHqcqn7aEefffhIcKk909ImbHhVdGzHoO2SxhaJDtXX7/F
         KC3XvTLlIQWqbfdOrL3ct8oQso2noJLO481+S5RPW9WIvH8dRtRwtLK7hI53UPVG+sGt
         SqvossaClzBe9R4/3gowcu1SavyHD0aRMuUnoj5m9pg1qIOvlHGYm9md97p7AqrsU1uG
         xVxA==
X-Forwarded-Encrypted: i=1; AKwUvBw/nZOb+f0W6dSIOpNdo48jj5hVVnQvIuE6Dcinnb0YNU96Me16+H+omXdyqtOBdVNNdGhgJIO0LR+yog==@lists.linux.dev
X-Gm-Message-State: AFuF++kMmrvbzgMHD9JxcHGbBCmwKe86bJCvtjMBnWodbznBrv6vak2/
	D5HX+niX4KAfQ0yP1VNhM3XBF9ecFL6VAM29AWCdBHUTU31/f0AZ6TEo
X-Gm-Gg: AYBFou3k3rBY5n2GW7lC1XVmKIJXpU8UV99b0k96ug7FC3mTcSYX9bB1LVpGu6FV6IM
	3GcJ71aFCBg3qi97nnZbmQteScRtRk0CbePJ067fFqUrCs3dyzCf1mMlJJs4NSigNdw36/BnZlI
	xL5j80nFPTlPjKiZ4UfFJnzmjvyiQvzVJb/B/wCOKo5LyGZeT/700dqsYqf/s2NjRLy8XcOZ1Hn
	h/IVriPV299PL+Dbrq8njMZE7RpOqbwm/3Lw9+tO02ne2eLm8+yX0xA9jzpYTTHkvemjiZGCcNw
	WJHTFOYtbAlQNzrbhzdoMP40y5Mkw1FCpBUBYXyDVL79Iz/issV+Lkb1ZH4b0n/MdGeO20ix2ay
	1ZV3dME6sbnGu+GND6aKyz+8Q8xE1P6XcpUQ0HNEJ8rv35ACq7MIRTEkxMGvNw3CEV5/PD8Htbd
	ucewVNzoYyVuwGhquYG0D4nL3k01JV7Fwsqrml0+j23EvakYAoIx3Gnvz2szI=
X-Received: by 2002:a05:600c:3556:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-49fe6708a46mr82223855e9.31.1790321250356;
        Fri, 25 Sep 2026 00:27:30 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee9203f0sm32571675e9.1.2026.09.25.00.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:27:29 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:27:26 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Vishal Moola <vishal.moola@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org, linux-mm@kvack.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: don't schedule deferred kernel page table freeing
 while booting
Message-ID: <arYhPon5nrixAm3I@gmail.com>
References: <20260925050647.86913-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925050647.86913-1-mikhail.v.gavrilov@gmail.com>

On Fri, Sep 25, 2026 at 10:06:47AM +0500, Mikhail Gavrilov wrote:
> Booting with a boot-time function tracer and a filter, for example
>
>   ftrace=function ftrace_filter=pud_free_pmd_page
>
> panics on 7.3-rc4 as soon as the tracer starts:
>
>   [   23.531178] Starting tracer 'function'
>   [   23.675800] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN NOPTI
>   [   23.819917] KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
>   [   23.964025] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.3.0-rc4-fe2ec83746e5-with-fixes-v2+ #195 PREEMPT(undef)
>   [   24.252248] RIP: 0010:__queue_work+0xab/0xf00
>   [   25.981629] Call Trace:
>   [   26.125727]  <TASK>
>   [   26.413912]  ? pagetable_free_kernel+0x20/0x120
>   [   26.990283]  queue_work_on+0x97/0xf0
>   [   27.134382]  __cpa_collapse_large_pages+0x501/0x6f0
>   [   27.566662]  cpa_flush+0x394/0x620
>   [   27.998953]  change_page_attr_set_clr+0x321/0x4a0
>   [   29.151729]  set_memory_rox+0xa2/0xf0
>   [   29.584018]  create_trampoline+0x431/0x6f0
>   ...
>   [   44.343347] Kernel panic - not syncing: Attempted to kill the idle task!
>
> The boot-time tracer is started from early_trace_init(), which runs
> before workqueue_init_early().  Making its trampoline read-only splits a
> large page, and CPA collapses it again right away.  The split table has
> been a kernel page table since commit 9e4a3ec3411b
> ("x86/mm/pat: Allocate split page tables as kernel page tables"), so the
> collapse frees it through pagetable_free_kernel(), which queues work on
> system_percpu_wq - still NULL at that point.  That commit is correct in
> itself; it only lets CPA reach pagetable_free_kernel() before the
> workqueue that function relies on exists.
>
> Keep putting the table on the list, but don't schedule the work while
> the system is still booting.  A core_initcall schedules it once to free
> whatever was queued by then.
>
> Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
> ---
> v3:
>  - Schedule the work once from a core_initcall to free whatever was
>    queued during boot (Lorenzo Stoakes, Dave Hansen, David Hildenbrand).
>    late_initcall would work just as well; workqueues exist from
>    workqueue_init() on.
>  - Keep the fix in pagetable_free_kernel() rather than skipping the
>    collapse during boot (Mike Rapoport): that would only avoid this
>    caller, and any other early free would still need a workqueue.
> v2: https://lore.kernel.org/20260924092307.22813-1-mikhail.v.gavrilov@gmail.com
> v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
>
> Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX (lockdep, KASAN),
> 7.3-rc4 plus unrelated local changes, by booting with
>
>   ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func,kernel_pgtable_drain_early
>
> The boot that panicked without the fix completes, and the trace shows
> kernel_pgtable_drain_early() and then kernel_pgtable_work_func() before
> any other kernel page table is freed.
>
>  mm/pgtable-generic.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..cd227fc05d2d 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -438,12 +438,30 @@ static void kernel_pgtable_work_func(struct work_struct *work)
>  		__pagetable_free(pt);
>  }
>
> +static void schedule_kernel_pgtable_free(void)
> +{
> +	schedule_work(&kernel_pgtable_work.work);
> +}
> +
>  void pagetable_free_kernel(struct ptdesc *pt)
>  {
>  	spin_lock(&kernel_pgtable_work.lock);
>  	list_add(&pt->pt_list, &kernel_pgtable_work.list);
>  	spin_unlock(&kernel_pgtable_work.lock);
>
> -	schedule_work(&kernel_pgtable_work.work);
> +	/*
> +	 * The workqueue may not exist yet while the system is booting.
> +	 * kernel_pgtable_drain_early() schedules the work once it does.
> +	 */
> +	if (system_state != SYSTEM_BOOTING)
> +		schedule_kernel_pgtable_free();
> +}
> +
> +static int __init kernel_pgtable_drain_early(void)
> +{
> +	/* Free the kernel page tables queued while booting. */
> +	schedule_kernel_pgtable_free();
> +	return 0;
>  }
> +core_initcall(kernel_pgtable_drain_early);
>  #endif

tested it, boots cleanly and the panic is gone. LGTM.

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

--
cheers, jose a. p-a
