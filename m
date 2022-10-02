Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9423D6;
	Sun,  2 Oct 2022 09:03:23 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id i12so5453697qvs.2;
        Sun, 02 Oct 2022 02:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eqhMZWvXULuL578n1n0PalIWlRFdoHoI0gRbkp8SjOY=;
        b=4W/Uh6cYcfik5GBa0JyIVo1TLzsbWiABSViRdXazxuf40MFoWM90z/3MRmNb+2WR9Q
         GxA5wye6LcNXJlxrCgaL8NiJ/X4uxq62VZ37oKF2kOJaKDYuKwxmfQGRUVAbVIYiWBvF
         57kZY5LxhcGrgn6qChvUvxLCUOw0nOGD6bUGMOK27GgL6TMwhrUcOMAW9VCV8uu9gS68
         iz2bn5iXKmbrtiK1KbCqVahHZfxfa75sucRYi4QorQb6Rv0VeXhEeDypwF2ieFUlmHrN
         eBE3DGhSX9Np+akvD77keX0Nu29HZGSzlvE+3vdx+X2APE93LxZFOXhEmJFl32sRF1/B
         T3YQ==
X-Gm-Message-State: ACrzQf2nK8iE/KZBgz+pzqr8gmEBQNM3woC7e+fVnqaZw1fYnTpr60GB
	8dnKwXL5M5ALyIUhAQQDuhH0SQq48c1dtA==
X-Google-Smtp-Source: AMsMyM7NXXrl8/KfCRimNiRWSU+x26WTt4w6iT1HiDZDRsIP+A51hcsOpPf7WCLNEbviReRORIOHjA==
X-Received: by 2002:a0c:a79a:0:b0:49f:583f:5292 with SMTP id v26-20020a0ca79a000000b0049f583f5292mr12495046qva.116.1664701402077;
        Sun, 02 Oct 2022 02:03:22 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i68-20020a37b847000000b006bb49cfe147sm7550343qkf.84.2022.10.02.02.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 02:03:21 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 81so2565687ybf.7;
        Sun, 02 Oct 2022 02:03:21 -0700 (PDT)
X-Received: by 2002:a05:6902:45:b0:6ae:ce15:a08d with SMTP id
 m5-20020a056902004500b006aece15a08dmr14801571ybh.380.1664701401207; Sun, 02
 Oct 2022 02:03:21 -0700 (PDT)
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
In-Reply-To: <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 2 Oct 2022 11:03:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWontzcX=ww8HbVWc2j418SdyzoPyKa4HHFsxzijbVSw@mail.gmail.com>
Message-ID: <CAMuHMdUWontzcX=ww8HbVWc2j418SdyzoPyKa4HHFsxzijbVSw@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Artem,

On Sat, Oct 1, 2022 at 1:21 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> On 10/1/22 10:57, Thorsten Leemhuis wrote:
> > On 01.10.22 12:47, Artem S. Tashkinov wrote:
> >> On 10/1/22 10:39, Greg KH wrote:
> >>> On Sat, Oct 01, 2022 at 10:30:22AM +0000, Artem S. Tashkinov wrote:
> >
> >>>> I have a 20+ years experience in IT and some kernel issues are just
> >>>> baffling in terms of trying to understand what to do about them.
> >>>>
> >>>> Here's an example: https://bugzilla.kernel.org/show_bug.cgi?id=3D216=
274
> >>>>
> >>>> What should I do about that? Who's responsible for this? Who should =
I
> >>>> CC?
> >>>
> >>> Input subsystem.
> >>
> >> It's great you've replied immediately, what about hundreds or even
> >> thousands of other bug reports where people have no clue who has to be
> >> CC'ed?
> >
> > Quoting from https://docs.kernel.org/admin-guide/reporting-issues.html:
> >
> > "[...] try your best guess which kernel part might be causing the issue=
.
> > Check the MAINTAINERS file [...] In case tricks like these don=E2=80=99=
t bring
> > you any further, try to search the internet on how to narrow down the
> > driver or subsystem in question. And if you are unsure which it is: jus=
t
> > try your best guess, somebody will help you if you guessed poorly. [...=
]"
> >
> > HTH, Ciao, Thorsten
>
> Absolute most people:
>
> * Will never read this document
> * Will not be able to "search the internet on how to narrow down the
> driver or subsystem in question"

So how did these people arrive at "bugzilla" in the first place? ;-)

Or is this a case of "if all you have is a hammer...", so you
actively start looking for a bugzilla?
I.e. people who are used to bugzilla/discourse/slack/irc/trac/... will
look for how to use bugzilla/discourse/slack/irc/trac/... to interact
with the developer and/or maintainer.

The definitive guide is the MAINTAINERS file.  If there is a (rare)
corresponding "B" entry, you can use that.  Else fall back to the
"M" and "L" entries.  "C" might be good for an initial query, but not
for the actual reporting, as there's even less traceability than with
mailing lists (the latter are archived by lore).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
