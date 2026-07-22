Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF9C34BA42
	for <regressions@lists.linux.dev>; Wed, 22 Jul 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728479; cv=none; b=C5L7JkA2pBnvSvghH3LXwcI2mlOAhpTbPLe8vO7HMcE+MrLeBNmhrDgsVvu5ZDQS85/PPqzmzMBTsyK84ZvKlMMBbheDq2TZpZyz9Tjfri92FwnOJlxNaNEm2mFFjp48EYF8EyHkq22kefU7u/PyGQhVVF4uPqSZl18SANDvelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728479; c=relaxed/simple;
	bh=kRlLh6vb8jx0/62iQUQi3I2/CfPEqiB5RJ3y9DVFQ5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcNXcDwPFf+7eDj9eUtvQxyMYlQMfyuOlHAzR3HQ/WZAx/8+Utig8XUkksiU6aUWNC+kMhyVTO81NhycgEGCpxp4/gKoRTLJ+kHVvm5xENPVmt00oJJmuyxAvNxjPx2AZkwgjOv0ss6ScfmzmxrCWeWSsg622S+CK2oSMxC/YfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=arvW5y/g; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="arvW5y/g"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D06DA1595;
	Wed, 22 Jul 2026 06:54:32 -0700 (PDT)
Received: from [10.164.19.44] (unknown [10.164.19.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251033F59E;
	Wed, 22 Jul 2026 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784728476; bh=kRlLh6vb8jx0/62iQUQi3I2/CfPEqiB5RJ3y9DVFQ5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=arvW5y/gsXMxgbhxLXOryhnBWf8VH6epu8Og1Rh33qwarIKtzEeiaQSfdtndZ8mVm
	 yzen6khX4L3taHk3yud5zzvdHKeooFS30u1QNfZPFXb21I2Kdec/GrSiDuM/DejPtc
	 9mu87ra/NbMsv7cZ9tIycWEXfr/wJS2J39n0JJyg=
Message-ID: <03f91210-e0b7-43b9-9a95-755b986b3c40@arm.com>
Date: Wed, 22 Jul 2026 19:24:31 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mm/mprotect: shared-dirty base-page toggle slower
 since v6.17
To: Chengfeng Lin <chengfenglin@stu.xmu.edu.cn>
Cc: Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <7c9eeb21.1c04f.19efaacbb2f.Coremail.chengfenglin@stu.xmu.edu.cn>
 <433d619a.1e8a6.19f1d4d1be6.Coremail.chengfenglin@stu.xmu.edu.cn>
 <6c8d9b6c.24a8b.19f84afccdd.Coremail.chengfenglin@stu.xmu.edu.cn>
 <dc402537-1527-4433-839e-960b6eb32bc4@arm.com>
 <4dceab6f.24e3b.19f8966e8ed.Coremail.chengfenglin@stu.xmu.edu.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4dceab6f.24e3b.19f8966e8ed.Coremail.chengfenglin@stu.xmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/07/26 4:07 pm, Chengfeng Lin wrote:
> Hi,
> 
> Sorry that my earlier message was difficult to follow.
> 
> The previous exact parent/child test showed that cac1db8c3aad slowed this
> workload by 39.77%. To answer your question directly: no. In a separate
> matched v7.1.3 patch-on/patch-off test, Pedro's full v3 series was 6.20%
> slower than the no-v3 controls, so it did not reduce the slowdown in this
> workload.
> 
> I also checked for an update. The latest public revision I found is still v3,
> and it is already included in Linux v7.1.3.
> 
> To isolate the series, I used the same v7.1.3 source for both kernels. The
> no-v3 kernel replaces only mm/mprotect.c with the exact pre-series file at
> 19999e479c2a. The full-v3 kernel is unmodified v7.1.3 and matches the series
> tip at 89e613bc0b2d. The normalized configs and all other build conditions
> were the same.
> 
> I used a fresh boot for every point:
> 
>   point       mean ns/page
>   no-v3 A          55.333
>   full v3          58.200
>   no-v3 B          54.267
> 
> The no-v3 midpoint was 54.800 ns/page. Full v3 was 6.20% slower than that
> midpoint. The two controls drifted by -1.93%. Dropping the first measured run
> from every point left the v3 delta at +6.18%.
> 
> This was the same narrow standalone workload: a 64 MiB shared anonymous
> mapping, dirty 4 KiB pages, and repeated full-range read-only, restore, and
> write-touch cycles. Each point had 3 warm-up processes and 15 measured
> processes; each measured process ran 1,000 cycles. The benchmark was pinned to
> one P-core with Turbo disabled and preempt=none.
> 
> All 45 measured processes passed the returned-value checks and stayed on 4 KiB
> pages with no THP. The protect and restore phases were each about 23 ns/page
> with v3 and 21 ns/page without v3. The later write-touch phase was unchanged.
> 
> So, for this specific microbenchmark on this machine, Pedro v3 did not reduce
> the slowdown. It produced a small slowdown instead. I am not making a claim
> about other mprotect patterns or application-level performance. My earlier
> QEMU result that suggested a partial improvement should not be used.

I don't see why Pedro's patches should cause a slowdown. The only diff I can think
of is the if (likely(nr_ptes == 1)) check.

But again, we have had these microbench regression discussions before. I think it
is clear by now that vm_normal_folio() is bad on some systems. Best we can do
here IMO is avoid that by doing something like

https://lore.kernel.org/all/20250506050056.59250-3-dev.jain@arm.com/

> 
> Thanks,
> Chengfeng
> 

