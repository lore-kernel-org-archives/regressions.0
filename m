Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7B18C03A
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727274779; cv=none; b=D9JnaCpACMR84QnKvgZ/00gAqAvV7MCVcWOonOPBk4BCkfq+Cn+6lv1PDkpec+vLoftNldEjGHNqlxOsDZAz+UxGBfUxZLss2NTqccdNyZiu/AVQPBhyI35d5CoCl4s+EKj2PnFItYkbrU1VXqy9J8H/u0MohB0+XNQduYgezwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727274779; c=relaxed/simple;
	bh=AVT00B+SF1KCg9pNHSVXr4zanT50FoflXLxkF48ZKZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqrfmi9qjMdZKS3w+RfOgYuyyyGDH5HETHH6IhRlhRNZP3C9YzdoltMqthBz6jQS/Et8gRwVcwlvMx6CBvCMxSRQuUAI/WoV4k21GGEWcX4tbhKF74kYTxj++tZOU9QJ19ybtm01RQTjVp8ilBQiUC6epIk1k4APdLCAGPCGc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cd1761iK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cd1761iK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727274777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGuobhGKG8NrJUlif1sRCtxHMwTeGlqMIrISMQPns7w=;
	b=Cd1761iKI3UyLszQ2/M4aGJX3HzqbSQUnLuMw6N7oeA17d0vJbuR3VwAKPxu9TPkYcfNE2
	nAKssAtUaubaMg/R50WRyZ+sEdleYlX5jT82mfpIQn4OONki/QMRaIa8ybJhUIUiFWIMbV
	tujrDfRSHiDNm9lkMQRcSjuVIrYtMaE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-yNAy-pZVNZ-E-9IjlFoQWA-1; Wed, 25 Sep 2024 10:32:54 -0400
X-MC-Unique: yNAy-pZVNZ-E-9IjlFoQWA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2d877d2ad3fso8484166a91.2
        for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 07:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727274774; x=1727879574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGuobhGKG8NrJUlif1sRCtxHMwTeGlqMIrISMQPns7w=;
        b=XDwsnsDfsigw4SgfYGAvLJLQbfzZElEusYZluh4BEr7Qljvrpdn9c0dnYkPoC3qMwn
         oRLxNJAQnNMnLqeAIoQolIrUM+vRCcIRlzXd2op2cg9lG2ZvF1nEOTaLOyIDlBb15HB/
         iHTXZcKd992ag40T4tFeYItM0CWL/qtqEpFXHFwJ4sIULcYUCDQoRBHL47eGJjtbT7It
         WC5JiIcJpHgzEMdSDtjr+gd/llPjyDI7txaZQjpJ/4K95cdjWVk8MDEr1DQvdfUbHt8j
         M1zUX73Gg+SLVGD261rNwqjEv7zgjup4ptciJ23t8BWSwrP+yVcMHSc9jENA1RuXgewd
         gKXw==
X-Forwarded-Encrypted: i=1; AJvYcCXGflnp7JDgeGYIuX0FthkEATacW6eoa9HskL5Om6rfCZBvOw2QugQcTzpuQa13HkWJ0kr8NQYhYHPzhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDiFfgoZHGrHEqCJ+TpH5BGRUAHSpt3sbeEBDm1f6qJsZGFCJF
	00Uzr8ZbJEbA+zXiuObBD/ne5TjUqzKYBJNmq6jvIVggfxkRV0hzPWreAgiV88pE/ard8C7+Wmd
	p9KpiT2qkyv1sSGSUqwh7M06shzk6GCly7v96Tv4B3J3sVKRta0KZIcJcr2Ycl8SAmV6wUZGadV
	o+1yRsJoGRkjyQuvLtBSGkeDazQMD4nLVOTho=
X-Received: by 2002:a17:90a:2e8a:b0:2d8:97b7:449f with SMTP id 98e67ed59e1d1-2e06afdfc57mr3284679a91.38.1727274773862;
        Wed, 25 Sep 2024 07:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN3VFNWLgkNuYaHggvJn3laFCkFOyLDd+0+U/Dpwv04ItDLujsU2bOUncGiP/g6qe4Py4pNMEVvbEY+s4v/0I=
X-Received: by 2002:a17:90a:2e8a:b0:2d8:97b7:449f with SMTP id
 98e67ed59e1d1-2e06afdfc57mr3284655a91.38.1727274773539; Wed, 25 Sep 2024
 07:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
 <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org> <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
 <202409221511.9AF49BD@keescook> <CAJD_bP+6qCgseo9of-cKW3+nH_UbGFwPo6WRbqqcneOZ+EEtOw@mail.gmail.com>
 <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
In-Reply-To: <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 25 Sep 2024 10:32:42 -0400
Message-ID: <CAJD_bPKNbKo5tj4OV4MpgtSN6_FXfmQtBFgVFzZeZapCPNT6PA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 1:36=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On September 24, 2024 8:58:57 AM PDT, Jason Montleon <jmontleo@redhat.com=
> wrote:
> >On Sun, Sep 22, 2024 at 6:38=E2=80=AFPM Kees Cook <kees@kernel.org> wrot=
e:
> >> Can you try this patch? It should avoid using the "WARN" infrastructur=
e
> >> (if that is the source of blocking boot), but should still provide som=
e
> >> detail about what tripped it up (via the "regular" pr_*() logging). An=
d
> >> if it boots, can you look at the log to find what it reports for the
> >> "Wanted to write ..." line(s)?
> >>
> >> Thanks!
> >>
> >> -Kees
> >>
> >>
> >> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-st=
ring.h
> >> index 0d99bf11d260..469a3439959d 100644
> >> --- a/include/linux/fortify-string.h
> >> +++ b/include/linux/fortify-string.h
> >> @@ -549,7 +549,8 @@ __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_=
size_t size,
> >>                                          const size_t q_size,
> >>                                          const size_t p_size_field,
> >>                                          const size_t q_size_field,
> >> -                                        const u8 func)
> >> +                                        const u8 func,
> >> +                                        const char *field)
> >>  {
> >>         if (__builtin_constant_p(size)) {
> >>                 /*
> >> @@ -610,8 +611,13 @@ __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel=
_size_t size,
> >>          * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101832
> >>          */
> >>         if (p_size_field !=3D SIZE_MAX &&
> >> -           p_size !=3D p_size_field && p_size_field < size)
> >> -               return true;
> >> +           p_size !=3D p_size_field && p_size_field < size) {
> >> +               if (p_size_field =3D=3D 0)
> >> +                       pr_warn("Wanted to write %zu to a 0-sized dest=
ination: %s\n",
> >> +                               size, field);
> >> +               else
> >> +                       return true;
> >> +       }
> >>
> >>         return false;
> >>  }
> >> @@ -625,7 +631,8 @@ __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_=
size_t size,
> >>         const size_t __q_size_field =3D (q_size_field);               =
    \
> >>         fortify_warn_once(fortify_memcpy_chk(__fortify_size, __p_size,=
  \
> >>                                      __q_size, __p_size_field,        =
  \
> >> -                                    __q_size_field, FORTIFY_FUNC_ ##o=
p), \
> >> +                                    __q_size_field, FORTIFY_FUNC_ ##o=
p,\
> >> +                                    #p " at " FILE_LINE), \
> >>                   #op ": detected field-spanning write (size %zu) of s=
ingle %s (size %zu)\n", \
> >>                   __fortify_size,                                     =
  \
> >>                   "field \"" #p "\" at " FILE_LINE,                   =
  \
> >>
> >>
> >> --
> >> Kees Cook
> >>
> >
> >Hi Kees,
> >Sorry for the delay in responding. Your patch also caused the system
> >to hang booting, but I took it as inspiration to try some things.
> >TL;DR I see these two print several times:
> >
> >Wanted to write 8 to a 0-sized destination: oldptr at
> >arch/riscv/errata/thead/errata.c:185
> >Wanted to write 28 to a 0-sized destination: oldptr at
> >arch/riscv/errata/thead/errata.c:185
> >
> >Since I suspected CONFIG_ERRATA_THEAD_MAE which relies on
> >CONFIG_RISCV_ALTERNATIVE_EARLY I suspected it is just too early for
> >pr_*, etc. I tried trace_printk but that didn't produce any traces,
> >and then I found a comment which makes me think we're too early for
> >that too.
> >https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/riscv/kernel/alternative.c?h=3Dv6.11#n214
> >
> >I didn't want to give up so I wrote a simple module to figure out how
> >to use sbi_ecall and then incorporated that idea into your patch,
> >although even that was not straightforward:
> >https://gist.github.com/jmontleon/f3536ad70dc92bed992139ad5b266d5c
>
> Oh nice work! Probably something riscv-specific needs to be wired up to t=
he printk routines to do what you have there until printk is fully availabl=
e  But that's a separate issue, I guess.
>
> >Full output: https://gist.github.com/jmontleon/823facff38e28b717f153e38a=
dcfd7fe
>
> Does the system boot with your patch?

Yes. It boots fully. It also booted with trace_printk, it just didn't
produce a trace, which again I think is expected at that stage. It
seems as long as there are no 'normal' print attempts, pr_()*, etc. it
works.

> I would guess that this line at arch/riscv/errata/thead/errata.c:168:
>
> void *oldptr, *altptr;
>
> Should be:
>
> u8 *oldptr, *altptr;

I tried this, but it didn't appear to make a difference, I will try
some more today, though I admit to being out of my element.



> But maybe __ALT_PTR needs adjustment too? Hmm. I would have expected void=
 * to have a size of SIZE_MAX here, though, so something else might be conf=
using the check.
>
>
> --
> Kees Cook
>

