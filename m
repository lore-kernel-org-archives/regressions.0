Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF39426D23;
	Fri,  6 Feb 2026 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770404936; cv=none; b=jlBXrGpRxHAa2QgFbcX+UOlwM1NsthvCBJ7BqyCf7uu9hnp1o6f7iR2YoBG1qptM/fOPPGlh/GPeASSgK4TKJHLmfh5oo4WId4sz52PLyMbQzr4fDVncU50JYflK2GN3tEH/NlV9yG5oSnQTvbVJ8kB+pjtgq3ofWOuwo0Q7/hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770404936; c=relaxed/simple;
	bh=YpOveONxZp/efJzEpXQeZnbAG0Zs2Nt4ebm4l9bBT6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnZQGrIfw05UdJWWzX6XKayj9Mvumx9YzCeK4fsgcumfZM/8id1zGbDOuiKdUocEZBsdlzDtkJlAocC0u3VYddrrESmuy4GqmEjJBGzk3m2TOENY2lw5EPuM12JhD4yJxvi7xIFmK6W25Lp76pX/Y8qtoX73lZQl1xeRo6FqiQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScxwxE0k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScxwxE0k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6EDC116C6;
	Fri,  6 Feb 2026 19:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770404935;
	bh=YpOveONxZp/efJzEpXQeZnbAG0Zs2Nt4ebm4l9bBT6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ScxwxE0kYO7ObhdFJ9gogOQxe5EsW9++mUm4FdkZt1oLCuvaYjYvebqEDR+JEX4u2
	 HGF1u8CkP4SWYuAfsGSq/k/z0riT6xS3nNq21YAgEQzOuPSX4z8DRJC3mduo6Mhxgd
	 GktapGUhdRHW1DMLxsb1A5XLE4KEJLCgJpN3z8q8taw6Mk8Oe84WZ8jLDllFKZUXY7
	 ma771F5dZbNXND9fbjvbcoE//6huRJU45yiZenVWzuqgoFLLGIQXkcDlKVg4SmEe75
	 dQQSrqyw8KxJZzyZZGJHvnRLqI+yE9weq0g7/upxEwawKCBdg6yPyQRCqBcLLbuKTj
	 xLPwS6A0PpMvw==
Date: Fri, 6 Feb 2026 11:08:53 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@glx-um.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Justin Forbes <jforbes@fedoraproject.org>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
Message-ID: <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
 <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx>
 <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>

On Fri, Feb 06, 2026 at 09:19:05AM -0800, Linus Torvalds wrote:
> ,
> 
> On Fri, 6 Feb 2026 at 08:32, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > So a spot fix would need to be something like so:
> 
> So from what I can tell, this was never a kernel bug to begin with,
> and the actual bug is in QEMU. And the kernel change that exposes this
> is old, and apparently the main issue is that it also then depends on
> bad luck with a compiler that generates particular code that then
> shows the QEMU bug.
> 
> So what I'd suggest we do is to do the *minimal* workaround for the
> specific case of the broken QEMU mouse emulation, and not make the
> already ugly vmware code even worse like your patch.
> 
> And the minimal workaround is apparently just the
> vmmouse_report_events() oneliner that Alexey Makhalov suggested.

So even if we want to use the strategy of only protecting against those
compiler optimizations which we've seen with our own eyes, that
one-liner still isn't enough...

Looking at the binary, in addition to that vmware_hypercall4.constprop.4
keeping RDI/RSI live across the hypercall, there's a
vmware_hypercall3.constprop.0 doing the exact same thing:

0000000000000130 <vmware_hypercall3.constprop.0>:
	...
	179:	ed                   	in     (%dx),%eax
	17a:	89 1f                	mov    %ebx,(%rdi)
	17c:	89 0e                	mov    %ecx,(%rsi)
	17e:	5b                   	pop    %rbx
	17f:	e9 00 00 00 00       	jmp    184 <vmware_hypercall3.constprop.0+0x54>	180: R_X86_64_PLT32	__x86_return_thunk-0x4

So that's a 2nd hypercall site we'd need to fix.

BTW, I suspect the non-inline + constprop madness is caused by the use
of CONFIG_DEBUG_SECTION_MISMATCH which adds
-fno-inline-functions-called-once.  I would love to get rid of that
config option, it creates a lot of grief for me personally.

Anyway, how about just adding RDI/RSI to the clobbers list for those two
hypercalls?  It shouldn't have much of an impact on other sites anyway,
it should be rare for the compiler to want to keep di/si live in
general.

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index c9cf43d5ef23..4220dae14a2d 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -140,7 +140,7 @@ unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 		  "b" (in1),
 		  "c" (cmd),
 		  "d" (0)
-		: "cc", "memory");
+		: "di", "si", "cc", "memory");
 	return out0;
 }
 
@@ -165,7 +165,7 @@ unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 		  "b" (in1),
 		  "c" (cmd),
 		  "d" (0)
-		: "cc", "memory");
+		: "di", "si", "cc", "memory");
 	return out0;
 }
 
