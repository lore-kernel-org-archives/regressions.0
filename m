Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801017622E
	for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334183; cv=none; b=uel2hIUNRwLdBW1tZFjgkuzB9EMPjTkckgEnceQfE+rQrSK03XyPdEzHc4AWYk1hjHv0ORPHDngbpqZHzS3I+ZBg05NRk/FsSTcB7AOWZ55hDrwEavJZ9AqlWYN8xnm6o0klrmZsjXLiCRuexdN5adch7pyw9TH1SPIWx9/uSbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334183; c=relaxed/simple;
	bh=9/N/lZxSE7O6j9KicH3kaHG+FZylOMFwRNg/yBKCloI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/v+lqG5yUddk2yf6ibfNHkxfcs+xwagH+jCvNhOWk0Eu51Px+1z0SOniKRi8RVyCl2zHhdwQ33L0AT00gT8IzpVjB4+GZzwmeZjk/hvatz5u2pP26HS4UP8ZE6rvJd0KQ83khBjagQeK7cL+tvv/DlFNN8VdhauwTjFb1j78gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXoEeGv5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXoEeGv5"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6cb130027aso388197266b.2
        for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 09:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719334180; x=1719938980; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8tcHw7piGXCwRcIpKZBGAUeAPhX7LMHTxD2UwRCUME=;
        b=aXoEeGv5CLahnb7tyLBfLqviiJdsVgupTOExsfM9umYrMMMlz7BLdNLn69f64npjEM
         ZOQwaP5/0RsvKaJqegDcM8xk0KBTUaqtjwB8JKD+StuOZxH5mxuP1Sh1vL+DD1yH/+pC
         HybHPKhAS7CUpbez653auCRE5RZdHepu+W9Vc/wQpvorP3Q3HT6aSJJfKHoM6hFVcUND
         3las8aaALj9yfLEvEbB/T/MP8C31DqrDtlgPuKdQIkyjUROjKY9nLmFTZThfoYl75C1c
         uWd+QNJIUdSVqusjHjlun585vDBCoawFFLBH5d9/lj+SEe8N92xu7kK5dGYdSZA0pJZb
         uomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334180; x=1719938980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8tcHw7piGXCwRcIpKZBGAUeAPhX7LMHTxD2UwRCUME=;
        b=K9EA8Yjv6kX0OGAwsjTbcDPaKo93rC2s/2JLG3GTLhOdBXp7KYqkyrDfuSY+3g9L36
         e5Tfv5KFNgvqAiWRr/Tyz5iMdG5H3VQhKswq+MRfbuYPpH394RZ06y9fstYzHMydy1Qo
         NXKOls8EaaQ6HliUNKbGntSONIaQ4wx1M+fJe5Nq2hSa4Ds7d0mA2NVinY8zRo9LcGbD
         LVWUPyKR/M9KVGKyXwpImNCkUhuBT9pNuYy74pZ6sGN8irh6tWMspi8aJhiJiMkEr2G0
         KsGjsZJzNWSrXdPsNr7va3brqjQb54uXMydIWZGqeBQtFtJs9OL6uD6BiqNEfP88zPmQ
         k8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW2hA2VLbpuXNpnuNo6puNRSScSRR+wismjLaA/MK2KkS9t0plJSZGIKO/nPcpLivzHz/B8g31UotEbuTXtLJ67NVzgeqtmp73xefs=
X-Gm-Message-State: AOJu0Yw/Kg8yZHwORL1YUoZIs/KZjFeDPL21dgXeqN7ys3Hft2D0K7Mg
	MdrRjjRhTZ1Zkk3dwDFeVdEnec009tb8MXU/Tl7Pvoy2EqjXaz0U
X-Google-Smtp-Source: AGHT+IG1iYnAnB1dQfk+8aYmQF2ecfD43JBj0FrCqW8RDRv+XN+QynXr42cGTxWqNwxe8YLLOqAPmw==
X-Received: by 2002:a50:ab5b:0:b0:57d:2659:9143 with SMTP id 4fb4d7f45d1cf-57d4bde078cmr6401540a12.37.1719334180082;
        Tue, 25 Jun 2024 09:49:40 -0700 (PDT)
Received: from pc638.lan (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30583e93sm6095989a12.96.2024.06.25.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:49:39 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Tue, 25 Jun 2024 18:49:37 +0200
To: Nick Bowler <nbowler@draconx.ca>
Cc: Uladzislau Rezki <urezki@gmail.com>, Hailong Liu <hailong.liu@oppo.com>,
	Nick Bowler <nbowler@draconx.ca>, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <Znr1IQ1mssdNNXbv@pc638.lan>
References: <ZnVLbCCkvhf5GaTf@pc636>
 <ZnWICsPgYuBlrWlt@MiWiFi-R3L-srv>
 <Znljtv5n-6EBgpsF@pc636>
 <Zno52QBG0g5Z+otD@MiWiFi-R3L-srv>
 <ZnqcuKt2qrR-wmH3@pc636>
 <ZnqspTVl/76jM9WD@MiWiFi-R3L-srv>
 <Znq6tEtCgB6QnnJH@pc638.lan>
 <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv>
 <ZnrjZRq5-_hemrbD@pc636>
 <ZnrnADHvOiNcZv9t@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnrnADHvOiNcZv9t@MiWiFi-R3L-srv>

> > > > /**
> > > >  * cpumask_next - get the next cpu in a cpumask
> > > >  * @n: the cpu prior to the place to search (i.e. return will be > @n)
> > > >  * @srcp: the cpumask pointer
> > > >  *
> > > >  * Return: >= nr_cpu_ids if no further cpus set.
> > > 
> > > Ah, I got what you mean. In the vbq case, it may not have chance to get
> > > a return number as nr_cpu_ids. Becuase the hashed index limits the
> > > range to [0, nr_cpu_ids-1], and cpu_possible(index) will guarantee it
> > > won't be the highest cpu number [nr_cpu_ids-1] since CPU[nr_cpu_ids-1] must
> > > be possible CPU.
> > > 
> > > Do I miss some corner cases?
> > > 
> > Right. We guarantee that a highest CPU is available by doing: % nr_cpu_ids.
> > So we do not need to use *next_wrap() variant. You do not miss anything :)
> > 
> > Hailong Liu has proposed more simpler version:
> > 
> > <snip>
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 11fe5ea208aa..e1e63ffb9c57 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -1994,8 +1994,9 @@ static struct xarray *
> >  addr_to_vb_xa(unsigned long addr)
> >  {
> >         int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > +       int cpu = cpumask_nth(index, cpu_possible_mask);
> > 
> > -       return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > +       return &per_cpu(vmap_block_queue, cpu).vmap_blocks;
> > <snip>
> > 
> > which just takes a next CPU if an index is not set in the cpu_possible_mask.
> > 
> > The only thing that can be updated in the patch is to replace num_possible_cpu()
> > by the nr_cpu_ids.
> > 
> > Any thoughts? I think we need to fix it by a minor change so it is
> > easier to back-port on stable kernels.
> 
> Yeah, sounds good since the regresson commit is merged in v6.3.
> Please feel free to post this and the hash array patch separately for
> formal reviewing.
> 
Agreed! The patch about hash array i will post later.

> By the way, when I am replying this mail, I check the cpumask_nth()
> again. I doubt it may take more checking then cpu_possible(), given most
> of systems don't have gaps in cpu_possible_mask. I could be dizzy at
> this moment.
> 
> static inline unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
> {
>         return find_nth_bit(cpumask_bits(srcp), small_cpumask_bits, cpumask_check(cpu));
> }
> 
Yep, i do not think it is a big problem based on your noted fact.

Nick, could you please test your machine with below change?

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 45e1506d58c3..5458fd2290cf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2542,9 +2542,10 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
 static struct xarray *
 addr_to_vb_xa(unsigned long addr)
 {
-       int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
+       int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
+       int cpu = cpumask_nth(index, cpu_possible_mask);

-       return &per_cpu(vmap_block_queue, index).vmap_blocks;
+       return &per_cpu(vmap_block_queue, cpu).vmap_blocks;
 }

 /*
<snip>

Thank you in advance!

--
Uladzislau Rezki
