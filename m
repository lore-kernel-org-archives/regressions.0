Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BCC8CE
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 15:57:00 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so113074711a12.0
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684166218; x=1686758218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgkXNey1qqkRYDn0ndFfina8YyIW2oFgV1/nBHyisSM=;
        b=YZo1H9eZpJRkzw5ht2n2lnI1hRUcjISC9pI5y//xBtwqQEYaL9IFZ5UDF+GkRA6rTq
         jUB9koxU41CnKU5sPUihM2QwSCft0TC6k75ZBZ/8m7ELlOzSMbpWkkrh6xu+XgdfLd9w
         34Budb0lZyj8ZKg4thzlIvtH1JM5gyikwO+FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166218; x=1686758218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgkXNey1qqkRYDn0ndFfina8YyIW2oFgV1/nBHyisSM=;
        b=a4+TdJtCVC0C9mdc37nOogGFskc0HhBN0iNmeARpKtoWzTt0MFiY5S+fw/h02F8Ro9
         1lzPY9Hjm6FpDg+0chlUPBUVvt+cXRyLb+aoItVsVwr7yijVMILnFOrV1Wa2rjfmk3GO
         7j/27EeiwefH4nX6mk3Q6fb5/Y2l9RyEdL/UfaTNxtVUQsqqswMRJAqI0h+fvaiTwjKy
         yJ0ZyAh0zrsnRqJcmkf3eTEEN7Q5h5td6hLY6KedTyFUD/uJlE09NewgxU2zpN7Zq9Xu
         hQrQXh8u7yUl0n+MKp/ikhgU1pioQ8n43S4eaabauWwhk2BCkSyd0K1vv1a+OAhGgjIt
         8WmQ==
X-Gm-Message-State: AC+VfDztUds11sk9HfV5c0REl/7wL6wG1wFIgs//yMAopoNcbEG663ji
	6Xgksv4yc8E1mCCF7I8VCJ2JQE+04F7XYrx5p7Md3w==
X-Google-Smtp-Source: ACHHUZ7kclKqO/PzIdeKr11Mk40en3KPfvTT3C6l1bOLw74R4TN1mVEvJz9hB/5gprtp2B5N4TM7bg==
X-Received: by 2002:a17:907:7d88:b0:967:2595:b099 with SMTP id oz8-20020a1709077d8800b009672595b099mr21256377ejc.28.1684166218310;
        Mon, 15 May 2023 08:56:58 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060f9200b00965e1be3002sm9645612ejj.166.2023.05.15.08.56.57
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:56:57 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so112938643a12.1
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:56:57 -0700 (PDT)
X-Received: by 2002:a17:907:97c4:b0:966:4669:7e8d with SMTP id
 js4-20020a17090797c400b0096646697e8dmr27235914ejc.16.1684166217079; Mon, 15
 May 2023 08:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202232517.8695-1-michael.christie@oracle.com>
 <20230202232517.8695-9-michael.christie@oracle.com> <aba6cca4-e66c-768f-375c-b38c8ba5e8a8@6wind.com>
 <CAHk-=wgadfsCnKHLON7op=Qs5t3w3PVz5ZDbvbKsfb=yBg=yjQ@mail.gmail.com>
 <78c5e150-26cf-7724-74ee-4a0b16b944b1@oracle.com> <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
 <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner> <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
 <33b84605-1d0c-1b0e-7927-7ffa96b3c308@kernel.dk>
In-Reply-To: <33b84605-1d0c-1b0e-7927-7ffa96b3c308@kernel.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 May 2023 08:56:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=whmN7cxAgmhDBqiE=c67Q2pp2+SqCknNcj3K+QNKivaSg@mail.gmail.com>
Message-ID: <CAHk-=whmN7cxAgmhDBqiE=c67Q2pp2+SqCknNcj3K+QNKivaSg@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
To: Jens Axboe <axboe@kernel.dk>
Cc: Christian Brauner <brauner@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Mike Christie <michael.christie@oracle.com>, nicolas.dichtel@6wind.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, hch@infradead.org, stefanha@redhat.com, 
	jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com, 
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 8:52=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote:
>
> Only potential downside is that it does make file references more
> expensive for other syscalls, since you now have a shared file table.
> But probably not something to worry about here?

Would the vhost user worker user processes ever be otherwise single-threade=
d?

I'd *assume* that a vhost user is already doing its own threads. But
maybe that's a completely bogus assumption. I don't actually use any
of this, so...

Because you are obviously 100% right that if you're otherwise
single-threaded, then a CLONE_FILES kernel helper thread will cause
the extra cost for file descriptor lookup/free due to all the race
prevention.

                 Linus
