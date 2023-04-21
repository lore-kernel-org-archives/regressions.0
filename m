Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1328E3
	for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 19:22:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f1745b7132so4890055e9.1
        for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 12:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682104956; x=1684696956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUembD9ev3Hoip74sAiYeM3z91MrB5ebVpCIuBe3k1A=;
        b=Dq73zNDXUcBVWCKNGiidF05BxJpbonrdvUYfg7VSZkN58zw2AoRxTEGy0ecp8/MSIs
         GKXlngxTUrFIOWr8M0S3LIDY0jzsXoLXghXONUuNaQIaYp6CF8t8rzr+zVFTt4XOIOhO
         iSY/06hShkML4aduGvrbhYQmmhgbgnI4oBZw7FXX2G3+OcoBqtuxRYZK3AMMLsUrs44+
         cNGhlueR7traljOzXKZx3qkMKaexyAU0Iyksaxa3j54krwugoTcWQqulp2qwTf0ug3QK
         dZrVuJHIAB2iXBBEn57CAiyjKIPWjyaq2Jl7rbvsbm2AYUjMKBfLEmTLu0eOAh1ZRz6e
         qUDg==
X-Gm-Message-State: AAQBX9e+c/GEMv9dO7E3P2X4QmdHgSWrEwm79YMi8yFWjETLcZ2n3b+1
	HD0tujWHNebU/a/K+jYLobn4zaLsbWQDWX3j4kuSUGQe
X-Google-Smtp-Source: AKy350ZLRWzS3+IhEK7gF+tkQSEr74SBX+E6ZwQNQWvti8OT6KYpmTdjdT8KGejrQ/YPsC7dEfuj5qnDe6WR/A1kTio=
X-Received: by 2002:adf:f1ca:0:b0:2f8:15d8:e627 with SMTP id
 z10-20020adff1ca000000b002f815d8e627mr4020345wro.7.1682104956428; Fri, 21 Apr
 2023 12:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168166781352.1843526.278570500979918184@leemhuis.info>
 <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
 <CAJZ5v0j_MwW6JaqTRNhmz=LcW8==GZ0X-=W0+z0tOsGQyDd0Dw@mail.gmail.com> <b51f571a-d6b2-1908-d94a-bc0b2a751905@leemhuis.info>
In-Reply-To: <b51f571a-d6b2-1908-d94a-bc0b2a751905@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 21 Apr 2023 21:22:24 +0200
Message-ID: <CAJZ5v0j+VieZvQUXtyEJg47oggji2zgcJ6W9Mnge9Xz867QTJQ@mail.gmail.com>
Subject: Re: the wake-on-lan regression from 6.2 (was: Re: Linux regressions
 report for mainline [2023-04-16])
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	David Sterba <dsterba@suse.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 3:49=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 17.04.23 13:38, Rafael J. Wysocki wrote:
> > On Sun, Apr 16, 2023 at 10:49=E2=80=AFPM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >>
> >> On Sun, Apr 16, 2023 at 10:59=E2=80=AFAM Regzbot (on behalf of Thorste=
n
> >> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>
> >>> Wake-on-lan (WOL) apparently is broken for a huge number of users sin=
ce
> >>> 6.2 was released[1]. This is known for 8 weeks now and about 4 weeks =
ago
> >>> it was bisected to commit 5c62d5aab87 ("ACPICA: Events: Support fixed
> >>> PCIe wake event") we immediately could have reverted. The developer t=
hat
> >>> looked into this was even willing to do the revert late March, but th=
en
> >>> got discouraged by a maintainer [2]. But well, a fix was apparently[3=
]
> >>> finally posted for review last week (to the acpica-devel list); with =
a
> >>> bit of luck your might get it next week. Still a bit sad that 6.2 is
> >>> broken for so long now, as Greg wants to see it fixed in mainline fir=
st.
> >>>
> >>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217069
> >>> [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D217069#c50
> >>> [3] https://lore.kernel.org/all/754225a2-95a9-2c36-1886-7da1a78308c2@=
loongson.cn/
> >>
> >> I find that bugzilla discussion very confusing, it's not clear what
> >> the status of the patch actually is.
> >>
> >> And the sane lkml thread just says "the patch is under review" without
> >> actually saying *where* said patch is, or where the review is.
> >>
> >> It sounds like it got perhaps into some internal ACPCICA queue? None
> >> of those links are very clear on any of this.
> >>
> >> Rafael?
> >
> > There is a pull request for ACPICA that corresponds to this (IIUC),
> > https://github.com/acpica/acpica/pull/866
>
> Rafael, what happened to this?

It will get fixed, most likely by reverting the offending commit and
most likely during the 6.4 merge window.

Note that ACPICA is involved, so the analogous revert needs to be
submitted there and I'm traveling right now.

Thanks!
