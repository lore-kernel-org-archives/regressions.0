Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB011D7986
	for <regressions@lists.linux.dev>; Tue,  3 Sep 2024 22:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725403437; cv=none; b=KAj+XZ9oBUV2ds0n6z+OZmai3kkTgorrruwyC16IRPpe0Q3D6wtJwhrJWCGbEDy+bK07VdOOvhqbz6A9ZxcwhTST0qrEMUhnkoFse1XWiZZfg5WHqHMEtsaLjWixSbYXaTghR/Mf2hV7A62p/I13lnDzp+W1dkGK/V3iwnslArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725403437; c=relaxed/simple;
	bh=8FiFXXA/l3FkeAr8G3sWENhyWD2nRnjVPnBxOLfEYnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/NjPHNFFoSZqVn7VnTpb+Q42ascsMoVR4wYm4kjhGPuhv2JXNg11vL5/joTNbC70cJltaO4325pNvmHMHoQs9HAN9IqE06IY/YLSYoG5ce3+xoXHIpquNgDFxYL/7lDtSFSqR4IyGm+VwXXr2InxXPJGPo3j6iOqZ1hqsuUagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw1nniEX; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw1nniEX"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4fead6effe9so1638609e0c.2
        for <regressions@lists.linux.dev>; Tue, 03 Sep 2024 15:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725403435; x=1726008235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FiFXXA/l3FkeAr8G3sWENhyWD2nRnjVPnBxOLfEYnc=;
        b=dw1nniEX4LxlWxfgFaxFx4hiBLrO9JF9imf78nEUn8o3F2YfMw4feagVSi/UUza/6f
         ws8gflvZDCfDnvwX/Uj4YMyMt4nCpQ6hI2VzcHYzcJboWKglabgBDTg22XE/NrqERiH+
         HizaKoFnBKvrke/tO1rfZBZBysDoPsPortdmwwky0pSsmCBLObvNUFaglSOQEST62v2s
         sqpaOeaXWDFIxpl2fQRx3GDEHkbSKEgXeqYGezNEl4pkFEOpzJVSgVB/PCyQMc3ngoSV
         rbSK5zlh+FaR+0WtQy9ljl4yxp7/Xl3alDxQsnFPaxPfEDxfquVIZlt2pK3Vh59EEIZZ
         AYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725403435; x=1726008235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FiFXXA/l3FkeAr8G3sWENhyWD2nRnjVPnBxOLfEYnc=;
        b=R1AFROWXQraftYU5wL29tMDlLj3qw8kxr33uKcvlWOO+6pNCEdSWV20Ff3UjzHlnka
         qM0DqQ17+T6Ax/QzsR7Q7CdpC5OQOSceMKlh6mmJZurq+WLSsJC6f3sl+hHkWJ/SEPzH
         LBnOpwrFDicLINwOQ8bSNDgrNGqKkufBag7I8Q6BZtDo6j0YiJW8Cscq7xCkeD40ycK3
         q0ECtNtbudiTTJcQqPjHbI+a/vwzpBwjzdqNVGX0tY5mm+fPQXYUTy7ohK5f3ubCZRVC
         mEukW5mXDT3j4XmQgEfcIAZiu3nf1CoCie1NItyD+bwxUM3L2HRY+EsNEjzVES0eMTcY
         K54g==
X-Forwarded-Encrypted: i=1; AJvYcCVORv10DwaGFSU1VzV4NZHCr6ki3tWOvbSH6nkCDXalC6yXlbgN5yvc24z2ErtqIFpQiPU0s3oVbA9jSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFOXP0odmHd0SuBrww0uBin15712Px9y06MET3HMRiV0Up2kAh
	qBEntaAfvY96wvcDx2ADtSl7u3FXTs1enTieTgLfft8bqzqrDiq39FXOufOHAaFZHemV/1nmYcu
	lgX+VTx+n7FvaYYFrlscszkxZGPk=
X-Google-Smtp-Source: AGHT+IENyUbCLbadEWFLpOh2q/6waOSadl+medXd1iZVdEMn6jiqqDqBGZRw1xe7jx6KhhamVY4Jg5rPOa45zS2xjGA=
X-Received: by 2002:a05:6122:3115:b0:4f6:aa3e:aa4c with SMTP id
 71dfb90a1353d-5009b1b6015mr10311639e0c.3.1725403434612; Tue, 03 Sep 2024
 15:43:54 -0700 (PDT)
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
 <EF0ABD3E-A239-4111-A8AB-5C442E759CF3@gmail.com> <CAJD7tkZi8Wg+ZCWMy=2YKZ3hLZZ7JYQaCG+w7y=3Tb8wmHC48g@mail.gmail.com>
In-Reply-To: <CAJD7tkZi8Wg+ZCWMy=2YKZ3hLZZ7JYQaCG+w7y=3Tb8wmHC48g@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 3 Sep 2024 15:43:43 -0700
Message-ID: <CAKEwX=PiyvV7AxKESk5zc9TN1n5b0uFR0pr_HGxKsUFUgk0q+Q@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Pedro Falcato <pedro.falcato@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 10:49=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Mon, Sep 2, 2024 at 1:58=E2=80=AFAM Piotr Oniszczuk
> <piotr.oniszczuk@gmail.com> wrote:
> >
> >
> >
> > > Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.com=
> w dniu 31.08.2024, o godz. 19:23:
> > >
> > > On Sat, Aug 31, 2024 at 2:41=E2=80=AFAM Piotr Oniszczuk
> > > <piotr.oniszczuk@gmail.com> wrote:
> > >>
> > >>
> > >>
> > >>> Wiadomo=C5=9B=C4=87 napisana przez Yosry Ahmed <yosryahmed@google.c=
om> w dniu 29.08.2024, o godz. 23:54:
> > >>>
> > >>> I also noticed that you are using z3fold as the zpool. Is the probl=
em
> > >>> reproducible with zsmalloc? I wouldn't be surprised if there's a
> > >>> z3fold bug somewhere.
> > >>>
> > >>
> > >> Hmm - yesterday i recompiled 6.9.12 with zsmalloc and =E2=80=A6. aft=
er 16h of continuous tests I can=E2=80=99t reproduce issue.
> > >> With zsmalloc 6.9.12 looks to me like stable.
> > >
> > > Interesting, and a little bit what I hoped for tbh.
> >
> > :-)
> >
> > I tested mainline 6.10.7 with 26h test and also it is stable with zsmal=
loc
> >
> > >
> > >>
> > >> With this - what will be your advice to move forward?
> > >
> > > Well, it's possible that some zswap change was not fully compatible
> > > with z3fold, or surfaced a dormant bug in z3fold. Either way, my
> > > recommendation is to use zsmalloc.
> > > I have been trying to deprecate
> >
> > IMHO - isn=E2=80=99t bug in this report + difficulties to reproduce->fi=
x enough to depreciate z3fold?
>
> I would say this bug report is yet another reason why we should deprecate=
 it.

+100000.

This is precisely why I was asking which allocator was being used
here. We have also accidentally selected z3fold internally a couple
times in the past, which had bitten us as well.

>
> >
> > > z3fold, and honestly you are the only person I have seen use z3fold i=
n
> > > a while -- which is probably why no one else reported such a problem.
> >
> > Well - in fact this is ArchLinux - not me.
> > I=E2=80=99m using Arch and kernel in builder machine with ArchLinux con=
fig + packaging
>
> According to [1], zsmalloc should be the default allocator for zswap
> on ArchLinux. Anyway, I initially thought that no one was using z3fold
> and it was bitrot, but apparently some people are using it and it's
> actively harming them.
>
> [1]https://wiki.archlinux.org/title/Zswap
>
> >
> > >
> >
> > I see benefits already: on very memory demanding qtwebkit compile:
> > z3fold: swap frequently gets 6..8G from 16G available
> > zsmalloc: can=E2=80=99t see more than 1..2G

Exactly :) zsmalloc is better than z3fold in a lot of workloads that I
have observed.

> >
> > > doubt that you (or anyone) wants to spend time debugging a z3fold
> > > problem :)
> >
> > lets depreciate it!
>
> I tried deprecating it before [2] and performed some analysis [3], but
> there was some.. resistance. Maybe I will try again and use this bug
> report as yet another argument for deprecating z3fold :)
>
> [2] https://lore.kernel.org/linux-mm/20240112193103.3798287-1-yosryahmed@=
google.com/
> [3] https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=3D2Ww13sCj4S3i=
4bNndqF+3+_Vg@mail.gmail.com/

I don't wanna sound like a broken record. But this has been the nth
time we need to spend extra engineering time and effort unnecessarily
because we have not deprecated z3fold.

If you need more datapoint - here's our last conversation where z3fold
was a problem:

https://lore.kernel.org/lkml/CAKEwX=3DMo+EaaxBYcLMTHYADB4WhqC3QmWV3WQ0h2KM4=
91FRuQA@mail.gmail.com/
