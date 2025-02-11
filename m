Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F1125332C
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287342; cv=none; b=P7YQa5MpEQghqcKmHkZh/k6OdOf28piF2uWQSL92BSBlAOe3z2i2EYsH7kOjdskoGn7Wzx3myJHAGJrLHvgTj1U3WINgHQo3MdhSMmkbpoFiEz9GeAdl0V5jKPVPeaDEr5GI03f0/NLa6/fZIBEUi+lagdFJB4bcUzGR7ZDOTIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287342; c=relaxed/simple;
	bh=GE1ArqccH4ggT/QH/gEhglvAE2yVFqHuvuk6REkFiNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHZ5vRW7riVXLx9F1hMOwK1SKBy8X7GuXnzodvjc3m8knKazD+aHZNAxsVa92Ctoef21XY5WmzfBK4FdPE1cFkmW/JqpC1SQJ0HQlVFkFCWUOhfCjx62pMnuHRkdn/e31FC66nQyfbinAIbBZ28E14k1CCqTdy1KeJSrwyxlq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4bbbaa03b0aso750142137.3
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 07:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287338; x=1739892138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDf/FBN18w/MSePGkCpc/DsFbol5PkzHDiDAzsZGsQM=;
        b=bKI2CatI/y1MogiIdov9KPgw8gwVz06yNW6hykXpy6RT/2wjQ7UPtuVV4tsttafzYk
         wdbL+YJNadErU4HTiYJ6IJ94+FsB5QIvqmZQd5FgI0RSSHuhoBMEUHgj8aDG7B8ByGlD
         40ZK1UAPa66s9aHagixRV1yorZeEZt6IOgwaU5qiuyNODtJbMrjCG8RhC5JX0ZTKGGzo
         o6VC1FaDlu8TaSk6rYTXDAJuNgJ6dM40kVJ5FPgNDKDIntLzZH7QgImStmAn6xrWcXPB
         z/PCpaqTApMNHqUF9biIeympVxzYyQCWHWLzIdn/mUkTKgCPtySPR6laJuH5a/oxJA9b
         Fxkg==
X-Forwarded-Encrypted: i=1; AJvYcCWh3Dy0Hxr9E1qQw8inmt7FhCx/LgXoiuKNhORfVQBnSGweFB3MJwFdlvIYOMdR6PXAowal9LAIwzYBeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqgvi5LhFQvT7MdMzPkdiSCHjlxMwLP/sWqaABozJTtHGyeuIV
	Y5UkqMqd58TM8cv2qGRyTemM+1KGic3Xe3OkHVw7qf55WI4WAX9HgcQrj6+QOs4=
X-Gm-Gg: ASbGncu66215hQrOFwuBXOVFwCfsrnsyvjauK/brl2d9ZLUUfQQ1eVRe3pV/G6Q08Pn
	REdKD5LvVCF/Mwt55sBWfuk+XKrYu1NwnCcWt6dyqedfObgtcSkGWtTv+mWy17wFsj6B+VIVxr8
	hpxS90qJQjSBDXr0Z7hfxt0D0JrbKCpAaNJtGY01oxC6a8pCkT45F6H7Q8G3aapwCVRR0GE4Y33
	UcxidOay01q3zoQG93QFjSJAXGGQsROF8G12u+nwdmDjcTT9glIZhhQQ+HzjwTIwI8piDc2wdhM
	58CCDU/v8APGq/BL5MC0iq+r0NQqRvXbdhCBUKqyuiznAZWka9ctDw==
X-Google-Smtp-Source: AGHT+IGdoQNbn8oNr7+Vcjw9rBZBGL5sfVJE0laq4Z6oasn2OhT4YvZOMcGq4+97lY66At3N7UtGpQ==
X-Received: by 2002:a05:6102:a54:b0:4bb:d394:46d8 with SMTP id ada2fe7eead31-4bbd39458femr4415037137.3.1739287337835;
        Tue, 11 Feb 2025 07:22:17 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbba5eb62dsm1082740137.6.2025.02.11.07.22.16
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:22:16 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4bbefec943aso40858137.2
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 07:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBrtVkndMRiBMrBxip68M5da5C2ktDnm/fhTGNJJ8OFwYXpqCXUuPkxo/myPyUovacLdMqXVxqZ43FgA==@lists.linux.dev
X-Received: by 2002:a05:6102:418b:b0:4bb:5d61:1252 with SMTP id
 ada2fe7eead31-4bb5d611970mr7175358137.23.1739287336539; Tue, 11 Feb 2025
 07:22:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com> <wy6yhp2ty2s5wq76u7toghuuztdzb5f7uphfqkgw4t7vu4eojd@sc26ynxekxki>
In-Reply-To: <wy6yhp2ty2s5wq76u7toghuuztdzb5f7uphfqkgw4t7vu4eojd@sc26ynxekxki>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 16:22:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXgK3DiUjjOC==mm0SD8Fgtd44T+s2giPjD+G_c1tXeA@mail.gmail.com>
X-Gm-Features: AWEUYZmf4rySmvZVXNOk5ylfnfY73xg5CsSAPYmCgFP_oFg40q0rY3aRwfpC3dA
Message-ID: <CAMuHMdVXgK3DiUjjOC==mm0SD8Fgtd44T+s2giPjD+G_c1tXeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Tue, 11 Feb 2025 at 16:09, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Tue, Feb 11, 2025 at 11:48:13AM +0100, Geert Uytterhoeven wrote:
> > On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > > On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> > > > The subsystem status is currently reported with --role(stats) by
> > > > adjusting the maintainer role for any status different from Maintai=
ned.
> > > > This has two downsides:
> > > >
> > > > - if a subsystem has only reviewers or mailing lists and no maintai=
ners,
> > > >   the status is not reported (i.e. typically, Orphan subsystems hav=
e no
> > > >   maintainers)
> > > >
> > > > - the Supported status means that someone is paid for maintaining, =
but
> > > >   it is reported as "supporter" for all the maintainers, which can =
be
> > > >   incorrect. People have been also confused about what "supporter"
> > > >   means.
> > > >
> > > > This patch introduces a new --substatus option and functionality ai=
med
> > > > to report the subsystem status separately, without adjusting the
> > > > reported maintainer role. After the e-mails are output, the status =
of
> > > > subsystems will follow, for example:
> > > >
> > > > ...
> > > > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> > > > LIBRARY CODE status: Supported
> > > >
> > > > In order to allow replacing the role rewriting seamlessly, the new
> > > > option works as follows:
> > > >
> > > > - it is automatically enabled when --email and --role are enabled
> > > >   (the defaults include --email and --rolestats which implies --rol=
e)
> > > >
> > > > - usages with --norolestats e.g. for git's --cc-cmd will thus need =
no
> > > >   adjustments
> > > >
> > > > - the most common Maintained status is not reported at all, to redu=
ce
> > > >   unnecessary noise
> > > >
> > > > - THE REST catch-all section (contains lkml) status is not reported
> > > >
> > > > - the existing --subsystem and --status options are unaffected so t=
heir
> > > >   users will need no adjustments
> > > >
> > > > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > >
> > > This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> > > breaks one of my scripts that I use to semi-automatically determine
> > > recipents for patch series.
> > >
> > > It works as follows:
> > >
> > >         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let=
-AIU-export-its-clocks-through-cl.patch
> > >         #!/bin/sh
> > >
> > >         addrecipent \
> > >         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWA=
RE AND FLATTENED DEVICE TREE BINDINGS) \
> > >         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:=
OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> > >         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN F=
IRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> > >         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintaine=
r:ARM/Amlogic Meson SoC support) \
> > >         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/A=
mlogic Meson SoC support) \
> > >         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Am=
logic Meson SoC support) \
> > >         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>"=
 $(: reviewer:ARM/Amlogic Meson SoC support) \
> > >         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND =
- SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> > >         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SO=
C LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> > >         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
> > >         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
> > >         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE A=
ND FLATTENED DEVICE TREE BINDINGS) \
> > >         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:=
ARM/Amlogic Meson SoC support) \
> > >         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlo=
gic Meson SoC support) \
> > >         -c "linux-kernel@vger.kernel.org" $(: open list) \
> > >         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LA=
YER / DYNAMIC AUDIO POWER MANAGEM...) \
> > >         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks=
-through-cl.patch
> >
> > Hey, that looks familiar ;-)
> >
> > > the output is usually redirected to a file that I edit before running
> > > it. The additional line in the output of
> > >
> > >         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK=
-let-AIU-export-its-clocks-through-cl.patch
> > >
> > > with your change breaks that script.
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
>
> Is that really your output? No closing ) in the first line and no
> closing " in the 5 last?

Yes it is....
As I need to delete the lines anyway, invalid syntax is irrelevant ;-)

> For me it's worse(?), I get:
>
>         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-AIU=
-export-its-clocks-through-cl.patch
>         #!/bin/sh
>
>         addrecipent \
>         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE A=
ND FLATTENED DEVICE TREE BINDINGS) \
>         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OPEN=
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
>         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIRMW=
ARE AND FLATTENED DEVICE TREE BINDINGS) \
>         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:AR=
M/Amlogic Meson SoC support) \
>         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Amlog=
ic Meson SoC support) \
>         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlogi=
c Meson SoC support) \
>         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $(:=
 reviewer:ARM/Amlogic Meson SoC support) \
>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: maintainer:SOUND - S=
OC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>         -t "Mark Brown <broonie@kernel.org>" $(: maintainer:SOUND - SOC L=
AYER / DYNAMIC AUDIO POWER MANAGEM...) \
>         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
>         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
>         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND F=
LATTENED DEVICE TREE BINDINGS) \
>         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:ARM/=
Amlogic Meson SoC support) \
>         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogic =
Meson SoC support) \
>         -c "linux-kernel@vger.kernel.org" $(: open list) \
>         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYER =
/ DYNAMIC AUDIO POWER MANAGEM...) \
>         Failed to parse "SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEME=
NT (ASoC) status: Supported
>         " at -e line 6, <> line 17.

Oops...

My version is also not perfect. I'm used to doing manual adjustments...

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
