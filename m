Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E382F4A
	for <regressions@lists.linux.dev>; Fri, 20 May 2022 17:28:46 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id v66so10727225oib.3
        for <regressions@lists.linux.dev>; Fri, 20 May 2022 10:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJV//q4C+9A8+JynDsrPULdS+3PNMfOCw/IssIKP16o=;
        b=lqjsrr+pfYAGghM/3IYxhgJS8jGQ+XlKdPGeBOVSMF01xv7MVSJBIWIgmKQ6u5H7EC
         CdSU2X+8spRMfr/k2ncLLnRgJOynr4Rbfbfxf0uOpUB/GKnWC/piU6pn55pjzSHHqkno
         LBPTO1Wk9FjWIRVEDx07/rh27z0ICXZH3kNsk5YojYTf7oQ19p2FgBYBPN5McGtLJK1o
         un4x0Lujsrq45IXG9A07ApSb3+7xPX4vOixg5sAF96aaAPT9mIRrgKCrblDQezb8NTIW
         N+64rUiOYTKY1Fy2mvV484io7ygZF8Sp9G7z8OrX7FoVzpJLTUEz9xBrNME/ng24Hz02
         Jx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJV//q4C+9A8+JynDsrPULdS+3PNMfOCw/IssIKP16o=;
        b=EPwy3165lS6Q+RXoUOw0N/cDq6JLrEAYnxXQtlKww/Baf+wQNd8bo03AsuZU1cH4Dy
         aQ/iPTW/AY9o4F8HcJIZUbXKuc/hCeZ4DCAtZauFCNGuOTFcFzHveSdbCkdIyvtwzxUu
         JlfS4Kz2Qs4zxV+2AOv0XN3k0IF9waobqD7MQmqTdAJ2hx/J63aSU9Qtg/NW5Z5jANj1
         l/G0v0rqkr9GlNhvS0GTj1qDp3nZu8H6wKb/f6bpw91pZIsi4dfRonWJRJd8EadZlHRZ
         3e+YIPN7wKIO2HPJGhe0/XkB4q67Y2SyP57b4udsZPwJH50vvmRcW4IdKe3fQDsMOGHD
         xQyg==
X-Gm-Message-State: AOAM531bgW8CT5WcmNoMxleYNZho1kbaeOCHIyqn0Fmq7XmDv2634ZSN
	rhjjzWSNuA+KB4tObjUAQrPjyc0cNgNgvP8+iPY=
X-Google-Smtp-Source: ABdhPJzve0DTjiYQrp8wbZsMGhQApnnSSk2ujTqRgV6cbl0vEP2x0jeqLmCnKUADThYGL+hlxOE+qrXR/HQzdowXe3o=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr6312601oib.128.1653067725056; Fri, 20
 May 2022 10:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
 <CACRpkdbzk55pmK9XMwc470O8vJFUBQ6zs35shOYCFKr+YaOezw@mail.gmail.com>
 <CACjc_5q247Yb8t8PfJcudVAPFYQcioREAE3zj8OtPR-Ug_x=tA@mail.gmail.com>
 <CACRpkda=0=Hcyyote+AfwoLKPGak7RV6VFt6b0fMVWBe8veTwA@mail.gmail.com>
 <CACjc_5r7i3HJ466MtwR0iZD6jdVXEqq4km0Tn7XwRijGnsDz=Q@mail.gmail.com>
 <CACRpkdZGVq19GZuOP1BwLB2-qxj1_=O9tHMVRvphvy3m6KbNig@mail.gmail.com>
 <CAMRc=McPSFQFPP1nSTXj3snKWqQyzNgz0j_J5ooyUrhRFRMqJQ@mail.gmail.com> <a0ce4372-df94-a19c-063d-274e65da7c38@leemhuis.info>
In-Reply-To: <a0ce4372-df94-a19c-063d-274e65da7c38@leemhuis.info>
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Fri, 20 May 2022 14:28:19 -0300
Message-ID: <CACjc_5oRRHdCjbSEeMMY2DeJRyFDcbQ2Vk7vaFC9h+kas8zC9g@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	stable <stable@vger.kernel.org>, regressions@lists.linux.dev, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Edmond Chung <edmondchung@google.com>, 
	Andrew Chant <achant@google.com>, Will McVicker <willmcvicker@google.com>, 
	Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Fri, May 20, 2022 at 6:12 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 16.02.22 15:40, Bartosz Golaszewski wrote:
> > On Tue, Feb 15, 2022 at 10:56 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >>
> >> On Mon, Feb 14, 2022 at 12:24 AM Marcelo Roberto Jimenez
> >> <marcelo.jimenez@gmail.com> wrote:
> >>> On Sat, Feb 12, 2022 at 1:55 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >>
> >>>> I am curious about the usecases and how deeply you have built
> >>>> yourselves into this.
> >>>
> >>> I don't know if I understand what you mean, sorry.
> >>
> >> Why does the user need the sysfs ABI? What is it used for?
> >>
> >> I.e what is the actual use case?
> >>
> >>>>> In any case, the upstream file should be enough to test the issue reported here.
> >>>>
> >>>> The thing is that upstream isn't super happy that you have been
> >>>> making yourselves dependent on features that we are actively
> >>>> discouraging and then demanding that we support these features.
> >>>
> >>> Hum, demanding seems to be a strong word for what I am doing here.
> >>>
> >>> Deprecated should not mean broken. My point is: the API seems to be
> >>> currently broken. User space apps got broken, that's a fact. I even
> >>> took the time to bisect the kernel and show you which commit broke it.
> >>> So, no, I am not demanding. More like reporting and providing a
> >>> temporary solution to those with a similar problem.
> >>>
> >>> Maybe it is time to remove the API, but this is up to "upstream".
> >>> Leaving the API broken seems pointless and unproductive.
> >>>
> >>> Sorry for the "not super happiness of upstream", but maybe upstream
> >>> got me wrong.
> >>>
> >>> We are not "making ourselves dependent on features ...". The API was
> >>> there. We used it. Now it is deprecated, ok, we should move on. I got
> >>> the message.
> >>
> >> Ouch I deserved some slamming for this.
> >>
> >> I'm sorry if I came across as harsh :(
> >>
> >> I just don't know how to properly push for this.
> >>
> >> I have even pushed the option of the deprecated sysfs ABI
> >> behind the CONFIG_EXPERT option, which should mean that
> >> the kernel config has been made by someone who has checked
> >> the option "yes I am an expert I know what I am doing"
> >> yet failed to observe that this ABI is obsoleted since 5 years
> >> and hence failed to be an expert.
> >>
> >> Of course the ABI (not API really) needs to be fixed if we can find the
> >> problem. It's frustrating that fixing it seems to fix broken other
> >> features which are not deprecated, hence the annoyance on my
> >> part.
> >>
> >
> > I'm afraid we'll earn ourselves a good old LinusRant if we keep
> > pushing the character device as a solution to the problem here.
> > Marcelo is right after all: he used an existing user interface, the
> > interface broke, it must be fixed.
> >
> > I would prefer to find a solution that fixes Marcelo's issue while
> > keeping the offending patches in tree but it seems like the issue is
> > more complicated and will require some rework of the sysfs interface.
> >
> > In which case unless there are objections I lean towards reverting the
> > relevant commits.
>
> Reviving and old thread, hence a quick reminder: The patch at the start
> of this thread was applied and then reverted in 56e337f2cf13 with this text:
>
> ```
> This commit - while attempting to fix a regression - has caused a number
> of other problems. As the fallout from it is more significant than the
> initial problem itself, revert it for now before we find a correct
> solution.
> ```
>
> I still have this on my list of open regressions and that made me
> wonder: is anyone working on a "correct solution" (or was one even
> applied and I missed it)? Or is the situation so tricky that we better
> leave everything as it is? Marcelo, do you still care?

The purpose of my patch was to revert the patch that was causing the
hardware I work with to fail. But reverting that patch had bad
consequences in other hardware, so I really do not think that my patch
should go in.

Following Linus Walleij's advice, we are stopping using sysfs for
gpio, so in the near future that patch will be irrelevant for me. On
the other hand, a few people using recent kernels have tried my patch
successfully, so it can be used as a temporary transition hack.

Also, the patch exposes a serious problem with the sysfs gpio, which
is currently broken. Maybe we should consider removing the interface
in a near future release, as it has been advocated several times
before, since it has long been deprecated, has a much better
substitute API and, the worse part, it is broken and no one seems to
have a high priority in fixing it.

IIRC, the last time I read, the kernel documentation said that the API
would be removed in 2020, so we are a bit late :). I know that
removing an API has lots of implications, so the consequences must be
carefully balanced.

> Ciao, Thorsten

Best regards,
Marcelo.
