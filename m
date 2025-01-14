Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4802309A8
	for <regressions@lists.linux.dev>; Tue, 14 Jan 2025 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736841774; cv=none; b=HHkp6/DPiXX6yrLwJiJQlfB/+y9juGRkyiEQ1SIOxHGbYtkT4ZpD5JMY5e5H/XdYxyXd868F9lrLuqJKo8sO5m/FM4pSo+StK5SWQw84sNm8g0S5wVGZybqCfHM0J3uK+j/bQ174oo8H1iQWLwHY+jwvSrsXCJqt9UJP6Y/++k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736841774; c=relaxed/simple;
	bh=Zll63eXNO2QAvFmvmN75gt1cRJvBd423Bw7F6vPWp2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrgWsiT5i2KqXs3TOdO9W9aP72AlGtXRAemaBLN72xOeuL3mRvVAKch06nzIvBWGQgHzUI6CT/iiTDsu4HR46rliZWFcdhYxEVdes44RSM4rQimW1CK8GnIiHeyqhnuoOgBTpA2w2IbAO5lXtSDUWWfi/uPquHrvu7PBdPSLZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff31b77e8so2077890137.1
        for <regressions@lists.linux.dev>; Tue, 14 Jan 2025 00:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736841771; x=1737446571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPH3xmnrAQMKppWrHm6XEQ0hv6/uq+sic9r21HtZWcU=;
        b=is1F+qw93XHuYUyykAX5bx0GEatGoxsMyvgyRxh2DCNg+eW2QMP8Vtrpck5PUUaytn
         kcmRO+I6cLWCVUhl3o3QSyG+moBzmZgTPoANUlqVReZhwmZzhDIKgifUdeaPZksojebq
         B5bcoJkBx7/w6NcVqxSXk6eCWAWTcIGgnk/blUHMlW7F9LGtiy8sRS/KgTMa3iRfKO7d
         LpHjv8BLHUuxRYvH7kvg0rLrTKtCg2ay+No1z7ZRMf4G2y4+kSR0rq3gmNjUdC2arcix
         BY9gmQjAP/8OBP59OTxWu8f63lV8by17eB/j7Sjbp6mwQO55KE8JVzcv3X/3h6ZoJ8C2
         OYYw==
X-Forwarded-Encrypted: i=1; AJvYcCXjeYpQav46zdThOfiw5clyBfA5wMP0ObeMCN1gHCz1FEhTVBmHPrIjpmG9L7SrEZUt22mADAMOZwpLwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1K3FYPg3/d4MJl9rjrEB++L210nbtcO6RtwlbsZmLdSfJBMp1
	Llaxm+aMURKe/1QmmSaQltpUiNzqWU58Tj03XEefPfCwjWkPTCWqM5ZK6gw2jS4=
X-Gm-Gg: ASbGncuOJ46kAHRZAwqQZh4+mrcz3qaKf847gPuU/ZONt406MUmB06PQ3G1QyIGdiqp
	C6+VR5bdWCUulsC/oMjOgWplaqMdFtlxPg1oqYFkXmnArL0mNvIviC0uRYZZL6ZkhilFOjwXQfg
	o6QJDclH9M0lcfWa7h7PrFb05TrpCZ6Jo9lKQekrOww/DAChwiCiKCFMcUqjdSsCYDPLSYRNW7K
	ienHli/Q1kQ0T/baSNNnyA3RbYlXbPrz9/f/wagIOt576q8ccPcp9cfLVPd8Fv0Gz3sFNQ0S08N
	+xiLUc9o5hswq6ULKSU=
X-Google-Smtp-Source: AGHT+IEWnNTfoBH8cIvnZxRVe4WawFKxXGtQv/jF5lO9r8XrMq7AcFV8vcRHhmlWH6HyurjPM1OXIg==
X-Received: by 2002:a05:6122:3128:b0:516:240b:58ff with SMTP id 71dfb90a1353d-51c6c46f470mr18921046e0c.5.1736841770676;
        Tue, 14 Jan 2025 00:02:50 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fd2f4fasm3845578e0c.48.2025.01.14.00.02.50
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 00:02:50 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4aff31b77e8so2077874137.1
        for <regressions@lists.linux.dev>; Tue, 14 Jan 2025 00:02:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMmRXlPg3Lbptl2+1pabhcMTm4efKtKzoz1AI4UFcuXTtpf81PKXVCTAqglMDb84PXnRfOsppzx7LueA==@lists.linux.dev
X-Received: by 2002:a05:6102:800c:b0:4b2:5c0a:98b7 with SMTP id
 ada2fe7eead31-4b3d0ef99c6mr19475014137.6.1736841770305; Tue, 14 Jan 2025
 00:02:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <90b5b76d-25b6-4cdc-91ed-07ac930dc519@o2.pl> <99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com>
In-Reply-To: <99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jan 2025 09:02:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbuRLgDP2JtmdhnJF=AhpPa88356KU1yF1f8GMirWrcQ@mail.gmail.com>
X-Gm-Features: AbW1kvYWpDfd-Jt6OXPDpL-6dQwJj4vhkjQrnnr9n-FYlBXBkY9K_gokUiz_wXA
Message-ID: <CAMuHMdXbuRLgDP2JtmdhnJF=AhpPa88356KU1yF1f8GMirWrcQ@mail.gmail.com>
Subject: Re: [REGRESSION] mipsel: no RTC CMOS on the Malta platform in QEMU
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxun,

On Tue, Jan 14, 2025 at 12:32=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
> =E5=9C=A82025=E5=B9=B41=E6=9C=8813=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=
=E5=8D=8810:16=EF=BC=8CMateusz Jo=C5=84czyk=E5=86=99=E9=81=93=EF=BC=9A
> > On Linux 6.13-rc6 for mipsel in QEMU on the Malta platform, the RTC CMO=
S
> > driver does not load and /sys/class/rtc is empty. I have tested this wi=
th
> > "make malta_defconfig", which compiles this driver into the kernel
> > (CONFIG_RTC_DRV_CMOS=3Dy).
>
> Hi Mateusz,
>
> Thanks for tracking it down, this is indeed a huge effort.
>
> >
> > I have bisected this down to:
> >
> > commit 4bfb53e7d317c01f296b2feb2fae7c421c1d52dc
> > Author: Jiaxun Yang<jiaxun.yang@flygoat.com>
> > Date:   Thu Sep 21 19:04:22 2023 +0800
> >
> >      mips: add <asm-generic/io.h> including
> >      With the adding, some default ioremap_xx methods defined in
> >      asm-generic/io.h can be used. E.g the default ioremap_uc() returni=
ng
> >      NULL.
> >      We also massaged various headers to avoid nested includes.
>
> #regzbot introduced: 4bfb53e7d317c01f296b2feb2fae7c421c1d52dc
>
> >
> > I have tried to debug this.
> >
> > The fallout is apparently limited to the CMOS RTC driver, other
> > drivers that access IO ports seem to function correctly (e.g. the
> > PATA driver). Also, the read_persistent_clock64 function in
> > arch/mips/mti-malta/malta-time.c, which accesses the same hardware
> > works correctly.
> >
> > The CMOS RTC driver is likely special because this device is defined
> > in a devicetree (arch/mips/boot/dts/mti/malta.dts) and there it is
> > the only defined device on the ISA bus.
> >
> > That driver fails to load because the call to
> >
> > platform_get_resource(pdev, IORESOURCE_IO, 0);
> >
> > in cmos_platform_probe in drivers/rtc/rtc-cmos.c returns NULL.
> >
> > The mediator seems to be that this bad commit causes
> > arch/mips/include/asm/io.h
> > to #include <asm-generic/io.h> at the end. As a side effect, this cause=
s
> > the PCI_IOBASE macro to be defined:
> >
> > #ifndef PCI_IOBASE
> > #define PCI_IOBASE ((void __iomem *)0)
> > #endif
> >
> > That PCI_IOBASE value above is AFAIK incorrect for MIPS (it should be
> > defined to mips_io_port_base as far as I can tell), but this does not
> > matter much here.
>
> You are right, this is what should be done.
>
> A quick fix would be #undef PCI_IOBASE in arch/mips/include/asm/io.h
> just after including #include <asm-generic/io.h>, with ralink and loongso=
n64
> as exception.

Shouldn't arch/mips/include/asm/io.h do

    #define PCI_IOBASE mips_io_port_base

unconditionally, _before_ including  <asm-generic/io.h>?

> In the long term, we should scrutinize platform usage of mips_io_base
> following ralink's approach.

Currently ralink handles that in a mach-specific include:

    arch/mips/include/asm/mach-ralink/spaces.h:#define PCI_IOBASE
mips_io_port_base

Loongson does it differently:

    arch/mips/include/asm/mach-loongson64/spaces.h:#define PCI_IOBASE
     _AC(0xc000000000000000 + SZ_128K, UL)

But still sets mips_io_port_base in prom_init():

    arch/mips/loongson64/init.c:    set_io_port_base(PCI_IOBASE);

so defining PCI_IOBASE to mips_io_port_base in the main <asm/io.h>
should work.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
