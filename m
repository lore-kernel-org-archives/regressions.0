Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4736239768F;
	Thu, 24 Sep 2026 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266767; cv=none; b=oz1SwDKV0xR4oVEHJsIbnT5R6Vi6RNz5YDUIQ0O68H4cJRuFm5W+PRpU2yqi5B8WGzBQOjmCrzXkivNFozN/M78h3PpU/XYPNZ3bbPpfabWY9xCO2Y9DtobwYn8csfw+6p1m3VfEBAxtKoLLe8uvJaoFbhjzL/G+jQFgBo5/hUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266767; c=relaxed/simple;
	bh=TBBAdVZ9hQ764wuXnJkSy2mfXhg34VtFsuuVDYurrD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bz7veaeyTScNSiJBRmtJcttDblenZ8jSJo1MqjXwVBvJEqwZHBOnTCagcoxmnbuMY/5UJzKDKkBNIhOdEsCfYGmEs3Y/5mzgzQa/OZ3T8unsDPw++eAfjObCBTa7nR2+LqTJY5JbdbqWto/QecRL/fPUUtenJw6nmpR6H4OGQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdniQZtX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdniQZtX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24CB1F000FF;
	Thu, 24 Sep 2026 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790266765;
	bh=r66646FaaMJmMMJtghlI/Jm1UKe8pCt6tSOa0dL7Cmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LdniQZtX4VayI3layjWdH4eFwyIF4H2Bq/vkmWjcfnkWIAwhEABQuq80dlBDeCe9n
	 VSFQnk+R5ZEvRXfbMH9Diul7TU7qquNPg9rZizuO7XkXLQ2VOYpL8o2m6xzzujwoOd
	 jemxUJFqOVj8o9Yz+fG7IqtthMIkmcjgmFXc164DQE/77DySgEnq+H9IKUcHj1CgEC
	 1bJEPf0Sfjj6L/l4EyU1/EM2tCrRA5ERREOjE+1O92aH4amkcecW56ODAMlKoPpi1j
	 dArMrpCMbNZF74xPxGBNWOFoLwdCcDkSDQKWepXEif42nqcvbgimieEl1boZFJn2H0
	 c5c1WvpdiU9aQ==
Date: Thu, 24 Sep 2026 19:19:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org,
	linux-mm@kvack.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: don't schedule deferred kernel page table freeing
 while booting
Message-ID: <arVNhTkI3kesfRs0@kernel.org>
References: <20260924092307.22813-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924092307.22813-1-mikhail.v.gavrilov@gmail.com>

On Thu, Sep 24, 2026 at 02:23:07PM +0500, Mikhail Gavrilov wrote:
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
> the system is still booting.  The next kernel page table freed after
> boot schedules it, and the work then frees the early table too, after
> the same IOMMU flush as any other.  If no kernel page table is freed
> after boot, the ones freed during boot stay on the list.
> 
> Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
> ---
> v2:
>  - Keep the table on the list and only skip scheduling the work while
>    booting, instead of freeing it directly (David Hildenbrand)
>  - Say that 9e4a3ec3411b is correct in itself and only exposes the
>    problem (Lorenzo Stoakes)
> v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
> 
> Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX, lockdep and KASAN
> enabled, on 7.3-rc4 (fe2ec83746e5) with the same unrelated local
> changes as noted for v1, booting with
> 
>   ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func
> 
> The boot that panicked without the fix completes.  The table freed
> while the tracer installs itself does not show up in the trace, since
> the tracer is not live yet at that point, but the first kernel page
> table freed after boot does: systemd-modules-load freeing one from
> __cpa_collapse_large_pages() schedules the work, and
> kernel_pgtable_work_func() runs 0.8 ms later and drains the list.  From
> then on every pagetable_free_kernel() in the trace (660 entries, none
> lost) is followed by a work run within a few milliseconds.  So on this
> box the early tables wait until the first module is loaded, and no
> separate drain is needed.
> 
>  mm/pgtable-generic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..f7f504f57914 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -444,6 +444,12 @@ void pagetable_free_kernel(struct ptdesc *pt)
>  	list_add(&pt->pt_list, &kernel_pgtable_work.list);
>  	spin_unlock(&kernel_pgtable_work.lock);
>  
> -	schedule_work(&kernel_pgtable_work.work);
> +	/*
> +	 * The workqueue may not exist yet while the system is booting.
> +	 * The next kernel page table freed after boot schedules the work,
> +	 * which then frees this one as well.
> +	 */
> +	if (system_state != SYSTEM_BOOTING)
> +		schedule_work(&kernel_pgtable_work.work);

Maybe we'll just skip collapse on boot?

>  }
>  #endif
> -- 
> 2.55.0
> 

-- 
Sincerely yours,
Mike.
