Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077B335BD5
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960782; cv=none; b=h1pJwUHirdCfbCARt30EOAVHJTywsllcYQNyqSQ2Z+oKH+mRJDmD3E43Zf8PuhmmwIcigbwbWqc0ygjUoYUrd+9lWsynocDwQ6tNs9D/xcWCOIQSILi7E5CubjFYYZPXm6RrdHGMxdrXCA7r0UzKCKZspv0c9gDcu6h1JLpYjhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960782; c=relaxed/simple;
	bh=QSCoovFKyuSejATnnpFRaHUf6MGG7N+eW03EWHscftw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXh8wuF2go8Jqm/R3f3WefFJ2Q+hvafowXch5lXu0vQ+zWW74SU2Y6k49O2NB7SLlUkBD7eR1LCva56VZojEONKTTNnbCmP50yaOgZeJwt/Vz2/m+BtKOzpJdQjhwg/1bgFXmuBkg5ZCghvb6DwPnWEgN4rXcTceiVl1Sv+W9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGqzXSk3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGqzXSk3"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a33b06028so45056981fa.2
        for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765960778; x=1766565578; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mlRUHrT4yxTGsEEleTMkt/eOp+5pZyUvB8bhOzrxXd0=;
        b=VGqzXSk3ag3Z1mu+0KoXtQ2RMGJ7JVz8w2SvdEvzXqP+wyCrQm1knpivqith+tLuuD
         S9iXtA0houGXeHMhFY95W+9AMHwPqo6Hogi0TGU0Vi9gY10Q7I8WVwTrBT1qRl/Dp2/U
         +PfLwVfEm54HNoDfnR5gVmsUe4Sxl8Jo3G1B7aGsrd0FtcNx9chOMrIpamdEwMuaLz7m
         Vhu0jzvxrOf8fXNNzWeh3o/z0GYPp1Vy/pWb1v4AQBAlgYbRfV+Qvlv/Ptdl8nsdMj53
         phz3AhUdhlwEsGooE9nbEjbWdbBEsepIDRmkRfPOlOuPBmycNuXxKURhrw5qSJpWhrgC
         4UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765960778; x=1766565578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlRUHrT4yxTGsEEleTMkt/eOp+5pZyUvB8bhOzrxXd0=;
        b=NLwOwnq//BFj7oWM++vmOMuy+w4ciMo+rO2EiCs+ZNe9anWhgqWssRqpQAoFenqET3
         y3tbgdofXfaOtGNpbBPlFqeP/Z4CVaoH7VYUbGUOF8EuD4vqvvOgARmr/XkUGGp1eJQy
         VYLwznhldxPtEoW7jYl0W19Wwz9wzuE4WSXYvdN0tmMzYaimFhCjbMwbbOTAEmIl8oTG
         3kR5hv6euGJWSb5Nl60zfxEtYB9sZXdkYSQfkDsyhUMy25xaE6mGKKlFwqIW6nJNFfHp
         SQBblTmaeoeSpDomft3pCbMrb/sJw6pbiiHox5k1IZBuyzlfycGcAh3aAITwCQygiYHQ
         BRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6boHUHQGIwvjWFZQFDK+/U3nKY+lNKqHIOf8Iu6owGu/z1YPXFqq6b2kxzy5ZvE1SwkuCnR1/KsN/hQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKomw5eovfMpAe1GZlzO5bP+o/KnsT49eZXmE+SGU7B1uCzs39
	WqeyQ1rILMzZ0ZVNOtKiJFVFwLTjokZpDzQI617ZC7HwGKaUMsWrsRgAIqFFINUc1fu28pdT9Dw
	d4SF9t2EWlWqFwQHN8/gGKRT97fLulQw8O3j3rQM8j5zz4zpSfqVSV62D7t0=
X-Gm-Gg: AY/fxX5cw4/DmKdQpKm1nBKL2i+7x0eORritO/UAFgAEkcY6Y+3bSUGo8/QxRy3qpzf
	xmXQrQDNs8DoZyh7OBp4OyZHES7x1LfiT1/xlF6aMinrkrahdD1CHytfK2zQ/xyQW4QhWz3BILy
	bSk4yCuxzpjKS+7HVNFR9asPxWExR++D3KN0nknJjxWR9q66FMlSwhcTFk8ftPB40g/zQQb9trQ
	HdMzW9aP+12xgKK0ESps9r/YHPD7K6ZzY2hM8HS1ot6CBWkYG9yUby0cKgNO3KXq0p0CHa26xox
	7AexBveUEJhvtd8yrbWA/D9AYEwCkjaR0hSf
X-Google-Smtp-Source: AGHT+IG3bCUQ2Je+vHFJWCfzmbfZ0ih8wwvZSujz+GVcPBCBClqAhcuvpVpcxDVBKIgCNYB/hRE55SPatZcL3F8uP3c=
X-Received: by 2002:a2e:a54e:0:b0:37b:aaf7:f022 with SMTP id
 38308e7fff4ca-37fd08a228amr54969901fa.35.1765960778239; Wed, 17 Dec 2025
 00:39:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aS22QhwdrHN24ToD@levanger> <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162>
In-Reply-To: <20251217083202.GA2118121@ax162>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 17 Dec 2025 17:39:25 +0900
X-Gm-Features: AQt7F2qWp-eMj8IYy0rDBA50zsQzYgtGEq5tH-RHnDQAKICwZgnQYI1D1qn-NxM
Message-ID: <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v6.19
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io, 
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Dec 2025 at 09:32, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Dec 17, 2025 at 05:16:02PM +0900, Dmitry Vyukov wrote:
> > On Mon, 1 Dec 2025 at 16:38, Nicolas Schier <nsc@kernel.org> wrote:
> > > Pat Somaru (1):
> > >       scripts/clang-tools: Handle included .c files in gen_compile_commands
> >
> > /\/\/\/\/\/\/\
> >
> > This commit breaks invocation of clang tools for me.
> >
> > For example I now have this fake entry for mock_uncore.c which
> > pretends to produce intel_uncore.o (along with 2 other commands which
> > produce the same object file):
> ...
> > An attempt to invoke a clang tool using this database legitimately
> > fails with the following errors (the file is not supposed and can't
> > compile on its own):
> >
> > clang-tool: drivers/gpu/drm/i915/selftests/mock_uncore.c: exit status 1
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:47:2: error: call to
> > undeclared function 'ASSIGN_RAW_WRITE_MMIO_VFUNCS'; ISO C99 and later
> > do not support implicit function declarations
> > [-Wimplicit-function-declaration]
> >    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
> >       |         ^
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:47:39: error: use of
> > undeclared identifier 'nop'; did you mean 'nopv'?
> >    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
> >       |                                              ^~~
> >       |                                              nopv
> > /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
> >    71 | extern bool nopv;
> >       |             ^
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:48:2: error: call to
> > undeclared function 'ASSIGN_RAW_READ_MMIO_VFUNCS'; ISO C99 and later
> > do not support implicit function declarations
> > [-Wimplicit-function-declaration]
> >    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
> >       |         ^
> > drivers/gpu/drm/i915/selftests/mock_uncore.c:48:38: error: use of
> > undeclared identifier 'nop'; did you mean 'nopv'?
> >    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
> >       |                                             ^~~
> >       |                                             nopv
> > /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
> >    71 | extern bool nopv;
> >       |             ^
> > 4 errors generated.
> > Error while processing /drivers/gpu/drm/i915/selftests/mock_uncore.c.
> >
> >
> > What am I doing wrong?
>
> Nothing. As you note, ASSIGN_RAW_WRITE_MMIO_VFUNCS is defined in
> drivers/gpu/drm/i915/intel_uncore.c but it is used in
> drivers/gpu/drm/i915/selftests/mock_uncore.c, which is not designed to
> be built standalone. We could potentially move
> ASSIGN_RAW_WRITE_MMIO_VFUNCS into a common header to avoid this but I
> think I would rather just revert 9362d34acf91, as I already figured that
> this was going to be fragile:
>
>   https://lore.kernel.org/20251007163338.GA547361@ax162/
>
> I would rather discourage including .c files if folks want clangd to
> work properly since this seems fundamentally unsolvable if developers
> have written .c files in this manner. I am open to other thoughts
> though.

I am not sure what other clang tools are doing, and why they need
this. But FWIW my clang tools don't need it at all. They would index
all files, get source files from AST (which would include included .c
files as well), and work with that index. So they natively "see" and
understand all included .c files.
