Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DC02192FA
	for <regressions@lists.linux.dev>; Wed, 22 Jul 2026 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699307; cv=none; b=IFCbz2p4H8Bqius13bdMZBB0IT+Sf3qBg+68JghFHtwR+4IrmnADpqHZS2bQ1fqkXZR/7Ptrk3jx9vmlbgeKmDCRLQK3imu3KLRoiyKF/Rm9BOSaWqloHNC7LO8Fe5FcF0mhAKlVLVVp5uyQUlCGCQzOjOnQDdtcB0HL4M0F7uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699307; c=relaxed/simple;
	bh=uuScNhPjiBHrt/gYpKP8cSsm20R1SEdWS+CAB7ZKWZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAfW8AeeelM7SFOpz55XmHI+PhjtWHJXPtsBRwQojAtg5z49J46gbDoh5v4sxKEe0JQU9OL8x91ucdjUZR990C8Sp+jT4em7yG/3X43UkX0KoaUDEeufFixLeR9tvmQRzBLlI6UwamFpQ2TCxwqCgVdZuYliwz9eqYkzxvTsblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jX4VlVwl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jX4VlVwl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00C961595;
	Tue, 21 Jul 2026 22:48:20 -0700 (PDT)
Received: from [10.164.19.44] (unknown [10.164.19.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79F383F66F;
	Tue, 21 Jul 2026 22:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784699304; bh=uuScNhPjiBHrt/gYpKP8cSsm20R1SEdWS+CAB7ZKWZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jX4VlVwlJYchtykzWqygqSFJTy82MBKeE6A7CogVBz3+8u/HKwi+5xt/7itTlr4h4
	 XoI7kHVSloRvXK7Rk+DpUSGj7RBDpiNoIwOsW9V0d6AfjoCNSpzSttZ4JdJK8Mnm/r
	 bvNWID8sF+Xfj4F0+cEJhCeD6FBx7oOL2FbDf8xQ=
Message-ID: <dc402537-1527-4433-839e-960b6eb32bc4@arm.com>
Date: Wed, 22 Jul 2026 11:18:18 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mm/mprotect: shared-dirty base-page toggle slower
 since v6.17
To: Chengfeng Lin <chengfenglin@stu.xmu.edu.cn>,
 Pedro Falcato <pfalcato@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <7c9eeb21.1c04f.19efaacbb2f.Coremail.chengfenglin@stu.xmu.edu.cn>
 <433d619a.1e8a6.19f1d4d1be6.Coremail.chengfenglin@stu.xmu.edu.cn>
 <6c8d9b6c.24a8b.19f84afccdd.Coremail.chengfenglin@stu.xmu.edu.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <6c8d9b6c.24a8b.19f84afccdd.Coremail.chengfenglin@stu.xmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21/07/26 6:09 pm, Chengfeng Lin wrote:
> Hi,
> 
> Just a gentle ping, with results from an exact commit-level check.
> 
> I tested cac1db8c3aad ("mm: optimize mprotect() by PTE batching")
> against its direct parent 45199f715b74. Each point used a fresh boot:
> 
>   45199f715b74 parent A -> cac1db8c3aad child ->
>   45199f715b74 parent B
> 
> I used the same narrow 64 MiB shared-dirty 4 KiB base-page toggle
> workload from the report. Each point had 3 warm-up processes and
> 15 measured processes. Each measured process ran 1,000 iterations.
> The primary result, iteration_ns_per_page (lower is better), was:
> 
>   point       mean ns/page    SD
>   parent A          38.133  0.743
>   child             53.533  0.516
>   parent B          38.467  0.640
> 
> The parent midpoint was 38.300 ns/page. The child was 39.77% slower,
> while parent B differed from parent A by only 0.87%. Dropping the first
> measured process from every point left a 39.53% child delta.
> 
> All 45 measured processes passed the semantic checks and used 4 KiB
> pages with no THP. The protect and restore components each increased
> from 13 ns/page in the parent controls to 20 ns/page in the child.
> The post-touch component stayed close to 12 ns/page.
> 
> The exact commit changes only mm/mprotect.c. Both kernels were built from
> the exact commits with the same normalized config, GCC 15.2.0, and Kbuild
> metadata. Every point used the same CPU settings and runtime preempt=none.
> 
> For this narrow workload, the exact parent/child result identifies
> cac1db8c3aad as the source of the measured slowdown. I am not claiming
> a generic mprotect() or application-level regression.
> 
> Evidence:
> 
>   https://github.com/lcf0399/linux-regression-evidence/tree/a3ae7bf1a50e4d88b572c6005a037679530c9b1f/mprotect-shared-dirty-toggle/bare-metal/20260721-cac1db8c3aad-exact-ab
> 
> #regzbot introduced: cac1db8c3aad97d6ffb56ced8868d6cbbbd2bfbe
> 
> If useful, I can still collect a perf profile of the child around
> change_pte_range().
> 

Sorry it is difficult for me to parse your report. So I didn't understand whether
Pedro's patches helped you or not?


> Thanks,
> Chengfeng

