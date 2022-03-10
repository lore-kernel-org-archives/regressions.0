Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0227A
	for <regressions@lists.linux.dev>; Thu, 10 Mar 2022 10:58:31 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id j2so10208485ybu.0
        for <regressions@lists.linux.dev>; Thu, 10 Mar 2022 02:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vyPILdksEKQ/91DNQr4IF++5+dXCv46TKTfWGt4bI0=;
        b=G5MTkzJkTLDrdd7w0RZQ0IbYpbbue66HLlZVnfI6v+pv6RjaAToFEAScAfAvg3cnw/
         kt+NICDZMuxcikpMAg2ZDFLp9qg/nPfrD8Kb3OQku1y4LY3FmhtV1xcnYhXk4efoCnqb
         HxIyOV594rP1THqqh6x+d+qGx0+JfjEw8Zza12X3a7xp7JiOnpTZ2Q/vaAn9LzzlFJUv
         YL/n8ocaIUwtIePywk18N0ciCOh/5X8Bw4Y7IynHv55H6t3vLYbXupb9Znv5HHWlvBaf
         jXo/mo3M5LxoqLITavHlwPpJ713SZ9nuJMsZQRoLrVzDuuHo7kCIufTjrpSa4mM7+lD9
         9frQ==
X-Gm-Message-State: AOAM533wSWwWL4j3m++8VvTZGrejc1owHyh7x6zPiJs6OFRtzikAhzEo
	/rQyeWtkf5MolyQqeljEfNeH0FmsIwipt8JlzPA=
X-Google-Smtp-Source: ABdhPJyHSLHMgP/mxlDj5pAIHk6jXZ9MHGeA9bBiTuLvuVOxHvz5HeqITq5ICBa7BuoXLjLFWGq8R+hyrkt/HEmslkA=
X-Received: by 2002:a25:fe10:0:b0:625:262f:e792 with SMTP id
 k16-20020a25fe10000000b00625262fe792mr3170099ybe.365.1646909910721; Thu, 10
 Mar 2022 02:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <31b9d1cd-6a67-218b-4ada-12f72e6f00dc@redhat.com> <3f86f46d-947b-8485-bf87-2ebd4477a6c7@leemhuis.info>
In-Reply-To: <3f86f46d-947b-8485-bf87-2ebd4477a6c7@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 10 Mar 2022 11:58:19 +0100
Message-ID: <CAJZ5v0hLjj0UUtBoZ1rqcBm40HhX2AHL8RSvhNb+pzgt5w3izg@mail.gmail.com>
Subject: Re: Many reports of laptops getting hot while suspended with kernels
 >= 5.16.10 || >= 5.17-rc1
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Hans de Goede <hdegoede@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
	Linux PM <linux-pm@vger.kernel.org>, Stable <stable@vger.kernel.org>, 
	Justin Forbes <jmforbes@linuxtx.org>, Mark Pearson <markpearson@lenovo.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 10, 2022 at 11:02 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker.
>
> On 09.03.22 14:44, Hans de Goede wrote:
> >
> > We (Fedora) have been receiving a whole bunch of bug reports about
> > laptops getting hot/toasty while suspended with kernels >= 5.16.10
> > and this seems to still happen with 5.17-rc7 too.
>
> I was about to sent a similar mail, but then I found this one. Thx for
> making my life easier. :-D
>
> But could you do me a big favor and CC the regression mailing list
> (regressions@lists.linux.dev) in case similar situations arise in the
> future? tia!
>
> > The following are all bugzilla.redhat.com bug numbers:
> >
> >    1750910 - Laptop failed to suspend and completely drained the battery
> >    2050036 - Framework laptop: 5.16.5 breaks s2idle sleep
> >    2053957 - Package c-states never go below C2
> >    2056729 - No lid events when closing lid / laptop does not suspend
> >    2057909 - Thinkpad X1C 9th in s2idle suspend still draining battery to zero over night , Ap
> >    2059668 - HP Envy Laptop deadlocks on entering suspend power state when plugged in. Case ge
> >    2059688 - Dell G15 5510 s2idle fails in 5.16.11 works in 5.16.10
> >
> > And one of the bugs has also been mirrored at bugzilla.kernel.org by
> > the reporter:
> >
> >  bko215641 - Dell G15 5510 s2idle fails in 5.16.11 works in 5.16.10
>
> Here is another, but it's basically linking to reports you already
> mentioned:
> https://bugzilla.kernel.org/show_bug.cgi?id=215661
>
> > The common denominator here (besides the kernel version) seems to
> > be that these are all Ice or Tiger Lake systems (I did not do
> > check this applies 100% to all bugs, but it does see, to be a pattern).
> >
> > A similar arch-linux report:
> >
> > https://bbs.archlinux.org/viewtopic.php?id=274292&p=2
> >
> > Suggest that reverting
> > "ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE"
> >
> > which was cherry-picked into 5.16.10 fixes things.
>
> From the thread I gather that it looks like 5.17 is not affected; if

This is most likely correct.

There are at least 3 different sources that have confirmed that.

> that changes, could anybody please give me a heads up please?

Sure.
