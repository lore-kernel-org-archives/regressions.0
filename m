Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349E18011
	for <regressions@lists.linux.dev>; Thu,  8 Jun 2023 17:37:02 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-256719f2381so782124a91.0
        for <regressions@lists.linux.dev>; Thu, 08 Jun 2023 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686245822; x=1688837822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5HMiXJj25/0cs+VQWx8wtIMazP9D7ttY2YMsSjDM3k=;
        b=e/c15UQDeZn5gVYdCP1WTVUOnES+ksevPkbz0RqG+FbeFuOa1OmqHpbYb7HMmwiBRg
         L01Vbb2O2AvFXQNR4FCyB+Z9OG6phe8RA0XyHjgmByAbCi+XN/GT+5GoOPENmUEqQ122
         wLZw9SzLsBYt5PhJrdVvPfUKM1q/jzBTj0qfx05ZbA51cuJVlTrlAzxLvd3cXcCoostm
         fRzqaAmJ0T5a6qVQ105CVZGLjDrGqZY/q2PRL0OUW+aI4txyNqqaD+yZKOHf//MKVbxZ
         ARC/YEkAmMSg7PjqR6YxTFdSm6Z6wuz8A1ZipIaSzu5kP5otynNe2Uu40jpWpEI/v2TP
         OiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686245822; x=1688837822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5HMiXJj25/0cs+VQWx8wtIMazP9D7ttY2YMsSjDM3k=;
        b=S9bnx3NXgV3epYYxqUmISQYTtbe/Lnvh5SzEVCOobAZNIuYJ3JvXvVvQ3XeXVHg3zh
         flqlPkbpC9e2MI0L/oR7Bj3Ci9uBS4aQbAxomXRdrItqb5N0w5WJ3Zizq1iclCzMSk8I
         F1AbzaR/fofkIOA+0/RKX8sLfzINpCNTbAUWjdpvaRe25PwtbPWuLzQTG6jZmE59aWdp
         pj3R5jHA2SsK0rOwpbeqGBEX5DYk/35irJafckiFI260o5cOt8agaoiqd0tefsGji6tr
         Ie+vmwx0fEtjnGwuYXE4PlQweZeB9Xz9xIx6dYqep+znmhWOknYLe4q+/DpowRgML7cm
         ii3g==
X-Gm-Message-State: AC+VfDxrL3rQsnbGtxP/kcBJMV9/n8SEDtPEiFr1ACHVQ/G8rnAqBNNb
	l+FFjk9tlEVRTcVlvAsqZ8Pl5pitEUsifg==
X-Google-Smtp-Source: ACHHUZ74G/VJbIfySxv6uBggTimaPqijqNP4UNpTFxQCf/GcIiJkljU1WVA4BLSOA08kPiDEVcYA+854RqbX2Q==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a17:90b:f95:b0:256:b9d1:4e34 with SMTP id
 ft21-20020a17090b0f9500b00256b9d14e34mr2339447pjb.5.1686245822177; Thu, 08
 Jun 2023 10:37:02 -0700 (PDT)
Date: Thu, 8 Jun 2023 17:37:00 +0000
In-Reply-To: <20230608111408.s2minsenlcjow7q3@quack3>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221024052841.3291983-1-shakeelb@google.com> <20230608111408.s2minsenlcjow7q3@quack3>
Message-ID: <20230608173700.wafw5tyw52gwoicu@google.com>
Subject: Re: [PATCH] mm: convert mm's rss stats into percpu_counter
From: Shakeel Butt <shakeelb@google.com>
To: Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, mhocko@suse.cz, vbabka@suse.cz, 
	regressions@lists.linux.dev, Yu Ma <yu.ma@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 08, 2023 at 01:14:08PM +0200, Jan Kara wrote:
[...]
> 
> Somewhat late to the game but our performance testing grid has noticed this
> commit causes a performance regression on shell-heavy workloads. For
> example running 'make test' in git sources on our test machine with 192
> CPUs takes about 4% longer, system time is increased by about 9%:
> 
>                        before (9cd6ffa6025)  after (f1a7941243c1)
> Amean     User         471.12 *   0.30%*     481.77 *  -1.96%*
> Amean     System       244.47 *   0.90%*     269.13 *  -9.09%*
> Amean     Elapsed      709.22 *   0.45%*     742.27 *  -4.19%*
> Amean     CPU          100.00 (   0.20%)     101.00 *  -0.80%*
> 
> Essentially this workload spawns in sequence a lot of short-lived tasks and
> the task startup + teardown cost is what this patch increases. To
> demonstrate this more clearly, I've written trivial (and somewhat stupid)
> benchmark shell_bench.sh:
> 
> for (( i = 0; i < 20000; i++ )); do
> 	/bin/true
> done
> 
> And when run like:
> 
> numactl -C 1 ./shell_bench.sh
> 
> (I've forced physical CPU binding to avoid task migrating over the machine
> and cpu frequency scaling interfering which makes the numbers much more
> noisy) I get the following elapsed times:
> 
>          9cd6ffa6025    f1a7941243c1
> Avg      6.807429       7.631571
> Stddev   0.021797       0.016483
> 
> So some 12% regression in elapsed time. Just to be sure I've verified that
> per-cpu allocator patch [1] does not improve these numbers in any
> significant way.
> 
> Where do we go from here? I think in principle the problem could be fixed
> by being clever and when the task has only a single thread, we don't bother
> with allocating pcpu counter (and summing it at the end) and just account
> directly in mm_struct. When the second thread is spawned, we bite the
> bullet, allocate pcpu counter and start with more scalable accounting.
> These shortlived tasks in shell workloads or similar don't spawn any
> threads so this should fix the regression. But this is obviously easier
> said than done...
> 

Thanks Jan for the report. I wanted to improve the percpu allocation to
eliminate this regression as it was reported by intel test bot as well.
However your suggestion seems seems targetted and reasonable as well. At
the moment I am travelling, so not sure when I will get to this. Do you
want to take a stab at it or you want me to do it? Also how urgent and
sensitive this regression is for you?

thanks,
Shakeel

