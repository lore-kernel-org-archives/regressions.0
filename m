Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B739D1B4F1A
	for <regressions@lists.linux.dev>; Fri, 25 Oct 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843853; cv=none; b=Xr3KEOJhEDBGOHVLMTq5b9eD1PmdUylZQDgeKX+Uw0NYEPyZV8TQqJDKN/ZoX6Tt6vnv2oKNUQ7pBIjZ3ocLcjON7izLEhqH1xclde3thmoPlrFfljOnXOl2NNVYXNHrC6cmY5q05MnXs1eqAn0VavGYwA85rPggX4bBo+gJWg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843853; c=relaxed/simple;
	bh=QxIPJtYLaqp7GcRN9wXG0w03pUAqJ2kV07BZzgdMuRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b71J9Au9shHQa8o03W0E84LY9cpKzGkyW4o2G1AvxHpDhUbqjzkp0n7mXKjW2TN+tZ2d8YYDqZnacNW8yCzRnRw+z5OiIzVRUPUeG5uOys3KxnqO4Z1WU0Lt5DqRad04WsOkGo1drDSDUSf9StZQ4WDC76snCQm2fOyEYxVM8DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETl6Ol5N; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETl6Ol5N"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so341377a91.0
        for <regressions@lists.linux.dev>; Fri, 25 Oct 2024 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843851; x=1730448651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxIPJtYLaqp7GcRN9wXG0w03pUAqJ2kV07BZzgdMuRs=;
        b=ETl6Ol5NW+MlnKeNXt6SH47kYGN2KmiqGJQylmQpv/5MjoIlqvJuK/LWB2WWK6Q9H0
         VmszZoqscYFptTpLoDLhRPbOxnc+YnCvdj+0Ulxn/o+4/86zSoe1ecaaPuIkfFL8wYid
         7EwZmT7kqsD9w+RTloFvJJnzUk60snugbo9rJavo0FzhRiXdRUG8JmJMzQz43nroUpJU
         OnDQnsyEJpcL/wIVpTjK8LJ31SyNEvdFxbv8JydNUyOR8JVrKpFscDi2E+a1SBkfMksQ
         tAqGftqmMky0qxbKq/oL+DE7DCaVmQr0qTQoKeahJ9L41Zv1xTwWfo1hBxxe37OVDv+x
         zfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843851; x=1730448651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxIPJtYLaqp7GcRN9wXG0w03pUAqJ2kV07BZzgdMuRs=;
        b=qYiVJlQZ6KnQQuYoma+ws22TyWQQJ5Xo2lPDfc+iXYY6GlgdINI+j0oOgIwMFVsrKj
         tagdd3njqI8Bs4BVW0GIZXTWqAgkPsT6InITzP2sFd93PMIkReCMeONwI6+FXdzf6f2K
         3U/fXIJJCmoqokxrtIK22LBBffxJI9kc9rw4BB90fcY04EPE4h64SxeQzZhuWwKl8R+C
         v9Sa8GpQokkxgpNKJ3ou7Ca7V2P6LsALkQzIb768pT1bYAMRnb+xPQOF8rtsXDJHxNk7
         NhEll/Yi2Rj4CAh0JV1kBjLGomQLYq3ljwCpyzI5ZmU1Jlx0S+1IcGeRxItagtZNMsz1
         E7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOzOdq/1Yoj+ykHq+4vZ+x8PNdaDT2R0VK2G9IuoI51ku/G4wLCTTg0vg3RO8kznmlzhlAvgEUFZO/BA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Xop7CpFxhg4HgVuoN2QSpnUdA99WTjsKqWUTqtoGU1ldW6VC
	oYcmCHy/ez+u4t7dqtzXCLuRWN1SlLJJb3oC5ci730efi58w80B4WcnuDUZhBYjneTNZqSKDnL6
	O5B5PtJKJJV1OiJLLFx5645givTg=
X-Google-Smtp-Source: AGHT+IGPvqhUDFBkOrQZPHHnvPcIrx/rb8ZygTWHg/zDEP3AqX5dEQ8DbwE6syU+VnzrC/rKZmINXToaxuTbKVRq2qs=
X-Received: by 2002:a17:90b:4f47:b0:2e2:de92:2d52 with SMTP id
 98e67ed59e1d1-2e8e8239caamr324426a91.9.1729843851009; Fri, 25 Oct 2024
 01:10:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zv8RIs-htdc-PtXB@archlinux> <202410040958.C19D3B9E48@keescook>
 <ZwNb-_UPL9BPSg9N@archlinux> <CAGG=3QUatjhoDHdkDtZ+ftz7JvMhvaQ9XkFyyZSt_95V_nSN8A@mail.gmail.com>
 <CAGG=3QVcsuN0Sk79oZWjY_nNTo_XfGYsDT3gc7vEmLyS8OK3rA@mail.gmail.com>
 <ZxB-uh1KzfD4ww2a@archlinux> <20241017165522.GA370674@thelio-3990X>
 <ZxWvcAPHPaRxp9UE@archlinux> <20241021192557.GA2041610@thelio-3990X>
 <ZxpIwkfg9_mHO3lq@archlinux> <20241025011527.GA740745@thelio-3990X>
In-Reply-To: <20241025011527.GA740745@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 25 Oct 2024 10:10:38 +0200
Message-ID: <CANiq72nbyqrzGr3Uw_vx-+8DLiv6KbeULrxpyK8Lh4ma15cq8g@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in bch2_xattr_validate
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Hendrik Farr <kernel@jfarr.cc>, Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@toblux.com>, kent.overstreet@linux.dev, 
	regressions@lists.linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ardb@kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 3:15=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> on the official submission.

Same -- please feel free to add:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

One nit below that is fine either way:

> > +# clang needs to be at least 19.1.3 to avoid __bdos miscalculations
> > +# https://github.com/llvm/llvm-project/pull/110497
> > +# https://github.com/llvm/llvm-project/pull/112636
> > +# TODO: when gcc 15 is released remove the build test and add gcc vers=
ion check

I would perhaps move these closer to the respective lines they are
comment on (i.e. `depends on` and `def_bool`).

Thanks!

Cheers,
Miguel
