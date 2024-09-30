Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2C17332B
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727740408; cv=none; b=mb7peegVZmDSwFpaWFi5oWdQYsO9wVLqHqU38+zLpPnp0XWu5pazsd1SFm30UeJF/trrm43Ji8FEXAIuouWWUomT90MfLZUF3bK6lYNZHcpH1p4BBm2t/QeO+pKBl5BYy7TMHehBZX4iilSwFJzUQmfF4BFVeyQPYN1W+iJ99m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727740408; c=relaxed/simple;
	bh=jqmfhlo6Nq51O9MWU++JmBpPZJAwV8doQ3e17gImTUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJrYNataqiN3mwhwe4JdFEAA5vwSRbV9SEZ1W0TMqAqCbfFXCkVVsa4RolfvVuMkbOnbJvb5tglprCWD677zbUhXLGXYfvQWfaICLUCMShRl3v6Hy5/eeX/crv4gnfdGBM0EbBmQjE0eKjTAvSc/L8FWEeut0ZYlL/xpjwHlAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F+8cfryL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F+8cfryL"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so7449506a12.1
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 16:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727740405; x=1728345205; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6S4zxOawKjAaveDpwT3Z661D+kmHQpHbS1yW1IiFsM=;
        b=F+8cfryLMpXId9//LYaXML72lX/IaFu9DGJGUW0YAOOy2rUcYx6kRS7bDHqSPYCfcy
         o30wIrThjg5OldjxHlW+O5ApsIHem93Tfb8OYNFxGB5Wah87S5MDqAThYANbpZlMtVYw
         az7Le+pSHmlelNi9guhKQsoUErisYceiZ0xFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727740405; x=1728345205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6S4zxOawKjAaveDpwT3Z661D+kmHQpHbS1yW1IiFsM=;
        b=nQ83TO+zB9mPoP2t0NeELbjpxILR5lpCl6Bc3sBf7sXjf3X1/06CzdRQgspow4vj6V
         wEOSlKafScfYe4t/bRBXCpu2hQ3gsFSHOXP7dr3b4nkDE5g6SjimmyrwAym1MQ8UDYTk
         LzEy/HcDr9XmPyXdk9a/6dJ8m/tmiYj5mhj8A55KPWifCOd0CcwwT1xDuaoui/3cU8W7
         bDAOyD29SirL+crL8YiH/KCb9E+L4rAPH6I/nSqaKFjaAc6DDgA8G5tQfoGELBQUxZ+6
         uSb8STC1jDKG/Ucf1UyaknWA07uLcj1PEdOui/fNFXcyf4e2aWENFqp6mPOhsMPOGMWh
         efaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt9XI/s4HGzXajrubxp6y010VCFWJf/Ozr4/3v0WVFTeGBlTyOxLp7VQ+85sTytEdhmiS7My7F4FC1aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPn0Ifza+xFS0u4i5W4WUrA8yG5LvTFHglL8Ilg8i+MuUHjjmf
	0tTzEfpKGutOXMZpVg57nZLRJYcF9QN5fVORumnywQCaI05HTWV6LMSwq0b4PquK80uZOb1ZJRw
	3xVdFXw==
X-Google-Smtp-Source: AGHT+IE2nF1/xrGZ9NcPzSZH/teDTOB3Vov9ZQjBEPGnGy4V27qyOnLHevboxMgcciqxheoiMTjifQ==
X-Received: by 2002:a17:907:7246:b0:a8d:59d7:f92b with SMTP id a640c23a62f3a-a967c0b4fcbmr107178266b.30.1727740404708;
        Mon, 30 Sep 2024 16:53:24 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2979a27sm606195066b.154.2024.09.30.16.53.22
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 16:53:23 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so1101166266b.1
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 16:53:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8HasMPMRKemDn1TTxXUfWhZVSNNO3ELZbn7otgr2AFChmSR8N6S8XKdujMEmOl8yAHlKS1v0yXZ9w0w==@lists.linux.dev
X-Received: by 2002:a17:907:7294:b0:a8d:5f69:c839 with SMTP id
 a640c23a62f3a-a967bf527c8mr104147566b.15.1727740402409; Mon, 30 Sep 2024
 16:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZuuBs762OrOk58zQ@dread.disaster.area> <CAHk-=wjsrwuU9uALfif4WhSg=kpwXqP2h1ZB+zmH_ORDsrLCnQ@mail.gmail.com>
 <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
 <E6728F3E-374A-4A86-A5F2-C67CCECD6F7D@flyingcircus.io> <CAHk-=wgtHDOxi+1uXo8gJcDKO7yjswQr5eMs0cgAB6=mp+yWxw@mail.gmail.com>
 <D49C9D27-7523-41C9-8B8D-82B2A7CBE97B@flyingcircus.io> <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>
 <CAHk-=wj6YRm2fpYHjZxNfKCC_N+X=T=ay+69g7tJ2cnziYT8=g@mail.gmail.com>
 <295BE120-8BF4-41AE-A506-3D6B10965F2B@flyingcircus.io> <CAHk-=wgF3LV2wuOYvd+gqri7=ZHfHjKpwLbdYjUnZpo49Hh4tA@mail.gmail.com>
 <ZvsQmJM2q7zMf69e@casper.infradead.org>
In-Reply-To: <ZvsQmJM2q7zMf69e@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Sep 2024 16:53:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wire4EQTQAwggte-MJPC1Wy-RB8egx8wjxi7dApGaiGFw@mail.gmail.com>
Message-ID: <CAHk-=wire4EQTQAwggte-MJPC1Wy-RB8egx8wjxi7dApGaiGFw@mail.gmail.com>
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
To: Matthew Wilcox <willy@infradead.org>
Cc: Christian Theune <ct@flyingcircus.io>, Dave Chinner <david@fromorbit.com>, Chris Mason <clm@meta.com>, 
	Jens Axboe <axboe@kernel.dk>, linux-mm@kvack.org, 
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Sept 2024 at 13:57, Matthew Wilcox <willy@infradead.org> wrote:
>
> Could we break out if folio->mapping has changed?  Clearly if it has,
> we're no longer waiting for the folio we thought we were waiting for,
> but for a folio which now belongs to a different file.

Sounds like a sane check to me, but it's also not clear that this
would make any difference.

The most likely reason for starvation I can see is a slow thread
(possibly due to cgroup throttling like Christian alluded to) would
simply be continually unlucky, because every time it gets woken up,
some other thread has already dirtied the data and caused writeback
again.

I would think that kind of behavior (perhaps some DB transaction
header kind of folio) would be more likely than the mapping changing
(and then remaining under writeback for some other mapping).

But I really don't know.

I would much prefer to limit the folio_wait_bit() loop based on something else.

For example, the basic reason for that loop (unless there is some
other hidden one) is that the folio writeback bit is not atomic wrt
the wakeup. Maybe we could *make* it atomic, by simply taking the
folio waitqueue lock before clearing the bit?

(Only if it has the "waiters" bit set, of course!)

Handwavy.

Anyway, this writeback handling is nasty. folio_end_writeback() has a
big comment about the subtle folio reference issue too, and ignoring
that we also have this:

        if (__folio_end_writeback(folio))
                folio_wake_bit(folio, PG_writeback);

(which is the cause of the non-atomicity: __folio_end_writeback() will
clear the bit, and return the "did we have waiters", and then
folio_wake_bit() will get the waitqueue lock and wake people up).

And notice how __folio_end_writeback() clears the bit with

                ret = folio_xor_flags_has_waiters(folio, 1 << PG_writeback);

which does that "clear bit and look it it had waiters" atomically. But
that function then has a comment that says

 * This must only be used for flags which are changed with the folio
 * lock held.  For example, it is unsafe to use for PG_dirty as that
 * can be set without the folio lock held.  [...]

but the code that uses it here does *NOT* hold the folio lock.

I think the comment is wrong, and the code is fine (the important
point is that the folio lock _serialized_ the writers, and while
clearing doesn't hold the folio lock, you can't clear it without
setting it, and setting the writeback flag *does* hold the folio
lock).

So my point is not that this code is wrong, but that this code is all
kinds of subtle and complex. I think it would be good to change the
rules so that we serialize with waiters, but being complex and subtle
means it sounds all kinds of nasty.

            Linus
