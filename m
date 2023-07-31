Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA2610C
	for <regressions@lists.linux.dev>; Mon, 31 Jul 2023 07:50:48 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6bc9353be9bso225744a34.1
        for <regressions@lists.linux.dev>; Mon, 31 Jul 2023 00:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690789848; x=1691394648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySla+zh7bXS0zJ6BSwtEo7bdPw6DFhOQygjTzRggs40=;
        b=Rw6hXn2Dn3x9E0m4rj1rysNpWJqoT37s7gJ/b8cfuwed6TcnYl3X0Th08nQUKKWP3f
         +6mbiNSu5mD6I5DRnFUFiIC1ycwZNSXpxzIdqbzCUGJqmW9LVxm4hT6+QZ3evbixN2On
         99GkuQUveU2kUJH0W/AyvyD5H3BLo+SiW38YahZw00yKCRBYyeizYt6SCICFEn618Uv2
         Cxm9ofKnjEMIw8Htvi4r7HyTwLhuqsfTN5B2WX6B+0txuc1qI+6ATp09nUWmK3XvXOju
         qxgTulosln+NMmRgQLVwYcnVDvIJZgTd7D4oochhJUeva7anOCiOHsvKM2pbZIalCkpL
         xsIQ==
X-Gm-Message-State: ABy/qLYRtul87Hp0+6RiK9yOB9+uTJ2uywbh4h0P3fA8GgKMIRD+d/VC
	S3CqoqOoiIYOB6/rssqpGycbi7QkVoM4sMU8t1A=
X-Google-Smtp-Source: APBJJlE4RlR9kO3u1/JKVXVYALa3WgiPCHVyTOtSlIeq7joQCyK76VuSXgvDaDrkO9owaBUmSm3qWJoFtAvy6yhnVgE=
X-Received: by 2002:a05:6830:6b04:b0:6b8:b83c:a23c with SMTP id
 db4-20020a0568306b0400b006b8b83ca23cmr6286487otb.3.1690789847941; Mon, 31 Jul
 2023 00:50:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169073747103.4140879.6035275932676410922@leemhuis.info> <CAHk-=wj2+Mcvdr3PPvUvchhZRCtLdjSFbK7S5R3N2DrEUCz6jw@mail.gmail.com>
In-Reply-To: <CAHk-=wj2+Mcvdr3PPvUvchhZRCtLdjSFbK7S5R3N2DrEUCz6jw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 31 Jul 2023 09:50:32 +0200
Message-ID: <CAJZ5v0jZ0YHfnxJ7BTEFAZHb+0NO9YAoQ9hypZ66cqpcJsmXYQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-07-30]
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rafael Wysocki <rafael@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mario Limonciello <mario.limonciello@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2023 at 9:41=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 30 Jul 2023 at 10:20, Regzbot (on behalf of Thorsten Leemhuis)
> <regressions@leemhuis.info> wrote:
> >
> > One thing you might be interested in: seems the Ryzen keyboard problems
> > that a9c4a912b7d ("ACPI: resource: Remove "Zen" specific match and
> > quirks") [v6.5-rc1] was supposed to fix once and for all kinda came
> > back, as the new approach apparently still doesn't work on all machines=
:
>
> Gaah.
>
> We must be doing something fundamentally wrong in the irq overrides,
> this is ridiculous. One step forwards, two steps back.
>
> Right now all our entries in that override table say "don't override".
>
> In fact, right now they all seem to be about the legacy keyboard irq.
> I get the feeling that we are just doing something horribly horribly
> wrong wrt the override thing, and that all these quirks come from
> that.
>
> I get the feeling that maybe we simply should strive to use the values
> the BIOS has _programmed_, not the DSDT or MADT values at all?

I'm not sure why we don't do that, it all has started way in the past.

> After all, the BIOS has presumably set things up so that the keyboard wor=
ks,
> so us taking values from the BIOS tables (which are clearly
> unreliable) is a bit suspect.

Yeah, fair enough.

> IOW, maybe we should simply never touch the irq setup for irq 1?
>
> Does anybody have any idea what MS does?

I've never got a coherent answer to this question TBH.  Let me ask
around and see what I can find.

Cheers,
Rafael
