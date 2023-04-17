Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB5D63DD
	for <regressions@lists.linux.dev>; Mon, 17 Apr 2023 11:38:19 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-94a342f4c8eso98976666b.0
        for <regressions@lists.linux.dev>; Mon, 17 Apr 2023 04:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681731498; x=1684323498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/aw1KR9w+aBrMUs+mn4AJ435pOJ7Rn5INzRUj92jpQ=;
        b=LVea+r4H9AifQCuM5/7cwHL7pjwX7z+KXdUnD9+1PnkJ7W2FhD3EA6XieflIQJODai
         BgeDWZmDBEhGpsmCf2S0qutuvfM410RJYVKgFV3wJbLZhiH4I0tDwy37yCmyjMONbQ2w
         CLCXRhlFfR0ZF3A3e5z9GFjH4FiJwh+L6VFyDnDRxc8jQ/LgUAqd862QApst6U1II/lP
         f1MtpuwEQjZzBc3y6Tr4HakZBm1tOlsJb0O6q+RPd0tBTX7Ou74HTt9/I2wOMQcUT/j/
         e0+QZbSCTaDjhASHtkspEcU+2Itb9OJ5ndJdGd013QPTT/skgyqWgJ2jiapSWdKCfGIv
         oWsw==
X-Gm-Message-State: AAQBX9dp6yxrnJK9uqkz9ewsnAYnkmOqwkAutl3ttBkVEE+9oo1ap1F4
	WjMU9TwF+yl2FyioeqnON9CUu5WnA6OYWf2vmEU=
X-Google-Smtp-Source: AKy350baN95neUjNrHOgHmvL1tImB5jWGwoeZyUEBqSe9LGD7WyoU+WMIOuCwueZTzuRur34sCie9B8HuleYIvm9e5U=
X-Received: by 2002:a17:906:74c8:b0:94e:d688:fca6 with SMTP id
 z8-20020a17090674c800b0094ed688fca6mr8253384ejl.0.1681731497811; Mon, 17 Apr
 2023 04:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168166781352.1843526.278570500979918184@leemhuis.info> <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 17 Apr 2023 13:38:06 +0200
Message-ID: <CAJZ5v0j_MwW6JaqTRNhmz=LcW8==GZ0X-=W0+z0tOsGQyDd0Dw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-16]
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rafael Wysocki <rafael@kernel.org>, 
	David Sterba <dsterba@suse.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 16, 2023 at 10:49=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, Apr 16, 2023 at 10:59=E2=80=AFAM Regzbot (on behalf of Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > Wake-on-lan (WOL) apparently is broken for a huge number of users since
> > 6.2 was released[1]. This is known for 8 weeks now and about 4 weeks ag=
o
> > it was bisected to commit 5c62d5aab87 ("ACPICA: Events: Support fixed
> > PCIe wake event") we immediately could have reverted. The developer tha=
t
> > looked into this was even willing to do the revert late March, but then
> > got discouraged by a maintainer [2]. But well, a fix was apparently[3]
> > finally posted for review last week (to the acpica-devel list); with a
> > bit of luck your might get it next week. Still a bit sad that 6.2 is
> > broken for so long now, as Greg wants to see it fixed in mainline first=
.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217069
> > [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D217069#c50
> > [3] https://lore.kernel.org/all/754225a2-95a9-2c36-1886-7da1a78308c2@lo=
ongson.cn/
>
> I find that bugzilla discussion very confusing, it's not clear what
> the status of the patch actually is.
>
> And the sane lkml thread just says "the patch is under review" without
> actually saying *where* said patch is, or where the review is.
>
> It sounds like it got perhaps into some internal ACPCICA queue? None
> of those links are very clear on any of this.
>
> Rafael?

There is a pull request for ACPICA that corresponds to this (IIUC),
https://github.com/acpica/acpica/pull/866
