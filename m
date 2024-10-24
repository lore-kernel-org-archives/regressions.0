Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E94176AAD
	for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729768418; cv=none; b=QptE3HA7UJurKmEZCZHT2hDg5rB/H/t4cUjo4FzC2xVQrRQ/9/3xz2EJSsx333ZgkO8quaCUoSUhPIN4HOjnkpMXpfIZEqnO87wO9mtp00jEkTcGuVIJglCWG0fVzs0HTzE2XqggjzL0oe23elw/IOaSc14C1UEUQR6D9gNdSPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729768418; c=relaxed/simple;
	bh=wTStZVdsK7XzQi2Yh/SFMkS+5Tzo9LDkBF2xEN1og2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rHOgj17D00CVrd71dUJfxjsi1HOWTRwqBtxgvxwNKRIA+654DvEQT+Ol4QHYJ3jVechkTukGgaZKctlTPY410YcMVUYdXY5cMuaFuj98qin9dS8AtVtGpp+NVFERHOYufXYALGmG1lwhBYjDcptUZjYE+25xPGyJM1IXi5biTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SVk0rRtY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SVk0rRtY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso1212765e9.3
        for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729768414; x=1730373214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imSjjMdCGM+aw7g8sBxgyv1wz/fsW/mplJEegqFMe/Y=;
        b=SVk0rRtYL++mWql1l40R9xUqVvJ8+XE7V/9ZEcX06Rx1FWgXf6F4Wt3HWvzrMM0eJD
         Le6yrZNlC5sosY8a702O3mm1q6SKLcJpz+3EulzvhriNKaaDTISCM9RmX/mHbxVd/Z0h
         VZrt0zquR8ATaYzDbZNxl+1gBka7BwBdiYF9y0pXaGI9zPwehhkxaRYq5gZAFxrv0hkI
         BaBMMdpZ+7f6RqA+PtU7pVPQz+99akwd99C7ESxLjj6FJvpeUnClw6FCoJagP4UhFUNF
         HMVLvaS0dB8pj+zwDvzq26WxHKJqy6Oyg8X3Yi3UBsZwSpm4YQYfNGXFEipqsBfZR5fx
         1/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729768414; x=1730373214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imSjjMdCGM+aw7g8sBxgyv1wz/fsW/mplJEegqFMe/Y=;
        b=eteB/JqBKFbLbe/CapeV+yQfb8HquBO8iwpaIxJb1bZDRhy9PurMe0CMsqKNb2VUXn
         VP4S753CflL9TZIPG7N6Oue+mg4+IjJB4jLiil0eswTXKVxZTj2YwC7gK0meKLKJHIDr
         U7fy9Z8yr9tcRM2Acfqcw9C+ZK8EvZLvDdMaJvS9YrT55Oj7jr9bKvA0Y/5NobAQFFwS
         v57oMrJNxXMkVEY2+UIbFyuE1/ijx+pw1u6dEBkvOFHpwnC14HrWrwwULKDu3aWCIupD
         LXcQM9zqVZFM7snkNVp0QwxwYbyoVCEfppem6ErHx8HclX8UeOQy0Ijg7j9PerrBtYFb
         bhuA==
X-Forwarded-Encrypted: i=1; AJvYcCVe2OIDIyhGy1B4PIzxDhbJTmRER+O8obXlL8eeTrYytpLaR5+oaT25qlYa4x5VLSplpStfv2OhOiCo7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwpbFRvsCCvoDzR9Sg3PgPvC4X4kW/WGE352OLXYY+wfr8lAAN
	CC5FkLz+2EN81qB18+Z3DWS0zjMBhPh2QGaPIBg6bsXWU6Df8n1v0dXC8uhTfgs=
X-Google-Smtp-Source: AGHT+IGIXilVoLz80S9lTX9xPagKYC9relfalPeQ6MVSzPoX86xnZqbX87TXtrWjzG6YzftDbrnT/w==
X-Received: by 2002:a05:600c:1d06:b0:42c:c59a:ac21 with SMTP id 5b1f17b1804b1-43184139fbamr19560845e9.2.1729768414142;
        Thu, 24 Oct 2024 04:13:34 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55d753sm14111295e9.11.2024.10.24.04.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:13:33 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:13:31 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Rik van Riel
 <riel@surriel.com>, Matthias <matthias@bodenbinder.de>, Andrew Morton
 <akpm@linux-foundation.org>, Linux kernel regressions list
 <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Yang Shi <yang@os.amperecomputing.com>
Subject: Re: darktable performance regression on AMD systems caused by "mm:
 align larger anonymous mappings on THP boundaries"
Message-ID: <20241024131331.6ee16603@mordecai.tesarici.cz>
In-Reply-To: <a7585f3e-d6c7-4982-8214-63a7ec6258ad@suse.cz>
References: <2050f0d4-57b0-481d-bab8-05e8d48fed0c@leemhuis.info>
	<f81ef5bd-e930-4982-a5a8-cd4aca272912@suse.cz>
	<ce35b58e-f18c-4701-8494-fa8d1f6e5148@suse.cz>
	<20241024124953.5d77c0b3@mordecai.tesarici.cz>
	<a7585f3e-d6c7-4982-8214-63a7ec6258ad@suse.cz>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Oct 2024 12:56:27 +0200
Vlastimil Babka <vbabka@suse.cz> wrote:

> On 10/24/24 12:49, Petr Tesarik wrote:
> > On Thu, 24 Oct 2024 12:23:48 +0200
> > Vlastimil Babka <vbabka@suse.cz> wrote:
> >   
> >> On 10/24/24 11:58, Vlastimil Babka wrote:  
> >> > On 10/24/24 09:45, Thorsten Leemhuis wrote:    
> >> >> Hi, Thorsten here, the Linux kernel's regression tracker.
> >> >> 
> >> >> Rik, I noticed a report about a regression in bugzilla.kernel.org that
> >> >> appears to be caused by the following change of yours:
> >> >> 
> >> >> efa7df3e3bb5da ("mm: align larger anonymous mappings on THP boundaries")
> >> >> [v6.7]
> >> >> 
> >> >> It might be one of those "some things got faster, a few things became
> >> >> slower" situations. Not sure. Felt odd that the reporter was able to
> >> >> reproduce it on two AMD systems, but not on a Intel system. Maybe there
> >> >> is a bug somewhere else that was exposed by this.    
> >> > 
> >> > It seems very similar to what we've seen with spec benchmarks such as cactus
> >> > and bisected to the same commit:
> >> > 
> >> > https://bugzilla.suse.com/show_bug.cgi?id=1229012
> >> > 
> >> > The exact regression varies per system. Intel regresses too but relatively
> >> > less. The theory is that there are many large-ish allocations that don't
> >> > have individual sizes aligned to 2MB and would have been merged, commit
> >> > efa7df3e3bb5da causes them to become separate areas where each aligns its
> >> > start at 2MB boundary and there are gaps between. This (gaps and vma
> >> > fragmentation) itself is not great, but most of the problem seemed to be
> >> > from the start alignment, which togethter with the access pattern causes
> >> > more TLB or cache missess due to limited associtativity.
> >> > 
> >> > So maybe darktable has a similar problem. A simple candidate fix could
> >> > change commit efa7df3e3bb5da so that the mapping size has to be a multiple
> >> > of THP size (2MB) in order to become aligned, right now it's enough if it's
> >> > THP sized or larger.    
> >> 
> >> Maybe this could be enough to fix the issue? (on 6.12-rc4)  
> > 
> > 
> > Yes, this should work. I was unsure if thp_get_unmapped_area_vmflags()
> > differs in other ways from mm_get_unmapped_area_vmflags(), which might
> > still be relevant. I mean, does mm_get_unmapped_area_vmflags() also
> > prefer to allocate THPs if the virtual memory block is large enough?  
> 
> Well any sufficiently large area spanning a PMD aligned/sized block (either
> a result of a single allocation or merging of several allocations) can
> become populated by THPs (at least in those aligned blocks), and the
> preference depends on system-wide THP settings and madvise(MADV_HUGEPAGE) or
> prctl.
> 
> But mm_get_unmapped_area_vmflags() will AFAIK not try to align the area to
> PMD size like the thp_ version would, even if the request is large enough.

Then it sounds like exactly what we want. But I prefer to move the
check down to __thp_get_unmapped_area() like this:

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2fb328880b50..8d80f3af5525 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1082,6 +1082,9 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
 		return 0;
 
+	if (!IS_ALIGNED(len, size))
+		return 0;
+
 	if (off_end <= off_align || (off_end - off_align) < size)
 		return 0;
 
