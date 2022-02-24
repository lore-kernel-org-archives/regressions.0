Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B497A
	for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 15:16:55 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id f2so1974695ilq.1
        for <regressions@lists.linux.dev>; Thu, 24 Feb 2022 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VUZ6Pub5f0T9fxmfVosX16sXl17Z0g2lbUvkIpOliqw=;
        b=EqaUmwz1/C4vlckRx5cf+joOkAe6Ta8p54V+oehnpSkIMWDZ9nAWmSmKujot5aDU6c
         CU1RPA4jppfPvRC3MIH/mi0YKKwlrIYpOvsFdlYI3sOwtZWfeR/4WW+i0lEATRZ5Ga5l
         z4ZqSta51QsMm20sTGvLPArnqzSYZ48432DyQmEmEPjRLuu5GF6JdLFx2OsHjN/IbDoE
         iiaWzPtBEA2x16dAL3bDyXlJYZmcoQduAgcuFQIOUfQrPhP2PcJQio7GFLRlTNX7QB1t
         og5dzcRE9FUKCFKTo2sGmutcBJUF52uZclX2DKLHUxK7tXX4mSluDz8tTdMuGh8gVgmP
         VAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VUZ6Pub5f0T9fxmfVosX16sXl17Z0g2lbUvkIpOliqw=;
        b=PE/GWujZCdVlmkEKoaEPFupsVxQdWeAditZqAYqinQVo1fDSQMi1CQmYBmHqnLmHuA
         oaLmT82J0t7iQiUWJumUP1rZk4Hzcox0EiJ4Ye/7vFp5bEKa1zMtDHVmtSgs7vCd7BIR
         y4qjmZLGi65EEdmiizeh5j1zn7UcgzYd+Y1lyVk5nMD5NMxlYmS2wFIEhV6QhZ4a0Mfr
         gNQgewN6JMMhZEZVAAkLn+MZyrA02t8GtOz9IOba0lJu0tkH+vcrLO88jGFiJWJMewJK
         rMjtUCe5Ft+9DkLrGIMGxq1Meuaa8Ymm3/zIZUkByyMwjhtyKZeXkt4mTh6kMJOuYdyJ
         RLww==
X-Gm-Message-State: AOAM531BBhpnYYtsxOyhbunyOzD2zWvMYVFT0Rdbe4sbofM7YeLEFWvc
	hIshxx95LgUlY1uoJO5gnh3Jf94GhgJVSZm9Js8=
X-Google-Smtp-Source: ABdhPJweM8K37WMx269tP7Mlg4RYl4PBL+vV3U1T1iOBFoknlQoa2qByrcCp9Eohs4ZYVUdzwvPQyxg9EBXLB240oXI=
X-Received: by 2002:a92:c243:0:b0:2c1:c5f5:bf5f with SMTP id
 k3-20020a92c243000000b002c1c5f5bf5fmr2684989ilo.243.1645715814833; Thu, 24
 Feb 2022 07:16:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJCQCtSeUtHCgsHXLGrSTWKmyjaQDbDNpP4rb0i+RE+L2FTXSA@mail.gmail.com>
 <CAJCQCtRiTQ1BTEHugxhS-zmXFG4qi4WLxsRyZsG9-_Q0isM+7Q@mail.gmail.com>
 <CAJCQCtS35JeABLDBaNpfgxjq+ZJ9rZgwtRnSYLNm8tMwtdYGMw@mail.gmail.com>
 <CABBYNZKTSe83iP4tm36we4cpAbeGUbEw9frZD1wCM9yo1zry5w@mail.gmail.com>
 <CAJCQCtTpHQe2co3fLNs5csKQchmwH=3YwQOvFnuc2nhjRseVnw@mail.gmail.com>
 <9ad505e1-7b59-7ebf-378b-23a6c0e25802@googlemail.com> <CABBYNZ+9tUKgLyUWM5vkMW8vHxYsXv6DEaDWdHt8xTTs6puGQA@mail.gmail.com>
 <aaeb4131-d177-d41e-617b-b0060cd83c92@googlemail.com> <CABBYNZLB+8UzhzttMrKbHW_+-A1EsY9iT5Y55VuOOEPuD4kAHQ@mail.gmail.com>
 <b1a4a920-dbba-58be-72b4-2c95b9b79283@googlemail.com> <82216882-463a-8976-e6bc-4a8919107a31@googlemail.com>
 <CABBYNZ+mO1gQgfwhemY9cqbi8vNLm_60A9c1vPYT2tH4rhgFww@mail.gmail.com>
 <a35b4b75-bb64-89c8-bacd-d58ed8576272@googlemail.com> <2ce6175c-74ec-8469-80a5-374bd1429542@googlemail.com>
 <CABBYNZJNTOT-mEQe2cfZiEX6A2pR7+sacBqtBRPRZY69YmgtvA@mail.gmail.com> <17f2bf7e-1d6b-e090-8926-21a408f2b496@googlemail.com>
In-Reply-To: <17f2bf7e-1d6b-e090-8926-21a408f2b496@googlemail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 24 Feb 2022 07:16:43 -0800
Message-ID: <CABBYNZ+cL4f8xvTJFQGLgqPueE=-UsOtvcPQez0BEsJ5xGppfQ@mail.gmail.com>
Subject: Re: bug kernel 5.17, qualcom and intel adapters, unable to reliably
 connect to bluetooth devices
To: Chris Clayton <chris2553@googlemail.com>
Cc: Chris Murphy <lists@colorremedies.com>, Bluetooth <linux-bluetooth@vger.kernel.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

On Thu, Feb 24, 2022 at 2:08 AM Chris Clayton <chris2553@googlemail.com> wrote:
>
> Hi Luiz,
>
> On 24/02/2022 08:16, Luiz Augusto von Dentz wrote:
> > Hi Chris,
> >
> > On Wed, Feb 23, 2022 at 9:59 PM Chris Clayton <chris2553@googlemail.com> wrote:
> >>
> >>
> >>
> >> On 23/02/2022 22:42, Chris Clayton wrote:
> >>> Hi.
> >>>
> >>> <snip>
> >>>
> >>>>
> >>>> We are starting to suspect this is not a new issue, it just become
> >>>> easier to reproduce with newer kernels since the mgmt commands are now
> >>>> handled by a different work/thread which probably takes longer to
> >>>> respond hitting problems such as:
> >>>>
> >>>> https://github.com/bluez/bluez/issues/275#issuecomment-1020608282
> >>>>
> >>>> This has been fixed by:
> >>>>
> >>>> https://github.com/bluez/bluez/commit/faad125c5505b941f06c54525616e192a6369208
> >>>> https://github.com/bluez/bluez/commit/5f378404bff6bbfea3f20e36535c494efa5066a5
> >>>>
> >>>
> >>> I cloned bluez, but that FTBFS, so I applied the two patches by hand.
> >>>
> >>> After the first boot, my bluetooth devices connected fine. But after a poweroff and boot, they didn't. Nor did they on
> >>> the third and fourth boots, so the patches don't seem to be the answer. (They couldn't really be anyway because changes
> >>> to the kernel have broken user-space which I understand is a big no no unless there is a really compelling reason.)
> >>>
> >>> I've gathered some diagnostics today and they are attached. They consist of 6 files containing the output from btmon and
> >>> dmesg and the log file for the system daemons, which, of course, includes bluetoothd. There are 2 sets of these files -
> >>> one from a boot that resulted in a system where my devices would not connect and another from a boot where they could
> >>
> >> s/would not connect and another/would connect and another/
> >>
> >>> not connect. You'll note that the btmon log is empty for a failed connection.
> >>>
> >>> I also tried a bisection with v5.16 as good and v5.17-rc1 as bad. Unfortunately, I found several steps resulted in a
> >>> kernel where bluetooth seemed to be substantially borked - to the extent that blueman was non-functional and clicking on
> >>> the tray icon did not start up the blueman-manager application.
> >
> > Running with 5.17.0-0.rc5.102.fc37.x86_64 there doesn't seem to be any
> > problems, well apart from LE device with Privacy/RPA:
> >
> > https://gist.github.com/Vudentz/5792f4989198c7f2994af2e31eb973af
> >
> > Ive tried suspend/resume a couple of times just to see if there is
> > something odd going own, anyway I'm running with the latest userspace
> > so perhaps I really need some old userspace to reproduce this. There
>
> I don't have an old userspace. I built my system from source about four years ago using the methods from Linux From
> Scratch and Beyond Linux From Scratch. I have been updating the packages since then as and when they are released. In a
> way, you could equate my system to one of the rolling releases. It is very up-to-date but at the same time very stable.
>
> This morning I updated to the latest releases of the 5.15 and 5.16 stable series. I've also built and installed the
> latest in the 5.4 and 5.10 stable series. (All four had new releases yesterday.) Bluetooth works as expected on all 4 of
> those kernels. It has also worked on every kernel released by Linus and every stables series kernel in the last four
> years. I usually start trying out a development kernel when rc3, 4 or 5 is released, depending on time available. If I
> find any problems I report them and provide any diagnostics required and test patches.
>
> Bluetooth is unreliable on my system when I boot 5.17-rc kernels. There is little doubt in my mind that something that
> has changed in 5.17 is at the root of this. Whether it is actually a bug in userspace doesn't change the fact that there
> is a regression because of one or more changes in the kernel. As I said yesterday, my understanding is that such
> regressions are frowned upon.
>
> I'll try another bisection today, but limit its range to changes made in the net/bluetooth directory.

Please record the HCI with btmon, it must be producing something since
it records even the mgmt commands.

> In the meantime I've copied this email to regressions@lists.linux.dev, so they can track this.

Hmm, is that really necessary? 5.17 has not been release tagged yet
and you are already considering it a regression?

> Chris
>
> > might be something with name resolving though, it appears gnome don't
> > show devices if they don't have a proper name (that is not their
> > address) so perhaps that gives the impression there is nothing going
> > on when in fact that all normal, well apart from the fact that names
> > takes way too long to be resolved.
> >
> >>> I also booted into a 5.16.10 kernel and connecting bluetooth devices worked flawlessly. (This was with the unpatched
> >>> bluez daemon)
> >>>
> >>> Chris
> >>>> So the timer doesn't start until the request is sent. but obvoiusly
> >>>> older versions of userspace don't have that fix so they end up
> >>>> cancelling the loading of LTKs, this would explain why reloading the
> >>>> daemon would make it work again.
> >
> >
> >



-- 
Luiz Augusto von Dentz
