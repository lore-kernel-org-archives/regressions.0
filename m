Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C3421EF4
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581569; cv=pass; b=EDLBMpsBrWrw80hegmbJmlhmP3nQngH3RenMrQqLayMl3X9UA4nJjiSy2w7nxjrDRchO5XV5ZwyXX/Bs9WwimvAEaUMAUMepheMKPHYlj0SQjl2Ikg2ovjdpQnv0EUHADlolvRzcHQOjcWwpUH49yO3Iqljln2kejbIePu0VpdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581569; c=relaxed/simple;
	bh=GcsfMUg3yCMfT0aO2UCldG9cwALVHJ0VJOEmJlH5r50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaY+IcOUZDMQfF2UI/MJUMcT7MIlWyd+ee75GKfuPWBUc8oQ9ygkZ4S5VL0eFu/bhZ+NT8jTFAtTBpedu3rVicatV4XWGtfCymA1Jf9HuNkTAr+IxUZ3mXVdoIPeeywWbWD1Qjtu8cdZwXCQIPDYSPbsugCVYzLmkw4xXE2zeVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=U2OQE2aA; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="U2OQE2aA"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91550f68089so79830285a.2
        for <regressions@lists.linux.dev>; Thu, 04 Jun 2026 06:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780581565; cv=none;
        d=google.com; s=arc-20240605;
        b=HgeD3e7PyvP1JY6iey2c5BsVZ1A6QH4PKybYM+3a0fiSM212TAht97UAOkKOoy2ySy
         c7LYpWfqD5S08LI88uOx8r/jIFD0i1wUxyu2/c0ThBlzLED/KyV1ITGj/aA+iKixugyA
         TgfNAR3RNdXGXp78EkGZS7GkQtHVgmkNKhus6peqUdLuKXVogwKLrA7RAh+sDUO8jq+X
         6mZrmYZh97gVZat0bvq7C+FmnYddYSKbt+T6pnuyF5OUwDZOqWOL9hBY4yM5cnO/ITrP
         nwF4XGLUqfvO0D5YU3KAqIx8i7hWdfn2vXYxTZZ0j8bv5w0/ZDdgNbeRdXpR/nwZrXUl
         EvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iJGxeXrrW2oLpAUFkW48W6w5shufffcNZYyapXzoAqM=;
        fh=YGMzRBjObLljzH6ZoWBllewG5771R46s7AK1x42dHpw=;
        b=IqUzC1i0f6f+Vj23gJYeKntXd7ScJKxypYKEW3Bjbzu+fGlk0ATSBucnokLJM0ZDJb
         MITmleL1njd2cyecwNXFpDUKA2j953G91SI7WF30tQAw5J2oxxLYssTsBczr5O2oN/uI
         1j712Yu7//OPRedL9h9S5hRibI6bb30TNEj+iWzq4HIJY1+KgPFIjvywtQ+Un8NoivCI
         5zv2ZxS55cumi9v9WZkUUi5Bf4AodJk81i8Y0ctU/2cOyXQOjFwv9vAY0aSTLcEqQbni
         RrQ/+K2d48yYIylhbAoIlxQDnndcFUMaVH9MP14fgfnTJMLrLMN/698qr7iSJUoAulAh
         Wvyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780581565; x=1781186365; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJGxeXrrW2oLpAUFkW48W6w5shufffcNZYyapXzoAqM=;
        b=U2OQE2aA4QqDtsQ1bpOW7hQiCx7o77qf+a2bpJFaacR80jEad3lpgnCB9EUa/AIFRE
         rFpoEunG51CFOhky5CP4dK/z/kzFKFUKdGVY5Hl74x2BWxavumRsI/Emjz+H9u+/VR2D
         Lz52iFfwIJk03TFxqOj1yogXYONbWOoquwT5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581565; x=1781186365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJGxeXrrW2oLpAUFkW48W6w5shufffcNZYyapXzoAqM=;
        b=jUPWf+vIpGHCeq7DVFfflrimSra7RbZz1SG6yuRrnIt2kJqDuvtq5DfOYxYV7UBVqr
         r0fd90/rCXOoWmRtiBVOXobY38OL3zNdKZOtU+HmZVtdDsVcslCilff/bXxkbGQs/LfV
         1UBG22tt+1ZN6RoYVhVxAMOdKYkQUcbvbBSk/jqA738r5nHnQLxGeugsHarz3gP821K5
         OqRhWhVl7M2dSvPbT3Kt69Wtzv4eN7tjLgd1XSIrP7VWSVTNbwSU98aWplumS3i3KA22
         Tla3NSMa6r6bywIIaUHpsTxbIGlmpQBTp2zsTmcfxkyeSH1PMmzLFh2jeGvTlaQsPx7V
         8O0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RGhqtIu8RS3QNfZcrq1TC6gOrGseIv47cAaqY9aib6mDueRJ0vz8TgHZpQtIa59cNmRQftDzA138bcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+j+SANGhpn2vAgyMdhH81HCUKoa9FL1InsVM50uGlJjqDcpmW
	U4u20J7wEol51MD/fArnkEYxD7kZpKYfBM1ZJjPuNSa+GiTd/bD9GO/4aycoZnjmV5Zc9dsZL1D
	bSL9w4lm3M9qroeNJAK9ttTpq2l+I4xZJ75/qSdTPkA==
X-Gm-Gg: Acq92OEPi7KtYRg5XpDr6gH1MzjOsjSANI/T71rZ1jpavOgDJHQ0WchyKTTGPU2ZP6N
	d0hESALTAKte9VE7Od4SbQwpija1jT9HIFWGNQAkDwIVeQBrkuVektynLDvmw3MFgRtlROpnJVB
	R/7xgfIcOXA+g7gecEvJusJUy48HB16paZdTOVSCnJOM/JIo6ClTY0YjME8fg4g7zKk9ZpVmJJy
	0gZUD8qacKQl6Bb0wupzvSnw5xnofYtGWMfXXbFW0lDEjtK0+YcO78kMd2HcmGxWyC9pmjalEX6
	kUoonzU5fcxQJVjdeAS+dLMPxUS8u/JyPZtCIWO5IJ6LyPw=
X-Received: by 2002:ac8:7d8f:0:b0:517:29c1:2b5c with SMTP id
 d75a77b69052e-51778781e85mr116546621cf.60.1780581565419; Thu, 04 Jun 2026
 06:59:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFbF8N7++zopZuEcsKRxBV_sgOGCbzCY0hOyMw1SiGAtuzGhyQ@mail.gmail.com>
 <CAJfpegsCJnMfn_BzzTK7m9ndCGVsnPit8ZsT0fzAhYoY+yOsKQ@mail.gmail.com>
 <178035740095.2923901.5908691318688917347@noble.neil.brown.name>
 <CAJfpegswAZv8OmDAcK-5u8kssAF1vZKe4gdDB2XPErAnoGFSYg@mail.gmail.com> <178056619459.3392745.3091041855723132411@noble.neil.brown.name>
In-Reply-To: <178056619459.3392745.3091041855723132411@noble.neil.brown.name>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 4 Jun 2026 15:59:13 +0200
X-Gm-Features: AVHnY4KXWHwA2rDtnMrlahBdYAmljXDTPRnUfVXdC8XkTG3_P3UeGgO6ZIixP0I
Message-ID: <CAJfpeguDUS_3X-AFZD6XCJB1SjVkFGu2aJ+p1BK574Scu-ASdA@mail.gmail.com>
Subject: Re: PROBLEM: FUSE_NOTIFY_INVAL_ENTRY leaves stale negative dentry
 after c9ba789dad15
To: NeilBrown <neil@brown.name>
Cc: =?UTF-8?B?0JDRgNGC0LXQvCDQm9Cw0LHQsNC30L7Qsg==?= <123321artyom@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 11:43, NeilBrown <neilb@ownmail.net> wrote:

> My guess is you refer to the need for retry-on-error.
> I need that design so that locking can be pushed closer to the
> filesystem and ultimately, in some cases, removed.

Aha, but this is filesystem code, we don't need or want to move it
closer to the filesystem, it's already there.

> It is a lot like the reason that we often use cmp-xchg loops instead of
> holding a spinlock while performing a simple operation.  The code is
> more complex but it scales better.

Okay, so this is about making VFS more scalable?  Can't we just leave
filesystem code alone in that case?

Thanks,
Miklos





> Thanks for the on going review!
>
> This is my current thought about how to fix this code.
>
> Thanks,
> NeilBrown
>
>
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 70948fe385da..7d744c7b923a 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1601,55 +1601,74 @@ int fuse_reverse_inval_entry(struct fuse_conn *fc, u64 parent_nodeid,
>         dir = d_find_alias(parent);
>         if (!dir)
>                 goto put_parent;
> -       while (!entry) {
> -               struct dentry *child = try_lookup_noperm(name, dir);
> -               if (!child || IS_ERR(child))
> -                       goto put_parent;
> -               entry = start_removing_dentry(dir, child);
> -               dput(child);
> -               if (IS_ERR(entry))
> -                       goto put_parent;
> +
> +do_lookup:
> +       if (IS_DEADDIR(parent))
> +               goto put_parent;
> +       entry = try_lookup_noperm(name, dir);
> +       if (!entry || IS_ERR(entry))
> +               goto put_parent;
> +       /*
> +        * We need to lock against concurrent create/rename/etc whether
> +        * entry is negative or positive, so use whichever of
> +        * start_creating_dentry() and start_removing_dentry() works.
> +        */
> +       if (d_really_is_negative(entry) &&
> +           !IS_ERR(start_creating_dentry(dir, entry))) {
> +               /* entry is negative, it cannot have been renamed */
> +               fuse_dir_changed(parent);
> +               if (!(flags & FUSE_EXPIRE_ONLY))
> +                       d_invalidate(entry);
> +               fuse_invalidate_entry_cache(entry);
> +               end_creating(entry);
> +               err = 0;
> +       } else if (!IS_ERR(start_removing_dentry(dir, entry))) {
> +               /* entry is positive */
> +
>                 if (!d_same_name(entry, dir, name)) {
>                         end_removing(entry);
> -                       entry = NULL;
> +                       dput(entry);
> +                       goto do_lookup;
>                 }
> -       }
>
> -       fuse_dir_changed(parent);
> -       if (!(flags & FUSE_EXPIRE_ONLY))
> -               d_invalidate(entry);
> -       fuse_invalidate_entry_cache(entry);
> -
> -       if (child_nodeid != 0) {
> -               inode_lock(d_inode(entry));
> -               if (get_node_id(d_inode(entry)) != child_nodeid) {
> -                       err = -ENOENT;
> -                       goto badentry;
> -               }
> -               if (d_mountpoint(entry)) {
> -                       err = -EBUSY;
> -                       goto badentry;
> -               }
> -               if (d_is_dir(entry)) {
> -                       shrink_dcache_parent(entry);
> -                       if (!simple_empty(entry)) {
> -                               err = -ENOTEMPTY;
> +               fuse_dir_changed(parent);
> +               if (!(flags & FUSE_EXPIRE_ONLY))
> +                       d_invalidate(entry);
> +               fuse_invalidate_entry_cache(entry);
> +               err = 0;
> +               if (child_nodeid != 0) {
> +                       inode_lock(d_inode(entry));
> +                       if (get_node_id(d_inode(entry)) != child_nodeid) {
> +                               err = -ENOENT;
>                                 goto badentry;
>                         }
> -                       d_inode(entry)->i_flags |= S_DEAD;
> +                       if (d_mountpoint(entry)) {
> +                               err = -EBUSY;
> +                               goto badentry;
> +                       }
> +                       if (d_is_dir(entry)) {
> +                               shrink_dcache_parent(entry);
> +                               if (!simple_empty(entry)) {
> +                                       err = -ENOTEMPTY;
> +                                       goto badentry;
> +                               }
> +                               d_inode(entry)->i_flags |= S_DEAD;
> +                       }
> +                       dont_mount(entry);
> +                       clear_nlink(d_inode(entry));
> +               badentry:
> +                       inode_unlock(d_inode(entry));
> +                       if (!err)
> +                               d_delete(entry);
>                 }
> -               dont_mount(entry);
> -               clear_nlink(d_inode(entry));
> -               err = 0;
> - badentry:
> -               inode_unlock(d_inode(entry));
> -               if (!err)
> -                       d_delete(entry);
> +
> +               end_removing(entry);
>         } else {
> -               err = 0;
> +               /* must have raced with rename before we got the lock */
> +               dput(entry);
> +               goto do_lookup;
>         }
> -
> -       end_removing(entry);
> +       dput(entry);
>   put_parent:
>         dput(dir);
>         iput(parent);
