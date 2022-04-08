Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE52564
	for <regressions@lists.linux.dev>; Fri,  8 Apr 2022 15:28:15 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id h11so11969133ljb.2
        for <regressions@lists.linux.dev>; Fri, 08 Apr 2022 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K2IauWY4j4S877ahR/vQIQuOqpMFWHocXV+o9eQuTEk=;
        b=lqZITmKiT+C/NLCwnMmEETtXUsHoMvUrXEgjGe1trko++PcRtcP2x71ZWngk3A9qVJ
         GtxEA4vc/tTyYTybakjMhq5p+QQhdu/EBN2rPjR7kB+ndIJbUsKXD71UQU1gXHu7d2nk
         oujm0ANKW+j7/Jmcs3AqJ5bbw+5VJpXXX7s3D23yzGvdRTgaULE5xh4viLRTdVsd8uTk
         ft87kvLAOlsAGYAw13SnImPmFsGm2mxHDCyX0z1V8QjOIy/TLbQr47jwODS+FFOg1Svl
         GJe6kERzsBFoPQS19xfJjtpWr1TBWxigdYtMPXIh4VeQzXJY/NCt2ucApxmnU5JBeUOW
         pOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K2IauWY4j4S877ahR/vQIQuOqpMFWHocXV+o9eQuTEk=;
        b=nBD9hIu58PK7abHIRgx54DEf8c6i58QuqNrcvzNQEZvPk8+7DPD4gPbu5A4lCxaXWV
         Doo56eoO1rv2UrkEYxkPcFHoKgUX4xK9VtEzZLdqdCu1VUDfkaYW4qmtQRURbULH2+2i
         rBw3FK3rbWfjSy3ljQA3g9q7Xj1iHFKygc+emOtjVs0wZDLc/EZsZgQBFG4vEY4ujHei
         MJfn0505xxaaOdQ+oiyzlwTW5OJVU1C+NvaKaDYa1Es5ZWXyvY1WFhBX5difRwynpeK9
         QHU0mNwIZ9YVdF7bW2cpM1U5tvdskfWfNoVQzDnIswjuQRc0JbC1nkej4c1yuYRD/mq9
         PJ8A==
X-Gm-Message-State: AOAM531KUk1mwuG2IUSqoUiD8lmbHG/TbrjHCPovg1BchBj+nwRYMz0F
	cwlDdbaMcHMATM753imC5UjW8RigTn7hYM9oUzaBFQ==
X-Google-Smtp-Source: ABdhPJwEhFCWnJxbnX9f/VLAvYTGBsLP+bArtXUb6d5gUexHwlJqrgPl7y1bXLPYlQbzPKdb7ZLkBg5KPR4+1SFyegI=
X-Received: by 2002:a2e:a7c1:0:b0:24b:51eb:e432 with SMTP id
 x1-20020a2ea7c1000000b0024b51ebe432mr1549163ljp.238.1649431693395; Fri, 08
 Apr 2022 08:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d62431af-5ce4-3d8f-542f-df8e7a7faaf1@leemhuis.info>
In-Reply-To: <d62431af-5ce4-3d8f-542f-df8e7a7faaf1@leemhuis.info>
From: Todd Kjos <tkjos@google.com>
Date: Fri, 8 Apr 2022 08:28:00 -0700
Message-ID: <CAHRSSEw5CBnCpXcowKKG5KzOoazecC6jDn+4_fd0Gp3+e9Yixw@mail.gmail.com>
Subject: Re: Regression in BinderFS: Kernel bug at binder.c:2352
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"quackdoctech@gmail.com" <quackdoctech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 8, 2022 at 3:27 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, this is your Linux kernel regression tracker.
>
> Todd, seems there is a regression that is caused by one of your Linux
> kernel changes:

Yes, it was reported a few days ago by the ChromeOS team. Already
looking into it.

>
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and all people that seemed to be relevant
> here. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=3D215795 =
:
>
> >  quackdoctech@gmail.com 2022-04-02 19:56:29 UTC
> >
> > Created attachment 300686 [details]
> > Dmesg output cut to error
> >
> > Apologies if this should have been reported under Drivers where the sou=
rce is, selftests has it listed under filesystems so I chose here. Using Wa=
ydroid which is android run via LXC, on android 10 the bug comes when tryin=
g to use video playback. I know of issues on android 11 but have not yet ha=
d the chance to get the logs from it. the issue does not occur in Linux ker=
nel 5.16 series. but does occur on linux 5.17. the issue is confirmed on bo=
th Arch's linux-zen 5.17.1.zen1-1 kernel as well as some users reporting a =
fedora kernel with the issue.
> >
> > [reply] [=E2=88=92] Comment 1 quackdoctech@gmail.com 2022-04-03 19:38:3=
7 UTC
> >
> > I've narrowed down the issue to this patch series.
> >
> > https://lore.kernel.org/all/20211130185152.437403-1-tkjos@google.com/
> >
>
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
>
> Anyway, to get this tracked:
>
> #regzbot introduced: v5.16..v5.17
> #regzbot from: quackdoctech@gmail.com <quackdoctech@gmail.com>
> #regzbot title: BinderFS: Kernel bug at binder.c:2352
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D215795
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
>
> --
> Additional information about regzbot:
>
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and the references documentation:
>
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
>
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
>
> Hint for reporters: when reporting a regression it's in your interest to
> CC the regression list and tell regzbot about the issue, as that ensures
> the regression makes it onto the radar of the Linux kernel's regression
> tracker -- that's in your interest, as it ensures your report won't fall
> through the cracks unnoticed.
>
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include 'Link:' tag in the patch descriptions pointing to all reports
> about the issue. This has been expected from developers even before
> regzbot showed up for reasons explained in
> 'Documentation/process/submitting-patches.rst' and
> 'Documentation/process/5.Posting.rst'.
