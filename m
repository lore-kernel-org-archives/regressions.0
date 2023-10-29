Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40733B67F
	for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 17:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V4ZQQFN0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9d10972e63eso236659266b.2
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698599961; x=1699204761; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CPMtoFSixsFd7J/sBpL5LC1nviwgRkdiMzTnhelk2A=;
        b=V4ZQQFN097TVNi/gMoSzRuduKl8aBe2sXO3ZR6Xs5d1CtM5yWNDVkt4ajChDKG0Tyc
         pJ+eIv7njjw7QrjXyjGu3NipkzpY/xSv/A+CksjXb7obyuoKVUxCVbHRWyM0lY6MEkI2
         SmSNw+L678nFScpb6KhWaQeKTOiFIxJjYNg7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698599961; x=1699204761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CPMtoFSixsFd7J/sBpL5LC1nviwgRkdiMzTnhelk2A=;
        b=e94sgpNZQhhRptIITLyuLgdaNgzP/fB7T7eskkyU3AF6GOwoj1+nq/pZXyPYMeIUBp
         X0X5x/EkkBkxfMuA2lw89c5m1mmkTwSNwTEFuFeoyPn+ApPuD8t0MnWB/XnCmhDNzRD0
         BQfE+eXbV/Jt4g7XmbnFrUPwHfXjQXAmN6V+yAXe/3tD4KYAOpyaRUfSDql/tSq1IpoB
         kP2N3aF90fsEQGgA8cTgdA1Ii+Wu3MFtCD5552jFAsEY35fiCanpmdxOxghz39npcMWB
         rQkax13a9wfJp5cBVs5qW+Tl5uzakQQ6w3msG/0Mtk4l/+hSHgzwNjhGYRBq/pDB/Bcv
         YN/Q==
X-Gm-Message-State: AOJu0Ywiy4XDKWJwDPUFf0vyXHUeJ7+9nC+dEBV05O8b2q7se2nkXu29
	VPF4dFKnV9jkNfrlH+09HxaXOBRG2OI12kzEuTkG8Q==
X-Google-Smtp-Source: AGHT+IGvBFC3TC1ztRYNG4CKoka5oqs5rthyWYpxfWbbKlohapNcY1A2sOCYo3SSuFJki4pMekb1Rw==
X-Received: by 2002:a17:906:da82:b0:9b2:a96c:9290 with SMTP id xh2-20020a170906da8200b009b2a96c9290mr7127455ejb.33.1698599960961;
        Sun, 29 Oct 2023 10:19:20 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id m5-20020a1709060d8500b009b2b9af0784sm4639313eji.110.2023.10.29.10.19.20
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 10:19:20 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9c41e95efcbso517528166b.3
        for <regressions@lists.linux.dev>; Sun, 29 Oct 2023 10:19:20 -0700 (PDT)
X-Received: by 2002:a17:907:3dac:b0:9ad:eb9c:dd00 with SMTP id
 he44-20020a1709073dac00b009adeb9cdd00mr6680680ejc.12.1698599960057; Sun, 29
 Oct 2023 10:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <169858752781.1095326.10615907253726224231@leemhuis.info>
In-Reply-To: <169858752781.1095326.10615907253726224231@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Oct 2023 07:19:03 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
Message-ID: <CAHk-=wgEHNFHpcvnp2X6-fjBngrhPYO=oHAR905Q_qk-njV31A@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-10-29]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Huacai Chen <chenhuacai@kernel.org>, 
	Javier Martinez Canillas <javierm@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Oct 2023 at 03:52, Regzbot (on behalf of Thorsten Leemhuis)
<regressions@leemhuis.info> wrote:
>
>                          One of the remaining ones is new:
> module loading trouble on some laptops. Not nice, but likely nothing
> many users will encounter. The quota compilation oddity problem from
> Andy is also still around (unless it was fixed without me noticing); and
> a memleak, too.

The quota thing remains unexplained, and honestly seems like a timing
issue that just happens to hit Andy. Very strange, but I suspect that
without more reports (that may or may not ever happen), we're stuck.

> * There was another report about a blank screen during boot on a Lenovo
> laptop because simpledrm (that users apparently had enabled without
> problems beforehand) started to support those machines due to
> 60aebc9559492c ("drivers/firmware: Move sysfb_init() from
> device_initcall to subsys_initcall_sync"). I suggested a revert, but the
> developers disagree (to quote: "From my point of view, this is not a
> regression, 60aebc9559492c doesn't cause a problem, but exposes a
> problem.")

Honestly, "exposes a problem" is pretty much the *definition* of a
regression. So that excuse is particularly bad.

The whole point of "regression" is "things that used to work no longer work".

And no, "there's another bug that needs to be fixed" is _not_ the
answer - not unless you have that fix in hand.

That said, this already went into 6.5, so I'm not going to revert it
now just before the 6.6 release. That would be more dangerous than
just letting things be. But yes, a revert is likely the right thing to
do, unless people have figured out what is wrong with simplefb.

                 Linus
