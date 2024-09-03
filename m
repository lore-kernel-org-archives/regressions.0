Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EE2BD04
	for <regressions@lists.linux.dev>; Tue,  3 Sep 2024 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385801; cv=none; b=EFT5Xt09KCGcOdVUrI3tFpR4QW3z2zXFks+ow1EU5kDaGl/qlHHTtXGkQbVz0MANRc/Y2c+TtnSozkrKEdRfikObgirEJRwLorrv2n4r0PI17U0WMjwei0GOawoMFJJIqeYTrwzBBYF+UOcTNBp5C80QYBk8ca87DThMcaeVi+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385801; c=relaxed/simple;
	bh=s0G3wSQMAl6e0rRV+V/XUHth+hntN01i+HARZDZUoKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTVbX80W0xdWa0oXHvW8t/KIyEtdG/EKeaejtfMdJ4iPsufbQ+IgX2DGMhiA4PMOPeR/G2dAedm7nvL++APZNX8+QxKAz5j01RCCk0ddIL8ZyrVXXzNFxoZTCCO2AKfKZzf0IoihcPiQ94sXYYkE7MYc7IcX9v5edGBpciFV7P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fuk7HupM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fuk7HupM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a86c476f679so667279666b.1
        for <regressions@lists.linux.dev>; Tue, 03 Sep 2024 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725385798; x=1725990598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0G3wSQMAl6e0rRV+V/XUHth+hntN01i+HARZDZUoKo=;
        b=fuk7HupM+0w/fhEkBvGxf0DVSjZ/ooCRpqPTYN4eP2qYauRdpLJFhHciHEdxXE2a/j
         CjUIg4LLmJE8wieK06sMeDya73Fi5X1AXPY22v0cjASsg2dEQlyDtcgKktVv0Hxtw+Bu
         GcfT2ukQ51W1lUBnmUWuulFHwx4rs/JIEtU2UiSM5Eeyzx7AY0YHpWqhMCF57i3Hct0Y
         mSIDhRLBqBi4Hr5D7Fa/MzF8c0TIm8kdQTwIIrAa68aktSzAX32p4dZx+hOYYQ/1cCaj
         PuWZPiE0hghaX+SoMfIivliffTQ4a85tUdigfY1iuhX2GqfZNtMdHro5oOAU2QI6K0rB
         +gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385798; x=1725990598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0G3wSQMAl6e0rRV+V/XUHth+hntN01i+HARZDZUoKo=;
        b=PohqwIngI+YTZsLCz+W+XL8B3HycljE7UeobGU1OM9h+yjJCzIwMpQ89cvJMV2LQ76
         jjUnK4HfeMWIEp03DUtAJ1hcXC81cpMdrb9zkfbbHHmCySmIjOo/ajeP2X9xbu9wh8S+
         gW5Y1xUkt0rQ8vNXauZTHXyMWpjsqrNtWREG4HUbEITbvNvF868NYNNsos7GLmuP0nFq
         EsbnEzwiB7kcHZJK6Hxp9lyj9L5rQISTKBXScgPh0lmSZmHKhsnzxl/QxWWucOsjTsVh
         5dgZWzqs8Ljf1zNUJkYTo1BUTyKnY8AQnMmXY9eg0ezPz9DxYK3SHt2a/ZsNcFnPlliE
         62jA==
X-Forwarded-Encrypted: i=1; AJvYcCV6qulLrwN1Ufc7ZJzmM6LkZX1P0lqvLwEANAdW2tz+4xbZfH/syBWeXJ2+OofHUQzOkifwuG66eJGsAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeODlHvFrF6ml2wzEOuQzoze/aKnIsCV1nSTLx7CFpw8wG0uWk
	BcrwHFpX6cWYuaHq5taiDeXPXACeZf3FkGYWlrVyUJRYjDfBE1KkLQagfqgJWpHu9MwwSxCVxik
	fK+Wc6Ba9HP9R+3PkUYPDtAtc+AXW9HDJ3zRs
X-Google-Smtp-Source: AGHT+IFofB3wIffAK9PeJljfYupTAr8ZvLUp9muEpmKLRv5Pk0pqIHrN1ItxyWws7Vw7+2fkN1xum+X0r6RRrMeLmUk=
X-Received: by 2002:a17:906:fe44:b0:a86:96d1:d1b with SMTP id
 a640c23a62f3a-a89b94b40fcmr924680766b.16.1725385797168; Tue, 03 Sep 2024
 10:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info> <ZsiLElTykamcYZ6J@casper.infradead.org>
 <02D2DA66-4A91-4033-8B98-ED25FC2E0CD6@gmail.com> <CAKEwX=N-10A=C_Cp_m8yxfeTigvmZp1v7TrphcrHuRkHJ8837g@mail.gmail.com>
 <A512FD59-63DF-48D3-BCB3-83DF8505E7E0@gmail.com> <oophwj3aj2fnfi57ebzjuc536iltilmcpoucyms6nfk2alwvtr@pdj4cn4rvpdn>
 <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com> <CAJD7tkbF2Cx4uRCJAN=EKDLkVC=CApiLAsYt4ZN9YcVUJZp_5g@mail.gmail.com>
 <EE83D424-A546-410D-B5ED-6E9631746ACF@gmail.com> <CAJD7tkZ01PPYMzcTyX_cwr836jGonJT=fwT3ovc4ixW44keRgg@mail.gmail.com>
 <277CDE7C-7ED8-4840-9C30-533C9327B028@gmail.com> <CAJD7tkaTcnuCFW+dWTzSAuLKBqkkGv9s5uByYm9DaJC=Cp-Xqg@mail.gmail.com>
 <EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com>
In-Reply-To: <EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 3 Sep 2024 10:49:19 -0700
Message-ID: <CAJD7tkZi8Wg+ZCWMy=2YKZ3hLZZ7JYQaCG+w7y=3Tb8wmHC48g@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Pedro Falcato <pedro.falcato@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 1:58=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.com> =
w dniu 31.08.2024, o godz. 19:23:
> >
> > On Sat, Aug 31, 2024 at 2:41=E2=80=AFAM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>
> >>
> >>
> >>> Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.com=
> w dniu 29.08.2024, o godz. 23:54:
> >>>
> >>> I also noticed that you are using z3fold as the zpool. Is the problem
> >>> reproducible with zsmalloc? I wouldn't be surprised if there's a
> >>> z3fold bug somewhere.
> >>>
> >>
> >> Hmm - yesterday i recompiled 6.9.12 with zsmalloc and =E2=80=A6. after=
 16h of continuous tests I can=E2=80=99t reproduce issue.
> >> With zsmalloc 6.9.12 looks to me like stable.
> >
> > Interesting, and a little bit what I hoped for tbh.
>
> :-)
>
> I tested mainline 6.10.7 with 26h test and also it is stable with zsmallo=
c
>
> >
> >>
> >> With this - what will be your advice to move forward?
> >
> > Well, it's possible that some zswap change was not fully compatible
> > with z3fold, or surfaced a dormant bug in z3fold. Either way, my
> > recommendation is to use zsmalloc.
> > I have been trying to deprecate
>
> IMHO - isn=E2=80=99t bug in this report + difficulties to reproduce->fix =
enough to depreciate z3fold?

I would say this bug report is yet another reason why we should deprecate i=
t.

>
> > z3fold, and honestly you are the only person I have seen use z3fold in
> > a while -- which is probably why no one else reported such a problem.
>
> Well - in fact this is ArchLinux - not me.
> I=E2=80=99m using Arch and kernel in builder machine with ArchLinux confi=
g + packaging

According to [1], zsmalloc should be the default allocator for zswap
on ArchLinux. Anyway, I initially thought that no one was using z3fold
and it was bitrot, but apparently some people are using it and it's
actively harming them.

[1]https://wiki.archlinux.org/title/Zswap

>
> >
> >> Is there any possibility/way to avoid bisecting? (due limited time fro=
m my side)
> >
> > So unless you have a reason to specifically use z3fold or avoid
> > zsmalloc, please use zsmalloc. It should be better for you anyway. I
>
> I see benefits already: on very memory demanding qtwebkit compile:
> z3fold: swap frequently gets 6..8G from 16G available
> zsmalloc: can=E2=80=99t see more than 1..2G
>
> > doubt that you (or anyone) wants to spend time debugging a z3fold
> > problem :)
>
> lets depreciate it!

I tried deprecating it before [2] and performed some analysis [3], but
there was some.. resistance. Maybe I will try again and use this bug
report as yet another argument for deprecating z3fold :)

[2] https://lore.kernel.org/linux-mm/20240112193103.3798287-1-yosryahmed@go=
ogle.com/
[3] https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13sCj4S3i4b=
NndqF+3+_Vg@mail.gmail.com/
