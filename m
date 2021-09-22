Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E313FC8
	for <regressions@lists.linux.dev>; Wed, 22 Sep 2021 11:21:28 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id q81so4678432qke.5
        for <regressions@lists.linux.dev>; Wed, 22 Sep 2021 04:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XBkQaLoJFY3Nt7OwoQ6/7lzhxTuoEyjysqz5W7urwSI=;
        b=PlpkA6+3wsVQJU0jUmF5nNb/fwQsrdTvfonPn2SL6UVtcj1PjnfKqKn7v1DhHtuf2s
         iitwrOiQhTfJOtWYRyjIHatzadgc/uu34c6YMNneSINqQuHT2NoDXdNyzU0wfqawf+Ny
         b2Q8T8w1HWNHzGCn3h8Vq6gs8KcbSXTECnqQTOV8maQVxGNu2T+FwyqgxkAkbxfQK5Tb
         rXUkD9VXDVy1Wc1/L40UwUXDR4uXFvHvQmOZpDaBBs/3NBuZU/gpQbEHe+0TR8vk20cG
         hOeoD/5qJAVHtZrlyBxjyj0ZaILGTJ2WZzMmetIqwWsm/PmDs4HrTF+q3+KEmEwYYCoG
         /Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XBkQaLoJFY3Nt7OwoQ6/7lzhxTuoEyjysqz5W7urwSI=;
        b=AlszyFRWuX7Qfe7sJMUqrIFwHUe/9pyjhfSrpEGoEQTFO1N6chEul2r5bGa/AwNmaR
         tRifW4IiNl9mgwPRfSqXmPhHZu0+99gBRkJutCE2rPOy3iXuDQHBPvXH4Oi/OmWra8IK
         YJtoHfxGAXqAE6l+XbY2/oYR5Xztw+GQ78DojBopkeFut3p9aTd9UY78uzXDyQE1BMUy
         LgHcroOMSL4Xm379UcER46dZmIJa9VxEDIQ4r07kCYwa3R21pxi1uD3PjEGgwfNh0Ija
         Ctd07kqJFS60PrVGgAeRU8W42MRSDiWJv26MTVGR07WODP+lJhCc8Jw06ZgaHbTJBZ5O
         U0cA==
X-Gm-Message-State: AOAM5320F03EYl2NTDqwHanDV3pfte62LLOmHa0NkmxHIhUe6K6MN4iY
	f7qpGyJjCd8rr8cUY6ZWyLpmiX1AUSF9xAYQF/Y=
X-Google-Smtp-Source: ABdhPJxfOxoaqJ9qJtwPKJmRdP07b/eFIWne3Aru1UUuefVLCXuB27CA8ThyVovWBMbZpLUbMzIDsRfYFxcJnJRqzvU=
X-Received: by 2002:a5b:ecb:: with SMTP id a11mr44209942ybs.434.1632309687464;
 Wed, 22 Sep 2021 04:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACT4Y+YvovgRNC5EFhN_d=jApwSAsWcNj35=FCJf1k867vBqfw@mail.gmail.com>
 <067b8eea-3c77-c1f0-8e68-b99e6bf0c033@leemhuis.info>
In-Reply-To: <067b8eea-3c77-c1f0-8e68-b99e6bf0c033@leemhuis.info>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 22 Sep 2021 13:21:18 +0200
Message-ID: <CAKXUXMxg-eywEYrR0oSAo14F7CmiYAT7VDxV71U4-Tv8E0LeVQ@mail.gmail.com>
Subject: Re: finding regressions with syzkaller
To: Thorsten Leemhuis <linux@leemhuis.info>, Paul Albertella <paul.albertella@codethink.co.uk>
Cc: Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guillaume Tucker <guillaume.tucker@collabora.com>, automated-testing@yoctoproject.org, 
	Sasha Levin <sashalevin@google.com>, Marco Elver <elver@google.com>, 
	syzkaller <syzkaller@googlegroups.com>, Mara Mihali <mihalimara22@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 1:25 PM Thorsten Leemhuis <linux@leemhuis.info> wro=
te:
>
> [CCing Lukas]
>
> Hi Dmitry!
>
> On 10.08.21 19:08, Dmitry Vyukov wrote:
> > [...]
> > The idea is to generate random test programs (as syzkaller does) and
> > then execute them on 2 different kernels and compare results (so
> > called "differential fuzzing"). This has the potential of finding not
> > just various "crashes" but also logical bugs and regressions.
>
> Hmmm, interesting concept!
>
> > The major issue is various false positive differences caused by
> > timings, non-determinism, accumulated state, intentional and
> > semi-intentional changes (e.g. subtle API extensions), etc. We learnt
> > how to deal with some of these to some degree, but feasibility is
> > still an open question.
>
> Sounds complicated and like a lot of manual work.
>
> Do you have in mind that Linus and hence many other Kernel developers
> afaics only care about regressions someone actually observed in a
> practice? Like a software or script breaking due to a kernel-side change?
>
> To quote Linus from
> https://lore.kernel.org/lkml/CA+55aFx3RswnjmCErk8QhCo0KrCvxZnuES3WALBR1Nk=
PbUZ8qw@mail.gmail.com/
>
> ```The Linux "no regressions" rule is not about some theoretical
> "the ABI changed". It's about actual observed regressions.
>
> So if we can improve the ABI without any user program or workflow
> breaking, that's fine.```
>
> His stance on that afaik has not changed since then.
>
> Thus after ruling our all false positives syzkaller might find, there
> will always be the follow-up question "well, does anything/anyone
> actually care?". That might be hard to answer and requires yet more
> manual work by some human. Maybe this working hours at least for now are
> better spend in other areas.
>
> > Since this work is in very early stage, I only have very high-level que=
stions:
> >  - what do you think about feasibility/usefulness of this idea in gener=
al?
>
> TBH I'm a bit sceptical due to the above factors. Don't get me wrong,
> making syzkaller look out for regressions sounds great, but I wonder if
> there are more pressing issues that are worth getting at first.
>
> Another aspect: CI testing already finds quite a few regressions, but
> those that are harder to catch are afaics often in driver code. And you
> often can't test that without the hardware, which makes me assume that
> syzkaller wouldn't help here (or am I wrong?)
>
> >  - any suggestions on how to make the tool find more differences/bugs
> > or how to make it more reliable?
> >  - is there a list or pointers to some known past regressions that
> > would be useful to find with such tool? (I've looked at the things
> > reported on the regressions@ list, but it's mostly crashes/not
> > booting, but that's what syzkaller can find already well)
>
> I first wanted to tell you "look up the reports I compiled in 2017 in
> the LKML archives", but I guess the way better solution is: just grep
> for "regression" in the commit log.
>
> >  - anybody else we should CC?
>
> I guess the people from the Elisa project might be interested in this,
> that's why I CCed Lukas.
>

Thanks, Thorsten. I do follow the syzkaller mailing list, so I have
seen that email before, but I do appreciate your implicit
acknowledgement here :)

... and Dmitry is back from vacation and I guess we will hear more
today at the Testing and Fuzzing MC on this topic.

Further people/lists to CC are: Paul Albertella
<paul.albertella@codethink.co.uk> (already CCed here)

I am personally certainly interested and I think this work gives
companies in the area of building trustable software and systems (see
Paul's area of expertise) a good understanding how reliable and to
which extent the statement "all Linux kernels are backwards
compatible" really holds.

I unfortunately lost the Fuzzing Team (Jouni H=C3=B6gander, Jukka Kaartinen
et al.) previously working with me, and I need to first get back some
budget, build up a new team and hope that we can then also follow this
idea and contribute here as well. (Fingers crossed that I can convince
some others to give me money and work with me on this...)

Looking forward to the presentation at the MC.

Best regards,

Lukas
