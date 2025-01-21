Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9FE1F540E
	for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480980; cv=none; b=qQvUsx6mP+FDpd+COGv6Hvri8jNZiifX6OwOWfgQM1lX47s6bYjST6TNyFDUwvpV56e0Ler5p+nBMwbkmlu6V8X1SUqcf1sW8LI5XL5ZDEt3T7qC8YLHdTO2F4B7VN6+nMSONNl1U/m+xntfXRpQow9mZIt4UFiYR4cxBCDgaGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480980; c=relaxed/simple;
	bh=kaibDFjXomFyHzSXXuoRTyzvHOyGuhRdxpJB+5UfQyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb6EePhHoUSP/Ay7e1hUaem3y4YkTRY775G1H0q+vUcskbUCjPAREVRziABHUTXcz08FnKb2D9vy17QpUY1bswZTi3cyq741ZxLRwR4cMjVbjshJQjgleUkOEs4Lr/F9RlLqyjQSF4sN2XBjgxQ5SaTagACwVYjmnopm3iTBODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8kUYwoe; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X8kUYwoe"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679b5c66d0so833401cf.1
        for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737480977; x=1738085777; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYocvZzKFXOf1dOmFr+W1pL8HyxuFiKuumlmBUt/QYE=;
        b=X8kUYwoeNYipqe8eUXTrLSfsAKdiT1vTJqwFn9CZEQ4h4c/NamgTzdh1lieTo/3UvB
         9Mn9pEgjVylZaEr2Lhua3Xt6BxpXSo4cPGcJopCFMDhWfyeQLxzsuz9hv9RCYvjdrJIL
         vEgM+KJKvwKug1Q9z9wPV46itf/aPrz5ngArdt+sxYBftNT/Bde8Ijf31Q3I0TtCRkOy
         KS+Est9Ng2GKEbAEvrpsjn4jP7E/GKMUMt+t14SVshQKTgE13hLyiNgfz4nJyakAwo4s
         QV6Cw5lz0tucm5wHtibo1tj9srM2XG8p9aMjHYClY4H3JcLJSAB9ypTMvox6GVnLs5pn
         239A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480977; x=1738085777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYocvZzKFXOf1dOmFr+W1pL8HyxuFiKuumlmBUt/QYE=;
        b=bU/7G6s21brmmMAp8jzqPvVwPunlGnB/4GvfBqhpCaFUhVKPQxgfkwxPS2/2RNN//k
         fEFf5hptmpIErZQujP61R4jzMPyhjPFu8tUuxyxdWZnDgQ3LjksLH8PmUIIlmpjt4D2/
         K63Q7I9wEh+Iia5IPLJOvCvzSQ4WlGej/e3iZ7z3oqbx0YOwdfraAIilbh+QZlVGAW/P
         fuBhgalM7J9gOYNlYdoZnOIej9d99t5qiIfzOSNeC0sjwX5fQVjsfHjEfqvNTL8PNXG2
         3N+K4k5/Rj8w8llYCYozzU8/h+8226wnpKJHRjXV3N9IjKYC6kFk2EcKJT/rS6FDpeJh
         htxg==
X-Forwarded-Encrypted: i=1; AJvYcCUj5Bz41H2rvIgpjBuJUDS/v/h1h0s0k0iwIqcVFUWUzfC5owNsA51sDPC/R1eD5ZXD8ShlfazFD0OYfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmM/AvEu6HxwWVI0l4ttdaL51+9ZhxVZ75FCHyysz2iwchdFo8
	Yre3Ijkb/lVzwpNKxpTELaP3nUv3n0+rG9XcsuJFl/2hFQkEuoeWwJnHilob/eRujfCsbo0n0e8
	2uNBDiMjmR0LnYeg7Q+ymGuPbhpFmne9fBUlk
X-Gm-Gg: ASbGncue7eREJoaOux9+gSYa7CVqHQ2fEcUpatWpFEWSPPRZ7LSw3Xpuz+V/+Yg4/+Q
	6cvbrJoyb3uMucLXwV9zOsuxkDtWuDMmhVW7/bq48DRSj/o2dleH2Cbv/dH4u8CXdNt3iSt9rh/
	D5a0Klng==
X-Google-Smtp-Source: AGHT+IFIrZRx7xQrWDRLQ69FuUYdW0SvjjzhrnjhSnOksbO+ngHVevTnFyfppx3QzIQZhDwNLsCaUtTO2x0P8LdfKLw=
X-Received: by 2002:a05:622a:1e10:b0:466:7926:c69 with SMTP id
 d75a77b69052e-46e1fc28582mr12795651cf.20.1737480977190; Tue, 21 Jan 2025
 09:36:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org> <CAK7LNASo+wGhpCVhBi+ew1mOtLbSXgx3AiQ6D7RtXO5P=R0EfQ@mail.gmail.com>
 <fef7c633-5577-4cdf-803a-a1fe10787186@app.fastmail.com>
In-Reply-To: <fef7c633-5577-4cdf-803a-a1fe10787186@app.fastmail.com>
From: Rong Xu <xur@google.com>
Date: Tue, 21 Jan 2025 09:36:04 -0800
X-Gm-Features: AWEUYZnEsgcuCWBwvZBjbUeXp_Ck0mg61w9DJwmvH6xjwQ8ss7VEyk3ZAuur6X4
Message-ID: <CAF1bQ=Qk7pRWUxAcZNPjFquukHpXgi=34NmMbuRBAwv5+KcWtQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 11:42=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, Jan 21, 2025, at 01:19, Masahiro Yamada wrote:
> > On Tue, Jan 21, 2025 at 6:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >>
> >>                 linux-6.12      linux-6.13
> >> ld.lld v20      1.2s            1.2s
> >> ld.bfd v2.36    3.2s            5.2s
> >> ld.bfd v2.39    59s             388s
> >>
> >
> > Is this problem specific to the BFD linker from binutils?
>
> I only tried the bfd and lld linkers, but I assume it's limited
> to the bfd one.
>
> > Did you observe a link speed regression with LLVM=3D1 build?
>
> No, the ld.lld line above is what I see with LLVM=3D1, it's
> very fast (1.2s) both before and after the change. New
> ld.bfd versions were much slower before the regression
> for this particular config and got even slower (seven minutes
> for each of the three vmlinux link stages).
>

Can you send me the instructions to reproduce?
I'm seeing a significant performance drop (18.5x slow down) with
ld.bfd v2.39 when
linking linux-6.12 (i.e without this change)

I will take a look at ld.bfd. It looks like an ld.bfd issue.

-Rong

>       Arnd
