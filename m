Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C32180
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 00:14:58 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9bee2d320so40865701fa.1
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1691194496; x=1691799296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BOt/owxzUYbRmdYSMwC2b72ailgyx1LyngYZzbpA3ng=;
        b=O7h8BHhbymu1I4d9ZaPLh23xuuUDRqcwMsszrhc+cDntNODV23CcvQ9/lPL6ayYxbV
         jyui6NxhOjTNrewE2jlD9bplqx5j8albhlxXcvxYqRHg4f4+NsmTwofjBMmJwPkZSliC
         0J8AFv8huk2XGYV/Lg1bQ5SEGFapAZa4lVZdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691194496; x=1691799296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOt/owxzUYbRmdYSMwC2b72ailgyx1LyngYZzbpA3ng=;
        b=Sdo+NtF+E2A+VKAR7JMfM/26yUO/G7Si/e7MBcIoEMkBVCPrsQtJHB53/hbyTGhZPL
         8tHW1OYttyYLk0XRvgXyCfIo1sIa+WF37BTZjn5niGpDRyizmo22xTqqPGrTdZOTGyMf
         Pxiu0JW9P7dDOVE31Iti3vrTvyMTV4tXpAPlBemC9tCX/eKK17XxGLJ7SVhVfnuJC4oK
         aOMn8fsfQC4Q0h/RMgPKS+eIIWbSQDtZKMZKWAbKl5zd+Rkml6r/0a4AeTE9m2fRmer8
         1QlmYY0/1rwKnDNg2O3wJzqUWxW2UkP878bkMkP8sUeWq1sxRr6tQ0BrVg/GkDYF6W0D
         2MSg==
X-Gm-Message-State: AOJu0YxldiABzejMcic6DJxtwHwmBzjjIO/PPwi84otAJCOd/LzZ70WG
	tSxk4KfCaN8qWyg+Ck5asPKN9sDOhpTbuNxxmsdCel8J
X-Google-Smtp-Source: AGHT+IHNdLGBXPYJo6cEM+wOFwPx21PrLevAvRT57N+/+BKwrVTooBO7u48Wz1SzL8Ng8R8ejhv68Q==
X-Received: by 2002:a2e:86d1:0:b0:2b9:f007:9908 with SMTP id n17-20020a2e86d1000000b002b9f0079908mr2935812ljj.41.1691194496650;
        Fri, 04 Aug 2023 17:14:56 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id z27-20020a05651c023b00b002b83dbc71c9sm666449ljn.54.2023.08.04.17.14.55
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 17:14:56 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fe28e4671dso4548499e87.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 17:14:55 -0700 (PDT)
X-Received: by 2002:a05:6512:74e:b0:4fb:ca59:42d7 with SMTP id
 c14-20020a056512074e00b004fbca5942d7mr2051745lfs.33.1691194495615; Fri, 04
 Aug 2023 17:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
In-Reply-To: <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Aug 2023 17:14:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
Message-ID: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, regressions@leemhuis.info, 
	bagasdotme@gmail.com, jacobly.alt@gmail.com, willy@infradead.org, 
	liam.howlett@oracle.com, david@redhat.com, peterx@redhat.com, 
	ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> I know of these guys, I think they are excluded as is -- they go
> through access_remote_vm, starting with:
>         if (mmap_read_lock_killable(mm))
>                 return 0;
>
> while dup_mmap already write locks the parent's mm.

Oh, you're only worried about vma_start_write()?

That's a non-issue. It doesn't take the lock normally, since it starts off with

        if (__is_vma_write_locked(vma, &mm_lock_seq))
                return;

which catches on the lock sequence number already being set.

So no extra locking there.

Well, technically there's extra locking because the code stupidly
doesn't initialize new vma allocations to the right sequence number,
but that was talked about here:

    https://lore.kernel.org/all/CAHk-=wiCrWAoEesBuoGoqqufvesicbGp3cX0LyKgEvsFaZNpDA@mail.gmail.com/

and it's a separate issue.

          Linus
