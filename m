Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091313634C
	for <regressions@lists.linux.dev>; Wed,  9 Oct 2024 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492699; cv=none; b=uAqN+OhwaahiO+exgmBURrxDYvw9fI7+AXHRSZixwYumgXTp55HUG9RdVSdV9cROugfPNH6w8YANKW8jaf9XkqDMF0DCjmksoUy+2R6ARyFOOebX0khgaoxTGQ+zwuDPZZCcyGiLEn/KS7yzda9AZEABRO0h/vuLGHIrdZGW8Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492699; c=relaxed/simple;
	bh=KV/cSNhGI4P0Y0AE/y1W065QJ3N1Z9l3U3lj34z2gq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWLCMC4VmIlLK+4M1my7aK/T2XDKIFLqeHUh3j8YEYiiX3iakcnfP7i6+SksCNsm0/BKS/NkZhK8l/vixoifKF1CP0svjoxmnn4PI9pivvA9cEx4rk0z7Tt+eLDpb0nKoCNo/1cYgYT3YNbEPaY97SCcTkvDEZJycbBXQ/LfqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YacUBR1Q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YacUBR1Q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431137d12a5so6193155e9.1
        for <regressions@lists.linux.dev>; Wed, 09 Oct 2024 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728492696; x=1729097496; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JcvhzK/M2OB+8jA9EG3fqKF6d49AM3B/50Z3kYSBu9Q=;
        b=YacUBR1QSQs9UVfQ/sWQYacIrldHyVn9DH4uWaQJyFpNPErTUXmJ46rTGKNKVkDOA2
         i5WcOr7B1JdlpCeBGGtX71a39TqJr/fNPRiik32UBzwgZAMy91PVWRIddH8M7vb3SC/B
         KGaqRpIC3ywRO+gnBtLnN5zngNCJq8hiklduxPgp1NP8Z+tK+xmn2vIjJlSfa2oYYp+R
         pulxRheV2lEUmvy9id7ainS9JEOuIVRq87UYTrA1QZ5dO6p53ycUh3WLBul6P2gUKMvH
         n3J4idT0mXHGUA2LBOz10KqdzrAWpK/z/VnL0Vl2R0QKSdMqXXIe2Qd8g8rExeZkRoKz
         Z9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492696; x=1729097496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcvhzK/M2OB+8jA9EG3fqKF6d49AM3B/50Z3kYSBu9Q=;
        b=auKzweciqyxMmgcWJ/1KuoSeCKKCUpaknERw6I9DSMohUnKtNSfGFdQc+s6Dou0+O7
         ioFwCCn7T9wBFnvFvOwG6wCGVAA5NmjJzz64Cwshy1tWJj7wS4SQeRvqdXAdoA73TaIS
         t5KFbhLb41huUP3wCadF//+bH9u+Bj1NhumarDsiUsiOT0+U5aLbD2NGEEKAQQokMyHA
         566WF+nnF0rHGRcsHk/U713MO2Q2QZJ27IrpUZTIOmqCZRWqUcdPGe+dlmoSeoojy+T6
         1FS8isR/Hu6yV85rI5tG7H82e3CKU1g7q2OS3L/W+zHwlRBKRgwA/S41GX6feGEWhIMs
         lrkg==
X-Forwarded-Encrypted: i=1; AJvYcCXWGcy9dH0r1g0kx3zszt26F+vYvXGRDsdKb6uK5iwhfgSF0oOxTj7cWiNoh6ZTwaVuAPxHXAGUu0t3tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo1wu8Ob/1eImoV0xKVbwVXmxZ1xQV21oELDC40uwXr6ZvxuiU
	GmUWYg81v2l8cHfNxW0eyJ2isjr0Awg0ft3wIFqKAJ41Mjsg4a/OGMS4rmt6XU4=
X-Google-Smtp-Source: AGHT+IF0T4FAqQj9qW87fHcjoIgPXQ2XJcxemN8K/sFZeHug+nBirxN9MNXyz33vKxSVnAXSj6ipOQ==
X-Received: by 2002:a05:600c:3b1e:b0:42f:8515:e490 with SMTP id 5b1f17b1804b1-430ccf0ce1emr27481625e9.5.1728492696288;
        Wed, 09 Oct 2024 09:51:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf516f7sm25063995e9.21.2024.10.09.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:51:35 -0700 (PDT)
Date: Wed, 9 Oct 2024 19:51:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-mm <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next-20241001: WARNING: at mm/list_lru.c:77 list_lru_del
 (mm/list_lru.c:212 mm/list_lru.c:200)
Message-ID: <892332fa-e1d0-4581-9c42-045660d7dc80@stanley.mountain>
References: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>
 <e718bc99-e63b-4adb-9e40-2379f48301f5@stanley.mountain>
 <b22dbfe2-dd29-40de-a4a3-4a0d6b55cd65@stanley.mountain>
 <62a65418-2393-40ec-b462-151605a5efcf@stanley.mountain>
 <CAMgjq7CapiW2h2pzcKQBhwf_5rs5fgMGHw1E2YJYwEiY6zc=LQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7CapiW2h2pzcKQBhwf_5rs5fgMGHw1E2YJYwEiY6zc=LQ@mail.gmail.com>

On Thu, Oct 03, 2024 at 02:58:19AM +0800, Kairui Song wrote:
> On Wed, Oct 2, 2024 at 7:28 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Wed, Oct 02, 2024 at 02:25:34PM +0300, Dan Carpenter wrote:
> > > On Wed, Oct 02, 2024 at 02:24:20PM +0300, Dan Carpenter wrote:
> > > > Let's add Kairui Song to the  CC list.
> > > >
> > > > One simple thing is that we should add a READ_ONCE() to the comparison.  Naresh,
> > > > could you test the attached diff?  I don't know that it will fix it but it's
> > > > worth checking the easy stuff first.
> > > >
> > >
> > > Actually that's not right.  Let me write a different patch.
> >
> > Try this one.
> >
> > regards,
> > dan carpenter
> >
> > diff --git a/mm/list_lru.c b/mm/list_lru.c
> > index 79c2d21504a2..2c429578ed31 100644
> > --- a/mm/list_lru.c
> > +++ b/mm/list_lru.c
> > @@ -65,6 +65,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
> >                        bool irq, bool skip_empty)
> >  {
> >         struct list_lru_one *l;
> > +       long nr_items;
> >         rcu_read_lock();
> >  again:
> >         l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
> > @@ -73,8 +74,9 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
> >                         spin_lock_irq(&l->lock);
> >                 else
> >                         spin_lock(&l->lock);
> > -               if (likely(READ_ONCE(l->nr_items) != LONG_MIN)) {
> > -                       WARN_ON(l->nr_items < 0);
> > +               nr_items = READ_ONCE(l->nr_items);
> > +               if (likely(nr_items != LONG_MIN)) {
> > +                       WARN_ON(nr_items < 0);
> >                         rcu_read_unlock();
> >                         return l;
> >                 }
> >
> 
> Thanks. The warning is a new added sanity check, I'm not sure if this
> WARN_ON triggered by an existing list_lru leak or if it's a new issue.
> 
> And unfortunately so far I can't reproduce it locally on my ARM
> machine, it should be easily reproducible according to the
> description. And if the WARN only triggered once, and only during
> boot, mayce some static data wasn't initialized correctly?

I have a config where it printed twice and the second time wasn't during boot.

https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241009/testrun/25363339/suite/boot/test/gcc-13-lkftconfig-rcutorture/log

> Or the enablement of memcg caused some list_lru leak
> (mem_cgroup_from_slab_obj changed from returning NULL to returning
> actual memcg, so a item added to rootcg before will be attempt removed
> from actual memcg, seems a real race). If it's the latter case, then
> it's an existing issue caught by the new sanity check.
> 
> The READ_ONCE patch may be worth trying, I'll also try to do more
> debugging on this and try to send a fix later.

The READ_ONCE() patch *seemed* to work, but the bug is intermittent so maybe it
just changed the timing or something.  Still, I feel from a correctness
perspective the READ_ONCE() thing is probably correct, right?

regards,
dan carpenter
