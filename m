Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56E28F62;
	Mon,  3 Oct 2022 09:27:07 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id y2so6199344qkl.11;
        Mon, 03 Oct 2022 02:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9excRcA/AuyGayqGljoD++Jb4ncrUvF318p9Vq+i1xY=;
        b=JugqI/q0/cOHxMOIrqcHn1ExEUTA2LihZ3QjaXud1mTPYPLCTqzhwuRgkxXhpAPdO/
         njMnX1eY8Bg7sxz8gXsmINDcZ++fzObKzQu2GP+a/vjS0Y9G/q8X+wx+ZH5fe0VQxE4m
         2Hf1mui6joPmmZobLbRV6Tn0/IDf6dHpi890LK/pqTuD0HJqx8J0brfz8yidUjAK23xE
         K07+1CUYMX7soFHHZGmlIdWOtGP0meJNMuJ+cd3jpfg3tmdMP7bNPyKeezhF38LQFwIb
         uIt8KxoCrunkBjFP0J+Q9R06ucUA+MWCOXRIkTL8f4d5hy6e5xCBiHkdW2fkiF2+mTo0
         TPUA==
X-Gm-Message-State: ACrzQf0P4XEtMuCRiSc5SUCGtoY16lXm31OUSpElBs0XQD6HIJlHhwcR
	yPQQ3HvgKEuVyLYEzjoGBPOd+lge+N42bw==
X-Google-Smtp-Source: AMsMyM4uTE5fpQ2JLMeO4+HC6eZd4INcZoItctemV5P4h5+EmSo2ALfhbMeenJOnvrKfRUL3nFtPYA==
X-Received: by 2002:a05:620a:1b8b:b0:6cf:4dbc:e0a9 with SMTP id dv11-20020a05620a1b8b00b006cf4dbce0a9mr12698816qkb.342.1664789226135;
        Mon, 03 Oct 2022 02:27:06 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id m16-20020a05620a291000b006c73c3d288esm10874427qkp.131.2022.10.03.02.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 02:27:05 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 81so4930068ybf.7;
        Mon, 03 Oct 2022 02:27:05 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr17298314ybp.365.1664789225092; Mon, 03
 Oct 2022 02:27:05 -0700 (PDT)
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
In-Reply-To: <251201be-9552-3a51-749c-3daf4d181250@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Oct 2022 11:26:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8Ko_LiqsWafzcqheW_7SZmtzEvgrpBbyoCLxyWqjqBg@mail.gmail.com>
Message-ID: <CAMuHMdX8Ko_LiqsWafzcqheW_7SZmtzEvgrpBbyoCLxyWqjqBg@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Mike Rapoport <rppt@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Mon, Oct 3, 2022 at 11:16 AM Artem S. Tashkinov <aros@gmx.com> wrote:
> On 10/3/22 08:55, Mike Rapoport wrote:
> > On Mon, Oct 03, 2022 at 07:41:08AM +0000, Artem S. Tashkinov wrote:
> >> On 10/2/22 23:04, Al Viro wrote:
> >>> On Sun, Oct 02, 2022 at 10:20:40PM +0000, Artem S. Tashkinov wrote:
> >>>> Bugzilla hasn't been updated in a very long time so it's missing both
> >>>> mailing lists and individual kernel developers.
> >>>>
> >>>> AFAIK, some pieces of kernel have no appropriate mailing lists at all.
> >>>> What about that? I've no clue.
> >>>
> >>> There's that file, right in the root of the source tree.  Called "MAINTAINERS",
> >>> in all-caps...  Could have something to do with locating maintainers, could it not?
> >>>
> >>>> Opt-in will work, except I've no idea how to make it work. Mass email
> >>>> all the kernel developers and politely invite them to sign up? Most will
> >>>> simply ignore it.
> >>>
> >>> Sigh...   You really don't seem to appreciate just how deep a septic
> >>> tank you've jumped into with your combination of "it should be opt-out"
> >>> and "but unsubscribing takes just a minute, what are you unhappy about?!?"
> >>>
> >>> Maybe you are not using email a lot, but for just about everyone who does...
> >>> We have heard that.  Many, many times.  From many sources - spammers,
> >>> "legitimate" companies' marketing departments, etc.
> >>>
> >>> And you keep moving along the same track - the usual reaction of some
> >>> company after having pulled back a bloody stump and enjoyed the pile of
> >>> explanations of the reasons why opt-out is *NOT* *ACCEPTABLE*, *EVER*
> >>> is along the lines of "OK, we'll just spam everyone in our database once
> >>> and ask them to opt-in - that must be OK, right?"
> >>
> >> Being on bugzilla does _not_ mean you'll receive a single email unless
> >> someone _specifically_ CC's you.
> >
> > If I'm not mistaken, bugzilla lets CC people explicitly. How the database
> > of emails in bugzilla would help choosing the right people to CC better
> > than MAINTAINERS?
> >
> > You repeated multiple times that bug reports sent to the mailing lists are
> > ignored, but what will make emails from bugzilla different from those bug
> > reports? Why do you think they will get more attention?
>
> Maybe because they are specific? Maybe because they are not part of a
> high volume mailing list such as LKML? Maybe because lots of developers
> are _not_ on any mailing lists?

If they're sent only to the maintainers, not to the subsystem mailing
lists, they may be ignored, as no one but the maintainer will be aware.

> Imagine instead you send your issue to a random mailing list. What is
> the chance another person with a similar issue will even find it?

Do not underestimate the power of search engines.

> Again the volume of bug reports is relatively low, fewer than two dozen
> a week.

Which proves this tool is insignificant in the grant scheme of (Linux)
things.

> * Multiple reporters can perfectly find the people who have made bad
> commits or who are responsible for certain drivers - it's safer to CC
> them _via_ Bugzilla than to email them _privately_ or via mailing lists
> which entails multiple issues including trust, SPAM, formatting,
> English, net etiquette, etc. etc. etc.

Never send bug reports privately, unless you have a monetary
relationship with the receiving end.  Always Cc the subsystem
mailing list, so anyone involved can help.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
