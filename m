Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1AC8CE
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 15:45:12 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so19836469a12.2
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1684165511; x=1686757511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPEGaC+x0TYEuX7HHgeWtz7pyNM4DGEHBqF/DDq7Iw0=;
        b=gImqqK7Ez4ILwctNY0AcR7B6kOcnLZLrABJErDV0yJSdTCJO24RZwul28fa1YXP4J5
         bKoHYDUdz0GrdUt1uvyJRzrL7wHWnEE7CFgoVdIxKph77hkZpY5hXoE8CN2AnKNyhvPE
         1WD55DRKkWgfPnF1cu9nglLrdj/x+IQwngXX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165511; x=1686757511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPEGaC+x0TYEuX7HHgeWtz7pyNM4DGEHBqF/DDq7Iw0=;
        b=jgjAvqWc/5AWLkhH394b4K8L7XuJBjmfwjgu7cs6v51EX2Mr9xxwODpvnK3YpvWN/h
         Av+hX3L8FEBp5Ffa+Jzyjn1njRgkJwDNALFFt6tIyPgKUhfxZ5enTFE4jS9aMv8jUbPO
         n7uf73uJp+ObCGoKz+7KZzfyCoQSG9JUxBnuuhYCetaRYsztbHW+RFhyy65uifx8Wif+
         B1XbNWESmiIh8ygRxTfNO5DOhhWBt/gXnonn8WOQzrjdzdiFfqU6WF/tS24gvXPxoOP9
         ilWdNvjh8vWfqDSkByForVYSYcevweIvJx90afsFX2ekOK/dmd09RLM4SkcFY7GYv1MY
         NmWA==
X-Gm-Message-State: AC+VfDwHn+b5gLJF15YkZu/oNFW9zQ72Ibo+iR6Xa5Hx7/L9wUXpRNSH
	o0A+0+PruXosr7jP9DcZtRYT4TSE6Q1D69ieMDZNPg==
X-Google-Smtp-Source: ACHHUZ7mpZ/KVecAOcbHDfPHr47zJUMyjgmaO5qna5LTVzcYtnH2Zdzm612DJQ0L8SgdxUY8pU9x/w==
X-Received: by 2002:a17:907:7212:b0:966:61b3:f630 with SMTP id dr18-20020a170907721200b0096661b3f630mr25690495ejc.9.1684165511034;
        Mon, 15 May 2023 08:45:11 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709065dac00b009663cf5dc2fsm9771381ejv.66.2023.05.15.08.45.09
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:45:10 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-965d2749e2eso1954984466b.1
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 08:45:09 -0700 (PDT)
X-Received: by 2002:a17:907:70d:b0:94b:d57e:9d4b with SMTP id
 xb13-20020a170907070d00b0094bd57e9d4bmr30521770ejb.2.1684165509441; Mon, 15
 May 2023 08:45:09 -0700 (PDT)
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
 <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com> <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
In-Reply-To: <20230515-vollrausch-liebgeworden-2765f3ca3540@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 May 2023 08:44:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
Message-ID: <CAHk-=wgXJ5VS1iBkfsG=HDjsyhn5XYDKt5xhQcNuz-e7VKyg8A@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
To: Christian Brauner <brauner@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Mike Christie <michael.christie@oracle.com>, 
	nicolas.dichtel@6wind.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, hch@infradead.org, stefanha@redhat.com, 
	jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com, 
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 7:23=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> So I think we will be able to address (1) and (2) by making vhost tasks
> proper threads and blocking every signal except for SIGKILL and SIGSTOP
> and then having vhost handle get_signal() - as you mentioned - the same
> way io uring already does. We should also remove the ingore_signals
> thing completely imho. I don't think we ever want to do this with user
> workers.

Right. That's what IO_URING does:

        if (args->io_thread) {
                /*
                 * Mark us an IO worker, and block any signal that isn't
                 * fatal or STOP
                 */
                p->flags |=3D PF_IO_WORKER;
                siginitsetinv(&p->blocked, sigmask(SIGKILL)|sigmask(SIGSTOP=
));
        }

and I really think that vhost should basically do exactly what io_uring doe=
s.

Not because io_uring fundamentally got this right - but simply because
io_uring had almost all the same bugs (and then some), and what the
io_uring worker threads ended up doing was to basically zoom in on
"this works".

And it zoomed in on it largely by just going for "make it look as much
as possible as a real user thread", because every time the kernel
thread did something different, it just caused problems.

So I think the patch should just look something like the attached.
Mike, can you test this on whatever vhost test-suite?

I did consider getting rid of ".ignore_signals" entirely, and instead
just keying the "block signals" behavior off the ".user_worker" flag.
But this approach doesn't seem wrong either, and I don't think it's
wrong to make the create_io_thread() function say that
".ignore_signals =3D 1" thing explicitly, rather than key it off the
".io_thread" flag.

Jens/Christian - comments?

Slightly related to this all: I think vhost should also do
CLONE_FILES, and get rid of the whole ".no_files" thing. Again, if
vhost doesn't use any files, it shouldn't matter, and looking
different just to be different is wrong. But if vhost doesn't use any
files, the current situation shouldn't be a bug either.

                     Linus
