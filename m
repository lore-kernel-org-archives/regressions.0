Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD970
	for <regressions@lists.linux.dev>; Fri,  7 May 2021 09:27:56 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id n25so9427154edr.5
        for <regressions@lists.linux.dev>; Fri, 07 May 2021 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/gYeck4lUM7grnsx8SQpzJSN/XTKVSxSWXD4iFD/oQ=;
        b=D10IPK4b2PhhCu2hnFKzAGnI6ajL4rQRqhnhaS7iadmv8UVlRbi2vinA9qsKGa0Uff
         uNkvxsHqgLTxb17g0dBW6Gg3/WIH4FDYH4H1P07+O4nMgGjT7CJJ7AcvLMItPyrkvLJ3
         QxpKBE8gpcflFZLYfOBhJUgzDF2rKWkSQlt8qoOOPUai4RttjARJR2+CNztxfGS0hqf/
         8hAkp4XgWb8Vq3fW1LVsgbugxdSaY5cs6CvU4EqdcHbLvvlZnofh9WwtPL5PiA7CW6Mj
         /ngVvCWwi1BCvWxoBjS13zAfKznt4ROeygEHJwm0ZMOO33frRdKEB0RwOO08iYNpxow9
         NlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/gYeck4lUM7grnsx8SQpzJSN/XTKVSxSWXD4iFD/oQ=;
        b=UDO1vzufU1/85o6tY5zbMFxQUSJEa1AesBOVhQQhhbIFN/qxVGYzgHgok35vnhlNPz
         voA1oYlz5G81a2pbZcT5v+BstVWyNrr2jeIYOUOhYiFF2U3jMvcIhyZrsyhyIQRVeFgz
         BEUGYp2cXz2ECY5yOd1SsP/ugYFZQLf+O4DKdJESPuaUne913bjSySWfbtorh2tCf+pa
         JcAJ3GKcO9JhdglOs6waLmv2QgExn/SBWmsuLC7YAXu62o4cX5rCN6cUxZYi8/7a9wmy
         fPs0kzj94esk6mMvyw8+JtPm1tm3/CPKPtzgOYZuV/yXBfw7LsQBL0TYN/bqh5J+Lc/C
         oefA==
X-Gm-Message-State: AOAM5333vRvhwX8rR0GDIQyEmzt2HC42ku4DvwVjRBTIvGGSv8dfzvhK
	kqARukRQ934rjWNVBx4BThF+Bv6JVu2J/a6Ve6z8Iw==
X-Google-Smtp-Source: ABdhPJwiqY1yRCcURp1ZifCn2m63FfU/YD9avVmXW4JW5mY4TK3HVNFv7i0w5rNQ22zTBKZ4ABKAXaL2OSLRZ5Q2W7o=
X-Received: by 2002:aa7:c15a:: with SMTP id r26mr10395669edp.78.1620379674473;
 Fri, 07 May 2021 02:27:54 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com> <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
 <YJTz+D9Sp8Eyp+iw@atomide.com> <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
In-Reply-To: <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 7 May 2021 14:57:43 +0530
Message-ID: <CA+G9fYsia4mfJpKXcz0Px3oDdsArHatqe0-rWWWC4iD47vj1oA@mail.gmail.com>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Tony Lindgren <tony@atomide.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, regressions@lists.linux.dev, 
	Benoit Cousson <bcousson@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 May 2021 at 13:57, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> On 07.05.21 10:02, Tony Lindgren wrote:
> > * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 15:19]:
> >> On Thu, 6 May 2021 at 17:23, Tony Lindgren <tony@atomide.com> wrote:
> >>> * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 11:00]:
> >>>> Our bisect script pointed this as the first bad commit on linux
> >>>> mainline master branch.
> >>>> commit 98feab31ac491400f28b76a04dabd18ce21e91ba
> >>>> Author: Tony Lindgren <tony@atomide.com>
> >>>> Date:   Wed Mar 10 14:03:51 2021 +0200
> >>>>     ARM: OMAP2+: Drop legacy platform data for dra7 sata
> >>> Thanks for the report, looks like we are now missing the sata related
> >>> quirk flags compared to the patch above.
> >>> Below is a quick patch to add the missing quirk flags that might help
> >>> if you can give it a try.
> >> The reported problem was solved by this patch. Thank you.
> >> Please add reported and tested by tags.
> >> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > OK good to hear and thanks for testing. Will send out a proper patch.
>
> Great to see that this is about to be fixed. And Naresh, many thx for
> giving the #regzb tag a try, even if regzbot (shameless plug for the
> unaware: https://linux-regtracking.leemhuis.info/post/regzbot-approach/
> ) is not up and running already, much appreciated!
>
> But FWIW, you don't need to add the tag to the subject; in fact, better
> use it for it's intended purpose. Instead add the tag to the mail's
> body, like this:
>
> #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy platform data
> for dra7 sata")

Thanks for sharing more details about it.
Next time I will add this to the mail's body.

>
> Just ensure there is a blank line after that, as regzbot will have to
> deal with line breaks (as can be seen above) and somehow needs to decide
> where to stop. ;-)

Alright.

>
> Ohh, and Tony, if you want to do me a favour please include
>
> Link:
> https://lore.kernel.org/regressions/CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com/
>
> in the commit message of the fix, then I have some real data already at
> hand to test regzbot in practice. :-D

- Naresh
