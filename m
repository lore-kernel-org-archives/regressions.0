Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CC518A92F
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143914; cv=none; b=lbki014RZOz1OmJcr1HfEjVYNjpopxVGZEX5+GzX/KXXj39czcmcLGwJyd0GyGqJ94OwiAExq0GduIjlpfE+eLLxq2YX2IcBuHg+WJvFd+qEy2uuBTwNEeKvmSOnDAz0nZoZuJtnEMw+LjPgLeH/WLZxQYwGNvWa0jBy8F/3/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143914; c=relaxed/simple;
	bh=aRtmfwa41KbvJpBtEG0xyqAIhPLHL0cgBA1BUt6g5nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxqrE/bdBcTS5eWeizIqSqpY7Tj3nYlFQgbRaNpZMR8OyUk/qXYMMp7osJCNXqQD2KqZJeekrbSMEfCn1MH1hcW++FXIM++URJsvdunSw+cr3dIiuc5slovQWyWYmuBP1fV4Uoeb6dlJZur1GgktIAfUB6Ve8xi4ZJFlVHt858Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwkBU4Hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwkBU4Hx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8092EC4AF09
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724143913;
	bh=aRtmfwa41KbvJpBtEG0xyqAIhPLHL0cgBA1BUt6g5nU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BwkBU4HxsXXYdU1DsYJratr6oVrmlL2J54yUo6KJ3tP+TzkrNs3oCrlVg1sDFscZO
	 pQleFa07fQK49e6D/P3wD6pBOHv/EDDGl3R8BerbflISBu921VymQ2+LMNydFiMaMx
	 QYAO0MsEYJzA6uiYgwN4w137YRwlTIdW7o46nEuXpicqLXbhprJSG6nsjFySv6ru/Z
	 dZL9fvaN89kW+1fdQh9BC286KbfiuHu7ddY33XHp39BlTxNk2k9XR2GHcEA5DS7jIm
	 Xfcifbv80vAkGQkPEEI9qUmuT6U0qR2ZiaclVuq4TkaxweZyWttB/DJFhePcvT6bEh
	 nAC0FT8gevCdQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b8f13f28fbso19591497b3.1
        for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 01:51:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIvG5A/+/oVub1nzTPSn0YiaF3kJOpcdcm/3+uymbJkxNTIiCOqIXkUbw7QCbfNGGOYDsuXaNB9fesWA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9r9yRZ2zaCf51lirYADxNOYVVVoJIunsNjbYwVXS2msUL24Ne
	7bMImve8bPLzz038AxYgsuW07NAXYsE1yBQeD1/Xzo+LkRe/4gBsPKX0L8T+87u9EMTYNiGoO1G
	W+Yq9uRaEoJrDM+cw17aEF4y6xnUytr8nBz12CA==
X-Google-Smtp-Source: AGHT+IEmmoeqfU/Vmqbo3i0PjsAsSPy53NIgemG+gy7TCNUOV3AIZvu8sh1dimmf/6vMJwpAajg3PCQCOhGk9eJe+cY=
X-Received: by 2002:a05:690c:2fca:b0:65f:7cee:43b with SMTP id
 00721157ae682-6b1b8bedbddmr121899137b3.19.1724143912766; Tue, 20 Aug 2024
 01:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFDon59=Nw6WCdgp0FanZ1oE3dCkoq71EK0Bxe6Jhe_g@mail.gmail.com>
 <CA+G9fYtd1Hw9YLpceUAwwC+UytVQVXOET4gmGT9jiCgHa+WexQ@mail.gmail.com>
 <CAMgjq7Bz0DY+rY0XgCoH7-Q=uHLdo3omi8kUr4ePDweNyofsbQ@mail.gmail.com> <20240819220548.d8f1ea5cf504cfd8feb5780e@linux-foundation.org>
In-Reply-To: <20240819220548.d8f1ea5cf504cfd8feb5780e@linux-foundation.org>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 20 Aug 2024 01:51:41 -0700
X-Gmail-Original-Message-ID: <CACePvbVJab1QNv35jepKYVdXV1Brnn=sTwBx7Vs5fr-93jDQvQ@mail.gmail.com>
Message-ID: <CACePvbVJab1QNv35jepKYVdXV1Brnn=sTwBx7Vs5fr-93jDQvQ@mail.gmail.com>
Subject: Re: gcc-8: mm/swapfile.c:863:40: error: array subscript 1 is above
 array bounds of 'struct list_head[1]' [-Werror=array-bounds]
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <ryncsn@gmail.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Barry Song <21cnbao@gmail.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Hugh Dickins <hughd@google.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 10:05=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Mon, 19 Aug 2024 19:44:25 +0800 Kairui Song <ryncsn@gmail.com> wrote:
>
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -836,7 +836,7 @@ static unsigned long cluster_alloc_swap_entry(struc=
t swap_info_struct *si, int o
> >               goto done;
> >
> >       /* Order 0 stealing from higher order */
> > -     for (int o =3D 1; o < PMD_ORDER; o++) {
> > +     for (int o =3D 1; o < SWAP_NR_ORDERS; o++) {
> >               /*
> >                * Clusters here have at least one usable slots and can't=
 fail order 0
> >                * allocation, but reclaim may drop si->lock and race wit=
h another user.
>
> OK, I got that landed in the right place, but...
>
> The definition of `o' within the for statement isn't typical kernel
> style - I'm surprised we didn't get a warning for this - maybe things
> have changed when I wasn't looking.

Noted.

I did use the checkpatch.pl and fixed all the warnings before I sent
the patch out.
The checkpatch.pl script did not complain about this. Sure I can stay
away from it.
BTW, I did  a search on the kernel tree:
$ rg 'for \(int' | wc -l
970
$
It seems pretty common in the kernel tree now.

>
> Also, this code makes no attempt to honor our "The preferred limit on
> the length of a single line is 80 columns" objective.  There's just no
> reason for comment blocks to violate this.

I was wondering why the checkpatch.pl did not catch this, is there any
config for checkpatch.pl I should apply?

I typically invoke:

./scripts/checkpatch.pl -g HEAD

Let me know if there is a better way to invoke checkpatch.pl to give
more warnings.

Chris
