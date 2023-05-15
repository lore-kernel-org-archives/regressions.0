Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A39FBE7
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 17:23:48 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so113739480a12.1
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 10:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684171427; x=1686763427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fd5dtKhNyHGq8Bf62oHV9wGTTQyA1cr8VVarKwpvWbY=;
        b=e5qRkzpa/8VhhbJMscvnEGPfw9W/cHLNrZpKiq1kf0sBmFTuOrX9Cjdss75ibaWvbt
         bAL5jDYyd6tNCBVwIdUi37T5zTW0UxOTXjR+ICuXYCwlL/KlrZpsDAbpKw+B05YZdYE0
         yc3ak/7suJI3mRtUCZ2YAnAAleqka2hNCWblU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684171427; x=1686763427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fd5dtKhNyHGq8Bf62oHV9wGTTQyA1cr8VVarKwpvWbY=;
        b=eEs6HqckqQBORHtx9KK07EBgGZnBcvjUNxnCbJUqzzOMq4T0JPlA0AY547if+h6LfG
         uouEjujo10kYsRh6nwMWfbe5nfysNRi/RstNc2sGhJisCAjlPh4q2h0tzLW7OgdWj2fK
         nMZM2/wSigkM4nFcU46yqQRA/y6a1JpI4N+KGU5u5B9hj8v2nDMw2d7C9EnVCzPdsGEA
         1F+r8BRkWNOqz8ncwwxbHfxZ9Ax9OaWnLapYV9z6j7ilNEJhnTQGeHOeR9MC7rFmsULp
         ziAkkIlFheIoDaxdyxl/UnRX/Yn6kIxB9gYhHXdyb5CGYsSHwifq3foqqT2nqsgs5dKN
         uSBA==
X-Gm-Message-State: AC+VfDzZ+CAQxBWCf3Nb6AJdpYOXaSeIklr+mks+6dQTEm3zB4ZkrSDd
	FLUx5cgqS/Fd5zorLQrRKvqUs2Z7//hrCCB/K+84buzN
X-Google-Smtp-Source: ACHHUZ7VOEVULuUqfe68BkfgLbLpX10jSlqqCQOZe1mmxuujlfnPXzlZJUIy4zZSRiNrSnr3xnmEdw==
X-Received: by 2002:a17:907:e91:b0:968:892b:1902 with SMTP id ho17-20020a1709070e9100b00968892b1902mr23750496ejc.6.1684171427158;
        Mon, 15 May 2023 10:23:47 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id jy17-20020a170907763100b00969dc13d0b1sm9396345ejc.43.2023.05.15.10.23.46
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 10:23:47 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so113866936a12.0
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 10:23:46 -0700 (PDT)
X-Received: by 2002:a17:907:6e11:b0:96a:2210:7dd8 with SMTP id
 sd17-20020a1709076e1100b0096a22107dd8mr16414147ejc.38.1684171426288; Mon, 15
 May 2023 10:23:46 -0700 (PDT)
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
 <33b84605-1d0c-1b0e-7927-7ffa96b3c308@kernel.dk> <CAHk-=wiDqe+H7UnhD0qLbL8K8hnWUEdsRqcM4QnY=gZ3GytBRQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiDqe+H7UnhD0qLbL8K8hnWUEdsRqcM4QnY=gZ3GytBRQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 May 2023 10:23:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjudDcq+TSaxOVX03iMTAhBDf6fup-tDhDpdQjGnKXgTw@mail.gmail.com>
Message-ID: <CAHk-=wjudDcq+TSaxOVX03iMTAhBDf6fup-tDhDpdQjGnKXgTw@mail.gmail.com>
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

On Mon, May 15, 2023 at 8:54=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Blush. I decided to build-test it, and then forgot to attach it. Here.

Btw, if this tests out good and we end up doing this, I think we
should also just rename that '.ignore_signals' bitfield to
'.block_signals' to actually match what it does.

But that's an entirely cosmetic thing just to clarify things. The
patch would look almost identical, apart from the new name (and the
small additional parts to rename the two existing users that weren't
touched by that patch - the header file and the vhost use-case).

                   Linus
