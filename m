Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06662E62F
	for <regressions@lists.linux.dev>; Mon, 24 Jun 2024 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231420; cv=none; b=l9jdGk0AVT6us9VaITmJEcj8JDPusTvzg5h6BilKLAKfeqb3SkIA6z913obfZUqOJ4jihvLmJ2rUn10TWD0KAMbhJeib2HS2xAo39c718HkVzc44yhY+goha6+cZjk/XtP9YF0aN9TtuXD/Xz+7ImMTpO7CVwHdkRs5L+ivPzfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231420; c=relaxed/simple;
	bh=qyFUq+scYKsMZVcWCOoCO9/4yb0PF8TUDetkIaa6PBQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3Y1GAKwq5GaH4TOkX+e4x1t5NwmtFiatltHtL0/+w8yxP55mzmzyi+NdidDNm/3emfz/KUfIP75glieLAnWAaYE/oCzvoB0kd3WVOt+JCbMxm8inTJMF8M5tGSqiZDTarIc+9DA0Lik3feX/zo0AXKJgkHNd4CSzJFlCaAbglY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj2Ogdcu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj2Ogdcu"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cdfb69724so1806215e87.1
        for <regressions@lists.linux.dev>; Mon, 24 Jun 2024 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719231417; x=1719836217; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOwwUCn4o91Hx00RzgGfd9DNWIUVFFDkTLA5vyA8/fM=;
        b=Gj2Ogdcu/g2LQQwmKjMcmKsZtmAGn6uek56DaOOz78bAcVJWbVf2dEEhYIVE89JIgG
         GKvBommT375W1SZDBxCsD09kboqmySCOhBngJLH115xn92qDvnNaKsJTn3Df+Bus3QUM
         Ph2TmiF3TxDbs6jC13Rkes+AC0qM42/oC8p4EwJQDEQOfW2SnjkQsJl+Vlxz9+eNeid9
         n9SSi+0BIPegkQ81GrKQwg3g9yNh6x06WFRhmqwtuEoIkpairBFSAJkR+NLTHvH7oVsx
         hVhUPTRycL4A8rOJH17GoQVVkIGesLDrOeOuToB0Oa5hZ4FCZ7zvVyyVF1/yXw2sy4+g
         l2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719231417; x=1719836217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOwwUCn4o91Hx00RzgGfd9DNWIUVFFDkTLA5vyA8/fM=;
        b=OuQkHNqGGaWujpGPadQfK7DPyZNWLUcHyKwGvGABYdqJEJd0KzF9+AZCM6da4Cxp6K
         Grc+6nttZbP+6na+nncyIG0k5tLRLF4oLNqgLgAveGWdHql2kqc11CGSdNwRZXAPYdzp
         2fMkJgPxXv8RdY3/5RMaccs4tAEuMZExrrqD1ol/iFOrCpIe0LF8caAi8GYuLycckg0T
         Mcg07m5NlowT4g1Lw4ZPP3bPjVgEB4rFHTD73H62pwsbhWkevYXGNw84vzb342fcwpP0
         XHTy9CldPfI2o48O39R+y5bJprUKfK5oN1SkW3+9RpaJT2v4Wwyw2okvOB0AuV3GQ/3S
         TGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBSAKqv95Nyxwki+Q3cvVoyZx0W5xtREyD3I0xEbjqetEIgU8YNZ/61ecaHcBUksz+CJkGVAaHKwlfhRLxblZP9g8pHl9QvCwl1C0=
X-Gm-Message-State: AOJu0YwnjtzY2sdDt/Yq7CElHQWwnsb+euohhSKD0TrY3htzJce3WQ3A
	MTfljqU89oiGfhS06tizJocvck550nbvkjYuauCrul95GzMCXFWP
X-Google-Smtp-Source: AGHT+IEsFRWCKZJoK13E+Pt3s17fNddxxyoVj/A//QIxbCu+pr046XEFbPnc02WFGZ3DEx8RMoJ0rA==
X-Received: by 2002:a05:6512:3b13:b0:52c:dbee:bdb0 with SMTP id 2adb3069b0e04-52ce186271amr3543920e87.59.1719231416848;
        Mon, 24 Jun 2024 05:16:56 -0700 (PDT)
Received: from pc636 (host-90-233-219-252.mobileonline.telia.com. [90.233.219.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6449b48sm957965e87.275.2024.06.24.05.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 05:16:56 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 24 Jun 2024 14:16:54 +0200
To: Baoquan He <bhe@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Nick Bowler <nbowler@draconx.ca>,
	Hailong Liu <hailong.liu@oppo.com>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <Znljtv5n-6EBgpsF@pc636>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
 <00d74f24-c49c-460e-871c-d5af64701306@draconx.ca>
 <20240621033005.6mccm7waduelb4m5@oppo.com>
 <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>
 <ZnVLbCCkvhf5GaTf@pc636>
 <ZnWICsPgYuBlrWlt@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnWICsPgYuBlrWlt@MiWiFi-R3L-srv>

On Fri, Jun 21, 2024 at 10:02:50PM +0800, Baoquan He wrote:
> On 06/21/24 at 11:44am, Uladzislau Rezki wrote:
> > On Fri, Jun 21, 2024 at 03:07:16PM +0800, Baoquan He wrote:
> > > On 06/21/24 at 11:30am, Hailong Liu wrote:
> > > > On Thu, 20. Jun 14:02, Nick Bowler wrote:
> > > > > On 2024-06-20 02:19, Nick Bowler wrote:
> ......
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index be2dd281ea76..18e87cafbaf2 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -2542,7 +2542,7 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
> > >  static struct xarray *
> > >  addr_to_vb_xa(unsigned long addr)
> > >  {
> > > -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> > >  
> > >  	return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > >  }
> > > 
> > The problem i see is about not-initializing of the:
> > <snip>
> > 	for_each_possible_cpu(i) {
> > 		struct vmap_block_queue *vbq;
> > 		struct vfree_deferred *p;
> > 
> > 		vbq = &per_cpu(vmap_block_queue, i);
> > 		spin_lock_init(&vbq->lock);
> > 		INIT_LIST_HEAD(&vbq->free);
> > 		p = &per_cpu(vfree_deferred, i);
> > 		init_llist_head(&p->list);
> > 		INIT_WORK(&p->wq, delayed_vfree_work);
> > 		xa_init(&vbq->vmap_blocks);
> > 	}
> > <snip>
> > 
> > correctly or fully. It is my bad i did not think that CPUs in a possible mask
> > can be non sequential :-/
> > 
> > nr_cpu_ids - is not the max possible CPU. For example, in Nick case,
> > when he has two CPUs, num_possible_cpus() and nr_cpu_ids are the same.
> 
> I checked the generic version of setup_nr_cpu_ids(), from codes, they
> are different with my understanding.
> 
> kernel/smp.c
> void __init setup_nr_cpu_ids(void)
> {
>         set_nr_cpu_ids(find_last_bit(cpumask_bits(cpu_possible_mask), NR_CPUS) + 1);
> }
> 
I see that it is not a weak function, so it is generic, thus the
behavior can not be overwritten, which is great. This does what we
need.

Thank you for checking this you are right!

Then it is just a matter of proper initialization of the hash:

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5d3aa2dc88a8..1733946f7a12 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5087,7 +5087,13 @@ void __init vmalloc_init(void)
         */
        vmap_area_cachep = KMEM_CACHE(vmap_area, SLAB_PANIC);
 
-       for_each_possible_cpu(i) {
+       /*
+        * We use "nr_cpu_ids" here because some architectures
+        * may have "gaps" in cpu-possible-mask. It is OK for
+        * per-cpu approaches but is not OK for cases where it
+        * can be used as hashes also.
+        */
+       for (i = 0; i < nr_cpu_ids; i++) {
                struct vmap_block_queue *vbq;
                struct vfree_deferred *p;
<snip>

--
Uladzislau Rezki
