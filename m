Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339722EBBB9
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203051; cv=none; b=jIEkFz4xUb8l7xsG5BSIlm1eur2g1XYQArvjSAt1YutGISOCCSpCSViIhS0qFOAVpBGU88ALCapkdYeoPd/svn2z7zDOmOfLpJb2p/701UM18nHDsKLiA/hEnjYSEPxz98yymO637gktP6Z7RLf2Yq5zaN9eIiFxUIKgSiNycp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203051; c=relaxed/simple;
	bh=yP95nTGtvsy873nNSB+nfupYly/y1xNvRbmiSaWnyqE=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=eg8OhNhIYUePx79cFDrmmK1JP1KlT0nsLHfOKz/YcPiDKPGqJ+0c2s7uMfGOMSEatoYbXSKTjR4nq4VVwB+lTBBT3KrbyglI/a4Y/d6N2CfPu7aaKzGnLr77EioUQJ9qHNAT6q1civPuYN1QQEBCQo4BIDzukrySC6+xMoYWPac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4y7eRQD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4y7eRQD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so5384808a91.0
        for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203049; x=1788807849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaGTRAWSBUw2/SKz8a7uyMoVqzIL+CJjDVztLjnCEd4=;
        b=g4y7eRQDhiK1aaM7rBO3hFLKVlAt0KmahqQwdhqmz0JLZjTEn98uyqKG5xskCLKw7E
         18bFz7w16YCIwi+zOHHl0HvNbJsDmSRDAVTAWUr2ZRAdx2erz+MTuHFJ/WlRlrC+SEPJ
         uJntXCUaVzdAaozYDu3YoOC0DfbfjpCyNMj53pVi8tIJjeuQr9XOFWYEdlKYsLX1KCwQ
         QRxQm1YLPzxrGw/YqrYFfO1amxET0ExT8eJcLPIT33o3z4pkViYC3+jfX6zeCS8l20LI
         GGdWR/q2fSMw2sOpP6SLQ+cCOi/rCvQWVjJvX9JzcUdDdSoImSSLQFhNUjMZxlwPf1+F
         1dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203049; x=1788807849;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc:to
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaGTRAWSBUw2/SKz8a7uyMoVqzIL+CJjDVztLjnCEd4=;
        b=rsdx2DAgtoC7SWcmqF+c4farpIcRGa1eszF2vu1XLk+ZJsegi0KTTspTj5KghniQ9h
         CT6AthtzZwxAk78SGREvQkzJK9iBtjzDgIG51FPbTv9pgtKfjnlF9piLBzbAKxv1d2Ho
         oAtIHXd4HPm1QMpNkEU3W1rpJswbIEIT2KmQXBmg6d7YyZKV1Hxa1tHIxR4CclLl/TV/
         b+O5ODs0t13NXc5/8RO/V9xoJACPtq1mVzE0yOFWgOEMtAO0oGhmA1NPSsaUWXN1xYip
         WY/p4soPbnPkpi0NLfAbhMEzyO/Psw9ZFjfHUsl7oTuK+UpSM4fjPNz5KRupq8mTbfV6
         6SaA==
X-Forwarded-Encrypted: i=1; AKwUvBwe6De/DoHk3TnJOxQhOQM7V1fUIUKRpZvFzAfw/E2Hdlj0Vd1M5dukrLMS9lx/3Ybk+XbCRYIhONJY/w==@lists.linux.dev
X-Gm-Message-State: AFuF++kzVb9pexHboAczN/bhCIcHtvaN3aaKudHNxmRsjeFj6BX/LEsn
	9Qe04fW3C+Cn+TOv1ZDbWwjAtkt+KM5AW8Yd3FCbcTRyBwzchPNralu4
X-Gm-Gg: AYBFou3kGDGkVvY0MztHzbQjUEVawmOyUuu0oKvI9pm6H4JIWO8hNY6KnGX3kNC5gl5
	et3uyXtRJliYDcbqesExlYp9lSEPUJY0TgqtMqqFoI+IGfoCgNSm5TFC6pZyawHHd1Lx4MGSUvu
	2x4aEr8ABYcRwGXa3Yun2CJHI9dveQ6XrnRO4IKtTI1Ark64jIfY0sD079H+rm0pRgXdmnUIsyB
	wWyLHZ29XIkH/jEhXia7liaXO2beeKopItukMrIQcl5p0KIcUCSnH2ujZK54JGGN1vSg9LXi3hJ
	0/ERcJn8OkW8DoqHN+P7WUUA7WJj0IkURD4g+onp9jS3xWscX8ayzry5lVb4hYnbQq6WgIb20u/
	2iqWgqdGqmWo/G2npQQUoGZb3/Jlu3SOhImPMFD4PlI8MCnaQeJR/cbm6deiUBaTe6CkVh6S5xA
	xn2u7fJmnosLO3mhqrEZQKVXMryHAZ7FliGWb8+w7hyk5NDFfKfxDk/JpN9a356f63kj75yF+6U
	od/jsIhx4urOQKwvsMAQY5c
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr3102531a91.2.1788203049355;
        Mon, 31 Aug 2026 12:04:09 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm37141411eec.9.2026.08.31.12.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:04:08 -0700 (PDT)
Message-ID: <27f2418a-e54e-4af7-b554-c0d1fe18a4a9@gmail.com>
Date: Mon, 31 Aug 2026 12:04:08 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] sparc64: increase kernel thread stack size to 32K
Content-Language: en-US
References: <f3719bb0-e892-49cc-af82-79e2569a8a90@gmail.com>
To: Stian Halseth <stian@itx.no>, Andreas Larsson <andreas@gaisler.com>,
 davem@davemloft.net, sparclinux@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 David Laight <david.laight.linux@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, thuth@redhat.com,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 nroach44@nroach44.id.au
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <f3719bb0-e892-49cc-af82-79e2569a8a90@gmail.com>
X-Forwarded-Message-Id: <f3719bb0-e892-49cc-af82-79e2569a8a90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Stian,

**Revised for clarity.

Thanks for following up on this. As I mentioned to Andreas back in 
May/June 2026, the current combined stack usage is already very close to 
the 32K limit. If you need an immediate workaround, increasing the stack 
to 64K is probably the best option to provide enough headroom and avoid 
the stack overflow panics we are currently seeing.

While I haven't observed any panics with a 32K stack on kernel 7.1 so 
far, operating so close to the boundary is still a significant concern. 
It is worth noting that sparc64 definitely crashes with a 16K stack. 
Additionally, the Nvidia/Mellanox mlx5 driver allocates a large stack on 
sparc64, which pushes usage to the 32K boundary, and other drivers might 
do the same. Therefore, a 64K stack is far more ideal.

Regarding the kernel compilation, when I build the kernel with 
-fstack-usage to generate .su files on the 7.1 kernel, the static 
analysis shows stack frames for USB core functions. For example:

     hub_event: 2457 bytes (static)
     hub_activate: 1892 bytes (static)
     usb_control_msg: 1248 bytes (static)

However, my runtime stack tracing paints a dramatically different picture:

     STACKTRACE: hub_event():entry: 31856 bytes used
     STACKTRACE: hub_activate():entry: 31680 bytes used
     STACKTRACE: usb_control_msg():entry: 30768 bytes used

P.S. I haven't actually tested a 64K stack yet—I am offering this 
recommendation primarily based on how close the current usage is to the 
32K boundary.

Regards,
Tony

On 8/31/26 10:29 AM, Stian Halseth wrote:
> From: Tony Rodriguez<unixpro1970@gmail.com>
>
> Kernel stacks on sparc64 are 16K and this is no longer enough:
> several machines (SPARC T5-2 among them) panic early in boot during
> USB hub enumeration with "corrupted stack end detected inside
> scheduler". sparc has not been converted to THREAD_INFO_IN_TASK, so
> thread_info sits at the bottom of the kernel stack and a marginal
> overflow corrupts it first; CONFIG_SCHED_STACK_END_CHECK then fires
> from __schedule long after the deep path has unwound, which is why
> the reported backtraces look shallow.
>
> Measurements with CONFIG_STACK_TRACER on an UltraSPARC T4-1 show the
> problem is frame count, not any single large frame. The high-water
> mark of an ordinary successful boot is 12616 of 16384 bytes (77%),
> reached in hub_probe() with a printk console flush and then a timer
> interrupt (which runs on the task stack, and whose scheduler tick
> performs load balancing and IPI delivery) stacked on top. Of the 66
> frames in that path the largest is 408 bytes, and ~85% of them are
> 176-224 bytes - at or just above the SPARC V9 ABI minimum frame
> (128-byte register window save area plus 48-byte argument save
> area). An equivalent call chain on x86-64 costs roughly a third of
> the stack, so a 16K stack on sparc64 provides far less effective
> call depth than on other 64-bit architectures.
>
> Double THREAD_SIZE to 32K (four 8K pages). The PAGE_SHIFT
> conditionals are dropped: sparc64 only supports 8K base pages, so
> the other branches were dead code. Kernel stacks become order-2
> allocations; sparc64 has no VMAP_STACK, but stacks are allocated
> once per thread and the trade against boot-time panics is a good
> one.
>
> Link:https://lore.kernel.org/all/20260519075809.8993-1-unixpro1970@gmail.com/
> Signed-off-by: Tony Rodriguez<unixpro1970@gmail.com>
> [stian: reduced the diff to the THREAD_* defines, measured stack
>   usage with CONFIG_STACK_TRACER and rewrote the changelog]
> Signed-off-by: Stian Halseth<stian@itx.no>
> ---
> v2:
>   - drop the CONFIG_SPARC64 / PAGE_SHIFT conditional chain from v1;
>     thread_info_64.h is only built on sparc64 and only 8K pages are
>     supported, so define the three constants unconditionally
>   - replace the panic backtrace in the changelog with stack tracer
>     measurements answering David Laight's review comments:
>     https://lore.kernel.org/all/20260520144104.618c75ca@pumpkin/
>   - retitled from "unify thread stack sizing and add explicit 32KB
>     stack"; the sizing logic for other configurations is unchanged
>
> Tested on an UltraSPARC T4-1, booted with the stack tracer armed
> ("stacktrace") before and after this patch. The boot high-water mark
> is 12616 bytes on both kernels - the worst path (hub_probe with a
> printk and a timer interrupt on top) is deterministic - i.e. 77% of
> the 16K stack before, 38% of the 32K stack after. DEBUG_STACK_USAGE
> agrees: the peak boot-time task shows 9208 bytes left of 16K before
> vs 25592 bytes left of 32K after (7176 bytes used in both).
>
>   arch/sparc/include/asm/thread_info_64.h | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/include/asm/thread_info_64.h
> --- a/arch/sparc/include/asm/thread_info_64.h
> +++ b/arch/sparc/include/asm/thread_info_64.h
> @@ -99,13 +99,8 @@
>   #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_page */
>   #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */
>   
> -#if PAGE_SHIFT == 13
> -#define THREAD_SIZE (2*PAGE_SIZE)
> -#define THREAD_SHIFT (PAGE_SHIFT + 1)
> -#else /* PAGE_SHIFT == 13 */
> -#define THREAD_SIZE PAGE_SIZE
> -#define THREAD_SHIFT PAGE_SHIFT
> -#endif /* PAGE_SHIFT == 13 */
> +#define THREAD_SIZE (4 * PAGE_SIZE)
> +#define THREAD_SHIFT (PAGE_SHIFT + 2)
>   
>   /*
>    * macros/functions for gaining access to the thread information structure
> @@ -128,11 +123,7 @@
>   #endif
>   
>   /* thread information allocation */
> -#if PAGE_SHIFT == 13
> -#define THREAD_SIZE_ORDER	1
> -#else /* PAGE_SHIFT == 13 */
> -#define THREAD_SIZE_ORDER	0
> -#endif /* PAGE_SHIFT == 13 */
> +#define THREAD_SIZE_ORDER	2
>   
>   #define __thread_flag_byte_ptr(ti)	\
>   	((unsigned char *)(&((ti)->flags)))
> --
> 2.53.0
