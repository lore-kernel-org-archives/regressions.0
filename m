Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138819B
	for <regressions@lists.linux.dev>; Sun, 25 Sep 2022 08:42:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id l14so8455793eja.7
        for <regressions@lists.linux.dev>; Sun, 25 Sep 2022 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cJUTL4HFF5c6MSiqmCutUWIA1DXPBObRTJgFy/60YBM=;
        b=gdfFkPoy+sjSzheO281CK+V0J0F4BgcjkxUH6izI9WtHt54gKtFGD7QgkaysgXdJkC
         4auBIYerNe8lJFh9zx5/muqLer5XYM1/ECf05uNTE8yOC/v5z/DJIwsRgubImL/kz/i8
         B0EvknVrWdyZy3PIoAa+KrBbRwdwE9a2nyLFsS8Uxz2MLrNdgI28dj76lURnEDQftPiD
         2aGOzk7BDzThKsW0RnRZkUKnrhF1Pg86t7INqfzArAjlBLMvyiUR44naqq8ooM6kFUQG
         GBL8OyDSh9KT5NoPJch78q76RUHNcvBocR+HgHlGDHFZ1aVVB4chXYOasGhMe5bs36wm
         +wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cJUTL4HFF5c6MSiqmCutUWIA1DXPBObRTJgFy/60YBM=;
        b=Oc/mqdPY4LtAAdgVJMfLmoFYqpZrTmzAlCioOwLT8pMix2gDuk4ps5kvIlfAkfZmF0
         q4OpTn3RzxQn/YTMTWoZQQim10tdN752X7wwSCYinK2I29LCm3PEkX1o6GSwoj5wzPkk
         4ru5tUrYab2WsbrwzYjXvSUa6PqCeRSMoKrswN0w9tTRj4Z+JwrGUmHKDr8xGPqn7TCQ
         dYPqKuLv5SOkVyiSXJsy47hbiXwmIjw1ZX7p26B+JZXKEmBBfHJoabqt9n8EjjzT54hl
         yS2RtRHesBZ+igHQ0cemGAFjbe8CeRMvn6xftCFdSbeXxXQ2wN0X9dduucdAf/yd8uE5
         SiMg==
X-Gm-Message-State: ACrzQf0SyBVWtdyRaOSSsW4+oxXqlyaZO681qFhtT+5aJlFCxzQ1cfr6
	lVJMmOWEIOpQvYXxrinfzv/stRHiCZMCqltXHjSPkg==
X-Google-Smtp-Source: AMsMyM6OSFYOXBsFVMQ90Gb6cn0rRSQK1qfOqXfYNLMwlitCbmsao98abUnUIKfKNY/OUc8jwBDe10fcOBpM0McBlj8=
X-Received: by 2002:a17:906:da86:b0:740:7120:c6e6 with SMTP id
 xh6-20020a170906da8600b007407120c6e6mr13805697ejb.44.1664095360679; Sun, 25
 Sep 2022 01:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtt-921LH=fcVtaOkzfb-sA-0Qht4hrNhmGS5f_S0P+cg@mail.gmail.com>
 <YyytP71y2GosUOhr@fedora>
In-Reply-To: <YyytP71y2GosUOhr@fedora>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 25 Sep 2022 14:12:29 +0530
Message-ID: <CA+G9fYtLwCiJeVO1UeJSU5iTrz9MmX3VWZZVFZxFPeSyGWT98g@mail.gmail.com>
Subject: Re: Unable to handle kernel NULL pointer dereference at virtual
 address 00000010 - PC is at mempool_alloc
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block <linux-block@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Sept 2022 at 00:15, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Sep 21, 2022 at 08:11:42PM +0530, Naresh Kamboju wrote:
> > [Please ignore this email if it is already reported]
> > Following kernel crash noticed on qemu-arm with linked config [1] running the
> > Linux next-20220916 to next-20220921.
>
> Does this mean the test passed with next-20220916 and failed with
> next-20220921?

I mean to say like this,
GOOD: next-20220914
BAD:  next-20220916

- Naresh
