Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2000D139D04
	for <regressions@lists.linux.dev>; Wed, 26 Jun 2024 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402329; cv=none; b=pFzmU8RAnHQRk0o+VKt1Y/G6R49BlCanGwm+CIb9pIgpp9Z55uEUYvkA+WyKjTyooYP20o/qhl7c28gFAdbEXmUv7+aSTljJ5JxjlkxKGdPL9ncI9kcwTI9kgcofQGGaGJFEV0BX4S4hkO4zU5kxIfdEjsQ7w+qs2s6oIJvVE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402329; c=relaxed/simple;
	bh=Ucj8L8gxWcHK9Ky92t58zvkXENzfV/CLBFLlRxUMRtk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmMiYd8aNzszQog/cBzLUiu6r4cq35d0QD3kTsjALspfzooQZHAPR2ntsqdTn+eQLK1dqr5vzdaGU0IZFwybadPbONb5RcCqlNK8npKL8PYasvMohe3hKTE2OUJvM2ihA7tUhUkaKmbrVPBoQdAvnQyrdvfkIcEFrMPMyIU0S0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O30thTFA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O30thTFA"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee6eso147717a12.1
        for <regressions@lists.linux.dev>; Wed, 26 Jun 2024 04:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719402326; x=1720007126; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FtIudqgscH1tmYZ80Jw6C5/Pb0juTqicPUasIrRpqJY=;
        b=O30thTFAJAtDhLKiS7x1COOwElzj8exuNkuO1qP7SbKpi7GzsvCJkwuvoyEpKj+WEA
         wKMWuG6BvyIF/sMhhn82JxFrL6QO4pg0l0NwNZFkwhX6VAaMY4Q/7+2F2j/BZx5PP2pD
         51IZg53nJIPl758IherShMkOW2ygrFHnnE7sgP9q6aWgfxVXxuvhHwb0E5WWXexxok3R
         N0lKZF5ZCLzR/QgeuXHEdx1fdr0E4yILbaP43FCqcHV70hMoUrmS8gF5MHtax79bMedq
         B0dOiLxoqbw6J92QLVgFwydUBSiVE4PuAy2+qLrk5FtZ2pBHCzsvFdooOAJ4GqhtpCbj
         H+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402326; x=1720007126;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtIudqgscH1tmYZ80Jw6C5/Pb0juTqicPUasIrRpqJY=;
        b=Xlqyrf2hRt4lpkNi4KE7Ugiyj67PXvtu9OpYDUFppfPu1d2ArbSLkn6XqjMzIwXB0Z
         w8owQi/5+K24MAxeb+k2NRpXn7EeY1K0IcO/ViK2zKhsony1FQdyke//xfeAnHENCsL+
         mQI+nRtC8iIySqMAiTKFa7/5qGjIm3WjMfBh3Dk05Xti7ixm4bw2bDddG1W8lyOu5v1Z
         S706KcgDZTmW6lBeovHry/0Wtx9I3dENpzXiIJgnux7xO3/AkFnVh0s4MDa7kXAEGK4w
         f6wSAVSPmiUEFuF6fvcOXqXqNg5WwrxvpTpUDz+gq5fZ8vcczAs8nJ1GVOO9YpUtozik
         wU1w==
X-Forwarded-Encrypted: i=1; AJvYcCVyzz5xxUc+QFSA7GAtgIdQNrIfihAlb4sHWkci0qgmS5+NEQt3kFca34O5GqUgUMCdY56b8r+/7h+KkYv9nYmG63zxDGUi5Su1vkU=
X-Gm-Message-State: AOJu0YwHslhuYrW9nNyrNrUePCp+alKvOHFEC1mWyyTRGK9Qhz4s5DBK
	aX8j8cd8qdxQiDCC2pTd2cUOQ95p3qmET87YoABgIrUBWFPLH1VM
X-Google-Smtp-Source: AGHT+IG6GDqMRzNCz++Fc2S1dNLryT/7sfAReEErY8zDzCYcNLhwGyQs5luxS5bcQEnXEIZw4svCRg==
X-Received: by 2002:a05:6402:34c6:b0:57d:45af:112c with SMTP id 4fb4d7f45d1cf-57d45af127amr10658219a12.4.1719402326149;
        Wed, 26 Jun 2024 04:45:26 -0700 (PDT)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-582c51c9ac9sm1366295a12.58.2024.06.26.04.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 04:45:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Wed, 26 Jun 2024 13:45:24 +0200
To: Hailong Liu <hailong.liu@oppo.com>
Cc: Baoquan He <bhe@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
	Nick Bowler <nbowler@draconx.ca>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <Znv_VC42-Av18nKb@pc638.lan>
References: <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv>
 <ZnrjZRq5-_hemrbD@pc636>
 <ZnrnADHvOiNcZv9t@MiWiFi-R3L-srv>
 <Znr1IQ1mssdNNXbv@pc638.lan>
 <ZnsjIB2byIxSgbjc@pc636>
 <20240626051206.mx2r4iy3wpexykay@oppo.com>
 <ZnvcToH1h-sVtikh@pc636>
 <20240626100342.2dudj6fjjx6srban@oppo.com>
 <ZnvytLzoLrVwymXv@MiWiFi-R3L-srv>
 <20240626113039.a2rvjarq6zbrgjis@oppo.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626113039.a2rvjarq6zbrgjis@oppo.com>

On Wed, Jun 26, 2024 at 07:30:39PM +0800, Hailong Liu wrote:
> On Wed, 26. Jun 18:51, Baoquan He wrote:
> > On 06/26/24 at 06:03pm, Hailong Liu wrote:
> > > On Wed, 26. Jun 11:15, Uladzislau Rezki wrote:
> > > > On Wed, Jun 26, 2024 at 01:12:06PM +0800, Hailong Liu wrote:
> > > > > On Tue, 25. Jun 22:05, Uladzislau Rezki wrote:
> > > > > > > > > > > /**
> > > > > > > > > > >  * cpumask_next - get the next cpu in a cpumask
> > > > > > > > > > >  * @n: the cpu prior to the place to search (i.e. return will be > @n)
> > > > > > > > > > >  * @srcp: the cpumask pointer
> > > > > > > > > > >  *
> > > > > > > > > > >  * Return: >= nr_cpu_ids if no further cpus set.
> > > > > > > > > >
> > > > > > > > > > Ah, I got what you mean. In the vbq case, it may not have chance to get
> > > > > > > > > > a return number as nr_cpu_ids. Becuase the hashed index limits the
> > > > > > > > > > range to [0, nr_cpu_ids-1], and cpu_possible(index) will guarantee it
> > > > > > > > > > won't be the highest cpu number [nr_cpu_ids-1] since CPU[nr_cpu_ids-1] must
> > > > > > > > > > be possible CPU.
> > > > > > > > > >
> > > > > > > > > > Do I miss some corner cases?
> > > > > > > > > >
> > > > > > > > > Right. We guarantee that a highest CPU is available by doing: % nr_cpu_ids.
> > > > > > > > > So we do not need to use *next_wrap() variant. You do not miss anything :)
> > > > > > > > >
> > > > > > > > > Hailong Liu has proposed more simpler version:
> > > > > > > > >
> > > > > > > > > <snip>
> > > > > > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > > > > > index 11fe5ea208aa..e1e63ffb9c57 100644
> > > > > > > > > --- a/mm/vmalloc.c
> > > > > > > > > +++ b/mm/vmalloc.c
> > > > > > > > > @@ -1994,8 +1994,9 @@ static struct xarray *
> > > > > > > > >  addr_to_vb_xa(unsigned long addr)
> > > > > > > > >  {
> > > > > > > > >         int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > > > > > > > +       int cpu = cpumask_nth(index, cpu_possible_mask);
> > > > > > > > >
> > > > > > > > > -       return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > > > > > > > > +       return &per_cpu(vmap_block_queue, cpu).vmap_blocks;
> > > > > > > > > <snip>
> > > > > > > > >
> > > > > > > > > which just takes a next CPU if an index is not set in the cpu_possible_mask.
> > > > > > > > >
> > > > > > > > > The only thing that can be updated in the patch is to replace num_possible_cpu()
> > > > > > > > > by the nr_cpu_ids.
> > > > > > > > >
> > > > > > > > > Any thoughts? I think we need to fix it by a minor change so it is
> > > > > > > > > easier to back-port on stable kernels.
> > > > > > > >
> > > > > > > > Yeah, sounds good since the regresson commit is merged in v6.3.
> > > > > > > > Please feel free to post this and the hash array patch separately for
> > > > > > > > formal reviewing.
> > > > > > > >
> > > > > > > Agreed! The patch about hash array i will post later.
> G> > > > > >
> > > > > > > > By the way, when I am replying this mail, I check the cpumask_nth()
> > > > > > > > again. I doubt it may take more checking then cpu_possible(), given most
> > > > > > > > of systems don't have gaps in cpu_possible_mask. I could be dizzy at
> > > > > > > > this moment.
> > > > > > > >
> > > > > > > > static inline unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
> > > > > > > > {
> > > > > > > >         return find_nth_bit(cpumask_bits(srcp), small_cpumask_bits, cpumask_check(cpu));
> > > > > > > > }
> > > > > > > >
> > > > > > > Yep, i do not think it is a big problem based on your noted fact.
> > > > > > >
> > > > > > Checked. There is a difference:
> > > > > >
> > > > > > 1. Default
> > > > > >
> > > > > > <snip>
> > > > > > ...
> > > > > > +   15.95%     6.05%  [kernel]        [k] __vmap_pages_range_noflush
> > > > > > +   15.91%     1.74%  [kernel]        [k] addr_to_vb_xa <---------------
> > > > > > +   15.13%    12.05%  [kernel]        [k] vunmap_p4d_range
> > > > > > +   14.17%    13.38%  [kernel]        [k] __find_nth_bit <--------------
> > > > > > +   10.62%     0.00%  [kernel]        [k] ret_from_fork_asm
> > > > > > +   10.62%     0.00%  [kernel]        [k] ret_from_fork
> > > > > > +   10.62%     0.00%  [kernel]        [k] kthread
> > > > > > ...
> > > > > > <snip>
> > > > > >
> > > > > > 2. Check if cpu_possible() and then fallback to cpumask_nth() if not
> > > > > >
> > > > > > <snip>
> > > > > > ...
> > > > > > +    6.84%     0.29%  [kernel]          [k] alloc_vmap_area
> > > > > > +    6.80%     6.70%  [kernel]          [k] native_queued_spin_lock_slowpath
> > > > > > +    4.24%     0.09%  [kernel]          [k] free_vmap_block
> > > > > > +    2.41%     2.38%  [kernel]          [k] addr_to_vb_xa <-----------
> > > > > > +    1.94%     1.91%  [kernel]          [k] xas_start
> > > > > > ...
> > > > > > <snip>
> > > > > >
> > > > > > It is _worth_ to check if an index is in possible mask:
> > > > > >
> > > > > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > > > > index 45e1506d58c3..af20f78c2cbf 100644
> > > > > > --- a/mm/vmalloc.c
> > > > > > +++ b/mm/vmalloc.c
> > > > > > @@ -2542,7 +2542,10 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
> > > > > >  static struct xarray *
> > > > > >  addr_to_vb_xa(unsigned long addr)
> > > > > >  {
> > > > > > -       int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > > > > +       int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> > > > > IIUC, use nr_cpu_ids here maybe incorrect.
> > > > >
> > > > > take b101 as example, nr_cpu_ids is 3. if index is 2 cpumask_nth(2, cpu_possible_mask);
> > > > > might return 64.
> > > > >
> > > > But then a CPU2 becomes possible? Cutting by % nr_cpu_ids generates values < nr_cpu_ids.
> > > > So, last CPU is always possible and we never do cpumask_nth() on a last possible CPU.
> > > >
> > > > What i miss here?
> > > >
> > > Sorry, I forget to reply to all :), I write a demo to test as follows:
> > >
> > > static int cpumask_init(void)
> > > {
> > >        struct cpumask mask;
> > >        unsigned int cpu_id;
> > >        cpumask_clear(&mask);
> > >
> > >        cpumask_set_cpu(1, &mask);
> > >        cpumask_set_cpu(3, &mask);
> > >        cpumask_set_cpu(5, &mask);
> > >
> > >        cpu_id = find_last_bit(cpumask_bits(&mask), NR_CPUS) + 1;
> > >        pr_info("cpu_id:%d\n", cpu_id);
> > >
> > >        for (; i < nr_cpu_ids; i++) {
> > >                pr_info("%d: cpu_%d\n", i, cpumask_nth(i, &mask));
> > >        }
> > >
> > >        return 0;
> > > }
> > >
> > > [    1.337020][    T1] cpu_id:6
> > > [    1.337338][    T1] 0: cpu_1
> > > [    1.337558][    T1] 1: cpu_3
> > > [    1.337751][    T1] 2: cpu_5
> > > [    1.337960][    T1] 3: cpu_64
> > > [    1.338183][    T1] 4: cpu_64
> > > [    1.338387][    T1] 5: cpu_64
> > > [    1.338594][    T1] 6: cpu_64
> > >
> > > In summary, the nr_cpu_ids = last_bit + 1, and cpumask_nth() return the nth cpu_id.
> >
> > I think just using below change for a quick fix is enough. It doesn't
> > have the issue cpumask_nth() has and very simple. For most of systems,
> > it only adds an extra cpu_possible(idex) checking.
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 633363997dec..59a8951cc6c0 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -2542,7 +2542,10 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
> >  static struct xarray *
> >  addr_to_vb_xa(unsigned long addr)
> >  {
> > -	int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > +	int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
> > +
> > +	if (!cpu_possible(idex))
> > +		index = cpumask_next(index, cpu_possible_mask);
> >
> >  	return &per_cpu(vmap_block_queue, index).vmap_blocks;
> >  }
> >
> Agreed! This is a very simple solution.
> 
> If cpumask is b1000001, addresses being distributed across different
> CPUs could theoretically lead to such a situation, but it has not been
> encountered in practice. I’m just pointing out the possibility here.
> 
>   CPU_0  CPU_6  CPU_6  CPU_6  CPU_6  CPU_6
>     |      |      |      |      |      |
>     V      V      V      V      V      V
> 0     10     20     30     40     50     60
> |------|------|------|------|------|------|..
> 
Right!

>
> Thanks again for your reply, I learned a lot.
> 
Thank you for helping :)

--
Uladzislau Rezki
