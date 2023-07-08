Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2480F
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 23:03:48 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-c581c758ad8so3732517276.1
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 16:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688857427; x=1691449427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwBj92eIiUbEa/JYqaOxSr02NhzAqRIjjJvbmPFMSxo=;
        b=q8wnNoLteM9JW+3RGd0GkHIMD3jU1gDl75C+fTaQWt5QAwCs7wlLOiouTZAdrQtK3i
         a4IrwA/yeP6VXeQxGaWW0JAcdY/lMDOjJd9nMB0Y/fmz4TXWlll59y557Q3hYUceCeRe
         w9gh7oweFP0r3kMXkm64YZ/B/ggFhCU2n3MzDKImFPTM2g4chapbtSKG9SW6Yhcu0TGK
         pHtMSE7YGKer6zBijlY+FgA5y64a2UUMOIN6Q/iBXQEQiYp9tqAOEAJQMeLj8kxDQIsa
         TStlZEZ4ZB19RRJuB0nJ5gv5cUn5jhSqlqKXDZuwiK75dUs2IsgXNeJsAGMXu2QCmD4T
         QrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688857427; x=1691449427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwBj92eIiUbEa/JYqaOxSr02NhzAqRIjjJvbmPFMSxo=;
        b=LEXXGEyaNWF+XLgoQnHc2x4ANvIug9wLIURvS87GaqYpNPxszyOkHS991T66W+pXSA
         YOhwg5plhq5rfo7rDv3UCR6uQIi9tdj1zp0qIYg95Uc8RWcb/FQ8fmuk21M5VOX5SXvR
         dsc8U4Lx71KKl4lT4TJt16kud46gPRX42X9v5AEEnzx56DD1XWj+WSPDNOmvYqKkvhZ9
         y0GDOB+b0qMpKYAfu+8qu7dMvrIw8lSG2AP1x4ogfqJw/IbGCbiBqAIiPU01LyHvmriJ
         N/8xxmAaJx+e4pQ5DzuiS6wycwFQMTPmCzYbDjhS/zM8QXuS8NtLzh+rd8xNWsYKmD0v
         HaZw==
X-Gm-Message-State: ABy/qLYT8dr57M2i5Z1Hw3OE+GL3S9ewjcIghZd9HUmcNqdfKjdUZbQg
	mfyP8s34u4CfaO37Fr+awOgBXPmrJZr6PBEFgYsfcw==
X-Google-Smtp-Source: APBJJlH7KKflCD9n462UEhT/w6BrMfCGoogXc/HwcWmbTfPF29n1OnJ/9HqyJN4tlPo9OHEugHrnxKyQfd4IB9dP7Rw=
X-Received: by 2002:a25:ad88:0:b0:c77:abc9:d577 with SMTP id
 z8-20020a25ad88000000b00c77abc9d577mr1345314ybi.52.1688857427141; Sat, 08 Jul
 2023 16:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
 <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com> <CAHk-=wi9NQdt3-yHRXExdnu-QpUfXsqiSujkSTg6AdGjabPs6g@mail.gmail.com>
In-Reply-To: <CAHk-=wi9NQdt3-yHRXExdnu-QpUfXsqiSujkSTg6AdGjabPs6g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 16:03:35 -0700
Message-ID: <CAJuCfpGo9BtYmD+1tJikRS51sYx43QMYA10Wm8Bn5MRcuck0Dg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org, regressions@leemhuis.info, 
	bagasdotme@gmail.com, jacobly.alt@gmail.com, willy@infradead.org, 
	liam.howlett@oracle.com, peterx@redhat.com, ldufour@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 3:54=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 15:36, Suren Baghdasaryan <surenb@google.com> wrote=
:
> >
> > On Sat, Jul 8, 2023 at 2:18=E2=80=AFPM Linus Torvalds
> > >
> > > Again - maybe I messed up, but it really feels like the missing
> > > vma_start_write() was more fundamental, and not some "TLB coherency"
> > > issue.
> >
> > Sounds plausible. I'll try to use the reproducer to verify if that's
> > indeed happening here.
>
> I really don't think that's what people are reporting, I was just
> trying to make up a completely different case that has nothing to do
> with any TLB issues.
>
> My real point was simply this one:
>
> > It's likely there are multiple problematic
> > scenarios due to this missing lock though.
>
> Right. That's my issue. I felt your explanation was *too* targeted at
> some TLB non-coherency thing, when I think the problem was actually a
> much larger "page faults simply must not happen while we're copying
> the page tables because data isn't coherent".
>
> The anon_vma case was just meant as another random example of the
> other kinds of things I suspect can go wrong, because we're simply not
> able to do this whole "copy vma while it's being modified by page
> faults".
>
> Now, I agree that the PTE problem is real, and probable the main
> thing, ie when we as part of fork() do this:
>
>         /*
>          * If it's a COW mapping, write protect it both
>          * in the parent and the child
>          */
>         if (is_cow_mapping(vm_flags) && pte_write(pte)) {
>                 ptep_set_wrprotect(src_mm, addr, src_pte);
>                 pte =3D pte_wrprotect(pte);
>         }
>
> and the thing that can go wrong before the TLB flush happens is that -
> because the TLB's haven't been flushed yet - some threads in the
> parent happily continue to write to the page and didn't see the
> wrprotect happening.
>
> And then you get into the situation where *some* thread see the page
> protections change (maybe they had a TLB flush event on that CPU for
> random reasons), and they will take a page fault and do the COW thing
> and create a new page.
>
> And all the while *other* threads still see the old writeable TLB
> state, and continue to write to the old page.
>
> So now you have a page that gets its data copied *while* somebody is
> still writing to it, and the end result is that some write easily gets
> lost, and so when that new copy is installed, you see it as data
> corruption.
>
> And I agree completely that that is probably the thing that most
> people actually saw and reacted to as corruption.
>
> But the reason I didn't like the explanation was that I think this is
> just one random example of the more fundamental issue of "we simply
> must not take page faults while copying".
>
> Your explanation made me think "stale TLB is the problem", and *that*
> was what I objected to. The stale TLB was just one random sign of the
> much larger problem.
>
> It might even have been the most common symptom, but I think it was
> just a *symptom*, not the *cause* of the problem.
>
> And I must have been bad at explaining that, because David Hildenbrand
> also reacted negatively to my change.
>
> So I'll happily take a patch that adds more commentary about this, and
> gives several examples of the things that go wrong.

How about adding your example to the original description as yet
another scenario which is broken without this change? I guess having
both issues described would not hurt.

>
>                 Linus
