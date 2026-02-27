Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B6D2367D1
	for <regressions@lists.linux.dev>; Fri, 27 Feb 2026 23:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235178; cv=pass; b=MwrOUHkNJGcn9zneG4w4mAI9xL+H2rmmcjWMkaebRz2/cCx9QB5uI6ua2qmS6qKtXaKbVJwh+o5b1Bl6sIguadKwZLmCqD9/qG2WSqxwG7nQfCgvbmczPeUO1Kh5Y8C4rEFrCOXT3NE3Qz1aE/QtTfq8KYDSRyI2iJBmvWYCtrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235178; c=relaxed/simple;
	bh=Jl6qVoawnojYxXKy+mpIEK2wzTG7xBRL73TA3AR7Rxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8hOUfbfllvZe/V01Ktr9Ci2j4GGlYU36LzRynGsujO65a1gBNfmSwkY4rSYRWluOMdkkV4wbY83CuwaY5EAXI9raNYaHcXP3L1rfkezOl0yDs2zoUnsikGk9zpr57NL5wN2yiJHiLBwRA9sBkptt1yDw7pjpEZyEtKk8md/E28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dfinity.org; spf=pass smtp.mailfrom=dfinity.org; dkim=pass (2048-bit key) header.d=dfinity.org header.i=@dfinity.org header.b=W3+MdCN3; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dfinity.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dfinity.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dfinity.org header.i=@dfinity.org header.b="W3+MdCN3"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65f767a8d62so4981779a12.2
        for <regressions@lists.linux.dev>; Fri, 27 Feb 2026 15:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772235175; cv=none;
        d=google.com; s=arc-20240605;
        b=fejlpaTgekbFPg311wulkfwbosKZV3OdDEcevoxwfWr3ZyWMK1aWptLhfccpFQy9MG
         BLlXMPlvttxWoZS0vhP1YG9TB643sIhAtHmIkFLTsnmes7BqYCa7qz5hkAmWGXIu/jnz
         mJXWMm713mcTjuZHbc6INv35abEKAZBeHeS01fpE0MX0BxZSqgPDQErCSCZjrxZGAVI5
         ajpSRUmKbhcbD5qS35rwahAK1hCv8LMztzuNo8Z9+3ksLF42xWtL11n05LEKTV3X1vh7
         Cq4DlGgpG382Ku10fM2EU3+1fNsdGzD5C/uUqHxP7ECCN0YIVrAPfRPyoLxcT7tajDde
         hkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/eLIE3ND8oKfgZ51wtjS+hjmkhRyVh6yadLObJYXaA=;
        fh=t/Mgv64bp09akUpW/I2a+kRB6q6+XZE5g2/5c7HnKqU=;
        b=HBweHanmkxxEmU6hjFMDA4HzEiepPkwK8JWFahVeL9f+9TrBsrOEbeWJx5p/cvqNL5
         s62F60J7nVWt0oylPxsKyRFX3WEjybhkxFe9XMjKhwl5mZ7IoIp9Rgw6EIlr3JzIRWXz
         53SmOiOWJZIMAn0uno180iMBXHb5Iw6opOXbqcZN6oKGtSkEIvk0v2BjMRWg8yXOLGA4
         eWTy6z2peNz6w6AYP+d0aNxTvtXUx+L+6Kd867U618Lci5Onq/FDC2GodQWNYYOF2vT+
         dPdijud7Pf44JQdToWBtY++4bYIKp7OMGs5QhV+MbGRoyR5Lwp0Qc55ECoRgtEVxH9g3
         GLEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dfinity.org; s=google; t=1772235175; x=1772839975; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/eLIE3ND8oKfgZ51wtjS+hjmkhRyVh6yadLObJYXaA=;
        b=W3+MdCN30r6oM7FGQ/yrr35GRk8osqMM8xHtf22/HX2RK7x6TpFMsnZrmmAQ2+Y2Mm
         8jY2mmwkJSB8dSZXDadU1QyToyt9j6PEhDLZnrucLNaAi3fk2lhRbF+03AXpRCYhrlPG
         OKOZiMn61rTS1MBVPhKZip+knSVR+mf0LSDgEZiyeSZkDWvi89Iischav4AOnu+t9vt4
         O3OfBbKwSgdB81F5QoBL17iRvzokT7lfGWIonKUnFdE0sl0JdPFm6VqtFkDLDwvE/2r/
         ECivZtez3cy6Om5FMDiblTeEwEViHJy0NJ34uTE9Ohqwh92zj9egFdTyU1groWdY5Pc5
         1KBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772235175; x=1772839975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/eLIE3ND8oKfgZ51wtjS+hjmkhRyVh6yadLObJYXaA=;
        b=K/EhQ1qVt1t6Mtdg20tRxF9iteRUzgAPpaLZQd2T+GtJjnqjQ+Kg/cPEP5+xAycLDS
         q0lnEumNsiJHjxyyln/OND8puDfV82HQPCyNuDlEcZ4aNL5gAOLp16SPUzx3XWDd3cCf
         E8bEYdVVtjoG4wt8Ou2DnbdmvLJIEj356AY008hDAYPhhtPFwPZFKczQkhaBeUxwrnfM
         6Iwh5isWCSeFQTjdp5lxlpgImYFUdT3X5xrAphW4zxNh9pELjtMLqvwm+qmKWdu617kz
         p1KS0frPGMIoplaxxOIkgmBzjvPLquPeuBoKVXBc7RXWes60KzAHmpUzYy7uICevIXlH
         9IMw==
X-Forwarded-Encrypted: i=1; AJvYcCXHXL6h32KZq63bXdrztjl5EK3qDLM0P3rCODKrOrIk0tqZTqQIjnfl1IOmfHoKCdywb+tT6S1Z6e5fLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbTIuFDp3SjxaetYaxJgaobnHrcsmkFKB/6iKDcxwk/LpSQH+0
	gXsVHFTT4ma8qDfgOLZLKxhzGNKFHvaroe8r7rql2gSpht9djo1kXPqczbThfRgOMQvomQVSIDm
	rUK18Y9RJ89KnzJMphZtaZR4I4t5x2e5s66lpWonldg==
X-Gm-Gg: ATEYQzyQEqQ4yHC1pW2goEmklG/uj6Itnh/xASSmtXXKicSgSbMHbuizIGvSz32l9H8
	Cf2bacDY0O6aB30ertM7YF+OjkVrOQhaT+l3njW0PN66Ym9ZhzB9q5vsSmZJx6HiTneeoVKyAfG
	cktbxEKm3q0Vai+ru1Y2BXCNMhwKLJqV9AZ0xva04O0p8kxcE1VSiVJcfXaflSK9GH7BaZ9HGOF
	zcCRY86ZwlNv7VpEWOmh9k1tu5BuuLiit6gQWTxksoQMbmEef3+rV+12rtF86ltnqUOxX94xmI4
	8vse2TqwB6clc3O/mw==
X-Received: by 2002:a05:6402:3810:b0:65f:a47f:6e98 with SMTP id
 4fb4d7f45d1cf-65fddcf17a2mr2834242a12.27.1772235174690; Fri, 27 Feb 2026
 15:32:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKNNEtw5_kZomhkugedKMPOG-sxs5Q5OLumWJdiWXv+C9Yct0w@mail.gmail.com>
 <CB5EF1C4-6285-4EEC-ABD0-A8870E7241E8@nvidia.com> <D4BD80F5-6CA2-42E1-B826-92EACD77A3F3@nvidia.com>
 <CAKNNEtwZzt3xWh_b1pn4X4FG+cq6FLOP5rR4+G=WUsjHsJRjaA@mail.gmail.com> <2EECA9B4-E1F0-42FF-9E61-3E4AC4B4DC13@nvidia.com>
In-Reply-To: <2EECA9B4-E1F0-42FF-9E61-3E4AC4B4DC13@nvidia.com>
From: Bas van Dijk <bas@dfinity.org>
Date: Sat, 28 Feb 2026 00:32:43 +0100
X-Gm-Features: AaiRm52i5X9PI75r_CXw7oqvsR4nJ7O2YOcRO4y6Kt2G9VuPp0acJ2VcRalSCjk
Message-ID: <CAKNNEtziooemhq3Yb8OpOjg4N0bV+Kc+1in0P7L1i_NBWS-q=A@mail.gmail.com>
Subject: Re: [External Sender] [REGRESSION] madvise(MADV_REMOVE) corrupts
 pages in THP-backed MAP_SHARED memfd (bisected to 7460b470a131)
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, regressions@lists.linux.dev, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, Eero Kelly <eero.kelly@dfinity.org>, 
	Andrew Battat <andrew.battat@dfinity.org>, 
	Adam Bratschi-Kaye <adam.bratschikaye@dfinity.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 8:29=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 26 Feb 2026, at 16:16, Bas van Dijk wrote:
>
> > On Thu, Feb 26, 2026 at 10:06=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >>
> >> On 26 Feb 2026, at 15:49, Zi Yan wrote:
> >>
> >>> On 26 Feb 2026, at 15:34, Bas van Dijk wrote:
> >>>
> >>>> #regzbot introduced: 7460b470a131f985a70302a322617121efdd7caa
> >>>>
> >>>> Hey folks,
> >>>>
> >>>> We discovered madvise(MADV_REMOVE) on a 4KiB range within a
> >>>> huge-page-backed MAP_SHARED memfd region corrupts nearby pages.
> >>>>
> >>>> Using the reproducible test in
> >>>> https://github.com/dfinity/thp-madv-remove-test this was bisected to=
 the
> >>>> first bad commit:
> >>>>
> >>>> commit 7460b470a131f985a70302a322617121efdd7caa
> >>>> Author: Zi Yan <ziy@nvidia.com>
> >>>> Date:   Fri Mar 7 12:40:00 2025 -0500
> >>>>
> >>>>     mm/truncate: use folio_split() in truncate operation
> >>>>
> >>>> v7.0-rc1 still has the regression.
> >>>>
> >>>> The repo mentioned above explains how to reproduce the regression an=
d
> >>>> contains the necessary logs of failed runs on 7460b470a131 and v7.0-=
rc1, as
> >>>> well as a successful run on its parent 4b94c18d1519.
> >>>
> >>> Thanks for the report. I will look into it.
> >>
> >> Can you also share your kernel config file? I just ran the reproducer =
and
> >> could not trigger the corruption.
> >
> > Sure, I just ran `nix build
> > .#linux_6_14_first_bad_7460b470a131.configfile -o kernel.config` which
> > produced:
> >
> > https://github.com/dfinity/thp-madv-remove-test/blob/master/kernel.conf=
ig
>
> Hi Bas,
>
> Can you try the patch below?

The test passes twice with the patch manually applied to the latest
master (4d349ee5c778). Thank you!

I had trouble applying the patch using `git am` to 7460b470a131 or
7.0-rc1 but this is the first time I've used `git am`, so I might have
done something wrong.

> I was able to use your app to reproduce the issue after change my shmem T=
HP config from never to always.

Yes I had to write "advise" to
/sys/kernel/mm/transparent_hugepage/shmem_enabled since it's set to
"never" by default in NixOS. See:
https://github.com/dfinity/thp-madv-remove-test/blob/d859609820113c69023848=
452bdba8b619d78a8a/flake.nix#L93

It would be great if the patch could be backported to 6.17 used in
Ubuntu 24.04 LTS since that's what we use for the Internet Computer
and where our tests first started crashing.

Cheers,

Bas
