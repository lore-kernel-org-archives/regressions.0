Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF519F41A
	for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 22:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726181799; cv=none; b=GqdeOM9BjhqjZTWYOk4DV4shzI3hSrHvONY2OS8iPsxVfOXKQyUDIH8406H/+J1u0l5kAMN6sPvvbO2235H2Kyf0bEM/2irKLHZVb3ZiNiZ8jelKoYSbUES8zSnGzqu+TIJqc7nMWev2aLg208eduE/lfige/qtbpxy6T4KAiB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726181799; c=relaxed/simple;
	bh=FC6yVrbFwid+khyb8rzsz+6/2arbcCP7+SVedlt7ft0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anrVKUSyp2ehd599IjRZCI8S6i1yKKl5jtMJDEQKOk+MaXKhjysRaZJeklC4sgae35pblshcIvJ2js2mKp8jrn73noQOqwoVJVg8NOdHsb4FetUapeQTX5oVOkjwuyYJI6S5KVctPVOu47sFXKNG1GoTHKpGAfR8K5noP7EEIks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RakvDpyS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RakvDpyS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso215835366b.3
        for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 15:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1726181796; x=1726786596; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5oSHOzzc4kY1d0eewmzi0Wbpuaj3BjPn9DNZ4NK/40=;
        b=RakvDpySXDnZSmYqxVXQPOXOJheG0Mh9vCtj0CJHHwVpSh/F6RHpssYOApsnTXe6Ea
         6YsEud2uIjPX9SZUAO1OGvARmvjgryC9SEunCmGJYXA00V0ZyGZbkDm381K5Qib3a9qc
         N9c9lU6TYDcYRjXnvhSw4fxVF2GRpFaSOIj54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726181796; x=1726786596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5oSHOzzc4kY1d0eewmzi0Wbpuaj3BjPn9DNZ4NK/40=;
        b=WsQKU8AUFxrUOeHZOQlTZAfSl4AbystUkUlUAsTkQWD0ZvUfgCJjYn3O+Tl9SevdNd
         kdhG7HTIXwuA+zP70B4Ufdkv8hduMe87KVWSWrKRe2dMyQJd5g1Zo2wwHMhdSa2T4bXb
         wXFqxCOjMADOOJsp75+bl79XiIrxFGzorCNZO8Gpd0MXKCFrv8/GhNiyuCza55W02xZL
         ROMVE9YTzNLaVfBSfGtqkZfDnZgtZKTmxcnBBNGVgN4bQ048u/gCVLnXWo1D9yEk083i
         rozGRTWRl0oyWc+egQ8anm8xEAbnFplD1JEIauBpqa+txLTja7mmRy8wJCXW/z8Ako0S
         DwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrkKRzrqJo/goBXAGlUU8ix/Cfd6EDLYevIQRDNhpKNEsDZPm2UA9U5vadiPvIaoswYEBHwJx4IfUluA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlv0DxyBDBDv2UFZ8YJFZ7gpZzwzsixOLzJSpMNlq7VcnWtWmU
	fnyYx3OZjOD4TJ1U9EsgIqv+LgypglILtnF5bDtOlyurcfjYu/kt/nx9AbLqQh+4GTUbvNmzffI
	5CCA=
X-Google-Smtp-Source: AGHT+IElYHbtNRE6/a6fmrE5AcPt3QRag/bHha9gcAS90vi2R90R4nyW3Ia0KZpYNAwxLgaHq/kn0w==
X-Received: by 2002:a17:907:7f92:b0:a8a:6e35:31ef with SMTP id a640c23a62f3a-a902961d872mr433871466b.49.1726181795133;
        Thu, 12 Sep 2024 15:56:35 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c61210sm798269966b.113.2024.09.12.15.56.34
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 15:56:34 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c4146c7b28so1784186a12.2
        for <regressions@lists.linux.dev>; Thu, 12 Sep 2024 15:56:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhcjaBnDyEuxLFCwijw1MeSCTuop0cUtiN3MszZLZZqcLOulFSTLofbTBOHsJ56LQHhggkoM/oKICJsA==@lists.linux.dev
X-Received: by 2002:a05:6402:274a:b0:5c3:d8fd:9a3b with SMTP id
 4fb4d7f45d1cf-5c413e4d06cmr4158380a12.28.1726181793913; Thu, 12 Sep 2024
 15:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io>
 <ZuNjNNmrDPVsVK03@casper.infradead.org> <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk>
 <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com> <415b0e1a-c92f-4bf9-bccd-613f903f3c75@kernel.dk>
In-Reply-To: <415b0e1a-c92f-4bf9-bccd-613f903f3c75@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Sep 2024 15:56:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg51pT_b+tgHuAaO6O0PT19WY9p3CXEqTn=LO8Zjaf=7A@mail.gmail.com>
Message-ID: <CAHk-=wg51pT_b+tgHuAaO6O0PT19WY9p3CXEqTn=LO8Zjaf=7A@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Jens Axboe <axboe@kernel.dk>
Cc: Matthew Wilcox <willy@infradead.org>, Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	Dave Chinner <david@fromorbit.com>, clm@meta.com, regressions@lists.linux.dev, 
	regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Sept 2024 at 15:30, Jens Axboe <axboe@kernel.dk> wrote:
>
> It might be an iomap thing... Other file systems do use it, but to
> various degrees, and XFS is definitely the primary user.

I have to say, I looked at the iomap code, and it's disgusting.

The "I don't support large folios" check doesn't even say "don't do
large folios". That's what the regular __filemap_get_folio() code does
for reads, and that's the sane thing to do. But that's not what the
iomap code does. AT ALL.

No, the iomap code limits "len" of a write in iomap_write_begin() to
be within one page, and then magically depends on

 (a) __iomap_get_folio() using that length to decide how big a folio to allocate

 (b) iomap_write_begin() doing its own "what is the real length:" based on that.

 (c) the *caller* then having to do the same thing, to see what length
iomap_write_begin() _actually_ used (because it wasn't the 'bytes'
that was passed in).

Honestly, the iomap code is just odd. Having these kinds of subtle
interdependencies doesn't make sense. The two code sequences don't
even use the same logic, with iomap_write_begin() doing

        if (!mapping_large_folio_support(iter->inode->i_mapping))
                len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
        [... alloc folio ...]
        if (pos + len > folio_pos(folio) + folio_size(folio))
                len = folio_pos(folio) + folio_size(folio) - pos;

and the caller (iomap_write_iter) doing

                offset = offset_in_folio(folio, pos);
                if (bytes > folio_size(folio) - offset)
                        bytes = folio_size(folio) - offset;

and yes, the two completely different ways of picking 'len' (called
'bytes' in the second case) had *better* match.

I do think they match, but code shouldn't be organized this way.

It's not just the above kind of odd thing either, it's things like
iomap_get_folio() using that fgf_set_order(len), which does

        unsigned int shift = ilog2(size);

        if (shift <= PAGE_SHIFT)
                return 0;

so now it has done that potentially expensive ilog2() for the common
case of "len < PAGE_SIZE", but dammit, it should never have even
bothered looking at 'len' if the inode didn't support large folios in
the first place, and we shouldn't have had that special odd 'len =
min_t(..)" magic rule to force an order-0 thing, because

Yeah, yeah, modern CPU's all have reasonably cheap bit finding
instructions. But the code simply shouldn't have this kind of thing in
the first place.

The folio should have been allocated *before* iomap_write_begin(), the
"no large folios" should just have fixed the order to zero there, and
the actual real-life length of the write should have been limited in
*one* piece of code after the allocation point instead of then having
two different pieces of code depending on matching (subtle and
undocumented) logic.

Put another way: I most certainly don't see the bug here - it may look
_odd_, but not wrong - but at the same time, looking at that code
doesn't make me get the warm and fuzzies about the iomap large-folio
situation either.

                Linus
