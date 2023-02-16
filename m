Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931917B
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 18:59:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bk16so2775068wrb.11
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 10:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=16NwX6E/MJZLYXtvH88vb9mQe/rSJJo8cnIM1GgMvfg=;
        b=pAvCpLSIgO1x1G4Bn7wqyClAVkP3a/hIFiOwWBqd5mHzoyergvav7nACd8mIvPdtUa
         iUwgEhqm+7T/U2cj9qDu5MZ/36YK+zqpWhv9n7Psh7yPUUEHaVaGYYpYVEAI+eEIa/R2
         qTcLa1m51tD21o8nCEOBnlcP7mvNGkC33+oT2Vy1YGJVRoP9vGfvTli2/1VLtvhTYg5R
         U5Jnge0+9TNyKMBtiwn29bc/uhlck+sl0kfwFt9pZQhYFpPo5l1Bd9N1IikIoFzMPeps
         hNh3AeaHjEgHVIVoizu2yEhXDfnOm9OhElcgIJhT+P5UFW2H75nGW40HPPe54EFdGW1o
         mfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16NwX6E/MJZLYXtvH88vb9mQe/rSJJo8cnIM1GgMvfg=;
        b=FBxC5yS8DcsIuIknT8k47gUBn40aXxyqbmwgNGurwuMAYBhWnoekdUnrayV9hBNO0N
         LPG8LKW7poHAgbxtheGfJeYOgV5zXhkO2THU6J05q9fmrJKcX7kUTx2R9lLGmlQ+MbIG
         ibBTJ0ky4ylUmtVGD1zjSMBxLwfaTSfzHKz3zcRunUZ+lqEo058W370AsO/pZXA+scEQ
         VwvjcCiUK8eJvp0LHt2UtG8Erf07G/6JCe1YkPwfItO0wfizRJlF49kb4C8Sbe2MePNe
         mXGDsXy/rsVQ8rZTVYR6Sh1GBMmJ0Tl1b95UBnaciiQArRyTPIltLrs+7fO8QoUXc+3u
         DyJA==
X-Gm-Message-State: AO0yUKVtH+LIFtLrpOQhJvrLxJLlo5O/jVjpKcsLIpyoMTOOHt/TM6Ox
	TTIFK7K94JOaX5zNzqYTS+80GAgX2mZ47HWkaYRalg==
X-Google-Smtp-Source: AK7set8Oneh95L7B1A7lxQ1bkQVa+zW1TlDHlb9LkoKPPo7JGd2outto4zwJErETE9iymz7a4hfE69hDXy9xCgyeaoI=
X-Received: by 2002:adf:f6c6:0:b0:2c3:ea81:64bb with SMTP id
 y6-20020adff6c6000000b002c3ea8164bbmr152263wrp.479.1676573994742; Thu, 16 Feb
 2023 10:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvZqytp3gMnC4-no9EB=Jnzqmu44i8JQo6apiZat-xxPg@mail.gmail.com>
 <CAG_fn=V3a-kLkjE252V4ncHWDR0YhMby7nd1P6RNQA4aPf+fRw@mail.gmail.com>
In-Reply-To: <CAG_fn=V3a-kLkjE252V4ncHWDR0YhMby7nd1P6RNQA4aPf+fRw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 16 Feb 2023 19:58:55 +0100
Message-ID: <CAG_fn=VuD+8GL_3-aSa9Y=zLqmroK11bqk48GBuPgTCpZMe-jw@mail.gmail.com>
Subject: Re: next: x86_64: kunit test crashed and kernel panic
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Jakub Jelinek <jakub@redhat.com>, 
	Peter Collingbourne <pcc@google.com>
Cc: kasan-dev <kasan-dev@googlegroups.com>, open list <linux-kernel@vger.kernel.org>, 
	kunit-dev@googlegroups.com, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

>
> > <4>[   38.796558]  ? kmalloc_memmove_negative_size+0xeb/0x1f0
> > <4>[   38.797376]  ? __pfx_kmalloc_memmove_negative_size+0x10/0x10
>
> Most certainly kmalloc_memmove_negative_size() is related.
> Looks like we fail to intercept the call to memmove() in this test,
> passing -2 to the actual __memmove().

This was introduced by 69d4c0d321869 ("entry, kasan, x86: Disallow
overriding mem*() functions")

There's Marco's "kasan: Emit different calls for instrumentable
memintrinsics", but it doesn't fix the problem for me (looking
closer...), and GCC support is still not there, right?

Failing to intercept memcpy/memset/memmove should normally result in
false negatives, but kmalloc_memmove_negative_size() makes a strong
assumption that KASAN will catch and prevent memmove(dst, src, -2).
