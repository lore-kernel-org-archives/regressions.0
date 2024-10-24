Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE381EABBD
	for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779283; cv=none; b=tE9Rs3sNnHqzTL61yPBtLOKOH8B5MtgNiK3ruI0tTbRV+KCp9eLwR2Vzq04XTjd8szeT424jDLjzD4QNfnhS9SM8iIw5isi+7hfWlXCCZlNFc4kAk9Hol8MtkUC4RYxmJDepwaV1vwwrVsv/I3UKkVwi0NE3JO1MCMLJKsbHA0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779283; c=relaxed/simple;
	bh=7hZ731pVv4vAUrv+Xfq3c+tDnlWXTRLGwAiqz0jpnCw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jxc07mw3eUZkaoE0DcqOZ8lek8uJ/nAXKLk5UFxtc+pK7QxsVcg3Co/0NVT4BhM0Znl2Shw7fyeEmbHJV5WsMlsHkSya7S+VAUwNbla+XU2mI+zwbSq9N+imsO+NxbfOaYCMdyaCSkB/q2HEaSavbY062vO4cz9BlyZMIHIF9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dyrYqxuJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dyrYqxuJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314e64eba4so1085955e9.2
        for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729779279; x=1730384079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQFzOo5CVCoEL91pQtXFsiJ0Cpv2r/dDWbECjn6yy18=;
        b=dyrYqxuJfDcDWScACymnHblvlV32MaToEDxqo6LvP3B3xkl4C527vfVlQ8uWslbAcr
         0IwL+H4KxHhAwsNjmeGbxfyxvFzd6gLszEvB4SOZpeCCrPEm+NimPw72RN2qLsMgVDv9
         V02LGDl9Xlncs480H0/jkp1HYgsVsX7JJ/aalBNyZwy107I/qFjhS3DV0nO/12aJc2hK
         ONLn0P+4VkKCLStkE5P6SY/2NJ4EpviejaH7TWC3uA4DmNCyROgVBdXg3/J1WyyRlQ3C
         t3nBbLriCoSQTnxmxV4kiIjHSPW4eAMMfDGKA4g6Ur28XowoHg0MQp33+Qj8hv1/+Zoo
         7nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779279; x=1730384079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQFzOo5CVCoEL91pQtXFsiJ0Cpv2r/dDWbECjn6yy18=;
        b=LPmAylFpoZsTTJy9lFdLJjItTnncKHjiW3uStUV5ijcnXaRWHYKouKCBO2JHzFuzCd
         +e3qUo2yNc2HRr7E9i4ra/ysypVBaBZO7pTNJ5JRSOQbDwT1HpBrC/4gHMz52BpTCiuX
         d8lf9nSSadsxnPae65/5TUzh+vcPWN/pePB6y5/v1mzjw+xArKfDXy3PV3ubZ/cTsCrl
         b0bkMuas3QNdsPowN5H6pnvuwXo9rDymslkmenyw2CtjDRNbKOuto53sRh/+NpcaKwJV
         T25/o/SpxxKsRTmpV3WZ6mThuf2ygmvv54tLJyH4BnKXx1rT5YKJ5lylsvIiK1omjQmE
         aH6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnSlByU1r4RM7L5ocRg9NcPUhK8CoIxks5c5f9QUzgMeReEaQY95iSCoubauQl4+6oboIBsOipMdbFIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWnlY1tAcAxSX2IKT9FRl6qlb8ZqUhfS9d46SJieiWQwRtwFym
	t8bsmPZMu525JytLHbfaXEJCS603AWUotosKBpd5klzmAWHmZ9RjMje+P9XRzZA=
X-Google-Smtp-Source: AGHT+IFxtSZQXQIWvRKt7WWnElnMVbb/MwJke6BBx6dlXxrWvHPkhdiGUWHAnC7FM+E6yAuMmQHS5w==
X-Received: by 2002:a05:600c:4588:b0:42c:aeee:80b with SMTP id 5b1f17b1804b1-431841c9cd1mr22288515e9.8.1729779279027;
        Thu, 24 Oct 2024 07:14:39 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c1ef8dsm46649345e9.47.2024.10.24.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:14:38 -0700 (PDT)
Date: Thu, 24 Oct 2024 16:14:36 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Rik van Riel
 <riel@surriel.com>, Matthias <matthias@bodenbinder.de>, Andrew Morton
 <akpm@linux-foundation.org>, Linux kernel regressions list
 <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Yang Shi <yang@os.amperecomputing.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: darktable performance regression on AMD systems caused by "mm:
 align larger anonymous mappings on THP boundaries"
Message-ID: <20241024161436.625579e3@mordecai.tesarici.cz>
In-Reply-To: <9d7c73f6-1e1a-458b-93c6-3b44959022e0@suse.cz>
References: <2050f0d4-57b0-481d-bab8-05e8d48fed0c@leemhuis.info>
	<f81ef5bd-e930-4982-a5a8-cd4aca272912@suse.cz>
	<ce35b58e-f18c-4701-8494-fa8d1f6e5148@suse.cz>
	<20241024124953.5d77c0b3@mordecai.tesarici.cz>
	<a7585f3e-d6c7-4982-8214-63a7ec6258ad@suse.cz>
	<20241024131331.6ee16603@mordecai.tesarici.cz>
	<9d7c73f6-1e1a-458b-93c6-3b44959022e0@suse.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Oct 2024 15:29:35 +0200
Vlastimil Babka <vbabka@suse.cz> wrote:

> On 10/24/24 13:13, Petr Tesarik wrote:
> > On Thu, 24 Oct 2024 12:56:27 +0200
> > Vlastimil Babka <vbabka@suse.cz> wrote:
> >   
> >> On 10/24/24 12:49, Petr Tesarik wrote:  
> >> > On Thu, 24 Oct 2024 12:23:48 +0200
> >> > Vlastimil Babka <vbabka@suse.cz> wrote:
> >> >     
> >> >> On 10/24/24 11:58, Vlastimil Babka wrote:    
> >> >> > On 10/24/24 09:45, Thorsten Leemhuis wrote:      
> >> >> >> Hi, Thorsten here, the Linux kernel's regression tracker.
> >> >> >> 
> >> >> >> Rik, I noticed a report about a regression in bugzilla.kernel.org that
> >> >> >> appears to be caused by the following change of yours:
> >> >> >> 
> >> >> >> efa7df3e3bb5da ("mm: align larger anonymous mappings on THP boundaries")
> >> >> >> [v6.7]
> >> >> >> 
> >> >> >> It might be one of those "some things got faster, a few things became
> >> >> >> slower" situations. Not sure. Felt odd that the reporter was able to
> >> >> >> reproduce it on two AMD systems, but not on a Intel system. Maybe there
> >> >> >> is a bug somewhere else that was exposed by this.      
> >> >> > 
> >> >> > It seems very similar to what we've seen with spec benchmarks such as cactus
> >> >> > and bisected to the same commit:
> >> >> > 
> >> >> > https://bugzilla.suse.com/show_bug.cgi?id=1229012
> >> >> > 
> >> >> > The exact regression varies per system. Intel regresses too but relatively
> >> >> > less. The theory is that there are many large-ish allocations that don't
> >> >> > have individual sizes aligned to 2MB and would have been merged, commit
> >> >> > efa7df3e3bb5da causes them to become separate areas where each aligns its
> >> >> > start at 2MB boundary and there are gaps between. This (gaps and vma
> >> >> > fragmentation) itself is not great, but most of the problem seemed to be
> >> >> > from the start alignment, which togethter with the access pattern causes
> >> >> > more TLB or cache missess due to limited associtativity.
> >> >> > 
> >> >> > So maybe darktable has a similar problem. A simple candidate fix could
> >> >> > change commit efa7df3e3bb5da so that the mapping size has to be a multiple
> >> >> > of THP size (2MB) in order to become aligned, right now it's enough if it's
> >> >> > THP sized or larger.      
> >> >> 
> >> >> Maybe this could be enough to fix the issue? (on 6.12-rc4)    
> >> > 
> >> > 
> >> > Yes, this should work. I was unsure if thp_get_unmapped_area_vmflags()
> >> > differs in other ways from mm_get_unmapped_area_vmflags(), which might
> >> > still be relevant. I mean, does mm_get_unmapped_area_vmflags() also
> >> > prefer to allocate THPs if the virtual memory block is large enough?    
> >> 
> >> Well any sufficiently large area spanning a PMD aligned/sized block (either
> >> a result of a single allocation or merging of several allocations) can
> >> become populated by THPs (at least in those aligned blocks), and the
> >> preference depends on system-wide THP settings and madvise(MADV_HUGEPAGE) or
> >> prctl.
> >> 
> >> But mm_get_unmapped_area_vmflags() will AFAIK not try to align the area to
> >> PMD size like the thp_ version would, even if the request is large enough.  
> > 
> > Then it sounds like exactly what we want. But I prefer to move the
> > check down to __thp_get_unmapped_area() like this:  
> 
> I wanted to limit the fix to the place commit efa7df3e3bb5da changes, i.e.
> anonymous mappings, because there are other callers of
> __thp_get_unmapped_area(), namely the filesystems via
> thp_get_unmapped_area() and I wasn't sure if that wouldn't regress them. But
> since you suggested I had a brief look now...
> 
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 2fb328880b50..8d80f3af5525 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -1082,6 +1082,9 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
> >  	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> >  		return 0;
> >  
> > +	if (!IS_ALIGNED(len, size))
> > +		return 0;  
> 
> I think the filesystem might be asked to create a mapping for e.g. a
> [1MB, 4MB] range from a file, thus the offset would be 1MB (with anonymous
> pages an off=0 is passed) and the current implementation would try to do the
> right thing for that (align the [2MB, 4MB] range to THP) but after your
> patch it would see len is 3MB and give up, no?

I'm probably showing my ignorance, but I didn't know it is somehow
beneficial to align THP boundaries with corresponding file offsets. In
that case you're right, and the check should be limited to anonymous
mappings.

Petr T

> > +
> >  	if (off_end <= off_align || (off_end - off_align) < size)
> >  		return 0;
> >    
> 

