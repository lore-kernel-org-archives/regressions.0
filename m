Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2E014ABB
	for <regressions@lists.linux.dev>; Thu,  8 Jun 2023 19:10:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b02d0942caso402735ad.1
        for <regressions@lists.linux.dev>; Thu, 08 Jun 2023 12:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686251420; x=1688843420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7JDYeCj1Au9M2F7A6TgeeUVVVrQVhgPcLMJ9f44nT4=;
        b=ObuUy7jq4yJMZeFETYqxhPRD+TYk2lfW++fICGVSpTyoFgSwzI8oSot9SuARscGqBM
         gJ6yT9AOAmg0fobeDiW3RbJxtvsciXacKfGy8xjsuGVAV1Vu/2zVzltEjAILSuqZHPgr
         OgVzmMwxwUPdnXBKHpbA/586q5uEN7fT3yjTTlTIQFUWG7jhSUslUud02q/t+isp/eur
         5lDWdH0aSaYIWHVoDyynf4GABLH58sBMhhgmD6JL1tKZRDiA4rsyBpBZ/Frvgw9DaXSY
         rgmyG3kUqW1gfqG1JXJJnjfl574QW2l0HmWxiWPg+Tpm3/Z4oOgeW0jOKhFBNwLMWcpH
         ES2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251420; x=1688843420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7JDYeCj1Au9M2F7A6TgeeUVVVrQVhgPcLMJ9f44nT4=;
        b=ftdeoPKyl2NatBzaSe19kIG2Szxc+UeNnAok6LnAqv2cD7qKDHpbp4zfq6Vt467kvF
         /jNQZrde3U4PX8jUi0WCQwlM19FSjDhC6jQG/+V84FgjkvGucUm9M4U8uzdFCyzQR9bI
         up+FIoTb/C7jW7RIONlUhYTwmVyK4wADnuGaXdxbtKd3l2nSSChLYhOtv/3H2xgvaPq2
         95LkY9b1KtNWAp3otupSn5/ap5WehnjDDoaxF3ce/WlGtQzf6LwMAS6URaj5esuseU1/
         AThhLA5aCJdXuf4lwOHGNo5QC/5GiDri87wLynzwfxZ6atQUW1la67CK7br6Khf3uOIT
         kCbg==
X-Gm-Message-State: AC+VfDzFEbEMbg2bf3ywLr9f57VF/8y0V1UsyFgqeBkM2cofz4H3r/nJ
	a/UP5CEv58R6do8nrBOwKlS3bR6nsegH0A==
X-Google-Smtp-Source: ACHHUZ5nR2KP9shcCg65TNHMHwD2feED6YAnUJLCRKW0B2VcKLwF5rQZJh1D7B9Bofg0fsquoq4UIQ==
X-Received: by 2002:a17:902:7c82:b0:1a2:9ce6:6483 with SMTP id y2-20020a1709027c8200b001a29ce66483mr4006161pll.64.1686251420344;
        Thu, 08 Jun 2023 12:10:20 -0700 (PDT)
Received: from V92F7Y9K0C.corp.robot.car ([199.73.127.2])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b001b03f89daffsm1781251plg.110.2023.06.08.12.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:10:19 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:10:15 -0700
From: Dennis Zhou <dennisszhou@gmail.com>
To: Shakeel Butt <shakeelb@google.com>
Cc: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, mhocko@suse.cz,
	vbabka@suse.cz, regressions@lists.linux.dev,
	Yu Ma <yu.ma@intel.com>
Subject: Re: [PATCH] mm: convert mm's rss stats into percpu_counter
Message-ID: <ZIInlxGIl8mS-iRk@V92F7Y9K0C.corp.robot.car>
References: <20221024052841.3291983-1-shakeelb@google.com>
 <20230608111408.s2minsenlcjow7q3@quack3>
 <20230608173700.wafw5tyw52gwoicu@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608173700.wafw5tyw52gwoicu@google.com>

Hi Shakeel and Jan,

On Thu, Jun 08, 2023 at 05:37:00PM +0000, Shakeel Butt wrote:
> On Thu, Jun 08, 2023 at 01:14:08PM +0200, Jan Kara wrote:
> [...]
> > 
> > Somewhat late to the game but our performance testing grid has noticed this
> > commit causes a performance regression on shell-heavy workloads. For
> > example running 'make test' in git sources on our test machine with 192
> > CPUs takes about 4% longer, system time is increased by about 9%:
> > 
> >                        before (9cd6ffa6025)  after (f1a7941243c1)
> > Amean     User         471.12 *   0.30%*     481.77 *  -1.96%*
> > Amean     System       244.47 *   0.90%*     269.13 *  -9.09%*
> > Amean     Elapsed      709.22 *   0.45%*     742.27 *  -4.19%*
> > Amean     CPU          100.00 (   0.20%)     101.00 *  -0.80%*
> > 
> > Essentially this workload spawns in sequence a lot of short-lived tasks and
> > the task startup + teardown cost is what this patch increases. To
> > demonstrate this more clearly, I've written trivial (and somewhat stupid)
> > benchmark shell_bench.sh:
> > 
> > for (( i = 0; i < 20000; i++ )); do
> > 	/bin/true
> > done
> > 
> > And when run like:
> > 
> > numactl -C 1 ./shell_bench.sh
> > 
> > (I've forced physical CPU binding to avoid task migrating over the machine
> > and cpu frequency scaling interfering which makes the numbers much more
> > noisy) I get the following elapsed times:
> > 
> >          9cd6ffa6025    f1a7941243c1
> > Avg      6.807429       7.631571
> > Stddev   0.021797       0.016483
> > 
> > So some 12% regression in elapsed time. Just to be sure I've verified that
> > per-cpu allocator patch [1] does not improve these numbers in any
> > significant way.
> > 
> > Where do we go from here? I think in principle the problem could be fixed
> > by being clever and when the task has only a single thread, we don't bother
> > with allocating pcpu counter (and summing it at the end) and just account
> > directly in mm_struct. When the second thread is spawned, we bite the
> > bullet, allocate pcpu counter and start with more scalable accounting.
> > These shortlived tasks in shell workloads or similar don't spawn any
> > threads so this should fix the regression. But this is obviously easier
> > said than done...
> > 
> 
> Thanks Jan for the report. I wanted to improve the percpu allocation to
> eliminate this regression as it was reported by intel test bot as well.
> However your suggestion seems seems targetted and reasonable as well. At
> the moment I am travelling, so not sure when I will get to this. Do you
> want to take a stab at it or you want me to do it? Also how urgent and
> sensitive this regression is for you?
> 
> thanks,
> Shakeel
> 
> 

I _think_ I could probably spin you a percpu_alloc_bulk() series in a
couple days for percpu_counters. Let me try and find some time, unless
you had something different in mind.

Thanks,
Dennis
