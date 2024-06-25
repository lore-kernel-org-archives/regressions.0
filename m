Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD22E3E4
	for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719311550; cv=none; b=EFbc5WiUBfKVFVDwxuL0jEEbu4IoB8A3OQRwdfwbWArHfWoKHQ+PZVn/fCWQ5kEi90gXsE1JrlMVOpMcyLoKIlF3iVcjm2MNry0VXelVVXrQqfN6dVt8+7MhaADQKdi2KROJv4/JPfz5UwF8l46zyeUoXZDsHCGzGelxdaKRAQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719311550; c=relaxed/simple;
	bh=eEMtiTydBzBXKAnhVEriEUdUqMmeKAHaJAPKsDPTb8c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gm35YV170r6krKwbT2d0Rx4FYPrHCefGofp0+MeGJHm2a4wUy9bN+DxQ0YrtznuV0USF+BeVCnMF5DGhEwLdYSvDkeia7ix0V6VC5gykwLD4vhj8DiT4ZIpiOgstXWD6e6Ne8pZkTf0DEA1grQEhAwlkL5lwvjNksdliHGdacd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNNxWsC4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNNxWsC4"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce12707d9so2498281e87.3
        for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719311547; x=1719916347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwlILf/vswvcQXQNiD+f6wBVsZ6SMfSlkE3EALaPOOg=;
        b=TNNxWsC4f3aSEGgnpz8UULmZhDgchQUCjgmqJ9DeuN1RGzIHNdvDHMWlxM1RIFsu/W
         uokAbaJd5Q4tRp4oT2K/E0UgMzjF3k4yeYQTZh1+OGET6jM/jAefUNIzg0ONaYnJeFKY
         fOhSsGP5vYkW0n70BPvvw82Iwjl+u7E2q9VmG3fTRLGaojWkTp7CiG+uXKQT1bdA5mNC
         dL7JblYqH39eYjuYMw2rrGKhzc8M2EznFiM1OW5zbGAQf6UoXZcXomt4hVKyPwUVc470
         6UoslRVXxiqYBp1eh0ZcUlXTYTzbo0xtf50ITYBPJGUnYNyK91Wlnna8h04+7ZiEvx6e
         9kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719311547; x=1719916347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwlILf/vswvcQXQNiD+f6wBVsZ6SMfSlkE3EALaPOOg=;
        b=nQuaacPIw/TpNnTg6j8CixaWZ5qVriPjA8O4NB7j8GYgJ+1mQpi2n5cngPSSuP9KxG
         IBeeYrKDDuq+yfu0RnTYVb3ar19f/EBxKlPlh4ELXN0QmJX2xU2KNzR3LsKHJTfMaSKd
         u2eziVnuBQM1ZQguohGPCcvt2Ut0eYYrIY1THSYUAqSD10O3bEwv1Zg2pdtq//3Q1uun
         z5JPZd4aiIMZs4p3A3ShbMMD9X0SPKrRq+NUC6VWBVgDPnTtIOIOI08VX+i/SGXnNAWD
         xi2Pp4c+TnSGh/fXgZEmYebWsEAUaL+/xaO99jENJ0JJ+VYS1LerCxyeGMPxbwDYZfBd
         oUrA==
X-Forwarded-Encrypted: i=1; AJvYcCVwTTm/4igSQZrdhIVatjUyzhM7Nnenw+xhbJQxnmiNJ9sVrzOUqwkAfXYBsAT+A4TkJ3wICXFuLeJWGpOwU691fuR/dXreczTg+5I=
X-Gm-Message-State: AOJu0YyjFsw5+ctmM5bqZK0QPsxNYE1/mIwzcwk9jWEbOg31JJSouyMa
	hh/K5eBhJk91VesdlohsBv/Bw4OcY6aBskjHsDkWwwQxopR4gN6C
X-Google-Smtp-Source: AGHT+IHDpYG+hLWunvJBAtgghz7RU1rOfdf/y+G3mJ4Hofm9Q9LEuktQaJ5yAE3vHGX7WYR/sLdxZA==
X-Received: by 2002:a05:6512:2083:b0:52c:e040:7d9 with SMTP id 2adb3069b0e04-52ce0680398mr4513835e87.59.1719311546840;
        Tue, 25 Jun 2024 03:32:26 -0700 (PDT)
Received: from pc636 (host-90-233-219-252.mobileonline.telia.com. [90.233.219.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdce71c86sm977460e87.142.2024.06.25.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:32:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 25 Jun 2024 12:32:24 +0200
To: Baoquan He <bhe@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Nick Bowler <nbowler@draconx.ca>,
	Hailong Liu <hailong.liu@oppo.com>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnqcuKt2qrR-wmH3@pc636>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
 <00d74f24-c49c-460e-871c-d5af64701306@draconx.ca>
 <20240621033005.6mccm7waduelb4m5@oppo.com>
 <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>
 <ZnVLbCCkvhf5GaTf@pc636>
 <ZnWICsPgYuBlrWlt@MiWiFi-R3L-srv>
 <Znljtv5n-6EBgpsF@pc636>
 <Zno52QBG0g5Z+otD@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zno52QBG0g5Z+otD@MiWiFi-R3L-srv>

On Tue, Jun 25, 2024 at 11:30:33AM +0800, Baoquan He wrote:
> On 06/24/24 at 02:16pm, Uladzislau Rezki wrote:
> > On Fri, Jun 21, 2024 at 10:02:50PM +0800, Baoquan He wrote:
> > > On 06/21/24 at 11:44am, Uladzislau Rezki wrote:
> > > > On Fri, Jun 21, 2024 at 03:07:16PM +0800, Baoquan He wrote:
> > > > > On 06/21/24 at 11:30am, Hailong Liu wrote:
> > > > > > On Thu, 20. Jun 14:02, Nick Bowler wrote:
> > > > > > > On 2024-06-20 02:19, Nick Bowler wrote:
> > > ......
> > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > index be2dd281ea76..18e87cafbaf2 100644
> > > > > --- a/mm/vmalloc.c
> > > > > +++ b/mm/vmalloc.c
> > > > > @@ -2542,7 +2542,7 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
> > > > >  static struct xarray *
> > > > >  addr_to_vb_xa(unsigned long addr)
> > > > >  {
> > > > > -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > > > +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> > > > >  
> > > > >  	return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > > > >  }
> > > > > 
> > > > The problem i see is about not-initializing of the:
> > > > <snip>
> > > > 	for_each_possible_cpu(i) {
> > > > 		struct vmap_block_queue *vbq;
> > > > 		struct vfree_deferred *p;
> > > > 
> > > > 		vbq = &per_cpu(vmap_block_queue, i);
> > > > 		spin_lock_init(&vbq->lock);
> > > > 		INIT_LIST_HEAD(&vbq->free);
> > > > 		p = &per_cpu(vfree_deferred, i);
> > > > 		init_llist_head(&p->list);
> > > > 		INIT_WORK(&p->wq, delayed_vfree_work);
> > > > 		xa_init(&vbq->vmap_blocks);
> > > > 	}
> > > > <snip>
> > > > 
> > > > correctly or fully. It is my bad i did not think that CPUs in a possible mask
> > > > can be non sequential :-/
> > > > 
> > > > nr_cpu_ids - is not the max possible CPU. For example, in Nick case,
> > > > when he has two CPUs, num_possible_cpus() and nr_cpu_ids are the same.
> > > 
> > > I checked the generic version of setup_nr_cpu_ids(), from codes, they
> > > are different with my understanding.
> > > 
> > > kernel/smp.c
> > > void __init setup_nr_cpu_ids(void)
> > > {
> > >         set_nr_cpu_ids(find_last_bit(cpumask_bits(cpu_possible_mask), NR_CPUS) + 1);
> > > }
> > > 
> > I see that it is not a weak function, so it is generic, thus the
> > behavior can not be overwritten, which is great. This does what we
> > need.
> > 
> > Thank you for checking this you are right!
> 
> Thanks for confirming this.
> 
> > 
> > Then it is just a matter of proper initialization of the hash:
> > 
> > <snip>
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 5d3aa2dc88a8..1733946f7a12 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -5087,7 +5087,13 @@ void __init vmalloc_init(void)
> >          */
> >         vmap_area_cachep = KMEM_CACHE(vmap_area, SLAB_PANIC);
> >  
> > -       for_each_possible_cpu(i) {
> > +       /*
> > +        * We use "nr_cpu_ids" here because some architectures
> > +        * may have "gaps" in cpu-possible-mask. It is OK for
> > +        * per-cpu approaches but is not OK for cases where it
> > +        * can be used as hashes also.
> > +        */
> > +       for (i = 0; i < nr_cpu_ids; i++) {
> 
> I was wrong about earlier comments. Percpu variables are only available
> on possible CPUs. For those nonexistent possible CPUs of static percpu
> variable vmap_block_queue, there isn't memory allocated and mapped for
> them. So accessing into them will cause problem.
> 
> In Nick's case, there are only CPU0, CPU2. If you access
> &per_cpu(vmap_block_queue, 1), problem occurs. So I think we may need to
> change to take other way for vbq. E.g:
> 1) Storing the vb in the nearest neighbouring vbq on possible CPU as
>    below draft patch;
> 2) create an normal array to store vbq of size nr_cpu_ids, then we can
>    store/fetch each vbq on non-possible CPU?
> 
A correct way, i think, is to create a normal array. A quick fix can be
to stick to a next possible CPU.

> The way 1) is simpler, the existing code can be adapted a little just as
> below.
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 633363997dec..59a8951cc6c0 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2542,7 +2542,10 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
>  static struct xarray *
>  addr_to_vb_xa(unsigned long addr)
>  {
> -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> +
> +	if (!cpu_possible(idex))
> +		index = cpumask_next(index, cpu_possible_mask);
>
cpumask_next() can return nr_cpu_ids if no next bits set.

Thanks!

--
Uladzislau Rezki
