Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE42917;
	Tue,  4 Oct 2022 12:32:40 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id gb14so7998916qtb.3;
        Tue, 04 Oct 2022 05:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mAm6cVyQiiO6vug+rJbXVrDQAEKK9J1ugo8edz5Ki04=;
        b=32r3FvtxjzdeGVUUSEkOogwVByh8C4TvkXRsErVeNFauGeP8EG8lxD4hWEhjgWi9gA
         rag78moPboh9kToAvFyyfZvQJC9UThdSUY86cOode0glFgldCgzqLrixq1JBRUP8cuNz
         LQBXX0xPCWt085cDsU2enF/yLmoOTVkH/yByjG32eXn9iVyxXAKUVL1hlr3G4kfvkwmW
         E4oq/zioi31z/uzCsRgEnYv8dDLWkteXvK86Onj+gagnspEEnbJ4g9BC7Nc+YlbT7Z1m
         kNJnYPQ3thABDicc1PyMcBxy8b1DtQuLj9NNwo94R5mpN/si3oOdMAo870tNPB5OCtgb
         HRSw==
X-Gm-Message-State: ACrzQf1shrLtV3tF3lR+pb9QWD3VvwtPQXlH+KbnoKEVaA0FxAXqANNG
	6C62I2wE7Yi++abzJld7XZl46y59Fry2wg==
X-Google-Smtp-Source: AMsMyM5fABNP2OFKLaOgVxvjxzX1HKqpAMQF3HgnLJLrFVcZbT94BcC5kE+HC4FH6TZLipGh3+6qIw==
X-Received: by 2002:ac8:5c8f:0:b0:35c:c6b5:9179 with SMTP id r15-20020ac85c8f000000b0035cc6b59179mr19585556qta.10.1664886758873;
        Tue, 04 Oct 2022 05:32:38 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bm8-20020a05620a198800b006cfc7f9eea0sm13847317qkb.122.2022.10.04.05.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 05:32:38 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-35711e5a5ceso94259117b3.13;
        Tue, 04 Oct 2022 05:32:38 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr23626998ywe.283.1664886758049; Tue, 04
 Oct 2022 05:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home> <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home> <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV> <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org> <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
 <CAMuHMdX8Ko_LiqsWafzcqheW_7SZmtzEvgrpBbyoCLxyWqjqBg@mail.gmail.com>
 <1d3fdc6a-a98a-fe3b-2e3e-acc2ffa24f9d@gmx.com> <20221003102029.1fe4f31b@gandalf.local.home>
 <fde043f3-da34-9fc6-379b-922f29284e66@gmx.com>
In-Reply-To: <fde043f3-da34-9fc6-379b-922f29284e66@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Oct 2022 14:32:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1yp76X6xMFSXnpRNXPBVVLuyqm=UCOZ0uQem0_50poQ@mail.gmail.com>
Message-ID: <CAMuHMdW1yp76X6xMFSXnpRNXPBVVLuyqm=UCOZ0uQem0_50poQ@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mike Rapoport <rppt@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Tue, Oct 4, 2022 at 2:16 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> On 10/3/22 14:20, Steven Rostedt wrote:
> > On Mon, 3 Oct 2022 09:40:43 +0000
> > "Artem S. Tashkinov" <aros@gmx.com> wrote:
> >> For instance, I've CC'ed Linus Torvalds _privately_ from Bugzilla twice
> >> and he _chimed_ in and _helped_ resolve the bugs.
> >
> > You didn't Cc Linus _privately_, because you Cc'd him from Bugzilla. I'm
> > guessing that means it's a public conversation. Which is similar to Cc'ing
> > a maintainer and a public mailing list.
>
> I _did_ CC him privately by adding his _personal_ e-mail. I'm astonished
> not only you don't believe me you turn my words inside out.

I think there is a misunderstanding of the meaning of "CC privately".
To me it means no public data disclosing entity (be it a public mailing
list, or a public bug tracker) was CCed as well.
To you, it seems to mean you used his personal email address instead
of a mailing list address.

> Wow, so pretty much the vast majority of people here advocate for
> deprecating Bugzilla and asking non-IT people to use something which is
> essentially a ... SPAM list?
>
> Woah.
>
> I've given almost a dozen reasons why mailing lists simply don't work as
> a bug tracker in absolute most cases.

And people disagree.  No amount of "Woah" will change that, only
facts and figures can do.

> BTW, this discussion is a perfect f-ing example of that. What could have
> been easily read in a tracker needs to be repeated over and over and
> over again because you didn't bother to read previous messages 'cause
> you were busy, not paying attention, simply forgot and you don't want to
> scroll days of messages in your inbox.
>
> God, this is so ugly it's cringe worthy.
>
> Most people here who advocate for killing off Bugzilla:
>
> 1) Have _never_ used it
> 2) Have troubles even following _this_ conversation
>
> That' ridiculous.

Thanks for your insults.
This is not the way to convince people.

P.S. I did read all of it, I may stop doing so soon...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
