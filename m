Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740661AC884
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 18:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730484513; cv=none; b=mzgkaLn+guHnsZeKwOEHYomFhWQUex9C2cpSR1TXVdddLlirKBPvbF+X0OO/aNIJPvZKIBNivI6dfVAnIqD+lWGSkboxfPrHC3ORedTb2YHmm9C68cH5iyUoA9ds4TGfYdYe//+69qyWmxxSQL9lSyGsuCrFVc1ojZbLlhDXjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730484513; c=relaxed/simple;
	bh=wTIyBZgnq62le+5w+4w6X/ecvgjYY7nVJQm7gIAKPEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkW66yWTKVDr5TZQhhz6hDloHbQz3xSZ6f7vcQWK2jxC9B9gE9sInb+hyklFZZjQOnD9C4b5ZOElrmPaI9Fe07dNZloSz8FTJvBlGP/Cca5xn6T8FPYETnLZ529uCHD0bZIIZc5rFW/PZka/MLpztxiWMv9Xkn18OGxsiCLj0KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jih62F6b; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jih62F6b"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so2087225e87.3
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 11:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730484510; x=1731089310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftGl4XcG9OH9sBgHhSBECZNA4rpR1fv1xw6T+vkOgXg=;
        b=jih62F6bARnWPUOPadascwn5cy7ksT9GjVYc3vqjXE/HTTJcdOxLULjlERMhJ8ZHpk
         Bs7LG2hcFBezxhiGxe574kqSKT8vHKjqhyRIA3JWeLooJVoidgfcze9l6uPrOZR9r8Wo
         ytuphz0gbaCK4F9dwFC49lRt2YCEe33rrZwHB4/ddSTHKcBF2u2BPad7xgxgglK6dh1V
         nzbFGhVg4z7m26Odzoiv3NDHZdTBdrtOucklQqov0Z+Yh1POnXd7FhryzxUUYoSZPZ04
         Tb6LyY5JV04IY+pNM8ypKVC349LcEbXoZiLzaoOgBq+p9MSC3zU46EmD46P4ehW1hcPF
         +qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730484510; x=1731089310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftGl4XcG9OH9sBgHhSBECZNA4rpR1fv1xw6T+vkOgXg=;
        b=An8OuaAQgLZfGmm4N6WDqkHYMdA7d46Pw2OIYWUz8WR6KTIP7qbHvoKHKCE2jdaN8O
         Mr3iX9M9kbtRKJiw2LetbRTIy47PUIJfbB4yKpvsAy/WaOkraB5HYbb/fezEr3WF49qG
         FV6Te53VcQCXAft/ywteO4UbzkAL3EM98EPu8eQtefiKKEUT21dLNccXPuHtn+C0AL4I
         C0jdcUwZfdwHQd0Uz3toLcv71yrP+rryGq7KE3iQ0eprKmspIVg8V40DF8NRz+5KlmTa
         d4/+2TVcNJQVbc/UZ5tCCXsJYwIYRifLFW2WUgfUNb6au5VnoDcsrLdbmGsz4c5bjC5S
         c3gA==
X-Forwarded-Encrypted: i=1; AJvYcCXcYey2kmSXi6ZkQpUFYeq+mhGEotr+LPawUB8CrCQIA/0nve3SEV6VQp77S/Aio+vPTd4QcKmfRYmnQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjffPOSGjQXfoPWKCN4uD3DVfbenYhHg6Zw6qdME7eSFoW4O/a
	Atnmby4yklbJeAhRvbOm8+l6E+3f8389hv4EE/ByBB7fswN9Yt/+J5IqkfHDlwaA3qLaWxlzClX
	6G5GdXaSmA5uPK7ZPAA11BTugVe40AqWMr55I
X-Google-Smtp-Source: AGHT+IGwMCf8aDQDescU4zGGm+ZBhK+ouK3E0Y7btO9KyPPQ1vu6pGdaYG4lHllgWVIGE4uaJ5FRjGI+iaX5NJvPKXo=
X-Received: by 2002:a05:6512:b82:b0:539:fd75:2b88 with SMTP id
 2adb3069b0e04-53b34c46711mr12231661e87.60.1730484509488; Fri, 01 Nov 2024
 11:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
 <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com>
 <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com> <CAHC9VhSv+ro9gOzanvPS1gZwLkqO7ZoZk7SOZ64FP+-sdmYs2Q@mail.gmail.com>
In-Reply-To: <CAHC9VhSv+ro9gOzanvPS1gZwLkqO7ZoZk7SOZ64FP+-sdmYs2Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 1 Nov 2024 19:08:16 +0100
Message-ID: <CAH5fLggDWvR4i8L+Hin3vzOYnsP2jwZRS7cK-B=xjjOwGBaKkw@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Paul Moore <paul@paul-moore.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, naresh.kamboju@linaro.org, 
	casey@schaufler-ca.com, anders.roxell@linaro.org, arnd@arndb.de, 
	brauner@kernel.org, dan.carpenter@linaro.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, ojeda@kernel.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 6:59=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Nov 1, 2024 at 1:24=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > On Fri, Nov 1, 2024 at 6:11=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Fri, Nov 1, 2024 at 1:04=E2=80=AFPM Miguel Ojeda
> > > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > > On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.=
com> wrote:
> > > > >
> > > > > Thanks Alice.  Would you like me to pull this in via the LSM tree=
 with
> > > > > the associated LSM changes, or would you prefer to do this some o=
ther
> > > > > way?
> > > > >
> > > > > I'm going to merge this into lsm/dev for now so that we fix the i=
ssue
> > > > > in linux-next, but I'm happy to drop it or do something else, let=
 me
> > > > > know.
> > > >
> > > > Christian has the VFS side, and both are needed for this -- do you
> > > > mean you will cross-merge vfs' branch too?
> > >
> > > I think our last emails crossed paths.  I'm not going to merge this
> > > via the LSM tree as we don't have the Rust security.c helpers.
> > > Ideally it would have been better to have the Rust LSM/security
> > > helpers in the LSM tree for reasons like this, but it looks like it's
> > > too late for that now.
> >
> > If Christian is okay with rewriting the vfs.rust.file tree, we can
> > drop commit 94d356c0335f ("rust: security: add abstraction for
> > secctx") from there and I'll update it and send it for inclusion in
> > the LSM tree instead. I'll need to drop the piece that ties together
> > `struct cred` and `secctx` from the patch, but I can follow up with a
> > small patch for that for the 6.14 merge window.
>
> I can only guess at what Chrisitian wants to do, but my guess is that
> he isn't going to be very excited about rewriting a VFS tree at this
> stage ... which is very understandable as far as I'm concerned.
>
> I wouldn't worry too much about this right now, I'm going to plan on
> holding Casey's patchset in a staging area until after the upcoming
> merge window.

Okay. If Casey's patchset is not landing for 6.13, then the fix I
posted initially can be used. Casey is also welcome to squash my fix
into his series if you all prefer that. I'm happy with whatever is
easiest for you all.

Alice
