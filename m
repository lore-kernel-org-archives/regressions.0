Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5F203710
	for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023072; cv=pass; b=BXidkdB6hW/b20lrHiK/qzq4F5OeiJEhLmG89HAV2JB1WOcfoYsN0u+ewtfVKM+08NT9PvO1QOWrbp8pwjRcNno9TEOOvb+zvGy5sPNQ6nE2f7pfdnmPgaWnMMNBFrnjhtGzCuTmnQWjAeqjP6BnkYPgLkUU6Z4IeElj2hYc0B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023072; c=relaxed/simple;
	bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qm1zJ2/OhKc1lj2fhpqTkLBoLi8V81HH5iYIppWZ2+0RD/4jpTQ80PWq4bdbKY1hewJz7R9nHHTRVijg04OXgK2weQ0+bwmy+fH4DSHKrh12M3lFydJ8AKhDoGxZ+veTOqN1a6F9qCpgATC3hdEJXgl8VcLlJYbnt7ft0XZOxXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MK+GHI1c; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MK+GHI1c"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a1307438ddso6956284e87.1
        for <regressions@lists.linux.dev>; Fri, 24 Apr 2026 02:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777023069; cv=none;
        d=google.com; s=arc-20240605;
        b=Uy9lOnfy2o3btCbgVt47NAkDoAAO2uQW0eqa3r9cGFsLvmGSU15FDyIJ8vgCdKQJPz
         GC/hEZ0wa/yDl7avQKXeX+xLUVqieRp9c2htJ3pxEkazg8NX5Iwi3CFVqDrc7VLBMYM3
         W2Rb8YEphSnA3aLZVyHxHpca1x1pC0JR3gJDy4+YzQL0TwOSHY1AyghtXVW4ln2/MNEM
         mt9trIrSz1OVwYoiMHwmKEosjaEtfc7m5HnYbHVuYrJNEOk8CT37997smVy4D0SD2Sn1
         kjRq0t0JyKOlME8F7+yi9bQys8xKpcu4/A9KuTFpHlhz7cvcU8/eZao1PmAx4PQpepnq
         EJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
        fh=5kMQlJ4UiWT/k8jIG9LEAg99AgHNa0EdZ+9YQT5yOjc=;
        b=S4rEyMYY+NTc+1CFpj9OuukTczxQlfMhUvegkFpxvWdz9/NgKAZC1krix+2EYGCW44
         vVre9RUDKth128YuE4LEdxzsiyM+9gpdnJvUobN/F8fDUeQmVvyXpBG9lFz6JJjqi+Vb
         KZtSTb4OUJ6TFOdPf9P9w6xGJYInQQq465v8luUU3IG8wWaKmNQ0KXtF0Ew7KoUhwjLH
         RYzcMKT8Cn2EHpAD+DlsCFqXsJuRkwJyVmwptPf9WALTvJsPoT1ulfiTF9UjoGvJqO8T
         6Ib1UeP9ZgiqGBf7MUDq1c65zqIw/vgbRvJQ82gD0SB56dNEgMaOVdvqISau3JRZHL+h
         TSRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777023069; x=1777627869; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
        b=MK+GHI1cF7mlSmp6VUtgN7m34jbvlg57gIy79ebCfntr9kLfUgTyGlNUZlT08QUEn1
         UY7jmZyf5uYhMiKePYNDzHSXN2WOIsA1sDFihKszWHQICCJuogyJ8DFu8gsSaPJ0Yy9G
         zAba+kRhj6+vC8GwmxIBMnlMdVXY34zE3H3yvWFYvXri0W7gwQphSUeT2qTAEl676/cw
         sJpWg4kT5pSOAf+ebJwXWeogQU3VfziILh2wc6kXcsibdio35cLN/uvTiDZMAGfl2fHx
         yPIWvWmmLf8vmLCAUnXf1NrC22h/61xZNCzNefMmieh0pZFoAO6KY5Ooxq+DvqcBPy68
         dLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023069; x=1777627869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KYk/MnoNyp9ihi+fWXWaLDcuV7c9SfI0eGFa0QlHtJc=;
        b=M9LEiIra+3sTCN12zFO88x6Eq5xoi5tPVJkHSOL6InI23IgmVyEBRu5nmTPo3GO6Gp
         x8ZUJB6c3n/oIidGM2Z43ddzTSg7m1/xNdVj/Zgs3HiG7cWQtGANogApbh7RKenvKzBP
         m3d789BKto3bIxnRjwHe9QuT3BAsQukPnla6om21XNY1ssUtzDOszbxuwshHLeExenNj
         u/EU9KJT+0uXFwrckNSfpyRIbjJ7Uow+QAaMLC0OachY45WkcK9ENUs+sWGUXkvGOLvK
         u69R2yQpODBpbUyPkRCWBnXvsmMeor+bo91P3MND1ar0cLC0OS/deP4T1BTIEfIMyD5R
         3vXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ql2mz4FxeX2hZ+yzAWIBVqvSoZOvPaq+4kEpSei8KISYFmw+ZjzqojOz5RepEbxnnaxyx/naKhy1Dlw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMS/qRSqxuvsdOZTcppMCK7cSwdjKy3ZcCzzj65eXRwKeAv9zd
	t7KYr+WZ+iq5aD+RnoWBv9yiZPdqx834BVMT0tYo182ZaAfTXtxnUDtztFTIzeGv0laKgasZaYu
	kDGNXH4JqN9ksC26XSoB50eXPdfz6fmyaUl+fIDlM
X-Gm-Gg: AeBDietlXr1fj0KR9qXy0QTy8/xFrEnEB1AR4eDwThaZd8VtR+u7Bl9XYxKSOm0LNS4
	qzufMUYrbCMgN94eTGgvJSfH0KNaVX/MtXNG0Ov5Oc1Z2NCkDEYNnd2xwaivglujdMVfCXTwbp5
	JEa5RqyP9kudVtWQI7PMP7qUP7eA0MWJfmZYly9vbaMONE7+Ewc5VwZ7fP7r8nK28i8Ynrkv0xC
	4oRgY8wO8t8+/3m9DfgbJ7EIAYnW3ZqYBKaXppNXjpwB8xOZovlvo034IbaqH0IHVtczEuRO4oz
	g4O0P1YQSD/CXAFEf6s0EQHnQ5UvOU93zsop1sBHvqNe4hDWSebewwQDOF3U98oe7oCOMMyrM0a
	ktN5/NrYuUcHlwOB34A==
X-Received: by 2002:a05:6512:6d6:b0:5a3:d30b:958a with SMTP id
 2adb3069b0e04-5a4172de887mr7940708e87.22.1777023068865; Fri, 24 Apr 2026
 02:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx> <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
 <87a4ut1njh.ffs@tglx> <CACT4Y+bBD7uCHXKqGo=epBXeEmsZ67Og2YO9kjNMT3ryjUY_sA@mail.gmail.com>
 <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
In-Reply-To: <CAHnCjA1LqbaUGkPe79EeP6Mpaki8QWeR-JBSbrG0z6pTm9CmUg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 24 Apr 2026 11:30:57 +0200
X-Gm-Features: AQROBzBE4JDXzMDFtK-HkrG9FqByjQjur9lylNZcv0FqInRcXzflA0csSOUyg18
Message-ID: <CACT4Y+bhsxSJhXMvwpRi=Z4tfq54uDicp-Xrp7hmm_qEjKpttw@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Mathias Stearn <mathias@mongodb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Apr 2026 at 10:32, Mathias Stearn <mathias@mongodb.com> wrote:
>
> On Fri, Apr 24, 2026 at 9:57=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com=
> wrote:
> > > So if the code only requires to know when it got rescheduled to anoth=
er
> > > CPU then it still should work, no?
> >
> > This was my first thought too:
> > https://lore.kernel.org/lkml/CACT4Y+a9GnOh3wHKSRwzoKF6_OSksQ8qehnHfpCgk=
QSt_OOmYg@mail.gmail.com/
> > The only problem is with membarrier (it used to force write to
> > __rseq_abi.cpu_id_start for all threads, but now it does not).
> > Otherwise the caching scheme works.
>
> I almost wrote a message last night saying that we didn't need
> cpu_id_start invalidation on preemption. However, I remembered that
> the Grow() function[1] does a load outside of a critical section then
> stores a derived value inside the critical section, guarded only by
> the cpu_id_start invalidation check in StoreCurrentCpu[2]. It really
> should be doing a compare against the original value inside the
> critical section (or just do the whole thing inside), but it doesn't.
> I haven't reasoned end-to-end through this fully to prove corruption
> is possible, but I suspect that it is if another thread same-cpu
> preempts between the loads and the store and updates the header before
> the original thread resumes and writes its original intended header
> value. Ditto for signals, which sometimes allocate even though they
> shouldn't.
>
> I was really hoping that we would only need to do the "redundant"
> cpu_id_start writes would only be needed on membarrier_rseq IPIs where
> it really is a pay-for-what-you-use functionality, I think existing
> binaries depend on invalidation on preemption. Luckily that should be
> cheap enough to be ~free.

I've prototyped this idea too:
https://github.com/dvyukov/linux/commit/1284e3723047cb5afd247f75c53de43efc1=
8db82



> [1] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a26=
99dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L964-L980
> [2] https://github.com/google/tcmalloc/blob/8e98046ec5639bffbe70a53770a26=
99dd355b26d/tcmalloc/internal/percpu_tcmalloc.h#L551-L605
