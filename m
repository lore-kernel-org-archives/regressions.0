Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC880F
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 23:23:09 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5774098f16eso40189247b3.0
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 16:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688858588; x=1691450588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJmd9FNoExrkZazabhisTEX13e3yTkQujDR9ImsW+As=;
        b=KAr00s05g8LvJTb3B4MfRknnBcOsPzBA8MpmvEk9MyW2dsnWRJ+gR0zO8PseNnhyds
         6Mt9nJsN6mDK1Dh0NvAnhRCWzYZxHAhlfLQy9RHgQ4LNeE/wsu1rS7QDkdsSrHxffmbG
         LncoxcuQ5LD5OovH5vrPd/CfkojrHatihkBkTAqHapCmqs2qMs/IOwteAtH86tzhaWr+
         E8r1XVvTEXmScKTJlgEBa93UC+N33QJ1k4AhSrsn7Uk/wL8h6+7Vf6PuBvhB/DZSWdgZ
         jmFzygQ4Fr5KUeiYWIsHonmdkl7IWGEiCBU4SkTSiHEkZDV2rwxK3hTecpts0OknAuAS
         gqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688858588; x=1691450588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJmd9FNoExrkZazabhisTEX13e3yTkQujDR9ImsW+As=;
        b=If1238yVd0lCXvmVKWpJ2ISSfR3TU/l3aYRjpGhvH4VjXf7eCw3zSJI387cKvX2+Mq
         apvP6wCDm3O//tUPT06/EcK3pRbxtEQ6tePfLnQjzkLujdQSCRvHT/8xJUXGsRmK6869
         /dkcE+3I8qBbNxp4eRtQaoGpgdK8079neEzybHPtCkxR6cSY5nd0uceidpa4gUjdyqZ0
         hyW/vTeDKZBRogpoB7YPLDyFwuWSea4LAnZSJ/y+WC6X5sm85+9YZ9LsfbENbvV9pQdx
         ygh07rqwujRJM+ozDP/ZoI0to21cNcJzY0FKHqY6rDgd9thYU5GWfad0EscxxFwTj7m6
         RJag==
X-Gm-Message-State: ABy/qLaf50MwzKl0szZrbCKa/0Kcq9FqMcJCMLS+8bQD74oQsYNsLOUj
	fIStLIdFPrdeqcgjL3lnt9CYbrtFSlyF0mnS40WHvg==
X-Google-Smtp-Source: APBJJlHs1/S5FDnBZdy+MijP9fwBR6OMu6G+Y9QcTJ4N/KwfTKOEXMXKD5Sjy19yPHubJ4iO8EvZDNmedrlxShdDCY0=
X-Received: by 2002:a81:6d95:0:b0:56d:3f2:35a3 with SMTP id
 i143-20020a816d95000000b0056d03f235a3mr8095661ywc.44.1688858587953; Sat, 08
 Jul 2023 16:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b5a5626-2684-899d-874b-801e7974b17@google.com> <CAJuCfpGXC23r11-0jz+an01tO2BUOMpjJ93Dm3pc+EUQM=BXYg@mail.gmail.com>
In-Reply-To: <CAJuCfpGXC23r11-0jz+an01tO2BUOMpjJ93Dm3pc+EUQM=BXYg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 16:22:56 -0700
Message-ID: <CAJuCfpEyOXYh+dhW5iUFsz_s4P_pka9cD3M6qc8dDit5JxH3mw@mail.gmail.com>
Subject: Re: [PATCH] mm: lock newly mapped VMA with corrected ordering
To: Hugh Dickins <hughd@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org, 
	regressions@leemhuis.info, bagasdotme@gmail.com, jacobly.alt@gmail.com, 
	willy@infradead.org, liam.howlett@oracle.com, david@redhat.com, 
	peterx@redhat.com, ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 4:10=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Sat, Jul 8, 2023 at 4:04=E2=80=AFPM Hugh Dickins <hughd@google.com> wr=
ote:
> >
> > Lockdep is certainly right to complain about
> > (&vma->vm_lock->lock){++++}-{3:3}, at: vma_start_write+0x2d/0x3f
> >                but task is already holding lock:
> > (&mapping->i_mmap_rwsem){+.+.}-{3:3}, at: mmap_region+0x4dc/0x6db
> > Invert those to the usual ordering.
>
> Doh! Thanks Hugh!
> I totally forgot to run this with lockdep enabled :(

I verified both the lockdep warning and the fix. Thanks again, Hugh!

Tested-by: Suren Baghdasaryan <surenb@google.com>

>
> >
> > Fixes: 33313a747e81 ("mm: lock newly mapped VMA which can be modified a=
fter it becomes visible")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  mm/mmap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 84c71431a527..3eda23c9ebe7 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -2809,11 +2809,11 @@ unsigned long mmap_region(struct file *file, un=
signed long addr,
> >         if (vma_iter_prealloc(&vmi))
> >                 goto close_and_free_vma;
> >
> > +       /* Lock the VMA since it is modified after insertion into VMA t=
ree */
> > +       vma_start_write(vma);
> >         if (vma->vm_file)
> >                 i_mmap_lock_write(vma->vm_file->f_mapping);
> >
> > -       /* Lock the VMA since it is modified after insertion into VMA t=
ree */
> > -       vma_start_write(vma);
> >         vma_iter_store(&vmi, vma);
> >         mm->map_count++;
> >         if (vma->vm_file) {
> > --
> > 2.35.3
