Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD1635677C;
	Thu, 24 Sep 2026 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242284; cv=none; b=iMqmHgEGKoqRZ9yB7kQHVxJIpQH+wfdnc6lbk8oqW9ZUQpU8I5H5oPzQTCJvxxRXFshr9beQPGj3B+XFWpmN7MEpcJ+8kXUqS3uLAejv3fWn8MBmywBPchU9qktYcQ1WrHwiTAwT5rLYefFiWEs8jArfv2Bczy8tSdumpo/tx84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242284; c=relaxed/simple;
	bh=3016/YcUrafmSJfnVIIyNUFVP7OY0QoPQKi4VrtHhdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOjqat7oLnA/Q7Pk/LTrUZ6P7Q8tcaWDnVhGh5eoAfJuFXjLWpT+Zm3lOdWNLAFMKltKStOi9sGdMrpR0GoOWGYR0pGq6hlgM+UmWqaEnAEJq0xUYp4qF6IKlNtMk65r4GVkDvQoeq6+9vXeJvYhRmnXGqnbNxGZymRYASU2+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZmbNWDr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZmbNWDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9CC1F000FF;
	Thu, 24 Sep 2026 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790242282;
	bh=NeTuCFcemX/adNl5XbtKYCBGxqR8ivj2ssA68DygpBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EZmbNWDrJtzCFAJtM9thEalDnEZjbzv/YFJ6VRB0CFMs6afx6LFyjqWeB9uvZu9Qj
	 x81U9J6SOwj+0cLIr/MZhV0koClWIOxcD5o/aYGCmtyDTOVlrSVvKX6ZfcZBj68e6K
	 vYdqUfgrFK//iQz1ODBsg0qkf5SSSUOk+wALZMA2yrtTuYJTmKd2zxd3tMMblpobmo
	 OPdWy5LyVA52bNPo6ohdMZWzXomoavKccUxrgflAMfYVBRrOQO6rK1bHxObbSADG3d
	 kdoP8cjsGmQto1i2Tuxf28J9IBuOzTTBvd4L9nigmzb2llrZgIVXCPzl22BDUyAmMY
	 BBCYQ4gHnz+VQ==
Date: Thu, 24 Sep 2026 10:31:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Vishal Moola <vishal.moola@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org, 
	linux-mm@kvack.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: don't schedule deferred kernel page table freeing
 while booting
Message-ID: <arTtl-7Nl5Ie0SEs@gremlin>
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

I know I said go ahead so it's my fault not yours, but in general please don't
respin so fast :P

I made a suggestion on the other thread which this has now raced. See below!

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
>  }
>  #endif
> --
> 2.55.0
>

Maybe we want to ensure the drain? Like below:

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index f3754cefb19e..67f286169632 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -457,12 +457,29 @@ static void kernel_pgtable_work_func(struct work_struct *work)
 		__pagetable_free(pt);
 }

+static void schedule_kernel_pgtable_free(void)
+{
+	schedule_work(&kernel_pgtable_work.work);
+}
+
 void pagetable_free_kernel(struct ptdesc *pt)
 {
 	spin_lock(&kernel_pgtable_work.lock);
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);

-	schedule_work(&kernel_pgtable_work.work);
+	/* No workqueues exist yet. */
+	if (system_state != SYSTEM_BOOTING)
+		schedule_kernel_pgtable_free();
 }
+
+static int kernel_pgtable_drain_early(void)
+{
+	/* Drain any early kernel page table frees. */
+	schedule_kernel_pgtable_free();
+	return 0;
+}
+
+core_initcall(kernel_pgtable_drain_early);
+
 #endif

--
Cheers, Lorenzo
