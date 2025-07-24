Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B41FC3
	for <regressions@lists.linux.dev>; Thu, 24 Jul 2025 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753384465; cv=none; b=ISvq1vk+bI6zQx7gHwy+q9RWdEF74LQihthsTLOqgbcuZyodTd2zruvPndIaEYThzdV6MtSP8ooXM4s6PlB+flG4JPs62Uk1mb29P39PspkaAcqcgYMLVNGIn9FWEPN+v4fOCqkXGKSfol3SzJrQDLgN4m/UkgKupuAtFOSMvfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753384465; c=relaxed/simple;
	bh=9JY7p80c86n6GjRiruyjjExy0MOzgPy1y+oe7BuOM1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrGWy6z6b3ny1MmRTWEGXhzun5YBjQGt9FYP1B1o3XgnR5otb8v3Saoy7h098BmQuERbEQK3W4nhgY67n7BWwik43ZMtPTPNigC+SgmBIVgy4zmJgB5+cy6eMLhw9DFlH2UVlSneN1Z8HLedIK1CKreOwY2xf6IQrJB9YV/11WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpuRrie2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpuRrie2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ab82eb3417so14086191cf.2
        for <regressions@lists.linux.dev>; Thu, 24 Jul 2025 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753384463; x=1753989263; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jOSnyBDxczFG/IHSIdGMkE63XZ2hP+zlYXbjMuUNLc=;
        b=NpuRrie2hasRcC2inhkXpAgClI+YKAQ+bRz/mxgDZ8T8V48SC6vljabY7IAAWBSH9S
         ejezpv1o4Esc6J6YjusijBcmPbdEnUW/HAc6+qCOmucyN9yuH5NfbUB06mJ39uRRKIMW
         Mb/iHERYQHZkRLJHlomHvSEbnELEu6P55npyNltGAkF3rO3eRHDOscdvqADuhK3A2XOs
         WdNJVCv4zpz7iEkho7J6RzXWIsZ3yCyF5zLOil2LSnzNmBCc9VclnrJaYrpMCPE1M4qm
         Q10HABnepjMYvQK7pksREzDWdhUF1G759LZlB/G7dYWMAiRs+JM3W1nWLsrJtZqQhs1d
         YGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753384463; x=1753989263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jOSnyBDxczFG/IHSIdGMkE63XZ2hP+zlYXbjMuUNLc=;
        b=UEbwqbiFsWXAH3tA09T2kua6p4MQcI8GrtNwMNfqMDuGxEoj25z1V1xyEjeICBNuns
         PlzsPE7mKpW6kMQOZOxDUl/+QZ63udlAo3D1GNXE5/vw/LLZgwI/3joD1Or6AYM4SW4W
         WwfrQtvyJZZuBxaiuXtf6w8IjSGD7OU4GmFSjWnwQnS+b6/gqkM2iYyZ9YBvg1CWMg43
         ybjockHdOROkhxr+1Yfvkmj4WbkIvAQoO2HRMbIzTCWcP2cbkzfAX+vKraU3RCQNktL9
         9ChUvr4cF9mVJl6IHC6/9ErBkY0h7gYXuBwxzUf6go6m653C7PV8Tu18B21TuYvnCBXJ
         c2pA==
X-Forwarded-Encrypted: i=1; AJvYcCUnnQleKNYan5z9axmpj4BMOTbpA4yZU3cfKXjZJirgRCtOmTTCBLzRCzZ3za04bmnHazqD7CRNjKzQEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwderX6qmHubxZP2o3pHjWLs3xTJcJFKLnzQV3x0ix1/SgigtEv
	VPHM5hGjWS8MUdgJ3g0TkPyO9ZCrB3Ctqz8Wf3ielULvFFflkofBZfSCJVrUeloAVPZPAPF1P6n
	m+44t4YPZ2x/cues5bT79WfIVt361PDM=
X-Gm-Gg: ASbGncsQHuvi42UfVpx9Xr418Ux4roNn2uaG7kMrgyJJiClUFYnyGTS/1tCmshzUitU
	I8jmbtWUlaHGFIK8hFmU+Toj0U6b6fx90U+YqPwiPAzlM0Lazph/LhzYSNnDPqN3w7PHdOPHs5q
	fAFwcgOl6gLGT1Y0T4CtNiuTG73WChqiezD20hwx32KtpyXJlL60UHMaVe4kha7WivVaizhoCM/
	cnmFMk=
X-Google-Smtp-Source: AGHT+IGm06QE4HAxdtDrbkTCJlc3WBllGjE2CLQfWltUi2scOuGwGhLY9rcqQVvFXqhFOXNUBQN8GPgnjRiXL0ZxnAk=
X-Received: by 2002:a05:622a:2486:b0:4ab:db27:4775 with SMTP id
 d75a77b69052e-4ae6e0370b9mr94057441cf.54.1753384462745; Thu, 24 Jul 2025
 12:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs5AdVM-T2Tf3LciNCwLZEHetcnSkHsjZajVwwpM2HmJw@mail.gmail.com>
 <20250723144637.GW2672070@frogsfrogsfrogs> <CAJnrk1Z7wcB8uKWcrAuRAZ8B-f8SKnOuwtEr-=cHa+ApR_sgXQ@mail.gmail.com>
 <20250723212020.GY2672070@frogsfrogsfrogs> <CAJnrk1bFWRTGnpNhW_9MwSYZw3qPnPXZBeiwtPSrMhCvb9C3qg@mail.gmail.com>
In-Reply-To: <CAJnrk1bFWRTGnpNhW_9MwSYZw3qPnPXZBeiwtPSrMhCvb9C3qg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 24 Jul 2025 12:14:10 -0700
X-Gm-Features: Ac12FXzB5jWOM2jLEHuea3HtXx8QVU4kwGFHqdvioSKikDPZlGiijO3gRX8BQys
Message-ID: <CAJnrk1byTVJtuOyAyZSVYrusjhA-bW6pxBOQQopgHHbD3cDUHw@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 3:37=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> On Wed, Jul 23, 2025 at 2:20=E2=80=AFPM Darrick J. Wong <djwong@kernel.or=
g> wrote:
> >
> > On Wed, Jul 23, 2025 at 11:42:42AM -0700, Joanne Koong wrote:
> > > On Wed, Jul 23, 2025 at 7:46=E2=80=AFAM Darrick J. Wong <djwong@kerne=
l.org> wrote:
> > > >
> > > > [cc Joanne]
> > > >
> > > > On Wed, Jul 23, 2025 at 05:14:28PM +0530, Naresh Kamboju wrote:
> > > > > Regressions found while running LTP msync04 tests on qemu-arm64 r=
unning
> > > > > Linux next-20250721, next-20250722 and next-20250723 with 16K and=
 64K
> > > > > page size enabled builds.
> > > > >
> > > > > CONFIG_ARM64_64K_PAGES=3Dy ( kernel warning as below )
> > > > > CONFIG_ARM64_16K_PAGES=3Dy ( kernel warning as below )
> > > > >
> > > > > No warning noticed with 4K page size.
> > > > > CONFIG_ARM64_4K_PAGES=3Dy works as expected
> > > >
> > > > You might want to cc Joanne since she's been working on large folio
> > > > support in fuse.
> > > >
> > > > > First seen on the tag next-20250721.
> > > > > Good: next-20250718
> > > > > Bad:  next-20250721 to next-20250723
> > >
> > > Thanks for the report. Is there a link to the script that mounts the
> > > fuse server for these tests? I'm curious whether this was mounted as =
a
> > > fuseblk filesystem.
> > >
> > > > >
> > > > > Regression Analysis:
> > > > > - New regression? Yes
> > > > > - Reproducibility? Yes
> > > > >
> > > > > Test regression: next-20250721 arm64 16K and 64K page size WARNIN=
G fs
> > > > > fuse file.c at fuse_iomap_writeback_range
> > > > >
> > > > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > > >
> > > > > ## Test log
> > > > > ------------[ cut here ]------------
> > > > > [  343.828105] WARNING: fs/fuse/file.c:2146 at
> > > > > fuse_iomap_writeback_range+0x478/0x558 [fuse], CPU#0: msync04/419=
0
> > > >
> > > >         WARN_ON_ONCE(len & (PAGE_SIZE - 1));
> > > >
> > > > /me speculates that this might be triggered by an attempt to write =
back
> > > > some 4k fsblock within a 16/64k base page?
> > > >
> > >
> > > I think this can happen on 4k base pages as well actually. On the
> > > iomap side, the length passed is always block-aligned and in fuse, we
> > > set blkbits to be PAGE_SHIFT so theoretically block-aligned is always
> > > page-aligned, but I missed that if it's a "fuseblk" filesystem, that
> > > isn't true and the blocksize is initialized to a default size of 512
> > > or whatever block size is passed in when it's mounted.
> >
> > <nod> I think you're correct.
> >
> > > I'll send out a patch to remove this line. It doesn't make any
> > > difference for fuse_iomap_writeback_range() logic whether len is
> > > page-aligned or not; I had added it as a sanity-check against sketchy
> > > ranges.
> > >
> > > Also, I just noticed that apparently the blocksize can change
> > > dynamically for an inode in fuse through getattr replies from the
> > > server (see fuse_change_attributes_common()). This is a problem since
> > > the iomap uses inode->i_blkbits for reading/writing to the bitmap. I
> > > think we will have to cache the inode blkbits in the iomap_folio_stat=
e
> > > struct unfortunately :( I'll think about this some more and send out =
a
> > > patch for this.
> >
> > From my understanding of the iomap code, it's possible to do that if yo=
u
> > flush and unmap the entire pagecache (whilst holding i_rwsem and
> > mmap_invalidate_lock) before you change i_blkbits.  Nobody *does* this
> > so I have no idea if it actually works, however.  Note that even I don'=
t
> > implement the flush and unmap bit; I just scream loudly and do nothing:
>
> lol! i wish I could scream loudly and do nothing too for my case.
>
> AFAICT, I think I just need to flush and unmap that file and can leave
> the rest of the files/folios in the pagecache as is? But then if the
> file has active refcounts on it or has been pinned into memory, can I
> still unmap and remove it from the page cache? I see the
> invalidate_inode_pages2() function but my understanding is that the
> page still stays in the cache if it has has active references, and if
> the page gets mmaped and there's a page fault on it, it'll end up
> using the preexisting old page in the page cache.

Never mind, I was mistaken about this. Johannes confirmed that even if
there's active refcounts on the folio, it'll still get removed from
the page cache after unmapping and the page cache reference will get
dropped.

I think I can just do what you suggested and call
filemap_invalidate_inode() in fuse_change_attributes_common() then if
the inode blksize gets changed. Thanks for the suggestion!

>
> I don't think I really need to have it removed from the page cache so
> much as just have the ifs state for all the folios in the file freed
> (after flushing the file) so that it can start over with a new ifs.
> Ideally we could just flush the file, then iterate through all the
> folios in the mapping in order of ascending index, and kfree their
> ->private, but I'm not seeing how we can prevent the case of new
> writes / a new ifs getting allocated for folios at previous indexes
> while we're trying to do the iteration/kfreeing.
>
> >
> > void fuse_iomap_set_i_blkbits(struct inode *inode, u8 new_blkbits)
> > {
> >         trace_fuse_iomap_set_i_blkbits(inode, new_blkbits);
> >
> >         if (inode->i_blkbits =3D=3D new_blkbits)
> >                 return;
> >
> >         if (!S_ISREG(inode->i_mode))
> >                 goto set_it;
> >
> >         /*
> >          * iomap attaches per-block state to each folio, so we cannot a=
llow
> >          * the file block size to change if there's anything in the pag=
e cache.
> >          * In theory, fuse servers should never be doing this.
> >          */
> >         if (inode->i_mapping->nrpages > 0) {
> >                 WARN_ON(inode->i_blkbits !=3D new_blkbits &&
> >                         inode->i_mapping->nrpages > 0);
> >                 return;
> >         }
> >
> > set_it:
> >         inode->i_blkbits =3D new_blkbits;
> > }
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/co=
mmit/?h=3Dfuse-iomap-attrs&id=3Dda9b25d994c1140aae2f5ebf10e54d0872f5c884
> >
> > --D
> >
> > >
> > > Thanks,
> > > Joanne
> > >
