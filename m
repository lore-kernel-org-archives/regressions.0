Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDD1D3194
	for <regressions@lists.linux.dev>; Tue, 27 Aug 2024 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784540; cv=none; b=UfC3WD3vhWxjx7t6QQGQWfStl1TkN6d3+rdfpa0cKV4jLvhB4qYEQp84kn+Si9ggKltsDbRrnxlTAdRAnGWXqBuMrPhS1xvMWt1eW99SQ654i6n/qy0XcVp6qdI9cLVmZSg/jHBhYHnjr6nYpJv3xzDkarrTbNDOU3Pn7pKuzyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784540; c=relaxed/simple;
	bh=+fM/Qyk8h6+mYsjYQvSSfjnNJ8uLvU2/CLFvC7f9D3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7Qt4dF5TliYhx8JPmjPiVGsA7DXlNOy2Cx60i1UkAedRg6BmsR8v4YE69frD5y16bb4ISseUxxIGu9veRIzfIiOpSX2PmDSXoQIaM6+akLzfdH4As0YMw1VzjCAily9ZCX/P25dSyc0YXb91A0yVXqeWsbwUbGDw39iqfasrQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VVtnlfUB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VVtnlfUB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a843bef98so569726866b.2
        for <regressions@lists.linux.dev>; Tue, 27 Aug 2024 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724784537; x=1725389337; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fM/Qyk8h6+mYsjYQvSSfjnNJ8uLvU2/CLFvC7f9D3Q=;
        b=VVtnlfUBcJsA4KKh5RPTFHNSPtj7EjZJigoaViXBGuWHcXRRbx9arOMHOUxASSJRu2
         V9Vv2ZPMdS6Ss6V78NTSoai/rRVqFglsJDBoQOJwE1JnU/ikhPvGrLK7/ntxnqdewRrB
         iLmBaTIj8LlZ/GlbwY9P+qvn8EuFmC0tRYPvWWXzNJuWsD0ZOYZYtfwz+/l1TrqBxQwW
         U1IreXYQNCtRxaNax9iC4MX6v2bWFeFX1CzyJmCizjbgax0tWl2wJMP4ZNseJSDdn7x7
         JTOSxnewlYtCFk396ESwG7MKHbp5X5CzHXaTfBIsjPH/49JK790BZIZXB2wZSgvtqtkX
         44lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784537; x=1725389337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fM/Qyk8h6+mYsjYQvSSfjnNJ8uLvU2/CLFvC7f9D3Q=;
        b=IxxUlKmrF6mfz0c6hJS70Wj0c5Ggms5lIHobggzLah1v9IE3kNjStdzJv/4TYN/DhS
         it59CJevz+ZMccSUVm1ZFkR07PRviMGJfm27FE+y1JruRMmFw3ZtTJsI5U1fSkdzZv7E
         wb66FJCMPFsR/RQ2Q1JPRHtMKCofespfI+D2f8HwUa7RwLPS+YxTIRdlF5jFuC8+LGT5
         SLEgOQ7FonPsdiutAgux9bVgAmKOguU8EspTri4PN1voyXLqq+mW5ZNGLIx4FxknZkax
         Ffw6cDM04PE+u1x/dKFu+HYOLAQd9667UKmPa5IqzXVCESWR5JloCCwLNqfJHVr7OEvb
         sUew==
X-Forwarded-Encrypted: i=1; AJvYcCW0c/sbaGuF5GJMOULnDQFCKKzh+RCHXSshrcWW2MQREFU/wumRoLy8BlgW/Zf9tFTXybUX/RRKICofwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR0NNzDjCCPPfrgNH/mLn+WKytd7Y4V6wf846rOez8aaXRUjag
	IXpWr5zTVUHFm7akJ0pVs94JCbWoZATuH+Lwg7OnziBnR/7xJVtVkLgjQAKIWhRSLO3D7vLir0D
	z6U4eZwDglcgwOi4lOIzI9eq8OxBmrYL0TcOy
X-Google-Smtp-Source: AGHT+IEDE84HW8WhltURoZPE6AnT1p3yEylLwiUEf8EfZjo6o3kJOFM23s7uhP84XseafK+WQn8SInwK5adVNDb6Bys=
X-Received: by 2002:a17:906:c14d:b0:a86:90b8:9ac9 with SMTP id
 a640c23a62f3a-a86a52cc979mr1096924066b.39.1724784536549; Tue, 27 Aug 2024
 11:48:56 -0700 (PDT)
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
 <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com>
In-Reply-To: <3D1B8F1F-2C41-4CCD-A5D7-41CF412F99DE@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 27 Aug 2024 11:48:19 -0700
Message-ID: <CAJD7tkbF2Cx4uRCJAN=EKDLkVC=CApiLAsYt4ZN9YcVUJZp_5g@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Pedro Falcato <pedro.falcato@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2024 at 9:24=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Pedro Falcato <pedro.falcato@gmail.c=
om> w dniu 25.08.2024, o godz. 17:05:
> >
> > Also, could you try a memtest86 on your machine, to shake out potential=
 hardware problems?
>
>
> I found less time consuming way to trigger issue: 12c24t cross compile of=
 llvm with =E2=80=9Eonly 16G=E2=80=9D of ram - as this triggers many heavy =
swappings (top swap usage gets 8-9G out of 16G swap part)
>
> With such setup - on 6.9.12 - i=E2=80=99m getting not available system (d=
ue cpu soft lockup) just in 1..3h
> (usually first or second compile iteration; i wrote simple scrip compilin=
g in loop + counting interations)

Are we sure that the soft lockup problem is related to the originally
reported problem? It seems like in v6.10 you hit a BUG in zswap
(corruption?), and in v6.9 you hit a soft lockup with a zswap lock
showing up in the splat. Not sure how they are relevant.

Is the soft lockup reproducible in v6.10 as well?

Since you have a narrow window (6.8.2 to 6.9) and a reproducer for the
soft lockup problem, can you try bisecting?

Thanks!
