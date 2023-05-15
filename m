Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEECE19E55
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 23:03:07 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-50bc394919cso19680157a12.2
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 16:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684191786; x=1686783786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10cFuMF+WVG9ce0NQecfKwGM15VTiPed2+yziwbzR84=;
        b=XKyGHsIRaldhP1Il44c+NIFHK309YYSFhNN8+pFIRvcFznupS20ovbijxQcb6RJ2Z4
         y9LIO7cvbIj7O7dwKndOpNJXsrWKt13nU0HHJDpfs4v7HVtILUqaUSev5XHoqvWWmAG/
         JI4YOEYvo8Gkh4yazY2K0rGYGS9HCsZFuarzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684191786; x=1686783786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10cFuMF+WVG9ce0NQecfKwGM15VTiPed2+yziwbzR84=;
        b=UCwiKciWsPAlRMksf6rgPPG7ZwvM7rS3Y0lsUp0DNY8/m4PcOGtQq53dscFmSiIqXW
         f1HG1iAQpd2XcN5jqbXNWxpCP75+8sHq67Ne4Br/MME+lCXs77d5wXmwCegcHdlGfBJK
         qXB5Xp85vqFPIevyZDgmj6iJO6pmGfoYAo85sD29ufRKvG3/71vPg9zR6sMaGFUinXVq
         qIPxQC1QZqqviLK6ajZ5IXvkffmASmOkdwaV1pO2JRbmCce6nzHeO3VJgRx3pxYnZXCn
         is7f8hEoE7RgvcwFaXj7HwSj3XNKe9Gt2KnotEYHjq7etm6deYv4wQ9S/+6ITdDf4sz6
         Qqpw==
X-Gm-Message-State: AC+VfDzpZBdUqVVV2kscMbQb2WUq4cNAKhe6S51YCcQT1UZVY9PMDnJX
	aXAFfWRhpD/CZQjr1pV7C/GpA0BcsRZ7F3lxYsYYqUCP
X-Google-Smtp-Source: ACHHUZ6NMKs2UrcMSpkbDs7vLaOgCMY9HCjC+XjvryGFuFZtaUnVDN9TK5vXqEnrHOQX8m+lbR2Rdw==
X-Received: by 2002:a17:906:58d2:b0:956:fdb6:bc77 with SMTP id e18-20020a17090658d200b00956fdb6bc77mr37794183ejs.30.1684191785672;
        Mon, 15 May 2023 16:03:05 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id p15-20020a17090653cf00b0094ebc041e20sm9984589ejo.46.2023.05.15.16.03.05
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 16:03:05 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f4271185daso90067615e9.2
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 16:03:05 -0700 (PDT)
X-Received: by 2002:a17:907:6d8e:b0:966:5c04:2c61 with SMTP id
 sb14-20020a1709076d8e00b009665c042c61mr26963047ejc.8.1684191305862; Mon, 15
 May 2023 15:55:05 -0700 (PDT)
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
 <122b597e-a5fa-daf7-27bb-6f04fa98d496@oracle.com>
In-Reply-To: <122b597e-a5fa-daf7-27bb-6f04fa98d496@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 May 2023 15:54:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgTpRDwS+F0Gd6+bM+TEh+x4Aiz8EBDTnTm3Q4TFdWOww@mail.gmail.com>
Message-ID: <CAHk-=wgTpRDwS+F0Gd6+bM+TEh+x4Aiz8EBDTnTm3Q4TFdWOww@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
To: Mike Christie <michael.christie@oracle.com>, Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>, nicolas.dichtel@6wind.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, hch@infradead.org, stefanha@redhat.com, 
	jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com, 
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 3:23=E2=80=AFPM Mike Christie
<michael.christie@oracle.com> wrote:
>
> The vhost layer really doesn't want any signals and wants to work like kt=
hreads
> for that case. To make it really simple can we do something like this whe=
re it
> separates user and io worker behavior where the major diff is how they ha=
ndle
> signals and exit. I also included a fix for the freeze case:

I don't love the SIGKILL special case, but I also don't find this
deeply offensive. So if this is what it takes, I'm ok with it.

I wonder if we could make that special case simply check for "is
SIGKILL blocked" instead? No normal case will cause that, and it means
that a PF_USER_WORKER thread could decide per-thread what it wants to
do wrt SIGKILL.

Christian? And I guess we should Cc: Oleg too, since the signal parts
are an area he's familiar with and has worked on.. Eric Biederman has
already been on the list and has also been involved

Oleg: see

  https://lore.kernel.org/lkml/122b597e-a5fa-daf7-27bb-6f04fa98d496@oracle.=
com/

for the context here.

              Linus
