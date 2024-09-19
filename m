Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088D11CA1
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726715603; cv=none; b=No/aiF9Xrtsv9XFCAY3XZA6pK1de/B7Ho2qwz5X8yvASN4ZcddggYNUVlkKkL5lyl6qS8T2JJC2FjYgXw1Uf9K0bRyH890K7ZGlhXuzI2lpEO76abjy+DxDXf/EbBct4iS93zm+7wP3kwG/Zwf4DtzKK0fFr9K+qiFuqDhVKomQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726715603; c=relaxed/simple;
	bh=9V2+zbwm8Yz+r58UL9q8WQFB/wy+TQMYxqZgi3T/d3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tY2tUJ99BXrkLNWIxsYPwOfjhEigmo/5udNzqttvp9gjrYdZry1/3Xtp3CMPpkQjzTWh4xIQ5MNYB2yje7GDClcS0c3O65yR7N+okxZxVnA2SKnf+Rdsgjg51I49ET6WBWjErO7RMMmfmVho5LH3ZCtkjgWYenDSMrLs0ozXglk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KSq9Jkjm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KSq9Jkjm"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c26815e174so535110a12.0
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 20:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726715599; x=1727320399; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wcLLwAFuhFyJrwjWn6iH7R74N7ls/NAjmWUt4uQ7SSo=;
        b=KSq9Jkjm+rFcc+fnIN38QK/bIqQRo9dOjwOpozy3VLUvR25WTA85ZpPmKww/42PDdh
         JxoEs/fH1+7v7fs6upHeQLBFSLlaVyzCCtZ6LjiqZWbf9NGCfI3kHKP0TSTU4DW7Ns5D
         v3drnT5T42qcBLoMT24KtttQY7PJ8qnYHaZJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726715599; x=1727320399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcLLwAFuhFyJrwjWn6iH7R74N7ls/NAjmWUt4uQ7SSo=;
        b=QAorbD+g/2G6fbQzDV8HnBTy8m7S+D0ebDV/Wriq4BlQUb7p7YmtUR/vdh6qVWklcQ
         ZKT/GvWs9F9bPYbj/IRWGHS8B0wYRoPy054Hvbz2U0lCOru4nFyRALypwiSZEmP+PnA4
         8nuvvhwBAJWkhiocHCwOuZu6HLrPfokTyeHWrUmrFXVzBwoigjJpibkgFxWR83npfKB+
         ku9H3XJtb+K+itWFTcEenM3AWHcBDWDUdsA93b4EkCTnKsX+6X7n2u8xU5c9CrsNGyQ7
         bMycmD4uFD5U2/NuUbMw6YclagKXOHlDl9vpKKg3ppdazWO1iJj4RY0I7qn4h7la9Tn2
         Aa3A==
X-Forwarded-Encrypted: i=1; AJvYcCXvgWSVvIsfoU9ojSGLnMKWzUJhaR0zewOB2QfG/d2JcrS+nwtPUdVz21olmVZ6QxAEU4riOzOcPHGmug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVptTMz0RiYe37Vjv5OXEJqcR9AyRL3lH2kp7qWaC6RNiuZfCB
	nv/2o3cfMy556MTCD3nCU3yiRhSWF1yHWMSOdl7+7NtMB2ZOMDsHKJ8U20sBJyrMzhajk+eYhkL
	cXPXsuw==
X-Google-Smtp-Source: AGHT+IHtk/eFfDYVr1Kq8pSqbNhmmiox90uw+Y2o82nqD6Xe9gS0bfvB0sCAEioEmMpvKdp/eIfjhQ==
X-Received: by 2002:a17:907:8692:b0:a7a:9f0f:ab2c with SMTP id a640c23a62f3a-a9047d1a947mr2022721566b.29.1726715599261;
        Wed, 18 Sep 2024 20:13:19 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f4416sm662489466b.60.2024.09.18.20.13.16
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 20:13:17 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c3d2f9f896so516952a12.1
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 20:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhoUp/besqe8cFwDZ4gB9Yh1O+qd7WFJymNXv2Gs9dex5+JEO4U9lHHeNRznULa/yQ8u4d3Iy4loHJyQ==@lists.linux.dev
X-Received: by 2002:a17:907:6e8b:b0:a89:f1b9:d391 with SMTP id
 a640c23a62f3a-a9047c9c504mr1768413466b.14.1726715595791; Wed, 18 Sep 2024
 20:13:15 -0700 (PDT)
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
In-Reply-To: <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Sep 2024 05:12:59 +0200
X-Gmail-Original-Message-ID: <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
Message-ID: <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Dave Chinner <david@fromorbit.com>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Sept 2024 at 05:03, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think we should just do the simple one-liner of adding a
> "xas_reset()" to after doing xas_split_alloc() (or do it inside the
> xas_split_alloc()).

.. and obviously that should be actually *verified* to fix the issue
not just with the test-case that Chris and Jens have been using, but
on Christian's real PostgreSQL load.

Christian?

Note that the xas_reset() needs to be done after the check for errors
- or like Willy suggested, xas_split_alloc() needs to be re-organized.

So the simplest fix is probably to just add a

                        if (xas_error(&xas))
                                goto error;
                }
+               xas_reset(&xas);
                xas_lock_irq(&xas);
                xas_for_each_conflict(&xas, entry) {
                        old = entry;

in __filemap_add_folio() in mm/filemap.c

(The above is obviously a whitespace-damaged pseudo-patch for the
pre-6758c1128ceb state. I don't actually carry a stable tree around on
my laptop, but I hope it's clear enough what I'm rambling about)

               Linus
