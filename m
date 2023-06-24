Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959A378
	for <regressions@lists.linux.dev>; Sat, 24 Jun 2023 01:36:28 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-562f8262e0cso918016eaf.0
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 18:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687570588; x=1690162588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKCBfOTPVhnF+1+fSSQ1P9xOSE1WzuFvzo4ZfnObzWo=;
        b=JwH5bPnKM1oVjQmyaDuUkk94Ncd+3xLJb0folnAyHh5y3KI8yeN+mmFI7IVw51XQwl
         znEiutHtZVMlfTwT/NH/AbMt9ctIbnoeIXRd1WQ0UbFpABHXXQiGXzqAtMZ2FCIeV3Wr
         xx/1MCb9TjKm0PBxSVD64eyC2fGGr8+GHsCIawF1gmgqsN8QlD7xvSShBi1qfBAfdJ6t
         7xV1s5Sht0felt4Gyg75R07FokH5oVxB4MoAC6Rx5tOsIuLBcovcHaMP/mi8j+aOoVuZ
         oTxn4liqUhK5Sl3i5YE6sY+ySrkEsAorON5TvtZ6V8cD2DoBTyGCQz+GutnZzd+SB0U7
         B9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687570588; x=1690162588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKCBfOTPVhnF+1+fSSQ1P9xOSE1WzuFvzo4ZfnObzWo=;
        b=IZ38S1r5dMSgv4NH06BSg7y21HPRC/JCboKW1KZl3tMvZJ0/LeR51mEEDzue316DlE
         N6thsQmIlPyrY6/BdywqDL84bTxCQowuz/bC3snwficG2eYIA5c0RFOrwv08DSRoUc8u
         oABI9lk13dJAWvddECLO4fUblyRmhJ9rnRw4DK1yX4KsHskyZsTTTxKgiLvBPJWhW4+/
         YFuEXIQsd/3qe1oY6UhjGiYODe5QZ5iq2xnNNXCQ3ayQ76+wFkpyrAQ2fxfJtwz+6wMV
         z79C9PPxo3ar9LkaRSKRabKb0RcIUWCNaV21ISuY8tLFqYJuLpDjR/LDQLQ0/cUWJWNA
         U/wQ==
X-Gm-Message-State: AC+VfDzysr5V9kYjkczqjGu18AP3sqWlf4FfKkGJ98SSc6rVvBPCJiP+
	WX8kdYbrFbAmCXPncv4N0ly4aWKMViWtrHiOECo=
X-Google-Smtp-Source: ACHHUZ6WaJdV94OE7t3etctyvj6GbYEmXVbiPZjay7wYjLCCzlD9gN2tO463/maChN3nAyhhbTz0MNS/MyVC1GWsHzA=
X-Received: by 2002:a4a:d884:0:b0:558:c5b8:9575 with SMTP id
 b4-20020a4ad884000000b00558c5b89575mr17916153oov.1.1687570587771; Fri, 23 Jun
 2023 18:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/> <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me> <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de> <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
 <873536js7q.wl-tiwai@suse.de> <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
 <2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com> <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
 <485f99149508488080d563144454040e@realtek.com> <CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
 <2831c55638a5431ca9e37d9caf365ed2@realtek.com> <CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
 <3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com> <CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
 <009474f04d0b45c69a0e42e8622b7a86@realtek.com> <87h6rhcef2.wl-tiwai@suse.de>
 <0990300d759846d890de9c92fcad9a9d@realtek.com> <CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
 <878rctcavz.wl-tiwai@suse.de> <874jnhc9u4.wl-tiwai@suse.de>
 <CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
 <875y7vbxpg.wl-tiwai@suse.de> <CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
 <87wn0aa1s4.wl-tiwai@suse.de>
In-Reply-To: <87wn0aa1s4.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Fri, 23 Jun 2023 21:36:11 -0400
Message-ID: <CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang <kailang@realtek.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 3:36=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Thanks for checking.  So the additional delay didn't help at all,
> i.e. it's no timing issue.  We need to figure out which verb actually
> breaks things.  Oh well.

Was there something else specific you wanted me to try for this? If
not, what do you think the next steps to get this fixed are? Do you
think it might be good to just cook the partial revert I posted a
while back after all?

Thanks,

Joseph C. Sible
