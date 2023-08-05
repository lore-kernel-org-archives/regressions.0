Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78C622
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 00:34:21 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d45caf42d73so826590276.2
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 17:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691195661; x=1691800461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE6BW9pFYdezUl7cDS0TzP1DYFsIzJQ0ypEfGdJ3TBg=;
        b=h0TxxwCKVye0DQdqW8QciL6a/cGS644vYZUx3RI0OE1671HBfkLOeCjBNqcVrLOU2b
         ycUmZSGLpA9J5ensM11f+iadX9Igk/HzJLsetwc9ly0gURsAFjMfewFY/ZbbuNvVegBO
         zzsxkPT9b50kkszDh+PkQ3GspK2tIZt+I3X+8usJTbDu2o7JkhwHvqL4jBShd4IfGcpl
         UvUXcNV5NlwO1ex/P6Q99K1X+l1eVkU1QU5hcPg4wm2SkhYzjGIIbU58/izBoxYFf7Y/
         H2/yj5m5CuBBcYn7Gjr7Dd36TjaoDemXFlAk5O+znIBaWL3JFXYYXipgVBaiJa9ssh/c
         YgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691195661; x=1691800461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GE6BW9pFYdezUl7cDS0TzP1DYFsIzJQ0ypEfGdJ3TBg=;
        b=e7xwRyCOCeG4PspqoKc4JB/Wy4Aw7OYDpK7HqyIorUMzIoPCVdpXRUViWN14KHxh0x
         Wf6mBBVltQVDRFKc0k2dPgb+MjbeDW/YKqxtIaxau0AjJQ9YHS2iTurzkMvsQD/PQC/4
         zLs8t05CsWZqEQGyKNAwkmZvgZ5EpYGhcSb2/EyBmadZ2coz2o3mjkd21IMmUBYzFqSX
         B5e9OnuN8hddEsp4pB+f5bP45jNYfe+GiJZVUc5Ne0YCU/I8WV/g8OyL50wQDPGFQ6ik
         VAJ/8/smDnoBy4bB0MDAT3rdzohTAzKQLH30sRpXgZiWBfw8btJdqbizoP9H9BrUUeLK
         NSMw==
X-Gm-Message-State: AOJu0YzEIEfEVll0p6olP0y/DWg1870U7KgWKt97i1btp86Y0GLRbBuJ
	Z6On0JeGRi1zgFXewh3zwtuFsyAmTb0JoRsG3UTqOQ==
X-Google-Smtp-Source: AGHT+IGIa1nXviU0YBg9eLF8cyB0v1ib0mH9PwLc2T9pyyHMpMQsFzfvoD0GfbNXEO9Va/0KSmKs9VeIuXib/uNqJuc=
X-Received: by 2002:a25:250c:0:b0:c14:68fd:6e30 with SMTP id
 l12-20020a25250c000000b00c1468fd6e30mr2908586ybl.16.1691195660786; Fri, 04
 Aug 2023 17:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com> <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
In-Reply-To: <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 17:34:06 -0700
Message-ID: <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
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

On Fri, Aug 4, 2023 at 5:26=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
> > >
> > > I know of these guys, I think they are excluded as is -- they go
> > > through access_remote_vm, starting with:
> > >         if (mmap_read_lock_killable(mm))
> > >                 return 0;
> > >
> > > while dup_mmap already write locks the parent's mm.
> >
> > Oh, you're only worried about vma_start_write()?
> >
> > That's a non-issue. It doesn't take the lock normally, since it starts =
off with
> >
> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
> >                 return;
> >
> > which catches on the lock sequence number already being set.
>
> That check will prevent re-locking but if vma is not already locked
> then the call will proceed with obtaining the lock and setting
> vma->vm_lock_seq to mm->mm_lock_seq.

The optimization Mateusz describes looks valid to me. If there is
nobody else to fault a page and mm_users is stable (which I think it
is because we are holding mmap_lock for write) then we can skip vma
locking, I think.

>
> >
> > So no extra locking there.
> >
> > Well, technically there's extra locking because the code stupidly
> > doesn't initialize new vma allocations to the right sequence number,
> > but that was talked about here:
> >
> >     https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0=
LyKgEvsFaZNpDA@mail.gmail.com/
> >
> > and it's a separate issue.
> >
> >           Linus
