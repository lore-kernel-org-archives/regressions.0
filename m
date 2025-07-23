Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2901D54D8
	for <regressions@lists.linux.dev>; Wed, 23 Jul 2025 22:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753310237; cv=none; b=GD3lqYrTlmD8VqQQ7SQ/fMJKHilZCJqyn9CYlzQCVETZJ6vpxl4xB1bcwK5xeGske6ZmPj6jgCTEjOYBMN3T6NegStKhbPxiljFvsW2bo+gx03i3NGzBEn8qvhW4yoLfdzTHMetZldd0mlWIB+h7+JX4Px8DokL2COsC94I+WV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753310237; c=relaxed/simple;
	bh=WLpZVFL6i45G9hsEsT96Tgw98VbKC0ZlhUqwjUtaJEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/Y12zoNMGVJLXrsbNyJSjjeYj4bLKZaAno3E/7lytC8GbMc9YJcmVXPBU/5f8nyAyyFmoZtrYcjrhsSjvp1TScKaCv2nboAQCE/HSou7lYiypQb15rxDLxRCKH/qAGXty2+ukT4Vi9qmXzdzceNM1mm0xOaAFp6wRnDUN+PwG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ur1MBV0i; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ur1MBV0i"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4aba19f4398so5146981cf.1
        for <regressions@lists.linux.dev>; Wed, 23 Jul 2025 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753310234; x=1753915034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT3gZgJcKjgQhhv2BAHSv1vm9Q9R1YzcsGLhzAhjs4M=;
        b=Ur1MBV0ij237FLRvLdK6eaV3bYX64GGsmc9jGD8UD/lba+e4Tc9Mhn5FNMmBAfV+qe
         JnllU9mUQGKI4jL7Xb20Vq0z6d98W0tL+NqlXKbRM6rLc6EHDk6/we1QexHql0yBRIp5
         0vVQUoHuuP996UUCCH9rmk9cGNfnn3ZKTdwB0RPoTQzRQLTx7JgkszYIsRx7KZ0CeIzc
         gfu619XYtBFnJidfn2tyXehVqmNCPL2Pe1PRdCMmcbSJyCkmCgzOdzCh8Kr1HoA61Ay5
         TOT2P08SszMObgF/jjEjYf2lV0YXX4PPJF4OTOhspyNz5KMRWeNiyN7Ab/VFFSOPhThu
         ji0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753310234; x=1753915034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XT3gZgJcKjgQhhv2BAHSv1vm9Q9R1YzcsGLhzAhjs4M=;
        b=RaVaYwNxMlUciW+R8b1kQhTFYOQKUw6pE3N8Aq4KpjolJbAp2onC20zJQQnsT3boi/
         kZO8nPO7S7zLFhtBnrBZzs8ImLIUGSriDyAzzPxKHqMsyDbVJijmrl6057ecN2FpXSTd
         /l2lO6xVPMwXWXTRoapZZKFoYZakgVI+Nhv4UKXJTnrjm/CcFd8I3Cdxu4dvwtiWEToG
         P6tMkM5KJIZ/QWABb41qFHQcbgQFEeiCU86M1qJLEMuFTgQ3pzl4uY1ofWHU/1chzUVC
         KFRUMRrBjalZZWD2VM+6vfdMuisqXD8OiuiwQZJNNdneu/qbDMRbuuRoAgBmflPcvIYa
         zclg==
X-Forwarded-Encrypted: i=1; AJvYcCVo0XuZERfYniMEVkLh2LwzxVZm0QYZdlPXKysRQPhFWDCJUQ8YnO8JDkF3CemaeMfpawfRiKSaA6vX+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9yogzAjlZbhvie5H9bKCfml0BsxMp8LEc8Lm7f1j94k9ul2AM
	2iQrss0s37LDAukpGf0VkulPhTDqZ2EykpjUoPfDaMnycz17xgwutH6hVMn2WvYZagXOreEIy0W
	k65xrDrUdghwT4Ay+wh8jSJSUUd19j/g=
X-Gm-Gg: ASbGncsGXZv+5c/13Mu82yUlJmVWu1qamBphiDpAPfAe3pk3PY0W5/tYpTpoRjUUTVc
	qAd9YA4mT3ZKZNfZ2MPyOQx6T4Pdy9VJT4PQXUA370DMPkW5frXn4iR7WGkPNP8/HDX+FEXtS+1
	LMngbGMvfxEZfBqznE1g57ngLCzXZvmfRwGku3XlRiuNu+Ya5/cm1pyyL9FRZkmK+g0XVIUblHk
	O+QnAI=
X-Google-Smtp-Source: AGHT+IGOOacVYve6Wp+wqewcosy47JZTFuo3iGif5RJJGfqv8oqYJZjY5NKLG8Zii4YSxCooRAydaaLV3uIN+qEser8=
X-Received: by 2002:a05:622a:591:b0:4a9:c8e3:a38 with SMTP id
 d75a77b69052e-4ae6df7f8a5mr66874731cf.30.1753310233670; Wed, 23 Jul 2025
 15:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs5AdVM-T2Tf3LciNCwLZEHetcnSkHsjZajVwwpM2HmJw@mail.gmail.com>
 <20250723144637.GW2672070@frogsfrogsfrogs> <CAJnrk1Z7wcB8uKWcrAuRAZ8B-f8SKnOuwtEr-=cHa+ApR_sgXQ@mail.gmail.com>
 <20250723212020.GY2672070@frogsfrogsfrogs>
In-Reply-To: <20250723212020.GY2672070@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 23 Jul 2025 15:37:02 -0700
X-Gm-Features: Ac12FXxB2nVp9FqI1vea6XZQcEtWGsAFL1VZb8QhxAb5VxOs6Ul814N4-7dsOH4
Message-ID: <CAJnrk1bFWRTGnpNhW_9MwSYZw3qPnPXZBeiwtPSrMhCvb9C3qg@mail.gmail.com>
Subject: Re: next-20250721 arm64 16K and 64K page size WARNING fs fuse file.c
 at fuse_iomap_writeback_range
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, linux-fsdevel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, linux-xfs@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 2:20=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Wed, Jul 23, 2025 at 11:42:42AM -0700, Joanne Koong wrote:
> > On Wed, Jul 23, 2025 at 7:46=E2=80=AFAM Darrick J. Wong <djwong@kernel.=
org> wrote:
> > >
> > > [cc Joanne]
> > >
> > > On Wed, Jul 23, 2025 at 05:14:28PM +0530, Naresh Kamboju wrote:
> > > > Regressions found while running LTP msync04 tests on qemu-arm64 run=
ning
> > > > Linux next-20250721, next-20250722 and next-20250723 with 16K and 6=
4K
> > > > page size enabled builds.
> > > >
> > > > CONFIG_ARM64_64K_PAGES=3Dy ( kernel warning as below )
> > > > CONFIG_ARM64_16K_PAGES=3Dy ( kernel warning as below )
> > > >
> > > > No warning noticed with 4K page size.
> > > > CONFIG_ARM64_4K_PAGES=3Dy works as expected
> > >
> > > You might want to cc Joanne since she's been working on large folio
> > > support in fuse.
> > >
> > > > First seen on the tag next-20250721.
> > > > Good: next-20250718
> > > > Bad:  next-20250721 to next-20250723
> >
> > Thanks for the report. Is there a link to the script that mounts the
> > fuse server for these tests? I'm curious whether this was mounted as a
> > fuseblk filesystem.
> >
> > > >
> > > > Regression Analysis:
> > > > - New regression? Yes
> > > > - Reproducibility? Yes
> > > >
> > > > Test regression: next-20250721 arm64 16K and 64K page size WARNING =
fs
> > > > fuse file.c at fuse_iomap_writeback_range
> > > >
> > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > >
> > > > ## Test log
> > > > ------------[ cut here ]------------
> > > > [  343.828105] WARNING: fs/fuse/file.c:2146 at
> > > > fuse_iomap_writeback_range+0x478/0x558 [fuse], CPU#0: msync04/4190
> > >
> > >         WARN_ON_ONCE(len & (PAGE_SIZE - 1));
> > >
> > > /me speculates that this might be triggered by an attempt to write ba=
ck
> > > some 4k fsblock within a 16/64k base page?
> > >
> >
> > I think this can happen on 4k base pages as well actually. On the
> > iomap side, the length passed is always block-aligned and in fuse, we
> > set blkbits to be PAGE_SHIFT so theoretically block-aligned is always
> > page-aligned, but I missed that if it's a "fuseblk" filesystem, that
> > isn't true and the blocksize is initialized to a default size of 512
> > or whatever block size is passed in when it's mounted.
>
> <nod> I think you're correct.
>
> > I'll send out a patch to remove this line. It doesn't make any
> > difference for fuse_iomap_writeback_range() logic whether len is
> > page-aligned or not; I had added it as a sanity-check against sketchy
> > ranges.
> >
> > Also, I just noticed that apparently the blocksize can change
> > dynamically for an inode in fuse through getattr replies from the
> > server (see fuse_change_attributes_common()). This is a problem since
> > the iomap uses inode->i_blkbits for reading/writing to the bitmap. I
> > think we will have to cache the inode blkbits in the iomap_folio_state
> > struct unfortunately :( I'll think about this some more and send out a
> > patch for this.
>
> From my understanding of the iomap code, it's possible to do that if you
> flush and unmap the entire pagecache (whilst holding i_rwsem and
> mmap_invalidate_lock) before you change i_blkbits.  Nobody *does* this
> so I have no idea if it actually works, however.  Note that even I don't
> implement the flush and unmap bit; I just scream loudly and do nothing:

lol! i wish I could scream loudly and do nothing too for my case.

AFAICT, I think I just need to flush and unmap that file and can leave
the rest of the files/folios in the pagecache as is? But then if the
file has active refcounts on it or has been pinned into memory, can I
still unmap and remove it from the page cache? I see the
invalidate_inode_pages2() function but my understanding is that the
page still stays in the cache if it has has active references, and if
the page gets mmaped and there's a page fault on it, it'll end up
using the preexisting old page in the page cache.

I don't think I really need to have it removed from the page cache so
much as just have the ifs state for all the folios in the file freed
(after flushing the file) so that it can start over with a new ifs.
Ideally we could just flush the file, then iterate through all the
folios in the mapping in order of ascending index, and kfree their
->private, but I'm not seeing how we can prevent the case of new
writes / a new ifs getting allocated for folios at previous indexes
while we're trying to do the iteration/kfreeing.

>
> void fuse_iomap_set_i_blkbits(struct inode *inode, u8 new_blkbits)
> {
>         trace_fuse_iomap_set_i_blkbits(inode, new_blkbits);
>
>         if (inode->i_blkbits =3D=3D new_blkbits)
>                 return;
>
>         if (!S_ISREG(inode->i_mode))
>                 goto set_it;
>
>         /*
>          * iomap attaches per-block state to each folio, so we cannot all=
ow
>          * the file block size to change if there's anything in the page =
cache.
>          * In theory, fuse servers should never be doing this.
>          */
>         if (inode->i_mapping->nrpages > 0) {
>                 WARN_ON(inode->i_blkbits !=3D new_blkbits &&
>                         inode->i_mapping->nrpages > 0);
>                 return;
>         }
>
> set_it:
>         inode->i_blkbits =3D new_blkbits;
> }
>
> https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?h=3Dfuse-iomap-attrs&id=3Dda9b25d994c1140aae2f5ebf10e54d0872f5c884
>
> --D
>
> >
> > Thanks,
> > Joanne
> >
