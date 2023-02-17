Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EEE7F
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 07:30:02 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id i2so701607ual.7
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 23:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AaFc9U9vYkJWTuUxQlSrpWrlwRWSsnO1tJS6q4VH5W4=;
        b=TSXVN4RAjB8gKl5Z1yahyFnITPfu5lqbpL7BVaeg0fH617+OmS9alOEehBuvGkN/KD
         IRsOfbMhyRi4UVwoF2DBRsMaQssAly9wUXGzaLew905wq4Nd7SvicYVzJJ3juh/669oT
         k5BPJGG8BYSZnWkMQ4IhGx5Whjdj+3+v5mllPZvRawq7o21Im/plHhYIxwXWqTszxTgY
         APeRqTn3K5HMGDsAdOvaMU7waaHMHxgjVH/1sbz9/OoY5ZIieqE9jpTRfVsjgY38S0J/
         tpH+b5bwHoKDogZeD0+tMXWVEOUbEHwtJ3Ox52tqDKaeC+QtwXg5g6ZeTQR5iBOAzXpn
         +8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaFc9U9vYkJWTuUxQlSrpWrlwRWSsnO1tJS6q4VH5W4=;
        b=p3pLi2e95DD79VPZ7ACiPLreLAdAKw1NLenqfeojq3I03P/raYQdraYXAyaklxhCph
         kv99JNV4BJIsfcL4xu0MbeR+8s3y5sMV0n+pBhQdw1FJxj2ZbkETiGXi2Z/cK5dPz/W2
         gduiPsPHVEOid/pgQ6Bup0E0JJYoaZs1meVWKk8LspF6R7kT6s/NYfuYUrc6WpB94eNB
         ZI9T1S1kLC0cXEzN2Gzx59Km5XneEKGKB+9sEi2LUBioOVmoaPpd+s79VUKFtk3q5N2u
         5/0hVf6PvSCbOx9G30PvbCClqAJzWpPkucnijrv5OA5vwN2vinaOIE6kdHGQ9HXoQrxq
         KNAg==
X-Gm-Message-State: AO0yUKVSBQjWOXcKOIUXKbGKeiT5hiuHJ8mRgdFMVPpSEqkwiCusfCta
	7tMpDOQcm6ujVk8UbpBsryu63AJqVO7m1imRXw7kXQ==
X-Google-Smtp-Source: AK7set9DF9KeFw9LzyQH5Z6doKGd/0FaFayUaEkUBWy5Rjgx+3emgp23EIrxCij/WAG2qoon3dmfE1FIOTJQFjuGcfM=
X-Received: by 2002:a9f:305e:0:b0:68b:a181:563c with SMTP id
 i30-20020a9f305e000000b0068ba181563cmr497812uab.0.1676619001255; Thu, 16 Feb
 2023 23:30:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvZqytp3gMnC4-no9EB=Jnzqmu44i8JQo6apiZat-xxPg@mail.gmail.com>
 <CAG_fn=V3a-kLkjE252V4ncHWDR0YhMby7nd1P6RNQA4aPf+fRw@mail.gmail.com>
 <CAG_fn=VuD+8GL_3-aSa9Y=zLqmroK11bqk48GBuPgTCpZMe-jw@mail.gmail.com> <CANpmjNOciiDNkWDrkQ+BEgAj=rSYGQAuHVS1DTDfvPHSbAndoA@mail.gmail.com>
In-Reply-To: <CANpmjNOciiDNkWDrkQ+BEgAj=rSYGQAuHVS1DTDfvPHSbAndoA@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 17 Feb 2023 12:59:50 +0530
Message-ID: <CA+G9fYvLmhfw7dk_rhXBHd7YESGtAndmhdcW2=VGANfk0ho9Uw@mail.gmail.com>
Subject: Re: next: x86_64: kunit test crashed and kernel panic
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jakub Jelinek <jakub@redhat.com>, Peter Collingbourne <pcc@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>, open list <linux-kernel@vger.kernel.org>, 
	kunit-dev@googlegroups.com, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marco,

On Fri, 17 Feb 2023 at 05:22, Marco Elver <elver@google.com> wrote:
>
> On Thu, 16 Feb 2023 at 19:59, Alexander Potapenko <glider@google.com> wrote:
> >
> > >
> > > > <4>[   38.796558]  ? kmalloc_memmove_negative_size+0xeb/0x1f0
> > > > <4>[   38.797376]  ? __pfx_kmalloc_memmove_negative_size+0x10/0x10
> > >
> > > Most certainly kmalloc_memmove_negative_size() is related.
> > > Looks like we fail to intercept the call to memmove() in this test,
> > > passing -2 to the actual __memmove().
> >
> > This was introduced by 69d4c0d321869 ("entry, kasan, x86: Disallow
> > overriding mem*() functions")
>
> Ah, thanks!
>
> > There's Marco's "kasan: Emit different calls for instrumentable
> > memintrinsics", but it doesn't fix the problem for me (looking
> > closer...), and GCC support is still not there, right?
>
> Only Clang 15 supports it at this point. Some future GCC will support it.
>
> > Failing to intercept memcpy/memset/memmove should normally result in
> > false negatives, but kmalloc_memmove_negative_size() makes a strong
> > assumption that KASAN will catch and prevent memmove(dst, src, -2).
>
> Ouch - ok, so we need to skip these tests if we know memintrinsics
> aren't instrumented.
>
> I've sent a series here:
> https://lore.kernel.org/all/20230216234522.3757369-1-elver@google.com/

Thanks for sending this patch series.

I request you to share your Linux tree / branch / sha.
I will rebuild it with clang-16 and run kunit tests and get back to
you soon with results.

- Naresh
