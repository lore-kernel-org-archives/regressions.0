Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5267B;
	Sun,  2 Oct 2022 16:08:26 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id h28so5487478qka.0;
        Sun, 02 Oct 2022 09:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HriaR9SbJdHeOwl1T1L8SB1ypd9OI4wcQH5thMKc5u8=;
        b=og35oo7IwI09WlwugN2cAcj5ahCQjobKYb02zWTR/YwADM7dXjfNoXo44f3K/7YYqb
         azwVQl9p9NeQaUbhJXNRSvRipThXhBYRndSCipqoSh2CO8f/TVtNSPaeWXcxR9Inzl+S
         7051n7/Y/oNk4aG2z4jIwIIxv0z7On165XxaxKYu2RoYBfMWrJgzsMGXgaYvZg0M1K5R
         vlDdT0VxwYze/eFnTpnG/nSynLxdWHYh/lm/2GQC5A/maNvLGXytqwxmO+xo734XyfA3
         nxf4Y8E39uZOBmtkA82n0u6hd2/J7cdEVLU3AAp17EMREE7HwiNOgIKAyrKyQxKezBOw
         7dlw==
X-Gm-Message-State: ACrzQf2hDyWLqzlsdi2a1A4cptdRZ+Ws/oRfaAi9XvrqdKVbl3INZimZ
	TA6ytWbDkxY7M46H6DFtF0k9bLIGQ7P7Rw==
X-Google-Smtp-Source: AMsMyM704nxj4tBDoJcatKq2GQSNsmmlqYyBfaVRlO3bQCJfjINslWmjMFwyNfb/GECsbrku4Sm/2w==
X-Received: by 2002:a37:40e:0:b0:6cb:be14:1818 with SMTP id 14-20020a37040e000000b006cbbe141818mr11726540qke.284.1664726905775;
        Sun, 02 Oct 2022 09:08:25 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id bl14-20020a05622a244e00b0034456277e3asm6947937qtb.89.2022.10.02.09.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 09:08:25 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3321c2a8d4cso86700687b3.5;
        Sun, 02 Oct 2022 09:08:24 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:357:2422:13b4 with SMTP id
 135-20020a81098d000000b00357242213b4mr8099058ywj.316.1664726904607; Sun, 02
 Oct 2022 09:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info> <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
 <YzgY9X/DM9t/ZuJe@kroah.com> <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info> <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info> <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com> <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
In-Reply-To: <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 2 Oct 2022 18:08:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLbS5jnOpdq0a6ie3eB5rmM6Rof3390t0u5FeO4Hmt5g@mail.gmail.com>
Message-ID: <CAMuHMdWLbS5jnOpdq0a6ie3eB5rmM6Rof3390t0u5FeO4Hmt5g@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Sun, Oct 2, 2022 at 2:49 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> The current ill-maintained semi-functional bugzilla has proven to be a
> ton more useful than random mailing lists no sane person can keep track
> of. Bug "reports", i.e. random emails are neglected and forgotten. LKML
> is the worst of them probably.

Such a statement really needs to be backed by numbers...

> Let's operate with some examples:
>
> Bugzilla gets around two dozen bug reports weekly which encompass at
> most thirty emails, which equals to four emails daily on average.

This immediately debunks your statement above.

$ git log v5.19..linus/master | grep Fixes: | wc -l
2928

So that's 46 bugs fixed per _day_.  Most of them not reported
through bugzilla...

> LKML alone sees up to a hundred emails _daily_.
>
> Getting worked up about it? I'm dumbfounded to be honest.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
