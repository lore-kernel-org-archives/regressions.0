Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523425291B
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286578; cv=none; b=ekabn8h1Al7he0hLgDhrCR43+O8v05pTWMoPKgv0r3FQYbQHWP4D/9HFuosw093C5b+ELE+vzjhW1xMWrows9YbPnpNbtoUfrzV9VCThb74cArC3w5Pr9bO1/Q+XZwszGctS64p0dP1PZNp+WEYPgtwRIOgA/ecIqhHlxJUCdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286578; c=relaxed/simple;
	bh=XeoOR9mWR3QI2DUTtx8o/Mb95udO0qya1ua0UzUV/KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpfQOKcNcYU2NT4bBAu5mKMqsSb0IvDS8PdmgI1NfLNLOAHfrU8uME5QVSNaPSNOVFPpB+kUunoT7Nuq662qlYx0W7zRvFQWET2F2wBtWcOOaFkBXqz8thCCgXm8RqijWAAR1shcqbPCPS7q9Kp6CSlqmeXv7kwzmwZt0h0cOsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vmf3viKn; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vmf3viKn"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-438a39e659cso39696225e9.2
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739286574; x=1739891374; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9/pIQ6Ih8jIe4aCDENSWzfq7X2UaTCBit5cGbc+Hn7Q=;
        b=vmf3viKnbHL2KuzpUFzhKhprV9tek4uk8Xk6v4TA13ZRwToaJv54iIIBWthXpjdsxk
         nwLUhNiGZt+hmPaoOcswOxjGTzrVjvfHDmOq0Vu/hKGuSMpU25fIa6DrQc8e9WnNPdyT
         x7LXJPofFMEoAvptbUUcVYhPahIrpiqb0322jcFBzrM1SyhadqrAB3uhn/OIKkCjWZsR
         J9M1RPPpaSFniuoaiLRb1SUumJJWS5FT2wTOLloJ8lxS+lOdNwl3veXn9ub+iSYIs44D
         vjKIxJGUZovu7ImyAIAFZgjz9q1WZEY4y5rhrlbKbutIftndVhbJ9w951lkp/lR0dDao
         fwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286574; x=1739891374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/pIQ6Ih8jIe4aCDENSWzfq7X2UaTCBit5cGbc+Hn7Q=;
        b=JuqyUGSBHsxLV23JOESrNzu/7H29I56y8Eqzfx3vL/HWR7BycyOIA5PrJJGX+zRClG
         FwY/dEHHlvDI2msEckw6AkoxBLf8gZWwx8tf/13jJnmss4e7kOZuKGYRqOqGZNteI0t8
         KXdmh20zBtyVihSOpU6yC495nuP96s4DK1rZ3vwkQT7J1SdRPk5dc6TlbTHtszk5BZs5
         uTSHloHDPbgOcnFF4U4zWL1WlMMI8hoE8OCHKYtXQ6z69svw91WYn8/r6bJujmm/wSMc
         hiTdxltxJuiFpbPYYFBH7GImk8shoqjAiYP8vFswiPIcikhLuk35os7DCswAeBDGqMEg
         9Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCXIdqdhBZLTCK86YKJ6BtFGOofKz5rg/fv90DLSkciUYlcBNTHoeKB3tNDzg69vaMPdkHlaG/eAkph8fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yykpi5oNRNp3ih+B5eLuUjv2j+zWehVOTsMbertA9oDyiFeJzow
	sFLf9egD29LLaUmX4Dw8ZM5Uq6d4yc/r+t23f3r77b2HBUp3N3my9cFsmDwBs/Y=
X-Gm-Gg: ASbGncuy0YRSZrxms7jvsUCymUjCYQE8W7V4iC2ypoKfL5wHG1Pho+MXWXw6nId/YGS
	1QregcvQEQ8xnnYyMI4gm72+fQqE/aEevcSy1urLHq+NvvsDoWeoUMH7AS9ccntgd+Ov9Ly0Fhd
	O7eco3R7Qlp5iNeP4773izXJ9CG4MLiMPGkPKf1swbzMdIRfKx4GZgdOG1dk738kew4BlThC9vE
	RDf6ookn29Xy70AYXFbD9qTrDsIIhar/67BwnHGwXSgxSYHVMsNETKsohYxB44wM8ox2Ko6YZS8
	t2JZKr2voflg/ZIOTnbMpDItMgog4Q9gwSVitwG//LXBwpDM/8McJ45IQQ==
X-Google-Smtp-Source: AGHT+IFJ3xtCWgpPSZFz6Y/4+XS35mXvCCpo86PNaZ13YSALHhPxK4DFSsAULBbzYHjHwZkRoP4kFw==
X-Received: by 2002:a05:600c:5124:b0:439:4db6:43ad with SMTP id 5b1f17b1804b1-4394db64797mr23522605e9.21.1739286574345;
        Tue, 11 Feb 2025 07:09:34 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4c8ca52sm9363080f8f.89.2025.02.11.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:09:33 -0800 (PST)
Date: Tue, 11 Feb 2025 16:09:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Message-ID: <wy6yhp2ty2s5wq76u7toghuuztdzb5f7uphfqkgw4t7vu4eojd@sc26ynxekxki>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
 <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
 <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6nqdwb73tx4ragth"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeMe++0_hOx7ug0eRXD2cOWMRZsuHUee3KPjBE5FxjNQ@mail.gmail.com>


--6nqdwb73tx4ragth
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
MIME-Version: 1.0

Hello Geert,

On Tue, Feb 11, 2025 at 11:48:13AM +0100, Geert Uytterhoeven wrote:
> On Tue, 11 Feb 2025 at 11:32, Uwe Kleine-K=F6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> > > The subsystem status is currently reported with --role(stats) by
> > > adjusting the maintainer role for any status different from Maintaine=
d.
> > > This has two downsides:
> > >
> > > - if a subsystem has only reviewers or mailing lists and no maintaine=
rs,
> > >   the status is not reported (i.e. typically, Orphan subsystems have =
no
> > >   maintainers)
> > >
> > > - the Supported status means that someone is paid for maintaining, but
> > >   it is reported as "supporter" for all the maintainers, which can be
> > >   incorrect. People have been also confused about what "supporter"
> > >   means.
> > >
> > > This patch introduces a new --substatus option and functionality aimed
> > > to report the subsystem status separately, without adjusting the
> > > reported maintainer role. After the e-mails are output, the status of
> > > subsystems will follow, for example:
> > >
> > > ...
> > > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> > > LIBRARY CODE status: Supported
> > >
> > > In order to allow replacing the role rewriting seamlessly, the new
> > > option works as follows:
> > >
> > > - it is automatically enabled when --email and --role are enabled
> > >   (the defaults include --email and --rolestats which implies --role)
> > >
> > > - usages with --norolestats e.g. for git's --cc-cmd will thus need no
> > >   adjustments
> > >
> > > - the most common Maintained status is not reported at all, to reduce
> > >   unnecessary noise
> > >
> > > - THE REST catch-all section (contains lkml) status is not reported
> > >
> > > - the existing --subsystem and --status options are unaffected so the=
ir
> > >   users will need no adjustments
> > >
> > > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
> > breaks one of my scripts that I use to semi-automatically determine
> > recipents for patch series.
> >
> > It works as follows:
> >
> >         $ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-A=
IU-export-its-clocks-through-cl.patch
> >         #!/bin/sh
> >
> >         addrecipent \
> >         -t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE=
 AND FLATTENED DEVICE TREE BINDINGS) \
> >         -t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OP=
EN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS) \
> >         -t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIR=
MWARE AND FLATTENED DEVICE TREE BINDINGS) \
> >         -t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:=
ARM/Amlogic Meson SoC support) \
> >         -t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Aml=
ogic Meson SoC support) \
> >         -c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlo=
gic Meson SoC support) \
> >         -c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $=
(: reviewer:ARM/Amlogic Meson SoC support) \
> >         -t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND - =
SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> >         -t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC =
LAYER / DYNAMIC AUDIO POWER MANAGEM...) \
> >         -t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
> >         -t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
> >         -c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND=
 FLATTENED DEVICE TREE BINDINGS) \
> >         -c "linux-arm-kernel@lists.infradead.org" $(: moderated list:AR=
M/Amlogic Meson SoC support) \
> >         -c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogi=
c Meson SoC support) \
> >         -c "linux-kernel@vger.kernel.org" $(: open list) \
> >         -c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYE=
R / DYNAMIC AUDIO POWER MANAGEM...) \
> >         audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-t=
hrough-cl.patch
>=20
> Hey, that looks familiar ;-)
>=20
> > the output is usually redirected to a file that I edit before running
> > it. The additional line in the output of
> >
> >         scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-l=
et-AIU-export-its-clocks-through-cl.patch
> >
> > with your change breaks that script.
>=20
> You forgot to list the additional output?
>=20
> I gave it a try with my script, and with one of my own patches.
> Example additional output is:
>=20
>      --cc "ARM/Microchip" $(: AT91] SoC support status: Supported \
>     --cc "QAT DRIVER status: Supported \
>     --cc "ARM/ASPEED MACHINE SUPPORT status: Supported \
>     --cc "MELEXIS MLX90614 DRIVER status: Supported \
>     --cc "ARM/NUVOTON MA35 ARCHITECTURE status: Supported \
>     --cc "ARM/RISC-V/RENESAS ARCHITECTURE status: Supported \

Is that really your output? No closing ) in the first line and no
closing " in the 5 last?

For me it's worse(?), I get:

	$ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-i=
ts-clocks-through-cl.patch
	#!/bin/sh

	addrecipent \
	-t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE AND FLATTE=
NED DEVICE TREE BINDINGS) \
	-t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE=
 AND FLATTENED DEVICE TREE BINDINGS) \
	-t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE AND F=
LATTENED DEVICE TREE BINDINGS) \
	-t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:ARM/Amlogic=
 Meson SoC support) \
	-t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Amlogic Meson =
SoC support) \
	-c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlogic Meson S=
oC support) \
	-c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $(: reviewer=
:ARM/Amlogic Meson SoC support) \
	-t "Liam Girdwood <lgirdwood@gmail.com>" $(: maintainer:SOUND - SOC LAYER =
/ DYNAMIC AUDIO POWER MANAGEM...) \
	-t "Mark Brown <broonie@kernel.org>" $(: maintainer:SOUND - SOC LAYER / DY=
NAMIC AUDIO POWER MANAGEM...) \
	-t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
	-t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
	-c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS) \
	-c "linux-arm-kernel@lists.infradead.org" $(: moderated list:ARM/Amlogic M=
eson SoC support) \
	-c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogic Meson SoC=
 support) \
	-c "linux-kernel@vger.kernel.org" $(: open list) \
	-c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYER / DYNAMIC=
 AUDIO POWER MANAGEM...) \
	Failed to parse "SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)=
 status: Supported
	" at -e line 6, <> line 17.

=2E

To fix I added

	next if /^[^@]*status:/;

to the perl script that parses get_maintainer.pl's output.
=20
> Iff this extra output is good to have, why not include it in the comment
> next to the existing entries with the email addresses, so it will be
> handled automatically by all scripting on top?

That would be great.

Best regards
Uwe

--6nqdwb73tx4ragth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeraCoACgkQj4D7WH0S
/k7AUAgAqfBMD3p93otDOThtJBmS6zrITLlOU1WFi+kiP7yKBcgVvsHcqS8428l2
fFQt2ewQrZKIxRVuUi95yaWxqre++TXL/y1JtFeaYssAITt+rLuVuHwzlG06/d7/
AO5AG+FHuVgi0kNI3qxK7g5yfWeYSpDHmo/2eXHSsO973X+dcTi7PdY8IYIUk48i
vrorh9fBdLS1TzlMnUqzYr8IV832dGDFBYYFMxogPDKLnF8G0J1V3eY7Swhamhia
bsMxlkHP8WtzxwAwZl7GS6l5/F0u4gOQ33JbLDoZRDkXYCtv7mOskyIHSpbL6iGe
2vpGPPYW1pxD5kIexkQgzaixa1KDyA==
=/YBW
-----END PGP SIGNATURE-----

--6nqdwb73tx4ragth--
