Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A214A611
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727722014; cv=none; b=LTkxsGSHoH2dddd0k6ULJbuLL8VcmjmUBqSSbsQs2G1dcGPOswGs8wi/FCtZWVQXxqAB88aFqSfYiFCx1GQkMlQwgW5jUcRFpQhs06JFA8Jaelui7QXbU3QjTM2rVNuWNF8vyQwoTseXWzQTceDzOa7JS0wc4R154S1p0SZddOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727722014; c=relaxed/simple;
	bh=LJBd2XzWsHz164n1fTuK+B4D3XarcsLPTUGiEDLMWG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dm7cdO63aIyganrsV12nlEJoznBhl/U7AIUfL52XVucn+vgG/sUtQ++qh/edOMPM/Bj9vUNMrCsobk76dLLu5WLSJYuZQarI/Oxue7CktQrQxiiKctVsbCdRwyP4mZdPeWm0u+pRTdWY+RA+HDYJtNq7avQE9/2yYMzcB6nPDV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MWJb4+WD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MWJb4+WD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5389917ef34so5392709e87.2
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727722010; x=1728326810; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZxtY/yExLakikPIWimGxq8rXeYi1ZRab5obj2wCNkU=;
        b=MWJb4+WDeKgcukUx8oNenv1eFPYpHxGZ2hkBnqiy8jd3bElREDo0NpPp+0Ixgxb6Jd
         JXcOwbN5xlFMcO/02niP+YYuxQ1NT1TMsWVanVQTmZipuZwLnlo3cJoiGGSuxmuDdB9j
         ZnUvHUXfr3fkerz6mSmHzA8z29IMpVvsQK5s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727722010; x=1728326810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZxtY/yExLakikPIWimGxq8rXeYi1ZRab5obj2wCNkU=;
        b=i/a9/smBeQjgnE2ixuERhpAB5BffXbEb3Qy7ifqoxfhu4e5E//F3/iD1yoKdcPMjIe
         +eMGobZCJcaiQVpnQuP7ZoIc8tBKuLBk/qpIRUOTsfsXsMbenVfhHrOWM0o9QLJL7VDQ
         Xv01C1+yjE8OQb+oDmrBHyRmQSwCMK7z68YhxS9P4wjZKl1uEC2jm7ukkEGhLPs/wad3
         GlIyGYFiqfDtMtvm2ZrHUz2CjV1Olrskayzw6rCFayNkw4ZbTROpR2dqYnm8RfEaUhFV
         2pYEJmb1zqFuAVIOUif3GBJm1OjufPvbRsFKoljV3COCTExz8bv9wrkQHjpcFZQWcbHL
         GA4A==
X-Forwarded-Encrypted: i=1; AJvYcCUEn8zoYxEO234FyJeWOfF9/vKPqTx5dulg5Mts6jxySPrAIE69VQHEfdjwWMf3ywhghTVIuAx/baNo0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4fm8lLFWvddWWuKg1YnAtiJvMP6ySSsCeZYou/a8gyLOt1/GY
	sTz1eV5R4Bc1/Zh8Ai0AzzIHs3miwhNPsGLCTcJdOCowD7MVbd2Oz/VcUhMN/uNWy7ezB4YQDCb
	qKFAJOg==
X-Google-Smtp-Source: AGHT+IE3iIip4ZvZ8bN7oJ9JxoK3te3gPfqh2W5uRNt44oxBCJHrta3aFZSXbIUbZJ8v3zg98ryUtg==
X-Received: by 2002:a05:6512:1396:b0:536:a4da:8d86 with SMTP id 2adb3069b0e04-5389fc35caamr6697373e87.15.1727722010140;
        Mon, 30 Sep 2024 11:46:50 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a044091dsm1316509e87.243.2024.09.30.11.46.48
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 11:46:49 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fad784e304so5010741fa.2
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 11:46:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnF8juHdOwlQXXSNsU83TE/HeRiaIt1PSCUebriGjC0l9yFG8L823vZMb5aj0y95IPFt5FcABndQ047A==@lists.linux.dev
X-Received: by 2002:a05:6512:ad2:b0:537:a824:7e5 with SMTP id
 2adb3069b0e04-5389fc361dfmr6504852e87.18.1727722007490; Mon, 30 Sep 2024
 11:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <Zud1EhTnoWIRFPa/@dread.disaster.area> <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com> <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com> <ZumDPU7RDg5wV0Re@casper.infradead.org>
 <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk> <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org> <ZuuBs762OrOk58zQ@dread.disaster.area>
 <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
 <E6728F3E-374A-4A86-A5F2-C67CCECD6F7D@flyingcircus.io> <CAHk-=wgtHDOxi+1uXo8gJcDKO7yjswQr5eMs0cgAB6=mp+yWxw@mail.gmail.com>
 <D49C9D27-7523-41C9-8B8D-82B2A7CBE97B@flyingcircus.io> <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>
In-Reply-To: <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Sep 2024 11:46:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6YRm2fpYHjZxNfKCC_N+X=T=ay+69g7tJ2cnziYT8=g@mail.gmail.com>
Message-ID: <CAHk-=wj6YRm2fpYHjZxNfKCC_N+X=T=ay+69g7tJ2cnziYT8=g@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Christian Theune <ct@flyingcircus.io>
Cc: Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>, 
	Jens Axboe <axboe@kernel.dk>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Sept 2024 at 10:35, Christian Theune <ct@flyingcircus.io> wrote:
>
> Sep 27 00:51:20 <redactedhostname>13 kernel:  folio_wait_bit_common+0x13f/0x340
> Sep 27 00:51:20 <redactedhostname>13 kernel:  folio_wait_writeback+0x2b/0x80

Gaah. Every single case you point to is that folio_wait_writeback() case.

And this might be an old old annoyance.

folio_wait_writeback() is insane. It does

        while (folio_test_writeback(folio)) {
                trace_folio_wait_writeback(folio, folio_mapping(folio));
                folio_wait_bit(folio, PG_writeback);
        }

and the reason that is insane is that PG_writeback isn't some kind of
exclusive state. So folio_wait_bit() will return once somebody has
ended writeback, but *new* writeback can easily have been started
afterwards. So then we go back to wait...

And even after it eventually returns (possibly after having waited for
hundreds of other processes writing back that folio - imagine lots of
other threads doing writes to it and 'fdatasync()' or whatever) the
caller *still* can't actually assume that the writeback bit is clear,
because somebody else might have started writeback again.

Anyway, it's insane, but it's insane for a *reason*. We've tried to
fix this before, long before it was a folio op. See commit
c2407cf7d22d ("mm: make wait_on_page_writeback() wait for multiple
pending writebacks").

IOW, this code is known-broken and might have extreme unfairness
issues (although I had blissfully forgotten about it), because while
the actual writeback *bit* itself is set and cleared atomically, the
wakeup for the bit is asynchronous and can be delayed almost
arbitrarily, so you can get basically spurious wakeups that were from
a previous bit clear.

So the "wait many times" is crazy, but it's sadly a necessary crazy as
things are right now.

Now, many callers hold the page lock while doing this, and in that
case new writeback cases shouldn't happen, and so repeating the loop
should be extremely limited.

But "many" is not "all". For example, __filemap_fdatawait_range() very
much doesn't hold the lock on the pages it waits for, so afaik this
can cause that unfairness and starvation issue.

That said, while every one of your traces are for that
folio_wait_writeback(), the last one is for the truncate case, and
that one *does* hold the page lock and so shouldn't see this potential
unfairness issue.

So the code here is questionable, and might cause some issues, but the
starvation of folio_wait_writeback() can't explain _all_ the cases you
see.

                  Linus
