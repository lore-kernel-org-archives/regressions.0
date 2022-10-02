Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9D3C2A;
	Sun,  2 Oct 2022 18:17:54 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id o7so5560101qkj.10;
        Sun, 02 Oct 2022 11:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LWR8MWFukGpMBQkq/zeXNemsOOXLVgT5+tpaLCTk4t8=;
        b=Pjr34bDiJcMDCsk+wGWQUcDeqIBCtx6VaXhgL4Fa8MN9OzTPIOwvioBgeHzfukroNG
         dLzKFNesl2t+0u/r74vW3pQOcRiLGtu5BwXeLrOw7avTCCQJCGrqlGNCrq7qXTOfBhAm
         i7lQLzMersYtZV4xQ3lMA17D5KUXw06AwyKvFqlTYIhTtkfJmYgCdrObrhlToUhC0oB3
         Qejw/GJFgnJqteZwtTdgETh+Mh0466JHwR0NFI0jPUlRDsw/FTuR/wtqbBArhSgYmJBq
         2+lE47qLtsn3flgdGSpSJs1E/kZsOeQzqf7VYSfO0hQJoNScjJcLWefQpH10ZdV0Bt+H
         g/EA==
X-Gm-Message-State: ACrzQf2iXPrGfnK6Iams+EG5p/uoA4XkfItUCtC62L7c8P3Yyn5G5IM4
	fJWsNPSRBqkDopr2yB4nRyOJt1WqPgkphg==
X-Google-Smtp-Source: AMsMyM5Ra8T2o0G0NkWsPG2y3YQXq6dCGwTcaIK6JMwOILRgOR2FPEVP+gkkwuEVQSOPK8mxX2iRfw==
X-Received: by 2002:a05:620a:1913:b0:6ce:4159:7b78 with SMTP id bj19-20020a05620a191300b006ce41597b78mr11975024qkb.751.1664734673711;
        Sun, 02 Oct 2022 11:17:53 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id cq15-20020a05622a424f00b0035cdd7a42d0sm7387558qtb.22.2022.10.02.11.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 11:17:53 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id f189so10766863yba.12;
        Sun, 02 Oct 2022 11:17:53 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr15975184ybl.604.1664734672797; Sun, 02
 Oct 2022 11:17:52 -0700 (PDT)
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
Date: Sun, 2 Oct 2022 20:17:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxUgyU97EK3S5Xx_vsbTv-cNO1wC9kDwsWEDx+6w9phw@mail.gmail.com>
Message-ID: <CAMuHMdVxUgyU97EK3S5Xx_vsbTv-cNO1wC9kDwsWEDx+6w9phw@mail.gmail.com>
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
> > On Sat, Oct 01, 2022 at 02:58:04PM +0000, Artem S. Tashkinov wrote:
> Bugzilla gets around two dozen bug reports weekly which encompass at
> most thirty emails, which equals to four emails daily on average.

So we're discussing about the fate of a tool through which on average
four bugs per day are submitted (some of which are not very useful
due to lack of information)? A tool which is not maintained upstream?
Perhaps that's enough reason to just kill the tool, so no one has to
worry about it, or maintain it?

However, at four emails per day, you might as well just subscribe the
subsystem mailing lists (each of which would receive only a fraction
of that, right?).  Maintainers and several developers won't even notice
that minor increase in the number of daily emails received, although
they might still complain about the contents ;-)
And that still needs someone to keep the tool working...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
