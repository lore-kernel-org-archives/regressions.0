Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAFF4B3374;
	Thu, 24 Sep 2026 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275930; cv=none; b=ZHXoXxWlEbozc57MSLb6X6w5Emcm7ZG3xYT3GMaVQgmKLTtZeVfiaSlcQA+kzcVClzZCNvg53VVZ3YbU1TPtMo309ZWgNmRb/NRV49YnrRdjySbgQ4rRMpgLdZFVtIIQkp9qEln2hRNb7gXdxNaCCCDT/aR587G1BqpOsgotI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275930; c=relaxed/simple;
	bh=KGfmmVISjnqynRFnA5Mg2/9tsz9MufvMZIoW6E8g71k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJ3FEOrjIZdNMfkeX99v3iAzIRtmuU+utLLYiGPU33juIaeZnRZOppggcj1XlKYKQq2VA4qVVGT9Qr8Xuk/vSyrJJDoDG5Z0ysHzSp0udg0oPOh1Y95Bpp2oDqk3GLMgMrT8jF8CXQXDoXltqRXw1IhhuMm6szOiXzDdI8/Cxo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWev+vg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWev+vg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D9F1F000FF;
	Thu, 24 Sep 2026 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790275917;
	bh=POlX+wONx1gCTE6Vq8TjSNhvRxCbSmUHbAHjJxxduJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gWev+vg3aOUbjtwtT3U2+C2VyN7eOtcfSBJs3s8YonBNI/+ZZ7xc1mf6k3ukzx0PH
	 Nb814Zy6qTVPFJpgHeTrhLWHbWJXlGYju1D2NrpmJPctR+FCbAJDal4gVTwnWwW2xI
	 /MFTvB3yrPrnMGBOFMN4O88mm0HjIb4cEaoDuj+UNT4EqcaMrg/MKzFJ8w/H78bLVm
	 fw9oOITb653B8XboMh1yPGGCS3ctD7pEsjXS9288YTGJolEMdjEWCUs65za7t3JhlA
	 tImKWiPpv8xP/PxYxxQlkz6Rpt893lRL4IjOhyugIHB+gp0xVjpO+tnRCf3dnynPqs
	 aEjtLEJvNH9Nw==
Message-ID: <16d3f4da-cc35-4d1a-99c2-270fad68728e@kernel.org>
Date: Thu, 24 Sep 2026 20:47:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: don't schedule deferred kernel page table freeing
 while booting
To: Dave Hansen <dave.hansen@intel.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
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
References: <20260924092307.22813-1-mikhail.v.gavrilov@gmail.com>
 <6a0c2fd9-b2e1-40d2-b7a1-ba93cb3c53a3@intel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <6a0c2fd9-b2e1-40d2-b7a1-ba93cb3c53a3@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 19:57, Dave Hansen wrote:
> On 9/24/26 02:23, Mikhail Gavrilov wrote:
>> Keep putting the table on the list, but don't schedule the work while
>> the system is still booting.  The next kernel page table freed after
>> boot schedules it, and the work then frees the early table too, after
>> the same IOMMU flush as any other.  If no kernel page table is freed
>> after boot, the ones freed during boot stay on the list.
> 
> There seems to be an awful lot of chit chat about how and when the
> boot-time tables might get freed. Like:
> 
>> So on this box the early tables wait until the first module is
>> loaded, and no separate drain is needed.
> Wouldn't a "separate drain" be all of 5 lines of code?
> 
> /* Take care of deferred freeing from boot: */
> static __init int free_boot_kernel_pgtables(void)
> {
> 	schedule_work(&kernel_pgtable_work.work);
> }
> late_initcall(free_boot_kernel_pgtables);
> 
> Then we don't have to reason about it at all.

Jup, that's what I hinted at in v1 and what Lorenzo replied to v2 as well.

(late_initcall vs. core_initcall)

-- 
Cheers,

David
