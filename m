Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24108168
	for <regressions@lists.linux.dev>; Fri,  2 Jul 2021 18:50:03 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id q16so19804503lfr.4
        for <regressions@lists.linux.dev>; Fri, 02 Jul 2021 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=71nuSMvaqgHrgpwAtP1N6KiE3ICrLSTcXVzeIPBvQ4o=;
        b=M7diCQUwMpzKQ1GXJoVPs9ZHH6w/FGKZMDIDOCrHx9bDTbOzzu8tbcnHNGtiUjvfRe
         7nD4xqc8ZKvmjMItQppsaUWB7+CxM4/HXNOlQPoFXIptkAOTbwmoM8RuNSbTOSK9Qk6c
         MNnPD0+78LLKPaN9r+5vwqH2uhsVbhc4Az2RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=71nuSMvaqgHrgpwAtP1N6KiE3ICrLSTcXVzeIPBvQ4o=;
        b=FXMFUnSBIVFvckPblul0BXpSOLy3jQ0ys1o4qUsNruuoqbhEB4CG6Oart884IYO3rI
         cJEgbxtJjKrxeAESpzUDhcxEiT0DuZ1MWhDlTFwrOGnMk6Y+qcOCU4nAGKUhUEbFhU/4
         kxYtEFqgpz+uY7pfRjL9pX+3gSQ80q+Y2ZVwaPT/Q/dfHpctbOnfKaS/lfNbjrSHzrQF
         Xe9DKq9oRjxAzvraCeSZAO+Lgs1nuxpcAlqqrf17T0ucQDd4BYiLqvLq4gl1wh00x6q+
         Cu2Zj5PHOSQ60vApStG97op9Jhp7HphM8Phtg1T+tZWj4CKyijMklSvdTvY2UQWnJFag
         VAZQ==
X-Gm-Message-State: AOAM530b7rO7v8Jxmtd7KMqzNJcf8aCD0W7IL1FuXvkUDDTotFCSAbS9
	Uw5HK5T3oNcwuivbNOMk9DP3VPMXggJI9dEd
X-Google-Smtp-Source: ABdhPJzR1Sl6n7046iE1/IKzzMEGfRtJNAglHFs7Zx/Ugu/g9OYSeIrn0CMWrsidH4yAhURh7gwDwA==
X-Received: by 2002:a05:6512:90a:: with SMTP id e10mr785041lft.70.1625251800930;
        Fri, 02 Jul 2021 11:50:00 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id w21sm372616lfu.80.2021.07.02.11.49.59
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 11:50:00 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id k10so19690139lfv.13
        for <regressions@lists.linux.dev>; Fri, 02 Jul 2021 11:49:59 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr716901lfa.421.1625251799639;
 Fri, 02 Jul 2021 11:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuBvh-H8Vqp58j-coXUD8p1A6h2it_aZdRiYcN2soGNdg@mail.gmail.com>
In-Reply-To: <CA+G9fYuBvh-H8Vqp58j-coXUD8p1A6h2it_aZdRiYcN2soGNdg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Jul 2021 11:49:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJJtZ9TD_zDefSnaLzLAcjVKXPJoK2o=K-QWkhLGxyuQ@mail.gmail.com>
Message-ID: <CAHk-=wgJJtZ9TD_zDefSnaLzLAcjVKXPJoK2o=K-QWkhLGxyuQ@mail.gmail.com>
Subject: Re: [mainline] [arm64] Internal error: Oops - percpu_counter_add_batch
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ext4 <linux-ext4@vger.kernel.org>, 
	Ritesh Harjani <riteshh@linux.ibm.com>, Harshad Shirwadkar <harshadshirwadkar@gmail.com>, 
	Theodore Tso <tytso@mit.edu>, lkft-triage@lists.linaro.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Jens Axboe <axboe@kernel.dk>, 
	Zhang Yi <yi.zhang@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 2, 2021 at 1:24 AM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The git log short summary between good and bad.

Ity would have been really good to have a full bisect.

But from another report:

    https://lore.kernel.org/lkml/87ade24e-08f2-5fb1-7616-e6032af399a3@nvidia.com/

 it seems to be commit 4ba3fcdde7e3 ("jbd2,ext4: add a shrinker to
release checkpointed buffers"):

Ted, when there is a fix for this, it would be interesting to see what
made this all work fine on x86-64 but fail elsewhere...

         Linus
