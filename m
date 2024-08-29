Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB2718B460
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 21:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724968505; cv=none; b=YRviGGEyZ8oqql+jTJ7g/pgkOB3CsNWt5H2h7kKGtVRfNJdVff83kxhiTbkhzRATCtFdFfxf82GiDsNGegCHG5dbrkVmRt0lSREQ3BFeb1vMeaCIpvNItncDPTv57XR0kWSuWrT56anZjBMzhxQOoBie2K4K3NMv72L+hO9079M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724968505; c=relaxed/simple;
	bh=X2J1Zruavdx6XZtyjF3WfuYLy3+4x0oPlle13EcoFtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+OzvOpvgK0jaPM8z6rFAc6CdjD2L9Sgs3DowZpQ4JaVnTWyGkQDSdWPPGA6KhBS8MuisI+Gs0tZgXbdw9JLQ9yDDyoBeaHFald5bZzhBwl83ygv9vZdRGdkAgZVO5Fb6ZXVIdHVO0Pf8QZOwP+KHtjGVq2Qp0RyjABjEYLe64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elSsM+5e; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elSsM+5e"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bec4fc82b0so3839129a12.1
        for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 14:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724968502; x=1725573302; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2J1Zruavdx6XZtyjF3WfuYLy3+4x0oPlle13EcoFtA=;
        b=elSsM+5edTLXyqwPcYRApoWIybx1JuDqj+Rhrue5NGhHA2Vag4O1D6p0fLc5C3y/RI
         XZe5hGEjRG7MzcDSICAM6agtznFvpb1KimLNRPoGiN2VXQjPE8vEpN/1UXNT0n//3gkj
         HAADHqnFTsNOmAVgjhAxvbFxOcc+svIUOes8EtM30WA7R6owd7VQH2x4UvQsoYj3dA9t
         GVqffz5jQLJeUXBd2d1bqamvrRp/mcWDsp7oHdUD8MHo0DcC3FTyRjERtbMfn5Ty+DKn
         ma4SmFra+zOLCu8TnwvLsO/3fsCCaEOzeIBpLF8chAHUVAcmsgjPs6rET2WROeUP/PA1
         S05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724968502; x=1725573302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2J1Zruavdx6XZtyjF3WfuYLy3+4x0oPlle13EcoFtA=;
        b=HMJKVUz3kYMDMmgMugLXEsSXPyZK36S60SGQ3kgbJ/4nreo/qd9Sl2J6DIpSaPcPkb
         Zv3XT6bKDolwjxUMZJxjK4SlJhkv82rW0u1EsYp7VDlUbppBT6wBKp+s2zRmiR0JcjcX
         KfUVecwnxC3R6fVGlJDwJZbhuIJ1cttlIzO50/ROU8tK2NLdKp/Fz0qOzS3zjAt86YUP
         UqoMRjAil53DT0cDQOVNoEkplQtv3gpvMWMbhqfn9NM2qeU0WAdq2yiQGiviUiFhaDNV
         5RP+bNn2UJXRX/V0IKEDMI6lBhqHj4jyJvcQZMGJIe9sQeg3LsHxrll86w6eJY3vozhI
         VCgg==
X-Forwarded-Encrypted: i=1; AJvYcCU9WTBGvCubNTl8pI5aOXHFlJulYceEMssqjZV22hKTrfoV+DmnWlDGUo4yOatuKxcjD5akkO7XazkE7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+USvDDlesytWKCIpdu7+4TUuOrqsbX4FlixUSsvKIwLE9qIN+
	MhNsvubaAmzqxBoHZoFzkySrV4BJl918o6xE86N/Tc7h6TI4UoYiw4wiEhyTcrmBx6PErd9220O
	XszHsWjl6G+KfA9aCmgi7GGalsCg2/QHyHJqK
X-Google-Smtp-Source: AGHT+IH4ZiYY7Gh1I4yhkeVflwkseKNXmSds8HXCeIwpuTOHYtBHBjH+rd6088PWHQ/1mRdQhrMjnIDBUnNE0bVXLxU=
X-Received: by 2002:a17:906:f5aa:b0:a86:96da:afb with SMTP id
 a640c23a62f3a-a89a2584293mr20082666b.10.1724968501505; Thu, 29 Aug 2024
 14:55:01 -0700 (PDT)
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
 <EE83D424-A546-410D-B5ED-6E9631746ACF@gmail.com>
In-Reply-To: <EE83D424-A546-410D-B5ED-6E9631746ACF@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 29 Aug 2024 14:54:25 -0700
Message-ID: <CAJD7tkZ01PPYMzcTyX_cwr836jGonJT=fwT3ovc4ixW44keRgg@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Pedro Falcato <pedro.falcato@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 8:51=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.com> =
w dniu 27.08.2024, o godz. 20:48:
> >
> > On Sun, Aug 25, 2024 at 9:24=E2=80=AFAM Piotr Oniszczuk
> > <piotr.oniszczuk@gmail.com> wrote:
> >>
> >>
> >>
> >>> Wiadomo=C5=9B=C4=87 napisana przez Pedro Falcato <pedro.falcato@gmail=
.com> w dniu 25.08.2024, o godz. 17:05:
> >>>
> >>> Also, could you try a memtest86 on your machine, to shake out potenti=
al hardware problems?
> >>
> >>
> >> I found less time consuming way to trigger issue: 12c24t cross compile=
 of llvm with =E2=80=9Eonly 16G=E2=80=9D of ram - as this triggers many hea=
vy swappings (top swap usage gets 8-9G out of 16G swap part)
> >>
> >> With such setup - on 6.9.12 - i=E2=80=99m getting not available system=
 (due cpu soft lockup) just in 1..3h
> >> (usually first or second compile iteration; i wrote simple scrip compi=
ling in loop + counting interations)
> >
> > Are we sure that the soft lockup problem is related to the originally
> > reported problem? It seems like in v6.10 you hit a BUG in zswap
> > (corruption?), and in v6.9 you hit a soft lockup with a zswap lock
> > showing up in the splat. Not sure how they are relevant.
>
> If so then i=E2=80=99m interpreting this as:
>
> a\ 2 different bugs
>
> or
>
> b\ 6.10 issue is result of 6.9 bug
>
> In such case i think we may:
>
> 1. fix 6.9 first (=3Dget it stable for let say 30h continuous compil.)
> 2. apply fix to 6.10 then test stability on 6.10
>
> >
> > Is the soft lockup reproducible in v6.10 as well?
> >
> > Since you have a narrow window (6.8.2 to 6.9) and a reproducer for the
> > soft lockup problem, can you try bisecting?
> >
> > Thanks!
>
>
>
> May you pls help me with reducing amount of work here?
>
> 1. by narrowing # of bisect iternations?

My information about the good (v6.8) and bad (v6.9) versions come from
your report. I am not sure how I can help narrow down the number of
bisect iterations. Do you mind elaborating?

> On my side each iteration is like
> -build arch pkg
> -install on builder
> -compile till first hang (2..3h probably for bad) or 20h (for good)
> this means days and i=E2=80=99m a bit short with time as all this is my h=
obby (so competes with all rest of my life...)
>
> or
>
> 2. Ideally will be to have list of revert 6.9 commit candidates (starting=
 from most probable falling commit)
> i=E2=80=99ll revert and test

Looking at the zswap commits between 6.8 and 6.9, ignoring cleanups
and seemingly irrelevant patches (e.g. swapoff fixups), I think the
some likely candidates could be the following, but this is not really
based on any scientific methodology:

44c7c734a5132 mm/zswap: split zswap rb-tree
c2e2ba770200b mm/zswap: only support zswap_exclusive_loads_enabled
a230c20e63efe mm/zswap: zswap entry doesn't need refcount anymore
8409a385a6b41 mm/zswap: improve with alloc_workqueue() call
0827a1fb143fa mm/zswap: invalidate zswap entry when swap entry free

I also noticed that you are using z3fold as the zpool. Is the problem
reproducible with zsmalloc? I wouldn't be surprised if there's a
z3fold bug somewhere.

>
> i=E2=80=99ll really appreciate help here=E2=80=A6.
>
