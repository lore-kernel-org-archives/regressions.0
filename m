Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FF9439F88;
	Sun,  4 Oct 2026 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791121170; cv=none; b=PPOlHSUX1jZJICRh9vjxwLO87NilXlPyiAHaEMdZArK9b3+m4Pf9w7sm5oEevMUiaqVp0rznOVUJxy3i5FNG+JgS+MUlHil2dxN8sIBi8QSgxbtdiw5DfVYTh0DszTx+D7i/J5LxHmcXxgDMddU97Iw3RIgN1lgoOVAKOmLloNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791121170; c=relaxed/simple;
	bh=fsJv2wKQCM7SUQ97KSaro7Q/sQy03qbggMnYw5xwUh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L7CZpr4XUXEmp4wJ67sx+mIFKOMRTY5nAUZ8FYKX1w3X6Q/6LkbIBsBeYLJrYdvnL/zJAkLF0RneHQqE/iMTLp/j8RflbHRCdHqzS+Ag0+dJp6XFS/0axIe/7TVmLyvDsK1dg3xTo0mMUhM7r8TFMWzoMXc3U7vh+JNPbuENTyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcOs3bFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcOs3bFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5187D1F000FF;
	Sun,  4 Oct 2026 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791121169;
	bh=GsrDocJZdlQZzp7Ptz2pku4WR7O9fSJpN8UbwntIi3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZcOs3bFTNsWZukdiTl3x+IP7PA8A2DliLliY5QfGjDg27+Z2MCB18ILo6snmzo0/W
	 xo7htjt3Fp6s2EEBNA4CZgWLFFiRbq0z8Np7J7OeRAtXN2ddBRb/g5UHnWRAiyd805
	 Qc+IDCsNXXpmRjHj/+DV/Bccru5g270fmeKKDXoo1IHTf4efZ4MQeDrqM7sKEyhii3
	 53CjYfZTtvNNSMnt0k7ksGc3imoaU9C3dKqwB7fLCYpqzi5GE9gWTeB9zhvKQNp9me
	 7tEtoSweYdktzE7hX/E7FHLU55YjOMVMelRl9n/74VzKyJAr8fnxGRYaL696gVLa5a
	 BuW+FJdbiyOIA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jason Miu <jasonmiu@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Ran Xiaokai <ran.xiaokai@zte.com.cn>,  regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,  kexec@lists.infradead.org,
	linux-mm@kvack.org, =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?=
 <mclapinski@google.com>
Subject: Re: [BUG] KHO handover hangs when memmap reserves PMEM
In-Reply-To: <asE0R_f2r2TL-3Sy@px13> (Chris Bainbridge's message of "Sat, 3
	Oct 2026 18:02:27 +0100")
References: <asE0R_f2r2TL-3Sy@px13>
Date: Sun, 04 Oct 2026 15:39:25 +0200
Message-ID: <2vxzcxtplh4i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

On Sat, Oct 03 2026, Chris Bainbridge wrote:

> Hello,
>
> I am reporting a regression in KHO handover.
>
> In the most recent Ubuntu 26.10 beta mini-ISO releases (2026-09-18 onwards),
> the first kernel reserves RAM for the downloaded ISO with a memmap directive
> such as memmap=<size>!4G, then kexecs a second kernel. On affected kernels, the
> first kernel reaches "kexec_core: Starting new kernel", but the second kernel
> produces no further output and QEMU spins at 100% CPU. On unaffected kernels,
> the second kernel starts and finds /dev/pmem0 with the expected "Persistent
> Memory (legacy)" range in /proc/iomem.

Just to confirm, the first kernel boots without memmap= right?

If so, I have seen this before. Michal (+Cc) found this originally in
our downstream test suite.

I think the main problem is that the radix tree pages can be anywhere in
memory. So on the first kernel, they can land in an area that the second
kernel's memmap= reserves. So kho_memory_init() might end up using
memory that memmap= reserved. I'm not sure why exactly the next kernel
doesn't produce any output, but IIRC memmap= memory is not mapped to the
direct map, so accessing those pages likely causes a page fault.

It is not easy to fix. We would need to make memmap= aware of KHO and
skip the radix tree pages, but that is pretty complicated to do for
early boot code. And honestly, I don't think it is worth it either.

So I'd suggest you turn KHO off for the kexec that adds memmap= if you
can.

>
> A source bisect identified 3f2ad90060f6 ("kho: adopt radix tree for preserved
> memory tracking") as the first bad commit; reverting it at the bisected
> revision restored the handover. The regression appears related to KHO metadata
> being accessed after the receiving kernel's memmap directive changes how the
> metadata's physical range is mapped.
>
> #regzbot introduced: 3f2ad90060f6
>
> I have an AI-generated candidate fix that changes 22 files. I have not attached
> or published it: although the AI did extensive verification on both x64 and
> arm64, I cannot review or explain the complete change, so I am not submitting
> it as a fix. If one of you thinks an unreviewed candidate would be useful for
> further analysis, please let me know.

-- 
Regards,
Pratyush Yadav
