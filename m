Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC62C80
	for <regressions@lists.linux.dev>; Sun,  9 Jan 2022 19:20:55 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id u21so22520205edd.5
        for <regressions@lists.linux.dev>; Sun, 09 Jan 2022 11:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VWWFkIhkFDieoIAt51lsGMTCATR8BiITQDIvsBDfn9E=;
        b=Msv53R/QNphspQKxQKHE0fOtUUofGqL2OLP4z/ir4My1RjKQSPb5XfqmCQgWZAC4Gs
         Bwjvt96AZNZfJYq1Vpoa4Eh4cCQc9tZ/7chCsAMlxYWz+SI2bvvFmgG3YqB7M5GEESG8
         uqerig2JIhLuCCxNRaGFnvWTAaUOYLMdgSAKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VWWFkIhkFDieoIAt51lsGMTCATR8BiITQDIvsBDfn9E=;
        b=1XJE99K9dxuB9cXepQiQQM0iHIN/t557rxKXIubEQ3O69GN9dXwi4vxsImHj5sovTF
         mbt8NJBlU7vOUJI78923CTSYoExPYK6f54NPE7XlkAOlEstki0m3uExn5KbSLIe4DY6s
         ewtrhqs3wiKiSc1IKn23jXnd9Ct9/LPo/tb41726UiRbKH4taWva5ksngulq4y3pNXnJ
         5D0Yv2fgy9tM9PdJXT09UJIq0lZE3Z+sg/yOQjnRkHskn41V9cv+hHQNiaqU1L7MEQQ0
         TKpYqG2wNgEsJjnLhCwcOgFuA2uiZTqpgBNoXevGuIuqPUwqffjeTgFzqgqoJf+C+d1b
         VktQ==
X-Gm-Message-State: AOAM531mP3pDwnrpN92CCQDQvQusZKopcRO5BMgpi0nsjyxRuPHIewqy
	U8cMMU/GO/8qpGnMj0kAcUiYD64cvzkouqTuoTA=
X-Google-Smtp-Source: ABdhPJxuCgcKLRv4tzlwS4K7L7LhNIstf0J3yJUjrr44kdY7YKDArIquGWvsVHpKXhpE1w304WaNcQ==
X-Received: by 2002:aa7:d541:: with SMTP id u1mr69572719edr.205.1641756053445;
        Sun, 09 Jan 2022 11:20:53 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id f15sm2437121edq.33.2022.01.09.11.20.52
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jan 2022 11:20:53 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id o203-20020a1ca5d4000000b003477d032384so4449116wme.2
        for <regressions@lists.linux.dev>; Sun, 09 Jan 2022 11:20:52 -0800 (PST)
X-Received: by 2002:a05:600c:4c94:: with SMTP id g20mr2575626wmp.26.1641756052725;
 Sun, 09 Jan 2022 11:20:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <164175418046.1037107.9730034714816887497@leemhuis.info>
In-Reply-To: <164175418046.1037107.9730034714816887497@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Jan 2022 11:20:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi8gSsM7-+fx-iSoKGHtgrgN==NcQtRikYfiFmv8gjbnQ@mail.gmail.com>
Message-ID: <CAHk-=wi8gSsM7-+fx-iSoKGHtgrgN==NcQtRikYfiFmv8gjbnQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-01-09]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 9, 2022 at 10:51 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> 5-10% increase in IO latencies with nohz balance patch

This one is clearly not rootcaused, but even the reporter isn't sure
what triggered it.  It was bisected to that mentioned patch, but even
that bisection result isn't really entirely certain.

So this one will remain pending, I'm afraid.

> pm: laptop totally freezes when going to hibernation
> drm: amdgpu: s0ix suspend stopped working

Something clearly not great in amdgpu suspend/resume land. The reports
are not fully clear, with even the bisection being questionable.

But from the previous cycle reports:

> =========================================================================================
> previous cycle (v5.14..v5.15), culprit identified, with activity in the past three months
> =========================================================================================
>
> drm: amdgpu: NUC8i7HVKVA crashes during system suspend

This one isn't questionable, and Len sent me the revert he's been
using on his system for a long time. So I applied it.

Maybe it's related, maybe it's not.

             Linus
