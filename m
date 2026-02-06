Received: from Tesla.tglx.de (Tesla.tglx.de [91.216.245.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BF2FB085
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373036; cv=none; b=duYGedKhKy1herVtNJf5TXzhLhS3iJgsp9IGPR7Rx0dYQqAI37lsvh1NUuQeGonNaj0BeWI/Z2oW4ftUCPIlGHSu/B1toEG59yH575xaM3vV4xpdbOcv9tPJhMX1I+WwI73MiKTQ4R51mKknmtpiAsjRgSsHrwGBOXdKH9RNPBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373036; c=relaxed/simple;
	bh=fD8vNpGaRW+jzPNQDWQ9Oa6JaYXWDCSniWKbEcrACXU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ukDCzjcFr0cf0UmoFhYJgK+p+J0EkIcXS15DY8GGHxNUama/KhTxnghNU+XzhAtIpNPx5fM7Jur+5qIMb/Xu16BQacQa6GDZp04KnvGpxtn9iDuprPNHQSmvUEE6y+keDTO8b0NXNddjwOMQA4td8Pmwf3vb9OVe0Khgc+MNFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glx-um.de; spf=pass smtp.mailfrom=glx-um.de; dkim=pass (2048-bit key) header.d=glx-um.de header.i=@glx-um.de header.b=kBw9j8Nk; dkim=permerror (0-bit key) header.d=glx-um.de header.i=@glx-um.de header.b=YcVRDvwz; arc=none smtp.client-ip=91.216.245.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glx-um.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glx-um.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=glx-um.de header.i=@glx-um.de header.b="kBw9j8Nk";
	dkim=permerror (0-bit key) header.d=glx-um.de header.i=@glx-um.de header.b="YcVRDvwz"
From: Thomas Gleixner <tglx@glx-um.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glx-um.de; s=2020;
	t=1770372443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EyxULlD3RzAd2aorqBTzDSH652HevjKyCfTrF3Pjrv0=;
	b=kBw9j8NkYD5bVn3xtGycRtyvpRyCkMX3/4Ro4MScQbNoplSDu0jCMikC9/uLp02D6hqAdn
	qITbdIaKsh1sNi4kAmrz9ao7JWQ3s2ClFTC8azItNtTagQIlM1Mnk1f92xBQosymfroi5C
	VptgzgkackLESZbDagK4GUI/WmLBtjAYewE28Uoy3Q+ylR7rXlTA7ZEo4oKZQoFfiClDA1
	LX6RhpzW924+QTFd+rAbAiNHiE4syl2+W8wEjK+OIYpfjly7qi9oxmI9MnxcIlPREJpwXO
	gHCj2/b7FPLqBfzI7AYvQPX4WC7nxIbXqlShn6xBqcYi1XwA3/lEwT7/EzcO8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=glx-um.de;
	s=2020e; t=1770372443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EyxULlD3RzAd2aorqBTzDSH652HevjKyCfTrF3Pjrv0=;
	b=YcVRDvwznigA78HFr46jc8nJh3ItC2iPYoQEqDkX+29W8VicXTPyiRocKULj9qjzVbuKYg
	5CWQxbDT5y1vlcCg==
To: Josh Poimboeuf <jpoimboe@kernel.org>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>, Linux
 kernel regressions list <regressions@lists.linux.dev>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
In-Reply-To: <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
Date: Fri, 06 Feb 2026 11:07:22 +0100
Message-ID: <87jywq18yt.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jan 30 2026 at 08:46, Josh Poimboeuf wrote:
> On Fri, Jan 30, 2026 at 05:24:02PM +0100, Thorsten Leemhuis wrote:
>> >>> Workarounding QEMU misbehavior from the kernel side by introducing less
>> >>> efficient asm inlines does not sound correct.
>> >>
>> >> Well, fixing bugs right where they are obviously is a good thing.
>> >>
>> >> But well, the problem according to the description quoted below was
>> >> exposed by a change that went into 6.19-rc1 -- which makes it a kernel
>> >> regression that must be fixed in the kernel (ideally before 6.19 is out).
>> >>
>> >> At least from my understanding of Linus point of view on situations like
>> >> that. Or am I mistaken for some reason?
>> >>
>> >> Or is this a case of "we for now assume this is such a corner case that
>> >> nobody else will hit; if we are wrong we'll reconsider".
>> > 
>> > Hm, yes, from that perspective I agree this is a kernel regression that
>> > needs fixed.  We still want Linux to work with older "broken" versions
>> > of qemu that clobber registers.
>> 
>> Josh, what's the status here? From here it looks like nothing happened
>> during the last week. Should we move on with the patch at the start of
>> this thread? Or is "widening the hypercall just for
>> VMWARE_CMD_ABSPOINTER_DATA" as suggested by Alexey elsewhere in this
>> thread a better fix? Or would temporarily reverting aca282ab7e75
>> ("x86/asm: Annotate special section entries") be the best move for now?
>
> I think we still need to go with the original patch at the start of this
> thread.  There's nothing preventing the compiler from doing similar
> optimizations for the other hypercalls.

That's correct, but not a problem as long as the hypercall does not
clobber registers beyond those which are in use for a particular
hypercall, no?

Unfortunately there is no formal specification of the hypercall
(backdoor) ABI available, which VMWare really should provide.

All what's available is the lazy 'fits all sizes' implementation in
open-vm-tools and the optimized kernel variant.

The latter makes it pretty obvious that at least the VMWare hypervisor
is handling it correctly. Otherwise we'd have seen reports by now.

As the issue seems to be restricted to an already identified Qemu bug,
it is overkill to penalize perfectly working systems by making all
hypercalls more expensive than necessary.

So unless there is a compelling argument why the existing hypercall
implementation is broken by design, the trivial one-line fix from Alexey
is addressing the actual root cause (it just needs a big fat comment)
and good enough to cure the regression, no?

Alternatively if you don't trust the QEMU/KVM emulation of the VMWare
backdoor at all then force switch it to the slow path and let VMWare
use the optimized inlines.

Thanks,

        tglx


