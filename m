Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22903FC7
	for <regressions@lists.linux.dev>; Sun, 14 May 2023 16:25:15 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so20854829a12.3
        for <regressions@lists.linux.dev>; Sun, 14 May 2023 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684081514; x=1686673514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/4krLSql0Gjrdp6JrkRiPc1flJKbcl3pisqpCHUUFk=;
        b=eSCC+3txcVCaqY1rjjnIVVTa1W38lCxZeD2RkKBUDykUFYSUCk/lQoTxhnWFqG3+Fi
         EGOI0eSjsFz7TlBskVBq8wBUGlhithYPsfzzOPsMc+Jes2dwcsB21Zp0I0Wh0OZ5g5pU
         cxWAqptRMjQtruI16wtNi9KFMgwZz2yNPwfHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081514; x=1686673514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/4krLSql0Gjrdp6JrkRiPc1flJKbcl3pisqpCHUUFk=;
        b=V09ln3Fnq64hIoPrX6aqAwaioPikxfKdrINhk4CF/X5buBV97wuts+NjinXn/5rXQn
         /0oawB0o/VC9DI4wkna33TzQUAGIuM1m+NsutUHZact9+J0ykYFyZxBoFahVHgtUG21N
         JkP0YOVJ5YNn8XyuH/zCD7tRfRvjeoY5micjTianFzXIUFtGq5w42F+l6bj3qpZRfyDd
         kYiZ//kEG4vv79WF68/5izTuFDAJHIJ6RAtDk8CPhmjqnBdATKTg0t1kaaBJ0CJxMqDd
         YFG3yU7NkTIMHXrfg9ykwfgp0Crcu2JFR6UTInxqrnWjlxDX2+qWodNafMtrS9kGAmil
         6SVA==
X-Gm-Message-State: AC+VfDyZtSZT/tsn0qXO6gXVTRokPskTSUuUXrK5hVEaiGzVPTDFXy/g
	uUcZevmeXTTmeeFPWD3G4esMg+y/QJRmRnVBENm4Qg==
X-Google-Smtp-Source: ACHHUZ4EcrEACBJN0yQ25G+A5yIcjmrx0Z1eEvVgQzVPhwu3LNTswjwkD+cUUqrUh05hcbHgtHs7gw==
X-Received: by 2002:a50:ee99:0:b0:506:87cb:149f with SMTP id f25-20020a50ee99000000b0050687cb149fmr23040615edr.39.1684081513846;
        Sun, 14 May 2023 09:25:13 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id g16-20020a056402115000b0050bfc4a9020sm6074758edw.38.2023.05.14.09.25.13
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 09:25:13 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96adcb66f37so288234166b.1
        for <regressions@lists.linux.dev>; Sun, 14 May 2023 09:25:13 -0700 (PDT)
X-Received: by 2002:a17:907:9496:b0:96a:ff7f:692 with SMTP id
 dm22-20020a170907949600b0096aff7f0692mr2228823ejc.68.1684081512884; Sun, 14
 May 2023 09:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <168407416011.74685.9039980276616254723@leemhuis.info>
In-Reply-To: <168407416011.74685.9039980276616254723@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 May 2023 09:24:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjVxkvY0n2ZDv=oMB4WSaz1RxQmL1DxUjwFSbBfNiUFgQ@mail.gmail.com>
Message-ID: <CAHk-=wjVxkvY0n2ZDv=oMB4WSaz1RxQmL1DxUjwFSbBfNiUFgQ@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-05-14]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 7:24=E2=80=AFAM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> What I can't see yet though is a pull request from Russell with a fix
> from Ard[2] (in next as 2b951b0efbaa) for boot issues[3] that apparently
> break a lot of arm32 configs, which among others lead to "tons of
> different boot time errors on the syzbot arm32 qemu instance"[4].

I have that. You may not have seen it because rmk just cc's the ARM SoC lis=
t.

We also have some vhost regressions due to the move to user worker
threads (rather than kthreads), they don't seem to be on your list.
They're being worked on.

               Linus
