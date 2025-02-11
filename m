Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56335194C6A
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270910; cv=none; b=YkMkrLR3xTf2PTttI2S2l3aa1oMIUQZMk7tLpwmkwUHQppFGf4Nzc6ev9LAXG07RlgXla/TQ+RQuwklXFTT9hsmhbQ0rOCu/3y4ZkYGuPmhHkiMjCtADE/BKBAG8fRelBpy/bfStYoGgcnZSapzhgLwfhcjMOAkGposXaEBcfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270910; c=relaxed/simple;
	bh=UerPirAcW+nkYfZL4ZWlBNq/4Xh35eAiYuHhOLWAPos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtC237ugWUVQPdC5QRhrqGmtjYCzzlUVO6/VvcsDTxhO1RwGywIGee/EJZ4cJznLZigJi01isLELBpWBnBNMPNcUMb8vYSA33O3IrBHbMPMCBqbzP4nBEJBaL5E9I1L/hY55RGixlHIFa0DEuoHkqAsj4Iw3SV9SSArovQC/1cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4bbc047a3c3so1494558137.1
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 02:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270907; x=1739875707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKBYxCaYYpe4xFUvgehK9MXy/sIDCvhlqBo2hvhtNmc=;
        b=dr91Jtv+H7t/50NcZcxCZxWXd4gXmo+eSIgmGR1Q7CEZ+ETYgJbnLQsdU9C3TSGRof
         atDw28s3QXBNov6xIFhanO2Zxi21JVbbpw0T3IOUvFg9PL0gmb0vGMlwEm5SQYpTlAAB
         51P96VOGMMZ3mjL6A6SewKepr3NCxmr696egzYncSckD8p8kbBWxrHIGNQiguZPKTDPG
         S44dkrF7fO3CnxT4jI7UywA5fS0/sfd6fnIFcaqfdFLAYCT536F+Kgp6tFg/at7VvC4M
         tzQLNQnShBJ1HAUMrsIzWZSrXWArHq8TxCn0vY/MrrP9LPPpE/6cl92/Wp8OrwGBJWiR
         jELw==
X-Forwarded-Encrypted: i=1; AJvYcCUNN+5IaQSNHtBoP7oHa6+Me0b50+krJ7EJNZBJZ4RQwAeDnCRiZ9LuVqIzfVghvGkfabmgHnljlY/7Lw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDl7qKxF3A+L5JHXH9lhWmCJtg7nHI5EB+LhFV9EbkC6T+Ij+i
	OIvYP+/+M6CtQrCKPZly5uOdxA1w64Q+AXV7ZkJ0ludbJnif+kBsv/IrWJ/buNE=
X-Gm-Gg: ASbGncvMfuHnkAd5f/wIXQ9M4ZKrn2pTxdyNJ87g/z1XTZSxgIcTnubZ1WIm5XCoEof
	DS5K2Ad8M3/pEj6BEzaDT5eNz1M2cWjGBMgQW1QZI8ijYEKfR0uxuOEF8yDeHu8D8sf5z7utduA
	4CElL2u4m73nDlLKrTcC0MiOShDE/2DS5HBCoG9eQV3Pql14udyqXiy6/y7pb7cZoWdOTOc+DCp
	mjJmvUdM2otjJwibR7mD7Ulsg2r925bK7hS3i43USwig/yKJGw4kA/Fl1fZhS7caW1jRdg/l2hk
	54KpZM4UbIAZrw7P8gk3UqLYyUFmk8dXlXKlLWIDfd575fYAbvAysw==
X-Google-Smtp-Source: AGHT+IHp+zcVyMJMoBh1XFMhyOELEgZLwfkeWdhVWJ7HPhYhPxR6IVASYPbUvuvxnDp/AMMXesV4eg==
X-Received: by 2002:a05:6102:36b:b0:4bb:9b46:3f71 with SMTP id ada2fe7eead31-4bb9b46989emr4885410137.8.1739270906672;
        Tue, 11 Feb 2025 02:48:26 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f965f74csm1853895241.11.2025.02.11.02.48.25
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:48:25 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4bbe31ef430so400315137.3
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 02:48:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVC5dkflj671UROirTPbj8PidrAKvEIRgRMPghelQzgNUeTmahj3OIAEnoJcXilM2xpjZU6OSJEB1sIHw==@lists.linux.dev
X-Received: by 2002:a05:6102:2ac7:b0:4bb:c8e5:aa6d with SMTP id
 ada2fe7eead31-4bbc8e5ad50mr4378402137.17.1739270905440; Tue, 11 Feb 2025
 02:48:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz> <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
In-Reply-To: <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 11:48:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
X-Gm-Features: AWEUYZlRIwnbJ4xR6KQkMkb3NhTJ5vBwKhACfgor7fj8riEEVlYdsOTpWfe2clE
Message-ID: <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
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

On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> > The subsystem status is currently reported with --role(stats) by
> > adjusting the maintainer role for any status different from Maintained.
> > This has two downsides:
> >
> > - if a subsystem has only reviewers or mailing lists and no maintainers=
,
> >   the status is not reported (i.e. typically, Orphan subsystems have no
> >   maintainers)
> >
> > - the Supported status means that someone is paid for maintaining, but
> >   it is reported as "supporter" for all the maintainers, which can be
> >   incorrect. People have been also confused about what "supporter"
> >   means.
> >
> > This patch introduces a new --substatus option and functionality aimed
> > to report the subsystem status separately, without adjusting the
> > reported maintainer role. After the e-mails are output, the status of
> > subsystems will follow, for example:
> >
> > ...
> > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> > LIBRARY CODE status: Supported
> >
> > In order to allow replacing the role rewriting seamlessly, the new
> > option works as follows:
> >
> > - it is automatically enabled when --email and --role are enabled
> >   (the defaults include --email and --rolestats which implies --role)
> >
> > - usages with --norolestats e.g. for git's --cc-cmd will thus need no
> >   adjustments
> >
> > - the most common Maintained status is not reported at all, to reduce
> >   unnecessary noise
> >
> > - THE REST catch-all section (contains lkml) status is not reported
> >
> > - the existing --subsystem and --status options are unaffected so their
> >   users will need no adjustments
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>
> This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> breaks one of my scripts that I use to semi-automatically determine
> recipents for patch series.
>
> It works as follows:
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
>         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND - SO=
C LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
>         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC LA=
YER / DYNAMIC AUDIO POWER MANAGEM...) \
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
>         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-thr=
ough-cl.patch

Hey, that looks familiar ;-)

> the output is usually redirected to a file that I edit before running
> it. The additional line in the output of
>
>         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-let=
-AIU-export-its-clocks-through-cl.patch
>
> with your change breaks that script.

You forgot to list the additional output?

I gave it a try with my script, and with one of my own patches.
Example additional output is:

     --cc "ARM/Microchip" $(: AT91] SoC support status: Supported \
    --cc "QAT DRIVER status: Supported \
    --cc "ARM/ASPEED MACHINE SUPPORT status: Supported \
    --cc "MELEXIS MLX90614 DRIVER status: Supported \
    --cc "ARM/NUVOTON MA35 ARCHITECTURE status: Supported \
    --cc "ARM/RISC-V/RENESAS ARCHITECTURE status: Supported \

Iff this extra output is good to have, why not include it in the comment
next to the existing entries with the email addresses, so it will be
handled automatically by all scripting on top?

Now, as both Uwe and I edit our generated scripts before running them,
we can delete the unwanted lines, but it's more work...
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
