Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15191FC0
	for <regressions@lists.linux.dev>; Mon,  9 May 2022 17:21:17 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id j6so28124914ejc.13
        for <regressions@lists.linux.dev>; Mon, 09 May 2022 10:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NbKadAlbEuv9SCL4clueu9SSBtV1FA6IQDblzg5FTkc=;
        b=VhLWVfy7VuAnawsLFBmFlKuhHwfBkHheP2GCjLRi0YYeGJiosDj1ZiqdhTw0COwHlL
         oyAC748yRG+xi07STBQBggoNnarsQtg82LQ2wAmMCse/7vNdZan7c8GM+wPCCL33stzb
         zsXIFmfxn4Can6ZOtEq58A3aSqYgMGqCetzAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NbKadAlbEuv9SCL4clueu9SSBtV1FA6IQDblzg5FTkc=;
        b=ppi9917KEr6avP9fZZbn3BkDKkGRl18rO9y2X4PWZ7i/2kAAjm8dMkHL20FpvROea0
         H6RafCz31gCnBADs+Od3N1Ft0dr9DAO8yIn5Vm0RtKro9gfqNHgvT/cNtrchLUbx0olZ
         rzemIHJ5aB7aK6yKADgZwly2rgKOH+4vef2NIAtkN+v4GN6RexH4ec6ZNAGLm5cIaJ19
         tkP6PupaAOmAn+sD7EaUTF5VtvlvJo82nJ7TG7y61lnhvX0qg23fQnVwiXqNUV/1TrxA
         8J6tp5IGr1XxHjJPTUReJhS97pQpEeEO7+94s6NnCm4okRroErb2kP8CujXa3GqwMN4B
         PH8w==
X-Gm-Message-State: AOAM532HXgErVnveZRW004SPlDG+1oICo8kb6EoKUDsaMecAxnufLyZ3
	5qfwBE91qxpCzPN/YrxfVVQdrmeEKr8jzymh
X-Google-Smtp-Source: ABdhPJwmNbaH+/v/EY5ZtH1LrLALX0nkNRIoyGVUEoBaz1h7cyv27Xoo77O0+h4a+tzcXG7lpEGNFg==
X-Received: by 2002:a17:907:7f12:b0:6f4:57e7:b20a with SMTP id qf18-20020a1709077f1200b006f457e7b20amr15033272ejc.538.1652116875809;
        Mon, 09 May 2022 10:21:15 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id jz11-20020a17090775eb00b006f3ef214e51sm5201757ejc.183.2022.05.09.10.21.14
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 10:21:15 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso11193873wma.0
        for <regressions@lists.linux.dev>; Mon, 09 May 2022 10:21:14 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr11550087wmq.145.1652116874604; Mon, 09
 May 2022 10:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wi0vqZQUAS67tBsJQW+dtt89m+dqA-Z4bOs8CH-mm8u2w@mail.gmail.com>
 <165209064657.193515.10163777181547077546@leemhuis.info>
In-Reply-To: <165209064657.193515.10163777181547077546@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 May 2022 10:20:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
Message-ID: <CAHk-=wj0gHsG6iw3D8ufptm9a_dvTSqrrOFY9WopObbYbyuwnA@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-05-09] (was: Linux 5.18-rc6)
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 3:47 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi Linus! Here's a quick compilation of open reports about regressions in
> 5.18-rc that I'm currently aware of; most of the reports are quite
> recent and there afaics is nothing that looks particularly worrisome.

Well, the Intel GPU issue seems likely to cause problems for lots of people:

> [ *NEW* ] drm/i915: BYT rendering broken due to "Remove short-term pins from execbuf, v6"
> -----------------------------------------------------------------------------------------
> https://linux-regtracking.leemhuis.info/regzbot/regression/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
> https://lore.kernel.org/dri-devel/1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com/
>
> By Hans de Goede; 0 days ago; 2 activities, latest 0 days ago.
> Introduced in b5cfe6f7a6e1 (v5.18-rc1)
>
> Recent activities from: Tvrtko Ursulin (1), Hans de Goede (1)

Although it looks possible that it mainly affects old chipsets (ie the
two reports are for a Bay Trail chip and a Core 2 Duo chip - I have no
idea how they compare).

That probably means there are a lot of machines out there, but likely
not the kind that most kernel developers will be testing, so not a ton
of reports until it hits distro kernels etc.

It looks like Maarten is already involved.

                    Linus
