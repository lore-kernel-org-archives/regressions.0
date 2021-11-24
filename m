Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720292C82
	for <regressions@lists.linux.dev>; Wed, 24 Nov 2021 18:14:14 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id e3so14390146edu.4
        for <regressions@lists.linux.dev>; Wed, 24 Nov 2021 10:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fo4mOTqhHKegk3FsdIGggEWxMKGlpqzxJlRZUDZ6lK8=;
        b=h4EQIdhoGpX4ZXTjiWQ2vyhcmJAF+1+VP7MYLwAWfABXN6usB8j2QQhvHqi1Gz0+ch
         qKxs9RoH+Y1E+sPzy/OGZ9+tsKgU//Fa5sH7sDYr2O7hWeentE7GVDW9ax22plVKt/oD
         FBqRidgp+L9gO6zuRYyHPGzi2bD4LoneunKHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fo4mOTqhHKegk3FsdIGggEWxMKGlpqzxJlRZUDZ6lK8=;
        b=DW01icyUxyP+mS1cuYI3dUhILkjBi4sFvH2Y2dvwtpJA2V1q2nGawCuiOi2NItaF4B
         YUbAkpqfvAytowybPcjj/CTO5xXMR3W+8xnknQ8MYJrYTVvamJ/k5jbA3QgMgTetaeAR
         9qrFZYhOq6KC9PU6f7p/uilp7MQaayWkAe/rXZuD00j0ws58GuyLB08ilskKoq5m5ggS
         t5lXAjhndA/hDaMXniyn4SwASZKHOneyTrP5glYXXjH6NzlrX+233SmG6i4ysjDMHvDN
         1ZUHJ40TniATqdhf3RMKkNGe0250EE0XXoV44bC5Mv2JbL5eKGmtw3Tgen7a7QBK5vr6
         6jDA==
X-Gm-Message-State: AOAM530V0pTO1VQcJLw/XIoHmb7MforatlNyU0OLGR9IE8bdbxTOhvI7
	K8YPZfCvSbV9w/iR6Yt3ytlc2jNhc8Kcgh0r
X-Google-Smtp-Source: ABdhPJyQi1czpk30x+KVydMhPaLmb46tBKZ9a0Olvwo84PKuSWuNM+rj47ANY4geQyJBLPnnxgVY8A==
X-Received: by 2002:a17:907:6e0d:: with SMTP id sd13mr20774298ejc.90.1637777652156;
        Wed, 24 Nov 2021 10:14:12 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id e12sm366012ejs.86.2021.11.24.10.14.11
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 10:14:11 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id a18so5792567wrn.6
        for <regressions@lists.linux.dev>; Wed, 24 Nov 2021 10:14:11 -0800 (PST)
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr20906517wrn.318.1637777651144;
 Wed, 24 Nov 2021 10:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <163774583541.221636.5062449110647587402@leemhuis.info>
In-Reply-To: <163774583541.221636.5062449110647587402@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Nov 2021 10:13:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=wimd-G9+etiTb=_yqxy8H45su-=WXdLBrhi2TJK+gB+Mw@mail.gmail.com>
Message-ID: <CAHk-=wimd-G9+etiTb=_yqxy8H45su-=WXdLBrhi2TJK+gB+Mw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2021-11-24]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Ok, nice to see the new regression tracking bot start to show life.

Greg had one suggestion, I have another - namely about grouping of these things.

I like how you group them by "identified" and "unknown", because
that's certainly very meaningful.

But at the same time it does mean that if I look for "what are current
issues with the development kernel", it ends up being very spread out:

On Wed, Nov 24, 2021 at 1:25 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> ========================================================
> current cycle (v5.15.. aka v5.16-rc), culprit identified
> ========================================================
...
> =========================================================================================
> previous cycle (v5.14..v5.15), culprit identified, with activity in the past three months
> =========================================================================================
...
> ==================================================================================
> older cycles (..v5.14), culprit identified, with activity in the past three months
> ==================================================================================
...
> ====================================================
> current cycle (v5.15.. aka v5.16-rc), unkown culprit
> ====================================================
...

note how there was a lot of other stuff in between those "culprit
idenfified" and "unknown culprit" for the current kernel.

One of the things I really liked about the regression tracking you did
before was that it helped me get a sense for the state of the release,
and so I'd like to see that "current cycle" in one go.

I suspect that Greg may have a slightly similar issue - as a driver
maintainer, he cares about current cycle things (but mainly only when
they affect his subsystems), but with his stable maintainer hat on he
then cares more about the older cycles.

Greg suggested splitting out the issues one by one - to try to have
the right people on the Cc for any _particular_ issue, and while I
think that's not the solution in this case (I very much want to see
the "summary" email), it would be good to perhaps at least organize
that summary email slightly differently.

I suspect this is something we'd need to iterate on as we use this in
our workflow, but that was my initial reaction to this first report.

               Linus
