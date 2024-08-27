Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FEF1993A3
	for <regressions@lists.linux.dev>; Tue, 27 Aug 2024 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724748494; cv=none; b=X3qfcCTQXSKdSdzno245i19mZhMDcD4/21mDzLqH9b3jQtCyGLC5KrTd8r7MawgAEgnojPhQWnjPXbKHqj4J8zY2L24cLMZba+8JTWnTDkwHvuZsEeKDwuGap4fv9dd8qb4vuiIBNIz4t30dIzQoLn1DJDIqQbOXi/GNitkA+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724748494; c=relaxed/simple;
	bh=lyUq6uzIFLGApAFk8uAkLlzZWO6fwqnEeSVsD5zPCLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+34FUQKaMDM7U+Dp/UGZ8qqRSQXaShH7c+UpgFLPxLRQmaGIiXePhIlWQHejRUXEbpeSZBW0CGjes2wRkLCANSSeqfwvNZBYwJRzgwRqjWjP9i15/O8aJvAzZfB97dqRGf+Pvqzyhn8uGlZ1Ea7219BeFMuCj5J5w5Zt64H02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXsZje3q; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXsZje3q"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f401c20b56so45474921fa.0
        for <regressions@lists.linux.dev>; Tue, 27 Aug 2024 01:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724748491; x=1725353291; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kDKIOwTEd6w8yb+ASnRf9bhshqBEl1pUBH6pCnSK/I=;
        b=QXsZje3q3BrCqb/4mo9DIK795W66D9w9QeETGCwWQz8s/vLJaeMQDROSwGu9Px80as
         1D9vOdpH5eNbW842OiGhnjHKOW9144C4EOwNQoV/7mA3xETL3lFG4EqJupz5gU93Vs7r
         PxCTruG37ZBzJHWeHOHdQoqzXUvi6js3xUckVBRwC2Gt5l8W37q6fX+2RF8DKZMotHHe
         n2BbaoKRRiVnQfmZwQwNdqqnKElbjQ/XoKpBGu+7TXC4fFsn/2sC5NU56iZ2H2QC/ZdU
         d+EO8NQVNQnoEG+FEUW3o/UNgLsfSxasMLSDgd7u+6V0f05tY5Nu92kCJPbwnr/OYJf7
         XI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748491; x=1725353291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kDKIOwTEd6w8yb+ASnRf9bhshqBEl1pUBH6pCnSK/I=;
        b=KrAAylES3LZ2elEixAxcAu51vIAMAKIWXxB9jcIQv4G2iOKh7WdXKxfPaz9oGzlAX5
         px3X9rHIVUvb33QGokrRI0qBG4tKBMTot0qJLSSRIEozMSlnf7ZLCtw29UI/TWR2Jr5u
         BM4ZH8dh/tLMV9JSsjozuzXtltmtzd02FH3c+fcAqPUDSCJeyaCIYbFTI+j5ZE9D8HG0
         R3kRgXdl0jN6L7WSWOcKYJoc5yIW5SIuIQ9vlygpOBW/fLezp7u4VkZvXVM8tKFgkkva
         8jmqdaJcdtshB7+8BPIp3bJ0zvrTN4oiNpGZTpNxykc8z7DNN1RE8kN/XpFARDtFVDU9
         bIsw==
X-Forwarded-Encrypted: i=1; AJvYcCXJgtc4Aty5ni5VL+JwRTPSnYDeQpB79njs5yObx4zQu/TPf80HAsEAEDmyr4J6ydl/pR4h1SdiLbzoGg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7It7KtKl+vMNVwxRFVqnLG3UHqkFq+bhc9toJN7Z+I1hMCD8f
	cHL48krcYCX+JWQFQK8qGKHFQmOsLMqfAD+Vd4OHoHAV40FvIKi+cXjM5Vt8iJ2vHJZg0p267jg
	yS3TnFdT9F/U22A7+7WujO0KS81c=
X-Google-Smtp-Source: AGHT+IHfzEjvAa6juUPHsEOAGjLWPcwPUMqsodqfndjPZiVuX++xmoBVqhxYgl03omfSpxoIUvlKwJD7cx+EtDranMw=
X-Received: by 2002:a05:651c:b0a:b0:2ef:1c05:6907 with SMTP id
 38308e7fff4ca-2f514b7a52bmr8112801fa.5.1724748490547; Tue, 27 Aug 2024
 01:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
 <CA+G9fYtd1Hw9YLpceUAwwC+UytVQVXOET4gmGT9jiCgHa+WexQ@mail.gmail.com>
 <CAMgjq7Bz0DY+rY0XgCoH7-Q=uHLdo3omi8kUr4ePDweNyofsbQ@mail.gmail.com>
 <20240819220548.d8f1ea5cf504cfd8feb5780e@linux-foundation.org> <CACePvbVJab1QNv35jepKYVdXV1Brnn=sTwBx7Vs5fr-93jDQvQ@mail.gmail.com>
In-Reply-To: <CACePvbVJab1QNv35jepKYVdXV1Brnn=sTwBx7Vs5fr-93jDQvQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 27 Aug 2024 16:47:54 +0800
Message-ID: <CAMgjq7A7k7FvZM=cGXiz9q9YuQD4iH5H_Og4wY0ENSgHiVdDYg@mail.gmail.com>
Subject: Re: gcc-8: mm/swapfile.c:863:40: error: array subscript 1 is above
 array bounds of 'struct list_head[1]' [-Werror=array-bounds]
To: Chris Li <chrisl@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Barry Song <21cnbao@gmail.com>, 
	"Huang, Ying" <ying.huang@intel.com>, Hugh Dickins <hughd@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 4:51=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote:
>
> On Mon, Aug 19, 2024 at 10:05=E2=80=AFPM Andrew Morton
> <akpm@linux-foundation.org> wrote:
> >
> > On Mon, 19 Aug 2024 19:44:25 +0800 Kairui Song <ryncsn@gmail.com> wrote=
:
> >
> > > --- a/mm/swapfile.c
> > > +++ b/mm/swapfile.c
> > > @@ -836,7 +836,7 @@ static unsigned long cluster_alloc_swap_entry(str=
uct swap_info_struct *si, int o
> > >               goto done;
> > >
> > >       /* Order 0 stealing from higher order */
> > > -     for (int o =3D 1; o < PMD_ORDER; o++) {
> > > +     for (int o =3D 1; o < SWAP_NR_ORDERS; o++) {
> > >               /*
> > >                * Clusters here have at least one usable slots and can=
't fail order 0
> > >                * allocation, but reclaim may drop si->lock and race w=
ith another user.
> >
> > OK, I got that landed in the right place, but...
> >
> > The definition of `o' within the for statement isn't typical kernel
> > style - I'm surprised we didn't get a warning for this - maybe things
> > have changed when I wasn't looking.
>
> Noted.
>
> I did use the checkpatch.pl and fixed all the warnings before I sent
> the patch out.
> The checkpatch.pl script did not complain about this. Sure I can stay
> away from it.
> BTW, I did  a search on the kernel tree:
> $ rg 'for \(int' | wc -l
> 970
> $
> It seems pretty common in the kernel tree now.

Might be off topic from the issue...

I believe this issue it's not an upstream problem nowadays after
e8c07082a810 ("Kbuild: move to -std=3Dgnu11"), I did notice a GCC error
after backporting these commits to an older kernel which still used
c89, but for upstream this should be OK?

>
> >
> > Also, this code makes no attempt to honor our "The preferred limit on
> > the length of a single line is 80 columns" objective.  There's just no
> > reason for comment blocks to violate this.
>
> I was wondering why the checkpatch.pl did not catch this, is there any
> config for checkpatch.pl I should apply?
>
> I typically invoke:
>
> ./scripts/checkpatch.pl -g HEAD

I found checkpatch.pl stopped checking for 80 columns limit after
commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
warning") 4 years ago. But the 80 column limit seems still preferred?
