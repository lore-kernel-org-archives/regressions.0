Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D87B;
	Tue,  4 Oct 2022 10:45:17 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id i17so8075753qkk.12;
        Tue, 04 Oct 2022 03:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=m9GiAv2zn7tOwgDUayjXp6TNSQoaABoD0B7pi612u2E=;
        b=h7XNt7MwciPY53m9VDomyExOew+Ss+i7A64TVkTdpw9o1UsAXB3dS8J5svp66/yHXj
         VyhMMDn73trtBjPHlb+1VAYfGjqm5b+SPCak/9PvxPDB4+koLr6OhbLB3v8d5fQk+Rs5
         EKiiefWEkkantoZodvDuAQK7otiz1RiH0rK9Jzf+mpOktroOtehIoNp/DGvbI1EQ2H1y
         9X7of7UEtfaJ5D8t4X8LsQ0jrly55W55YObaM/8c4tmiOHZREFUY0ncXMwcXPLKfIrgc
         Ekcm7fuvlpZWIe198cuzMyTAWjVARAyHpxiSNMGOfbLzYieFilvOmYfj+fQZS5g7pJse
         UDDA==
X-Gm-Message-State: ACrzQf07Fu4Od/n/O6s4PKUvT9r8rXEQtlvoo32XOIsE59WMcc6L/AR5
	cuW9T6KAPvt/HcCnk0ahtP1y8TpSNjtayw==
X-Google-Smtp-Source: AMsMyM7cQXE47ZIErXTCD5zOmxHs5mEQXoGXaU1UktH3vl2IZH33PjVr2XYEoFzr83MNOwLb9xTVYQ==
X-Received: by 2002:a05:620a:2887:b0:6cf:971e:104d with SMTP id j7-20020a05620a288700b006cf971e104dmr15756186qkp.441.1664880316490;
        Tue, 04 Oct 2022 03:45:16 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id q34-20020a05620a2a6200b006b8d1914504sm14129897qkp.22.2022.10.04.03.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 03:45:16 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id b145so1002335yba.0;
        Tue, 04 Oct 2022 03:45:15 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr23319543ybl.604.1664880315391; Tue, 04
 Oct 2022 03:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info> <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
 <534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net> <e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
 <20221003112605.4d5ec4e9@gandalf.local.home> <eb935178-995b-84f1-6cbe-3492ba74f85b@leemhuis.info>
 <CAMuHMdWq+NntrPqMHzP3XEvKZgjEwSHW80vwWkZnaTORRrhpHA@mail.gmail.com> <409a039b-fd00-a480-ee82-e7a329fa7ae2@leemhuis.info>
In-Reply-To: <409a039b-fd00-a480-ee82-e7a329fa7ae2@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Oct 2022 12:45:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxrmTC8caWpMTJ+s7QscGouJfFsK_3xy+qvNojHyNzkg@mail.gmail.com>
Message-ID: <CAMuHMdWxrmTC8caWpMTJ+s7QscGouJfFsK_3xy+qvNojHyNzkg@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Steven Rostedt <rostedt@goodmis.org>, Slade Watkins <srw@sladewatkins.net>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Tue, Oct 4, 2022 at 12:16 PM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> On 04.10.22 11:20, Geert Uytterhoeven wrote:
> > On Tue, Oct 4, 2022 at 10:41 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >> But I consider explaining things like bisection and localmodconfig in
> >> the documentation as also important, as that's likely something the tool
> >> won't be able to automate any time soon (or never, as realizing that is
> >> likely hard and better left to a separate tool anyway).
> >
> > Creating a simple Linux-specific wrapper around git bisect under
> > scripts/ might be useful?
> > The wrapper could copy .config to
> > $(srctree)/arch/$(ARCH)/config/bisect_defconfig, automatically run
> > "make bisect_defconfig" in each step, and show not only the bisected
> > commit, but also the impact on .config.
>
> Don't worry, I still remember that trick of yours from this discussion:
> https://lore.kernel.org/all/12e09497-a848-b767-88f4-7dabd8360c5e@leemhuis.info/

OK ;-)

> Something like that would be a start, but I'd say having localmodconfig
> covered would be wise also, as it speeds things up tremendously for
> those that start with a full-blown x86 pc distro config.

That's not that much different, as you only need to run "make localmodconfig"
once, as the first step (or as step zero, before starting the bisection).

> There are also people that find regressions when updating from say
> v5.18.15 to v5.19.4 and want to bisect that range; never tried if that
> actually works with a stable git tree, but I'd assume that approach is
> unwise. I also assume a lot of people would prefer to download only the

Yeah, you may run into issues that are fixed in v5.18.15, but not in
v5.18 itself, or in later intermediate steps.
For a short range like v5.18.15 to v5.19.4 (which are not LTS, hence
didn't receive that many updates, which can be good or bad), I don't
expect many problems, though

There are similar (but much worse) issues with bisecting between two
linux-next releases.

> recent history or specific stable branches when cloning the git tree
> (which is possible if you know what to do, but I guess most people don't).

Does it really save that much bandwidth?
How many minutes of 4K streaming video is the kernel nowadays? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
