Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F7D1BC3F
	for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184745; cv=none; b=KNVfSuT7evEo24pU8zocSV2AH8DLh036ceRentqwwpysXDa5Fi+U1fg8oa05GQ8uurcBBtDn+fXLYruZ6oiG0lsOgUvRqWGkXL4FnWPbObaNrHAirGj7kerrgjwTKoJtVxJsbwcHM1SjdJ6R8Zpq1WG74SKlDtURexBo6Fi1kAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184745; c=relaxed/simple;
	bh=mm3yab2sZRR/+DADP2ehV8G/nxgMSR70bl1lJapIZkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mb8aZXsBLceBXoiCOhndySD1oHE12W0ePricgJNPfjNpqkX8oMBga74ECtqM3OW4wGub+rE0a9hLEiAIeWMCnlbi5tjU8VBXlr2lgk+hGNazxd31vg1NcKQMITZuHw5zPZdKB0MjDYv2fp+PAo6+NQ/wMMj5vP1aOaBylJjeASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ygWmmWC+; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ygWmmWC+"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b31afa781so50012011fa.3
        for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750184740; x=1750789540; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ4qkDHPaV7BDdZpqRDsoJFCKFnruqaPeK/AbJzqYW0=;
        b=ygWmmWC+gE+Vv69EJ7XlHaAcXkVN1r83lS2y5AFYl0UT3Z5hHbwGMSDkzglvEqVB35
         10e0psnwo6A6eg80OuZwuE39v/byNmXVNr5rkbd6C78FSujgbQEx6ao6TvUoql5z/XL0
         GUjHrm1yNOAbISu7R6x8Xo50kAn8svY1HNp/QH8bn5cI0ww3RijurkhcKkEC4DCOiRCO
         Kp9BiraUvfNrZVWACPDQl3K9EhOIdwR+sJqds+4YvFWZV1FPj074FkFkQxnLtfyiw5ep
         BiYafxju1lURf0sTGRYxtmIKotauOROuvq/RvEm4zRG6sRHggkfdgFDi3Gq12/wAjvw8
         xj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750184740; x=1750789540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQ4qkDHPaV7BDdZpqRDsoJFCKFnruqaPeK/AbJzqYW0=;
        b=lYjMHl7N1eHei3zfWOJlbi0iEaG3diRyjkoXStMd+SCYIi4bi+2KMcx0LRoUf1V2ds
         W9iRm+1gnbTxsKb+cmTGQTG6bRLnm4xDmwXsI896f6/p5PN7LHWM/Ofwd4J6gDqa9xDh
         rAhG9uF24g1SYLXiXUTNmB3LZ+KGTWXhpmnDlea2nRbLshsTx7u2isRSpKbS/MtpYMgx
         XYzj3P19yKMhTlWa921MdZQ1Ptm7Sf/mDiIyG6aLh4mHuSHtnxy6bMpXfqdTwQbTEi+v
         HSL2fZcnBsEGuOaaQbJjqBmrVP61Z/Uz/uK9i9nPSXDBHQf1t9+7n352q/RsXmF6iuPL
         2NMw==
X-Forwarded-Encrypted: i=1; AJvYcCUlKAg0WfNo7lzEwHum395/0fmr5+HiuBVg9vaOKbs1Eai5/P3hKW1+T+QPNGRYkjpKqBCHN5KEKd+rPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIXiSeLrxG27Mkp9iPAnE6/tpi2OZ841giN5pinT+8lkvxmn9r
	Hp9XuyoGFHVyOmisRQ/RayQbNA7Fqo1Au0si0829yqeSv6UssRkzAHU76JJo1qGUgSdXLGfp269
	kwz2AB05iasvg2WnQFGqIPXhGtWEfV6l+MTxJSexk
X-Gm-Gg: ASbGncufY8HEEXMEsu8Z4olNzsR6p3d1KI//x469CTTA7eaQmI2Rnxxwe6zyCkh5EaV
	WYAuHYzY2gTRMa5YS2TrjBrIYPANgClKBZz1UjrX4GCVZPFj3mBteU8AHjfnzqgF83oI+QWW7yO
	3e4DN5cvUllYTPCPppmCKdywTk9Fev3dqCsBCw//9RmVg=
X-Google-Smtp-Source: AGHT+IGrZsLW9DjNWb5jhWUSKce2LjoSTMDK2XGnOs97Tp7M1TXO9eH5XVrHznP63PG8KFJ6Tm2Hr3oMej0naxklo9I=
X-Received: by 2002:a05:651c:1423:b0:32b:47be:e1a5 with SMTP id
 38308e7fff4ca-32b4a7030d3mr30371381fa.39.1750184739953; Tue, 17 Jun 2025
 11:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aElivdUXqd1OqgMY@karahi.gladserv.com> <2025061745-calamari-voyage-d27a@gregkh>
 <aFGl-mb--GOMY8ZQ@karahi.gladserv.com>
In-Reply-To: <aFGl-mb--GOMY8ZQ@karahi.gladserv.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 17 Jun 2025 14:25:02 -0400
X-Gm-Features: AX0GCFsmrlWBjBQ22REUW9WD_pmKQ8rQnTSfDc9BIdn9LRRzQhwwh-qhv8-aS4g
Message-ID: <CA+FuTSen5bEXdTJzrPELKkNZs6N=BPDNxFKYpx2JQmXmFrb09Q@mail.gmail.com>
Subject: Re: 6.12.y longterm regression - IPv6 UDP packet fragmentation
To: Brett Sheffield <brett@librecast.net>
Cc: Greg KH <gregkh@linuxfoundation.org>, Brett Sheffield <bacs@librecast.net>, 
	stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 1:29=E2=80=AFPM Brett Sheffield <brett@librecast.ne=
t> wrote:
>
> Hi Greg,
>
> On 2025-06-17 15:47, Greg KH wrote:
> > On Wed, Jun 11, 2025 at 01:04:29PM +0200, Brett Sheffield wrote:
> > > Longterm kernel 6.12.y backports commit:
> > >
> > > - a18dfa9925b9ef6107ea3aa5814ca3c704d34a8a "ipv6: save dontfrag in co=
rk"
> >
> > It's also in older kernels:
> >       5.10.238
> >       5.15.185
> >       6.1.141
> >       6.6.93
> >
> > > but does not backport these related commits:
> > >
> > > - 54580ccdd8a9c6821fd6f72171d435480867e4c3 "ipv6: remove leftover ip6=
 cookie initializer"
> > > - 096208592b09c2f5fc0c1a174694efa41c04209d "ipv6: replace ipcm6_init =
calls with ipcm6_init_sk"
> > >
> > > This causes a regression when sending IPv6 UDP packets by preventing
> > > fragmentation and instead returning EMSGSIZE. I have attached a progr=
am which
> > > demonstrates the issue.

Thanks for the analysis. I had received a report and was looking into
it, but had not yet figured out this root cause.

> >
> > Should we backport thse two to all of the other branches as well?
>
> I have confirmed the regression is present in all of those older kernels =
(except
> 5.15.185 as that didn't boot on my test hardware - will look at that late=
r).
>
> The patch appears to have been autoselected for applying to the stable tr=
ee:
>
> https://lore.kernel.org/all/?q=3Da18dfa9925b9ef6107ea3aa5814ca3c704d34a8a
>
> The patch follows on from a whole series of patches by Willem de Bruijn (=
CC), the
> rest of which were not applied.
>
> Unless there is a good reason for applying this patch in isolation, the q=
uickest
> fix is simply to revert that commit in stable and this fixes the regressi=
on.
>
> Alternatives are:
>
> 1) apply a small fix for the regression (patch attached). This leaves a f=
ootgun
> if you later decide to backport more of the series.
>
> 2) to backport and test the whole series of patches. See merge commit
> aefd232de5eb2e77e3fc58c56486c7fe7426a228
>
> 3) In the case of 6.12.33, the two patches I referenced apply cleanly and=
 are enough
> to fix the problem.  There are conflicts on the other branches.
>
> Unless there is a specific reason to have backported
> a18dfa9925b9ef6107ea3aa5814ca3c704d34a8a to stable I'd suggest just rever=
ting
> it.

FWIW, I did not originally intend for these changes to make it to stable.

The simplest short term solution is to revert this patch out of the
stable trees. But long term that may give more conflicts as later
patches need to be backported? Not sure what is wiser in such cases.
