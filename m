Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188B23A7
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 19:32:41 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id j83so5935071oih.6
        for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 12:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZLDoXtxzLXNABwcFLETn83t4o2M6MLDJpJw02fY5vh4=;
        b=JOLXApP+VEDQbZGdxfDMxliKkDn8PnWYwZXfrt8aTpw60eoQk93YFqltRsXCMfBlcg
         3i35WEZvngjYA+iOoyahqlmnDYaMXYDU14pxs4nIilir73J6PsIcm0Kc7y5XiXtkzSgm
         yopQ1CBixs/bxvIuhByVcg47YrkASgFOmatv+RLtS9iKUnwnadrFZOj8JU2i/dMfwRaJ
         uLcJWD5XkYUNJWQBPvZOxpPTiHOUU/kDEA9VOMlx//ShrRzn5w9g5YBtJzcZKll3taDp
         bH29K+k9G3MhluBbl5slM9yXnoR0YfLaFtU6dhBz8qKXtV5cBc1LSlcFmAcW6v2TKOig
         vCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZLDoXtxzLXNABwcFLETn83t4o2M6MLDJpJw02fY5vh4=;
        b=S/DWP0qDLZWz9ZL1TiAdGgIDPdUEhOS41Pz31CMFLNm4af0dV7Z+R0A2JuKCvJMCh0
         OPa3zhpq6pfytHd96wd6Wdys1fd8Oxa/B0HHCc4H5EvAFePR78WZ4WrJ70YVsubfdhpd
         QQWdNxg+xV92mQiHAvMEuZwAnZ4geXK+gGBFL9GKQ8PAMWEr2NHoWYEAXuBdVq8sKtwq
         l40sdW4JMk+4dsEeHgAma1AnMOnw36+p/ZjJdQwXo5m7HXYIWhv+wiJkMYUsby1vHtN4
         PG3WQZcP5WuTv4QYxPoimOeSrOWj2FLZOD9JGzbmMNr+HlBhBn5hpathNRmVb26U0adB
         KmEQ==
X-Gm-Message-State: AOAM530aeHCyyfbv7XEkhe15Mn13yrU7NgZNT5mdpUJUqPk2tib+IMdY
	aSsjRi88ISJUbOvjjdog0AuTzU7JWEDE02wntv0=
X-Google-Smtp-Source: ABdhPJzTVIriERJiN43Oj0zgvyifAoVcqs+BQczUJdlfRq84EaxmBfpH5ag3ZtVJCcVz7lvXa+1cTe/u6D8B2fMdPlc=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr7731857oic.200.1648150360679; Thu, 24
 Mar 2022 12:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHtRFGvj1DuYzUUL1P5bvfMpT1WkwUL2ZpZQt1iYf-XH=fJP0Q@mail.gmail.com>
 <CAHtRFGvDmdMkc4r5Ko8osJPeGiWQnPwcABY=4WzweYz50WQQMg@mail.gmail.com> <b49b4bc2-d4fc-4992-c616-3192a641fdd7@molgen.mpg.de>
In-Reply-To: <b49b4bc2-d4fc-4992-c616-3192a641fdd7@molgen.mpg.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Mar 2022 15:32:29 -0400
Message-ID: <CADnq5_PUWWtWSZWDxZFmddGw06UyXs4k1hSY8r=53vUXNa1RSA@mail.gmail.com>
Subject: Re: ATI Radeon Mobility 3470 fails with Kernel 5.0
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Craig M <cmroanirgo@gmail.com>, regressions@lists.linux.dev, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2022 at 2:07 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Craig,
>
>
> Am 24.03.22 um 02:09 schrieb Craig M:
> > I should add some further information:
> >
> > I have tried using Manjaro KDE, Kubuntu 20 and Kubuntu 18.03 live
> > disks and all exhibit this 'tearing' issue.
> >
> > The problem begins rather early on in the boot sequence while the TUI
> > is logging the startup information and continues to be a problem as
> > the screen becomes graphic.
> >
> > I feel that I should be able to rectify this with a setting change.
> >
> > Again, Thanks for any help.
> > Craig.
>
> In the future, it=E2=80=99d be great if instead of top-posting you used
> interleaved style.
>
> > On 3/24/22, Craig M <cmroanirgo@gmail.com> wrote:
> >> Hi,
> >>
> >> I'm trying to track down a problem with an ancient graphics device ATI
> >> Radeon Mobility 3470.
> >>
> >> Ubuntu/Kubuntu 18 is shipped kernel 4.18 and the radeon drivers work w=
ell.
> >> With 18.02 and later it ships with kernel 5.0 and the radeon drivers d=
on't.
> >>
> >> What I'm seeing is hard to describe. It looks a lot like the scan
> >> lines are interleaved and there's a lot of noise. It's not the typical
> >> screen tearing, nor is it just snow (black and white noise). I can
> >> *just* make out what it being displayed onscreen, but hurts the eyes a
> >> lot to try and do so!
> >>
> >> If I hold the kernel back at 4.18 things are just fine.
> >>
> >> Some detailed info (from a working 4.18 kernel). Note that the
> >> returned information from a 5.x kernel isn't all that much different:
> >>
> >> $ lshw -c video
> >> *-display
> >>        description: VGA compatible controller
> >>        product: RV620/M82 [Mobility Radeon HD 3450/3470]
> >>        vendor: Advanced Micro Devices, Inc. [AMD/ATI]
> >>        physical id: 0
> >>        bus info: pci@0000:01:00.0
> >>        version: 00
> >>        width: 32 bits
> >>        clock: 33MHz
> >>        capabilities: pm pciexpress msi vga_controller bus_master
> >> cap_list rom       configuration: driver=3Dradeon latency=3D0
> >> resources: irq:26 memory:c0000000-c7ffffff ioport:9000(size=3D256)
> >> memory:c8020000-c802ffff memory:c0000-dffff
> >>
> >>
> >> $ modinfo radeon
> >>
> >> filename:
> >> /lib/modules/4.18.0-17-generic/kernel/drivers/gpu/drm/radeon/radeon.ko
> >> license:        GPL and additional rights description:    ATI Radeon
> >> author:         Gareth Hughes, Keith Whitwell, others.
> >>
> >> ...
> >> name:           radeon
> >> vermagic:       4.18.0-17-generic SMP mod_unload
> >> signat:         PKCS#7
> >> signer:
> >> sig_key:
> >> sig_hashalgo:   md4
> >> ....
>
> Looking at the output of `dmesg` might also help.
>
> >> I'm just trying to track down the driver changes between 4.18 and 5.0
> >> to see what I can do to change settings. Any help  would be greatly
> >> appreciated. I've had a quick look through
> >> https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati but I don't
> >> know where to start (as there's no correlation between releases and
> >> kernels, from what I can see).
>
> As switching the Linux kernel version works, you need to look at the
> driver in the Linux kernel. As you can easily reproduce your problem,
> and you are most likely alone with this old hardware, bisecting will
> probably the way to go. First you can try the packages from Ubuntu=E2=80=
=99s
> Kernel PPA [1]. Figuring out, in what version the regression occurs, you
> then build the Linux kernel yourself, for example with `make
> bindeb-pkg`, and try to find out the exact commit. There should be some
> guides on the WWW explaining all this in detail.

Yeah, as Paul said, bisecting is probably your best bet.  The radeon
driver has largely been in maintenance-only mode for the last few
years so it hasn't really seen any changes other than misc bug fixes
or cross component API changes.

Alex

>
>
> Kind regards and good luck,
>
> Paul
>
>
> PS: It would also be nice to know, if the problem is still present in
> Linux 5.17.
>
>
> [1]: https://kernel.ubuntu.com/~kernel-ppa/mainline/
