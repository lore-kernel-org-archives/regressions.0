Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474C7B;
	Sun,  2 Oct 2022 16:11:05 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id ay9so5274983qtb.0;
        Sun, 02 Oct 2022 09:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WTvr6KrD1Ov/UIG2XSm8BCfmFEi/ZMG6lyU59pelPCU=;
        b=ek3R3/j69GdWMstgphH1ym1vRoQXZZOHdbuYg6yuKtEQrdsRtwtT2fGiePIbpwLUS2
         b3dEfJpLkF14VtfDVQE/TMgsw0/sHEsdK0UsPxDacaWFGy9n3a/nz9dtexNv1vGdyRzn
         Ouj1KFankEqHe/uhu/SrrAFtzsRWVKHwMdCHJ80RnNdZxg8gATZ4RZp+2x5M/8asL4XH
         2L3Q3Y0wA8qT9kD0WHfIgFKhLgbrE3nb6am2f7V6m54ZtK0+Dve+4EO/QK2cKMIsA7dd
         fMGBFH/YIxJiSdWRM9w96buWZoMrBH9wxqo02L5D7XBlDrO8diBL+rOTsYJ1qgw5zTmR
         2ouw==
X-Gm-Message-State: ACrzQf0LeP5M1wthtBNpmYtx1J4IEighcCxR5LaJ0EUCvueBqj1+e7dT
	bq3TQ7EyWjv0AgmRFEAnIJ8ug1BWLuQu5g==
X-Google-Smtp-Source: AMsMyM7W/KoHtYio1fVUkEQUnbAsBlFQ98y8ozo+HrnoGQKGRdEQcbDvGTb2tdQ70E3z2xBfUFhQaQ==
X-Received: by 2002:ac8:7d4e:0:b0:35d:1b7f:8331 with SMTP id h14-20020ac87d4e000000b0035d1b7f8331mr13429667qtb.613.1664727064015;
        Sun, 02 Oct 2022 09:11:04 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id r7-20020a05620a298700b006ce3e4fb328sm8763278qkp.42.2022.10.02.09.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 09:11:03 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 81so3195860ybf.7;
        Sun, 02 Oct 2022 09:11:03 -0700 (PDT)
X-Received: by 2002:a05:6902:2c1:b0:6b2:8bb0:79a0 with SMTP id
 w1-20020a05690202c100b006b28bb079a0mr16557262ybh.202.1664727063295; Sun, 02
 Oct 2022 09:11:03 -0700 (PDT)
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
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com> <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com> <CAMuHMdWLbS5jnOpdq0a6ie3eB5rmM6Rof3390t0u5FeO4Hmt5g@mail.gmail.com>
In-Reply-To: <CAMuHMdWLbS5jnOpdq0a6ie3eB5rmM6Rof3390t0u5FeO4Hmt5g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 2 Oct 2022 18:10:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVskGrYpPG3dAGuMrELjNewD7vuLZFzP64N_xu9uKRwvw@mail.gmail.com>
Message-ID: <CAMuHMdVskGrYpPG3dAGuMrELjNewD7vuLZFzP64N_xu9uKRwvw@mail.gmail.com>
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

On Sun, Oct 2, 2022 at 6:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Oct 2, 2022 at 2:49 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> > The current ill-maintained semi-functional bugzilla has proven to be a
> > ton more useful than random mailing lists no sane person can keep track
> > of. Bug "reports", i.e. random emails are neglected and forgotten. LKML
> > is the worst of them probably.
>
> Such a statement really needs to be backed by numbers...
>
> > Let's operate with some examples:
> >
> > Bugzilla gets around two dozen bug reports weekly which encompass at
> > most thirty emails, which equals to four emails daily on average.
>
> This immediately debunks your statement above.
>
> $ git log v5.19..linus/master | grep Fixes: | wc -l
> 2928

Sorry, this was using my grep = `grep --color=tty -i' alias.
But that caused less than 100 false-positives, thus has no impact
on the point I'm trying to make.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
