Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D8383A9
	for <regressions@lists.linux.dev>; Mon,  1 Apr 2024 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711982210; cv=none; b=U0EKmjoepvCeGQ5FAbDXuztc8yw9uQgPXy1nDyGZwc+DSd3F6omozfZ/qas0mqJCemNbV9YRQ2D0vezYxukHtCUTPL1hbaQaq0p1TbYuEsw+zb779Ho7QW3BpCqtGSfGJSb/R6AfFBvNJaEcxXgBIqNn6DYB2rGqYo6iMmIVgKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711982210; c=relaxed/simple;
	bh=EEmuc+b2AkAn41DgNIfZqUpWsbsfsG2NOQu7/VnUndE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eiu4B9pllaFVpMZy14JQBUYxNixTFaejYwWmabzHRMHtiC7lJh1k3+OkuktpbMe+vQfky8C3vCC/L0Pd80z4fe2BYN+7wNpzVsTV4CzL6TQ99zTee+G+50StGhTV5G9SSUzAQwaNQR94zys8SBdw1qmiON/DXm1Hhw5uMOssMzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kj5GwetP; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kj5GwetP"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-432d55b0fa9so435981cf.1
        for <regressions@lists.linux.dev>; Mon, 01 Apr 2024 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711982207; x=1712587007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pODHKe4h1pzV0fTG3f868sZOWbcBvAE1L0zwg0ZSk74=;
        b=kj5GwetPba6Ef6w9hHAMSibnpD6qwg1KP9l0LoDLeHc7kHKG43Cks24NSbzRRZKEH6
         gz4Bb4gS2B5pRC3zFWWWf4poRZnmz1Nm3o2jMmdhoTUl6HobEBi7y6Hy/eHX+FFB6zBS
         xO4ycjfcQcMgWEiyw87Ue/6DbtfrgO8XfYAv1gwKMp/E5lIQJbW37/NorPbwHc4xZUxQ
         rVtAGLH73F0xccUbRZkNT1qawTtvlp0xTW31eZ7Oh6N0gM9tpXSgiz7aFs5MGG7/d6Q/
         qnUjnYzFIDxbV+r2og3qNnLeuMI1zVqDom+s5AS2+Vcbieh23jg70+N0E5eTJ6ykbM6t
         6wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711982207; x=1712587007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pODHKe4h1pzV0fTG3f868sZOWbcBvAE1L0zwg0ZSk74=;
        b=cpGViXTQ7YDarxvkMy1n08bQ17I+I34FhrLPn7OpO75aebqI38YdLnQiIW695oFhT+
         7ebfaIWqU1N/GqzSkjpz1Z9VGVdQcxWbjDvvTZMHlvbFqm7H+V7xabufwAu9S3nOYxQ6
         T7XByyWQErHGrks22DszI/sPG9yje133B80G9kes835O+XP4GKlrzHDbu3arDxkPKfkT
         CqFQCz8hO4uNWnAJoKMkKKjqrtdPpdpsvGv4wenUSeTDt/4JmUgbCvqVNwwHCsoCuhdf
         e96VURWftH0GaLEZ0JP33jjUQ9WOO+NU0hsaFxOjf09LjkUKtn2WY8pou01SAYlhemHQ
         IaEA==
X-Forwarded-Encrypted: i=1; AJvYcCVqR2AasmZKXr+tVnlpM+gWMFGdfziBfson6Kj3g+mr80TsFC4Lp3eqZPdWyQIH3uVoICe8CVwvv1ObA8Cvj0UDVe8VZl0LKXExuQg=
X-Gm-Message-State: AOJu0Yx5nsLsLmO4UUOuLQ3MfJ+BkwH+P9hXZ7rqUmnRewU8cYUpdgK+
	MjGzDQ2dRU/E22lWXqMiq3owzy+WeJWm/0Um3ByKIKJgf332DZJczEb1zJzJLVB6gdDOJd7DUnn
	eBNPEhAwBj4HPwroS02MF95jk4VHx9zqS4Hmg
X-Google-Smtp-Source: AGHT+IFIKGtehE7EtnkbuM+FGm+p/vKoFf3BbH+1VMoO4S3HYrVMe4yr936V9dflX6oN4dO9In0k2mzov9SRMoBv+Bg=
X-Received: by 2002:a05:622a:1e08:b0:432:b567:407d with SMTP id
 br8-20020a05622a1e0800b00432b567407dmr739326qtb.6.1711982207211; Mon, 01 Apr
 2024 07:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZgrAM4NjZQWZ2Jq6@archie.me> <2024040143-shrimp-congress-8263@gregkh>
 <ZgrD-XtaG9D8jFnA@archie.me>
In-Reply-To: <ZgrD-XtaG9D8jFnA@archie.me>
From: Greg Thelen <gthelen@google.com>
Date: Mon, 1 Apr 2024 07:36:08 -0700
Message-ID: <CAHH2K0apZttqAhMZ9H_fygUC_Oa9G5-4XYmmqZu-EWNOuqc4Xg@mail.gmail.com>
Subject: Re: Fwd: stable kernels 6.6.23 and 6.1.83 fails to build: error:
 unknown type name 'u32'
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Greg KH <greg@kroah.com>, Viktor Malik <vmalik@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>, Alexei Starovoitov <ast@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, ncopa@alpinelinux.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 7:26=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Mon, Apr 01, 2024 at 04:15:25PM +0200, Greg KH wrote:
> > On Mon, Apr 01, 2024 at 09:09:55PM +0700, Bagas Sanjaya wrote:
> > > Hi,
> > >
> > > On Bugzilla, ncopa@alpinelinux.org reported resolve_btfids FTBFS regr=
ession
> > > on musl system [1]:
> > >
> > > > The latest releases fails to build with musl libc (Alpine Linux edg=
e and v3.19):
> > > >
> > > > ```
> > > > rm -f -f /home/ncopa/aports/main/linux-lts/src/build-lts.x86_64/too=
ls/bpf/resolve_btfids/libbpf/libbpf.a; ar rcs /home/ncopa/aports/main/linux=
-lts/src/build-lts.x86_64/tool
> > > > s/bpf/resolve_btfids/libbpf/libbpf.a /home/ncopa/aports/main/linux-=
lts/src/build-lts.x86_64/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-=
in.o
> > > > In file included from main.c:73:
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:7:9: error: unknown type name 'u32'
> > > >     7 |         u32 cnt;
> > > >       |         ^~~
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:8:9: error: unknown type name 'u32'
> > > >     8 |         u32 ids[];
> > > >       |         ^~~
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:12:9: error: unknown type name 'u32'
> > > >    12 |         u32 cnt;
> > > >       |         ^~~
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:13:9: error: unknown type name 'u32'
> > > >    13 |         u32 flags;
> > > >       |         ^~~
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:15:17: error: unknown type name 'u32'
> > > >    15 |                 u32 id;
> > > >       |                 ^~~
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:16:17: error: unknown type name 'u32'
> > > >    16 |                 u32 flags;
> > > >       |                 ^~~
> > > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux=
/btf_ids.h:215:8: error: unknown type name 'u32'
> > > >   215 | extern u32 btf_tracing_ids[];
> > > >       |        ^~~
> > > > make[4]: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/tools=
/build/Makefile.build:98: /home/ncopa/aports/main/linux-lts/src/build-lts.x=
86_64/tools/bpf/resolve_btfids
> > > > /main.o] Error 1
> > > > make[4]: *** Waiting for unfinished jobs....
> > > > make[3]: *** [Makefile:83: /home/ncopa/aports/main/linux-lts/src/bu=
ild-lts.x86_64/tools/bpf/resolve_btfids//resolve_btfids-in.o] Error 2
> > > > make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2
> > > > make[1]: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/Makef=
ile:1354: tools/bpf/resolve_btfids] Error 2
> > > > make: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/Makefile=
:234: __sub-make] Error 2
> > > > ```
> > >
> > > Bisection led to upstream commit 9707ac4fe2f5ba ("tools/resolve_btfid=
s:
> > > Refactor set sorting with types from btf_ids.h") as the culprit.
> > >
> > > See the report on Bugzilla for the full thread and proposed fix.
> >
> > Is the proposed fix a commit to backport?
>
> Nope (see below).
>
> >
> > Digging through entries is not the easiest way to get things resolved..=
.
> >
>
> The reporter posted the fix as bug comment [1] instead (hint: include
> linux/types.h) but not submitted it to mailing lists first.
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218647#c2
>
> --
> An old man doll... just what I always wanted! - Clara

Does https://lore.kernel.org/all/20240328110103.28734-1-ncopa@alpinelinux.o=
rg/
resolve this? It's staged in the bpf tree. Though I'm not sure when
it'll be merged upstream.
