Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645C3B8135
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 18:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200706; cv=none; b=SBk7WztkW6PSjhrqv67l1yFCVpHVoThFGMnXpnkUjuahefrw8+vDbuJYdVdjPRTj9qM03Sz9LlmFBP8+cMj7YEODCKaFEdwNVQpadMqXK4gURIEdJY2q0fX04VU1qtYZ22x7oLKi3oA9Z/yTxAO0xQS+axy5kCoUIXqTQoX10I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200706; c=relaxed/simple;
	bh=1geMDasm5YEAbcc8lbIMJ8Z0mYy0xqKyIcoPdlMMkQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EME7cmPE0YWIa1YfwWF3JaKHmwX34ovCVqexgc11C9a5sDLX3FHDR8/f/FkbdScaaUm2EaixTkyDeYnKtGAVw2l/KiQZvjTQVTK75rccPbCQbSHrWs7FfJdE2oEsXVld+pqngOm85gT5IqYy83mnrux5AlXW+BzDDMzoG2310yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe5NeMZN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe5NeMZN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so3487848a12.0
        for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200704; x=1788805504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg16aUyXsNhWNe3K+DCBkMThZsxzbl8N3Kd+8LFw0cY=;
        b=Fe5NeMZN47FQ7DecaiRP10HNxxCCwrPWx4u9IDXlwJwfq/eejjjaaG2hcEhoI48PWF
         +LDGgGzPNb5gJzdLIIrxLRhoLfr/FaN/r5sSzeI99JBOAAkBxTQLYDMzBf/l+H/hxyTs
         0iXGgpcQpfOiU835rnqo/O9YKOwT/qNYtJsVMNb4ML113kvuukk+ohfJK90Z/lR6fZ3F
         msKnb310EB2n2TLVrcUvNPud3046hTNsl5ltIoga1Q0NXBwFwgJaunGMgNHwFKUs4GkJ
         TO7v6Vdf9x+aGh86w72CncecmjTc/IFqk8cUxE91YJHR8/K1vfwh7EOMB/DT3sOOvaDa
         cKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200704; x=1788805504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zg16aUyXsNhWNe3K+DCBkMThZsxzbl8N3Kd+8LFw0cY=;
        b=mXr4C9mCUfVQsibvau4TjUe0Axl92QSV4JezWespfHrjdeBxuuvlu23D2xt4LXxq+g
         7w/Wms9otln21UeSPxRnT1V+NCRK7zZdFqbvpjVjgTW4e6as569drxb8Q+Uzs3hT23DE
         Wbl/TE1L8HD4PBj51w0FU/QfP6pehl38N55sIolgJBgSKyCEan4HBprR4Z9YJfl+ZJUx
         Er6xasY6+Wev+E+Z5gzwYdg1dz1JVXV2NI+c1rBSZwi++vsZ9RjAoxDNSHZKBsAkhpXP
         AVhuRaj4lTAFm5wm8BHADu2JGOV7mMaA01YSfq93Xx01mQy55g9lB/OmBv0B7fwAIV3u
         4hIA==
X-Forwarded-Encrypted: i=1; AHgh+RrKpvKVsbxHapHaTbcXa1xL6DC6ZDTJEZm33wXVYx9xfANGMqx4GOPqCeCAUb3bRh9DcaS06IMwS98/8A==@lists.linux.dev
X-Gm-Message-State: AFuF++lNRkxVZSfddUfafdhN2c2hAOWd8/fBh0vrOA7v735AG/yNNiyB
	up1nQ8EbUFy3Z+FI6h3sdh1kXuOi7aMf7+D0UXoGhDjbkQbyvf/jxuvV
X-Gm-Gg: AR+sD11gL1dWLenbDFZip6HdboCZ6w7E2ZWk1E0T3Fs31u7pWDm1P9Bov5FIFYgiYR2
	rUq1+obxdY10sjMDoPEta3qfhwHYQjkt41f1o4bbmV3yvIHPOioZjdEhixzUgJLURBQ8+Cx5bqI
	OfqmvkilKvcN2q216kY0eijDc8GbvegNToirmdmfavma//77AiIVBuWPqpYgUn+M2vPl/SGwoX8
	c10rL6SIvtdGeUaKvCOMbrTNyk/MqIKW/7MJYd1SZQIerjPF2uVa2Ub0/ibqSxbttu4ZwnXYQbX
	n+YDdGLAQQeipSb6xwG6zvvRvh2QM5BgbksCy8H/TSrTx+X3BexFkZ3wZyzfsZcwDCWFNLKPyOb
	0ybbvYr3QJBL7rVrh/AM8/ghKAXj11dHORlqCH6pEasq/9gE2cyIK3xYSOayB0BNTX7UUiHN/7e
	7rIP6yXQ5OJPk+LJ10mgoXQHM+Nn0bu2Fxb8yC+YYhjk42yg8ZaMJd9ASyIAy4ism7/76oWdz6m
	tmB7sMhD6RJxYOwVYu2sn+c
X-Received: by 2002:a05:6a21:46c4:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3d2681aa0damr46895633637.14.1788200703483;
        Mon, 31 Aug 2026 11:25:03 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc898dsm29077645c88.9.2026.08.31.11.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:25:02 -0700 (PDT)
Message-ID: <afaa8ced-0717-4d62-8ea6-4ecdbf489694@gmail.com>
Date: Mon, 31 Aug 2026 11:25:01 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2] sparc64: increase kernel thread stack size to 32K
To: Stian Halseth <stian@itx.no>, andreas@gaisler.com, davem@davemloft.net,
 sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, thuth@redhat.com, regressions@lists.linux.dev,
 nroach44@nroach44.id.au
References: <20260519075809.8993-1-unixpro1970@gmail.com>
 <20260831172928.3082853-1-stian@itx.no>
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <20260831172928.3082853-1-stian@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stian,

Thanks for following up regarding this, I am currently busy with other 
tasks.  Back in May/June 2026, I also mentioned the following to Andreas:

The combined stack usage is already very close to the 32K limit. If you 
need an immediate workaround, increasing the stack to 64 K may be the 
better option. That should provide enough headroom to avoid the stack 
overflow panics we are seeing.  As of kernel 7.1, I haven't noticed any 
panics using a 32K stack, but once again a stack size that is so close 
to the 32K boundary is a concern. But once again, sparc64 definitely 
crashes with a 16K stack.  The Nvidia/Mellonox mlx5 driver also 
allocates a big stack on sparc64, which pushes it to the 32K boundary.  
There may be other drivers that may do so as well.

The 64K stack is more ideal.

When I compile the kernel with -fstack-usage to generate .su files, on 
7.1 kerner, the static analysis shows small stack frames for all USB 
core functions.
For example:

hub_event:      2457 bytes  (static)
hub_activate:   1892 bytes  (static)
usb_control_msg: 1248 bytes (static)

However, my runtime stack tracing shows a dramatically different picture:

STACKTRACE: hub_event():entry: 31856 bytes used
STACKTRACE: hub_activate():entry: 31680 bytes used
STACKTRACE: usb_control_msg():entry: 30768 bytes used


PS - I have not tested a 64K stack yet, only 32K, and this is a heads-up 
recommendation.


Tony

On 8/31/26 10:29 AM, Stian Halseth wrote:
> From: Tony Rodriguez <unixpro1970@gmail.com>
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
> Link: https://lore.kernel.org/all/20260519075809.8993-1-unixpro1970@gmail.com/
> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
> [stian: reduced the diff to the THREAD_* defines, measured stack
>   usage with CONFIG_STACK_TRACER and rewrote the changelog]
> Signed-off-by: Stian Halseth <stian@itx.no>
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
