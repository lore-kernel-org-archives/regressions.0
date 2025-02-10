Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD623956A
	for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211246; cv=none; b=Y78N+rVxsACYUZ3JFtJoQCQxXED6X/MfXGu6UEt7UhdONnODTKQzRQu71QIWu53l150dQYW6MkyWy2WAhYIhaa8tjvR+ze+7sQFcMtkRD4UGW8uNooUIaGzHdr/IbbqHmO133R8mYCH42XbuEX4/eW73fNAgB13BHpHdbpp1hpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211246; c=relaxed/simple;
	bh=VpbyY1Ghxa+2INjf8c3BfLUMYL0IPb0Mb1W29+1Ek4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geFeoWwwMyn9U5pKLRvoceMgBjmpXXsrCHcNaxyxhKuPD2lzmOu63eM4EcQvLl7HFgaf8sZc+aMB6AiT2/s4DLXbrKupzkaiE5RHsuxQh2iWCYuD8QXQR9hiFUc8rkTpSPfy76ZjIrexR8ebjpc3dDEYU/ZQvfdTaf5KYiSRf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm/7wCdx; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm/7wCdx"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4718b128eafso5868541cf.3
        for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739211244; x=1739816044; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GAon67fTF+Z/QksfmcN1Wg362w+GO/sYKO+48/Qp2g=;
        b=Wm/7wCdxygDuigsbSiJCts7gaNuDNuKdxHRt1H+GdThXaZQs8hg/G1bkZPX636qHYh
         8Qk0zWGdR/GeA6Ya8zL0hwrBkBzLrh9qoFk9TyVoOzzUuvpUtwMrvzRnvEa2YaReBjFK
         uiK9gvzEfo0T/8+Ajp1gbr1Xo8z57JUIWw2JAbbuQxooiPpPmaQ1C/W6ryLnDPQxyk/u
         VS7unA0KzNSNxEM6aPXIazBLh0V9X3W94Csu3aGj9aeqBcwXoYT2PlyD+uoENBrXL0vP
         1clYIIH3n/YMPEauSggCBqu6XAme+slDr/Zqo+ePB+dNMJRf2fjyvinDHlHz3KFV/ZHF
         /C9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211244; x=1739816044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GAon67fTF+Z/QksfmcN1Wg362w+GO/sYKO+48/Qp2g=;
        b=fQavZRFHmpauYdZD7dLHwv3D+0DUMW8DwPCfw98nt+yXK4ZQ+9TmW03g4HV5waWKuI
         PeU7URmpepx7gWuPtWMt+VnRndv8gm+PEaCPzTPf1F2kpokxw2/yDttn93dEbMrSN6Vu
         jtUvSkX2SFzWYn+1waOwiJL5Syn+nld1XNfuOxnZlUizG1iN/e0WveSkCxe8nZ0JN6tY
         AvtqQ/jjLBn/nUk3DyO00DsyWoIHRqFpwrDjDXdLbZ3Utcz88UNIOXbpmioTd55X3LGd
         y370Ku7DKar7y0qZwRdkJSg3xhJpixGbzpIpHSLkm95kXt1p2AIp2vZYnJk8OKxebCWn
         QfXg==
X-Forwarded-Encrypted: i=1; AJvYcCXvg8vQJz+i7e5M1vlFBvmO/QDYtliNwY/aaq3x2+JLpXfq6AoaCPVGRottpbc59GuSm9Clg56hABAp7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvYZidwFFcQpWwgg83fErnSRzQtke5Qhu4Q4WWt1YGG2YphtVw
	YqzZBugMbDt8uTObV5TlyNz47f+TEq2FlyG7JoCImElTfDp61Lt73jxkGt2hKkIWxyTkKj/B7UK
	SRh/xxWMUAjObM7/O1+8Ifv0yZdA=
X-Gm-Gg: ASbGncsHnthr9yFCGNTL/0RK3PJDrpi5RE150wq1YsRttlalYO9TOh1sJ5DIR1N0Kmf
	Jkju3YS8oev5borqngw08UgVCkg2eqexZNu/sWnEdAWvQWBjR1E+zZZold5UQMGu04NljcS+u7J
	PS1qMU0wktrZz2
X-Google-Smtp-Source: AGHT+IHw7qyHtO12sVFUjn+ibik5SqtRzWi/aq5Gq5MrMU1FTFBx2agmOq4G5FuHhwgn6PL4m2EdV38mrVh7lb23k5M=
X-Received: by 2002:a05:622a:1f06:b0:471:997f:39ec with SMTP id
 d75a77b69052e-471997f3e9cmr41192771cf.30.1739211243688; Mon, 10 Feb 2025
 10:14:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz> <20250207172917.GA2072771@perftesting>
 <8f7333f2-1ba9-4df4-bc54-44fd768b3d5b@suse.cz> <CAJnrk1aNVMCfTjL0vo-Qki68-5t1W+6-bJHg+x67kHEo_-q0Eg@mail.gmail.com>
 <Z6ct4bEdeZwmksxS@casper.infradead.org> <CAJnrk1aY0ZFcS4JvmJL=icigencsCD8g4qmZiTuoPWj2S2Y_LQ@mail.gmail.com>
 <81298bd1-e630-4940-ae5b-7882576b6bf4@suse.cz>
In-Reply-To: <81298bd1-e630-4940-ae5b-7882576b6bf4@suse.cz>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 10 Feb 2025 10:13:51 -0800
X-Gm-Features: AWEUYZnd9EDodvxc9WlMkRecfw_ALKaRXXREZ3ZlXO6DJg6l6ogEuCyV301mPcc
Message-ID: <CAJnrk1aBc5uvL78s3kdpXojH-B11wtOPSDUJ0XnCzmHH+eO2Nw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Christian Heusel <christian@heusel.eu>, 
	Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 12:27=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 2/8/25 16:46, Joanne Koong wrote:
> > On Sat, Feb 8, 2025 at 2:11=E2=80=AFAM Matthew Wilcox <willy@infradead.=
org> wrote:
> >>
> >> On Fri, Feb 07, 2025 at 04:22:56PM -0800, Joanne Koong wrote:
> >> > > Thanks, Josef. I guess we can at least try to confirm we're on the=
 right track.
> >> > > Can anyone affected see if this (only compile tested) patch fixes =
the issue?
> >> > > Created on top of 6.13.1.
> >> >
> >> > This fixes the crash for me on 6.14.0-rc1. I ran the repro using
> >> > Mantas's instructions for Obfuscate. I was able to trigger the crash
> >> > on a clean build and then with this patch, I'm not seeing the crash
> >> > anymore.
> >>
> >> Since this patch fixes the bug, we're looking for one call to folio_pu=
t()
> >> too many.  Is it possibly in fuse_try_move_page()?  In particular, thi=
s
> >> one:
> >>
> >>         /* Drop ref for ap->pages[] array */
> >>         folio_put(oldfolio);
> >>
> >> I don't know fuse very well.  Maybe this isn't it.
> >
> > Yeah, this looks it to me. We don't grab a folio reference for the
> > ap->pages[] array for readahead and it tracks with Mantas's
> > fuse_dev_splice_write() dmesg. this patch fixed the crash for me when
> > I tested it yesterday:
> >
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index 7d92a5479998..172cab8e2caf 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -955,8 +955,10 @@ static void fuse_readpages_end(struct fuse_mount
> > *fm, struct fuse_args *args,
> >                 fuse_invalidate_atime(inode);
> >         }
> >
> > -       for (i =3D 0; i < ap->num_folios; i++)
> > +       for (i =3D 0; i < ap->num_folios; i++) {
> >                 folio_end_read(ap->folios[i], !err);
> > +               folio_put(ap->folios[i]);
> > +       }
> >         if (ia->ff)
> >                 fuse_file_put(ia->ff, false);
> >
> > @@ -1049,6 +1051,7 @@ static void fuse_readahead(struct readahead_contr=
ol *rac)
> >
> >                 while (ap->num_folios < cur_pages) {
> >                         folio =3D readahead_folio(rac);
> > +                       folio_get(folio);
>
> This is almost the same as my patch, but balances the folio_put() in
> readahead_folio() with another folio_get(), while mine uses
> __readahead_folio() that does not do folio_put() in the first place.
>
> But I think neither patch proves the extraneous folio_put() comes from
> fuse_try_move_page().
>
> >                         ap->folios[ap->num_folios] =3D folio;
> >                         ap->descs[ap->num_folios].length =3D folio_size=
(folio);
> >                         ap->num_folios++;
> >
> >
> > I reran it just now with a printk by that ref drop in
> > fuse_try_move_page() and I'm indeed seeing that path get hit.
>
> It might get hit, but is it hit in the readahead paths? One way to test
> would be to instead of yours above or mine change, to stop doing the
> foio_put() in fuse_try_move_page(). But maybe it's called also from other
> contexts that do expect it, and will leak memory otherwise.

When I tested it a few days ago, I printk-ed the address of the folio
and it matched in fuse_readahead() and try_move_page(). I think that
proves that the extra folio_put() came from fuse_try_move_page()
through the readahead path.

>
> > Not sure why fstests didn't pick this up though since splice is
> > enabled by default in passthrough_hp, i'll look into this next week.
> >
>
