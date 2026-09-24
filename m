Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB842A178;
	Thu, 24 Sep 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242179; cv=none; b=IAzPEonFYr4qpqooVZ83/WQDlsaYAaYUAiez/8BZgmzEjTawrPm3fY2zJyH4eOVpMTM/RsW8ufD4LCqcnd6udmyrgvBg4Gnc14rqsgLzLcvhCqi+XNk062gAIZncHl5pVLm3xupmj4HFvnSpDUVRvlXToT9549jPeXJO4mWJBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242179; c=relaxed/simple;
	bh=CvllqMS/s6S8skjjB6EJv5PXXeEUt9nfg3vLkSb42Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnKMEQgbuWmFiKKXf83UH+1UNbFV3WxrDk7WugeeiMesNR/5mwOWqETassaW7d2OORFY2ou6u6yLK8KNwdl97/J3S7ChJXbanlYY5dFR7JYbiXvUFTeZYkfxstqUKZJzpRn5TsCfVrDpWczf/cgx7gADqWCJozG1FH3z2zQgkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm+Fwa7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm+Fwa7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0B71F000FF;
	Thu, 24 Sep 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790242176;
	bh=ks0w1rHPiDMbqqG99fpjPwGGuK/nceQ8BW9BfzFj+fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lm+Fwa7rBukjDdQpzJDEQf80YAJJBMO9WT/Y84Z6zBCDoesGJ6lMYoymrAxpvRA/S
	 5qZID6fZ7FitJC+kX5Yc34J7MOKOWr96hil/eb6D9lTLKqrInm0p79sHbtkEB828/F
	 +t0EmQwm9flvR3SQlv69+Ls75YyUsCPM4rdoCQtuLS/2vMtiafQ1zltIhEjmQaFBlF
	 PssluRWFi1r0lqm4805PJMCr4h2mnQDIPNhHUascXIyWR7R5mdO0N6q4NAGoT/nKcT
	 /LQgTaA583h5uLTLE+y/lA89MG+G1gz9Vkxi9WBl2ocBXPekK5O7Ehciij3CxQUwUd
	 JdaGuBdtP21Bg==
Date: Thu, 24 Sep 2026 10:29:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Vishal Moola <vishal.moola@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org, 
	linux-mm@kvack.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: don't defer freeing kernel page tables while booting
Message-ID: <arTq_8FGRj7a85kw@gremlin>
References: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
 <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>
 <65b94694-d503-46c5-9f13-f0f7f8bba8d8@kernel.org>
 <arTl5Cc1B-2_BoHP@gremlin>
 <arTmLiTLnxhwohH1@gremlin>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arTmLiTLnxhwohH1@gremlin>

On Thu, Sep 24, 2026 at 09:59:36AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 24, 2026 at 09:57:57AM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 24, 2026 at 09:31:40AM +0200, David Hildenbrand (Arm) wrote:
> > > On 9/24/26 09:28, Mikhail Gavrilov wrote:
> > > > On 9/24/26 09:07, David Hildenbrand (Arm) wrote:
> > > >> Should we instead simply skip the
> > > >>
> > > >> 	schedule_work(&kernel_pgtable_work.work);
> > > >>
> > > >> and rely on anybody freeing stuff later to just free that one alongside?
> > > >>
> > > >> That avoids throwing in more freeing handling.
> > > >
> > > > Yes, that is simpler, and the early table then goes through the same
> > > > IOMMU flush as every other one, so there is no need to reason about
> > > > what an IOMMU can see during boot.  The only cost is that it waits on
> > > > the list until the next kernel page table is freed after boot.
> > >
> > > If we're worried about that actually causing problems we could drain the list at
> > > a later part during the boot stage. I'd suspect we free something else later
> > > already and simply drain the list ...
>
> And on that, yes, I don't think there's anything to worry about there.

Though maybe it's worth ensuring the drain? Shouldn't be hard, so like:

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
