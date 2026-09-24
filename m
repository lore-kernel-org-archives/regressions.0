Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84C41DEE7;
	Thu, 24 Sep 2026 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233683; cv=none; b=K3kR9qOCG3S9bFbqcIQoCzixvxSEoh1rJE4QZ91IB+I4Yt+rAwgjl3rZDAfj7mvuig3mmMkE4HSKVOu4mkk2zfUGuRLG+sl5Ta77UJCFMP25/mG0YjZep2Z3INiBUxGPF64Pk130aKJOV0C/ubuac8F3VpvnGMiHUg4zYZxwXBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233683; c=relaxed/simple;
	bh=Icj/hgctX9XKLRGJgAUX+/cnp4d0vWoBSdT27qFinws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXME208jXcrLuo6EGkx5UlzoCOpPFB+eAONaiAq51QibCR+MdH3d/Q61/JYN4pOAB/hka/hud+p8k+bGRPJzd4Yt0XqjFVcpOuwtRHKyC1VT+Kn7daA6WPapHJ8J2MI84EKRg8iIk5yHdbc3z+It2u+U5xzm9vh6rmHjO5jN4VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQJbdOLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQJbdOLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C128A1F000FF;
	Thu, 24 Sep 2026 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790233675;
	bh=mEMedDFi9mFkp6jCqF0VrbvDKNuIkj1/7PXdOKCq+kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KQJbdOLAdAoeUmQNZYOWsQ+KwIVQmJINzs5RxLAPvqdG8+KBfOeVGO8ywz2N9NiDK
	 xwiiDNSHGv/1iLZNFDDuOyrlVMeHRxjM0ppRkOf3GTYhRiIPhq4As0s1tgvNcJQz9z
	 0ijoG8Xw3nf4hs4eZQ4hCBMBgwvmw0L/g9ZWWZpoNlLCYVOKPW6lHZ7G9Y47Tk6VpN
	 qPeyAk+4a22CaO2FuE7Jeynwu99I5ZyvbEqc4l6srO7RdlFq/wGeW8EU9Rw04hfEPB
	 PQmNs/ZdZ5ahp839B/m4yzyQgTiUWhxr5JRnXBVeyUnxG2dClGLnqyJ1m1/jFe2vss
	 VlPOQIS/zdvtQ==
Message-ID: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
Date: Thu, 24 Sep 2026 09:07:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: don't defer freeing kernel page tables while booting
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Vishal Moola <vishal.moola@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>,
 x86@kernel.org, linux-mm@kvack.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260924064321.23787-1-mikhail.v.gavrilov@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260924064321.23787-1-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 08:43, Mikhail Gavrilov wrote:
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
> system_percpu_wq - still NULL at that point.
> 
> The deferral exists so that IOMMUs using SVA can have their paging
> structure caches flushed before a kernel page table is freed.  While
> system_state is still SYSTEM_BOOTING only the boot CPU runs and no IOMMU
> has been initialised yet (on x86 that happens from pci_iommu_init(), a
> rootfs_initcall), so there is nothing to flush.  Free the table directly
> in that case.
> 
> Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
> #regzbot introduced: 9e4a3ec3411b
> 
> Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX, lockdep and KASAN
> enabled, booting with the command line above plus earlycon=efifb so
> that the oops is visible:
> 
>   7.3-rc4 (fe2ec83746e5)             panics as quoted
>   + revert of 9e4a3ec3411b           boots
>   + this patch, 9e4a3ec3411b kept    boots
> 
> With this patch the boot-time tracer works as intended and records
> pud_free_pmd_page() being called from vmap_p4d_range() during boot.
> All three kernels also carry my pud_free_pmd_page() v2 patch and
> unrelated local changes elsewhere (HID, sound/usb, Bluetooth, debugfs);
> none of them is on this path.
> 
> 9e4a3ec3411b is also in 7.2.7 and 6.18.53, together with the deferred
> pagetable_free_kernel(); I have not tried those.
> 
>  mm/pgtable-generic.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index b91b1a98029c..2d9b4ba33b46 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -440,6 +440,17 @@ static void kernel_pgtable_work_func(struct work_struct *work)
>  
>  void pagetable_free_kernel(struct ptdesc *pt)
>  {
> +	/*
> +	 * While the system is still booting only the boot CPU runs and no
> +	 * IOMMU has been set up, so nothing can be caching this table and
> +	 * there is nothing to flush.  The workqueue this defers to may not
> +	 * exist yet either.
> +	 */
> +	if (system_state == SYSTEM_BOOTING) {
> +		__pagetable_free(pt);
> +		return;
> +	}
> +
>  	spin_lock(&kernel_pgtable_work.lock);
>  	list_add(&pt->pt_list, &kernel_pgtable_work.list);
>  	spin_unlock(&kernel_pgtable_work.lock);

Should we instead simply skip the

	schedule_work(&kernel_pgtable_work.work);

and rely on anybody freeing stuff later to just free that one alongside?

That avoids throwing in more freeing handling.

-- 
Cheers,

David
