Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055A80F
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 22:54:00 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99342a599e9so406080666b.3
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688856839; x=1691448839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMLbgJOTu2WV/nORFtWqoUMvz+jr1XXDxLBzD5NfFBo=;
        b=Sg6Ahf+A9qzcGKQMRKk69F4K9URRCUVpjB5cGLSCNq0mu+WuoJBjyae1Dvr9691OD5
         fjxBdSuRdPH0+STiSjYVNN2SUgB5mGOA/pTMaVa2rrtmYzZJmmUv2DXbkLRKWOA/PSG8
         vHEI/eLkcfL96BlYRAhQgI7eVLFxqdLAhrnfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688856839; x=1691448839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMLbgJOTu2WV/nORFtWqoUMvz+jr1XXDxLBzD5NfFBo=;
        b=RH8Wzy2TcjlwidCAaHjyWCDs7/eW9PzLyzYMr7omijQQl4Zvjo/L8oTCxSDGH6iz6f
         xfHMwzL9FteYcE4fMU4jGSmBLPAP2MsTD/PNdLU7zs2aNIDk/CoPEnHuJ8jJdiAC1Fb2
         yoiqNmYhqnKHODy5ws7aNovZ1z4doSgPe30722+aLehP/1rFy1kZxAcGJ5tDHRlcAnxv
         5UJh/3Yg3JGlGEO+KqcgoAmFBsXuhqnVJsJjgiP4qky6gMRb1uwzGjGX5hU/2wEquyTl
         aXVh2dRDkEydaHOssreBUSJ8qVJZgyM4FmhxAnfFbsKDTsvuL8kTwb/zJ+yRGA9OlcZ0
         rvTQ==
X-Gm-Message-State: ABy/qLZOvbioRiMCk0kYUlwMziuej2nEeQ+plA3JsfP1Ll4oeA1dtWWh
	x1HNbcLoHT6YMjqrPwDilMiRJ/I63fWpvFVc5HOH2IgZ
X-Google-Smtp-Source: APBJJlGV6MAv4OfOzz9dovawgj0eU9t5vUjXQCR1P09//UTerYdhOXSPV9kX+SjswrPIDsJ3bIOwAg==
X-Received: by 2002:a17:906:d965:b0:992:6064:f32b with SMTP id rp5-20020a170906d96500b009926064f32bmr7140470ejb.46.1688856838587;
        Sat, 08 Jul 2023 15:53:58 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709066b9900b009894b476310sm3997254ejr.163.2023.07.08.15.53.57
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 15:53:58 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-51e29913c35so4342724a12.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 15:53:57 -0700 (PDT)
X-Received: by 2002:aa7:d383:0:b0:51a:50f2:4e7a with SMTP id
 x3-20020aa7d383000000b0051a50f24e7amr7201378edq.13.1688856837545; Sat, 08 Jul
 2023 15:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com> <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com>
In-Reply-To: <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 15:53:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi9NQdt3-yHRXExdnu-QpUfXsqiSujkSTg6AdGjabPs6g@mail.gmail.com>
Message-ID: <CAHk-=wi9NQdt3-yHRXExdnu-QpUfXsqiSujkSTg6AdGjabPs6g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Suren Baghdasaryan <surenb@google.com>, David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, regressions@leemhuis.info, bagasdotme@gmail.com, 
	jacobly.alt@gmail.com, willy@infradead.org, liam.howlett@oracle.com, 
	peterx@redhat.com, ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, 
	regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Jul 2023 at 15:36, Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Sat, Jul 8, 2023 at 2:18=E2=80=AFPM Linus Torvalds
> >
> > Again - maybe I messed up, but it really feels like the missing
> > vma_start_write() was more fundamental, and not some "TLB coherency"
> > issue.
>
> Sounds plausible. I'll try to use the reproducer to verify if that's
> indeed happening here.

I really don't think that's what people are reporting, I was just
trying to make up a completely different case that has nothing to do
with any TLB issues.

My real point was simply this one:

> It's likely there are multiple problematic
> scenarios due to this missing lock though.

Right. That's my issue. I felt your explanation was *too* targeted at
some TLB non-coherency thing, when I think the problem was actually a
much larger "page faults simply must not happen while we're copying
the page tables because data isn't coherent".

The anon_vma case was just meant as another random example of the
other kinds of things I suspect can go wrong, because we're simply not
able to do this whole "copy vma while it's being modified by page
faults".

Now, I agree that the PTE problem is real, and probable the main
thing, ie when we as part of fork() do this:

        /*
         * If it's a COW mapping, write protect it both
         * in the parent and the child
         */
        if (is_cow_mapping(vm_flags) && pte_write(pte)) {
                ptep_set_wrprotect(src_mm, addr, src_pte);
                pte =3D pte_wrprotect(pte);
        }

and the thing that can go wrong before the TLB flush happens is that -
because the TLB's haven't been flushed yet - some threads in the
parent happily continue to write to the page and didn't see the
wrprotect happening.

And then you get into the situation where *some* thread see the page
protections change (maybe they had a TLB flush event on that CPU for
random reasons), and they will take a page fault and do the COW thing
and create a new page.

And all the while *other* threads still see the old writeable TLB
state, and continue to write to the old page.

So now you have a page that gets its data copied *while* somebody is
still writing to it, and the end result is that some write easily gets
lost, and so when that new copy is installed, you see it as data
corruption.

And I agree completely that that is probably the thing that most
people actually saw and reacted to as corruption.

But the reason I didn't like the explanation was that I think this is
just one random example of the more fundamental issue of "we simply
must not take page faults while copying".

Your explanation made me think "stale TLB is the problem", and *that*
was what I objected to. The stale TLB was just one random sign of the
much larger problem.

It might even have been the most common symptom, but I think it was
just a *symptom*, not the *cause* of the problem.

And I must have been bad at explaining that, because David Hildenbrand
also reacted negatively to my change.

So I'll happily take a patch that adds more commentary about this, and
gives several examples of the things that go wrong.

                Linus
