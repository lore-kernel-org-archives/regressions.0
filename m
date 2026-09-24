Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1BA407CF1;
	Thu, 24 Sep 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240289; cv=none; b=PPRhCYcRH5hK0/wzoIu+8nL3x+II27HOC81C/QCSHJL7xxZ0uGbwiDSDS2wEVBj1rZaNBuN9E+f72+GV/UXShFuX8dF3ooU+YG8NCNO3BgL7kTdu7TE9ywkzMans1q+nlH713ukliEdzhm+KCqyJMOUTPy1zC+Hof9rl/7xH2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240289; c=relaxed/simple;
	bh=BSM1HUuT0wZmE49/V56smkzHjMPGEx0OE5xIFq176HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Px6BaqgB3HpmNG0jQwgqZZIwNDOY+YBUeCmltJWA/My/R9x6YjkAutn4GjRUoXj4yL7VbS3G3N1bea/e+xKFFkqxdzqe0uZmodTSNMgaDW9oJjLtPNhPhJTPsmby30bQq5YgxY6sbKTXSrt6bB8SNYbS5bvKiyXy+ToeKMir7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0GBvYm+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0GBvYm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620BA1F000FF;
	Thu, 24 Sep 2026 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240284;
	bh=W7SDwsWf5CWIVcYPIFwqJtjthSxCCaBZbCFYwnYVzTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B0GBvYm+aSiuZ8w1vI3FHuWlJebwgQFrx8W+AI1XAdjLvlLa8uZ47QEGL49eH4KZl
	 2oMDPAVHkc1hwghlVCYZjt/lB3fYe7Aff7J46mdO+N8CnFJxv3R7IPmCV5Re9VR8+a
	 hkOPinqVOHapVhnHbOL/JvlGRKwMYUuZw5DmdhF36aDdnZdq8sFkZDW8Tg3iGJAzTr
	 0WVy7VvQUl5DTOrIySgS+OXB89YeHEn5M14MeaTvp+Ko4o1wYtTmUGwhOPtNuLNP19
	 lv6f7vaE/AkNJIHDrh+3Ekwvsm/IkUaKM6L1hyCJ71gA5hhQ9Nu+d7EACBxz0NZlpY
	 2fRa7pTx7XZAw==
Date: Thu, 24 Sep 2026 09:57:57 +0100
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
Message-ID: <arTl5Cc1B-2_BoHP@gremlin>
References: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
 <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>
 <65b94694-d503-46c5-9f13-f0f7f8bba8d8@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65b94694-d503-46c5-9f13-f0f7f8bba8d8@kernel.org>

On Thu, Sep 24, 2026 at 09:31:40AM +0200, David Hildenbrand (Arm) wrote:
> On 9/24/26 09:28, Mikhail Gavrilov wrote:
> > On 9/24/26 09:07, David Hildenbrand (Arm) wrote:
> >> Should we instead simply skip the
> >>
> >> 	schedule_work(&kernel_pgtable_work.work);
> >>
> >> and rely on anybody freeing stuff later to just free that one alongside?
> >>
> >> That avoids throwing in more freeing handling.
> >
> > Yes, that is simpler, and the early table then goes through the same
> > IOMMU flush as every other one, so there is no need to reason about
> > what an IOMMU can see during boot.  The only cost is that it waits on
> > the list until the next kernel page table is freed after boot.
>
> If we're worried about that actually causing problems we could drain the list at
> a later part during the boot stage. I'd suspect we free something else later
> already and simply drain the list ...

Yup agreed this is the best fix.

Please go ahead with that Mikhail.

I hate that the Fixes: is a patch that actually makes the CPA code do the right
thing rather than the fact this whole code path is possible this early, but it
is the correct one from the point of view of what exposes the bug.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
