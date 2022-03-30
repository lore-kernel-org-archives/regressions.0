Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1EB63C
	for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 13:55:02 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id g9so34462583ybf.1
        for <regressions@lists.linux.dev>; Wed, 30 Mar 2022 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q91+udaPfkikoXVsmrkPYxbQ6mQZheByBkLR51EBLso=;
        b=QlKoswTnuWcy0GKiy459UIMZAEil7yMBJAPk3UUCoOZZ3ynW5YzHrKnf0PsG9TiWqj
         zg2BGpmbZxbEorRIE3OGkmJWmkxrm4XX9TX2G3pL2tavv8gYQTDLlIGaAiaP/FlXMkyJ
         7lzBIQYBJy8Id/lRNy4lIEW3RinLniERxKfM2lWEwh5F1bXTZweVL8+HepwydIIaKLIf
         Xu6THxqoocaydEKFo7sp8soJPmIo3s7objjk8Uko6JMY/62lPjizNu+kJhUloAGD+ZHK
         aqTM0FKPvZj3mHDnN0/qmN0PsRRbM05GtcmAe74nSVzsoimN0EYNUIhstvkdEzGCAPQa
         7ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q91+udaPfkikoXVsmrkPYxbQ6mQZheByBkLR51EBLso=;
        b=wZ1xaUo+O6Gi3AmqeXp0HcXJGD6k3ItfyxcjFo2Oaj211u0oHcaaYGFUBHBf5Z0HCX
         ai1rkshtIe6/7ieOoD3Z/rHESKCaLsdwLrWVs4gDcYYnFnAvIkphlNZtCTnDDhyAFdJv
         FZOy5kwnKhTK/RVStAHZTrYY0BPUa01VRtS12qOrWyYQksdeaWkjGBCJNh1a38K5MfWG
         cYdRw9FbaOH72ygtMEjTKCZ5hV17ANAN3smoP1yxgz8LX9xVbuCst8DGIONAUDTOw1D1
         1cjF3OkmoPz7NAVAHaZ+Im2aKtibmANTFabUXRVRcuV484ADgmIfhPZDrgljNxwdJEPP
         vBog==
X-Gm-Message-State: AOAM5330KEQ3Z9XF7A5VcxuOHrt+BVaw2Otb6Kipf7KdC3XJe2tcgHuc
	m3wb38wEpmXyyxvnfoUs67pS9bxkwymnKIuh2rESJw==
X-Google-Smtp-Source: ABdhPJyqnWcakti9oK8dCIkF3XFE6/D1gUZjFvowPmRBx0Zr0pP1x4y+gBIXnWZwlirsMlRE1F4tkx0flJ8w9wn072g=
X-Received: by 2002:a25:a0c5:0:b0:633:63da:5ead with SMTP id
 i5-20020a25a0c5000000b0063363da5eadmr33457010ybm.412.1648648501392; Wed, 30
 Mar 2022 06:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtk6rpp=0WG9LyfQRCsMbbvf=P7uhMuon4RzZz3UjYVYQ@mail.gmail.com>
 <YkQOoQRUKemBEn02@kroah.com> <CA+G9fYuK2GDqWHuW3oOi2O0h4RWsLLQb9198i-PS=nMf1t0T7w@mail.gmail.com>
 <YkQT0ROhctplAuds@kroah.com>
In-Reply-To: <YkQT0ROhctplAuds@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 30 Mar 2022 19:24:50 +0530
Message-ID: <CA+G9fYv9uNrUTv2TQfV6yW98qQBxhJ9Fg6UwHLJKYbPHEGHFtA@mail.gmail.com>
Subject: Re: mainline: qemu_arm64 boot failed - Failed to start Hostname
 Service - Stopped Serial Getty on ttyAMA0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Vincent Whitchurch <vincent.whitchurch@axis.com>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Mar 2022 at 13:54, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> > > That's a lot of userspace logs, any kernel logs showing that anything
> > > failed?
> >
> > I do not see kernel logs failures here.
>
> Great, then the kernel is working just fine!  :)
>
> Seriously, without some sort of hint, it's going to be impossible for us
> to know what to do here...

Ander is bisecting this problem.

OTOH, I am looking into test history and found the head commit is booting pass.
The problem report I have sent is a head-1 test report.

This means that, current Linus master boot pass.

Do you see any relation of top fix commit vs the report I sent.

BAD: 965181d7ef7e (head -1 )
GOOD: d888c83fcec75194a8 ( head)

git log 965181d7ef7e..d888c83fcec75194a8

commit d888c83fcec75194a8a48ccd283953bdba7b2550 (HEAD -> linux-master,
linux/master)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Mar 29 23:29:18 2022 -0700

    fs: fix fd table size alignment properly

    Jason Donenfeld reports that my commit 1c24a186398f ("fs: fd tables have
    to be multiples of BITS_PER_LONG") doesn't work, and the reason is an
    embarrassing brown-paper-bag bug.

    Yes, we want to align the number of fds to BITS_PER_LONG, and yes, the
    reason they might not be aligned is because the incoming 'max_fd'
    argument might not be aligned.

    But aligining the argument - while simple - will cause a "infinitely
    big" maxfd (eg NR_OPEN_MAX) to just overflow to zero.  Which most
    definitely isn't what we want either.

    The obvious fix was always just to do the alignment last, but I had
    moved it earlier just to make the patch smaller and the code look
    simpler.  Duh.  It certainly made _me_ look simple.

    Fixes: 1c24a186398f ("fs: fd tables have to be multiples of BITS_PER_LONG")
    Reported-and-tested-by: Jason A. Donenfeld <Jason@zx2c4.com>
    Cc: Fedor Pchelkin <aissur0002@gmail.com>
    Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>
    Cc: Christian Brauner <brauner@kernel.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

- Naresh
