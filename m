Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C792C82
	for <regressions@lists.linux.dev>; Tue, 18 Jan 2022 18:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E491C340E6
	for <regressions@lists.linux.dev>; Tue, 18 Jan 2022 18:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642531057;
	bh=2tKT2LkkSw7F1pcMD5R/BU1/Sa9Qs105/gaBZjyvCHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C1e7ptTAiQs29o0U7mXPHIJZ6gO/fvMYPlMLkKf3TYB3Jrbx3nFKNUOJV7aGNHoIt
	 53A0kLQ91GtbPr+i7hPxh3pCyYPsZjkBtysF+cqxMgK85endvY7uBwwbiQinWZJKaJ
	 23DC8TQZ9wh1nJCsH11GXXLF/Wk0rRNc4RKb8UjormQLU7b1E/AZXWhZrbtccBOQxj
	 /7+mdwUrP0o+zcrqc0ZNfo/wv7GssOrITR26dq/JUDXbULS7Fi5/0JDLGUqXDljlAa
	 zVAtwmQuF6YGXc5ApFDPy9oVnu5/c10YdI3rKABTHv6Wyf7Ga8PLnUIHvn6cgCaiJb
	 tIgR/qR9o5Gww==
Received: by mail-ed1-f44.google.com with SMTP id 30so83683383edv.3
        for <regressions@lists.linux.dev>; Tue, 18 Jan 2022 10:37:37 -0800 (PST)
X-Gm-Message-State: AOAM531akudS7yB4xDh4no2Rb8GR/BmnIGyvBRz3UxC+07okC0GolJVf
	nPsFe0VXnEPIweg0HDitIrsx5p9McAmSgiTGnA==
X-Google-Smtp-Source: ABdhPJxo3mZozVtV4I4Y2c/YrH36dX/A++g5u12oIgnT/QjoF3/dV6tPlV2CLl2cYfKHczrqCDPMtB0IsYYCJ5lI3xc=
X-Received: by 2002:a17:906:1604:: with SMTP id m4mr14849598ejd.325.1642531055560;
 Tue, 18 Jan 2022 10:37:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220114105620.GK18506@ediswmail.ad.cirrus.com>
 <5bd2dba7-c56f-4d8c-2f28-f2428afdcead@leemhuis.info> <CAL_JsqKH90fgSPjKqALweEmZDfxy88jAiRZ4uRKE3+-OZv1ZXQ@mail.gmail.com>
 <2f55b629-2e5b-bd45-e0ea-4e476f603dc8@leemhuis.info>
In-Reply-To: <2f55b629-2e5b-bd45-e0ea-4e476f603dc8@leemhuis.info>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Jan 2022 12:37:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLQnPc=eSz_OD4HaK-MqXmmnfQkRNbHHLXpRH--w=dBNQ@mail.gmail.com>
Message-ID: <CAL_JsqLQnPc=eSz_OD4HaK-MqXmmnfQkRNbHHLXpRH--w=dBNQ@mail.gmail.com>
Subject: Re: ChipIdea USB regression
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Peter Chen <peter.chen@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB List <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 18, 2022 at 11:34 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 18.01.22 17:53, Rob Herring wrote:
> > On Sun, Jan 16, 2022 at 4:21 AM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >>
> >> [TLDR: I'm adding this regression to regzbot, the Linux kernel
> >> regression tracking bot; most text you find below is compiled from a few
> >> templates paragraphs some of you might have seen already.]
> >>
> >> Hi, this is your Linux kernel regression tracker speaking.
> >>
> >> Adding the regression mailing list to the list of recipients, as it
> >> should be in the loop for all regressions, as explained here:
> >> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> >>
> >> On 14.01.22 11:56, Charles Keepax wrote:
> >>> Hi guys,
> >>>
> >>> My Zynq based board stopped booting today, a bisect points to this
> >>> patch:
> >>>
> >>> commit 0f153a1b8193 ("usb: chipidea: Set the DT node on the child device")
> >>
> >> Thanks for the report.
> >>
> >> To be sure this issue doesn't fall through the cracks unnoticed, I'm
> >> adding it to regzbot, my Linux kernel regression tracking bot:
> >>
> >> #regzbot ^introduced 0f153a1b8193
> >> #regzbot title usb: chipidea: Zynq based board stopped booting today
> >> #regzbot ignore-activity
> >>
> >> Reminder: when fixing the issue, please add a 'Link:' tag with the URL
> >> to the report (the parent of this mail) using the kernel.org redirector,
> >
> > 'kernel.org redirector' is lore.kernel.org? It would be clearer to
> > just say that.
>
> Yes/No it's lore.kernel.org/r/ (and not lore.kernel.org/list-foo/).
> You're right I'll rephrase next time.

Or now lore.kernel.org/all/...

> >> as explained in 'Documentation/process/submitting-patches.rst'. Regzbot
> >> then will automatically mark the regression as resolved once the fix
> >> lands in the appropriate tree. For more details about regzbot see footer.
> >
> > Would it be possible for you to provide the exact link tag in your
> > reports? That would be easier and less error prone than describing
> > what to do in prose.
>
> Hmm. The webui already provides this (and other things you likely want
> to add) when you show the details for a tracked regression or visit its
> individual page:
>
> https://linux-regtracking.leemhuis.info/regzbot/mainline/
> https://linux-regtracking.leemhuis.info/regzbot/regression/20220114105620.GK18506@ediswmail.ad.cirrus.com/

That is the link I was originally expecting for when I went back to this thread.

> I see that it would be convenient for developers and less error prone if
> I could mention the proper Link: tag in mails like the one you quoted,
> that's why I considered that already. But it would make the regression
> tracker's job (aka my "job", which I'm kinda doing in my spare time) yet
> again somewhat harder, as I see no easy solution to automate that when
> writing these mails (which I do with thunderbird, currently). That's why
> I decided to not do that for now, as that job is already hard enough and
> I don't want to get burned out by this a second time; and those link
> tags are something that were expected from developers even before I came
> with regzbot.

Fair enough, I thought this was more automated than it is. I have some
scripts for writing replies[1] if that helps. I wrote them because I
couldn't find any that would quote emails. (Maybe because it's a pain
dealing with all the encodings). They are geared toward patches in
terms of trimming the email, but shouldn't be too hard to adapt.

Rob

[1] https://gitlab.com/robherring/pw-utils
