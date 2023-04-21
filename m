Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143B33D1
	for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 20:45:38 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-956eacbe651so306239566b.3
        for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 13:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682109936; x=1684701936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjzyPI+dsLA9tFzE+qKkauFePAkFasKeOC/4yMxjAAI=;
        b=DUuLCebzYtE+ayM8PjgVfm071n3KjKq4Uxh2tvIlKRsXDugAbe9KvWb9IypVj+KeA/
         LaU1gkfuO19/c+8yyPvVaVvXNuS0LXGgfchDY68c/LT4En+R/i4TsI4Shsba9bWd35Ab
         5QXEisavijws5iGjZ+nokU1cr5G+/mKuNH4SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682109936; x=1684701936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjzyPI+dsLA9tFzE+qKkauFePAkFasKeOC/4yMxjAAI=;
        b=PHxoqrMJQrBGnV7EGAzElfp6evMs3VxPUIpgvpBlWTL0nIlNXocmUmSz/uvlbSDYEF
         E/xnTVKm8yLrUWV/fMVOdPigetH+gHpNA3tA6YMlswUOeCMXW9tZRYliR8EIyD8dC/SE
         3l7M8CYuM686j9/zeCdpOEx/yLaJ8880dQLnSL+n0T7HhQ8uuZirlbV+DFN254cdtiK8
         MsQAk7MmZJj7WF/w9WJv57M7FGMkQ3NG2uOsOY7h8OZ+qoRNfRV7eWcUF/n+aRxOQYnU
         AThDzw2a/2sETLxLHkdYRl0CDWHwxqzzNINmCFpTR+ovMMpNaVVhFrO5mf5+OullMTwc
         Bc2A==
X-Gm-Message-State: AAQBX9dcKA7f/YG0VBjHXXrKjoGYFNAW4fI7WDZ1OehxWToZHANaT2Ct
	Ug2pN9fer0Mk2/SELi/RA/lZ6muxwMnPfZr2vHvrUw==
X-Google-Smtp-Source: AKy350Zm2JKUIKqtYSm5Zf3qnDm6eSLPFF9gCZBK/1VLBdA10fsAilTR/Mz06pWJ8cmiDZXIc/lW4g==
X-Received: by 2002:a17:907:1c86:b0:94f:81c:725e with SMTP id nb6-20020a1709071c8600b0094f081c725emr4751605ejc.59.1682109936260;
        Fri, 21 Apr 2023 13:45:36 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906c09600b0094f7cc13a69sm2453408ejz.181.2023.04.21.13.45.35
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 13:45:35 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-507bdc5ca2aso3649472a12.3
        for <regressions@lists.linux.dev>; Fri, 21 Apr 2023 13:45:35 -0700 (PDT)
X-Received: by 2002:a05:6402:641:b0:504:921b:825 with SMTP id
 u1-20020a056402064100b00504921b0825mr5638433edx.36.1682109935212; Fri, 21 Apr
 2023 13:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168166781352.1843526.278570500979918184@leemhuis.info>
 <CAHk-=wjQaxmXTR68VnEJvLgB=H2agMTrrF4EXkXT4Hbdf2ZuMQ@mail.gmail.com>
 <CAJZ5v0j_MwW6JaqTRNhmz=LcW8==GZ0X-=W0+z0tOsGQyDd0Dw@mail.gmail.com>
 <b51f571a-d6b2-1908-d94a-bc0b2a751905@leemhuis.info> <CAJZ5v0j+VieZvQUXtyEJg47oggji2zgcJ6W9Mnge9Xz867QTJQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0j+VieZvQUXtyEJg47oggji2zgcJ6W9Mnge9Xz867QTJQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Apr 2023 13:45:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com>
Message-ID: <CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com>
Subject: Re: the wake-on-lan regression from 6.2 (was: Re: Linux regressions
 report for mainline [2023-04-16])
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, David Sterba <dsterba@suse.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 12:22=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> It will get fixed, most likely by reverting the offending commit and
> most likely during the 6.4 merge window.

No.

It's now reverted in my tree.

We're not doing *another* release with this known-broken garbage. It's
been pending for much too long already.

Known-broken commits either

 (a) get a timely fix that doesn't have other questions

or

 (b) get reverted

Not this kind of "this is broken, has been known to be broken for a
long time, people have bisected it, and we're just sitting here
wondering what to do".

> Note that ACPICA is involved, so the analogous revert needs to be
> submitted there and I'm traveling right now.

No, we're not waiting for "it's broken in the ACPICA tree" and using
that as an excuse to have a broken kernel.

If the ACPICA tree can't get their act together in two months, that's
their problem. It does not mean that users should need to suffer known
issues.

                Linus
