Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F52BA22
	for <regressions@lists.linux.dev>; Sun, 14 May 2023 20:13:19 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55aa1da9d4aso211433357b3.2
        for <regressions@lists.linux.dev>; Sun, 14 May 2023 13:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684095198; x=1686687198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TPYEQ9TAkX1MnYcsd09aP3FGjE1mv/XKLN4T7USucQ=;
        b=k9z3ua6lszBlvolHZ6gBOrU3sDG+RPeRjr4HEArZ/sN72AgCOKsO3WpuvrjCMGeqrZ
         8EqgF/EUBdu62tdFd6tgjCl9JOWBKofuAxGMu7rsUD3gKCyWv+FlAX8n8qmP0LXz+th6
         p7YJS+6E6pL/lex/uGN4n39mU4pwFbELOfPrBaCR9uyWAoHrkEPAd44GWwws4mgvHRf+
         ZxkoMZ3o806qqUNsgF42a4+v/NaOYKUYPiqfn16IIp9ND+WnR5Gj7zhOp4/Zm0V3qGf0
         f+lrGNi75F8nof+4DM6keT1R1upz6WXzrJ4Rna7auzESp7e1iHA52DoxCh8h1zwYmtCc
         mrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684095198; x=1686687198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TPYEQ9TAkX1MnYcsd09aP3FGjE1mv/XKLN4T7USucQ=;
        b=OhC9kEV297k/EoZAyyLpBUMQ9CXfp/8Cr4jTjvm4l72g4a31EC0IeRQGMwyS/O8f0x
         IfT2EPVNI4EWF/pEX7Jix2Mt334YUdYFAI7ZWfYuhaQ/EFz++ZkNixZDqR4OrQ/Hwe87
         FMxIf2534SM534lCNfBgq0uTfn8LSTkOe4HbhWuDJKSBY6WKglHDtB8ED+YNfwaOeUQB
         5WtKVy8RWFMtDlv5jb95RBiaiUdhe46gh57EMPphP58gSOOuLu6fkDqYstZJomJ7Voex
         ufpVR0a4FoiY618QK+qRx6eQAdKsjxVQO5NW7bo0cPLHRF1qSFcbkbtEpWmFWbfAjgku
         WnKA==
X-Gm-Message-State: AC+VfDxIf1fFKgAGozbdw/rwmKVAEOoOZ8inE4Hfw7jZskTMSZLHi608
	H/xc5ze7O4FgkSzgjz3kf3un06Z9+fbNgINbJbgpLfbPvARNY9ycwlI=
X-Google-Smtp-Source: ACHHUZ5OIXN0WGeumgNJlpZvuq7DaUAHQQb/qGe1Q0egbYlWIeRSBCxsotbVWXEzEgRSCH+TSk9MU5GzlRvEU90CSmU=
X-Received: by 2002:a81:a055:0:b0:55c:9348:2b71 with SMTP id
 x82-20020a81a055000000b0055c93482b71mr28597778ywg.16.1684095198175; Sun, 14
 May 2023 13:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZFs6DNgzBHNarr6D@euler> <f2176adc-cc2f-4752-2c7e-102b73b55696@leemhuis.info>
In-Reply-To: <f2176adc-cc2f-4752-2c7e-102b73b55696@leemhuis.info>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 14 May 2023 22:13:06 +0200
Message-ID: <CACRpkdbQBTaoU6FNc12t49V=4zHLMbjmGoOZ70a=YC4shqwLgw@mail.gmail.com>
Subject: Re: Kernel 6.4-rc1 ARM boot fails
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Colin Foster <colin.foster@in-advantage.com>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 3:15=E2=80=AFPM Linux regression tracking #adding
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:

> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already?

It was fixed already.

> You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
>
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (the parent of this mail). See page linked in footer for
> details.

Syzbot also ran into this regression:
https://lore.kernel.org/all/000000000000da2a8505fb71d81b@google.com/

Anything using FP instructions in userspace init will crash like that,
I happened to use softfloat in all my userspaces and didn't face it.

Yours,
Linus Walleij
