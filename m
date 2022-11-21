Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940AA813
	for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 05:40:20 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3691e040abaso103557757b3.9
        for <regressions@lists.linux.dev>; Sun, 20 Nov 2022 21:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/0dujvI66k8dvZ4+iOLkypH8JCTwbnK/z2RJps0YrtI=;
        b=jF3s06QCgsUZvM0RKnSIOmJkFDWsfW6PXcLzLjsdLf5h8gEExAVkTSo/r9NT1TnIb1
         iGgvN9AsWBhx5aRtAPMKvr62uClpcvtJlR+Uc9K5pRxxPMz6Jnz8MSKil5/PJIAcsCen
         fSC0nt7yYiux7MTSQ6SWLs0VLLBodShk6jP+6yRTJdTUZgWQyyMBefhH+q4Ii3Omb2mF
         IcEeo1XZKwuXARpHGNIQXwi9s8YuMiJ7dqDU7/UJu8KF0gW2LmDkrL9MXu4gJw494jns
         N9URoloidc17fSAi3W2+iDtPYYMNyavxrXrTXNznLFkdFMKYM9PAFwoPB1BMK/6o3Ajq
         A5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0dujvI66k8dvZ4+iOLkypH8JCTwbnK/z2RJps0YrtI=;
        b=GQA3yk9uxKFqFO5XMEos8Mn1/sY4Id0nHdEfg9i8Q6QDcW5MhgBrJ5BlDesQ5BNKR6
         aGfRve4XcsfvTNDN9YHriz0jTCNR0te/L+GJ6Yv6LrKEYLS0vJZuGjhMhjOn049CAsHq
         IFZHA+x6ey6ccwdopy8ag8WYE190aZnWIKe3otIHJ0tC/cY6Hudw6pzFOuabKvWbOWGN
         Wf/Q2V6qcdP8hwFnGPiStAyqsFOlw0f03juwB0YNulevjdzsWo/NDKBRQJObn8XK4Sy9
         s3986TLPlES+h8vS+GKd+SirO84QBKlwBrrRY8p4nKkk+UJ2w3ve720ocR+2wQm+HLkx
         ytCA==
X-Gm-Message-State: ANoB5pmyirK2oeecD+rOBCnSj/HV8ScJrgjm6DWxpSXPPNxZekH7LIMI
	pGus4z7aQWrLPPpaO+FvzoUCAHyD0y0zbzaiT1P40Q==
X-Google-Smtp-Source: AA0mqf6SEF8jWr1jCFfYCO4FjdTdGRv1CC+XqKHC0wNxmj3V2Yl886eUatLzdUwLno5hATdgxjl0YbwTMeWRBg9MJOs=
X-Received: by 2002:a81:142:0:b0:396:56a9:512b with SMTP id
 63-20020a810142000000b0039656a9512bmr11564228ywb.459.1669009219299; Sun, 20
 Nov 2022 21:40:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
 <Y3Y+DQsWa79bNuKj@elver.google.com> <4208866d-338f-4781-7ff9-023f016c5b07@intel.com>
In-Reply-To: <4208866d-338f-4781-7ff9-023f016c5b07@intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Nov 2022 11:10:07 +0530
Message-ID: <CA+G9fYt7WQWKNaNeTnxo19h9i84p5nVemqgwJkQQGeOmt14b_g@mail.gmail.com>
Subject: Re: WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46 kfence_protect
To: Dave Hansen <dave.hansen@intel.com>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, X86 ML <x86@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Nov 2022 at 20:04, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 11/17/22 05:58, Marco Elver wrote:
> > [    0.663761] WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46 kfence_protect+0x7b/0x120
> > [    0.664033] WARNING: CPU: 0 PID: 0 at mm/kfence/core.c:234 kfence_protect+0x7d/0x120
> > [    0.664465] kfence: kfence_init failed
>
> Any chance you could add some debugging and figure out what actually
> made kfence call over?  Was it the pte or the level?
>
>         if (WARN_ON(!pte || level != PG_LEVEL_4K))
>                 return false;
>
> I can see how the thing you bisected to might lead to a page table not
> being split, which could mess with the 'level' check.
>
> Also, is there a reason this code is mucking with the page tables
> directly?  It seems, uh, rather wonky.  This, for instance:
>
> >         if (protect)
> >                 set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> >         else
> >                 set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> >
> >         /*
> >          * Flush this CPU's TLB, assuming whoever did the allocation/free is
> >          * likely to continue running on this CPU.
> >          */
> >         preempt_disable();
> >         flush_tlb_one_kernel(addr);
> >         preempt_enable();
>
> Seems rather broken.  I assume the preempt_disable() is there to get rid
> of some warnings.  But, there is nothing I can see to *keep* the CPU
> that did the free from being different from the one where the TLB flush
> is performed until the preempt_disable().  That makes the
> flush_tlb_one_kernel() mostly useless.
>
> Is there a reason this code isn't using the existing page table
> manipulation functions and tries to code its own?  What prevents it from
> using something like the attached patch?

I have applied this patch and found build warnings / errors.

In file included from mm/kfence/core.c:34:
arch/x86/include/asm/kfence.h: In function 'kfence_protect_page':
arch/x86/include/asm/kfence.h:45:17: error: implicit declaration of
function 'set_memory_p'; did you mean 'set_memory_np'?
[-Werror=implicit-function-declaration]
   45 |                 set_memory_p(addr, addr + PAGE_SIZE);
      |                 ^~~~~~~~~~~~
      |                 set_memory_np
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:250: mm/kfence/core.o] Error 1
In file included from mm/kfence/report.c:20:
arch/x86/include/asm/kfence.h: In function 'kfence_protect_page':
arch/x86/include/asm/kfence.h:45:17: error: implicit declaration of
function 'set_memory_p'; did you mean 'set_memory_np'?
[-Werror=implicit-function-declaration]
   45 |                 set_memory_p(addr, addr + PAGE_SIZE);
      |                 ^~~~~~~~~~~~
      |                 set_memory_np
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:250: mm/kfence/report.o] Error 1
In file included from mm/kfence/kfence_test.c:26:
arch/x86/include/asm/kfence.h: In function 'kfence_protect_page':
arch/x86/include/asm/kfence.h:45:17: error: implicit declaration of
function 'set_memory_p'; did you mean 'set_memory_np'?
[-Werror=implicit-function-declaration]
   45 |                 set_memory_p(addr, addr + PAGE_SIZE);
      |                 ^~~~~~~~~~~~
      |                 set_memory_np
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:250: mm/kfence/kfence_test.o] Error 1

ref:
https://builds.tuxbuild.com/2HqMWcweeInju7rqVgGdNge7gby/

- Naresh
