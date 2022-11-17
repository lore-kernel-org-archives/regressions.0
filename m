Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F4611E
	for <regressions@lists.linux.dev>; Thu, 17 Nov 2022 13:58:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso1844275wmp.5
        for <regressions@lists.linux.dev>; Thu, 17 Nov 2022 05:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PQ5ws+dl8HGBcphz45G0mKTEEpJ4QfuhaudxhaD3+4=;
        b=Bsf2m3MvbEn/8XlgvsgW5JoESOTFjhJMfQGF2lQzwZWRI2+U8rmt31ZkpwmzciX3gQ
         4j+E93VrCZNGODCTWUcMXYY5pbmaJwnHw+UdBmOxw+8NpVtAPtlx/YF5qnr5k19uDjAI
         hQsd2Rpf2Tf+rz3eywQyEVXwTnMfthpQL8fSQ025Pf4PC56p5cK3v3T1/6uvpLy1Paxo
         dNc1zIVzrK/5aiMtvDT3oznp7ozyqzD0S1ZJ8ufVEhHb4WxBHh36Kk2mnoekb4Srp2Tt
         IA3QGXQaAolTdPXvkHcJUQvqhyRl5sqciU2nf5szQT9gDc3GcZ7dtyBwTpT9x33SwaqY
         TvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PQ5ws+dl8HGBcphz45G0mKTEEpJ4QfuhaudxhaD3+4=;
        b=kfFqd+QTPOcYKLU0w3Y5TCgX5yxEVSpnZ1LBswnBWdr4Oq0akGi7kQcUE3578pzxjQ
         9A//MPpLeJL+my/J0uJzyNncD30r+rcTKrX3nE/YgTfgEus54usBgf8Tj/q9/EgC1f7S
         TRsUqCm/x5E5sI5hn4QrzD79q1C9RT60b7CZQSyZvmGg+pHbyw5SbdlXkEt3wDrTM9z6
         2LTQrhifU1gpKd+9KricbnpwtNZZ4ukRie8mwP3ndeVTsSli5dXsBzHb2lufN1aA9V1T
         gxLUpe0OHXnUxo+Rv+V6OMvZ414vQjMVrzM+dmvC+gZgftkep3B9INzcgTCnW5Ut81y/
         3pzQ==
X-Gm-Message-State: ANoB5pmsESat8hedfXKUWoaZgVHneDpTwB9LXVYLocwMu6VK2fQ0LoUi
	oyU+p70WhpmHNliLe2vU0DCF9w==
X-Google-Smtp-Source: AA0mqf5mWk6NiG18cPmnqbdN+rMZijqr8d6POOWkXXJ7U3JHI2JxQeypVTt8Zt40vyCYMSpJ0ixc2g==
X-Received: by 2002:a05:600c:220b:b0:3cf:f747:71f with SMTP id z11-20020a05600c220b00b003cff747071fmr3728421wml.147.1668693524809;
        Thu, 17 Nov 2022 05:58:44 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:92f0:1ec9:e9f2:5cbe])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c020400b003b492753826sm1226279wmi.43.2022.11.17.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:58:43 -0800 (PST)
Date: Thu, 17 Nov 2022 14:58:37 +0100
From: Marco Elver <elver@google.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@intel.com>
Cc: kasan-dev <kasan-dev@googlegroups.com>, X86 ML <x86@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>, regressions@lists.linux.dev,
	lkft-triage@lists.linaro.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>
Subject: Re: WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46
 kfence_protect
Message-ID: <Y3Y+DQsWa79bNuKj@elver.google.com>
References: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)

On Thu, Nov 17, 2022 at 05:01PM +0530, Naresh Kamboju wrote:
> Kunit test cases failed and found warnings while booting Linux next
> version 6.1.0-rc5-next-20221117 on qemu-x86_64 [1].
> 
> It was working on Linux next-20221116 tag.
> 
> [    0.663761] WARNING: CPU: 0 PID: 0 at
> arch/x86/include/asm/kfence.h:46 kfence_protect+0x7b/0x120
> [    0.664033] WARNING: CPU: 0 PID: 0 at mm/kfence/core.c:234
> kfence_protect+0x7d/0x120
> [    0.664465] kfence: kfence_init failed
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
[...]
> [    0.663758] ------------[ cut here ]------------
> [    0.663761] WARNING: CPU: 0 PID: 0 at
> arch/x86/include/asm/kfence.h:46 kfence_protect+0x7b/0x120
[...]
> [    0.664465] kfence: kfence_init failed
> 
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: af37ad1e01c72483c4ee8453d9d9bac95d35f023
>   git_describe: next-20221117
>   kernel_version: 6.1.0-rc5
>   kernel-config: https://builds.tuxbuild.com/2Hfb6n1z0frt4iBlIvqUzjMHiLm/config
>   build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/697483979
>   artifact-location: https://builds.tuxbuild.com/2Hfb6n1z0frt4iBlIvqUzjMHiLm
>   toolchain: gcc-11

I bisected this to:

	commit 127960a05548ea699a95791669e8112552eb2452
	Author: Peter Zijlstra <peterz@infradead.org>
	Date:   Thu Nov 10 13:33:57 2022 +0100

	    x86/mm: Inhibit _PAGE_NX changes from cpa_process_alias()

	    There is a cludge in change_page_attr_set_clr() that inhibits
	    propagating NX changes to the aliases (directmap and highmap) -- this
	    is a cludge twofold:

	     - it also inhibits the primary checks in __change_page_attr();
	     - it hard depends on single bit changes.

	    The introduction of set_memory_rox() triggered this last issue for
	    clearing both _PAGE_RW and _PAGE_NX.

	    Explicitly ignore _PAGE_NX in cpa_process_alias() instead.

	    Fixes: b38994948567 ("x86/mm: Implement native set_memory_rox()")
	    Reported-by: kernel test robot <oliver.sang@intel.com>
	    Debugged-by: Dave Hansen <dave.hansen@intel.com>
	    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
	    Link: https://lkml.kernel.org/r/20221110125544.594991716%40infradead.org

A simple revert of this commit fixes the issue.

Since all this seems to be about set_memory_rox(), and this is a fix
commit, the fix itself missed something?

Thanks,
-- Marco
