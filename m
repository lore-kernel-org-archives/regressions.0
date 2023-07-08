Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F88C185C
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 18:40:14 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-c4d1b491095so3471647276.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688841613; x=1691433613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MymRbz3ieuUAdzwpPbldo2WgSB6COfwRJnDlIa6QBns=;
        b=Dou3PgTSSuwDMevLhKPDFQkjfTIwUERNti/exYtr8KC5Fr1uRk53y/2upEOgzQAuvB
         yQ6noYSvDpKjTlt1JX2ZzS5ZEb1qJiyf/0pTP/915p/o6pnYju0wBEOcJQcGl7Bb/i/S
         yLRdTHANtBBhE9R87ukPNuhnAWoo7h0BL8OBhnIKPxmiWmElUvKh26paGfvbt526UDU3
         PnuHlmFIDjcC5C4nQr1wzh8srbReVPgN1NtyPbTKt2bLyfTP2GIukl8xGa/zslYieyb+
         VW3PmV52yfQwr0XcWSNOw9gXT2/gnLsXKlRY9rzhUOZk69nShG7+uU898SnCjSXRU8Vk
         MUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688841613; x=1691433613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MymRbz3ieuUAdzwpPbldo2WgSB6COfwRJnDlIa6QBns=;
        b=f4t6gky0px2FjaJeN9TmdjoaWZ6gVMEwggE7nFFVQ+uEOyA1US1NZrFFGWeOGZw1gw
         7FNbEq4xJr1FxWd8aU/Ktx1vXKGD02c82p6zEfY2f37mIqquGTG1KKG53+ANMcuajUxi
         0CZX+ubryRUmQ9AhceGq4sXceAbQOFRvgkk66gz7ghh72wDWzZ2rwS9e1fk46nEi4RGK
         UFLPlkcCb3JJSPbCJ6d89IM5Ped9h1lEl5AW5PLAHmAJPL7Ubp8mmpaekAK/g3eD4Yxl
         j5xYoH8bnl2KINcplUEzYEeQVrhc4N6oMb0VZh8f1CCPC6zm39tJdM8ZnW3vWQPIUq9q
         xiAw==
X-Gm-Message-State: ABy/qLZkbxOUPkzTHMiRNEYVfy4k9O7qNR9dTGds9qH4Br/YRlwLxFx6
	AGVYNIgPxobUVVtdwL7yBRoI+y8rkP3tXYdg4Cy9sw==
X-Google-Smtp-Source: APBJJlE3w2AdZ9A5EaDN/VISkV40ZMSV3+Neg11bBy4VnYWxy1YfNqSmKLOubCHqPUg4as9gjsxMVt/0cyF/xZSuMqs=
X-Received: by 2002:a81:4ed4:0:b0:579:efbb:cbe3 with SMTP id
 c203-20020a814ed4000000b00579efbbcbe3mr7485642ywb.43.1688841612875; Sat, 08
 Jul 2023 11:40:12 -0700 (PDT)
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
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org> <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 11:40:01 -0700
Message-ID: <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jacob Young <jacobly.alt@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, 
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 11:05=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 10:39, Andrew Morton <akpm@linux-foundation.org> wr=
ote:
> >
> > That was the v1 fix, but after some discussion
> > (https://lkml.kernel.org/r/20230705063711.2670599-1-surenb@google.com)
> > it was decided to take the "excessive" approach.
>
> That makes absolutely _zero_ sense.
>
> It seems to be complete voodoo programming.
>
> To some degree I don't care what happens in stable kernels, but
> there's no way we'll do that kind of thing in mainline without some
> logic or reason, when it makes no sense.
>
> flush_cache_dup_mm() is entirely irrelevant to the whole issue, for
> several reason, but the core one being that it only matters on broken
> virtually indexed caches, so none of the architectures that do per-vma
> locking.
>
> And the argument that "After the mmap_write_lock_killable(), there
> will still be a period where page faults can happen" may be true
> (that's kind of the *point* of per-vma locking), but it's irrelevant.
>
> It's true for *all* users of mmap_write_lock_killable, whether in fork
> or anywhere else. What makes fork() so magically special?
>
> It's why we have that vma_start_write(), to say "I'm now modifying
> *this* vma, so stop accessing it in parallel".
>
> Because no, flush_cache_dup_mm() is not the magical reason to do that thi=
ng.

My understanding was that flush_cache_dup_mm() is there to ensure
nothing is in the cache, so locking VMAs before doing that would
ensure that no page faults would pollute the caches after we flushed
them. Is that reasoning incorrect?

>
> Maybe there is something else going on, but no, we don't write crazy
> code without a reason for it. That's completely unmaintainable,
> because people will look at that code, not understand it (because
> there is nothing to understand) and be afraid to touch it. For no
> actual reason.
>
> The obvious place to say "I'm now starting to modify the vma" is when
> you actually start to modify the vma.
>
> > Also, this change needs a couple more updates:
>
> Those updates seem sane, and come with explanations of why they exist.
> Looks fine to me.
>
> Suren, please send me the proper fixes. Not the voodoo one. The ones
> you can explain.

Ok, I think these two are non-controversial:
https://lkml.kernel.org/r/20230707043211.3682710-1-surenb@google.com
https://lkml.kernel.org/r/20230707043211.3682710-2-surenb@google.com

and the question now is how we fix the fork() case:
https://lore.kernel.org/all/20230706011400.2949242-2-surenb@google.com/
(if my above explanation makes sense to you)
or
https://lore.kernel.org/all/20230705063711.2670599-2-surenb@google.com/

Please let me know which ones and I'll send you the patchset including
these patches.
Thanks,
Suren.

>
> And if stable wants to do something else, then that's fine. But for
> the development kernel,. we have two options:
>
>  - fix the PER_VMA_LOCK code
>
>  - decide that it's not worth it, and just revert it all
>
> and honestly, I'm ok with that second option, simply because this has
> all been way too much pain.
>
> But no, we don't mark it broken thinking we can't deal with it, or do
> random non-sensible code code we can't explain.
>
>             Linus
