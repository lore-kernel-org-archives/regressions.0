Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2594F1F8670
	for <regressions@lists.linux.dev>; Thu,  3 Apr 2025 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713975; cv=none; b=lsWfLHa31QMWsAl5ugErn9cRD9RTDUzBnQ/ungZR7dWTA2CxPVfKm4PU7liZCOhJ7hrcYR/xgtI1OsEP9omqu5d8KZPPSYHP13/T4ez0PQGNULp8eki+IbGDnBOQ02aKfuK13ZQyVXGj07RefEsvTRc7xJIHG+txiTL2SqK3OJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713975; c=relaxed/simple;
	bh=XZSVHUm5soGM5AHXJaODF6n3fbloNApqNsoEQaLwhsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i45rHXrGcLFvZhm4UpovrGoqqkpyNgW+mQSkWDo1S5hsfjPeD+4DzDdTj5BohUYWCd7fN00QdnTcWBxhB5+0ffnWyvJj1x/FsiYB1Mwjs56Dau85UYPFPDVELTbhdGGLvjmuZuWgtyUuJ6MAWo6i92sgVEvMMdrN27ezieRD1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzGP8w/D; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzGP8w/D"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfca745c7so11877131fa.0
        for <regressions@lists.linux.dev>; Thu, 03 Apr 2025 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743713972; x=1744318772; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntmUxPu/EufjR/lqgI+frWP/rYsW6pLhQzc2gns3ozs=;
        b=MzGP8w/Da7J0cblQQgL/wxS2RWsGO13inbxIg6FL9macUkELgYh6IwJlB5OLOWDjsv
         GDC99KDo2TaJbKtDeJnLoDgmp71jgLO0+TwH2BclqbspVvli8KmlUm3M/0+05k7CQX4p
         WZAUjdIlzJ3WGO4JiFMgKqZSf8VHJFmFN3xyon5n6CLrkyBZz3vFHqLna6PE9kv5S6Hs
         zl6aw7/mXhssiwWeJzaGP3EwaeBS3lzO6nIqM3H34yU0OKG144yXFkldBLUApCx6ebo3
         v7ffTRXaQxYbNg9Y4pFF0Ro/CAY4HlHtN0+yIgHLbHBmXzD7Lt0LxlAqqryUtnSVdyzd
         YK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743713972; x=1744318772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntmUxPu/EufjR/lqgI+frWP/rYsW6pLhQzc2gns3ozs=;
        b=RDT3dy5D/OBdqRdmO98/zoj1iCnf5snVWxyeZD9TQzNmR/MZOAmdG3+VqFwRrcV2D/
         7+oMxfYR58G0N+3duwAnzFgWKO5Q8pilA2SBPknHsW2uNGKcRZIO+IVrTrwYUFCr0jKw
         UXq1x1vXVdf61A2j75MKWw+z+NVPhC3m3+S6iBppo+d4M0y4+fapZKrMwAX6KdEBxNde
         /ZZwWqJn4EdLxLRHj2TRbvDwUN5HYVuffdjy+FpOVbw3xJaJjDpTdMMPWRinNe9v+CoQ
         lYmAsBvy3k1UCR5G391gc6Dj6503Mju4CfqNTZuBHyv6Xl97EKpqcjmPCduQxfxjCeEe
         EK4A==
X-Forwarded-Encrypted: i=1; AJvYcCVjvXyi5xiPdsdlKj+3G0BvvfQqgQDgz2UZub2F2Akv+vBfu50bSRd6GdSYkkgu94+ExBG6LjTiOYaFzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/KN/oZzeaajIVUw21QsoSY8O0McKNNQqO9+rwvYoZIS9adCY5
	Jg7PRJEKeftcTCGzA3CcPYd8eHqesBxjMGE8CE/JTCnFXPNF6uKtw19T9sRf1wIivixyrLkTI6D
	+dciksE9fTio5JNkngekmyPpM0RE=
X-Gm-Gg: ASbGnctdDdLR86jyDiFgF5VISa/VQeI6yQtE0bq5DEkFVnGjMC9Cqbs48ZznJWoKIuj
	A40CdaEvqpaerKDP7HCk+ykx4ryahq3pRvHdDulfsfk5t+CF2Z7c27v7iz7CIWhmM8sNVbq8/GA
	fOzJbrU+3WvS74gsJ4cKiQZYw+bznBCCwxgLmJ
X-Google-Smtp-Source: AGHT+IEMBg0c83tQuu7FZEYPk7IXf94CVSaS6Wyj6Wg5HQet4eNrT/p7/2KgnMQzQMVmz48AqDF7AggFY7b5XH/3JRA=
X-Received: by 2002:a05:651c:1449:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-30f0a17fab1mr3568061fa.25.1743713971958; Thu, 03 Apr 2025
 13:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de>
 <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de> <CAFULd4Z48Vh_UW6+Q-BJ3c42eo7QaKhAbhZRX+Eegx0Te4+z6g@mail.gmail.com>
 <dfb96de9-b28a-4eac-ac73-88bfb9c44245@molgen.mpg.de> <CAFULd4ZGWFN00AVQ3Y3yg4HJgdbb5o_hxERnskggFtxfCUBieA@mail.gmail.com>
In-Reply-To: <CAFULd4ZGWFN00AVQ3Y3yg4HJgdbb5o_hxERnskggFtxfCUBieA@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 22:59:19 +0200
X-Gm-Features: ATxdqUFYzfzvNB6r9fygZ2zlGhh3ge5bjtBNFw-zzUxJ7PGcnyrQDclDkMq8Tfs
Message-ID: <CAFULd4bCdtnsOwWWkKU4uQp00w10NkdGBXUx-3y9g8mkLCN_pQ@mail.gmail.com>
Subject: Re: New warning `cryptd: no symbol version for this_cpu_off`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Brian Gerst <brgerst@gmail.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: multipart/mixed; boundary="000000000000e390060631e60bed"

--000000000000e390060631e60bed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 3:42=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Thu, Apr 3, 2025 at 3:20=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
> >
> > Dear Uros,
> >
> >
> > Am 03.04.25 um 15:14 schrieb Uros Bizjak:
> > > On Thu, Apr 3, 2025 at 2:30=E2=80=AFPM Paul Menzel <pmenzel@molgen.mp=
g.de> wrote:
> > >>
> > >> #regzbot ^introduced: 6a367577153a
> > >>
> > >> [To: +Uros, Cc: +Nadav, +Andrew]
> >
> > >> Am 03.04.25 um 09:35 schrieb Paul Menzel:
> > >>
> > >>> On the Intel Kaby Lake laptop Dell XPS 13 9360, updating from
> > >>> 6.14.0-11270-g08733088b566 to 6.14.0-12456-gacc4d5ff0b61, Linux log=
s the
> > >>> new warning below:
> > >>>
> > >>>       cryptd: no symbol version for this_cpu_off
> > >>>
> > >>> I haven=E2=80=99t bisected it, but could it be commit 06aa03056f90 =
(x86/smp:
> > >>> Move this_cpu_off to percpu hot section). It says to have no functi=
onal
> > >>> change though.
> > >>
> > >> `git bisect` led to commit 6a367577153a (percpu/x86: enable strict
> > >> percpu checks via named AS qualifiers).
> > >>
> > >>       $ git bisect start
> > >>       $ git bisect good 08733088b566
> > >>       $ git bisect bad acc4d5ff0b61
> > >
> > > Can you please post your .config?
> >
> > Sorry, I didn=E2=80=99t attach it right away. It=E2=80=99s attached now=
.
>
> Huh, it looks that modpost chokes on __seg_gs prefixed symbols.

It is not modpost, but genksyms that doesn't know how to handle
__typeof_unqual__().

Can you please test the attached patch, it should fix the problem for you.

Thanks,
Uros.

--000000000000e390060631e60bed
Content-Type: text/plain; charset="US-ASCII"; name="p.diff.txt"
Content-Disposition: attachment; filename="p.diff.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_m91u6ool0>
X-Attachment-Id: f_m91u6ool0

ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaCBiL2luY2x1ZGUvbGludXgvY29t
cGlsZXIuaAppbmRleCAyNzcyNWYxYWI1YWIuLjk4MDU3ZjkzOTM4YyAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9jb21waWxlci5oCisrKyBiL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaApAQCAt
MjI5LDEwICsyMjksMTAgQEAgdm9pZCBmdHJhY2VfbGlrZWx5X3VwZGF0ZShzdHJ1Y3QgZnRyYWNl
X2xpa2VseV9kYXRhICpmLCBpbnQgdmFsLAogLyoKICAqIFVzZSBfX3R5cGVvZl91bnF1YWxfXygp
IHdoZW4gYXZhaWxhYmxlLgogICoKLSAqIFhYWDogUmVtb3ZlIHRlc3QgZm9yIF9fQ0hFQ0tFUl9f
IG9uY2UKLSAqIHNwYXJzZSBsZWFybnMgYWJvdXQgX190eXBlb2ZfdW5xdWFsX18oKS4KKyAqIFhY
WDogUmVtb3ZlIHRlc3QgZm9yIF9fR0VOS1NZTVNfXyBvbmNlICJnZW5rc3ltcyIgaGFuZGxlcwor
ICogX190eXBlb2ZfdW5xdWFsX18oKSwgYW5kIHRlc3QgZm9yIF9fQ0hFQ0tFUl9fIG9uY2UgInNw
YXJzZSIgaGFuZGxlcyBpdC4KICAqLwotI2lmIENDX0hBU19UWVBFT0ZfVU5RVUFMICYmICFkZWZp
bmVkKF9fQ0hFQ0tFUl9fKQorI2lmIENDX0hBU19UWVBFT0ZfVU5RVUFMICYmICFkZWZpbmVkKF9f
R0VOS1NZTVNfXykgJiYgIWRlZmluZWQoX19DSEVDS0VSX18pCiAjIGRlZmluZSBVU0VfVFlQRU9G
X1VOUVVBTCAxCiAjZW5kaWYKIAo=
--000000000000e390060631e60bed--
