Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB36ABD
	for <regressions@lists.linux.dev>; Sun, 27 Nov 2022 20:30:59 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id i9so5990639qkl.5
        for <regressions@lists.linux.dev>; Sun, 27 Nov 2022 12:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VVVV5Ph5SK/OS62unjAwI3Y7rdzzZ2t2R4gZShlA4OM=;
        b=WeQaiAyw9KILxh5RJhge3ru/9yApAWiKaCjRKqKhLfZkEBpQhxjQRnFbRZoP0GaLSj
         NRnRlEzBbL4gnwtWe6Oofbt+x1QUokHkiFiRTve97LK1L9uUu6oWXRU1zC61E7FGZKB/
         a24NLF/BmVlln5+LSHa2jKgFhf9MgoW+ibel8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVVV5Ph5SK/OS62unjAwI3Y7rdzzZ2t2R4gZShlA4OM=;
        b=s//ym4oQnPbYuYlJxJGlQKmSv64blXWL3tIB8lpUxW8iGxNwrwifckmvMY9rNaezGF
         gS8CRM7bZeDS6a2ad2kjzO9FBbGmjuwMUwvRqn+sZibUmO5G526SMEJGvSLJJ7rTW/xX
         pI4E1l9sXH+Bv4BeTB54Kr4Mel7DOrwJF6jP3cx8uG6cCOyqLpdSH0J+A9mYe6Rz0MaI
         //AZtVySH3EEB5xlkQzSp65U/pq/guwvrd3IkQUPIjKDfar9iXu1gYvtBM2uraHCCoFM
         E2QScFjwRL+6GtJg33LuQsfS5iQ7Htc62I8lw2YQoxmENXnIa4C6KPPvg7sJYphV0PCA
         XX0Q==
X-Gm-Message-State: ANoB5pmOZBnGTvf/ag6Z6W4AFNVbiSt827eLuP54QqBU+C1mvzDQpJmg
	X86PaSD4NVMdFNy4JFWjKZboKjrp7R1Ikg==
X-Google-Smtp-Source: AA0mqf6FVs1zyNQkFBzHG6lV09sh4qqjl4B7JMO7JGKNqk234fIttWgUc5rqY29y7bkBuz8ld84Ckw==
X-Received: by 2002:a05:620a:21cf:b0:6fa:1745:cb2c with SMTP id h15-20020a05620a21cf00b006fa1745cb2cmr42866003qka.119.1669581057931;
        Sun, 27 Nov 2022 12:30:57 -0800 (PST)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id g10-20020a05620a40ca00b006faf76e7c9asm7046193qko.115.2022.11.27.12.30.57
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 12:30:57 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id fz10so5552368qtb.3
        for <regressions@lists.linux.dev>; Sun, 27 Nov 2022 12:30:57 -0800 (PST)
X-Received: by 2002:ac8:518b:0:b0:3a5:49fa:3983 with SMTP id
 c11-20020ac8518b000000b003a549fa3983mr44383440qtn.436.1669581056930; Sun, 27
 Nov 2022 12:30:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <166956961686.104691.2021186998003391429@leemhuis.info>
In-Reply-To: <166956961686.104691.2021186998003391429@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Nov 2022 12:30:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgDryP6ezpPJADG+g0KvLcbO4Q-y2d64wgifKBc+mB9gQ@mail.gmail.com>
Message-ID: <CAHk-=wgDryP6ezpPJADG+g0KvLcbO4Q-y2d64wgifKBc+mB9gQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-11-27]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 27, 2022 at 9:32 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi Linus! Below is a slightly edited report from regzbot listing all
> regression from this cycle that the bot and I are currently aware of.

Thanks. This looks fairly reasonable (assuming I get that networking
fix next week - the others are in the "won't delay a release" category
as far as I'm concerned).

But it looks like I'll be doing not just an rc7 but an rc8 regardless
of the current regression state just because I still see too much
noise.

              Linus
