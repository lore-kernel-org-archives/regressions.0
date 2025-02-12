Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5C21129C
	for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 18:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739386101; cv=none; b=frqlPYFHI9Y2UNaFO+RpuXCVahritcwLGXdToNQkNc9u2nsBd6m0hnW7gZIWBKqQH9fg1V9+qWwX8IyEO/l6iAmVbN1cHWSodbpflgOziXzm0J9wUG0Q2uCYfFZqoPvBpLsom/WuX09u2grHos2gneCgO3ZnEM+47JoH9Mtuxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739386101; c=relaxed/simple;
	bh=Eqpyg4hmNu9ocUQzEcAGhdpaBhKdg5oflZSaKCbqwL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsEK6N/LYl/SKaZhslMCBNHbxafUzAcxTicsIX5Ez896GJyWNyq4vr5MGpRXR/kb7yrAhV6IcJNC9xaT3+AHyl84O2dLuAMKyJsq5uxDcw79DSwEO/Vcju3+wJWf6ntlK4IDvrC5ZArpCjfRry/7sYzf2G4eok0slG+v209j694=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arqO0lcH; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arqO0lcH"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-471bef62e12so24361cf.0
        for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 10:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739386099; x=1739990899; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZASkp6PCL8/WlHtTvN4bXlrF7OXxOuY1zeD3mdzMNtA=;
        b=arqO0lcHDd1mku0BTDdPGmPO2d7V8XucI+lVGJwYBufOYVEVtHt16XErTwMBvhvGN5
         W1vc6GThVu9f5Vv8Rk4Cj+jw8c4SH8eIkz8fZb8o2WcY4D8WVrO1o7S7QaMU2A8ukB5N
         /Gm+BEy63ZYNEFJJHDPKi+VrfiX31P1UK1ELoZHFJcbYkr77qh6lgKUkV7kfjqlrGPks
         GMzBIpaie6Py0BvYm2keOwTvsa9YEKDFyN5ZqcQPqfDoxBMirLBNdLzM5/B/0UwawfE5
         WEsLyQ71N48hPXg3mMB8rwR7gkOoecx98QCbhNagIMwxCgCd/RmExqLuxl7JdDvs65AK
         s6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739386099; x=1739990899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZASkp6PCL8/WlHtTvN4bXlrF7OXxOuY1zeD3mdzMNtA=;
        b=r9aM0iEfLScUI6IN/PEwaEyvVrPGqXFGKqEBFVOFjrq6HlqlIezoFtJqttInrxeDeO
         4PAGnwhv20UsOjpSkKtrVdZ0Bk5BKRF9p4CXFy1CwGMZfOkVhDpQ2A3ICwCSJO9LjA4M
         B6PuXwB14R1+JSE8cA6ICiIprp6IMUMq9t1v1e1R7+CwN0GsNnFElWPSq4JgbuWjFJga
         GvnEUKvUDAVI92MJdMGYz9dPj0Qc3ML6LH5/5jdB6jl8KcBs8OcsWMudf+eGSyTnTGTZ
         YKf2i5jYzp4ZkCT6ZsOxxlXMATqREVfEgv5vq/qojnUooBeFZx/+TH29PqzthziscW/W
         NCJw==
X-Forwarded-Encrypted: i=1; AJvYcCVfbXtWKmEaA0Hr2I4IIWBQlFdxABg2tx+eK12H0yoxkPK+7urFxHmrJbJbNwFxGi4X0j16IjTpmIYUbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUfebAoowhN5WagEZo11ZyTct1bDKFuIe046yIS+nG5w1PG6yI
	KtM0lABR0gTXF/GjWvjO3OM/h5DkhuOvAhDuDE2+ukzd9VQjcf7T8mEjfe6YCwqHsrjn/XhFLYX
	ieYOEf0r8XoaruDu2+F8apvrAcAc=
X-Gm-Gg: ASbGncu2ShjkqujoO/gyfeHvuDhNqQRmJOFhtt7Fb89BG/w1RRCnCMM4dP2Bcgh/w8h
	1TfwTXLsyfWVPxf7Bm5h5x1kAQj6U6QEpal9GOH97hf4PCiu0B1qtypI8/VMMeAhwKtKMLIzO3C
	XLPttH/9ctTxU=
X-Google-Smtp-Source: AGHT+IFlFkV7aYZs2utz/iZsBLLt0+a7zY/YwhAWQu45D2zt1uVzJM7iX/axNKQZ5Z6o1mUaT0iyZJqMYKvLu5Nm+Nc=
X-Received: by 2002:ac8:5a0c:0:b0:461:646c:b8fc with SMTP id
 d75a77b69052e-471afe505d8mr65715981cf.23.1739386098867; Wed, 12 Feb 2025
 10:48:18 -0800 (PST)
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
In-Reply-To: <CAJnrk1aY0ZFcS4JvmJL=icigencsCD8g4qmZiTuoPWj2S2Y_LQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 12 Feb 2025 10:48:07 -0800
X-Gm-Features: AWEUYZk-0djWTKrtRmi8VrGFoz0pLfNoKipNM8dCPw51QEUcZp_d7Q09JdxuGyQ
Message-ID: <CAJnrk1YB5c+wO0U=7aOiWAMaMwQCKUL1-FuvuPMjnB_gnjD28w@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Josef Bacik <josef@toxicpanda.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Christian Heusel <christian@heusel.eu>, 
	Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 7:46=E2=80=AFAM Joanne Koong <joannelkoong@gmail.com=
> wrote:
>
> On Sat, Feb 8, 2025 at 2:11=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
> >
> > On Fri, Feb 07, 2025 at 04:22:56PM -0800, Joanne Koong wrote:
> > > > Thanks, Josef. I guess we can at least try to confirm we're on the =
right track.
> > > > Can anyone affected see if this (only compile tested) patch fixes t=
he issue?
> > > > Created on top of 6.13.1.
> > >
> > > This fixes the crash for me on 6.14.0-rc1. I ran the repro using
> > > Mantas's instructions for Obfuscate. I was able to trigger the crash
> > > on a clean build and then with this patch, I'm not seeing the crash
> > > anymore.
> >
> > Since this patch fixes the bug, we're looking for one call to folio_put=
()
> > too many.  Is it possibly in fuse_try_move_page()?  In particular, this
> > one:
> >
> >         /* Drop ref for ap->pages[] array */
> >         folio_put(oldfolio);
> >
> > I don't know fuse very well.  Maybe this isn't it.
>
> Yeah, this looks it to me. We don't grab a folio reference for the
> ap->pages[] array for readahead and it tracks with Mantas's
> fuse_dev_splice_write() dmesg. this patch fixed the crash for me when
> I tested it yesterday:
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 7d92a5479998..172cab8e2caf 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -955,8 +955,10 @@ static void fuse_readpages_end(struct fuse_mount
> *fm, struct fuse_args *args,
>                 fuse_invalidate_atime(inode);
>         }
>
> -       for (i =3D 0; i < ap->num_folios; i++)
> +       for (i =3D 0; i < ap->num_folios; i++) {
>                 folio_end_read(ap->folios[i], !err);
> +               folio_put(ap->folios[i]);
> +       }
>         if (ia->ff)
>                 fuse_file_put(ia->ff, false);
>
> @@ -1049,6 +1051,7 @@ static void fuse_readahead(struct readahead_control=
 *rac)
>
>                 while (ap->num_folios < cur_pages) {
>                         folio =3D readahead_folio(rac);
> +                       folio_get(folio);
>                         ap->folios[ap->num_folios] =3D folio;
>                         ap->descs[ap->num_folios].length =3D folio_size(f=
olio);
>                         ap->num_folios++;
>
>
> I reran it just now with a printk by that ref drop in
> fuse_try_move_page() and I'm indeed seeing that path get hit.
>
> Not sure why fstests didn't pick this up though since splice is
> enabled by default in passthrough_hp, i'll look into this next week.

This wasn't hit in fstests because passthrough_hp doesn't set
SPLICE_F_MOVE. After adding that, I was able to trigger this crash by
running generic/075. I'll send out a libfuse pr for this
