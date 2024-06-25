Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B916FF33
	for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 15:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719329644; cv=none; b=uDKpqCSdnVxWXgmFq47qwGGdNUtesV9JxOXOedRkgMAeHCu33LQQK2MTyiTf2tfHDF/9+qZaS3RXwNoKi0N3SH6xh+ZndHTrEeFA0RGp1OuznNePh1Lgwj/jvuB3umAAX5RKq5fmWMNJFBMFU3VaMaaCXTwNxSpOZsvQ0H8R5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719329644; c=relaxed/simple;
	bh=yrSTLdvsNJuOyrIIDeJhSlKNmfKDLtNCQ44eQ4kZF+Q=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlapm5eDirLt5ArprLHSmiqq+usVryF6TegoG0QCPozKJUzXe9/Md7pX+CniIsNotPEvABKCce9hTtH40xNRsljiMdEYZrJxY1XD5/BTuyMrJA7QSd4lU1bTFjdXBA8NWWQkl/fG5KuzipQp0lFtLt22jIwdEBbERVygNXh7Otc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmACvAyP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmACvAyP"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cd87277d8so4012872e87.2
        for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719329640; x=1719934440; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fWL9aq1cdURVir5BADc2ZTz6Xz4eWUl6fxWllepmeqQ=;
        b=TmACvAyP+D/LjOZjDG0sfIKuMpU4tzZ0vCyjdEqPnozBL5DPKMURlvYubgPF2kQpv6
         8dlx0pRZX8RZPytXZKTDbyoa4amwTQSKe7WsQmlCKUNFsSY/al8JM0Dx+NwMZ5k265HB
         Q7E0/PjIVo/XMOUBw3ckW/odtUrPBVTjA3T2B4wBHbQ/btUDCMW/Q2RewlcfrK/I122M
         0+v+ZI5i9H5Kl6ZtZnHEw7LaOpTN/PJxzv2KRJO8jjogWIFoZLSWnpvx2dYiAOMRzZOv
         PB9YM1DDBS9qo6IwKvv2+gzIIZbAEzSg9unMiiWQky5zgYKr4KDFLOQZ8ZxK5otTqRjc
         mGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719329640; x=1719934440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWL9aq1cdURVir5BADc2ZTz6Xz4eWUl6fxWllepmeqQ=;
        b=W8mcEN+2wB38P47IYNA58113uLi7VJxrY9B6zVSJFphiFVEmepIwbh+a7HXxFDzidJ
         omLxZIx1KXzk/EE8i9qxaZ7bPVidrDm1iymbjlK4DjuASgCMT043ntaRh2gYhqyB47BA
         dN3Fmf8PoIvo7KeozyvCDp6Q72XXJ6CifDvKqHL9r9n0D8KVR/8+VD5poOAcLbQ64nIp
         etwvsPbkucN1aDijQurAMIBQo1ZN1o7HTX5ARpoQ0JKt4DxB8yJ1YyrfYAD1LPUjW+au
         RtqC93b3/F0fwCDgta/UwGGDj7trZp9lvByYae7R/Y/jVqtdAW5T+w40h7h8MIXcjqoE
         HqJA==
X-Forwarded-Encrypted: i=1; AJvYcCWc4e8UmJZr1N4Y8R1hcW9BAsvLE8gXnAvo5bTK1aeGIDEqnK0KYcuG29NFnLLKJoivQJxcYBB1EiG1kuBEqOsWon18Q2qIZLLAAt0=
X-Gm-Message-State: AOJu0YztplSpfZx1LrLlxxB4hcNRwxn2L4CMqGZ5t4Gbmby+d9n2bX9f
	80j7/qcbfUblP93UahTY810ax3y6O3YbEfmbmkiHMtS4SdKW75ny
X-Google-Smtp-Source: AGHT+IHnZjnJMconf8H13iDPWZ8xrfkoezsaE3ZY5gP+CacdGRe1jWjN1MqrVToiHaNuNaAbqOT5eQ==
X-Received: by 2002:ac2:5119:0:b0:52c:db52:3cb3 with SMTP id 2adb3069b0e04-52ce183b56bmr4507221e87.39.1719329640074;
        Tue, 25 Jun 2024 08:34:00 -0700 (PDT)
Received: from pc636 (host-90-233-219-252.mobileonline.telia.com. [90.233.219.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cf33265d6sm153493e87.160.2024.06.25.08.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:33:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 25 Jun 2024 17:33:57 +0200
To: Baoquan He <bhe@redhat.com>, Hailong Liu <hailong.liu@oppo.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Nick Bowler <nbowler@draconx.ca>,
	Hailong Liu <hailong.liu@oppo.com>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnrjZRq5-_hemrbD@pc636>
References: <20240621033005.6mccm7waduelb4m5@oppo.com>
 <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>
 <ZnVLbCCkvhf5GaTf@pc636>
 <ZnWICsPgYuBlrWlt@MiWiFi-R3L-srv>
 <Znljtv5n-6EBgpsF@pc636>
 <Zno52QBG0g5Z+otD@MiWiFi-R3L-srv>
 <ZnqcuKt2qrR-wmH3@pc636>
 <ZnqspTVl/76jM9WD@MiWiFi-R3L-srv>
 <Znq6tEtCgB6QnnJH@pc638.lan>
 <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv>

On Tue, Jun 25, 2024 at 09:02:43PM +0800, Baoquan He wrote:
> On 06/25/24 at 02:40pm, Uladzislau Rezki wrote:
> > On Tue, Jun 25, 2024 at 07:40:21PM +0800, Baoquan He wrote:
> > > On 06/25/24 at 12:32pm, Uladzislau Rezki wrote:
> > > > On Tue, Jun 25, 2024 at 11:30:33AM +0800, Baoquan He wrote:
> > > > > On 06/24/24 at 02:16pm, Uladzislau Rezki wrote:
> > > > > > On Fri, Jun 21, 2024 at 10:02:50PM +0800, Baoquan He wrote:
> > > > > > > On 06/21/24 at 11:44am, Uladzislau Rezki wrote:
> > > > > > > > On Fri, Jun 21, 2024 at 03:07:16PM +0800, Baoquan He wrote:
> > > > > > > > > On 06/21/24 at 11:30am, Hailong Liu wrote:
> > > > > > > > > > On Thu, 20. Jun 14:02, Nick Bowler wrote:
> > > > > > > > > > > On 2024-06-20 02:19, Nick Bowler wrote:
> > > > > > > ......
> > > > > > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > > > > > index be2dd281ea76..18e87cafbaf2 100644
> > > > > > > > > --- a/mm/vmalloc.c
> > > > > > > > > +++ b/mm/vmalloc.c
> > > > > > > > > @@ -2542,7 +2542,7 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
> > > > > > > > >  static struct xarray *
> > > > > > > > >  addr_to_vb_xa(unsigned long addr)
> > > > > > > > >  {
> > > > > > > > > -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > > > > > > > +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> > > > > > > > >  
> > > > > > > > >  	return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > > > > > > > >  }
> > > > > > > > > 
> > > > > > > > The problem i see is about not-initializing of the:
> > > > > > > > <snip>
> > > > > > > > 	for_each_possible_cpu(i) {
> > > > > > > > 		struct vmap_block_queue *vbq;
> > > > > > > > 		struct vfree_deferred *p;
> > > > > > > > 
> > > > > > > > 		vbq = &per_cpu(vmap_block_queue, i);
> > > > > > > > 		spin_lock_init(&vbq->lock);
> > > > > > > > 		INIT_LIST_HEAD(&vbq->free);
> > > > > > > > 		p = &per_cpu(vfree_deferred, i);
> > > > > > > > 		init_llist_head(&p->list);
> > > > > > > > 		INIT_WORK(&p->wq, delayed_vfree_work);
> > > > > > > > 		xa_init(&vbq->vmap_blocks);
> > > > > > > > 	}
> > > > > > > > <snip>
> > > > > > > > 
> > > > > > > > correctly or fully. It is my bad i did not think that CPUs in a possible mask
> > > > > > > > can be non sequential :-/
> > > > > > > > 
> > > > > > > > nr_cpu_ids - is not the max possible CPU. For example, in Nick case,
> > > > > > > > when he has two CPUs, num_possible_cpus() and nr_cpu_ids are the same.
> > > > > > > 
> > > > > > > I checked the generic version of setup_nr_cpu_ids(), from codes, they
> > > > > > > are different with my understanding.
> > > > > > > 
> > > > > > > kernel/smp.c
> > > > > > > void __init setup_nr_cpu_ids(void)
> > > > > > > {
> > > > > > >         set_nr_cpu_ids(find_last_bit(cpumask_bits(cpu_possible_mask), NR_CPUS) + 1);
> > > > > > > }
> > > > > > > 
> > > > > > I see that it is not a weak function, so it is generic, thus the
> > > > > > behavior can not be overwritten, which is great. This does what we
> > > > > > need.
> > > > > > 
> > > > > > Thank you for checking this you are right!
> > > > > 
> > > > > Thanks for confirming this.
> > > > > 
> > > > > > 
> > > > > > Then it is just a matter of proper initialization of the hash:
> > > > > > 
> > > > > > <snip>
> > > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > > index 5d3aa2dc88a8..1733946f7a12 100644
> > > > > > --- a/mm/vmalloc.c
> > > > > > +++ b/mm/vmalloc.c
> > > > > > @@ -5087,7 +5087,13 @@ void __init vmalloc_init(void)
> > > > > >          */
> > > > > >         vmap_area_cachep = KMEM_CACHE(vmap_area, SLAB_PANIC);
> > > > > >  
> > > > > > -       for_each_possible_cpu(i) {
> > > > > > +       /*
> > > > > > +        * We use "nr_cpu_ids" here because some architectures
> > > > > > +        * may have "gaps" in cpu-possible-mask. It is OK for
> > > > > > +        * per-cpu approaches but is not OK for cases where it
> > > > > > +        * can be used as hashes also.
> > > > > > +        */
> > > > > > +       for (i = 0; i < nr_cpu_ids; i++) {
> > > > > 
> > > > > I was wrong about earlier comments. Percpu variables are only available
> > > > > on possible CPUs. For those nonexistent possible CPUs of static percpu
> > > > > variable vmap_block_queue, there isn't memory allocated and mapped for
> > > > > them. So accessing into them will cause problem.
> > > > > 
> > > > > In Nick's case, there are only CPU0, CPU2. If you access
> > > > > &per_cpu(vmap_block_queue, 1), problem occurs. So I think we may need to
> > > > > change to take other way for vbq. E.g:
> > > > > 1) Storing the vb in the nearest neighbouring vbq on possible CPU as
> > > > >    below draft patch;
> > > > > 2) create an normal array to store vbq of size nr_cpu_ids, then we can
> > > > >    store/fetch each vbq on non-possible CPU?
> > > > > 
> > > > A correct way, i think, is to create a normal array. A quick fix can be
> > > > to stick to a next possible CPU.
> > > > 
> > > > > The way 1) is simpler, the existing code can be adapted a little just as
> > > > > below.
> > > > > 
> > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > index 633363997dec..59a8951cc6c0 100644
> > > > > --- a/mm/vmalloc.c
> > > > > +++ b/mm/vmalloc.c
> > > > > @@ -2542,7 +2542,10 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
> > > > >  static struct xarray *
> > > > >  addr_to_vb_xa(unsigned long addr)
> > > > >  {
> > > > > -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > > > +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> > > > > +
> > > > > +	if (!cpu_possible(idex))
> > > > > +		index = cpumask_next(index, cpu_possible_mask);
> > > > >
> > > > cpumask_next() can return nr_cpu_ids if no next bits set.
> > > 
> > > It won't. nr_cpu_ids is the largest index + 1, the hashed index will
> > > be:  0 =<  index  <= (nr_cpu_ids - 1) e.g cpu_possible_mask is
> > > b10001111, the nr_cpu_ids is 8, the largest bit is cpu7.
> > > cpu_possible(index) will check that. So the largest bit of cpumask_next()
> > > returns is (nr_cpu_ids - 1).
> > > 
> > /**
> >  * cpumask_next - get the next cpu in a cpumask
> >  * @n: the cpu prior to the place to search (i.e. return will be > @n)
> >  * @srcp: the cpumask pointer
> >  *
> >  * Return: >= nr_cpu_ids if no further cpus set.
> 
> Ah, I got what you mean. In the vbq case, it may not have chance to get
> a return number as nr_cpu_ids. Becuase the hashed index limits the
> range to [0, nr_cpu_ids-1], and cpu_possible(index) will guarantee it
> won't be the highest cpu number [nr_cpu_ids-1] since CPU[nr_cpu_ids-1] must
> be possible CPU.
> 
> Do I miss some corner cases?
> 
Right. We guarantee that a highest CPU is available by doing: % nr_cpu_ids.
So we do not need to use *next_wrap() variant. You do not miss anything :)

Hailong Liu has proposed more simpler version:

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 11fe5ea208aa..e1e63ffb9c57 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1994,8 +1994,9 @@ static struct xarray *
 addr_to_vb_xa(unsigned long addr)
 {
        int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
+       int cpu = cpumask_nth(index, cpu_possible_mask);

-       return &per_cpu(vmap_block_queue, index).vmap_blocks;
+       return &per_cpu(vmap_block_queue, cpu).vmap_blocks;
<snip>

which just takes a next CPU if an index is not set in the cpu_possible_mask.

The only thing that can be updated in the patch is to replace num_possible_cpu()
by the nr_cpu_ids.

Any thoughts? I think we need to fix it by a minor change so it is
easier to back-port on stable kernels.

--
Uladzislau Rezki
