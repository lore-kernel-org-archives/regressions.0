Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1A2BD3F
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 23:52:41 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id h10so3760135vsu.11
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 15:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1676591561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r8AHC9C5MjMuHRim+xbd7khMCwzT9fB8DRzXrlAFNl0=;
        b=BWv/RC5RYRHUHlunLNk5iuHtg1N0p0f1GBnHSwDXKG4iLKqS75rNV6TSMQEgMh1COy
         K7ZFRQVDxkm7tcvHZIPunE8E5KuAhqsc2SuZq1FhAnI/9lTkvWU0KOM/XfThWs97mg5P
         0VEUd24R40T+1512zdYPTyvnuJ6PB2FwNVlNkgd/ydD9esxYX113ylMzvFzhsa03fB5O
         JbZmdcPYTCYcTytV00jqyf72ulouC2RZ5wpCsfN20xx1jWmtRF0Vq6kGKQS4S3yhD2bR
         wilXlXXBJ6uus7nvaTSZ+Kp1/FvFACMOZ4dM8ve90//R82+/uGgtYvX3RP3x6pakdUuA
         0P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676591561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8AHC9C5MjMuHRim+xbd7khMCwzT9fB8DRzXrlAFNl0=;
        b=FslqQY59kuCpp5NZmFvDNy5/uzq2J9kyTCkdmKBVAG4+YkJ2u0Wl8sQprtiy5OTlzv
         hKa7QCHO1rKu2P+YWabz9sh0tT29cSXiiXO3MlsosKL7Pk6phwPiybXp8qUlO0Zt328I
         FP8rFbIZOYnFfeIvMydMJ3YxXTVPJurZ3dsEPI3PtI2HgDg4M12FcOAxvpsQtgzQFSRq
         Hcp4xicEUWcZVi4KgIVc8em0VoGMztbDPTQ6gw0IjJFML6hhNhLFntf4P+CTQDhbcIl+
         huKfeaA22ImtRfC9djNddG300fcbMPVxv+vkh6XjWXs+bxXWm0a76fwYg7QRL58UDQbT
         H7AQ==
X-Gm-Message-State: AO0yUKXDMkQ+ez4wDpGsnodWdN6DVdrWtbPwAmJnrg1u/5gm4oP8z6dx
	T0wL8bo5tK9ODC54d1QTL6wsl5jhzsBRO8A4rUTlfg==
X-Google-Smtp-Source: AK7set9s0+V4GZG35TLTtCHNiSMJR5wePZ4+XXizwIrrnw3bn7L+WzNkZ1SID/jr9/iulYpYmS8AAH+NkbFgYjPqBOU=
X-Received: by 2002:a67:70c6:0:b0:412:2e92:21a6 with SMTP id
 l189-20020a6770c6000000b004122e9221a6mr1433170vsc.13.1676591560792; Thu, 16
 Feb 2023 15:52:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvZqytp3gMnC4-no9EB=Jnzqmu44i8JQo6apiZat-xxPg@mail.gmail.com>
 <CAG_fn=V3a-kLkjE252V4ncHWDR0YhMby7nd1P6RNQA4aPf+fRw@mail.gmail.com> <CAG_fn=VuD+8GL_3-aSa9Y=zLqmroK11bqk48GBuPgTCpZMe-jw@mail.gmail.com>
In-Reply-To: <CAG_fn=VuD+8GL_3-aSa9Y=zLqmroK11bqk48GBuPgTCpZMe-jw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 17 Feb 2023 00:52:03 +0100
Message-ID: <CANpmjNOciiDNkWDrkQ+BEgAj=rSYGQAuHVS1DTDfvPHSbAndoA@mail.gmail.com>
Subject: Re: next: x86_64: kunit test crashed and kernel panic
To: Alexander Potapenko <glider@google.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jakub Jelinek <jakub@redhat.com>, Peter Collingbourne <pcc@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, open list <linux-kernel@vger.kernel.org>, 
	kunit-dev@googlegroups.com, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Feb 2023 at 19:59, Alexander Potapenko <glider@google.com> wrote:
>
> >
> > > <4>[   38.796558]  ? kmalloc_memmove_negative_size+0xeb/0x1f0
> > > <4>[   38.797376]  ? __pfx_kmalloc_memmove_negative_size+0x10/0x10
> >
> > Most certainly kmalloc_memmove_negative_size() is related.
> > Looks like we fail to intercept the call to memmove() in this test,
> > passing -2 to the actual __memmove().
>
> This was introduced by 69d4c0d321869 ("entry, kasan, x86: Disallow
> overriding mem*() functions")

Ah, thanks!

> There's Marco's "kasan: Emit different calls for instrumentable
> memintrinsics", but it doesn't fix the problem for me (looking
> closer...), and GCC support is still not there, right?

Only Clang 15 supports it at this point. Some future GCC will support it.

> Failing to intercept memcpy/memset/memmove should normally result in
> false negatives, but kmalloc_memmove_negative_size() makes a strong
> assumption that KASAN will catch and prevent memmove(dst, src, -2).

Ouch - ok, so we need to skip these tests if we know memintrinsics
aren't instrumented.

I've sent a series here:
https://lore.kernel.org/all/20230216234522.3757369-1-elver@google.com/
