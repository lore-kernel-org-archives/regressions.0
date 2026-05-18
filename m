Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3D36EAB9;
	Mon, 18 May 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118993; cv=none; b=q//00PzJlxMznNmnT7wK5Km3xRN8S98eGMtnvejnlji+hwFanPyU7WegdyRen7XTVhCv7VmZqAzHAgh/fkntNQhOdChQkGWvNq+5T1DDaCJ3lnTrmAvRHaXpkOVyeMipUQLeCGe++6ogd8Fiq9jo1iOdmn0O6MlrPChM9TSgQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118993; c=relaxed/simple;
	bh=GLQUQ2YMd7L4yqFJ4T6ArD6R0WK4BtbxD8q8KaJ2e0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEgxNSXH0rXfdfsFxB1znnUzyJoKufmIKkL0tK8viqxrdxLVYKRmpXY8yB6X0VHY5ijTc1P66z0TQhx0evWRdET8SG+SKeYkZyySwi0oDfudO3JhN4uDulAZ8p7JAfeGtqMECK30+Js7bSEU84LE+RQ0RD/a7aQTgni7FLXcPBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSK9GksY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSK9GksY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B29DC2BCB7;
	Mon, 18 May 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779118992;
	bh=GLQUQ2YMd7L4yqFJ4T6ArD6R0WK4BtbxD8q8KaJ2e0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSK9GksY2tgD856xhn4GI6sQ28Trphlm3aJkWES2dN8eEpUQDkO/sA3xGy8MUbOf1
	 OWSQ2jOV/ybtN58m3wIVgIlsjjEiSaiogharOUZnY0mz4caKtdladDUyait9yZoWZx
	 e6pwuLjOGBrmexzvl2qob+rJ6dALGxhpQwQ6Kv3rUXZfP1qpO6acrQku9XMZYAqjyh
	 sBSDfzKB/fiej39GUJDcfLQZi2DifNfNBou4xK+kvgZD3dGl165wNEvH9dDfyV/hC3
	 7HYb8GGUMMcaU7al1sAoPaYl7RJlxsO8NbfuFUJe3tzu2kezfuAzU8esa1bAWqxg/i
	 Ym5bC5LAfdOHg==
Date: Mon, 18 May 2026 16:43:10 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chengfeng Lin <23020251154299@stu.xmu.edu.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] mm: MADV_PAGEOUT THP/no-swap refault takes ~1.7x
 longer on v6.19 than v6.12
Message-ID: <agsy99AP2zixlGIi@lucifer>
References: <662955ba.f499.19e3b2cf478.Coremail.23020251154299@stu.xmu.edu.cn>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <662955ba.f499.19e3b2cf478.Coremail.23020251154299@stu.xmu.edu.cn>

-cc wrong email

One day I will get to stop nagging like this :) Or just ignore mails that go to
the wrong place.

Please use ljs@kernel.org. I switched over a while ago. I tend to mark kernel
mails that go to my work address read without reading them.

People regularly update their emails, so it's important to re-check them when
you send a new mail.

On Mon, May 18, 2026 at 09:01:02PM +0800, Chengfeng Lin wrote:
> Hi,
>
> I would like to report a userspace-visible mprotect() performance
> regression in a shared dirty PTE workload.
>
> The workload is intentionally narrow:
>
>   - anonymous shared 64 MiB mapping
>   - prefault before protection changes
>   - repeatedly toggle the whole range with mprotect(PROT_READ)
>   - restore with mprotect(PROT_READ | PROT_WRITE)
>   - write-touch after the protection cycle
>
> This is not meant as a generic mprotect() regression report. In
> particular, I am not claiming that the anon/THP mprotect paths regress.
> The current signal is scoped to the shared-dirty full-range PTE toggle
> path above.
>
> The current public evidence bundle is here:
>
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/e13469b/mprotect-shared-dirty-toggle
>
> The generated workload source used for auditing the workload semantics is
> here:
>
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/blob/e13469b/mprotect-shared-dirty-toggle/workload/mprotect_paths_storm.c
>
> The formal experiment profile is here:
>
>   https://github.com/lcf0399/linux-mm-regression-evidence-2026-05/tree/e13469b/mprotect-shared-dirty-toggle/experiments
>
> The formal timing runs compare v6.12.77 and v6.19.9 with similar kernel
> configuration, using QEMU direct boot. The formal performance runs were
> clean timing runs with coverage disabled. Coverage was collected
> separately and is not used for the timing numbers below.
>
> Lab environment:
>
>   host label: lcf
>   host kernel: Linux 6.14.0-37-generic x86_64
>   QEMU: qemu-system-x86_64 8.2.2
>   container/cgroup CPU set: 0,2,4,6,8,10,12,14
>   container/cgroup memory limit: 16106127360 bytes
>   guest memory: QEMU_MEM_MB=14336
>   guest CPUs: QEMU_SMP=1/2/4
>   repetitions: 9
>   version order: interleaved
>   performance coverage_enabled: false
>
> Primary result, cycle_ns_per_page, lower is better:
>
>   CPU   v6.12.77   v6.19.9   old-lower-vs-new   v6.19/v6.12   reliability
>     1      346.8     578.1        40.0%             1.67x      reliable
>     2      394.7     641.7        38.5%             1.63x      robust-only
>     4      381.1     624.8        39.0%             1.64x      partial, same direction
>
> The strongest current result is the 1CPU lab formal result. The 2CPU case
> is same-direction but robust-only in the framework classification. The
> 4CPU case is same-direction but partial because one QEMU run failed; the
> summary still has 8 successful runs for that CPU count.
>
> The current mechanism hypothesis is local to the shared-dirty PTE path.
> In v6.19, the measured hot path goes through the change_pte_range()
> batching machinery:
>
>   change_pte_range()
>     -> mprotect_folio_pte_batch()
>     -> modify_prot_start_ptes()
>     -> set_write_prot_commit_flush_ptes()
>     -> prot_commit_flush_ptes()
>
> For this shared-dirty workload, follow-up batch-probe attribution showed
> nr_ptes=1 in the measured path. The hypothesis is that the extra folio
> lookup, batch-size query, helper dispatch, and commit machinery are paid
> per 4 KiB PTE without effective batch-size amortization in this workload.
> This is mechanism interpretation, not a completed culprit-commit bisect.
>
> I have not bisected the exact culprit commit yet. Separate release-level
> sanity checks showed v6.18.19 already in the slow range, so the current
> best reporting range is:
>
> #regzbot introduced: v6.12..v6.18
>
> Please let me know if a standalone reproducer, a narrower bisect, or
> additional raw logs would be more useful.

Is this really a regression you're seeing in real worklaods or synthetic?

Thanks, Lorenzo
