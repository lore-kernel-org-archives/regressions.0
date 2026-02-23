Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5D35CB67
	for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845173; cv=none; b=DskvY2x3+McGwGQ4lsKhDUIJB+WIP083FLJIzeZvYVMRdkd3oFnCSlinsHQVVZEG41uk2TgQ+vyFN7MIDxI2PQyJPNeB8NUiuTL52wY4PmHACtXHiuqDJ7MBSdabKoyZttRP5HMycghBPuHLLwwHND+iU3hKJFFG01QYLo0jQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845173; c=relaxed/simple;
	bh=0BfjSWGOzFBxkTvIMw0pWmUuVc4MaBwIhiGlL8FX7aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdCjaj8MnDbqFeGG2P1bwMglLaGj9Hf/A5yI89zoW57s9m+Y/O0aDqzKwyCLkH0nMVG9VKwNbGakzI2CVDCzNdqWi9dS3/xE5JBhzI2VFu1OGVfRvq7B7k7DkGVfcCWA6PRalcqnGasHXZQJmaBAjnzmHSFxUvB23emy0p+9yZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1pD4T3Z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1pD4T3Z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so24820265e9.0
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845170; x=1772449970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6n+oxOREuT+ZoDytgRh/Y9obuCsnXSbm2faHqHT5nEs=;
        b=I1pD4T3Z6UzUWTshp/vvbC5+j3RK9cO61xo6G7lW/a/aafoK6kenVYI57JPbTWPzwz
         3qNWCWMXHtajvoyR4IRbuM2mCoTm0YahghURld+GPm+NhBn1yksPBfQ6FPPrchmRXi+b
         DSoEySIWS3syQChTOUlxGHQbA89DrZOi7PHHjXvB6/vquynCDJ9TI/aUJuVHmQQMvQi6
         6w4S0XkmGBUxBMgepWgJVengelCA4UCWSuh/V9KG62NDSHKIGDDBqI6fQcyHJ05ot5or
         ioIiIuz8yAVZlWskHKdhI9pS6+29+RR60kGUw0Tz7sxVGSq279Y4DQUSgZlWxzVSaGUM
         y/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845170; x=1772449970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n+oxOREuT+ZoDytgRh/Y9obuCsnXSbm2faHqHT5nEs=;
        b=jm59Jmb6drXEp/UULFuUOxYSRCqmKAwRI4PuKp0txLk6lCLOxBQDZ0d2JZ9lES1VKx
         3nnojbKm8QhsBmbpknMx7pTVxRxm9aAXWXabr+dku6jag99lmnIYbcbbm9mZNQUHzdm2
         pojkogyl4G/3aJ+YRi3VmgZvaKRd3zQ2F8HWNtkUD4Au+PMw0iVFZuOt1qUOXJQCc7bc
         UJ5U3QipLRZfK5Eei09wVN2yJk4EpUhBjUwAvRhSNgnERaUqAVxJI6ISkt+89AaGlsDQ
         3t9lvv1C+Ezuf5risVcOa8CTQHFyo6ZCrm1Xcot5WlqMUj773lcCRSiSOVAFYZAl2FbW
         l2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyFWsomjejFqmQsSZ2rqbpdezEdsmSX5pmgL97zXXjrnGumjce33+/24bgbwvDBpCBVyW6vJIGpbwHnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz+xQtGK84JCGvn1xfzTfLuSaBmtAYyxj5IR3e0370D+Cbcazl
	BhkkEBT20Icavfq0nLJOtw2ycIIZwzJoHmvGfl3hSX+pXNCsZ0ThMrdM
X-Gm-Gg: AZuq6aJYPy+s3X7jY7SfvGIhWyUOfsND4n6N3ltjzYdayIV4jdOcNH00W95uKq6UVBB
	hbce7lmfKupvkxVaPFLOBuGJyiYhrIlonA0VADTJgikO+EHfV8U/0ALBm8qzCed+TPCsCVW2qOq
	7PTvH/o0OId5xKn1mUaBD72e9U3kT/R0+A0vkMnsDMhLDDYa2l7bn82BZlDMo1W1TmjpdFYN4Xu
	Eb6STHurRBFtVGcK73d4t8AL946TJ4OqTQX71EXum67mL+BZpfQuCphafgNTNrOoa0YOMALlXYA
	Uet66tJdHiFgO5HZIRMbDmNhd+OCmE7FpNe3KXD1Fw+C3W4mju58ED4j70ii0g0jfY0yIEBdBKs
	p6bJCDTc6mRFjrv9/cSdizkxN4lXJyTFrng37rN0YjU5ijzwxK6BeJZekMWK7+CsCW2bJ5jfMHF
	CUmskzlFNDJvxTNPARMl9uFcvdAOnR3RE=
X-Received: by 2002:a05:600c:8b71:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-483a95c63ddmr134839155e9.13.1771845169900;
        Mon, 23 Feb 2026 03:12:49 -0800 (PST)
Received: from debian.local ([90.243.35.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm271733245e9.15.2026.02.23.03.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:12:49 -0800 (PST)
Date: Mon, 23 Feb 2026 11:12:47 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: vbabka@suse.cz, surenb@google.com, hao.li@linux.dev, leitao@debian.org,
	Liam.Howlett@oracle.com, zhao1.liu@intel.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] kswapd0: page allocation failure (bisected to
 "slab: add sheaves to most caches")
Message-ID: <aZw2LyOjxMc-c3dl@debian.local>
References: <aZt2-oS9lkmwT7Ch@debian.local>
 <aZwSreGj9-HHdD-j@hyeyoo>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZwSreGj9-HHdD-j@hyeyoo>

On Mon, Feb 23, 2026 at 05:41:17PM +0900, Harry Yoo wrote:
> On Sun, Feb 22, 2026 at 09:36:58PM +0000, Chris Bainbridge wrote:
> > Hi,
> > 
> > The latest mainline kernel (v6.19-11831-ga95f71ad3e2e) has page
> > allocation failures when doing things like compiling a kernel. I can
> > also reproduce this with a stress test like
> > `stress-ng --vm 2 --vm-bytes 110% --verify -v`
> 
> Hi, thanks for the report!
> 
> > [  104.032925] kswapd0: page allocation failure: order:0, mode:0xc0c40(GFP_NOFS|__GFP_COMP|__GFP_NOMEMALLOC), nodemask=(null),cpuset=/,mems_allowed=0
> > [  104.033307] CPU: 4 UID: 0 PID: 156 Comm: kswapd0 Not tainted 6.19.0-rc5-00027-g40fd0acc45d0 #435 PREEMPT(voluntary) 
> > [  104.033312] Hardware name: HP HP Pavilion Aero Laptop 13-be0xxx/8916, BIOS F.17 12/18/2024
> > [  104.033314] Call Trace:
> > [  104.033316]  <TASK>
> > [  104.033319]  dump_stack_lvl+0x6a/0x90
> > [  104.033328]  warn_alloc.cold+0x95/0x1af
> > [  104.033334]  ? zone_watermark_ok+0x80/0x80
> > [  104.033350]  __alloc_frozen_pages_noprof+0xec3/0x2470
> > [  104.033353]  ? __lock_acquire+0x489/0x2600
> > [  104.033359]  ? stack_access_ok+0x1c0/0x1c0
> > [  104.033367]  ? warn_alloc+0x1d0/0x1d0
> > [  104.033371]  ? __lock_acquire+0x489/0x2600
> > [  104.033375]  ? _raw_spin_unlock_irqrestore+0x48/0x60
> > [  104.033379]  ? _raw_spin_unlock_irqrestore+0x48/0x60
> > [  104.033382]  ? lockdep_hardirqs_on+0x78/0x100
> > [  104.033394]  allocate_slab+0x2b7/0x510
> > [  104.033399]  refill_objects+0x25d/0x380
> > [  104.033407]  __pcs_replace_empty_main+0x193/0x5f0
> > [  104.033412]  kmem_cache_alloc_noprof+0x5b6/0x6f0
> > [  104.033415]  ? alloc_extent_state+0x1b/0x210 [btrfs]
> > [  104.033479]  alloc_extent_state+0x1b/0x210 [btrfs]
> > [  104.033527]  btrfs_clear_extent_bit_changeset+0x2be/0x9c0 [btrfs]
> 
> Hmm while bisect points out the first bad commit is
> commit e47c897a2949 ("slab: add sheaves to most caches"),
> 
> I think the caller is supposed to specify __GFP_NOWARN if it doesn't
> care about allocation failure?
> 
> btrfs_clear_extent_bit_changeset() says:
> >         if (!prealloc) {
> >                 /*
> >                  * Don't care for allocation failure here because we might end
> >                  * up not needing the pre-allocated extent state at all, which
> >                  * is the case if we only have in the tree extent states that 
> >                  * cover our input range and don't cover too any other range.
> >                  * If we end up needing a new extent state we allocate it later.
> >                  */
> >                 prealloc = alloc_extent_state(mask);
> >         }
> 
> Oh wait, I see what's going on. bisection pointed out the commit
> because slab tries to refill sheaves with __GFP_NOMEMALLOC (and then
> falls back to slowpath if it fails).
> 
> Since failing to refill sheaves doesn't mean the allocation will fail,
> it should specify __GFP_NOWARN with __GFP_NOMEMALLOC as long as there's
> fallback method.
> 
> But for __prefill_sheaf_pfmemalloc(), it should specify __GPF_NOWARN on
> the first attempt only when gfp_pfmemalloc_allowed() returns true.

Is this fix sufficient to do the right thing? I tested it, and it does
appear to prevent logging of the allocation failures for my test case.

diff --git a/fs/btrfs/extent-io-tree.c b/fs/btrfs/extent-io-tree.c
index d0dd50f7d279..d2e1083848e8 100644
--- a/fs/btrfs/extent-io-tree.c
+++ b/fs/btrfs/extent-io-tree.c
@@ -641,7 +641,7 @@ int btrfs_clear_extent_bit_changeset(struct extent_io_tree *tree, u64 start, u64
 		 * cover our input range and don't cover too any other range.
 		 * If we end up needing a new extent state we allocate it later.
 		 */
-		prealloc = alloc_extent_state(mask);
+		prealloc = alloc_extent_state(mask | __GFP_NOWARN);
 	}
 
 	spin_lock(&tree->lock);
