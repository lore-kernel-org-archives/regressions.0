Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86531250BE2
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287210; cv=none; b=lDDoXPk/0wBKG/BiVLzoG2jL7DUOHcR0EgSqSaf/a8iJeuLX1EfrSpdd70sq5rSHLiGYMx4wr35QLxe1X2qsDiiAeIkYD3XrkzS+PcTuiV+gbdbAe08ZXckpTR62rox/94xDWClNlsYLEXoG0fBCQu+i4PWAokNi+wHhvrjR6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287210; c=relaxed/simple;
	bh=P4/JUSQFJJgd2+ctyS23wFSUH0XddSHllH1RmQo/+AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbdsffECV2KlQE3V0RkvnRjetGF8R7gXiT/FwkBCNQFoIWObspQjxN+yatmCRpe4OQyKI+w3M4uo8L0zj0w0uyeF2g/Rb0ukxjgdPoxrqj36wYTV9IB5T+bEMSymd+PAbKGoKxF4H+cwu33XH7rajnqCspkYWfcaiYvgDWZ1G+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be49f6b331so585573385a.1
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 07:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287207; x=1739892007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeI1h3X9YFsKZxmC1aBdZztDggHHYsmIO5rZzIxeESU=;
        b=AjTxuUnJFIwwOIHVo16bsbaEl03v/G0sPCtmRRz0lkJ/rLAXN3zhjsMw50DnakEX2C
         lD2ucL8JqxBunMWFITLB8wopG21Mv6ensU9T/zjvKtdKSXqYB8AU/M0JgJbZ9zLuPsa+
         M/bKWLW8WnB7xHRmCWC6wwfIyMM+tMf7aCIydFvej7hUtDSKtsLEQjqa9iG0hxGY5OtV
         ZMyeLAytcjnFxq6CMorrxieIFnuDyc0bX2BmZfNWUTssNAcGehwQtG8ut7yPWQ6fuxLO
         Q4/8uD2c2bEfh2VkhGYaktyPBqwMx7o/3nxaekHcvObGeR6afA7eKkURFk/jVgH4Q0xM
         jxyw==
X-Forwarded-Encrypted: i=1; AJvYcCXzejCs+9/v4aDvutNCydFHYHDCsexsEnf3ipsM9ETYyIT4QAGJdhcCkUHcprIbh6zm/qYlhVaBNMKXUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGDxFEjrDxqNoKUJt8fyDG1MTEi2HuO1RtPKuxovQQAwwF0AqD
	REgDwrgZgmwlMZnS2jbJGuynC9YHfDjYlCmaptjeR7MbUfCBQb2Ii/0Z9JDZIxo=
X-Gm-Gg: ASbGncvgsXmP3uwwBlVn3LeBm6YKx4/8i3vSpJPOLCzpro2HFpr6RA41hADE5C6Zb5G
	wo/Wbo4V21+GfiMes9IbHvM2leP1ImvEiaugQ4nydfwLfP/+qboOI5KGiAF+8CbyMadyBNROe8h
	tNBlGF0ltsCfkSJ++uBgCoCx/S/tKbyEEQp231p/SvLOoMIJvFThQIs+9EwIBccqa6Jt2T47ass
	6lG1T7fhvnqBMnV14ajapb5a3ux2+MEctJlkOH+XiUGyQZZ8EAVNGzljm8dNE08RtrRJukCn3+/
	5U3YSPC0lm7SVkK3T2bmv8C+cuUCiXmTXZtEeKVIODR4fqmMQe6ClRqMKg==
X-Google-Smtp-Source: AGHT+IFwSFtsH19QMI3ReNUXxiBU37puIAyyGRtMrKWMWY5ZJaMtWBFhHpXHsPGApDH0g9QXd9X9nw==
X-Received: by 2002:a05:620a:470a:b0:7c0:6188:902b with SMTP id af79cd13be357-7c06f3af02amr23118285a.5.1739287206642;
        Tue, 11 Feb 2025 07:20:06 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c06510dcf2sm189323185a.113.2025.02.11.07.20.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:20:05 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47196e33b43so18489561cf.1
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 07:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpH8sXWYf0Xa+2fJlUkTepyWvEWVU0TuBg26X0oU1wgU1N9HNW5QxaDNu/uOLUS5HpDQGjMT/2r4lxdQ==@lists.linux.dev
X-Received: by 2002:a05:622a:1347:b0:467:5eb6:5153 with SMTP id
 d75a77b69052e-471679efd97mr266573411cf.19.1739287205151; Tue, 11 Feb 2025
 07:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com> <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
In-Reply-To: <6ff32b12-7113-41dc-80d3-e729cc15a5ce@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 16:19:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
X-Gm-Features: AWEUYZn1xjyqB1EpoC6789OaNQPaQ4r64nAW_WDpvE8uFlaj5_lViZH23fSGHDY
Message-ID: <CAMuHMdXNaNPiVXMrqf4YqM-PRC6ZrTgmHtOP1S9PPCP2HqvGWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
To: Vlastimil Babka <vbabka@suse.cz>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Tue, 11 Feb 2025 at 15:58, Vlastimil Babka <vbabka@suse.cz> wrote:
> On 2/11/25 11:48, Geert Uytterhoeven wrote:
> > On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> >> On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> >> > The subsystem status is currently reported with --role(stats) by
> >> > adjusting the maintainer role for any status different from Maintain=
ed.
> >> > This has two downsides:
> >> >
> >> > - if a subsystem has only reviewers or mailing lists and no maintain=
ers,
> >> >   the status is not reported (i.e. typically, Orphan subsystems have=
 no
> >> >   maintainers)
> >> >
> >> > - the Supported status means that someone is paid for maintaining, b=
ut
> >> >   it is reported as "supporter" for all the maintainers, which can b=
e
> >> >   incorrect. People have been also confused about what "supporter"
> >> >   means.
> >> >
> >> > This patch introduces a new --substatus option and functionality aim=
ed
> >> > to report the subsystem status separately, without adjusting the
> >> > reported maintainer role. After the e-mails are output, the status o=
f
> >> > subsystems will follow, for example:
> >> >
> >> > ...
> >> > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> >> > LIBRARY CODE status: Supported
> >> >
> >> > In order to allow replacing the role rewriting seamlessly, the new
> >> > option works as follows:
> >> >
> >> > - it is automatically enabled when --email and --role are enabled
> >> >   (the defaults include --email and --rolestats which implies --role=
)
> >> >
> >> > - usages with --norolestats e.g. for git's --cc-cmd will thus need n=
o
> >> >   adjustments
> >> >
> >> > - the most common Maintained status is not reported at all, to reduc=
e
> >> >   unnecessary noise
> >> >
> >> > - THE REST catch-all section (contains lkml) status is not reported
> >> >
> >> > - the existing --subsystem and --status options are unaffected so th=
eir
> >> >   users will need no adjustments
> >> >
> >> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> >>
> >> This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> >> breaks one of my scripts that I use to semi-automatically determine
> >> recipents for patch series.
> >>
> >> It works as follows:
> >>
> >>         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-=
AIU-export-its-clocks-through-cl.patch
> >>         #!/bin/sh
> >>
> >>         addrecipent \
> >>         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWAR=
E AND FLATTENED DEVICE TREE BINDINGS) \
> >>         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:O=
PEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> >>         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FI=
RMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> >>         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer=
:ARM/Amlogic Meson SoC support) \
> >>         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Am=
logic Meson SoC support) \
> >>         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Aml=
ogic Meson SoC support) \
> >>         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" =
$(: reviewer:ARM/Amlogic Meson SoC support) \
> >>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND -=
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> >>         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC=
 LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> >>         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
> >>         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
> >>         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AN=
D FLATTENED DEVICE TREE BINDINGS) \
> >>         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:A=
RM/Amlogic Meson SoC support) \
> >>         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlog=
ic Meson SoC support) \
> >>         -c "linux-kernel@vger.kernel.org" $(: open list) \
> >>         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAY=
ER / DYNAMIC AUDIO POWER MANAGEM...) \
> >>         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-=
through-cl.patch
> >
> > Hey, that looks familiar ;-)
> >
> >> the output is usually redirected to a file that I edit before running
> >> it. The additional line in the output of
> >>
> >>         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-=
let-AIU-export-its-clocks-through-cl.patch
> >>
> >> with your change breaks that script.
> >
> > You forgot to list the additional output?
> >
> > I gave it a try with my script, and with one of my own patches.
> > Example additional output is:
> >
> >      --cc "ARM/Microchip" $(: AT91] SoC support status: Supported \
> >     --cc "QAT DRIVER status: Supported \
> >     --cc "ARM/ASPEED MACHINE SUPPORT status: Supported \
> >     --cc "MELEXIS MLX90614 DRIVER status: Supported \
> >     --cc "ARM/NUVOTON MA35 ARCHITECTURE status: Supported \
> >     --cc "ARM/RISC-V/RENESAS ARCHITECTURE status: Supported \
> >
> > Iff this extra output is good to have, why not include it in the commen=
t
> > next to the existing entries with the email addresses, so it will be
> > handled automatically by all scripting on top?
>
> I've tried to do that in v1 in the form of reporting e.g. as
> John Doe <jd@example.com> (maintainer:SUBSYSTEM [supported])
>
> But it seemed noisy to repeat that on every line involving the subsystem.

Yeah, it could be considered noisy... (more below)

> When you say comment, what kind of separation for the comment would work
> regardless of what's used for postprocessing?

I don't mind much. Perhaps just a comma?

> > Now, as both Uwe and I edit our generated scripts before running them,
> > we can delete the unwanted lines, but it's more work...
> > Thanks!
>
> I guess technically your scripts could detect first if --no-substatus is
> supported by grepping --help or testing if passing the option results in =
an
> error? But yeah it's not ideal, looks like I've hit the limits of automag=
ic
> heuristics here.
> Or we make it fully opt-in but then most non-scripting users will not lea=
rn
> the status at all because it won't occur to them to enable it...

I still seem to miss the real story behind this patch (so perhaps
that's why I would consider all of it noisy ;-). When I create a patch,
what am I gonna do with this extra information?
E.g. decide not to send the patch, because the driver is orphaned?

Thanks!

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
