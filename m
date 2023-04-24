Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF52108
	for <regressions@lists.linux.dev>; Mon, 24 Apr 2023 14:25:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-95227e5164dso133444866b.1
        for <regressions@lists.linux.dev>; Mon, 24 Apr 2023 07:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682346298; x=1684938298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iPDVN2JRvAs5aBXvDi0v6AAx42pZdYcsBFV+oN7Sro=;
        b=SJ3Ff6u6uyY11CecugwG17BeG1ikUlKbBnRBiZXU4HlC0ZSHADzIv8NuxeoA6rBBS4
         zO+sb9COlUTvqAwMXrXICrWnkEwGZnQR/EaIiooRseS/87yB2RxiFOUikytnxDx7FfWD
         cQiQy+or2v8JGhASMooDnTQoz4rozezc+MBXUL9d81ilnOCuX1j/1HJYUY/jpHcjSVzS
         /iOr2SToTXj6Rg2vi2bZJGI3cpeTTvbnTMFiU64jdRnkanLPdran/WuxRw8xssEOHL/q
         oH5NZkyI11RSqx6x0CTTwdaf3WWaGMQaxWD8DfbmYDy9oGpeo2vd5XKkZs5Np1cTtnoO
         9VrA==
X-Gm-Message-State: AAQBX9cYeH3uCAvAaRpoHOtjzD5y0g7MGjRL+a5VQ7uz52usuVnG0GSj
	6T2+RpVzcfBi+Dku9JnS4o2Dy0HyKKaXIKNXPSU=
X-Google-Smtp-Source: AKy350ZCeSYhWrQ72tvK73ERvNG92qwB5cxgU2R3y8X36I//xTYq1VhY110Y7Fxl5AXYolbqZGjaI65XSXtylBSw/7k=
X-Received: by 2002:a17:906:a246:b0:94f:4ec3:f0e8 with SMTP id
 bi6-20020a170906a24600b0094f4ec3f0e8mr10421243ejb.4.1682346298426; Mon, 24
 Apr 2023 07:24:58 -0700 (PDT)
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
 <CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com>
In-Reply-To: <CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 24 Apr 2023 16:24:41 +0200
Message-ID: <CAJZ5v0jVoUQAuW6GAE1tkW616F9x_0SK21BvtcqGzhLjVx02cQ@mail.gmail.com>
Subject: Re: the wake-on-lan regression from 6.2 (was: Re: Linux regressions
 report for mainline [2023-04-16])
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, David Sterba <dsterba@suse.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 10:45=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Apr 21, 2023 at 12:22=E2=80=AFPM Rafael J. Wysocki <rafael@kernel=
.org> wrote:
> >
> > It will get fixed, most likely by reverting the offending commit and
> > most likely during the 6.4 merge window.
>
> No.
>
> It's now reverted in my tree.

Thanks for taking care of this and sorry for the trouble.

I was traveling Fri - Sun and I wouldn't have been able to push the
revert myself before today.

> We're not doing *another* release with this known-broken garbage. It's
> been pending for much too long already.
>
> Known-broken commits either
>
>  (a) get a timely fix that doesn't have other questions
>
> or
>
>  (b) get reverted
>
> Not this kind of "this is broken, has been known to be broken for a
> long time, people have bisected it, and we're just sitting here
> wondering what to do".
>
> > Note that ACPICA is involved, so the analogous revert needs to be
> > submitted there and I'm traveling right now.
>
> No, we're not waiting for "it's broken in the ACPICA tree" and using
> that as an excuse to have a broken kernel.
>
> If the ACPICA tree can't get their act together in two months, that's
> their problem. It does not mean that users should need to suffer known
> issues.

OK, in the future I'll deal with problematic commits coming from
ACPICA more timely without waiting for upstream.
