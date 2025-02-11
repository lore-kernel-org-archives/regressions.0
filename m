Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA026B2A0
	for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301839; cv=none; b=Ag/RW9kZlSL/pQHJIgkwaqwsvUeNdAyQjYGqGJNk76m3JfBTJphWEGfbVYBYeNg69Dp1GXaDHTlzl6Glsy5NpweOls9094ZpmTUaoBBk6KTcuKVdqkxOG2/Jxx0ABp5dNDXoyOfEsnJGi9QSw+Z/wQNlwAdhkLR+qvBKOHssDy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301839; c=relaxed/simple;
	bh=/9krtCEs7t4mxpxN/fjiXdprmhRlMOwc+DF3ygA3K7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8brSSKoq3UaPacyRxD4RS/jBzv8pWi3mlQl4/yTtkO4uxfOpVZqOCvSlTBm1XXyUcFwyno2LI3dXndB0Pk+nwHObSiljzlH5DsfAh5vGHd4sIRopJL/Iog96mgbElicm9D9g2FeosvS4DXRpQ8FnwP48AcpP1GOFhcgdgT6kPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve9+hYNT; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve9+hYNT"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-471953acfe8so25532321cf.2
        for <regressions@lists.linux.dev>; Tue, 11 Feb 2025 11:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739301836; x=1739906636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyquudzGFfxKdiRxksRXadMuPylK1GlogDa9cblcCyI=;
        b=Ve9+hYNTsOR5kmSfrNgk3yAyVXPYUZpLL53MfDXmU/0JWByWwR25WCPN13wpHUgdx/
         3IxmiWpAqp2zhHxe/8QEro4vDU3MCHQqBLi2Zco8H9eDtkjtwV4cXvrtX+p2xOczd1B2
         BggwwRzTS/nhzX4LR2shf3+ZKJ/PII6q9uV6Jp2f78n1bqUh6E2wcEU6AT4ANmKRs8kF
         d6/8JHOsHcNcEzJyIwRojdjZU5oUSqGbRKUsm6FB27tDhLYYbbJsD7kg3R3Sa3RaDzfJ
         MUUCkATY6K4nNMCzMC2UD0IeM8YgfBBBzZaTkvSkUa7vvJN9LKpzxLUKia6gp9rjSWIK
         1LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739301836; x=1739906636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyquudzGFfxKdiRxksRXadMuPylK1GlogDa9cblcCyI=;
        b=Rkk0oDgr2P06ot0RoqXOUZ5EBfbyMOQ5YxGdzDJ1+D7rctAL3GRamxzHt/5Q2DQh6s
         nLmFd8Lp+8q9HtrlzI8N30QUtSQQ2y8YDiQsx5tqNhyQFaJA3Fl9H1gwLy9XiME3BTzy
         7fX5JZhrH5Y8PAtgDADC1P5+u8aFU3oSZ+N2/fpGv7I7quBGo44EYWQJcME7Zcv373Ik
         GhQRx6TKEFTmjAOcTsPY54pN8hQd8voeAnLQhjTz31yfSiQMV6J0HzsJkdg23y4gDH7T
         pWhdLwtiQMriK43s6dYs3MavSjDZfitw/zNvT6oVBjGEHUwghwp3vx2hNqk9pagb75Zj
         x+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnPLn6UATZlhcfq8Mft7N7k0HfoZYEXeymG05vvRZYQHvgxSsX2j9Dg8oF7fTr0mbrUiL0q122mIwYVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygWwFHEc3FU0oCRVsxZmeAhunpH6EK6GOWwBuHOpRX/Ie971ht
	/TQdrM/GMsvBLyYL5rEMFR7flBYbDyrZB945isjVCqTEoB9rOIHtbLOLOZSyjHz9oAYPGSp+z8q
	+eOwFxXAIYrz6WJaKkzW18DzxDO0470Tdwb0=
X-Gm-Gg: ASbGncuSWdYXuXlBt3qkm2PUhU6Vj2d5oyNictVWs4tKkBXGMe+vkkM85JTsDtqg2x/
	CKqLZ8V9AsfKgsiQzTX/PE56XF/78ARWKdHRkJhm+at6tg8TYQD7bqKgNMPTFNq8X/FgO9oXg+Q
	==
X-Google-Smtp-Source: AGHT+IHsO/hy//zVuTr38WbJwX4RVSGuIWDkkbwLY9Ry/XOTJk49t0soPTp74YtJBvE7sBPSsUvSPjOv/yPpUkJ8ia4=
X-Received: by 2002:a05:622a:4b:b0:471:8dab:d4f2 with SMTP id
 d75a77b69052e-471afe0ee3amr5145021cf.3.1739301836091; Tue, 11 Feb 2025
 11:23:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz> <20250207172917.GA2072771@perftesting>
 <8f7333f2-1ba9-4df4-bc54-44fd768b3d5b@suse.cz> <CAJnrk1aNVMCfTjL0vo-Qki68-5t1W+6-bJHg+x67kHEo_-q0Eg@mail.gmail.com>
 <Z6ct4bEdeZwmksxS@casper.infradead.org> <CAJnrk1aY0ZFcS4JvmJL=icigencsCD8g4qmZiTuoPWj2S2Y_LQ@mail.gmail.com>
 <81298bd1-e630-4940-ae5b-7882576b6bf4@suse.cz> <CAJnrk1aBc5uvL78s3kdpXojH-B11wtOPSDUJ0XnCzmHH+eO2Nw@mail.gmail.com>
 <20250210191235.GA2256827@perftesting> <Z6pjSYyzFJHaQo73@casper.infradead.org>
 <8a99f6bf3f0b5cb909f11539fb3b0ef0d65b3a73.camel@kernel.org> <ecee2d1392fcb9b075687e7b59ec69057d3c1bb3.camel@kernel.org>
In-Reply-To: <ecee2d1392fcb9b075687e7b59ec69057d3c1bb3.camel@kernel.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 11 Feb 2025 11:23:45 -0800
X-Gm-Features: AWEUYZl1GfPTZXzSetqKFD7DNB6FXqKr6c58XQWiS0Jq_hJKJpwnR8_iG_rZU74
Message-ID: <CAJnrk1ZkhNdCf_v4KHmsFoh3EcEaKY0Z8SVn2nJouVDxTZxv=A@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Jeff Layton <jlayton@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Miklos Szeredi <miklos@szeredi.hu>, 
	Christian Heusel <christian@heusel.eu>, Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 6:01=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Mon, 2025-02-10 at 17:38 -0500, Jeff Layton wrote:
> > On Mon, 2025-02-10 at 20:36 +0000, Matthew Wilcox wrote:
> > > On Mon, Feb 10, 2025 at 02:12:35PM -0500, Josef Bacik wrote:
> > > > From: Josef Bacik <josef@toxicpanda.com>
> > > > Date: Mon, 10 Feb 2025 14:06:40 -0500
> > > > Subject: [PATCH] fuse: drop extra put of folio when using pipe spli=
ce
> > > >
> > > > In 3eab9d7bc2f4 ("fuse: convert readahead to use folios"), I conver=
ted
> > > > us to using the new folio readahead code, which drops the reference=
 on
> > > > the folio once it is locked, using an inferred reference on the fol=
io.
> > > > Previously we held a reference on the folio for the entire duration=
 of
> > > > the readpages call.
> > > >
> > > > This is fine, however I failed to catch the case for splice pipe
> > > > responses where we will remove the old folio and splice in the new
> > > > folio.  Here we assumed that there is a reference held on the folio=
 for
> > > > ap->folios, which is no longer the case.
> > > >
> > > > To fix this, simply drop the extra put to keep us consistent with t=
he
> > > > non-splice variation.  This will fix the UAF bug that was reported.
> > > >
> > > > Link: https://lore.kernel.org/linux-fsdevel/2f681f48-00f5-4e09-8431=
-2b3dbfaa881e@heusel.eu/
> > > > Fixes: 3eab9d7bc2f4 ("fuse: convert readahead to use folios")
> > > > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > > > ---
> > > >  fs/fuse/dev.c | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > > > index 5b5f789b37eb..5bd6e2e184c0 100644
> > > > --- a/fs/fuse/dev.c
> > > > +++ b/fs/fuse/dev.c
> > > > @@ -918,8 +918,6 @@ static int fuse_try_move_page(struct fuse_copy_=
state *cs, struct page **pagep)
> > > >   }
> > > >
> > > >   folio_unlock(oldfolio);
> > > > - /* Drop ref for ap->pages[] array */
> > > > - folio_put(oldfolio);
> > > >   cs->len =3D 0;
> > >
> > > But aren't we now leaking a reference to newfolio?  ie shouldn't
> > > we also:
> > >
> > > -   folio_get(newfolio);
> > >
> > > a few lines earlier?
> > >
> >
> >
> > I think that ref was leaking without Josef's patch, but your proposed
> > fix seems correct to me. There is:
> >
> > - 1 reference stolen from the pipe_buffer
> > - 1 reference taken for the pagecache in replace_page_cache_folio()
> > - the folio_get(newfolio) just after that
> >
> > The pagecache ref doesn't count here, and we only need the reference
> > that was stolen from the pipe_buffer to replace the one in pagep.
>
> Actually, no. I'm wrong here. A little after the folio_get(newfolio)
> call, we do:
>
>         /*
>          * Release while we have extra ref on stolen page.  Otherwise
>          * anon_pipe_buf_release() might think the page can be reused.
>          */
>         pipe_buf_release(cs->pipe, buf);
>
> ...so that accounts for the extra reference. I think the newfolio
> refcounting is correct as-is.

I think we do need to remove the folio_get(newfolio); here or we are
leaking the reference.

new_folio =3D page_folio(buf->page) # ref is 1
replace_page_cache_folio() # ref is 2
folio_get() # ref is 3
pipe_buf_release() # ref is 2

One ref belongs to the page cache and will get dropped by that, but
the other ref is unaccounted for (since the original patch removed
"folio_put()" from fuse_readpages_end()).

I still think acquiring an explicit reference on the folio before we
add it to ap->folio and then dropping it when we're completely done
with it in fuse_readpages_end() is the best solution, as that imo
makes the refcounting / lifetimes the most explicit / clear. For
example, in try_move_pages(), if we get rid of that "folio_get()"
call, the page cache is the holder of the remaining reference on it,
and we rely on the earlier "folio_clear_uptodate(newfolio);" line in
try_move_pages() to guarantee that the newfolio isn't freed out from
under us if memory gets tight and it's evicted from the page cache.

imo, a patch like this makes the refcounting the most clear:

From 923fa98b97cf6dfba3bb486833179c349d566d64 Mon Sep 17 00:00:00 2001
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 11 Feb 2025 10:59:40 -0800
Subject: [PATCH] fuse: acquire explicit folio refcount for readahead

In 3eab9d7bc2f4 ("fuse: convert readahead to use folios"), the logic
was converted to using the new folio readahead code, which drops the
reference on the folio once it is locked, using an inferred reference
on the folio. Previously we held a reference on the folio for the
entire duration of the readpages call.

This is fine, however for the case for splice pipe responses where we
will remove the old folio and splice in the new folio (see
fuse_try_move_page()), we assume that there is a reference held on the
folio for ap->folios, which is no longer the case.

To fix this and make the refcounting explicit, acquire a refcount on the
folio before we add it to ap->folios[] and drop it when we are done with
the folio in fuse_readpages_end(). This will fix the UAF bug that was
reported.

Link: https://lore.kernel.org/linux-fsdevel/2f681f48-00f5-4e09-8431-2b3dbfa=
a881e@heusel.eu/
Fixes: 3eab9d7bc2f4 ("fuse: convert readahead to use folios")
Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/fuse/file.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 7d92a5479998..6fa535c73d93 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -955,8 +955,10 @@ static void fuse_readpages_end(struct fuse_mount
*fm, struct fuse_args *args,
                fuse_invalidate_atime(inode);
        }

-       for (i =3D 0; i < ap->num_folios; i++)
+       for (i =3D 0; i < ap->num_folios; i++) {
                folio_end_read(ap->folios[i], !err);
+               folio_put(ap->folios[i]);
+       }
        if (ia->ff)
                fuse_file_put(ia->ff, false);

@@ -1049,6 +1051,12 @@ static void fuse_readahead(struct readahead_control =
*rac)

                while (ap->num_folios < cur_pages) {
                        folio =3D readahead_folio(rac);
+                       /*
+                        * Acquire an explicit reference on the folio in ca=
se
+                        * it's replaced in the page cache in the splice ca=
se
+                        * (see fuse_try_move_page()).
+                        */
+                       folio_get(folio);
                        ap->folios[ap->num_folios] =3D folio;
                        ap->descs[ap->num_folios].length =3D folio_size(fol=
io);
                        ap->num_folios++;
--
2.43.5

> --
> Jeff Layton <jlayton@kernel.org>
