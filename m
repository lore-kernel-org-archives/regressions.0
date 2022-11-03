Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06F37E2
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 05:32:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id sc25so2344651ejc.12
        for <regressions@lists.linux.dev>; Wed, 02 Nov 2022 22:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QxHwdNSRZxWkDQkg6uvUY0ujmFP08SAArZlQSADznoA=;
        b=LICjpEJhenrB9iXeBKaktSOAa9LKw7Bcuk88goXAS2rIZYjDAJtvETrJ+FoanrXgAB
         jDMd0lxbkdvDlDDFVGZIB1I+kzciAEHFftg7imFWmgora0eGPF77S8AemRQC0RMwgtvY
         cC6pjvWylf9ocrry8Y7XIbMF2YHC2KD/L+PqX0FOppLS2bIIxDaL8+jQXn9Wr3zMqIZE
         QD5p1/QV9VngYIimvpKq2ATIUALXnkJXkxlO/EmkubHSoM+rVx3OnaYtqfWijnYqEo2M
         EPBoZPXWKeZ7VzLMTw0PhNR8G7khEbavKWyPu/Lcz7IfVs3V2k2NvOGfPQWfZscdAsec
         Jqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxHwdNSRZxWkDQkg6uvUY0ujmFP08SAArZlQSADznoA=;
        b=RVgtxKKmkvsz3fopbuRre+T+fBJkRVoIy4dmBz5UtZEHYR5Fun5IkzxpHs5BBsCVKW
         6ltRuxRLVEevbVfusoR2D8h2XZz7rUbvJY8rYnQqKiYFuuQO34pOC/PsKOtXISSY5TOb
         VcFXgcgUhHmK8faLQoHkz6Y4jkw63oQKkMyq33hikyZ0VnU9UrJQnYmvv56Sg9jdDcHV
         YibeaGbbTsMXavFzMWT+gbsshaKHf0+LDw/Gp7fOm2DO5pOVGXk+193yaFa5auQ06m6m
         HYPsvh75A8vX1BY4Tj8y5n+lxfB6gvlydoc03WRf8Avz8US1Nwx+lMWxIkeOjb2DT1mQ
         WpTw==
X-Gm-Message-State: ACrzQf028K9H2cst4FZwzag7utlm8bmBPPwtbmz321KT5pjeU4nklpm4
	kVbbpcRod3ehvKW+jZRfuLKBlIDkAOMyiwU4Mau5WA==
X-Google-Smtp-Source: AMsMyM4NmLQqfXH0oBGob4NJPJ7/M23favSgwhq8c2XXT62hem2CFukSGO7O+5fEi9nnXj/gzUeTvplpU4Ba/D10EcQ=
X-Received: by 2002:a17:907:7b93:b0:770:1d4f:4de9 with SMTP id
 ne19-20020a1709077b9300b007701d4f4de9mr27740534ejc.201.1667453577739; Wed, 02
 Nov 2022 22:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsGFoC5TciCuijZXLx48TZnoTSkq=iUgb+vFdi9EYTucw@mail.gmail.com>
 <Y2LgMYsgj8c7Aj1U@kroah.com>
In-Reply-To: <Y2LgMYsgj8c7Aj1U@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Nov 2022 11:02:46 +0530
Message-ID: <CA+G9fYunBonRypu0QruuH23H0chET=sZH7FfbK8nGabkCFd9sg@mail.gmail.com>
Subject: Re: qemu-i386: perf: BUG: kernel NULL pointer dereference, address: 00000148
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-perf-users@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Marco Elver <elver@google.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Nov 2022 at 02:54, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 02, 2022 at 06:42:52PM +0530, Naresh Kamboju wrote:
> > Following kernel BUG: noticed on qemu-i386 while running perf test suite
> > on stable-rc 6.0.7-rc1 the image was built with gcc-11.
> >
> > The System did not recover after the crash.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> What is this a regression from?  Does this happen on older stable
> kernels?  Linus's tree?

This looks like an intermittent problem.
I have tested multiple times and found that it is an intermittent crash
with qemu-i386 while running stable-rc 6.x. That is the one of the reasons
for not including the stable list and not reporting this as a regression.

> How about 'git bisect'?

Since it is an intermittent crash it is hard to bisect.

- Naresh
