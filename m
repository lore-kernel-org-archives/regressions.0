Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C42584
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 18:05:08 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9891c73e0fbso577772766b.1
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 11:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688839507; x=1691431507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MjnZGX1PQcWVMUP4ngUH52YPa64eL7ZPB4WTz7UhRF0=;
        b=Tig9LWLQHv1fd8ToIKJR7XM7HajkQZKUlFYdJLW5bVkh1LxFCsxx8ZYc2JI2tUvyCF
         ktptoBEAJKb0Opk3ugpsqsFroXyFPmu+nGdiwVcLcLdjhpPlKVve52dpjHBuwFqOKzE7
         Dhmg9r4XhM8ecNaGNDlyb6GnivkhM43v/qAPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688839507; x=1691431507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjnZGX1PQcWVMUP4ngUH52YPa64eL7ZPB4WTz7UhRF0=;
        b=bK3rQsHpoE133PTJ1cUDHFjCBZVavlRGQk5nKyfEu3pXXarjkpNEBli9o6nQDe3IY8
         yTjs1n260sU004hxoFzl+OqWAip2a5s6c2sS7wAIWExnTbH399Iml96TzcQ6I5sTQk8t
         Pf2InQHDMYxTBFlws4tof1mMhETOAljz5o015WjNfjy4UHQP66m8sds1pzUwg9vD9O1G
         hHCuUsDcDWhrN0mTb4F4x7m0iZcKwHk509bS6QQ/ySZYFj0DoDcOeK0ZU08z+OQHHiQc
         4YJuFfRCLRxAHZrCXLLXlq4ktIySGFO+rhJE/Tiyu/f+6QPmWLc2bAMfYwfRsVz+SUvt
         mX3w==
X-Gm-Message-State: ABy/qLZEnwYxrflWej9VxtcxN6vsyB0uVEqlDXFoLWMQr8OaVThzFLtZ
	m9mMnqYeZI4kz43PLY957WNhzyCrq9442GHYzBYx0DCP
X-Google-Smtp-Source: APBJJlEzCp5620HsvMpprcA6IiecJEXDdLjGoOrg0qpIvBk88XuqU1+8VLN50+R7HBUsLCZPsv3UFQ==
X-Received: by 2002:a17:907:9712:b0:993:da5f:5a9b with SMTP id jg18-20020a170907971200b00993da5f5a9bmr4095650ejc.8.1688839507003;
        Sat, 08 Jul 2023 11:05:07 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id o22-20020a17090611d600b00991e2b5a27dsm3767841eja.37.2023.07.08.11.05.06
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 11:05:06 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so7922355a12.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 11:05:06 -0700 (PDT)
X-Received: by 2002:a05:6402:274c:b0:51b:d59f:8518 with SMTP id
 z12-20020a056402274c00b0051bd59f8518mr12625706edd.16.1688839506127; Sat, 08
 Jul 2023 11:05:06 -0700 (PDT)
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
In-Reply-To: <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 11:04:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
Message-ID: <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Suren Baghdasaryan <surenb@google.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Jacob Young <jacobly.alt@gmail.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Jul 2023 at 10:39, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> That was the v1 fix, but after some discussion
> (https://lkml.kernel.org/r/20230705063711.2670599-1-surenb@google.com)
> it was decided to take the "excessive" approach.

That makes absolutely _zero_ sense.

It seems to be complete voodoo programming.

To some degree I don't care what happens in stable kernels, but
there's no way we'll do that kind of thing in mainline without some
logic or reason, when it makes no sense.

flush_cache_dup_mm() is entirely irrelevant to the whole issue, for
several reason, but the core one being that it only matters on broken
virtually indexed caches, so none of the architectures that do per-vma
locking.

And the argument that "After the mmap_write_lock_killable(), there
will still be a period where page faults can happen" may be true
(that's kind of the *point* of per-vma locking), but it's irrelevant.

It's true for *all* users of mmap_write_lock_killable, whether in fork
or anywhere else. What makes fork() so magically special?

It's why we have that vma_start_write(), to say "I'm now modifying
*this* vma, so stop accessing it in parallel".

Because no, flush_cache_dup_mm() is not the magical reason to do that thing.

Maybe there is something else going on, but no, we don't write crazy
code without a reason for it. That's completely unmaintainable,
because people will look at that code, not understand it (because
there is nothing to understand) and be afraid to touch it. For no
actual reason.

The obvious place to say "I'm now starting to modify the vma" is when
you actually start to modify the vma.

> Also, this change needs a couple more updates:

Those updates seem sane, and come with explanations of why they exist.
Looks fine to me.

Suren, please send me the proper fixes. Not the voodoo one. The ones
you can explain.

And if stable wants to do something else, then that's fine. But for
the development kernel,. we have two options:

 - fix the PER_VMA_LOCK code

 - decide that it's not worth it, and just revert it all

and honestly, I'm ok with that second option, simply because this has
all been way too much pain.

But no, we don't mark it broken thinking we can't deal with it, or do
random non-sensible code code we can't explain.

            Linus
