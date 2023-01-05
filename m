Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC87107A3
	for <regressions@lists.linux.dev>; Thu,  5 Jan 2023 21:59:06 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h21so31221934qta.12
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 13:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j0w58Jmxv23GOP82cSaTaJVOpSQ/WlFhaNSuDNLLtbw=;
        b=ZWrnuV/+oK0I3Jv9lK5gtYSMcmV/0S825Fft8v4+B9jE01S0vbNlAglhlXm1JBzOnt
         hA789qQ/CxOJyLAVaAiljJ8LwxY9uzFDesBGbhGuh64/4VlEraovgbmSdg4YkcLxbAsy
         KmBIDGAcYFHhTBTNHQpsOXZR/a/BtttWpNy4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0w58Jmxv23GOP82cSaTaJVOpSQ/WlFhaNSuDNLLtbw=;
        b=kTuotRtql/AeRDCMXB5OeWePY3DIG15KmNBV22dYIfh9+WYj3Pw9CbNYmKNCJ/jWVs
         ktIIjk4MwNc+8H8FFp6eaJPsvXWtv2lDZf0kKqNU6JiA+VtZ9K0eUyQlz1JXBcWrZf8s
         AkltItW3GVr7td/8JMIGhHYhDiqxvUQF5Tg5Jb2YSVdeSD92qs5NHVhntsj+NSmCAEJl
         LFdJ9eXh8MwvW+/NS5G5a4PtdH9rAai31kTxw1iPWbdLKbuBOhBYAiCaKCAae1ToPCHi
         Duw1Di+QW4yBfPh+gAp8P1+/bExCCL7D0QtDpcOwQVNGBxb4sEaF80kgXvNgD2EvU8YP
         pu7g==
X-Gm-Message-State: AFqh2kpCLx5+IrjU8GdP9NmladgbfhbTVmFvs+G8iBRcq43iZkg7YYn4
	nRhaDVsG0MSUK+IdSVs9TTcBRfJC8nOslFx1
X-Google-Smtp-Source: AMrXdXtqqTkBAiTbWvHRIYhcGTm2D2IvjW62Jos0WU1jlnrjVu5rjJ09JGoyWrImHlN/YyIOnt4lvw==
X-Received: by 2002:ac8:75c8:0:b0:3a9:75b9:4b7b with SMTP id z8-20020ac875c8000000b003a975b94b7bmr80991552qtq.39.1672955945011;
        Thu, 05 Jan 2023 13:59:05 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id i10-20020a05620a248a00b006ee8874f5fasm26169870qkn.53.2023.01.05.13.59.04
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 13:59:04 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id k3so18553894qki.13
        for <regressions@lists.linux.dev>; Thu, 05 Jan 2023 13:59:04 -0800 (PST)
X-Received: by 2002:a37:a93:0:b0:6ff:812e:a82f with SMTP id
 141-20020a370a93000000b006ff812ea82fmr2294712qkk.336.1672955943954; Thu, 05
 Jan 2023 13:59:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <370a2808-a19b-b512-4cd3-72dc69dfe8b0@suse.cz> <20230105144742.3219571-1-Jason@zx2c4.com>
In-Reply-To: <20230105144742.3219571-1-Jason@zx2c4.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Jan 2023 13:58:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whxaSHcHeo10JGz3EMJZBfC1LarcrerLos7uHbE1URhtQ@mail.gmail.com>
Message-ID: <CAHk-=whxaSHcHeo10JGz3EMJZBfC1LarcrerLos7uHbE1URhtQ@mail.gmail.com>
Subject: Re: [PATCH] tpm: Disable hwrng for TPM 1 if PM_SLEEP is enabled
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 6:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> TPM 1's support for its hardware RNG is broken across system suspends,
> due to races or locking issues or something else that haven't been
> diagnosed or fixed yet. These issues prevent the system from actually
> suspending. So disable the driver in this case. Later, when this is
> fixed properly, we can remove this.

How about just keeping it enabled, but not making it a fatal error if
the TPM saving doesn't work? IOW, just print the warning, and then
"return 0" from the suspend function.

I doubt anybody cares, but your patch disables that TPM device just
because PM is *enabled*. That's basically "all the time".

Imagine being on a desktop with a distro kernel that enables suspend -
because that kernel obviously is expected to work on laptops too.
You're never actually going to suspend things on that machine, but
maybe you still want to register it as a source of hw random data?

          Linus
