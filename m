Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43B18951C
	for <regressions@lists.linux.dev>; Thu,  5 Sep 2024 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725524410; cv=none; b=SSsgicK8Cv85Qw+BZ0moWWmzKiKEOAU6Epc0PhDX2FtDCMfjLBzFxuWc9ZVmMdRK1gkJ4rT7Q6Hah3s7pJc4Uze6RHMAEsixiytEw7hS+ZCiY9eCAwH6sfbj2xuvusYkbNvDNyzUsJypP48wWUs47OAjVff0PlM89p9id7RtjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725524410; c=relaxed/simple;
	bh=hNS1xguVDWQNKTijPRMZFqq16vpbFfxwaPirgEgkMfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOLeRKbQHtZ7YMpmJj0AZXZHnfdK/fZ2xpQDpUiS0vt8UD3YGGCWfzi61sKRVxNRILBe0ei+cWGfIaCDjY2Cwnh2UMb/UMqdFppdK+iUxbZVq0g0jka1Q85zJZ7b+patObNalCqmxCUA1p0AstN+uNlG6onBbql3Hvef8YqwH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLDBEKj8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLDBEKj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FA5C4CED0
	for <regressions@lists.linux.dev>; Thu,  5 Sep 2024 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725524409;
	bh=hNS1xguVDWQNKTijPRMZFqq16vpbFfxwaPirgEgkMfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mLDBEKj8DjmR0uwBepN3z0CvvV0bP5kGO7Bdg3m4mq7lu9BtdXYc/JybNf6kjFR05
	 UTMJxmSt+B8F8pKOHUZPKpMYv6rDaPheJkzV5C3CC4xfyxjj7LH9tbxYS3KvlEykCy
	 7nDRAedWeANwjXoggI5uUFGwsr62NvMoME0s1I9VFiFbvmDoFY+cK+NUU+4Cn7Bwy7
	 QnjokF7D50+76sov9Rho6uDo8b21Xnqlfybd/GD4YcflV4Cpiu+EreOWjLDRyjx7DJ
	 8wq6aWky3xaHwAiIUtr5WVA1BLdijowgx0t93ZQMhLATt+S4P0x5iGd3uHkCSFYXST
	 T49iwcpP6M5Lg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6d4f1d9951fso4136927b3.1
        for <regressions@lists.linux.dev>; Thu, 05 Sep 2024 01:20:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWe/t8HOmuVyLpyNXDeEk7Br9b27C9d6TRAKaHqC/q4Qx6i6VAaLwjCU1j5ItjGXP62a59FJEO148IW7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcF8yqNd1a3kmEqsOyTZQ0L8HK8ZcGBPi/NU7LHjg/fZiUiylT
	ySevVHBP5V//621S85lx3Y6/U4JP02RLLwzMBx6CgQ3HE2bqnbmt1/H23itNvYZSNZ81E+0pZrx
	14F1jXH/9R5285aRJjyJJbPwOJ6V227AlON8nqA==
X-Google-Smtp-Source: AGHT+IFXtwS0nG9o30m6bnG6CPrX+SPf8hVqmtejLkuUgeL2gu2BYQwyAbAfe5vGtSdSEIo1Ada6GvWoqN183ETy2Ds=
X-Received: by 2002:a05:690c:fd4:b0:6ac:f8ac:7296 with SMTP id
 00721157ae682-6daf484a7f7mr100310507b3.1.1725524408953; Thu, 05 Sep 2024
 01:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904-lru-flag-v1-1-36638d6a524c@kernel.org>
 <CAOUHufadyZBOifC8-ompzy4idEO9g-zipsSBrkWaoc=sWrk+Uw@mail.gmail.com> <d69cc5a5-ac69-4b43-82fa-391eb7a17cbd@leemhuis.info>
In-Reply-To: <d69cc5a5-ac69-4b43-82fa-391eb7a17cbd@leemhuis.info>
From: Chris Li <chrisl@kernel.org>
Date: Thu, 5 Sep 2024 01:19:58 -0700
X-Gmail-Original-Message-ID: <CACePvbXpE8y09kACY+8PbzxMOStf2mVfEOFJ=LOa=CyXGwRDWg@mail.gmail.com>
Message-ID: <CACePvbXpE8y09kACY+8PbzxMOStf2mVfEOFJ=LOa=CyXGwRDWg@mail.gmail.com>
Subject: Re: [PATCH] mm: vmscan.c: fix OOM on swap stress test
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	yangge <yangge1116@126.com>, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, 
	baolin.wang@linux.alibaba.com, Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 11:54=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
>
>
> On 05.09.24 08:42, Yu Zhao wrote:
> > On Thu, Sep 5, 2024 at 12:21=E2=80=AFAM Chris Li <chrisl@kernel.org> wr=
ote:
> >>
> >> I found a regression on mm-unstable during my swap stress test,
> >> using tmpfs to compile linux. The test OOM very soon after
> >> the make spawns many cc processes.
> >>
> >> It bisects down to this change: 33dfe9204f29b415bbc0abb1a50642d1ba94f5=
e9
> >> (mm/gup: clear the LRU flag of a page before adding to LRU batch)
> >>
> >> Yu Zhao propose the fix: "I think this is one of the potential side
> >> effects -- Huge mentioned earlier about isolate_lru_folios():"
> >>
> >> I test that with it the swap stress test no longer OOM.
> >>
> >> Link: https://lore.kernel.org/r/CAOUHufYi9h0kz5uW3LHHS3ZrVwEq-kKp8S6N-=
MZUmErNAXoXmw@mail.gmail.com/
> >> Fixes: 33dfe9204f29 ("mm/gup: clear the LRU flag of a page before addi=
ng to LRU batch")
> >> Suggested-by: Yu Zhao <yuzhao@google.com>
> >> Suggested-by: Hugh Dickins <hughd@google.com>
> >> Tested-by: Chris Li <chrisl@kernel.org>
> >> Signed-off-by: Chris Li <chrisl@kernel.org>
>
> Thx for taking care of this, Chris!
>
> > Closes: https://lore.kernel.org/56651be8-1466-475f-b1c5-4087995cc5ae@le=
emhuis.info/
>
> FWIW, no big deal, but that ideally should be (in general and for
> regression tracking) the following instead, as that link above is just
> at the end of the thread with the report, but not the report itself --
> and that is what often needed when someone needs to look up the
> backstory of this chance sooner or later:
>
> Closes:
> https://lore.kernel.org/all/CAF8kJuNP5iTj2p07QgHSGOJsiUfYpJ2f4R1Q5-3BN9Ji=
D9W_KA@mail.gmail.com/

Thanks you Yu and Thorsten,

I just submitted the V2 to include the Closes tag. Technically it
passes midnight here so it is another day I can submit another version
:-).

Chris
