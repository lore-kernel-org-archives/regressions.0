Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A01188001
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429306; cv=none; b=fEEwLroPi/B/S6m2XnZdCeTdhaSWqqufJh5vxamFMnnKjJ9MrRBgw+L4QGUzRYTLG3xPZI0qVqjIIJ7ZijGp1zwfEEIefwyDjkOiX5PvPJIlSOZYTdEObtJXU0MmHM7Gtj3GEpsyAMgDIkPlVz3mBJVDlK1LD2dlK1zgE7nPYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429306; c=relaxed/simple;
	bh=+ZasLi+hclkNjCek93y8gPQorkAqqJ6TQAwzl8Op0MY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUlaI2VvbnS3qJPE0eI4EQ+/jpwll82YBvE+LJMxfH8bRRV4n8aRikyaA1Nd4MVqw1Y5Xd1qcTHFO7H1c5u3bEYdxD2V3VbiSPkyo4GQEJp4VuQbWGPdyk3+zVu/7RhI4vlPJF+UCuIk3OzUZeVgr1j/03sOAwpCKJUflSwu5Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P9rINcU1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P9rINcU1"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efdf02d13so3139908e87.2
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724429303; x=1725034103; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60mDZjLohoH/Srn+FzsRdN5LB7GzcubV5MgxDtoHqBs=;
        b=P9rINcU1M1FCedPhYfif4Q0OI4QaEWYLJhQPPh3zAMqfND28NX+7kmJrZgwBcyrIsV
         sZI7KdhZwXiJEFs6U5Z13AjKMxgGDO3Zp/9pflTEOXQ+Us1gkFGpXXELVcugQeqktrz4
         Pg+0q1HLro1GdclYFOdZePdsDDiLRLWKz2ftc5LROn7zb/eOpMmlfjvYj1Dihriq1wqL
         kz6//5WckJzcuZmoitAv/s3cHzY78IqIq5G6g21QkbOuSL62p3DBt1vMTZh2a9wxQk+K
         HKI3Acgsk1XdGhaWpJUMwk/YssfT8Daoqj4gtrfXuziymyue8nPY4w4Kiq5jkhWkRgkh
         kyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429303; x=1725034103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60mDZjLohoH/Srn+FzsRdN5LB7GzcubV5MgxDtoHqBs=;
        b=epIrAhazCa2UeTXrRxOS8Ax289ZZSB/oKKSMhAXNBPqzIrJblqYzmpfKp0aJFAAfVp
         6mPCA2JT//YFWIGPUwkSBY+KHbIxP5Hjka/kagGeDP3kK3dpRsI5DiC/NZT8vvBQjs+D
         PVjvIRlAXrwqNEGypD7z2iyTKqDBr2mZX/0cVv1p9SbZeD2+Xu3plqLWte+oEVpm9iNk
         cw/IIpzbMa22TPiRxDggHK9mzsKWiYCSUioG2/BZ9k1nW8BLSIeBWvkKmn+xPZAqmnnG
         JyQSe/oFAlU78SXaOMUD74JDiEa+901KD8Q8Cgbthng7bGuZnZKwR5Tr8xTXLI2C61ri
         8gMw==
X-Forwarded-Encrypted: i=1; AJvYcCVfzqHk1Z/MgYN+nRcbWHBP7sZi5bTYdD2KoDC4axI4JH/88do/Mp0YEr1/MgMY2apZjJAW+HFXLZ5clg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzecKJMBoNo1ltVX7HJ1ql8lZnmWIZVgMmzxuzE5cscVmQLvIbl
	3nxrm6znOWzYpbhgnDghg7/rrozXFT7oyAUDmrN3MwOOpIX47+l48yGWbNFlzTpGbVhSn1FwRTh
	MBd9ZEtcEhu0XrwhXowqnRnDo6Pu9TbDRwnGy
X-Google-Smtp-Source: AGHT+IFzWoZ4n+2CZWNfhdJAMZParmTzQohv9bRH0x15mgayHZBeNg5k4entByf4z9D7oSlR7pVx0fhye36Aap4RFO0=
X-Received: by 2002:a05:6512:234b:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-534388510cdmr2797061e87.28.1724429302210; Fri, 23 Aug 2024
 09:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info> <ZsiLElTykamcYZ6J@casper.infradead.org>
 <CAKEwX=PEye=VcXF=r-A9B47VsNtpLLxz5cJiswzuQXBio8rizA@mail.gmail.com> <Zsig_AZDT5zOO1Wg@casper.infradead.org>
In-Reply-To: <Zsig_AZDT5zOO1Wg@casper.infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 23 Aug 2024 09:07:44 -0700
Message-ID: <CAJD7tkbO938ETJn0FOG_vVU4V2_dBanio1QG56cp6ctFHpSeNw@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Matthew Wilcox <willy@infradead.org>
Cc: Nhat Pham <nphamcs@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:47=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Aug 23, 2024 at 10:35:19AM -0400, Nhat Pham wrote:
> > On Fri, Aug 23, 2024 at 9:13=E2=80=AFAM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > >
> > > That said, zswap could handle this better.  There's no need to panic =
the
> > > entire machine over being unable to read a page from swap.  Killing j=
ust
> > > the process that needed this page is sufficient.
> >
> > Agree 100%. It is silly to kill the entire host for a swap read error,
> > and extra silly to kill the process because we fail to writeback - for
> > all we know that page might never be needed by the process again!!!
> >
> > >
> > > Suggested patch at end after the oops.
> > >
> > > @@ -1601,6 +1613,7 @@ bool zswap_load(struct folio *folio)
> > >         bool swapcache =3D folio_test_swapcache(folio);
> > >         struct xarray *tree =3D swap_zswap_tree(swp);
> > >         struct zswap_entry *entry;
> > > +       int err;
> > >
> > >         VM_WARN_ON_ONCE(!folio_test_locked(folio));
> > >
> > > @@ -1638,10 +1651,13 @@ bool zswap_load(struct folio *folio)
> > >         if (!entry)
> > >                 return false;
> > >
> > > -       if (entry->length)
> > > -               zswap_decompress(entry, folio);
> > > -       else
> > > +       if (entry->length) {
> > > +               err =3D zswap_decompress(entry, folio);
> > > +               if (err)
> > > +                       return false;
> >
> > Here, if zswap decompression fails and zswap load returns false, the
> > page_io logic will proceed as if zswap does not have the page and
> > reads garbage from the backing device instead. This could potentially
> > lead to silent data/memory corruption right? Or am I missing something
> > :) Maybe we could be extra careful here and treat it as if there is a
> > bio read error in the case zswap owns the page, but cannot decompress
> > it?
>
> Ah; you know more about how zswap works than I do.  So it's not a
> write-through cache?  I guess we need to go a bit further then and
> return an errno from zswap_load -- EIO/ENOENT/0 and handle that
> appropriately.

It should work if we just return true without calling
folio_mark_uptodate(), this is what we do if we get a large folio in
zswap_load(). Returning true means that the page was found in zswap,
so we won't fallback to reading from the backing device. Not marking
the folio uptodate will cause an IO error IIUC.

>
> > The rest seems solid to me :)
