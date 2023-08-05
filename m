Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA86180
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 00:26:47 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d0728058651so2642247276.1
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691195206; x=1691800006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxe81u7udmo92GKvP+siVLCAkn/wI0aAvKtL6yx1U3g=;
        b=IDYaS2Jlq4whyIHc7JhRYfrcrAbZnELtmh2woo/KuYYzAzsbayvQ4sj8qrACxQTt3E
         lYDAcPv0oqswtU0a+8JiNOxwSOMnlBuWRX/kUju4NfI2bkeIEoUd+hpoIymCGCrg+HOd
         rOReOu27oMxzSRZka0CWgiWvfvyFOK0RrE0oxXSXuHZ/6hvL8HbaMJh2bTXme5gHpVfp
         p1jGS/SX43x7wyiaKixT6DLKPsA1RnNYoqMQNguxmupUlnDjz4f6JHVu8pmLvpu1YxU+
         2jSfSQVlNRKHZayvnNhSQsr4CW9cqxboPyMOci7lrIrxoLjF91f9DZPkkFJiVd1YSI5t
         wB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691195206; x=1691800006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxe81u7udmo92GKvP+siVLCAkn/wI0aAvKtL6yx1U3g=;
        b=G73tNEbYDICF7pkr7/MELYIBlaMJqDiT6anu2L4Ljk9/qN31y6PECbZ2bqGflBzKls
         9dfkhVXvgYldUWTAjYD+KpAPTK6NI0SIuMx/RHOStVeDEBs/JS0QI6Ih36GpqHtTnlel
         fcBFxjGxCGFIq/2C4nfpxRbzcvWes06e6zZTD4YJusUU98RDimMuwthb8FbSL2k8D82y
         qm83onM21hg+1vEDMRwYjxh1TC3Rp6netS1sI1kBLYxFO9I/bBgBuOqOHkpOO4kcnvyL
         FOVjzu+ClDiITKD4UjHNoJFbDmIgRkRvk+GtSlgeYqpti1RHtF/Adk88Jm7Ej4sfHkBK
         7wOg==
X-Gm-Message-State: AOJu0Yzs4jQIKmcc7mg3/16wTpcrIr8eqTWbnRGzbLWcExTfF4Jfd7gE
	OXfrZYCv6ErPbInC3/SseFSpqHhNBhvxHZPpYskh7A==
X-Google-Smtp-Source: AGHT+IFV5JuRf10Of18+lGhJEPb7ELh0VS/HhAfs0nhr73hV/LaKvg8puQls+izXLadWiO6FQO7JuYQNY8dwcMbQzOg=
X-Received: by 2002:a25:361b:0:b0:d0f:846c:ef7b with SMTP id
 d27-20020a25361b000000b00d0f846cef7bmr3175751yba.17.1691195206375; Fri, 04
 Aug 2023 17:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com> <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
In-Reply-To: <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 17:26:33 -0700
Message-ID: <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, regressions@leemhuis.info, 
	bagasdotme@gmail.com, jacobly.alt@gmail.com, willy@infradead.org, 
	liam.howlett@oracle.com, david@redhat.com, peterx@redhat.com, 
	ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Jiri Slaby <jirislaby@kernel.org>, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >
> > I know of these guys, I think they are excluded as is -- they go
> > through access_remote_vm, starting with:
> >         if (mmap_read_lock_killable(mm))
> >                 return 0;
> >
> > while dup_mmap already write locks the parent's mm.
>
> Oh, you're only worried about vma_start_write()?
>
> That's a non-issue. It doesn't take the lock normally, since it starts of=
f with
>
>         if (__is_vma_write_locked(vma, &mm_lock_seq))
>                 return;
>
> which catches on the lock sequence number already being set.

That check will prevent re-locking but if vma is not already locked
then the call will proceed with obtaining the lock and setting
vma->vm_lock_seq to mm->mm_lock_seq.

>
> So no extra locking there.
>
> Well, technically there's extra locking because the code stupidly
> doesn't initialize new vma allocations to the right sequence number,
> but that was talked about here:
>
>     https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0Ly=
KgEvsFaZNpDA@mail.gmail.com/
>
> and it's a separate issue.
>
>           Linus
