Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C017D361
	for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719345958; cv=none; b=nG4zrXpMtolQ3ayGVQl+y1pgBkK3QL3kAdgwGEtwWNHRcpk8lfjempF3dVjdXPmKBArBXM8RxArexWS+4IZAYwdozglTZ5F+wq7oqQSL5TVImEttafck0CxjzQFDV1faOqhE44I3PMvY0HN938jeWSKkvr0yG//wmCXssV8ddCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719345958; c=relaxed/simple;
	bh=Ouq7UI8r4c/t7O7KVPhqjulOtPMRqxtv7cqfp4ThtPM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLH5RZP5lBJdUBROjSk2K1PC9WwHeJ0h8Stu5GXuaQyvzxHOV76YKQ4bctun9xHPboSGbw6fokyYZUKIiCPUh926ZXm7S5abrOfCcaRplP0HIyKaSdL4+X+adfFRcglHBeA/7uhZVWi5Hu0omilP2OxS5g2If1Psk+nyuUj3bPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHZSW7Be; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHZSW7Be"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52caebc6137so5641111e87.0
        for <regressions@lists.linux.dev>; Tue, 25 Jun 2024 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719345954; x=1719950754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2J4hGqbcUzUN0UCwy+GvYQrnL7nzLlsNWsttcQw1Uqw=;
        b=gHZSW7Be5aBa1w8d8bzOju2ls9/6/bpKe18ao1SD03jIkvmBZp2xWSTX7PyBNWPgCP
         qyruLnh2B2Qtx62SAa3uCsdXKjIxKZpLq9yc7kvnblPApn5sMRFw2GCnZSlC7f/01eAc
         PJhxZ1gUuKwUUA6rlB3U9UDSrlreIVjw4chZl7oAZ8GBwb9WY9tQgcjSEdbzBjTVzAkh
         CyGVFf/Q2X6Ms3tOB0+z0hS9nydhFIm7lG0E9TYCnKcKufuED6xDg/MyIB6qMDfvfrxt
         VuCWzfl56Rr6kKP4lwThnQb1CZAqBILZBe/pHZyyFThzH4ME//gmKn2onbARVv7moTny
         LYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719345954; x=1719950754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J4hGqbcUzUN0UCwy+GvYQrnL7nzLlsNWsttcQw1Uqw=;
        b=F6nN8z1o/6dUdvwSwQwauw8X2ne28KfAgfHCP5B/ga/iL7jztq3xKLszqgIa6gPbaw
         gfR2DQL5TQhIjkuSlxWQ+WFzVX/INa0g8/BT4oBqaXeq1CF4Nli/1m4GxjdA97FOt5fJ
         V/OspJUDNV5NLzJh9zLw3swncBbKBj+MFyJrGAR0sAIu56Y901V81qs5mqmRqn4GeYX4
         /k1jOsoWYFqWmSxFeQYgsn8fXq59ytV5/GSXGOws7UyN9fC/eksf67bTfi1+K3xAPhPS
         d2lxsbBwcZZd67DZflao3u2sFa3CLSCR/HB1XM8xovn7T4dUnVxy9CFDaiQWrcq23fHc
         oE3g==
X-Forwarded-Encrypted: i=1; AJvYcCVNnxfy3+JfoBRiXF84lB/IEWlT+00zk71ftKBshs3//TP+C1lNUmosdAg3dGlmCTKlEiT9fewl3FKvQ1g11VgY2tcSj6JHa4Lm00c=
X-Gm-Message-State: AOJu0YxnTlebxkvt2fNXlySddL5EDQ5lJ2nteIO3yFl695ydgnHFX4Wb
	EwAdQMb4P9JV696bI96IehGJt0sdvQi415KQblrC59iPKVh7MAFc
X-Google-Smtp-Source: AGHT+IGRklP8XrpFFDL63kjNNjIm7656v8ToUlPmmfs60nq9WNExmpGsQL6esjys/LPNfYORPh2NXA==
X-Received: by 2002:ac2:528c:0:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-52ce18350e0mr4502213e87.16.1719345954075;
        Tue, 25 Jun 2024 13:05:54 -0700 (PDT)
Received: from pc636 (host-185-121-47-193.sydskane.nu. [185.121.47.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe5e27995sm416499666b.0.2024.06.25.13.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 13:05:53 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 25 Jun 2024 22:05:52 +0200
To: Baoquan He <bhe@redhat.com>
Cc: Nick Bowler <nbowler@draconx.ca>, Hailong Liu <hailong.liu@oppo.com>,
	linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-mm@kvack.org, sparclinux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: PROBLEM: kernel crashes when running xfsdump since ~6.4
Message-ID: <ZnsjIB2byIxSgbjc@pc636>
References: <ZnWICsPgYuBlrWlt@MiWiFi-R3L-srv>
 <Znljtv5n-6EBgpsF@pc636>
 <Zno52QBG0g5Z+otD@MiWiFi-R3L-srv>
 <ZnqcuKt2qrR-wmH3@pc636>
 <ZnqspTVl/76jM9WD@MiWiFi-R3L-srv>
 <Znq6tEtCgB6QnnJH@pc638.lan>
 <Znq/8/HAc/0p6Ja0@MiWiFi-R3L-srv>
 <ZnrjZRq5-_hemrbD@pc636>
 <ZnrnADHvOiNcZv9t@MiWiFi-R3L-srv>
 <Znr1IQ1mssdNNXbv@pc638.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znr1IQ1mssdNNXbv@pc638.lan>

> > > > > /**
> > > > >  * cpumask_next - get the next cpu in a cpumask
> > > > >  * @n: the cpu prior to the place to search (i.e. return will be > @n)
> > > > >  * @srcp: the cpumask pointer
> > > > >  *
> > > > >  * Return: >= nr_cpu_ids if no further cpus set.
> > > > 
> > > > Ah, I got what you mean. In the vbq case, it may not have chance to get
> > > > a return number as nr_cpu_ids. Becuase the hashed index limits the
> > > > range to [0, nr_cpu_ids-1], and cpu_possible(index) will guarantee it
> > > > won't be the highest cpu number [nr_cpu_ids-1] since CPU[nr_cpu_ids-1] must
> > > > be possible CPU.
> > > > 
> > > > Do I miss some corner cases?
> > > > 
> > > Right. We guarantee that a highest CPU is available by doing: % nr_cpu_ids.
> > > So we do not need to use *next_wrap() variant. You do not miss anything :)
> > > 
> > > Hailong Liu has proposed more simpler version:
> > > 
> > > <snip>
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 11fe5ea208aa..e1e63ffb9c57 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -1994,8 +1994,9 @@ static struct xarray *
> > >  addr_to_vb_xa(unsigned long addr)
> > >  {
> > >         int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
> > > +       int cpu = cpumask_nth(index, cpu_possible_mask);
> > > 
> > > -       return &per_cpu(vmap_block_queue, index).vmap_blocks;
> > > +       return &per_cpu(vmap_block_queue, cpu).vmap_blocks;
> > > <snip>
> > > 
> > > which just takes a next CPU if an index is not set in the cpu_possible_mask.
> > > 
> > > The only thing that can be updated in the patch is to replace num_possible_cpu()
> > > by the nr_cpu_ids.
> > > 
> > > Any thoughts? I think we need to fix it by a minor change so it is
> > > easier to back-port on stable kernels.
> > 
> > Yeah, sounds good since the regresson commit is merged in v6.3.
> > Please feel free to post this and the hash array patch separately for
> > formal reviewing.
> > 
> Agreed! The patch about hash array i will post later.
> 
> > By the way, when I am replying this mail, I check the cpumask_nth()
> > again. I doubt it may take more checking then cpu_possible(), given most
> > of systems don't have gaps in cpu_possible_mask. I could be dizzy at
> > this moment.
> > 
> > static inline unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
> > {
> >         return find_nth_bit(cpumask_bits(srcp), small_cpumask_bits, cpumask_check(cpu));
> > }
> > 
> Yep, i do not think it is a big problem based on your noted fact.
> 
Checked. There is a difference:

1. Default

<snip>
...
+   15.95%     6.05%  [kernel]        [k] __vmap_pages_range_noflush
+   15.91%     1.74%  [kernel]        [k] addr_to_vb_xa <---------------
+   15.13%    12.05%  [kernel]        [k] vunmap_p4d_range
+   14.17%    13.38%  [kernel]        [k] __find_nth_bit <--------------
+   10.62%     0.00%  [kernel]        [k] ret_from_fork_asm
+   10.62%     0.00%  [kernel]        [k] ret_from_fork
+   10.62%     0.00%  [kernel]        [k] kthread
...
<snip>

2. Check if cpu_possible() and then fallback to cpumask_nth() if not

<snip>
...
+    6.84%     0.29%  [kernel]          [k] alloc_vmap_area
+    6.80%     6.70%  [kernel]          [k] native_queued_spin_lock_slowpath
+    4.24%     0.09%  [kernel]          [k] free_vmap_block
+    2.41%     2.38%  [kernel]          [k] addr_to_vb_xa <-----------
+    1.94%     1.91%  [kernel]          [k] xas_start
...
<snip>

It is _worth_ to check if an index is in possible mask:

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 45e1506d58c3..af20f78c2cbf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2542,7 +2542,10 @@ static DEFINE_PER_CPU(struct vmap_block_queue, vmap_block_queue);
 static struct xarray *
 addr_to_vb_xa(unsigned long addr)
 {
-       int index = (addr / VMAP_BLOCK_SIZE) % num_possible_cpus();
+       int index = (addr / VMAP_BLOCK_SIZE) % nr_cpu_ids;
+
+       if (!cpu_possible(index))
+               index = cpumask_nth(index, cpu_possible_mask);

        return &per_cpu(vmap_block_queue, index).vmap_blocks;
 }

cpumask_nth() is not cheap. My measurements are based on a synthetic
tight test and it detects a difference. In a real workloads it should
not be visible. Having gaps is not a common case plus a "slow path"
will be mitigated by the hit against possible mask.

--
Uladzislau Rezki
