Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C416E899
	for <regressions@lists.linux.dev>; Fri, 21 Jun 2024 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718963057; cv=none; b=dNfZ+0mqYO240ncgMX7gWwoZkNoIZuyjsHxi5/V1FhsibxQgCzyv9NDgHmdYIZzDj5DfhzfzVAenVwI78GCJWWFRLGCdVnYZn/3whm3MOOXHxJmuhuCQTs6VYZWL24hgUQs/u4xK1rr2Om/upASiEuj/YPY42MRVP1EIbMbuzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718963057; c=relaxed/simple;
	bh=c+X4o8yOOqmqqo+T6TcDvzWoDO4BblrQxz4brlJHuSg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuSP4zdSik2Wo6SVJkKwhdlIuhMomGGEFefSw2yMbSMljg8zLYyIeIzg2PEQUR0YXh06VnDPFImtIhsaR5jJsqOJs8I3JB2n7k3MhKNP5B3PEIk6QrZ16ti0iNJL8thzCp0wf1V6imZE+byOO2dyv2UESseDPhzI35rAIE7/A4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3R+qUyc; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3R+qUyc"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f09b457fdso187865966b.2
        for <regressions@lists.linux.dev>; Fri, 21 Jun 2024 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718963054; x=1719567854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YH8HgTmsyYTHd1UBCvXdgm36Yrr0b+GSZnRwwUHMfH4=;
        b=a3R+qUycKCwnS6tYlGMpASuNHrV8zv9PH4lZxfFt0xTYpse5g6Dd0TiTlNJ3r6b+RI
         cpzxzdq7fULSWTPdrI7qk+7z3dIfalopPkubrOaRepG0C0YRR/nNStwZIJpxlUr1be2C
         2BmidTL6B34h1tVJ4PKk7hSOs/jML1CZo6A/FGgQs0+kuAqbIQSN62JDHuLzeanhqHIu
         eZpwEQ7IRZ9nzvmWD5lNbCKuokoQGZ1Q3qiuVEvDPy3/NT1zZHsUyYReZLfQzvdXOeNe
         pvIOG+md2jtYK4dveuZxkHKB/8+xHrQwqcPAu/4ocav6b3Iq2c0zqSompfYNoTfHlrOv
         c/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718963054; x=1719567854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YH8HgTmsyYTHd1UBCvXdgm36Yrr0b+GSZnRwwUHMfH4=;
        b=o2HmHRCNGGe2n6qJSGODACNo1RON/hgv62RDnT6++bXDWSWKzFcz4IPzuiJVMs2xPl
         1qF4PVz2jc1+9eRzKlzeIRBBHzpgNzhS6HM7FCD9s01I7YQdeySSx93h7ORc+00V4pRY
         iX/IQMIoKLDEeca4OHbNnhVkWidJxVjI5fml8Zy5E+UDGRAZgHBMQ9mWEaYKA53bngYE
         DM0/DzpItLsGuRdfqh2nMPLs9vIfOeSZhEmYW7unP2rrsJNgW+uuWi4TD5eOamKCYFeD
         O6P7iz/DwiEhm6z9s3LwfWdR56jEr6pi5odb822f9M0q5l52Njbdo9Ffj9xVa1FTPKW/
         olsA==
X-Forwarded-Encrypted: i=1; AJvYcCW29jm1J4szar9Ys2LbEKJe3tYctg8BeVkh55dmPiNY8keLFXjTR25FfgL+pQpetiYE7VpDx6ZRFHTotyzfq2hxSQBORzx/0FoE/r0=
X-Gm-Message-State: AOJu0Yz6MyzIN6+pYtwej8F1VnSq/Enc4ncvWXRbdU8sE30RN9CABivi
	i6gyxfWiR6RtRyXOYJQMj6OHFpVhXHCST+flsR0mcUj3YG3J++ro
X-Google-Smtp-Source: AGHT+IHFvIYFRPxClWRA8y4JLBhyArN9ZGGm2+KYv28v2EmS+G6m3eLsRivYBY4rUA6LGQZV4cbFow==
X-Received: by 2002:a17:907:a602:b0:a6f:5efb:5c8 with SMTP id a640c23a62f3a-a6fab6088e7mr596883766b.9.1718963054027;
        Fri, 21 Jun 2024 02:44:14 -0700 (PDT)
Received: from pc636 (176-227-201-31.ftth.glasoperator.nl. [31.201.227.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b17esm64261166b.88.2024.06.21.02.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:44:13 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 21 Jun 2024 11:44:12 +0200
To: Baoquan He <bhe@redhat.com>, Nick Bowler <nbowler@draconx.ca>
Cc: Hailong Liu <hailong.liu@oppo.com>, Nick Bowler <nbowler@draconx.ca>,
	linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnVLbCCkvhf5GaTf@pc636>
References: <75e17b57-1178-4288-b792-4ae68b19915e@draconx.ca>
 <00d74f24-c49c-460e-871c-d5af64701306@draconx.ca>
 <20240621033005.6mccm7waduelb4m5@oppo.com>
 <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnUmpMbCBFWnvaEz@MiWiFi-R3L-srv>

On Fri, Jun 21, 2024 at 03:07:16PM +0800, Baoquan He wrote:
> On 06/21/24 at 11:30am, Hailong Liu wrote:
> > On Thu, 20. Jun 14:02, Nick Bowler wrote:
> > > On 2024-06-20 02:19, Nick Bowler wrote:
> > > > After upgrading my sparc to 6.9.5 I noticed that attempting to run
> > > > xfsdump instantly (within a couple seconds) and reliably crashes the
> > > > kernel.  The same problem is also observed on 6.10-rc4.
> > > [...]
> > > >   062eacf57ad91b5c272f89dc964fd6dd9715ea7d is the first bad commit
> > > >   commit 062eacf57ad91b5c272f89dc964fd6dd9715ea7d
> > > >   Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > > >   Date:   Thu Mar 30 21:06:38 2023 +0200
> > > >
> > > >       mm: vmalloc: remove a global vmap_blocks xarray
> > >
> > > I think I might see what is happening here.
> > >
> > > On this machine, there are two CPUs numbered 0 and 2 (there is no CPU1).
> > >
> > +Baoquan
> 
> Thanks for adding me, Hailong.
> 
> > 
> > Ahh, I thought you are right. addr_to_vb_xa assume that the CPU numbers are
> > contiguous. I don't have knowledge about CPU at all.
> > Technically change the implement addr_to_vb_xa() to
> > return &per_cpu(vmap_block_queue, raw_smp_processor_id()).vmap_blocks;
> > would also work, but it violate the load balance. Wating for
> > experts reply.
> 
> Yeah, I think so as you explained.
> 
> > 
> > > The per-cpu variables in mm/vmalloc.c are initialized like this, in
> > > vmalloc_init
> > >
> > >   for_each_possible_cpu(i) {
> > >     /* ... */
> > >     vbq = &per_cpu(vmap_block_queue, i);
> > >     /* initialize stuff in vbq */
> > >   }
> > >
> > > This loops over the set bits of cpu_possible_mask, bits 0 and 2 are set,
> > > so it initializes stuff with i=0 and i=2, skipping i=1 (I added prints to
> > > confirm this).
> > >
> > > Then, in vm_map_ram, with the problematic change it calls the new
> > > function addr_to_vb_xa, which does this:
> > >
> > >   int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > >   return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > >
> > > The num_possible_cpus() function counts the number of set bits in
> > > cpu_possible_mask, so it returns 2.  Thus, index is either 0 or 1, which
> > > does not correspond to what was initialized (0 or 2).  The crash occurs
> > > when the computed index is 1 in this function.  In this case, the
> > > returned value appears to be garbage (I added prints to confirm this).
> 
> This is a great catch. 
> 
Indeed :)

> > >
> > > If I change addr_to_vb_xa function to this:
> > >
> > >   int index = ((addr / VMAP_BLOCK_SIZE) & 1) << 1; /* 0 or 2 */
> > >   return &per_cpu(vmap_block_queue, index).vmap_blocks;
> 
> Yeah, while above change is not generic, e.g if it's CPU0 and CPU3.
> I think we should take the max possible CPU number as the hush bucket
> size. The vb->va is also got from global free_vmap_area, so no need to
> worry about the waste.
>
Agree.

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index be2dd281ea76..18e87cafbaf2 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2542,7 +2542,7 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
>  static struct xarray *
>  addr_to_vb_xa(unsigned long addr)
>  {
> -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
>  
>  	return &per_cpu(vmap_block_queue, index).vmap_blocks;
>  }
> 
The problem i see is about not-initializing of the:
<snip>
	for_each_possible_cpu(i) {
		struct vmap_block_queue *vbq;
		struct vfree_deferred *p;

		vbq = &per_cpu(vmap_block_queue, i);
		spin_lock_init(&vbq->lock);
		INIT_LIST_HEAD(&vbq->free);
		p = &per_cpu(vfree_deferred, i);
		init_llist_head(&p->list);
		INIT_WORK(&p->wq, delayed_vfree_work);
		xa_init(&vbq->vmap_blocks);
	}
<snip>

correctly or fully. It is my bad i did not think that CPUs in a possible mask
can be non sequential :-/

nr_cpu_ids - is not the max possible CPU. For example, in Nick case,
when he has two CPUs, num_possible_cpus() and nr_cpu_ids are the same.

Or i missed something in your patch, Baoquan?

--
Uladzislau Rezki
