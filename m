Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47289149C64
	for <regressions@lists.linux.dev>; Fri, 13 Sep 2024 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726262668; cv=none; b=TqoIqVu8HeHrw++B6dP++6ATVEfQ2+Na9IcZsWzmVOSCWtneENDwSHqJvBe0jghKljXgO0gG2oBmf6XM02XCCsnRikE9jYn/qAVU1KyNEOMkZCMuBstzfE6yjtKZPh4YhKKeQfeqULdCX+2yM78C+o8dvyoYgiCzID4TD362soY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726262668; c=relaxed/simple;
	bh=ZYhLlCfJubXl2lpFJkootrsMtKBVHk6xopFryr344Jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz5LbknfoFdrvlbDHMGvxhtC3sPkGJc99bVwRNcHhE1JFLlcYvX4F66kD7p5uOFrb6Hj14ngMtwPbhgzj7YH43BMr03sJncWxqHgqY0XGbOQ8pi29eDjWnI+4zBtOpseZWfB3KeaRLkw6R7rmLpSRn+NIuRGw5Wo2uJcVlWx75k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UBjCNjkq; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UBjCNjkq"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so29530421fa.2
        for <regressions@lists.linux.dev>; Fri, 13 Sep 2024 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726262663; x=1726867463; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xRuFfVQTrS2LaFQHsAbqiDg4XIXZJlnGtDFvh2VKrJg=;
        b=UBjCNjkq4HHl2IVWDi5TykupDGaskTd0KxQPX3lZPVy/RZPcqczTdI22FJhSTmzgMv
         PICMHFTa0Wa9cGsmIUID438absczhaqoWQ8Imi29x//XToYxhhtMDKbQIgQkDbVyg2vL
         hhDVkVjvjsVcolweflwt3cy0fWTLxmEwrwD20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726262663; x=1726867463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRuFfVQTrS2LaFQHsAbqiDg4XIXZJlnGtDFvh2VKrJg=;
        b=V1OLCT4MegjUaIm72dFn7Kljm1k76HRM1eKx7mhxI+FR4+oCp40rxvjZTiv6Nz+vlz
         yPIGAcNG0n0PF3svqXzEUgDRp3VH/iW21urpIEFVkbfaRpV5jv8+31p6oWt2sPLw9UAq
         0g47ol20kp75c81+BnK2RWLXC3JfZ0yPQKpYq8HH6f5XMnmD0zgUtLmkbqLts+XvQhpD
         WTUIwXaeP756kAt2R6C/00dgGS0grS0rWHd/NDFkB9dEUR0tYxGXDOwVD+Ez479Yo6QK
         uSLu7GKkZa+lxPpVZhJG0zjNXEihP3OAPrGALmtpSKhSnjswojmvvjH9m2/gSufKr/bd
         yCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf03dWIcDdNXziQIRJOoPey06UCIjp+SKEu6li0c1CF529OmwXoDJiBg0RQE7CNNXE9pO0vr26wRiyTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzuaeuw7SG3oN3c7hKzxHNOCQyl5toel5DZCangfB2O96Fvc5Nn
	4sO7QXRhAEAMhJ966XqR9jRpSdDnQgVH48Sa4X7tJ7uXkay6wRdTKPzgVLEGnE0V//k6RcgyTu7
	QLfA=
X-Google-Smtp-Source: AGHT+IEIvmopB0Scla696lDDDPrWcpLmZFHKtr/XEfYlogBuZ72vmMoAAP/6czDtqbaGT7bSxh8tHg==
X-Received: by 2002:a2e:4612:0:b0:2f7:5dad:1433 with SMTP id 38308e7fff4ca-2f787db928fmr36891751fa.11.1726262662574;
        Fri, 13 Sep 2024 14:24:22 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d37f77bsm200241fa.87.2024.09.13.14.24.20
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 14:24:20 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f66423686bso25598301fa.3
        for <regressions@lists.linux.dev>; Fri, 13 Sep 2024 14:24:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWs6Eb7sU1KVvY20wwAcwciLfLnnsPpjP6r89vl/eLS8B5Lf2nDrdbbPa4c96tmkh02cA7FfdodNpi/4g==@lists.linux.dev
X-Received: by 2002:a2e:7c0d:0:b0:2f5:11f6:1b24 with SMTP id
 38308e7fff4ca-2f787dd0941mr36494131fa.18.1726262659861; Fri, 13 Sep 2024
 14:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org> <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <d4a1cca4-96b8-4692-81f0-81c512f55ccf@meta.com> <ZuRfjGhAtXizA7Hu@casper.infradead.org>
 <b40b2b1c-3ed5-4943-b8d0-316e04cb1dab@meta.com> <ZuSBPrN2CbWMlr3f@casper.infradead.org>
In-Reply-To: <ZuSBPrN2CbWMlr3f@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Sep 2024 14:24:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=_n1jfSRw2tyS0w85JpHZvG9wNynOB_141C19=RuJvQ@mail.gmail.com>
Message-ID: <CAHk-=wh=_n1jfSRw2tyS0w85JpHZvG9wNynOB_141C19=RuJvQ@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>
Cc: Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, Christian Theune <ct@flyingcircus.io>, 
	linux-mm@kvack.org, "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Dao <dqminh@cloudflare.com>, Dave Chinner <david@fromorbit.com>, regressions@lists.linux.dev, 
	regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Sept 2024 at 11:15, Matthew Wilcox <willy@infradead.org> wrote:
>
> Oh!  I think split is the key.  Let's say we have an order-6 (or
> larger) folio.  And we call split_huge_page() (whatever it's called
> in your kernel version).  That calls xas_split_alloc() followed
> by xas_split().  xas_split_alloc() puts entry in node->slots[0] and
> initialises node->slots[1..XA_CHUNK_SIZE] to a sibling entry.

Hmm. The splitting does seem to be not just indicated by the debug
logs, but it ends up being a fairly complicated case. *The* most
complicated case of adding a new folio by far, I'd say.

And I wonder if it's even necessary?

Because I think the *common* case is through filemap_add_folio(),
isn't it? And that code path really doesn't care what the size of the
folio is.

So instead of splitting, that code path would seem to be perfectly
happy with instead erroring out, and simply re-doing the new folio
allocation using the same size that the old conflicting folio had (at
which point it won't be conflicting any more).

No?

It's possible that I'm entirely missing something, but at least the
filemap_add_folio() case looks like it really would actually be
happier with a "oh, that size conflicts with an existing entry, let's
just allocate a smaller size then"

                Linus
