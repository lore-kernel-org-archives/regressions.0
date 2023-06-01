Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25921063
	for <regressions@lists.linux.dev>; Thu,  1 Jun 2023 14:12:08 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so320608b3a.3
        for <regressions@lists.linux.dev>; Thu, 01 Jun 2023 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685628728; x=1688220728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HVj11wNaxw4vQif1E0UxGezkdxt6Cz5/sdjfAByLB+I=;
        b=jQX6KDcyNYsTRFrk0Y3i+f7A56M/zW5olN/OHvIkTe2uDfJSxYbYdjaHEdoQ0F5KWU
         TVnVu4z5wxK3ezO/FgxGzrEW0LooJWdw71a5xUFdaHEzEn3aOOQJ/ucNVGW30IDzX5I4
         xIF2SeogORRwBf/7R1hsQsCGVVybzQ8/OO0JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628728; x=1688220728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVj11wNaxw4vQif1E0UxGezkdxt6Cz5/sdjfAByLB+I=;
        b=MIQ3uqOT322zz8Zs2KwpseI8FH2EPwczPOIfG29LIJqTW4QpL/Fiaa2g1sbmelTiAa
         6LhXooNM4zcg+4SyYQoF8bJ23X5c2T/BqcrakRGazUmNVONy40M6JrFa79BKtrEgsVTH
         UqM4fAXERwP76boZ3z/fGpSP7tMnb7VwYr0Yqd/wbRlwpuRi3Z5EZy49obJqckKnBcvU
         OfyjR5hMwtR/L5vpGOXQ2SAfPXGSKBOZ2OpSYVPWZQUlKsDY5p7mSscnINC341gkAM0T
         4bEI6aXFWqSq15ptUb3ALR/f05H7kHm7f+QIfSjQzBAJ1/xGeQQqAtqUhd9Xv6Pbpy9t
         EyIg==
X-Gm-Message-State: AC+VfDwtsB5bet1jkagbdQ0NGNiF0hvF/Ngj28N8s5sW6wdRBY2JIrKO
	bSmzN9in4z1M1lVfNge0qS2jnQ==
X-Google-Smtp-Source: ACHHUZ6nx3nyvrBhvYFmh+7r84kFgtl6QKF0PyzwncHUlXwl+FH/VPaGsDpPkygb7eZ3tK+3ar+zKg==
X-Received: by 2002:a05:6a00:2385:b0:64d:6c6f:84f2 with SMTP id f5-20020a056a00238500b0064d6c6f84f2mr7895315pfc.19.1685628727997;
        Thu, 01 Jun 2023 07:12:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x41-20020a056a000be900b0062dedfd3d73sm5276293pfu.95.2023.06.01.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:12:07 -0700 (PDT)
Date: Thu, 1 Jun 2023 07:12:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jeff Xu <jeffxu@google.com>, Daniel Verkamp <dverkamp@chromium.org>,
	David Herrmann <dh.herrmann@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>,
	Jorge Lucangeli Obes <jorgelo@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stuart Foster <smf-linux@virginmedia.com>
Subject: Re: Fwd: Started to get "memfd_create() without MFD_EXEC nor
 MFD_NOEXEC_SEAL"
Message-ID: <202306010710.7F5C39B7A@keescook>
References: <69dad53e-9363-c551-111a-d0051bb0265f@gmail.com>
 <38f847ed-69dc-d5da-5822-bd9da753fc30@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38f847ed-69dc-d5da-5822-bd9da753fc30@suse.cz>

On Thu, Jun 01, 2023 at 09:18:47AM +0200, Vlastimil Babka wrote:
> On 6/1/23 04:07, Bagas Sanjaya wrote:
> > Hi,
> > 
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> > 
> >> Recent kernels seem to generate this:
> >> 
> >> "memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3976 'Xorg'"
> >> 
> >> Is this a kernel problem or something to do with Xorg ?
> >> 
> >> Seen in Kernels 6.3.4 and 6.4.0-rc4.
> >> 
> >> Thanks
> > 
> > See Bugzilla for the full thread and attached logs (dmesg, xorg, bisection
> > log).
> > 
> > Anyway, I'm adding it to regzbot:
> > 
> > #regzbot introduced: 105ff5339f498a https://bugzilla.kernel.org/show_bug.cgi?id=217508
> > #regzbot title: memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL on Xorg
> 
> Hm indeed it seems to have introduced 2 new flags and immediately warn if
> any process doesn't use them. Maybe it would make sense for some of the
> non-default values of vm.memfd_noexec, but it's too early to warn
> unconditionally everywhere, no?

This is pretty standard for getting new options like this noticed by
userspace -- there is no regression in _behavior_. It's just a reminder
to fix userspace code.

-Kees

> > 
> > [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217508
> > 
> 

-- 
Kees Cook
