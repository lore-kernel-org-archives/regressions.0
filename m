Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AE15A843
	for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729767000; cv=none; b=IdOSlYp5P0aaiQOQLoaFFJXy6hcqYK0/vS2uIZMUcpHJbTuZlcy0y10UrPPf8RXtfXoWTW2wh9bwJFU/vHJWVFksriVj6L/0t5A+5f2AXOTJ+hXJiTPXP9HPIIM8BdPnhBK2KvL3zqCZSeK4ikmlci1kaEdtP/TUsYsqLOUmIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729767000; c=relaxed/simple;
	bh=Q9Mh9moQAsXNRpY4Xh7F9/cES2XHhBn6sfRp7Nr7g4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKMD9UrUuvOc7B7BNjptV1G5sRyThWcAyneT3a/0HykYd4UeWpOKXtzelkKt/WbSTfcjrFLw0e2E4OmVSe8NBIfQV9RIaKEgQfCTld8wsyBTHlCoElx//aHgh35txpWtH+e/wYXgn1KsFAg9FtRo105M0gYNdzp19sJJ/Z14aQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GqjoxTQe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GqjoxTQe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43158124a54so1130135e9.3
        for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729766996; x=1730371796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loWmohrD0u9En+NaaMGpd3qTcGdZJB6GKDjj4u9HyTo=;
        b=GqjoxTQew66CAaznfclCYOeXhLBl84bQZjvqD7o1tKyARvhAwC6pfXuHM0rN9IpX0Y
         VpLy/NEwOogPj2DwpoLFmdZO850qpJ+4hc4w55jiU9U27SupXu4vYvyRBuGEqsaamf4v
         oWZ4KHuah19h/Cvf2/QZqgsh+6Hww47gCMNccZZrKn6hrdQbhNyGLsCIp7v3v1ymNiFD
         fC7lZFvb0rzL1Fpk8uBwMUqbKNwkHx4kxAf+UF76nzO63PVnHvBEuWvw2WaIGiBujR+I
         HXM8Qlcr65h8/YjoAD0jqUv+99baHFJomGO6pNyZC9hFiiJG8DGhWaBszemsZVDhuv7/
         P4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766996; x=1730371796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loWmohrD0u9En+NaaMGpd3qTcGdZJB6GKDjj4u9HyTo=;
        b=NICHgGQC86/SYBU3KR71ncsW44LFWAMdAXSQoI/yAfkkteHFMrxU3vdoWIqMOMY3wZ
         9n0ePaxlJO0zzuQXJqVuxxic6Cs8GbIaw7msV4KdM2jG5EZ4sYoXCw0Zb4X9R01Jm5Jk
         TS2d2Ta1mwwmbKuAtg/lxPOoZuqohBpSGuLNifQUMa4moPuGThItNrw7Xaj2ao+mLvRJ
         gjAYfcYcGiWn7XwNT6IQXbjqg+8HDZir+kE9xY02zDnumt0vWi2tycqjAOYhsku48vpd
         xp5lRLGy958bE93V458/YOUBGzZ9Nv86eSuH5esFrfl364RP8fcULvXeObFKFzwDZgAU
         L8FA==
X-Forwarded-Encrypted: i=1; AJvYcCUbPNBVLeD1LF8CCaOK9XTnS7liC7wnl8N9qX5Q8TK8dUGgjIze+9siZQR6gl3xPqKUfs+ka0r21HzgNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNYPiK+djqywRTYJesrvH3/w08TsVKNCYQ3R4iEeSsGlKXGqYC
	NQuq3xJiitlWpUE2TgbnE79w3ERJ03sp6OT7ALbbB42xNxCGGhhR4fe7nW1MmxA=
X-Google-Smtp-Source: AGHT+IH/mWHsBy1Th/KpM7QX0bH6dEt5y+/WtHFyadVPtQC3xZUeuSoB1grvDqXfiwwsRXGlOAapNA==
X-Received: by 2002:a05:600c:1d06:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-43184133ef0mr22694795e9.1.1729766996094;
        Thu, 24 Oct 2024 03:49:56 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37d25sm10990154f8f.23.2024.10.24.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:49:55 -0700 (PDT)
Date: Thu, 24 Oct 2024 12:49:53 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Rik van Riel
 <riel@surriel.com>, Matthias <matthias@bodenbinder.de>, Andrew Morton
 <akpm@linux-foundation.org>, Linux kernel regressions list
 <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Yang Shi <yang@os.amperecomputing.com>
Subject: Re: darktable performance regression on AMD systems caused by "mm:
 align larger anonymous mappings on THP boundaries"
Message-ID: <20241024124953.5d77c0b3@mordecai.tesarici.cz>
In-Reply-To: <ce35b58e-f18c-4701-8494-fa8d1f6e5148@suse.cz>
References: <2050f0d4-57b0-481d-bab8-05e8d48fed0c@leemhuis.info>
	<f81ef5bd-e930-4982-a5a8-cd4aca272912@suse.cz>
	<ce35b58e-f18c-4701-8494-fa8d1f6e5148@suse.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Oct 2024 12:23:48 +0200
Vlastimil Babka <vbabka@suse.cz> wrote:

> On 10/24/24 11:58, Vlastimil Babka wrote:
> > On 10/24/24 09:45, Thorsten Leemhuis wrote:  
> >> Hi, Thorsten here, the Linux kernel's regression tracker.
> >> 
> >> Rik, I noticed a report about a regression in bugzilla.kernel.org that
> >> appears to be caused by the following change of yours:
> >> 
> >> efa7df3e3bb5da ("mm: align larger anonymous mappings on THP boundaries")
> >> [v6.7]
> >> 
> >> It might be one of those "some things got faster, a few things became
> >> slower" situations. Not sure. Felt odd that the reporter was able to
> >> reproduce it on two AMD systems, but not on a Intel system. Maybe there
> >> is a bug somewhere else that was exposed by this.  
> > 
> > It seems very similar to what we've seen with spec benchmarks such as cactus
> > and bisected to the same commit:
> > 
> > https://bugzilla.suse.com/show_bug.cgi?id=1229012
> > 
> > The exact regression varies per system. Intel regresses too but relatively
> > less. The theory is that there are many large-ish allocations that don't
> > have individual sizes aligned to 2MB and would have been merged, commit
> > efa7df3e3bb5da causes them to become separate areas where each aligns its
> > start at 2MB boundary and there are gaps between. This (gaps and vma
> > fragmentation) itself is not great, but most of the problem seemed to be
> > from the start alignment, which togethter with the access pattern causes
> > more TLB or cache missess due to limited associtativity.
> > 
> > So maybe darktable has a similar problem. A simple candidate fix could
> > change commit efa7df3e3bb5da so that the mapping size has to be a multiple
> > of THP size (2MB) in order to become aligned, right now it's enough if it's
> > THP sized or larger.  
> 
> Maybe this could be enough to fix the issue? (on 6.12-rc4)


Yes, this should work. I was unsure if thp_get_unmapped_area_vmflags()
differs in other ways from mm_get_unmapped_area_vmflags(), which might
still be relevant. I mean, does mm_get_unmapped_area_vmflags() also
prefer to allocate THPs if the virtual memory block is large enough?

Petr T

> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 9c0fb43064b5..a5297cfb1dfc 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -900,7 +900,8 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
>  
>  	if (get_area) {
>  		addr = get_area(file, addr, len, pgoff, flags);
> -	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> +	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)
> +		   && IS_ALIGNED(len, PMD_SIZE)) {
>  		/* Ensures that larger anonymous mappings are THP aligned. */
>  		addr = thp_get_unmapped_area_vmflags(file, addr, len,
>  						     pgoff, flags, vm_flags);
> 

