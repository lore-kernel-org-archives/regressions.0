Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC7443B3EA;
	Thu, 24 Sep 2026 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235507; cv=none; b=UfUA7si2rtJnxBcnbJy5Yjzt7N0vb22QSVmIkZsZXaWUzuzVzKLiLs/a25q+iTXicbt7yqnriRAwqwbJfOupYy+W22htbvtVuSklvvRwjU36Ja+Oziwpcj6Yy+TypDSiaRClFvKfb96aBCx8x/RLnpWjluopIfLCnHcdtxsFZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235507; c=relaxed/simple;
	bh=p6CmvTxdRWJaR85/x76jMBw0rw5S+UxLU9OMQSWKTns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvwlAmclkbTBzLkQkacgcSmMWy1khKCLHoDVpXTzpiCHnrK9Ba5U84b5XQKzODUtbMQIa6GoObas2ohbE8tnz59g2XtgVMPGClQQ0/oOyCBA27FIZRZgydK7RYe3CzPavgB8WqMdGkVZhP6HyxRZ6bZDLie67mdK+HANuYX6xn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qrg79Odc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qrg79Odc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F4F1F000FF;
	Thu, 24 Sep 2026 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790235505;
	bh=syHUjeiyU6PAQHnSegmJU/Xn5fIogA7Zi7eAXuaZd0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qrg79OdcGPfgl7yoXl3ptDh3IKF+UVtWixl4nCRdJqTGzJZ+s1Q/oDpS1tvP5TbmU
	 NC/P3mvbNVR2+m1S835Pu6Brj4w2XDBtdsxcTRzLAGRNZ0ek1YUfRQay4KrGBYVwSP
	 c/1mkMp1GSHwPMMZCV7oAdOOPyVA9oyXrssm/mTg12mdArxvR3+Vl5KYhLriakA9mb
	 l/cnPm91MdLqYgXSXXTT03lz59Mp7424d4AfeLbVjh9oqanpGJ4zauMw5X2uFjzT2W
	 TR2o7CkHFMIgi7kDWyK7afhFP1BP82PNGmcb4v/0pzFiydme+Isv5TB4vSibkKCO01
	 1I4uk/WoQjk6w==
Date: Thu, 24 Sep 2026 08:38:18 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Vishal Moola <vishal.moola@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org, 
	linux-mm@kvack.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: don't defer freeing kernel page tables while booting
Message-ID: <arTTVY4bwYKzeWgb@gremlin>
References: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
 <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>

On Thu, Sep 24, 2026 at 12:28:19PM +0500, Mikhail Gavrilov wrote:
> On 9/24/26 09:07, David Hildenbrand (Arm) wrote:
> > Should we instead simply skip the
> >
> > 	schedule_work(&kernel_pgtable_work.work);
> >
> > and rely on anybody freeing stuff later to just free that one alongside?
> >
> > That avoids throwing in more freeing handling.
>
> Yes, that is simpler, and the early table then goes through the same
> IOMMU flush as every other one, so there is no need to reason about
> what an IOMMU can see during boot.  The only cost is that it waits on
> the list until the next kernel page table is freed after boot.
>
> I'll send a v2 that way once I have booted it here.

Please wait for me to have a look through this issue before respinning,
please.

--
Cheers, Lorenzo
