Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797D71
	for <regressions@lists.linux.dev>; Wed, 12 May 2021 09:50:09 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id c22so5947115ejd.12
        for <regressions@lists.linux.dev>; Wed, 12 May 2021 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GUt7kPgBJMN4yeVeOkrnQPhryLYrZDgrYjGs4lAolt0=;
        b=ny8mv3++m4i3B4RuxmYCDHFPZlicowKuAS8DYTUdpV+/w8b0YH+X604s0wwq/lCGyb
         DR8eoBJ0erFDUQLA3OXISUEEsuXm3Qn6YXjhTCR9ohPlny+kEmsvNAJoH0I2u/byDzPQ
         1cSY5VjBECxKDVWnjy9nRoKB4cnb29GlY8tXoxiWTo+fai6eDqa8D5TiL7FfFE8tXE9c
         nbVvECz0MehXQkRQYmIoF6PlwprkF+LxUuReOEYb8HjkkxGSEMycPm1A2QSUSFSmusdu
         gDaoqJ4t9oDulXcRivGVbe7vO3W2gkOmCqV6bOi2QPctaaIzFy3z8GZpXikvFW9XOCcy
         isrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GUt7kPgBJMN4yeVeOkrnQPhryLYrZDgrYjGs4lAolt0=;
        b=HLPV0za7Sobu+xSj+CHxCadaAyy6HRb3fEfhua8VxUyvxpa6Dxm+xJw66e7bS6Cw8e
         KDXe7BfxZusay1+jP3N8y7ubUWE3RbqoZEEcxHBeZbl5Nr5iButJ8q45cLxZgdMQzP1I
         xFrpInm6Gw3u3vojCx2Kejn3m6wpM6Xg8D3VrpSENMSqoosESnqO+XeMgYHddZqWAvPC
         o9TunseI763LzMHqhbRb30UunmpXo6ZTHhgX2nkbPyuaHkDaqIktfA+UPg9cn+bm0Di2
         bGG04vn4b70Wqv87SDdNG3M3HaeHqigE+j8/qrpItkRL7GZYvnnaDtlhyV9MmYZjq5JG
         rj5A==
X-Gm-Message-State: AOAM532vJl6zO4k806O7JKVl0CaCyRQ0SJq88ZSRGueyoD9OcOH+whBz
	KXt/Y26ogi2Ug3ACqegA5l0Sib5vD+vHeBki9YUU/A==
X-Google-Smtp-Source: ABdhPJycczh8p/R6rx9xEBWFUyXO2Fgq/he1OuYyct0gYcV96QiIqDD7coLQ1IQIpCvWW6ASdZG4MS0Qqsy1mLrWMbc=
X-Received: by 2002:a17:906:85da:: with SMTP id i26mr37086650ejy.287.1620813008025;
 Wed, 12 May 2021 02:50:08 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210507150553.208763-1-peterx@redhat.com> <20210507150553.208763-4-peterx@redhat.com>
In-Reply-To: <20210507150553.208763-4-peterx@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 12 May 2021 15:19:55 +0530
Message-ID: <CA+G9fYswoAtwh=m1pakV2fB7w3Aq-emvLSCU+b_OhxyqV0Ybsg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: gup: pack has_pinned in MMF_HAS_PINNED
To: Peter Xu <peterx@redhat.com>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, 
	Kirill Tkhai <ktkhai@virtuozzo.com>, Kirill Shutemov <kirill@shutemov.name>, 
	Oleg Nesterov <oleg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Andrea Arcangeli <aarcange@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 May 2021 at 20:36, Peter Xu <peterx@redhat.com> wrote:
>
> From: Andrea Arcangeli <aarcange@redhat.com>
>
> has_pinned 32bit can be packed in the MMF_HAS_PINNED bit as a noop
> cleanup.
>
> Any atomic_inc/dec to the mm cacheline shared by all threads in
> pin-fast would reintroduce a loss of SMP scalability to pin-fast, so
> there's no future potential usefulness to keep an atomic in the mm for
> this.
>
> set_bit(MMF_HAS_PINNED) will be theoretically a bit slower than
> WRITE_ONCE (atomic_set is equivalent to WRITE_ONCE), but the set_bit
> (just like atomic_set after this commit) has to be still issued only
> once per "mm", so the difference between the two will be lost in the
> noise.
>
> will-it-scale "mmap2" shows no change in performance with enterprise
> config as expected.
>
> will-it-scale "pin_fast" retains the > 4000% SMP scalability
> performance improvement against upstream as expected.
>
> This is a noop as far as overall performance and SMP scalability are
> concerned.
>
> Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
> [peterx: Fix build for task_mmu.c, introduce mm_set_has_pinned_flag, fix
>  comment here and there]
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  fs/proc/task_mmu.c             |  2 +-
>  include/linux/mm.h             |  2 +-
>  include/linux/mm_types.h       | 10 ----------
>  include/linux/sched/coredump.h |  8 ++++++++
>  kernel/fork.c                  |  1 -
>  mm/gup.c                       | 19 +++++++++++++++----
>  6 files changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 4c95cc57a66a8..6144571942db9 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1049,7 +1049,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
>                 return false;
>         if (!is_cow_mapping(vma->vm_flags))
>                 return false;
> -       if (likely(!atomic_read(&vma->vm_mm->has_pinned)))
> +       if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
>                 return false;
>         page = vm_normal_page(vma, addr, pte);
>         if (!page)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d6790ab0cf575..94dc84f6d8658 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1331,7 +1331,7 @@ static inline bool page_needs_cow_for_dma(struct vm_area_struct *vma,
>         if (!is_cow_mapping(vma->vm_flags))
>                 return false;
>
> -       if (!atomic_read(&vma->vm_mm->has_pinned))
> +       if (!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags))
>                 return false;
>
>         return page_maybe_dma_pinned(page);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a88946..15d79858fadbd 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -435,16 +435,6 @@ struct mm_struct {
>                  */
>                 atomic_t mm_count;
>
> -               /**
> -                * @has_pinned: Whether this mm has pinned any pages.  This can
> -                * be either replaced in the future by @pinned_vm when it
> -                * becomes stable, or grow into a counter on its own. We're
> -                * aggresive on this bit now - even if the pinned pages were
> -                * unpinned later on, we'll still keep this bit set for the
> -                * lifecycle of this mm just for simplicity.
> -                */
> -               atomic_t has_pinned;
> -
>                 /**
>                  * @write_protect_seq: Locked when any thread is write
>                  * protecting pages mapped by this mm to enforce a later COW,
> diff --git a/include/linux/sched/coredump.h b/include/linux/sched/coredump.h
> index dfd82eab29025..4d9e3a6568758 100644
> --- a/include/linux/sched/coredump.h
> +++ b/include/linux/sched/coredump.h
> @@ -73,6 +73,14 @@ static inline int get_dumpable(struct mm_struct *mm)
>  #define MMF_OOM_VICTIM         25      /* mm is the oom victim */
>  #define MMF_OOM_REAP_QUEUED    26      /* mm was queued for oom_reaper */
>  #define MMF_MULTIPROCESS       27      /* mm is shared between processes */
> +/*
> + * MMF_HAS_PINNED: Whether this mm has pinned any pages.  This can be either
> + * replaced in the future by mm.pinned_vm when it becomes stable, or grow into
> + * a counter on its own. We're aggresive on this bit for now: even if the
> + * pinned pages were unpinned later on, we'll still keep this bit set for the
> + * lifecycle of this mm, just for simplicity.
> + */
> +#define MMF_HAS_PINNED         28      /* FOLL_PIN has run, never cleared */
>  #define MMF_DISABLE_THP_MASK   (1 << MMF_DISABLE_THP)
>
>  #define MMF_INIT_MASK          (MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 502dc046fbc62..a71e73707ef59 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1026,7 +1026,6 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>         mm_pgtables_bytes_init(mm);
>         mm->map_count = 0;
>         mm->locked_vm = 0;
> -       atomic_set(&mm->has_pinned, 0);
>         atomic64_set(&mm->pinned_vm, 0);
>         memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
>         spin_lock_init(&mm->page_table_lock);
> diff --git a/mm/gup.c b/mm/gup.c
> index 9933bc5c2eff2..bb130723a6717 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1270,6 +1270,17 @@ int fixup_user_fault(struct mm_struct *mm,
>  }
>  EXPORT_SYMBOL_GPL(fixup_user_fault);
>
> +/*
> + * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for the mm's
> + * lifecycle.  Avoid setting the bit unless necessary, or it might cause write
> + * cache bouncing on large SMP machines for concurrent pinned gups.
> + */
> +static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
> +{
> +       if (!test_bit(MMF_HAS_PINNED, mm_flags))
> +               set_bit(MMF_HAS_PINNED, mm_flags);
> +}
> +
>  /*
>   * Please note that this function, unlike __get_user_pages will not
>   * return 0 for nr_pages > 0 without FOLL_NOWAIT
> @@ -1292,8 +1303,8 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>                 BUG_ON(*locked != 1);
>         }
>
> -       if ((flags & FOLL_PIN) && !atomic_read(&mm->has_pinned))
> -               atomic_set(&mm->has_pinned, 1);
> +       if (flags & FOLL_PIN)
> +               mm_set_has_pinned_flag(&mm->flags);
>
>         /*
>          * FOLL_PIN and FOLL_GET are mutually exclusive. Traditional behavior
> @@ -2617,8 +2628,8 @@ static int internal_get_user_pages_fast(unsigned long start,
>                                        FOLL_FAST_ONLY)))
>                 return -EINVAL;
>
> -       if ((gup_flags & FOLL_PIN) && !atomic_read(&current->mm->has_pinned))
> -               atomic_set(&current->mm->has_pinned, 1);
> +       if (gup_flags & FOLL_PIN)
> +               mm_set_has_pinned_flag(&current->mm->flags);

Linux next tag next-20210512 builds failed on arm, riscv, mips and sh
for the tinyconfig and allnoconfig due this patch.

 arm, mips, riscv and sh (tinyconfig) with gcc-8
 arm, mips, riscv and sh (allnoconfig) with gcc-8
 arm, mips, riscv and sh (tinyconfig) with gcc-9
 arm, mips, riscv and sh (allnoconfig) with gcc-9
 arm, mips, riscv and sh (tinyconfig) with gcc-10
 arm, mips, riscv and sh (allnoconfig) with gcc-10

mm/gup.c: In function 'internal_get_user_pages_fast':
mm/gup.c:2698:3: error: implicit declaration of function
'mm_set_has_pinned_flag' [-Werror=implicit-function-declaration]
 2698 |   mm_set_has_pinned_flag(&current->mm->flags);
      |   ^~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [/builds/linux/scripts/Makefile.build:273: mm/gup.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

#regzb introduced: 354a2e3604e2 ("mm: gup: pack has_pinned in MMF_HAS_PINNED")

Build url:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1255567072#L315

--
Linaro LKFT
https://lkft.linaro.org
