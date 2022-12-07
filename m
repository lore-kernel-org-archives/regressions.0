Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6968F46
	for <regressions@lists.linux.dev>; Wed,  7 Dec 2022 22:27:22 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id o189so7035696iof.0
        for <regressions@lists.linux.dev>; Wed, 07 Dec 2022 14:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6iNgn6tk9NKSC6em5LUaxYi23kEXMA8wWQ/A+TIsuM=;
        b=JEYuxx4faUl/mXyDiboBJCytx8+6HH34bwhg/QEt15x0+Aqvlc2quizZtvo1O+TG0U
         KeoWvMleX8NKbtVqLjvtjbTFO2JNDVeBek5gNOraQxvIPz3E1uUS6RJ5dX1WvKKIOZ7y
         euM8sS4zGNvWmQqKL9JZuqz4KBNcrBkX3J5FNGpjIgjikkoMWYaesIucw/p1VTA3BS2f
         mQIawjLRxymROxbiDQZ0m1qe8QmmvXbd1NGtzpqlS60eQrDZza9dP624DWJw8R4CHA8F
         jibStbQ1pbkkwY7pjwCvSefP3IqDnqrTrIuHScgNi6QZO7ZJOHu6rWRmqtUFcpP4Kc6c
         lpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6iNgn6tk9NKSC6em5LUaxYi23kEXMA8wWQ/A+TIsuM=;
        b=0GDviUU/4XUrXv2Fn9OSbD1yyArGWM9fWXBEWWgkLQqhRcjg7BpwbSF8IOi+GACCx9
         YgOTRXsCvtkUf1DGxFOzbGteXl/Tvhip4UDsgqSU2CINbnz2LlSYNQRscmWsNBHwUEnR
         X+lfAzTEISzE++gCUy4aWLgnRfn5ymX5H4RYZw9ipX2aCTT1VWVrYvElhz4E59diIkJ2
         9WixiCr+cJb9csCXixlxCMBQR0n5ghGHA4siDy04aqH5NIRMlbeYtWfCfxEMC9fA4O80
         WzjWwxrqyj6boAXAuNTK+mDgDWc5KEtjF0/nsJqytrqnlUU/hSV1AadI7k/qa1wbsfcB
         iDPQ==
X-Gm-Message-State: ANoB5pnLR/b9rOwGW+XBQQ39I6Z5vcqQPUDdEGOz/bvgEvkv8LvUQLlR
	brpNCdrASdlLB6pBG2yl+CTUim/2dreBjXMQfh4nlA==
X-Google-Smtp-Source: AA0mqf7UVEuSnzHfpH6eTqiF1bDc1jJ7UGXfh44X72St/ctRV8R8g3GUravzdm1Vk6ByeE8L+nuAJb2bo7Rt6v0a3as=
X-Received: by 2002:a02:b395:0:b0:389:922b:cab4 with SMTP id
 p21-20020a02b395000000b00389922bcab4mr28941784jan.137.1670452041873; Wed, 07
 Dec 2022 14:27:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_UU+oVUbd8Mzt8FkXscenX2kikRSCZ7DPXif9i5erNg@mail.gmail.com>
 <b7d8193c-7e15-f5cd-08d4-8ef788d9bb36@kernel.dk>
In-Reply-To: <b7d8193c-7e15-f5cd-08d4-8ef788d9bb36@kernel.dk>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Wed, 7 Dec 2022 23:27:11 +0100
Message-ID: <CADYN=9LaiBU-Q5=FSvFKTi_qzE1C45DkdUAfbaZH7FZhn2tbYw@mail.gmail.com>
Subject: Re: next: LTP: syscalls: epoll_clt() if fd is an invalid fd expected
 EBADF: EINVAL (22)
To: Jens Axboe <axboe@kernel.dk>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, LTP List <ltp@lists.linux.it>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, chrubis <chrubis@suse.cz>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Dec 2022 at 17:22, Jens Axboe <axboe@kernel.dk> wrote:
>
> On 12/7/22 8:58?AM, Naresh Kamboju wrote:
> > LTP syscalls epoll_ctl02 is failing on Linux next master.
> > The reported problem is always reproducible and starts from next-20221205.
> >
> > GOOD tag: next-20221202
> > BAD tag: next-20221205
> >
> > tst_test.c:1524: TINFO: Timeout per run is 0h 05m 00s
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if epfd is an invalid fd : EBADF (9)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd does not support epoll : EPERM (1)
> > epoll_ctl02.c:87: TFAIL: epoll_clt(...) if fd is an invalid fd
> > expected EBADF: EINVAL (22)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if op is not supported : EINVAL (22)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is the same as epfd : EINVAL (22)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if events is NULL : EFAULT (14)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
> > EPOLL_CTL_DEL : ENOENT (2)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
> > EPOLL_CTL_MOD : ENOENT (2)
> > epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is already registered
> > with EPOLL_CTL_ADD : EEXIST (17)
>
> This should fix it:
>
>
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index ec7ffce8265a..de9c551e1993 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -2195,6 +2195,7 @@ int do_epoll_ctl(int epfd, int op, int fd, struct epoll_event *epds,
>         }
>
>         /* Get the "struct file *" for the target file */
> +       error = -EBADF;
>         tf = fdget(fd);
>         if (!tf.file)
>                 goto error_fput;

Yes this patch fixed the issue [1].

Cheers,
Anders
[1] https://lkft.validation.linaro.org/scheduler/job/5931365#L1371
