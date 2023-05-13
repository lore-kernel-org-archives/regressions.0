Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA23EC0
	for <regressions@lists.linux.dev>; Sat, 13 May 2023 15:08:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50bc0117683so19534584a12.1
        for <regressions@lists.linux.dev>; Sat, 13 May 2023 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683990503; x=1686582503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrMPRtTxcv74Ng8wNryDIV11KZXuJe9+P1FFJBFwcZ0=;
        b=JYPfd3aSMqnoHARUlznUxq8gBAeDmi51c7HoNwt0ALTFRaD7rrsH57twX6F20vtb81
         x2Icy37sGJW+K503Y7UfjVdURfDnqXeEEca8GU77GSzKZZ25XnWs8TZTSZ9PDXC1eFg7
         jGrFfyt71Dx37Ki0IdH5iJI3EjPEri7Er+c1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683990503; x=1686582503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrMPRtTxcv74Ng8wNryDIV11KZXuJe9+P1FFJBFwcZ0=;
        b=iUYPobhT0nOWxmnfLNHRo+sMjHQuv50OtdVGoh296TOrPJPiCT3oxF+mD0Hbe4Gg8d
         I4KVbdaqmqNJaW/XfLban+3GdeXP1TIQCk5BiEyuiL1SWaKczp3dtziDPvMXVKU72o8S
         GToB9VnupQ7pbdokxjcdzbKy6fX5zGdnKWs2ibqWn6NbVWIBSMqZ5aDgHzz5FWNmisrn
         wQmHmWpSR9CpP7Ni1BW7OMibUVQX60bX0/0tsFTf4Vkv2XfzREGTujoaoOur3udssxMm
         62j2fzrgVEz/M3MA+yAUBhYGinprccDbZ/6cR5Tj90yF2wF6/2/4RiVUboyZIclToY+h
         aAqA==
X-Gm-Message-State: AC+VfDylvVRKV4XX0xeUyLd4eD6m3HgEki0F8z+Eq11CC3Te1+ZlSwlx
	pcWmemPUDFsFXqOX1H6SYh0ZrrgGXz3TsCktMBvtQQ==
X-Google-Smtp-Source: ACHHUZ67behf1xZ2ynOQquLwpfIZI1dJP8zNkSFPCKW+Hr2HjJGCiDepNoLaszpWr6zjDbxQJXwedw==
X-Received: by 2002:a17:907:9287:b0:959:6fb2:1c3b with SMTP id bw7-20020a170907928700b009596fb21c3bmr24462521ejc.39.1683990503070;
        Sat, 13 May 2023 08:08:23 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id gs13-20020a170906f18d00b0095ef7268ba9sm6756383ejb.41.2023.05.13.08.08.21
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 08:08:21 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-966287b0f72so1601047466b.0
        for <regressions@lists.linux.dev>; Sat, 13 May 2023 08:08:21 -0700 (PDT)
X-Received: by 2002:a17:907:783:b0:862:c1d5:ea1b with SMTP id
 xd3-20020a170907078300b00862c1d5ea1bmr25847436ejb.8.1683990501510; Sat, 13
 May 2023 08:08:21 -0700 (PDT)
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
In-Reply-To: <48842e92-835e-bc3f-7118-48b8f415f532@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 13 May 2023 10:08:04 -0500
X-Gmail-Original-Message-ID: <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
Message-ID: <CAHk-=wicXCNR1bBioaAiBqEDgv-CoQD9z2RsM2VOTPzkK0xr8g@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] vhost: use vhost_tasks for worker threads
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mike Christie <michael.christie@oracle.com>, nicolas.dichtel@6wind.com, 
	Christian Brauner <brauner@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, hch@infradead.org, stefanha@redhat.com, 
	jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
	virtualization@lists.linux-foundation.org, ebiederm@xmission.com, 
	konrad.wilk@oracle.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 7:39=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> Jumping in here, as I found another problem with that patch: it broke
> s2idle on my laptop when a qemu-kvm VM is running, as freezing user
> space processes now fails for me:

Hmm. kthreads have PF_NOFREEZE by default, which is probably the reason.

Adding

        current->flags |=3D PF_NOFREEZE;

to the vhost_task setup might just fix it, but it feels a bit off.

The way io_uring does this is to  do

                if (signal_pending(current)) {
                        struct ksignal ksig;

                        if (!get_signal(&ksig))
                                continue;
                        break;
                }

in the main loop, which ends up handling the freezer situation too.
But it should handle things like SIGSTOP etc as well, and also exit on
actual signals.

I get the feeling that the whole "vhost_task_should_stop()" logic
should have the exact logic above, and basically make those threads
killable as well.

Hmm?

                Linus
