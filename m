Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0C91851
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 19:06:11 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso48756661fa.3
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688843170; x=1691435170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o+hqttwHhvpKq8WU0CE6n+csMr8KAQKC/7ZFjSW0qHs=;
        b=BBBDWJ8pR7idPI3iYhZgBOEEIpLZWv8w5xVSH76wb3YlQvLIvZAIadsvS0Zj8cAUtT
         PTGb2Se41jaiSNzoMH/2ms9eq4kcnS13IFgmciXpyhH2k+LVRlNN6OC5AcpFTdKVPGB5
         wUtGDrkBN7J+SDFp/wRdlUg1hXapk6UaSo5Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843170; x=1691435170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+hqttwHhvpKq8WU0CE6n+csMr8KAQKC/7ZFjSW0qHs=;
        b=AdJCfVTqAWKw3g+SqHX/EaSFORAwf52Scg/IsAhk84qDUTJuab6pr4/Wm9PRjWZKiT
         yul/r6RywCo1TY57rLG40lzu2kYSb1oYuy7MZIubHb4mrfpTTtPIKLAmojoRe0ZyhbjH
         ktd3twiJylC1Yd0+VOln/rUgzUYSC25Ky82b7hAC3cTbnZdGj1OOmMs0+BVMJoe3Brq0
         sRaRAUWXGxsqhlgGcMi6tRVLl3MFYUM5qdegQHj1BId8tAJdSW2TzbzQWCfhTeW6TN82
         WYP1UH5Bfy52GCx78mvcZNgJmp3jT4FfBdUTsln9a7ljjK8wFlqxN2UVy/rX1fgvnxTJ
         N86Q==
X-Gm-Message-State: ABy/qLZCDJyehjCKXt966z88zbKYa8JOHmLO/VIL/RymQ03t5NhJ/qc9
	JVoehRtmDXCzZqbT4UniIazSn3L7iscCaHI+vTKzih6R
X-Google-Smtp-Source: APBJJlEBwsL9NGCXBS6qMMZ741WEAICW+BOskfL0VQEpQGFBZxDCOzk/zcHlhiFuFpsStcLUErFnTQ==
X-Received: by 2002:a05:6512:3e09:b0:4f8:6aa4:17ec with SMTP id i9-20020a0565123e0900b004f86aa417ecmr7971918lfv.43.1688843169604;
        Sat, 08 Jul 2023 12:06:09 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id c9-20020a056402120900b0050cc4461fc5sm3503360edw.92.2023.07.08.12.06.09
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 12:06:09 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51e28b299adso4145050a12.2
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:06:09 -0700 (PDT)
X-Received: by 2002:aa7:c1d4:0:b0:51d:d622:713d with SMTP id
 d20-20020aa7c1d4000000b0051dd622713dmr5404706edp.39.1688843168772; Sat, 08
 Jul 2023 12:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com> <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
In-Reply-To: <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 12:05:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
Message-ID: <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Jul 2023 at 11:40, Suren Baghdasaryan <surenb@google.com> wrote:
>
> My understanding was that flush_cache_dup_mm() is there to ensure
> nothing is in the cache, so locking VMAs before doing that would
> ensure that no page faults would pollute the caches after we flushed
> them. Is that reasoning incorrect?

It is indeed incorrect.

The VIVT caches are fundamentally broken, and we have various random
hacks for them to make them work in legacy situations.

And that flush_cache_dup_mm() is exactly that: a band-aid to make sure
that when we do a fork(), any previous writes that are dirty in the
caches will have made it to memory, so that they will show up in the
*new* process that has a different virtual mapping.

BUT!

This has nothing to do with page faults, or other threads.

If you have a threaded application that does fork(), it can - and will
- dirty the VIVT caches *during* the fork, and so the whole
"flush_cache_dup_mm()" is completely and fundamentally race wrt any
*new* activity.

It's not even what it is trying to deal with. All it tries to do is to
make sure that the newly forked child AT LEAST sees all the changes
that the parent did up to the point of the fork. Anything after that
is simply not relevant at all.

So think of all this not as some kind of absolute synchronization and
cache coherency (because you will never get that on a VIVT
architecture anyway), but as a "for the simple cases, this will at
least get you the expected behavior".

But as mentioned, for the issue of PER_VMA_LOCK, this is all *doubly*
irrelevant. Not only was it not relevant to begin with (ie that cache
flush only synchronizes parent -> child, not other-threads -> child),
but VIVT caches don't even exist on any relevant architecture because
they are fundamentally broken in so many other ways.

So all our "synchronize caches by hand" is literally just band-aid for
legacy architectures. I think it's mostly things like the old broken
MIPS chips, some sparc32, pa-risc: the "old RISC" stuff, where people
simplified the hardware a bit too much.

VIVT is lovely for hardware people becasue they get a shortcut. But
it's "lovely" in the same way that "PI=3" is lovely. It's simpler -
but it's _wrong_.

And it's almost entirely useless if you ever do SMP. I guarantee we
have tons of races with it for very fundamental reasons - the problems
it causes for software are not fixable, they are "hidable for the
simple case".

So you'll also find things like dcache_page_flush(), which flushes
writes to a page to memory. And exactly like the fork() case, it's
*not* real cache coherency, and it's *not* some kind of true global
serialization.

It's used in cases where we have a particular user that wants the
changes *it* made to be made visible. And exactly like
flush_cache_dup_mm(), it cannot deal with concurrent changes that
other threads make.

> Ok, I think these two are non-controversial:
> https://lkml.kernel.org/r/20230707043211.3682710-1-surenb@google.com
> https://lkml.kernel.org/r/20230707043211.3682710-2-surenb@google.com

These look sane to me. I wonder if the vma_start_write() should have
been somewhere else, but at least it makes sense in context, even if I
get the feeling that maybe it should have been done in some helper
earlier.

As it is, we randomly do it in other helpers like vm_flags_set(), and
I've often had the reaction that these vma_start_write() calls are
randomly sprinked around without any clear _design_ for where they
are.

> and the question now is how we fix the fork() case:
> https://lore.kernel.org/all/20230706011400.2949242-2-surenb@google.com/
> (if my above explanation makes sense to you)

See above. That patch is nonsensical. Trying to order
flush_cache_dup_mm() is not about page faults, and is fundamentally
not doable with threads anyway.

> https://lore.kernel.org/all/20230705063711.2670599-2-surenb@google.com/

This is the one that makes sense to me.

               Linus
