Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD76C15C
	for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 12:00:12 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58c4e337357so13926847b3.0
        for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 05:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692100811; x=1692705611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u5LiIkAvVxxVW8WpXnX66pDAcHsjww5QTR5ehXhYNA=;
        b=H9vbnOz80jQS15To4QwN+qweEWMoZsk2NGtU7FJ0rY0gTYW3dKGIFYtwDjHc7DIWqQ
         6sxLK4bsLKlTnEZuFo5AyqBsU3s9iULU9lLWOSPylsYpPgENYwBEE7W31Ng9aV2bF2NW
         AtnCQJGViRW4q13a6wV88hSwi5PUOv9dXnChANZh/NqZ9luLd0iof0hu1IRpWN7AKsqz
         di9MIVDhVJ3z6GnNHEkPDPCDfodJzkAAqvsUZ1HiMp07HAKMQ/zCxvF1BtuSGeuXC9gs
         +v69ui0boCG5BlV8SnGje8GZNbZB06YA+DcObFWWUZD2AjgigLLQeYrd+VZfhvVtfY+V
         xAcA==
X-Gm-Message-State: AOJu0Yz0VcH7vShEfI3sRnrNHTHpcECH0CboiO3i+XaDf3k3zWfRb9Cx
	Q4sQROgMdXB126CzTfY+18BO1M3b0Kn3JA==
X-Google-Smtp-Source: AGHT+IH9bwGyhu6VGou2MDT6DOlN7F8ZKsVjkSxlDLpN9HSr9lGm3hv94qI7Bqz10IswzWOBTOfqPQ==
X-Received: by 2002:a81:4808:0:b0:577:3561:8a81 with SMTP id v8-20020a814808000000b0057735618a81mr13352272ywa.22.1692100809882;
        Tue, 15 Aug 2023 05:00:09 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id n206-20020a8172d7000000b005899c8e8242sm3378082ywc.138.2023.08.15.05.00.08
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 05:00:09 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d67869054bfso3496453276.3
        for <regressions@lists.linux.dev>; Tue, 15 Aug 2023 05:00:08 -0700 (PDT)
X-Received: by 2002:a25:ac89:0:b0:d5d:4bae:6fe0 with SMTP id
 x9-20020a25ac89000000b00d5d4bae6fe0mr13355730ybi.21.1692100808320; Tue, 15
 Aug 2023 05:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6702796fee0365bf399800326bbe6c88e5f73f68.1689014440.git.bcodding@redhat.com>
 <54144a14-606a-4f2c-ca19-9b762e1f7e91@linux-m68k.org>
In-Reply-To: <54144a14-606a-4f2c-ca19-9b762e1f7e91@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Aug 2023 13:59:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNW4dHZmPjJ9WUqA40_4ZvAM2DqcLMe18jWgmu=9UeRw@mail.gmail.com>
Message-ID: <CAMuHMdWNW4dHZmPjJ9WUqA40_4ZvAM2DqcLMe18jWgmu=9UeRw@mail.gmail.com>
Subject: Re: [PATCH] NFS: Fix sysfs server name memory leak
To: Benjamin Coddington <bcodding@redhat.com>
Cc: trond.myklebust@hammerspace.com, anna@kernel.org, aahringo@redhat.com, 
	linux-nfs@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC regressions

On Fri, Jul 14, 2023 at 5:29=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Mon, 10 Jul 2023, Benjamin Coddington wrote:
> > Free the formatted server index string after it has been duplicated by
> > kobject_rename().
> >
> > Fixes: 1c7251187dc0 ("NFS: add superblock sysfs entries")
> > Reported-by: Alexander Aring <aahringo@redhat.com>
> > Signed-off-by: Benjamin Coddington <bcodding@redhat.com>
>
> Thanks!
>
> This fixes the memory leaks I was seeing:
>
>      # cat /sys/kernel/debug/kmemleak
>      unreferenced object 0xc6d3b7c0 (size 64):
>        comm "mount.nfs", pid 261, jiffies 4294943450 (age 1385.530s)
>        hex dump (first 32 bytes):
>         73 65 72 76 65 72 2d 32 00 00 00 00 00 00 00 00  server-2........
>         00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>        backtrace:
>         [<7849dbd6>] slab_post_alloc_hook.constprop.0+0x9c/0xac
>         [<bf2297e0>] __kmem_cache_alloc_node+0xc4/0x124
>         [<07299a52>] __kmalloc_node_track_caller+0x80/0xa4
>         [<1876b300>] kvasprintf+0x5c/0xcc
>         [<4fa40352>] kasprintf+0x28/0x58
>         [<68e29ee6>] nfs_sysfs_move_sb_to_server+0x18/0x50
>         [<6a98700b>] nfs_kill_super+0x18/0x34
>         [<d388276a>] deactivate_locked_super+0x50/0x88
>         [<3945c450>] cleanup_mnt+0x6c/0xc8
>         [<fb0ac980>] task_work_run+0x84/0xb4
>         [<d6ee2bd3>] do_work_pending+0x364/0x398
>         [<c7a0dcab>] slow_work_pending+0xc/0x20
>      unreferenced object 0xc6cdd6c0 (size 64):
>        comm "mount.nfs", pid 261, jiffies 4294943456 (age 1385.470s)
>        hex dump (first 32 bytes):
>         73 65 72 76 65 72 2d 31 00 00 00 00 00 00 00 00  server-1........
>         00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>        backtrace:
>         [<7849dbd6>] slab_post_alloc_hook.constprop.0+0x9c/0xac
>         [<bf2297e0>] __kmem_cache_alloc_node+0xc4/0x124
>         [<07299a52>] __kmalloc_node_track_caller+0x80/0xa4
>         [<1876b300>] kvasprintf+0x5c/0xcc
>         [<4fa40352>] kasprintf+0x28/0x58
>         [<68e29ee6>] nfs_sysfs_move_sb_to_server+0x18/0x50
>         [<6a98700b>] nfs_kill_super+0x18/0x34
>         [<d388276a>] deactivate_locked_super+0x50/0x88
>         [<3945c450>] cleanup_mnt+0x6c/0xc8
>         [<fb0ac980>] task_work_run+0x84/0xb4
>         [<d6ee2bd3>] do_work_pending+0x364/0x398
>         [<c7a0dcab>] slow_work_pending+0xc/0x20
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/fs/nfs/sysfs.c
> > +++ b/fs/nfs/sysfs.c
> > @@ -345,8 +345,10 @@ void nfs_sysfs_move_sb_to_server(struct nfs_server=
 *server)
> >       int ret =3D -ENOMEM;
> >
> >       s =3D kasprintf(GFP_KERNEL, "server-%d", server->s_sysfs_id);
> > -     if (s)
> > +     if (s) {
> >               ret =3D kobject_rename(&server->kobj, s);
> > +             kfree(s);
> > +     }
> >       if (ret < 0)
> >               pr_warn("NFS: rename sysfs %s failed (%d)\n",
> >                                       server->kobj.name, ret);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
