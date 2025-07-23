Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF3A95C
	for <regressions@lists.linux.dev>; Wed, 23 Jul 2025 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753312547; cv=none; b=VI66kTerNwKCqw5L/vdKMs2tA66BN3Xla8yIyD0DGCwGWks5mW1mdh55o0Pl9fD3tgNIXzl+HCMtYI8vsahAJUoTVOkRBGETRA7D9F62HpLKlUWXoab7oQubp6wOv708+7FBwAnnY8J9aWhYXHSvx5kFopzBvPvQsF/CXrBy62g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753312547; c=relaxed/simple;
	bh=E5cSYP9Df+TljGPWXIKBw0DaiY/s25HdMasFrgai4/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/qCNHWXXNf2XQlDLDep9w4tq3DOJ+ZFn6Q0VBkb97pKVzI72DZSs4zj6PMjMvawgO38KtkIS4lnqxCjgoD73a6sZfr68J7p25Q4PUbsSRJmv1H3FVGLjvCYknRo7VdLbFGjdbMzHiUKqk7ryLQ2DsVH6DFEuDdxRB6F7hMVDts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKuLEF7P; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKuLEF7P"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4abc006bcadso6356301cf.0
        for <regressions@lists.linux.dev>; Wed, 23 Jul 2025 16:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753312545; x=1753917345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxqvVKjKnRdjeHonK2NyXvcj4D2dnGAOtk2uNs8xY1k=;
        b=WKuLEF7Px73ethbUfXTZVL9RBMuZOtgEOTfSsMpxf64tvMuhMm9z+i/uR1dhFH1F8a
         1H2xMqm+4CppsC89KUB4ZXoj6QSi7aUczqvO48cSVPm7SMoK0i3Giih7v0qXWdk0lMkW
         D5wCGPhHRdM/8vgchu7k3DDvrhhMz9+dVl5iE+CQzr//Nw7TdF1rJu/kI2lJLrTtUJzY
         A76CzEu0wGxVGeQWFmHnUS5qB+xzKnPmPniZnaI2qlrbx27P3ZqzUefUOOvI+mxxhjfu
         bvsPd+bgFFiKg0iRBZ3ZlTcdpa6uB7EZdGFs+FPqaTLzjjLW9+KgnK4xrzkBwFIaeRVt
         IE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753312545; x=1753917345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxqvVKjKnRdjeHonK2NyXvcj4D2dnGAOtk2uNs8xY1k=;
        b=kKnvV2hkEng/IBhk2v41NrCSM0D6YwqterOcNXWwQePz3t3cEZ9M3y9l7r6VwfBi36
         W4mRRnyI3PVPSf9NXhrRNmpkSyrRZFazJTXiY+4qWct9nbNfrNNDznRtI302okuyI/KK
         nM8HBXf4k+ryPUWp/LYQ3K38QyVDS6/4kiThsEJZXjSfynRcDYtVvTY3/Ca+pnlbKTYt
         gtha0meCISiVedTWO+gegQuzK5LHc7Xi1il51aBx+3Sjy3EcUu9vx++ukd7cSE3F88uu
         +7Mci95PmlAVojZCPyHa9nlzi5zYeJXyuwZMvUBAJQLDcx9fT4UAbcELfu0xxl26+rdL
         J0rA==
X-Forwarded-Encrypted: i=1; AJvYcCUjhrjeP8qMo7uBamx6HK29YrcrlFeX+ikd9HKEWby0iMn1e/yVgD09NvJQvNX26YdcpevS0BcYD0Q8Kw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0I5JJPnKVgaN232QLM95xANHiu2sQ0H1/pI59ffw8V9KA0J5s
	Br25u2n4lX03j4jkvMrS4jtjnFUiq+0MT8jcTnd175I5rKfw9rWjxNyuU3+syfzE5DXjbvCNV+x
	n8pu4EJpBQVtIsWvrrfPoeph6izH5OAKgIqu7kcc=
X-Gm-Gg: ASbGncupQM6e99nvoG9UdrNn1XmYnmnop9H6RET/1kqa2v+NRSvdmh25nuAJ4EclX7y
	MdDbcvTmmA+TPaizlot5Ur2FibLOMPv44vnxScDbcPnb8ciVYdr8MsavvLaF/zBfMF33I6PqhLv
	8/f9bX4jm+SCGWFGp0jvw/JXpT0eDvvI/C4pmgVCAqgJ2NK9MTSMQPBIjKkLAFtX/lUOCfgFKSm
	lHDXpw=
X-Google-Smtp-Source: AGHT+IHlNadpmRVQnR9L5YwWXi/1q37lybj6swrt7fqmXQJSoFTFUz5IAk16c+9UoZdKYXY5a3Cl5vtnEtFqYipHQyY=
X-Received: by 2002:a05:622a:4d1:b0:4a7:a8a:eed with SMTP id
 d75a77b69052e-4ae6dfc2323mr97483581cf.39.1753312544328; Wed, 23 Jul 2025
 16:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYs5AdVM-T2Tf3LciNCwLZEHetcnSkHsjZajVwwpM2HmJw@mail.gmail.com>
 <20250723144637.GW2672070@frogsfrogsfrogs> <CAJnrk1Z7wcB8uKWcrAuRAZ8B-f8SKnOuwtEr-=cHa+ApR_sgXQ@mail.gmail.com>
In-Reply-To: <CAJnrk1Z7wcB8uKWcrAuRAZ8B-f8SKnOuwtEr-=cHa+ApR_sgXQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 23 Jul 2025 16:15:33 -0700
X-Gm-Features: Ac12FXzF2620xp8RVAUCjDRQn0A4HBT9-5mF3yOk4tFXX3gskarUrR9Z58ZmyE8
Message-ID: <CAJnrk1ZREcrd=FNUYLVWwXUeJ3mJz9J+aqyEvoHkyG3RrJ2QkA@mail.gmail.com>
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

On Wed, Jul 23, 2025 at 11:42=E2=80=AFAM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Wed, Jul 23, 2025 at 7:46=E2=80=AFAM Darrick J. Wong <djwong@kernel.or=
g> wrote:
> >
> > [cc Joanne]
> >
> > On Wed, Jul 23, 2025 at 05:14:28PM +0530, Naresh Kamboju wrote:
> > > Regressions found while running LTP msync04 tests on qemu-arm64 runni=
ng
> > > Linux next-20250721, next-20250722 and next-20250723 with 16K and 64K
> > > page size enabled builds.
> > >
> > > CONFIG_ARM64_64K_PAGES=3Dy ( kernel warning as below )
> > > CONFIG_ARM64_16K_PAGES=3Dy ( kernel warning as below )
> > >
> > > No warning noticed with 4K page size.
> > > CONFIG_ARM64_4K_PAGES=3Dy works as expected
> >
> > You might want to cc Joanne since she's been working on large folio
> > support in fuse.
> >
> > > First seen on the tag next-20250721.
> > > Good: next-20250718
> > > Bad:  next-20250721 to next-20250723
>
> Thanks for the report. Is there a link to the script that mounts the
> fuse server for these tests? I'm curious whether this was mounted as a
> fuseblk filesystem.
>
> > >
> > > Regression Analysis:
> > > - New regression? Yes
> > > - Reproducibility? Yes
> > >
> > > Test regression: next-20250721 arm64 16K and 64K page size WARNING fs
> > > fuse file.c at fuse_iomap_writeback_range
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > ## Test log
> > > ------------[ cut here ]------------
> > > [  343.828105] WARNING: fs/fuse/file.c:2146 at
> > > fuse_iomap_writeback_range+0x478/0x558 [fuse], CPU#0: msync04/4190
> >
> >         WARN_ON_ONCE(len & (PAGE_SIZE - 1));
> >
> > /me speculates that this might be triggered by an attempt to write back
> > some 4k fsblock within a 16/64k base page?
> >
>
> I think this can happen on 4k base pages as well actually. On the
> iomap side, the length passed is always block-aligned and in fuse, we
> set blkbits to be PAGE_SHIFT so theoretically block-aligned is always
> page-aligned, but I missed that if it's a "fuseblk" filesystem, that
> isn't true and the blocksize is initialized to a default size of 512
> or whatever block size is passed in when it's mounted.
>
> I'll send out a patch to remove this line. It doesn't make any
> difference for fuse_iomap_writeback_range() logic whether len is
> page-aligned or not; I had added it as a sanity-check against sketchy
> ranges.
>

https://lore.kernel.org/linux-fsdevel/20250723230850.2395561-1-joannelkoong=
@gmail.com/T/#u
is the patch for removing this
